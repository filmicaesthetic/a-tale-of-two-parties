A Tale of Two Parties
================
2022-11-02

## Visualisation

![](outputs/test_plot.jpg)

## Data

Policies and parliament votes data were scraped using the rvest package
from [Public Whip](https://www.publicwhip.org.uk/)

| House   | Date       | Subject                                                                                                                                                                                     | Policy.vote | PolicyLink                                                                            | Party | Vote  | Vote.Count | description                        | policy_type | political_leaning |
|:--------|:-----------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------|:--------------------------------------------------------------------------------------|:------|:------|-----------:|:-----------------------------------|:------------|:------------------|
| Commons | 2002-06-11 | Nationality, Immigration and Asylum Bill — Only allow destitute asylum seekers and those under residence restrictions to live in accommodation centres for a maximum of 10 weeks — rejected | MAJORITY    | <https://www.publicwhip.org.uk/division.php?date=2002-06-11&house=commons&number=263> | Con   | FOR   |          0 | Make seeking asylum more difficult | Home Office | Right             |
| Commons | 2002-06-11 | Nationality, Immigration and Asylum Bill — Only allow destitute asylum seekers and those under residence restrictions to live in accommodation centres for a maximum of 10 weeks — rejected | MAJORITY    | <https://www.publicwhip.org.uk/division.php?date=2002-06-11&house=commons&number=263> | Con   | OTHER |        122 | Make seeking asylum more difficult | Home Office | Right             |
| Commons | 2002-06-11 | Nationality, Immigration and Asylum Bill — Only allow destitute asylum seekers and those under residence restrictions to live in accommodation centres for a maximum of 10 weeks — rejected | MAJORITY    | <https://www.publicwhip.org.uk/division.php?date=2002-06-11&house=commons&number=263> | Con   | OTHER |          0 | Make seeking asylum more difficult | Home Office | Right             |
| Commons | 2002-06-11 | Nationality, Immigration and Asylum Bill — Only allow destitute asylum seekers and those under residence restrictions to live in accommodation centres for a maximum of 10 weeks — rejected | MAJORITY    | <https://www.publicwhip.org.uk/division.php?date=2002-06-11&house=commons&number=263> | Con   | OTHER |         39 | Make seeking asylum more difficult | Home Office | Right             |
| Commons | 2002-06-11 | Nationality, Immigration and Asylum Bill — Only allow destitute asylum seekers and those under residence restrictions to live in accommodation centres for a maximum of 10 weeks — rejected | MAJORITY    | <https://www.publicwhip.org.uk/division.php?date=2002-06-11&house=commons&number=263> | Lab   | FOR   |        342 | Make seeking asylum more difficult | Home Office | Right             |
| Commons | 2002-06-11 | Nationality, Immigration and Asylum Bill — Only allow destitute asylum seekers and those under residence restrictions to live in accommodation centres for a maximum of 10 weeks — rejected | MAJORITY    | <https://www.publicwhip.org.uk/division.php?date=2002-06-11&house=commons&number=263> | Lab   | OTHER |          0 | Make seeking asylum more difficult | Home Office | Right             |

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
