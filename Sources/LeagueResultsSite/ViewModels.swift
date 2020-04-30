//
//  File.swift
//  
//
//  Created by Jaim Zuber on 4/25/20.
//

import Foundation

struct PlayerViewModel: Codable, Hashable {
    let fullName: String
}

struct TeamViewModel: Codable, Hashable {
    let name: String
    let batters: [PlayerViewModel]
    let pitchers: [PlayerViewModel]
}

struct LineScoreViewModel: Codable, Hashable {
    struct InningResult: Codable, Hashable {
        let inningNumber: String
        let awayTeamRunsScored: String
        let homeTeamRunsScored: String
        let isFinalInning: Bool
    }

    let awayTeam: String
    let homeTeam: String

    let inningScores: [InningResult]
    let awayTeamHits: String
    let homeTeamHits: String

    let awayTeamErrors: String = "0"
    let homeTeamErrors: String = "0"

    let awayTeamFinalScore: String
    let homeTeamFinalScore: String
}

struct GameMetaDataViewModel: Codable, Hashable {
    let title: String
    let detailURLString: String
}

struct LeagueResultsViewModel: Codable, Hashable {
    let games: [GameMetaDataViewModel]
    let standings: StandingsViewModel
}

struct StandingsViewModel: Codable, Hashable {
    let teamStandings: [TeamStandingsViewModel]
}

struct TeamStandingsViewModel: Codable, Hashable {
    let teamName: String
    let wins: String
    let losses: String
    let winPercentage: String
}

struct GameViewModel: Codable, Hashable {
    let gameId: String
    let title: String
    let lineScore: LineScoreViewModel
}

enum InningFrame {
    case top
    case bottom
}

struct InningCountViewModel {
    let frame: String
    let outs: String
}
