//
//  main.swift
//  
//
//  Created by Jaim Zuber on 4/5/20.
//

import Foundation
import OlivaDomain
import Plot
import Publish
import SimulationLeagueSiteGenerator

let leagueName = "CIK"

// This creates a lot of stub data and packages it into a website
let leagueData = LeagueData(leagueName: leagueName,
                            teams: teams,
                            leagueResults: leagueResults,
                            games: games)

publishSimulationLeagueSite(from: leagueData)
