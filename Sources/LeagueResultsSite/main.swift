//
//  main.swift
//  
//
//  Created by Jaim Zuber on 4/5/20.
//

import Foundation
import Plot
import Publish

let leagueName = "CIK"

try SimulationLeagueWebsite().publish(
    withTheme: .league,
    additionalSteps: [
        .addItem(Item(
            path: "rosters",
            sectionID: .rosters,
            metadata: SimulationLeagueWebsite.ItemMetadata(
                leagueName: leagueName,
                teams: teams,
                game: nil
            ),
            tags: ["roster"],
            content: Content(
                title: "Roster",
                date: Date()
            )
        )),
        .addItems(in: gameItems),
        .addItem(Item(path: "leagueResults",
                      sectionID: .leagueResults,
                      metadata: SimulationLeagueWebsite.ItemMetadata(leagueName: leagueName,
                                                              teams: teams,
                                                              leagueResults: leagueResults),
                                                              tags: ["leagueRosters"],
                                                              content: Content(
                                                                  title: "League Results",
                                                                  date: Date()
                                                              )))
    ]
)
