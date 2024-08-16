---
layout: post
title:  "Manually curate thousands of structural variants with SV-Plaudit"
date:   2018-02-17 01:07:56 -070/
img: "/assets/svplaudit_logo.png"
height: "150px"
short: SV-plaudit is a cloud-based framework that enables large teams to curate thousands of structural variants rapidly.
categories: 
comments: true
---

Here is s short a presentation about SV-plaudit on YouTube (2m 16s)
[![GIGGLE](https://img.youtube.com/vi/ono8kHMKxDs/0.jpg)](https://www.youtube.com/watch?v=ono8kHMKxDs)

Links:
- [Source code](https://github.com/jbelyeu/SV-plaudit)
- [Setup video](https://www.youtube.com/edit?o=U&video_id=phD-GdkOwiY)
- [Preprint](https://www.biorxiv.org/content/early/2018/02/14/265058)

Detection structural variants (SVs) is hard, and automated filters still
struggle to differentiate between true positives and false positives.  While
the human eye is quite good at spotting spurious SV calls, curating more than a
handle full of calls with current visualization tools is clumsy and
error-prone.

SV-plaudit aims to scale manual inspection to thousands of SVs so that you can
curate every variant in your call set. We accomplish this with a visualization
method that reduces the time required to evaluate and SV to seconds and a
cloud-based scoring system that manages the input from many users.

Checkout out the [setup video](https://www.youtube.com/edit?o=U&video_id=phD-GdkOwiY)
and the following commands to set up your AWS environment and deploying an
example SV-plaudit project. Complete details are on the 
[GitHub site](https://github.com/jbelyeu/SV-plaudit).

Get the code:
```
git clone --recursive https://github.com/jbelyeu/SV-plaudit.git
cd SV-plaudit
```

Get sample data (this could take 20 or more mintues, depending on network speed):
```
samtools view -b ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/phase3/data/NA12892/high_coverage_alignment/NA12892.mapped.ILLUMINA.bwa.CEU.high_coverage_pcr_free.20130906.bam 22 > NA12892.22.bam
samtools view -b ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/phase3/data/NA12891/high_coverage_alignment/NA12891.mapped.ILLUMINA.bwa.CEU.high_coverage_pcr_free.20130906.bam 22 > NA12891.22.bam
samtools view -b ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/phase3/data/NA12878/high_coverage_alignment/NA12878.mapped.ILLUMINA.bwa.CEU.high_coverage_pcr_free.20130906.bam 22 > NA12878.22.bam
samtools index NA12878.22.bam
samtools index NA12891.22.bam
samtools index NA12892.22.bam
bcftools view -c 1 -s NA12878 ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/phase3/integrated_sv_map/ALL.wgs.integrated_sv_map_v2.20130502.svs.genotypes.vcf.gz > NA12878.22.vcf
```

Generate an image for each SV:
```
mkdir sv_imgs
Samplot/src/samplot_vcf.sh -S Samplot/src/samplot.py -o sv_imgs -v NA12878.22.vcf NA12878.22.bam NA12891.22.bam NA12892.22.bam
```

Stage the AWS environment and upload the data:
```
python PlotCritic/setup.py -p NA12878_trio_22 -e ryan@layerlab.org -a YOUR_AWS_ACCESS_KEY_ID -s "YOUR_AWS_SECRET_ACCESS_KEY"
python upload.py -d sv_imgs -c PlotCritic/config.json
```

At this point you will get an eamil with the URL to the scoring web site and
temporary password for your administrator account. When you first signin you
need to reset your passowrd, then you can invite other users and begin
evaluating varaints.

Once scores have been collected, results can be retrieved as either a tex file or annotated VCF.
```
python PlotCritic/retrieval.py -c PlotCritic/config.json > retrieved_data.csv
python annotate.py -s retrieved_data.mod.csv -v NA12878.22.vcf -a NA12878.22.score.vcf -o mean -n 1,0,1
```
