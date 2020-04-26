//
//  File.swift
//  
//
//  Created by Jaim Zuber on 4/25/20.
//

import Foundation
import Publish
import Plot

struct SimulationLeagueWebsite: Website {
    enum SectionID: String, WebsiteSectionID {
        case rosters
        case game
        case leagueResults
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        let leagueName: String
        let teams: [TeamViewModel]
        let game: GameViewModel?
        let leagueResults: LeagueResultsViewModel?

        init(leagueName: String,
             teams: [TeamViewModel],
             game: GameViewModel? = nil,
             leagueResults: LeagueResultsViewModel? = nil) {
            self.leagueName = leagueName
            self.teams = teams
            self.game = game
            self.leagueResults = leagueResults
        }
    }

    var url = URL(string: "https://cooking-with-john.com")!
    var name = "The League"
    var description = "Baseball Simulation"
    var language: Language { .english }
    var imagePath: Path? { "images/logo.png" }
}

extension Theme where Site == SimulationLeagueWebsite {
    static var league: Self {
        Theme(htmlFactory: SimulationLeagueHTMLFactory())
    }
}
