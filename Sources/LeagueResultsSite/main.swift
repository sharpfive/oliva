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
    var leagueName: String?

    @Option(name: [.short, .long], help: "Google analytics id")
    var googleAnalyticsId: String?

    @Option(name: [.short, .long], help: "Path where the website html is written")
    var path: String?

    var commandName: String = "League Results Site"
    var abstract: String = "Create a web site based on simulated baseball game data"

    mutating func run() throws {
        print("\u{1B}[33m\("Generating \(leagueName ?? "Sample League") HTML")\u{1B}[0m")

        runMain(with: leagueName,
                googleAnalyticsId: googleAnalyticsId,
                path: path)
    }
}

LeagueResultsSite.main()

func runMain(with leagueDataFilename: String?,
           googleAnalyticsId: String?,
           path pathString: String?) {
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

    let path: Path?
    if let pathString = pathString {
        path = Path(pathString)
    } else {
        path = nil
    }

    publishSimulationLeagueSite(from: leagueData,
                                googleAnalyticsId: googleAnalyticsId,
                                path: path)
}
