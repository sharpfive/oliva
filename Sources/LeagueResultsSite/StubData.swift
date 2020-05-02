//
//  File.swift
//  
//
//  Created by Jaim Zuber on 4/25/20.
//

import Foundation
import Publish

let inningScores = [
    LineScoreViewModel.InningResult(inningNumber: "1", awayTeamRunsScored: "1", homeTeamRunsScored: "0", isFinalInning: false),
    LineScoreViewModel.InningResult(inningNumber: "2", awayTeamRunsScored: "0", homeTeamRunsScored: "0", isFinalInning: false),
    LineScoreViewModel.InningResult(inningNumber: "3", awayTeamRunsScored: "0", homeTeamRunsScored: "0", isFinalInning: false),
    LineScoreViewModel.InningResult(inningNumber: "4", awayTeamRunsScored: "0", homeTeamRunsScored: "3", isFinalInning: false),
    LineScoreViewModel.InningResult(inningNumber: "5", awayTeamRunsScored: "0", homeTeamRunsScored: "0", isFinalInning: false),
    LineScoreViewModel.InningResult(inningNumber: "6", awayTeamRunsScored: "0", homeTeamRunsScored: "0", isFinalInning: false),
    LineScoreViewModel.InningResult(inningNumber: "7", awayTeamRunsScored: "0", homeTeamRunsScored: "2", isFinalInning: false),
    LineScoreViewModel.InningResult(inningNumber: "8", awayTeamRunsScored: "0", homeTeamRunsScored: "1", isFinalInning: false),
    LineScoreViewModel.InningResult(inningNumber: "9", awayTeamRunsScored: "2", homeTeamRunsScored: "-", isFinalInning: true),
]

let lineScoreViewModel = LineScoreViewModel(awayTeam: "Reds",
                                   homeTeam: "Browns",
                                   inningScores: inningScores,
                                   awayTeamHits: "7",
                                   homeTeamHits: "11",
                                   awayTeamFinalScore: "3",
                                   homeTeamFinalScore: "6")

let inningCounts: [InningCountViewModel] = Array(0...8).flatMap {
    return [
        InningCountViewModel(frame: "Top", count: "\($0+1)", outs: "3"),
        InningCountViewModel(frame: "Bottom", count: "\($0+1)", outs: "3")
    ]
}

let atBatResults: [AtBatResultViewModel] = [
    AtBatResultViewModel(batterName: "Bill", pitcherName: "Carl", result: "SO"),
    AtBatResultViewModel(batterName: "Bob", pitcherName: "Carl", result: "1B"),
    AtBatResultViewModel(batterName: "Steve", pitcherName: "Carl", result: "W"),
    AtBatResultViewModel(batterName: "Joe", pitcherName: "Carl", result: "Out"),
    AtBatResultViewModel(batterName: "John", pitcherName: "Carl", result: "HBP"),
    AtBatResultViewModel(batterName: "Bill", pitcherName: "Carl", result: "Out"),
]

let inningResults = inningCounts.map {
    InningResultViewModel(inningCount: $0, atBats: atBatResults)
}

let gameViewModel = GameViewModel(gameId: "0", title: "Reds at Browns, April 13 2020", lineScore: lineScoreViewModel, inningResults: inningResults, boxScore: boxScore)

func createGame(with gameId: String, dateString: String) -> GameViewModel {
    return GameViewModel(gameId: gameId, title: "Reds at Browns, April \(dateString) 2020", lineScore: lineScoreViewModel, inningResults: inningResults, boxScore: boxScore)
}

let games = [
    createGame(with: "0", dateString: "13"),
    createGame(with: "1", dateString: "14"),
    createGame(with: "2", dateString: "15"),
    createGame(with: "3", dateString: "16"),
    createGame(with: "4", dateString: "17"),
    createGame(with: "5", dateString: "18"),
]

let team1Batters = [
    PlayerViewModel(fullName: "Charlie Blackmon"),
    PlayerViewModel(fullName: "Jose Ramirez"),
    PlayerViewModel(fullName: "Lew Ford"),
    PlayerViewModel(fullName: "Danny Santana"),
    PlayerViewModel(fullName: "Bill Zuber"),
    PlayerViewModel(fullName: "Rhys Hoskins"),
    PlayerViewModel(fullName: "Byron Buxton"),
    PlayerViewModel(fullName: "Aaron Judge"),
    PlayerViewModel(fullName: "Shin-Soo Choo"),
]

let team1Pitchers = [
    PlayerViewModel(fullName: "Jack Flaherty"),
    PlayerViewModel(fullName: "Shane Bieber"),
    PlayerViewModel(fullName: "Noah Syndergaard"),
    PlayerViewModel(fullName: "Mike Minor"),
    PlayerViewModel(fullName: "Kyle Gibson")
]

let team2Batters = [
    PlayerViewModel(fullName: "Andrew McCutchen"),
    PlayerViewModel(fullName: "Miguel Sano"),
    PlayerViewModel(fullName: "Yasiel Puig"),
    PlayerViewModel(fullName: "Ronald Acuna Jr."),
    PlayerViewModel(fullName: "Cesar Hernandez"),
    PlayerViewModel(fullName: "Kyle Tucker"),
    PlayerViewModel(fullName: "Austin Riley"),
    PlayerViewModel(fullName: "Nolan Arenado"),
    PlayerViewModel(fullName: "C.J. Cron"),
]

let team2Pitchers = [
    PlayerViewModel(fullName: "Robbie Ray"),
    PlayerViewModel(fullName: "Walker Buehler"),
    PlayerViewModel(fullName: "Jose Berrios"),
    PlayerViewModel(fullName: "Jose Quintana"),
    PlayerViewModel(fullName: "Jacob deGrom"),
]

let team1BatterBoxScores = [
    BatterBoxScore(playerName: "Charlie Blackmon", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
    BatterBoxScore(playerName: "Jose Ramirez", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
    BatterBoxScore(playerName: "Danny Santana", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "1"),
    BatterBoxScore(playerName: "Bill Zuber", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
    BatterBoxScore(playerName: "Cesar Hernandez", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "1"),
    BatterBoxScore(playerName: "Rhys Hoskins", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
    BatterBoxScore(playerName: "Byron Buxton", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
    BatterBoxScore(playerName: "Shin-Soo Choo", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
    BatterBoxScore(playerName: "Lew Ford", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
]

let team1PitcherBoxScores = [
    PitcherBoxScore(playerName: "Rich Hill", inningsPitched: "9.0", hits: "7", runs: "3", walks: "3", strikeouts: "6", homeRuns: "1")
]

let team2BatterBoxScores = [
    BatterBoxScore(playerName: "Andrew McCutchen", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
    BatterBoxScore(playerName: "Miguel Sano", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
    BatterBoxScore(playerName: "Yasiel Puig", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
    BatterBoxScore(playerName: "Ronald Acuna Jr.", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "1"),
    BatterBoxScore(playerName: "Cesar Hernandez", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
    BatterBoxScore(playerName: "Kyle Tucker", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
    BatterBoxScore(playerName: "Austin Riley", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "2"),
    BatterBoxScore(playerName: "Nolan Arenado", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
    BatterBoxScore(playerName: "C.J. Cron", atBats: "4", runs: "1", hits: "2", rbis: "0", strikeouts: "0"),
]

let team2PitcherBoxScores = [
    PitcherBoxScore(playerName: "Jacob deGrom", inningsPitched: "9.0", hits: "7", runs: "3", walks: "3", strikeouts: "6", homeRuns: "1")
]

let team1BoxScore = TeamBoxScoreViewModel(teamName: "Reds", batters: team1BatterBoxScores, pitchers: team1PitcherBoxScores)
let team2BoxScore = TeamBoxScoreViewModel(teamName: "Browns", batters: team2BatterBoxScores, pitchers: team2PitcherBoxScores)

let boxScore = BoxScoreViewModel(homeTeam: team1BoxScore, awayTeam: team2BoxScore)

let team2PitcherBoxScore = [
    PitcherBoxScore(playerName: "Robbie Ray", inningsPitched: "9.0", hits: "7", runs: "3", walks: "3", strikeouts: "6", homeRuns: "1")
]

let team1 = TeamViewModel(name: "Reds", batters: team1Batters, pitchers: team1Pitchers)
let team2 = TeamViewModel(name: "Browns", batters: team2Batters, pitchers: team2Pitchers)

let teams = [
    team1,
    team2
]

let metadatas = games.map { game in
    return SimulationLeagueWebsite.ItemMetadata(leagueName: leagueName, teams: teams, game: game)
}

let gameItems = metadatas.map{ metadata in
    return Item<SimulationLeagueWebsite>(path: "\(metadata.game!.gameId)", sectionID: .game, metadata: metadata)
}

let gameMetaDatas: [GameMetaDataViewModel] = games.map {
    let urlString = "/game/\($0.gameId)/index.html"
    return GameMetaDataViewModel(title: $0.title, detailURLString: urlString, result: "Reds 4, Browns 3")
}

let team1Standings = TeamStandingsViewModel(teamName: "Reds", wins: "7", losses: "3", winPercentage: ".700")
let team2Standings = TeamStandingsViewModel(teamName: "Browns", wins: "3", losses: "7", winPercentage: ".300")

let teamStandings = [team1Standings, team2Standings]
let standings = StandingsViewModel(teamStandings: teamStandings)

let leagueResults = LeagueResultsViewModel(games: gameMetaDatas, standings: standings)
