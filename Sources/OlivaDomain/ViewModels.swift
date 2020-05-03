//
//  File.swift
//  
//
//  Created by Jaim Zuber on 4/25/20.
//

import Foundation

public struct PlayerViewModel: Codable, Hashable {
    public let fullName: String

    public init(fullName: String) {
        self.fullName = fullName
    }
}

public struct TeamViewModel: Codable, Hashable {
    public let name: String
    public let batters: [PlayerViewModel]
    public let pitchers: [PlayerViewModel]

    public init(name: String, batters: [PlayerViewModel], pitchers: [PlayerViewModel]) {
        self.name = name
        self.batters = batters
        self.pitchers = pitchers
    }
}

public struct LineScoreViewModel: Codable, Hashable {
    public struct InningResult: Codable, Hashable {
        public let inningNumber: String
        public let awayTeamRunsScored: String
        public let homeTeamRunsScored: String
        public let isFinalInning: Bool

        public init(inningNumber: String, awayTeamRunsScored: String, homeTeamRunsScored: String, isFinalInning: Bool) {
            self.inningNumber = inningNumber
            self.awayTeamRunsScored = awayTeamRunsScored
            self.homeTeamRunsScored = homeTeamRunsScored
            self.isFinalInning = isFinalInning
        }
    }

    public let awayTeam: String
    public let homeTeam: String

    public let inningScores: [InningResult]
    public let awayTeamHits: String
    public let homeTeamHits: String

    public let awayTeamErrors: String = "0"
    public let homeTeamErrors: String = "0"

    public let awayTeamFinalScore: String
    public let homeTeamFinalScore: String

    public init(awayTeam: String, homeTeam: String, inningScores: [LineScoreViewModel.InningResult], awayTeamHits: String, homeTeamHits: String, awayTeamFinalScore: String, homeTeamFinalScore: String) {
        self.awayTeam = awayTeam
        self.homeTeam = homeTeam
        self.inningScores = inningScores
        self.awayTeamHits = awayTeamHits
        self.homeTeamHits = homeTeamHits
        self.awayTeamFinalScore = awayTeamFinalScore
        self.homeTeamFinalScore = homeTeamFinalScore
    }
}

public struct BoxScoreViewModel: Codable, Hashable {
    public let homeTeam: TeamBoxScoreViewModel
    public let awayTeam: TeamBoxScoreViewModel

    public init(homeTeam: TeamBoxScoreViewModel, awayTeam: TeamBoxScoreViewModel) {
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
    }
}

public struct TeamBoxScoreViewModel: Codable, Hashable {
    public let teamName: String
    public let batters: [BatterBoxScore]
    public let pitchers: [PitcherBoxScore]

    public init(teamName: String, batters: [BatterBoxScore], pitchers: [PitcherBoxScore]) {
        self.teamName = teamName
        self.batters = batters
        self.pitchers = pitchers
    }
}

public struct BatterBoxScore: Codable, Hashable {
    public let playerName: String
    public let atBats: String
    public let runs: String
    public let hits: String
    public let rbis: String
    public let strikeouts: String

    public init(playerName: String, atBats: String, runs: String, hits: String, rbis: String, strikeouts: String) {
        self.playerName = playerName
        self.atBats = atBats
        self.runs = runs
        self.hits = hits
        self.rbis = rbis
        self.strikeouts = strikeouts
    }
}

public struct PitcherBoxScore: Codable, Hashable {
    public let playerName: String
    public let inningsPitched: String
    public let hits: String
    public let runs: String
    public let walks: String
    public let strikeouts: String
    public let homeRuns: String

    public init(playerName: String, inningsPitched: String, hits: String, runs: String, walks: String, strikeouts: String, homeRuns: String) {
        self.playerName = playerName
        self.inningsPitched = inningsPitched
        self.hits = hits
        self.runs = runs
        self.walks = walks
        self.strikeouts = strikeouts
        self.homeRuns = homeRuns
    }
}

public struct GameMetaDataViewModel: Codable, Hashable {
    public let title: String
    public let detailURLString: String
    public let result: String

    public init(title: String, detailURLString: String, result: String) {
        self.title = title
        self.detailURLString = detailURLString
        self.result = result
    }
}

public struct LeagueResultsViewModel: Codable, Hashable {
    public let games: [GameMetaDataViewModel]
    public let standings: StandingsViewModel

    public init(games: [GameMetaDataViewModel], standings: StandingsViewModel) {
        self.games = games
        self.standings = standings
    }
}

public struct StandingsViewModel: Codable, Hashable {
    public let teamStandings: [TeamStandingsViewModel]

    public init(teamStandings: [TeamStandingsViewModel]) {
        self.teamStandings = teamStandings
    }
}

public struct TeamStandingsViewModel: Codable, Hashable {
    public let teamName: String
    public let wins: String
    public let losses: String
    public let winPercentage: String

    public init(teamName: String, wins: String, losses: String, winPercentage: String) {
        self.teamName = teamName
        self.wins = wins
        self.losses = losses
        self.winPercentage = winPercentage
    }
}

public struct GameViewModel: Codable, Hashable {
    public let gameId: String
    public let title: String
    public let lineScore: LineScoreViewModel
    public let inningResults: [InningResultViewModel]
    public let boxScore: BoxScoreViewModel

    public init(gameId: String, title: String, lineScore: LineScoreViewModel, inningResults: [InningResultViewModel], boxScore: BoxScoreViewModel) {
        self.gameId = gameId
        self.title = title
        self.lineScore = lineScore
        self.inningResults = inningResults
        self.boxScore = boxScore
    }
}

public enum InningFrame {
    case top
    case bottom
}

public struct InningCountViewModel: Codable, Hashable {
    public let frame: String
    public let count: String
    public let outs: String

    public init(frame: String, count: String, outs: String) {
        self.frame = frame
        self.count = count
        self.outs = outs
    }
}

public struct InningResultViewModel: Codable, Hashable {
    public let inningCount: InningCountViewModel
    public let atBats: [AtBatResultViewModel]

    public init(inningCount: InningCountViewModel, atBats: [AtBatResultViewModel]) {
        self.inningCount = inningCount
        self.atBats = atBats
    }
}

public struct AtBatResultViewModel: Codable, Hashable {
    public let batterName: String
    public let pitcherName: String
    public let result: String

    public init(batterName: String, pitcherName: String, result: String) {
        self.batterName = batterName
        self.pitcherName = pitcherName
        self.result = result
    }
}
