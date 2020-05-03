//
//  File.swift
//  
//
//  Created by Jaim Zuber on 4/25/20.
//

import Foundation
import OlivaDomain
import Publish
import Plot

public struct SimulationLeagueWebsite: Website {
    public enum SectionID: String, WebsiteSectionID {
        case rosters
        case game
        case leagueResults
        case about
    }

    public struct ItemMetadata: WebsiteItemMetadata {
        public let leagueName: String
        public let teams: [TeamViewModel]
        public let game: GameViewModel?
        public let leagueResults: LeagueResultsViewModel?

        public init(leagueName: String,
             teams: [TeamViewModel],
             game: GameViewModel? = nil,
             leagueResults: LeagueResultsViewModel? = nil) {
            self.leagueName = leagueName
            self.teams = teams
            self.game = game
            self.leagueResults = leagueResults
        }
    }

    public var url = URL(string: "https://cooking-with-john.com")!
    public var name = "The League"
    public var description = "Baseball Simulation"
    public var language: Language { .english }
    public var imagePath: Path? { "images/logo.png" }
}

extension Theme where Site == SimulationLeagueWebsite {
    static var league: Self {
        Theme(htmlFactory: SimulationLeagueHTMLFactory())
    }
}
