//
//  NavigationRouter.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 30/11/24.
//

class Router {
    
    class func getScheduleView(scheduleData: [Schedule], teamData: [Team]) -> ScheduleView{
        let viewModel = Router.getScheduleViewModel(scheduleData, teamData)
        return ScheduleView(viewModel: viewModel)
    }
    
    class func getGameView(scheduleData: [Schedule], teamData: [Team], gameData: GameModel) -> GamesView{
        let VM = Router.getGameViewModel(gameData)
        let viewModel = Router.getScheduleViewModel(scheduleData, teamData)
        return GamesView(viewModel: viewModel.gamesViewModel, gameData: gameData)
    }
    
}

extension Router {
    class func getScheduleViewModel(_ scheduleData: [Schedule], _ teamData: [Team]) -> ScheduleViewModel {
        return ScheduleViewModel(scheduleData: scheduleData, teamData: teamData)
    }
    class func getGameViewModel(_ gamedata: GameModel) -> GamesViewModel {
        return GamesViewModel(gameData: gamedata)
    }
}
