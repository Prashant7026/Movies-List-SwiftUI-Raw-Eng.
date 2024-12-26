//
//  ScheduleView.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 28/11/24.
//

import SwiftUI

struct ScheduleView: View {
    @ObservedObject var viewModel: ScheduleViewModel
    @State private var currentMonth: String? = "Nov 2000"
    
    init(viewModel: ScheduleViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader{ geometry in
            VStack(spacing: 0.0){
                headerView()
                ScrollView {
                    VStack(spacing: 16.0){
                        if let scheduleData = viewModel.scheduleData, let visitorTeamLogo = viewModel.visitorTeamLogo, let homeTeamLogo = viewModel.homeTeamLogo{
                            ForEach(scheduleData.indices) { index in
                                GeometryReader { geometry in
                                    Group{
                                        switch scheduleData[index].st {
                                        case 1:
                                            ScheduleFutureGameCardView(scheduleData: scheduleData[index], visitorTeamLogo: visitorTeamLogo[index], homeTeamLogo: homeTeamLogo[index])
                                        case 2:
                                            ScheduleLiveGameCardView(scheduleData: scheduleData[index], visitorTeamLogo: visitorTeamLogo[index], homeTeamLogo: homeTeamLogo[index])
                                        case 3:
                                            SchedulePastGameCardView(scheduleData: scheduleData[index], visitorTeamLogo: visitorTeamLogo[index], homeTeamLogo: homeTeamLogo[index])
                                        default:
                                            Text("Game st is not present")
                                        }
                                    }
                                    .cornerRadius(20.0)
                                    .id(index)
                                    .onChange(of: geometry.frame(in: .global).minY) { minY in
                                        let screenHeight = UIScreen.main.bounds.height
                                        if minY > screenHeight * 0.2 && minY < screenHeight * 0.8 {
                                            self.currentMonth = viewModel.monthIndexMap[index]
                                        }
                                    }
                                }
                                .frame(height: 150)
                            }
                        } else {
                            ProgressView()
                        }
                    }
                    .padding(.horizontal, 16.0)
                    .padding(.vertical, 16.0)
                }
            }
        }
        .onAppear{
            self.currentMonth = viewModel.monthIndexMap.first
        }
    }
    
    private func headerView() -> some View{
        HStack(spacing: 16.0){
            Image(systemName: "chevron.up")
            Text("\(currentMonth ?? "")")
            Image(systemName: "chevron.down")
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16.0)
        .background(Color(red: 39.0 / 255.0, green: 45.0 / 255.0, blue: 51.0 / 255.0))
    }
}
