//
//  GamesViewModel.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 29/11/24.
//

import Foundation

class GameCardDataModel: Identifiable{
    let id: UUID = UUID()
    var gameDataCard: FutureGame?
    var visitorTeamLogo: String?
    var visitorTeamName: String?
    var visitorTeamScore: String?
    var homeTeamLogo: String?
    var homeTeamName: String?
    var homeTeamScore: String?
    var displayVs: Bool?
    var gameTime: String?
    var gameHomeOrAwat: String?
    var gameStatus: Int?
    
    init(gameDataCard: FutureGame? = nil, visitorTeamLogo: String? = nil, visitorTeamName: String? = nil, visitorTeamScore: String? = nil, homeTeamLogo: String? = nil, homeTeamName: String? = nil, homeTeamScore: String? = nil, displayVs: Bool? = nil, gameTime: String? = nil, gameHomeOrAwat: String? = nil, gameStatus: Int? = nil) {
        self.gameDataCard = gameDataCard
        self.visitorTeamLogo = visitorTeamLogo
        self.visitorTeamName = visitorTeamName
        self.visitorTeamScore = visitorTeamScore
        self.homeTeamLogo = homeTeamLogo
        self.homeTeamName = homeTeamName
        self.homeTeamScore = homeTeamScore
        self.displayVs = displayVs
        self.gameTime = gameTime
        self.gameHomeOrAwat = gameHomeOrAwat
        self.gameStatus = gameStatus
    }
}

class GamesViewModel: ObservableObject {
    private let tid = "1610612748"
    var gameData: GameModel?
    private var scheduleData: [Schedule]?
    private var visitorTeamLogo: [String]?
    private var homeTeamLogo: [String]?
    @Published var gameCardData: [GameCardDataModel] = []
    
    init(gameData: GameModel? = nil) {
        self.gameData = gameData
    }
    
    func updateGameData(scheduleData: [Schedule], visitorTeamLogo: [String], homeTeamLogo: [String]) {
        self.scheduleData = scheduleData
        self.visitorTeamLogo = visitorTeamLogo
        self.homeTeamLogo = homeTeamLogo
    }
    
    func getGameCardsData(){
        if let scheduleData = self.scheduleData, let visitorTeamLogo = self.visitorTeamLogo, let homeTeamLogo = self.homeTeamLogo, let gameData = self.gameData{
            for i in 0..<scheduleData.count{
                switch scheduleData[i].st{
                case 1:
                    DispatchQueue.main.async {
                        let gameData = GameCardDataModel(
                            gameDataCard: self.tid == scheduleData[i].h.tid ? gameData.upcoming_game : gameData.future_game,
                            visitorTeamLogo: visitorTeamLogo[i],
                            visitorTeamName: scheduleData[i].v.ta,
                            visitorTeamScore: scheduleData[i].v.s,
                            homeTeamLogo: homeTeamLogo[i],
                            homeTeamName: scheduleData[i].h.ta,
                            homeTeamScore: scheduleData[i].h.s,
                            displayVs: scheduleData[i].h.tid == self.tid,
                            gameTime: scheduleData[i].gametime,
                            gameHomeOrAwat: self.tid == scheduleData[i].h.tid ? "AWAY" : "HOME",
                            gameStatus: scheduleData[i].st
                        )
                        self.gameCardData.append(gameData)
                    }
                case 2:
                    DispatchQueue.main.async {
                        let gameData = GameCardDataModel(
                            gameDataCard: self.tid == scheduleData[i].h.tid ? gameData.future_game : gameData.upcoming_game,
                            visitorTeamLogo: visitorTeamLogo[i],
                            visitorTeamName: scheduleData[i].v.ta,
                            visitorTeamScore: scheduleData[i].v.s,
                            homeTeamLogo: homeTeamLogo[i],
                            homeTeamName: scheduleData[i].h.ta,
                            homeTeamScore: scheduleData[i].h.s,
                            displayVs: scheduleData[i].h.tid == self.tid,
                            gameTime: scheduleData[i].gametime,
                            gameHomeOrAwat: self.tid == scheduleData[i].h.tid ? "HOME" : "AWAY",
                            gameStatus: scheduleData[i].st
                        )
                        self.gameCardData.append(gameData)
                    }
                case 3:
                    DispatchQueue.main.async {
                        let gameData = GameCardDataModel(
                            gameDataCard: gameData.past_game_card,
                            visitorTeamLogo: visitorTeamLogo[i],
                            visitorTeamName: scheduleData[i].v.ta,
                            visitorTeamScore: scheduleData[i].v.s,
                            homeTeamLogo: homeTeamLogo[i],
                            homeTeamName: scheduleData[i].h.ta,
                            homeTeamScore: scheduleData[i].h.s,
                            displayVs: scheduleData[i].h.tid == self.tid,
                            gameTime: scheduleData[i].gametime,
                            gameHomeOrAwat: self.tid == scheduleData[i].h.tid ? "HOME" : "AWAY",
                            gameStatus: scheduleData[i].st
                        )
                        self.gameCardData.append(gameData)
                    }
                default:
                    break
                }
            }
        }
    }
    
}
