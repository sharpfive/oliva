//
//  SimulationLeagueHTMLFactory.swift
//  
//
//  Created by Jaim Zuber on 4/13/20.
//

import OlivaDomain
import Plot
import Publish

class SimulationLeagueHTMLFactory: HTMLFactory {
    typealias Site = SimulationLeagueWebsite

    var googleAnalyticsString: String?

    enum Errors: Error {
        case noItemHandlerForSection(Site.SectionID)
    }

    func makeIndexHTML(for index: Index, context: PublishingContext<SimulationLeagueWebsite>) throws -> HTML {

        let sections = context.sections

        return HTML(
            .head(
                .script(.async(), .src(googleAnalyticsSource(with: googleAnalyticsString))),
                .script(appendGoogleAnalyticsInfo(with: googleAnalyticsString)),
                .title("Simulated Baseball Games")
            ),
            .body(
                .h1("Simulated Baseball Games"),
                .div(
                    .h2(
                        .text("Sections")
                    ),
                    .ul(
                        .forEach(sections) { section in
                            .li(
                                .a(
                                    .href("\(section.path)/index.html"),
                                    .text("\(section.path)")
                                )
                            )
                        }
                    )
                )
            )
        )
    }

    func makeSectionHTML(for section: Section<SimulationLeagueWebsite>, context: PublishingContext<SimulationLeagueWebsite>) throws -> HTML {

        switch (section.id, section.item(at: section.path)?.metadata) {
        case (.rosters, .some(let metadata)):
            return leagueHTML(for: metadata)
        case (.about, _):
            return aboutHTML()
        case (.leagueResults, .some(let metadata)):
            return leagueResultsHTML(for: metadata)
        default:
            return defaultHTML(for: section)
        }
    }

    func leagueResultsHTML(for metadata: SimulationLeagueWebsite.ItemMetadata ) -> HTML {
        let leagueResults = metadata.leagueResults!
        let gameMetaDataViewModels = leagueResults.games


        return HTML(
                    .head(
                        .script(.async(), .src(googleAnalyticsSource(with: googleAnalyticsString))),
                        .script(appendGoogleAnalyticsInfo(with: googleAnalyticsString)),
                        .title(metadata.leagueName)
                    ),
                    .body(
                        .h1(
                            .text("League: \(metadata.leagueName) Results")
                        ),
                        makeStandingsNode(for: leagueResults.standings),
                        makeGameMetaDataNode(for: gameMetaDataViewModels)
                    )
        )
    }

    func makeStandingsNode(for standings: StandingsViewModel) -> Node<HTML.BodyContext> {
        return .div(
            .table(
                .tr(
                    .th("Name"),
                    .th("W"),
                    .th("L"),
                    .th("PCT")
                ),
                .forEach(standings.teamStandings) { teamsStandings in
                    .tr(
                        .td(.text(teamsStandings.teamName)),
                        .td(.text(teamsStandings.wins)),
                        .td(.text(teamsStandings.losses)),
                        .td(.text(teamsStandings.winPercentage))
                    )
                }
            )
        )
    }

    func makeGameMetaDataNode(for gameMetaDatas: [GameMetaDataViewModel]) -> Node<HTML.BodyContext> {
        return .div(
            .table(
                .tr(
                    .th("Matchup"),
                    .th("Result")
                ),
                .forEach(gameMetaDatas) { gameMetaData in
                    .tr(
                        .td(
                            .a(
                                .href(gameMetaData.detailURLString),
                                .text(gameMetaData.title)
                            )
                        ),
                        .td(
                            .text(gameMetaData.result)
                        )
                    )
                }
            )
        )
    }


    func leagueHTML(for metadata: SimulationLeagueWebsite.ItemMetadata ) -> HTML {

        let teams = metadata.teams

        return HTML(
            .head(
                .script(.async(), .src(googleAnalyticsSource(with: googleAnalyticsString))),
                .script(appendGoogleAnalyticsInfo(with: googleAnalyticsString)),
                .title(metadata.leagueName)
            ),
            .body(
                .div(
                    .h1(
                        .text("League: \(metadata.leagueName)")
                    ),
                    .forEach(teams) { team in
                        .div(
                            .h2(
                                .text(team.name)
                            ),
                            .h3(
                                .text("Batters")
                            ),
                            .table(
                                .tr(
                                    .th("Name")
                                ),
                                .forEach(team.batters) { batter in
                                    .tr(
                                        .td(.text(batter.fullName))
                                    )
                                }
                            ),
                            .h3(
                                .text("Pitchers")
                            ),
                            .table(
                                .tr(
                                    .th("Name")
                                ),
                                .forEach(team.pitchers) { pitcher in
                                    .tr(
                                        .td(
                                            .text(pitcher.fullName)
                                        )
                                    )
                                }
                            )
                        )
                    }
                )
            )
        )
    }

    func aboutHTML() -> HTML {
        return HTML(
            .head(
                .script(.async(), .src(googleAnalyticsSource(with: googleAnalyticsString))),
                .script(appendGoogleAnalyticsInfo(with: googleAnalyticsString)),
                .title("About")
            ),
            .body(
                .h1(
                    .text("About these stats")
                ),
                .p(
                    .text("This is a collection of simulated stats for baseball games. Not much else here yet. It is intended for amusement purposes only. Although its effectiveness to that point is debateable."
                    ),
                    .br(),
                    .text("Want to simulate your league with projected 2020 stats? Let us know.")
                )
            )
        )
    }

    func defaultHTML(for section: Section<SimulationLeagueWebsite>) -> HTML {
        return HTML(
            .head(
                .script(.async(), .src(googleAnalyticsSource(with: googleAnalyticsString))),
                .script(appendGoogleAnalyticsInfo(with: googleAnalyticsString)),
                .title("Section :\(section.id)")
            ),
            .body(
                .h1(
                    .text("Default text for \(section.id)")
                )
            )
        )
    }

    func makeRostersHTML(leagueName: String, teams: [TeamViewModel]) -> HTML {
        return HTML(
            .head(
                .script(.async(), .src(googleAnalyticsSource(with: googleAnalyticsString))),
                .script(appendGoogleAnalyticsInfo(with: googleAnalyticsString)),
                .title(leagueName)
            ),
            .body(
                .div(
                    .h1(
                        .text("League: \(leagueName)")
                    ),
                    .forEach(teams) { team in
                        .div(
                            .h2(
                                .text(team.name)
                            ),
                            .h3(
                                .text("Batters")
                            ),
                            .table(
                                .tr(
                                    .th("Name")
                                ),
                                .forEach(team.batters) { batter in
                                    .tr(
                                        .td(.text(batter.fullName))
                                    )
                                }
                            ),
                            .h3(
                                .text("Pitchers")
                            ),
                            .table(
                                .tr(
                                    .th("Name")
                                ),
                                .forEach(team.pitchers) { pitcher in
                                    .tr(
                                        .td(
                                            .text(pitcher.fullName)
                                        )
                                    )
                                }
                            )
                        )
                    }
                )
            )
        )
    }

    func makeGameHTML(for game: GameViewModel) -> HTML {
        return HTML(
            .head(
                .script(.async(), .src(googleAnalyticsSource(with: googleAnalyticsString))),
                .script(appendGoogleAnalyticsInfo(with: googleAnalyticsString)),
                .title(
                    game.title
                )
            ),
            .body(
                .h1(.text(game.title)),
                .div(
                    .h2(.text("Line Score")),
                    .class("linescore"),
                    makeLinescoreNode(for: game.lineScore)
                ),
                .div(
                    .h2(.text("Box Score")),
                    makeBoxScoreNode(for: game.boxScore)
                ),
                .div(
                    .h2(.text("Play By Play")),
                    makeInningResultsNode(for: game.inningResults)
                )
            )
        )
    }

    func makeInningResultsNode(for inningResults: [InningResultViewModel]) -> Node<HTML.BodyContext> {
        return .div(
            .table(
                .tr(
                    .td("Inning"),
                    .td("Batter"),
                    .td("Pitcher"),
                    .td("Result")
                ),
                .forEach(inningResults) { inningResult in
                    .group([
                        .tr(
                            .td(
                                .text("\(inningResult.inningCount.frame) \(inningResult.inningCount.count)")
                            ),
                            .td(),
                            .td(),
                            .td()
                        ),
                        .forEach(inningResult.atBats) { atBatResult in
                            .tr(
                                .td(),
                                .td(
                                    .text(atBatResult.batterName)
                                ),
                                .td(
                                    .text(atBatResult.pitcherName)
                                ),
                                .td(
                                    .text(atBatResult.result)
                                )
                            )
                        }
                    ])
                }
            )
        )
    }

    func makeBoxScoreNode(for boxScore: BoxScoreViewModel) -> Node<HTML.BodyContext> {
        return .div(
            makeTeamBoxScoreNode(for: boxScore.awayTeam),
            makeTeamBoxScoreNode(for: boxScore.homeTeam)
        )
    }

    func makeTeamBoxScoreNode(for teamBoxScore: TeamBoxScoreViewModel) -> Node<HTML.BodyContext> {
        return .div(
            .h3(.text("\(teamBoxScore.teamName) Batters")),
            .class("teamBoxScore"),
            .table(
                .tr(
                    .th("Name"),
                    .th("AB"),
                    .th("R"),
                    .th("H"),
                    .th("RBI"),
                    .th("K")
                ),
                .forEach(teamBoxScore.batters) { batter in
                    .tr(
                        .td(.text(batter.playerName)),
                        .td(.text(batter.atBats)),
                        .td(.text(batter.runs)),
                        .td(.text(batter.hits)),
                        .td(.text(batter.rbis)),
                        .td(.text(batter.strikeouts))
                    )
                }
            ),
            .h3(.text("\(teamBoxScore.teamName) Pitchers")),
            .class("teamBoxScore"),
            .table(
                .tr(
                    .th("Name"),
                    .th("IP"),
                    .th("H"),
                    .th("R"),
                    .th("BB"),
                    .th("K")
                ),
                .forEach(teamBoxScore.pitchers) { batter in
                    .tr(
                        .td(.text(batter.playerName)),
                        .td(.text(batter.inningsPitched)),
                        .td(.text(batter.hits)),
                        .td(.text(batter.runs)),
                        .td(.text(batter.walks)),
                        .td(.text(batter.strikeouts))
                    )
                }
            )
        )
    }

    func makeLinescoreNode(for lineScore: LineScoreViewModel) -> Node<HTML.BodyContext> {
        return .div(
                .class("linescore"),
                .table(
                    .tr(
                        .td("Team"),
                        .forEach(lineScore.inningScores) { inningScore in
                            .td(.text(inningScore.inningNumber))
                        },
                        .td(.b("R")),
                        .td(.b("H")),
                        .td(.b("E"))
                    ),
                    .tr(
                        .td(.text(lineScore.awayTeam)),
                        .forEach(lineScore.inningScores) { inningScore in
                            .td(.text(inningScore.awayTeamRunsScored))
                        },
                        .td(.text(lineScore.awayTeamFinalScore)),
                        .td(.text(lineScore.awayTeamHits)),
                        .td(.text(lineScore.awayTeamErrors))
                    ),
                    .tr(
                        .td(.text(lineScore.homeTeam)),
                        .forEach(lineScore.inningScores) { inningScore in
                            .td(.text(inningScore.homeTeamRunsScored))
                        },
                        .td(.text(lineScore.homeTeamFinalScore)),
                        .td(.text(lineScore.homeTeamHits)),
                        .td(.text(lineScore.homeTeamErrors))
                    )
                )
            )
    }

    func makeItemHTML(for item: Item<SimulationLeagueWebsite>, context: PublishingContext<SimulationLeagueWebsite>) throws -> HTML {
        let leagueName = item.metadata.leagueName
        let teams = item.metadata.teams

        switch item.sectionID {
        case .rosters:
            return makeRostersHTML(leagueName: leagueName, teams: teams)
        case .game:
            return makeGameHTML(for: item.metadata.game!)
        case .leagueResults:
            return leagueResultsHTML(for: item.metadata)
        default:
            throw(Errors.noItemHandlerForSection(item.sectionID))
        }
    }

    func makePageHTML(for page: Page, context: PublishingContext<SimulationLeagueWebsite>) throws -> HTML {
        return HTML(
            .head(
                .script(.async(), .src(googleAnalyticsSource(with: googleAnalyticsString))),
                .script(appendGoogleAnalyticsInfo(with: googleAnalyticsString)),
                .title("Page")
            ),
            .body(
                .h1(
                    .text("A Page")
                )
            )
        )
    }

    func makeTagListHTML(for page: TagListPage, context: PublishingContext<SimulationLeagueWebsite>) throws -> HTML? {
        return HTML(
            .head(
                .script(.async(), .src(googleAnalyticsSource(with: googleAnalyticsString))),
                .script(appendGoogleAnalyticsInfo(with: googleAnalyticsString)),
                .title("Tag List")
            ),
            .body(
                .h1(
                    .text("Tag List")
                )
            )
        )
    }

    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<SimulationLeagueWebsite>) throws -> HTML? {
        return HTML(
            .head(
                .script(.async(), .src(googleAnalyticsSource(with: googleAnalyticsString))),
                .script(appendGoogleAnalyticsInfo(with: googleAnalyticsString)),
                .title("Tag Details")
            ),
            .body(
                .h1(
                    .text("Tag Details")
                )
            )
        )
    }
}

extension Node where Context == HTML.BodyContext {
    static func lineScore(_ lineScore: LineScoreViewModel) -> Node {
        return .div(
                .class("linescore"),
                .table(
                    .tr(
                        .forEach(lineScore.inningScores) { inningScore in
                            .td(.text(inningScore.inningNumber))
                        },
                        .td("H"),
                        .td("R"),
                        .td("E")
                    ),
                    .tr(
                        .forEach(lineScore.inningScores) { inningScore in
                            .td(.text(inningScore.awayTeamRunsScored))
                        },
                        .td(.text(lineScore.awayTeamHits)),
                        .td(.text(lineScore.awayTeamFinalScore)),
                        .td(.text(lineScore.awayTeamErrors))
                    ),
                    .tr(
                        .forEach(lineScore.inningScores) { inningScore in
                            .td(.text(inningScore.homeTeamRunsScored))
                        },
                        .td(.text(lineScore.homeTeamHits)),
                        .td(.text(lineScore.homeTeamFinalScore)),
                        .td(.text(lineScore.homeTeamErrors))
                    )
                )
            )
    }
}
