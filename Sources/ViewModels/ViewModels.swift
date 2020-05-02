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

struct BoxScoreViewModel: Codable, Hashable {
    let homeTeam: TeamBoxScoreViewModel
    let awayTeam: TeamBoxScoreViewModel
}

struct TeamBoxScoreViewModel: Codable, Hashable {
    let teamName: String
    let batters: [BatterBoxScore]
    let pitchers: [PitcherBoxScore]
}

struct BatterBoxScore: Codable, Hashable {
    let playerName: String
    let atBats: String
    let runs: String
    let hits: String
    let rbis: String
    let strikeouts: String
}

struct PitcherBoxScore: Codable, Hashable {
    let playerName: String
    let inningsPitched: String
    let hits: String
    let runs: String
    let walks: String
    let strikeouts: String
    let homeRuns: String
}

struct GameMetaDataViewModel: Codable, Hashable {
    let title: String
    let detailURLString: String
    let result: String
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
    let inningResults: [InningResultViewModel]
    let boxScore: BoxScoreViewModel
}

enum InningFrame {
    case top
    case bottom
}

struct InningCountViewModel: Codable, Hashable {
    let frame: String
    let count: String
    let outs: String
}

struct InningResultViewModel: Codable, Hashable {
    let inningCount: InningCountViewModel
    let atBats: [AtBatResultViewModel]
}

struct AtBatResultViewModel: Codable, Hashable {
    let batterName: String
    let pitcherName: String
    let result: String
}