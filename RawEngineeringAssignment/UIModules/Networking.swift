//
//  Networking.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 30/11/24.
//

import Foundation

class Networking: ObservableObject{
    @Published var scheduleData: [Schedule]?
    @Published var gameCardData: GameModel?
    @Published var teamsData: [Team]?
    
    func fetchAllData() async throws {
        try await withThrowingTaskGroup(of: Void.self) { group in
            group.addTask { try await self.fetchScheduleData() }
            group.addTask { try await self.fetchGameCardData() }
            group.addTask { try await self.fetchTeamsData() }
            
            try await group.waitForAll()
        }
    }
    
    private func fetchScheduleData() async throws {
        guard let fileURL = Bundle.main.url(forResource: "Schedule", withExtension: "json") else {
            print("File not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let decodeData = try JSONDecoder().decode(ScheduleModel.self, from: data)
            
            DispatchQueue.main.async {
                self.scheduleData = decodeData.data.schedules
            }
            
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    private func fetchGameCardData() async throws {
        guard let fileURL = Bundle.main.url(forResource: "Game Card Data", withExtension: "json") else {
            print("File not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let decodeData = try JSONDecoder().decode(Welcome.self, from: data)
            
            DispatchQueue.main.async {
                self.gameCardData = decodeData.entry
            }
            
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    private func fetchTeamsData() async throws {
        guard let fileURL = Bundle.main.url(forResource: "teams", withExtension: "json") else {
            print("File not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let decodeData = try JSONDecoder().decode(TeamsModel.self, from: data)
            
            DispatchQueue.main.async {
                self.teamsData = decodeData.data.teams
            }
            
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
