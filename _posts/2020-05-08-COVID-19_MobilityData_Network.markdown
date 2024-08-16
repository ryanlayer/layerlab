---
layout: post
title:  "Monitoring Stay-at-Home Adherence for Local Governmends in the COVID-19 Pandemic"
date:   2020-05-08 00:00:00 -070/
img: "/assets/2020-05-08-COVID-19_MobilityData_Network.SLC_data_browser.png"
height: "300px"
short: 
categories: 
comments: false
comments: true
---

As part of the [COVID-19 Mobility Data Network](https://www.covid19mobility.org/) our lab, along
with the [Dan Larremore](https://larremorelab.github.io/) at CU and 
[Bailey Fosdick](https://www.stat.colostate.edu/~bailey/) at CSU, is using mobility data from
[Facebook Data for
Good](https://dataforgood.fb.com/tools/disease-prevention-maps/) to help state
and local governments monitor activey in their jurisdicitons while stay-at-home
orders are in place and as reopening begins.

We are currently working directly with:
- Boulder County, CO
- Arapahoe County, CO
- Denver, CO
- Salt Lake County, UT
- University of Colorado, Boulder

Facebook provides aggregaed an annonmized user density data three times per day
for tiles that range in size from 2km to 0.6km squater. 
<center>
<img src="https://raw.githubusercontent.com/ryanlayer/COvid19/master/imgs/Boulder_example_tile.png" />
</center>
From this data we have developed metrics that measure activity trends.  Some of
our metrics include:

- A weekend score measures the differences between weekday and weekend activity.
Ideally, if people are staying home and not working, there should not be a
difference.
<center>
<img src="https://raw.githubusercontent.com/ryanlayer/COvid19/master/imgs/colorado_example_tile_ws_diffs.png" />
</center>
- A slip score, which measures the difference in activity between adjacent
weeks. This score should be near zero during a stay-at-home order.
<center>
<img src="https://raw.githubusercontent.com/ryanlayer/COvid19/master/imgs/coloreado_example_slip_scores.png" />
</center>
- A hot-spot score, which measures the difference between current activity and
activity during the first week of the stay-at-home order.
<center>
<img src="https://raw.githubusercontent.com/ryanlayer/COvid19/master/imgs/colorado_hotspot_scores.png" />
</center>

We are also using models to decompose the data into seasonal (night/day, weekday/weekend) and trend values.
<center>
<img src="https://github.com/ryanlayer/COvid19/blob/master/imgs/colorado_example_season_trend_split.png?raw=true" />
</center>

To help explore these data, we are developing an interactive browser using 
[plotly dash](https://plotly.com/dash/). Here is a quick demo of our data browser:

<iframe width="569" height="320" src="https://www.youtube.com/embed/2xV9VDY7vG8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

Full details can be found at our [github repo](https://github.com/ryanlayer/COvid19).

