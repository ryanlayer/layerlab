---
layout: page
title: Software
permalink: /software/
---

![samplot](/assets/samplot_logo_v5.png){:height="150px"} 

[![repo](/assets/github.svg){:height="20px"}](https://github.com/ryanlayer/samplot)

samplot is a command line tool for rapid, multi-sample structural variant
visualization. samplot takes SV coordinates and bam files and produces
high-quality images that highlight any alignment and depth signals that
substantiate the SV.

![STIX](/assets/stix_logo.png){:height="150px"} 

[![repo](/assets/github.svg){:height="20px"}](https://github.com/ryanlayer/stix)

STIX (Structural Variant Index) supports searching every discordant paired-end
and split-read alignment from thousands of sample BAMs or CRAMs for the
existence of an arbitrary SV. STIX reports a per-sample count of all concurring
evidence. From these counts we can, for example, conclude that an SV with
high-level evidence in many samples is common and an SV with no evidence is
rare.


![GIGGLE](/assets/giggle_logo.jpg){:height="120px"} 

[![repo](/assets/github.svg){:height="20px"}](https://github.com/ryanlayer/giggle)[![paper](/assets/paper.png){:height="20px"}](https://www.nature.com/articles/nmeth.4556)[![paper](/assets/paper.png){:height="20px"}](https://www.biorxiv.org/content/early/2017/06/29/157735)

<div style="position:relative;width:100%;height:0;padding-bottom:56.25%;">
<iframe src="https://www.youtube.com/embed/yw8H7PhtZoA" frameborder="0" allow="autoplay; encrypted-media" style=" position: absolute;top:0;left:0;width:100%;height:100%;"></iframe>
</div>

GIGGLE is a genomics search engine that identifies and ranks the significance
of shared genomic loci between query features and thousands of genome interval
files. GIGGLE scales to billions of intervals, is faster (+1,000X) than
existing methods, and its speed extends the accessibility and utility of
resources such as ENCODE, Roadmap Epigenomics, and GTEX by facilitating data
integration and hypothesis generation.


![LUMPY](/assets/lumpy_logo.png){:height="100x"}

[![repo](/assets/github.svg){:height="20px"}](https://github.com/arq5x/lumpy-sv) [![paper](/assets/paper.png){:height="20px"}](https://genomebiology.biomedcentral.com/articles/10.1186/gb-2014-15-6-r84)

LUMPY is a novel and general probabilistic SV discovery framework that
naturally integrates multiple SV detection signals, including those generated
from read alignments or prior evidence, and that can readily adapt to any
additional source of evidence that may become available with future
technological advances.

![GQT](/assets/gqt_logo.png){:height="120px"} 

[![repo](/assets/github.svg){:height="20px"}](https://github.com/ryanlayer/gqt) [![paper](/assets/paper.png){:height="20px"}](http://www.nature.com/nmeth/journal/vaop/ncurrent/full/nmeth.3654.html)

Genotype Query Tools(GQT) is command line software and a C API for indexing and
querying large-scale genotype data sets like those produced by 1000 Genomes,
the UK100K, and forthcoming datasets involving millions of genomes. GQT
represents genotypes as compressed bitmap indices, which reduce computational
burden of variant queries based on sample genotypes, phenotypes, and
relationships by orders of magnitude over standard "variant-centric" indexing
strategies. This index can significantly expand the capabilities of
population-scale analyses by providing interactive-speed queries to data sets
with millions of individuals.

 
