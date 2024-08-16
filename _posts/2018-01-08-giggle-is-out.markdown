---
layout: post
title:  "GIGGLE is out!"
date:   2018-01-08 15:07:56 -070/
img: "/assets/giggle_logo.jpg"
height: "200px"
short: GIGGLE is a genomics search engine that identifies and ranks the significance of shared genomic loci between query features and thousands of genome interval files.
categories: 
comments: true
---

First the links:
- [Source code](https://github.com/ryanlayer/giggle)
- [Video describing GIGGLE](https://www.youtube.com/watch?v=yw8H7PhtZoA)
- [Nature Methods paper](https://www.nature.com/articles/nmeth.4556)
- [Preprint](https://www.biorxiv.org/content/early/2017/06/29/157735)

GIGGLE is a genomics search engine that identifies and ranks the significance
of shared genomic loci between query features and thousands of genome interval
files. If you, for example, were interested in understanding the genetics of
Rheumatoid Arthritis, then you could use the genome wide-significant SNPs from
a [GWAS](wget
https://www.nature.com/nature/journal/v518/n7539/extref/nature13835-s1.xls) to
search a database of [Roadmap Epigenomics](http://www.roadmapepigenomics.org/)
(specifically the tissue/[CHROMHMM](http://compbio.mit.edu/ChromHMM/) predicted
state annotations).

Here are the results visualized in a heat map where the short axis give the
CHROHMM states, and the long axis gives the tissues. The color of each cell
corresponds to the GIGGLE score of the query (Rheumatoid Arthritis SNPs) and a
database file (tissue/genomic state, e.g., heart muscle enhancer). Darker red
means a more positive relationship and darker blue means more negative
relationship.

![RA GWAS vs RME](/assets/RA_gwas_rme.png){:height="800px"}<br> (From Fig2b)

As you can see, the SNPs cluster in T-cells, B-cells, and the Thymus, which is
a signature of an autoimmune disorder. While we know that Rheumatoid Arthritis
is an autoimmune disorder, we did not always know this. You can imagine how
insightful this type of search would be for new diseases or ones where the role
of the immune system is underappreciated.  

The steps for recreating this results are
[HERE](https://github.com/ryanlayer/giggle/blob/master/experiments/gwas/README.md).

Under the hood, GIGGLE is a B+Tree that was inspired by the [Time
Index](http://www.vldb.org/conf/1990/P001.PDF)

An example of a GIGGLE index of 3 annotation files (A, B, and C) is here:

![GIGGLE index](/assets/giggle_index.png){:height="400px"}

Each interval corresponds to two keys in the tree, one for a start and one for
the end. Each key in a leaf node corresponds to a list of interval starts (they
have the "+" sign), and interval ends (they have the "-" sign). To search for
overlaps in the region [7,11], we search the tree for 7 (marked in green) and
11 (marked in red), then scan the keys between those two keys collecting new
intervals.  In reality, it is a bit more complicated, see the paper for full
details.

