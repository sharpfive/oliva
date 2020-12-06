//
//  File.swift
//  
//
//  Created by Jaim Zuber on 7/28/20.
//

import Foundation
import Publish
import OlivaDomain

func createGameItem(from game: GameViewModel, leagueName: String, teams: [TeamViewModel]) -> Item<SimulationLeagueWebsite> {
    let metadata = SimulationLeagueWebsite.ItemMetadata(leagueName: leagueName, teams: teams, game: game)

    return Item<SimulationLeagueWebsite>(path: "\(game.gameId)", sectionID: .game, metadata: metadata)
}

public func publishSimulationLeagueSite(from leagueData: LeagueData, googleAnalyticsId: String? = nil, at path: Path? = nil) {

    let gameItems = leagueData.games.map { game in
        return createGameItem(from: game,
                              leagueName: leagueData.leagueName,
                              teams: leagueData.teams)
    }

    if let googleAnalyticsId = googleAnalyticsId {
        Theme.setLeagueGoogleAnalyticsId(with: googleAnalyticsId)
    }

    try! SimulationLeagueWebsite().publish(
        withTheme: .league, at: path,
        additionalSteps: [
            .addItem(Item(
                path: "rosters",
                sectionID: .rosters,
                metadata: SimulationLeagueWebsite.ItemMetadata(
                    leagueName: leagueData.leagueName,
                    teams: leagueData.teams,
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
                          metadata: SimulationLeagueWebsite.ItemMetadata(leagueName: leagueData.leagueName,
                                                                         teams: leagueData.teams,
                                                                  leagueResults: leagueData.leagueResults),
                                                                  tags: ["leagueRosters"],
                                                                  content: Content(
                                                                      title: "League Results",
                                                                      date: Date()
                                                                  )))
        ]
    )

}
