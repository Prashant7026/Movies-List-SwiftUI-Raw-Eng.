//
//  ContentViewModel.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 28/11/24.
//

import Foundation
import SwiftUI

class ScheduleViewModel: ObservableObject {
    @Published var scheduleData: [Schedule]?
    var teamData: [Team]?
    @Published var visitorTeamLogo: [String]? = []
    @Published var homeTeamLogo: [String]? = []
    @Published var monthIndexMap: [String] = []
    
    var gamesViewModel = GamesViewModel()
    
    init(scheduleData: [Schedule]? = nil, teamData: [Team]? = nil) {
        self.scheduleData = scheduleData
        self.teamData = teamData
        arrangeData()
    }
    
    func arrangeData(){
        sortDataBasedOnTime()
        mapMonthsToIndices()
        getAllTeamLogos()
        
        gamesViewModel.updateGameData(scheduleData: scheduleData ?? [], visitorTeamLogo: visitorTeamLogo ?? [], homeTeamLogo: homeTeamLogo ?? [])
    }
    
    private func sortDataBasedOnTime(){
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        scheduleData?.sort { schedule1, schedule2 in
            guard
                let date1 = dateFormatter.date(from: schedule1.gametime),
                let date2 = dateFormatter.date(from: schedule2.gametime)
            else {
                return false
            }
            return date1 < date2
        }
    }
    
    private func mapMonthsToIndices() {
        guard let scheduleData = scheduleData else { return }
        
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        for (index, schedule) in scheduleData.enumerated() {
            if let date = isoFormatter.date(from: schedule.gametime) {
                let monthYear = dateFormatter.string(from: date)
                self.monthIndexMap.append(monthYear)
            }
        }
    }
    
    private func getAllTeamLogos(){
        if let scheduleData = scheduleData, let teamData = teamData{
            for i in scheduleData{
                for j in teamData{
                    if i.v.tid == j.tid{
                        visitorTeamLogo?.append(j.logo ?? "")
                    }
                    if i.h.tid == j.tid{
                        homeTeamLogo?.append(j.logo ?? "")
                    }
                }
            }
        }
    }
}
