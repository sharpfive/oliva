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
import ArgumentParser


struct LeagueResultsSite: ParsableCommand {
    @Argument(help: "The name of the league")
    var leagueName: String

    mutating func run() throws {
        print("\u{1B}[33m\(leagueName)\u{1B}[0m")

        runIt(with: leagueName)
    }
}

LeagueResultsSite.main()


func runIt(with leagueDataFilename: String?) {
    let leagueData: LeagueData

    if let leagueDataFilename = leagueDataFilename {
        let leagueDataData = try! String(contentsOfFile: leagueDataFilename, encoding: .utf8).data(using: .utf8)
        let decoder = JSONDecoder()
        leagueData = try! decoder.decode(LeagueData.self, from: leagueDataData!)
    } else {
        let leagueName = "Sample League"
        leagueData = LeagueData(leagueName: leagueName,
                                    teams: teams,
                                    leagueResults: leagueResults,
                                    games: games)
    }

    publishSimulationLeagueSite(from: leagueData, googleAnalyticsId: nil)
}
