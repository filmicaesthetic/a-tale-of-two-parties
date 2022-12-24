A Tale of Two Parties
================
2022-11-02

## Visualisation

![](outputs/test_plot.jpg)

## Data

Policies and parliament votes data were scraped using the rvest package
from [Public Whip](https://www.publicwhip.org.uk/)

<div id="wiilhcyfss" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#wiilhcyfss .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#wiilhcyfss .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#wiilhcyfss .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#wiilhcyfss .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#wiilhcyfss .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#wiilhcyfss .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#wiilhcyfss .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#wiilhcyfss .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#wiilhcyfss .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#wiilhcyfss .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#wiilhcyfss .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#wiilhcyfss .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#wiilhcyfss .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#wiilhcyfss .gt_from_md > :first-child {
  margin-top: 0;
}

#wiilhcyfss .gt_from_md > :last-child {
  margin-bottom: 0;
}

#wiilhcyfss .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#wiilhcyfss .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#wiilhcyfss .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#wiilhcyfss .gt_row_group_first td {
  border-top-width: 2px;
}

#wiilhcyfss .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#wiilhcyfss .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#wiilhcyfss .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#wiilhcyfss .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#wiilhcyfss .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#wiilhcyfss .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#wiilhcyfss .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#wiilhcyfss .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#wiilhcyfss .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#wiilhcyfss .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#wiilhcyfss .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#wiilhcyfss .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#wiilhcyfss .gt_left {
  text-align: left;
}

#wiilhcyfss .gt_center {
  text-align: center;
}

#wiilhcyfss .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#wiilhcyfss .gt_font_normal {
  font-weight: normal;
}

#wiilhcyfss .gt_font_bold {
  font-weight: bold;
}

#wiilhcyfss .gt_font_italic {
  font-style: italic;
}

#wiilhcyfss .gt_super {
  font-size: 65%;
}

#wiilhcyfss .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#wiilhcyfss .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#wiilhcyfss .gt_indent_1 {
  text-indent: 5px;
}

#wiilhcyfss .gt_indent_2 {
  text-indent: 10px;
}

#wiilhcyfss .gt_indent_3 {
  text-indent: 15px;
}

#wiilhcyfss .gt_indent_4 {
  text-indent: 20px;
}

#wiilhcyfss .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col">House</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col">Date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col">Subject</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col">Policy.vote</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col">PolicyLink</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col">Party</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col">Vote</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col">Vote.Count</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col">description</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col">policy_type</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col">political_leaning</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">Commons</td>
<td class="gt_row gt_right">2002-06-11</td>
<td class="gt_row gt_left">Nationality, Immigration and Asylum Bill — Only allow destitute asylum seekers and those under residence restrictions to live in accommodation centres for a maximum of 10 weeks — rejected</td>
<td class="gt_row gt_left">MAJORITY</td>
<td class="gt_row gt_left">https://www.publicwhip.org.uk/division.php?date=2002-06-11&amp;house=commons&amp;number=263</td>
<td class="gt_row gt_left">Con</td>
<td class="gt_row gt_left">FOR</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_left">Make seeking asylum more difficult</td>
<td class="gt_row gt_left">Home Office</td>
<td class="gt_row gt_left">Right</td></tr>
    <tr><td class="gt_row gt_left">Commons</td>
<td class="gt_row gt_right">2002-06-11</td>
<td class="gt_row gt_left">Nationality, Immigration and Asylum Bill — Only allow destitute asylum seekers and those under residence restrictions to live in accommodation centres for a maximum of 10 weeks — rejected</td>
<td class="gt_row gt_left">MAJORITY</td>
<td class="gt_row gt_left">https://www.publicwhip.org.uk/division.php?date=2002-06-11&amp;house=commons&amp;number=263</td>
<td class="gt_row gt_left">Con</td>
<td class="gt_row gt_left">OTHER</td>
<td class="gt_row gt_right">122</td>
<td class="gt_row gt_left">Make seeking asylum more difficult</td>
<td class="gt_row gt_left">Home Office</td>
<td class="gt_row gt_left">Right</td></tr>
    <tr><td class="gt_row gt_left">Commons</td>
<td class="gt_row gt_right">2002-06-11</td>
<td class="gt_row gt_left">Nationality, Immigration and Asylum Bill — Only allow destitute asylum seekers and those under residence restrictions to live in accommodation centres for a maximum of 10 weeks — rejected</td>
<td class="gt_row gt_left">MAJORITY</td>
<td class="gt_row gt_left">https://www.publicwhip.org.uk/division.php?date=2002-06-11&amp;house=commons&amp;number=263</td>
<td class="gt_row gt_left">Con</td>
<td class="gt_row gt_left">OTHER</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_left">Make seeking asylum more difficult</td>
<td class="gt_row gt_left">Home Office</td>
<td class="gt_row gt_left">Right</td></tr>
    <tr><td class="gt_row gt_left">Commons</td>
<td class="gt_row gt_right">2002-06-11</td>
<td class="gt_row gt_left">Nationality, Immigration and Asylum Bill — Only allow destitute asylum seekers and those under residence restrictions to live in accommodation centres for a maximum of 10 weeks — rejected</td>
<td class="gt_row gt_left">MAJORITY</td>
<td class="gt_row gt_left">https://www.publicwhip.org.uk/division.php?date=2002-06-11&amp;house=commons&amp;number=263</td>
<td class="gt_row gt_left">Con</td>
<td class="gt_row gt_left">OTHER</td>
<td class="gt_row gt_right">39</td>
<td class="gt_row gt_left">Make seeking asylum more difficult</td>
<td class="gt_row gt_left">Home Office</td>
<td class="gt_row gt_left">Right</td></tr>
    <tr><td class="gt_row gt_left">Commons</td>
<td class="gt_row gt_right">2002-06-11</td>
<td class="gt_row gt_left">Nationality, Immigration and Asylum Bill — Only allow destitute asylum seekers and those under residence restrictions to live in accommodation centres for a maximum of 10 weeks — rejected</td>
<td class="gt_row gt_left">MAJORITY</td>
<td class="gt_row gt_left">https://www.publicwhip.org.uk/division.php?date=2002-06-11&amp;house=commons&amp;number=263</td>
<td class="gt_row gt_left">Lab</td>
<td class="gt_row gt_left">FOR</td>
<td class="gt_row gt_right">342</td>
<td class="gt_row gt_left">Make seeking asylum more difficult</td>
<td class="gt_row gt_left">Home Office</td>
<td class="gt_row gt_left">Right</td></tr>
    <tr><td class="gt_row gt_left">Commons</td>
<td class="gt_row gt_right">2002-06-11</td>
<td class="gt_row gt_left">Nationality, Immigration and Asylum Bill — Only allow destitute asylum seekers and those under residence restrictions to live in accommodation centres for a maximum of 10 weeks — rejected</td>
<td class="gt_row gt_left">MAJORITY</td>
<td class="gt_row gt_left">https://www.publicwhip.org.uk/division.php?date=2002-06-11&amp;house=commons&amp;number=263</td>
<td class="gt_row gt_left">Lab</td>
<td class="gt_row gt_left">OTHER</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_left">Make seeking asylum more difficult</td>
<td class="gt_row gt_left">Home Office</td>
<td class="gt_row gt_left">Right</td></tr>
  </tbody>
  
  
</table>
</div>

General election and party leader information came from Wikipedia pages
for [Labour Party](https://en.wikipedia.org/wiki/Labour_Party_(UK)) and
[Conservative
Party](https://en.wikipedia.org/wiki/Conservative_Party_(UK))

## Left / Right Policies

On Public Whip, a “Policy” is a set of votes that represent a view on a
particular issue. Policies are maintained through a Wiki, so are managed
by the Public Whip community. For this visualisation, I have only used
policies which can easily be classified as politically left (in favour
of higher taxes, welfare support, government regulation of business,
social equality, and progressive social views) or right (in favour of
lower taxes, individual freedom, less business regulation,
privatisation, and traditional social views)
