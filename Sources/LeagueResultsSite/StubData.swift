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

let gameViewModel = GameViewModel(gameId: "0", title: "Reds at Browns, April 13 2020", lineScore: lineScoreViewModel)

func createGame(with gameId: String, dateString: String) -> GameViewModel {
    return GameViewModel(gameId: gameId, title: "Reds at Browns, April \(dateString) 2020", lineScore: lineScoreViewModel)
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
