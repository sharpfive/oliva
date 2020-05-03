//
//  LeagueData.swift
//
//
//  Created by Jaim Zuber on 7/28/20.
//

import Foundation

public struct LeagueData: Codable {
    public let leagueName: String
    public let teams: [TeamViewModel]
    public let leagueResults: LeagueResultsViewModel
    public let games: [GameViewModel]

    public init(leagueName: String, teams: [TeamViewModel], leagueResults: LeagueResultsViewModel, games: [GameViewModel]) {
        self.leagueName = leagueName
        self.teams = teams
        self.leagueResults = leagueResults
        self.games = games
    }
}
