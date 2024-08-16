---
layout: post
title:  "How I tokenize a string (char array) in C"
date:   2018-01-30 01:07:56 -070/
short:  
categories: 
comments: true
---

For reasons that now escape me, I stopped using `strtok` to parse strings in
C. I can only guess that it was because `strtok` changes the original string,
making it difficult to re-parse, and that alternating between delimiters was
hard. These may no longer be issues with `strok`, I have may have been using
`strtok` incorrectly, and there may be better functions I should have used. 

In any case, here is `scan_s`. It is simple, does not modify the base string,
and lends itself well to the nested parsing of different delimiters. A 
slightly annoying part of `scan_s` is that **YOU MUST** increment `s` (the
index to the start of your token). `s = e + 1` works in most cases.

{% highlight c %}
int scan_s(char *str, int str_len, int *s, int *e, const char delim) {
    if (*e == str_len)
        return -1;
    for (*e = *s; *e <= str_len; *e+=1) {
        if ((str[*e] == delim) || (*e == str_len)) {
            return *e - *s;
        }
    }
    return -2;
}
{% endhighlight %}

### Arguments
- `str` is a pointer to the beginning of your string. More specifically, it is a
  pointer to the position first character in some string that you want to parse.
- `str_len` is the length of that string. This does not have to be the full
  string, just the bit you care about.
- `s` the index of the start of your token
- `e` the index of the end of your token
- `delim` is the character that you want to delmit your string

### Return values
- length of your token
- `-1` when you reach the end of the string
- `-2` when something goes wrong

### Example
{% highlight c %}
char *test="this;string;has,two,different;delimiter";
int main() {
    int str_len = strlen(test);
    int tok_len = 0, s = 0, e = 0;
    char *tok;
    printf("%d\n", str_len);
    while (scan_s(test, str_len, &s, &e, ';') >= 0 ) {
        int ss = 0, ee = 0;
        while (scan_s(test + s, e-s, &ss, &ee, ',') >= 0 ) {
            tok = (char *) malloc((ee-ss + 1) * sizeof(char));
            char *dst = stpncpy(tok, test + s + ss, ee-ss);
            tok[ee-ss]='\0';
            printf("%d %s\n", ee-ss, tok);
            ss = ee + 1;
            free(tok);
        }
        s = e + 1;
    }
    return 0;
}
{% endhighlight %}

### Result
```
40
4 this
6 string
3 has
3 two
9 different
10 delimiters
```
