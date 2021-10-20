//
//  SimulationLeagueWebsite.swift
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
    static func setLeagueGoogleAnalyticsId(with googleAnalyticsId: String) {
        // Not a terribly elegant way of passing in the parameter, but will do for now
        let htmlFactory = SimulationLeagueHTMLFactory()
        htmlFactory.googleAnalyticsString = googleAnalyticsId
        Theme.league = Theme(htmlFactory: htmlFactory)
    }

    static var league: Self = Theme(htmlFactory: SimulationLeagueHTMLFactory())
}

extension HTMLFactory {
    func googleAnalyticsSource(with googleAnalyticsId: String?) -> String {
        guard let googleAnalyticsId = googleAnalyticsId else {
            print("Warning: no GoogleAnalyticsId specified")
            return ""
        }

        return "https://www.googletagmanager.com/gtag/js?id=\(googleAnalyticsId)"
    }

    func appendGoogleAnalyticsInfo(with googleAnalyticsId: String?) -> Plot.Node<HTML.ScriptContext> {
        guard let googleAnalyticsId = googleAnalyticsId else { return Plot.Node(stringLiteral: "")}

        let string = """
                  window.dataLayer = window.dataLayer || [];
                  function gtag(){dataLayer.push(arguments);}
                  gtag('js', new Date());

                  gtag('config', '\(googleAnalyticsId)');
        """

        return Plot.Node<HTML.ScriptContext>(stringLiteral: string)
    }
}
