//
//  ContentView.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 28/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var network: Networking = Networking()
    @State var selectedTab: Int = 0
    @State var isLoading: Bool = true

    var body: some View {
        VStack(spacing: 0.0){
            if isLoading{
                ProgressView("Loading Data...")
                    .padding()
            } else {
                HeaderView(selectedTab: $selectedTab)
                    .background(Color.black)
                switch selectedTab{
                case 0:
                    if let scheduleData = network.scheduleData, let teamData = network.teamsData {
                        Router.getScheduleView(scheduleData: scheduleData, teamData: teamData)
                            .background(Color.black)
                    } else {
                        Text("No schedule data available.")
                    }
                case 1:
                    if let scheduleData = network.scheduleData, let teamData = network.teamsData, let gameData = network.gameCardData {
                        Router.getGameView(scheduleData: scheduleData, teamData: teamData, gameData: gameData)
                            .background(Color.black)
                    } else {
                        Text("No Game data available.")
                    }
                default:
                    Text("Break")
                }
                Spacer()
            }
        }
        .task {
            await loadAllData()
            isLoading = false
        }
    }
    
    private func loadAllData() async {
        do {
            async let allDataFetch = network.fetchAllData()
            
            try await allDataFetch
        } catch {
            print("Error loading data: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
