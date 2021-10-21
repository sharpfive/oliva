# Oliva
Library and Sample app for generating HTML baseball game data using [Publish](https://github.com/johnsundell/publish).

### Why would you do this?
I got mad when I drafted a fantasy baseball team and couldn't see them play because the pandemic shut down Major League Baseball. 
So I wrote a baseball simulator so I could see how the team I drafted would fare in a head-to-head game. 

This repo is how I convert the results to a static HTML site. I'm definitely pushing the limits of what [John Sundell](https://twitter.com/johnsundell) had in mind for his [Publish](https://github.com/johnsundell/publish) library, but that's how I roll.

### What does the output look like?

[My League's HTML Output](https://fansim.netlify.app/cik-anon-ga/leagueresults/)

[Sample Stub Data Output](https://fansim.netlify.app/stub-data/leagueresults/)

### Where did the Oliva come from?
[Tony Oliva](https://www.baseball-reference.com/players/o/olivato01.shtml) was an outfielder for the [Minnesota Twins](https://www.mlb.com/twins). ~~He should be in the Hall of Fame. He's not, but Mr. Oliva might take some solace knowing there is an open source Swift library named after him.~~ I sat next to him at a Twins game once. That was awesome.

Update 12/5/2021:

Tony Oliva was elected to the Major League Baseball Hall of Fame! Welcome to the Hall, Tony O.


## Targets

### LeagueResultsSite
This is a sample implementation that shows how to use SimulationLeagueSiteGenerator to create a HTML site from a json file of Oliva LeagueData. If no json file is specified, an HTML site using StubData will be used.

### OlivaDomain
All of the data models needed to create a baseball simulation website.

