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
import SPMUtility

let parser = ArgumentParser(commandName: "LeagueResultsSite",
usage: "filename [--leagueData]",
overview: "Outputs a static html Publish site")

let leagueDataFilenameOption = parser.add(option: "--leagueData", shortName: "-l", kind: String.self, usage: "Filename for leagueData json")

let arguments = Array(ProcessInfo.processInfo.arguments.dropFirst())

let parsedArguments: SPMUtility.ArgumentParser.Result

do {
    parsedArguments = try parser.parse(arguments)
} catch let error as ArgumentParserError {
    print(error.description)
    exit(0)
} catch let error {
    print(error.localizedDescription)
    exit(0)
}

let leagueDataFilename = parsedArguments.get(leagueDataFilenameOption)

let leagueData: LeagueData
let leagueName: String

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
