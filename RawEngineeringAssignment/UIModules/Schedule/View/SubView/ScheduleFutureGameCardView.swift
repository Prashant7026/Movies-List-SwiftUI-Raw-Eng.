//
//  ScheduleFutureGameCardView.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 30/11/24.
//

import SwiftUI

struct ScheduleFutureGameCardView: View {
    var scheduleData: Schedule
    var visitorTeamLogo: String
    var homeTeamLogo: String
    let tid = "1610612748"
    
    var body: some View {
        VStack{
            Group{
                HStack{
                    if !scheduleData.h.tid.isEmpty{
                        Text(tid == scheduleData.h.tid ? "AWAY" : "HOME")
                        Divider()
                            .frame(width: 2.0, height: 20.0)
                            .background(Color(red: 87.0 / 255.0, green: 93.0 / 255.0, blue: 99.0 / 255.0))
                    }
                    Text(ConvertDateIntoEEMMDD.getDateInEEMMDD(scheduleData.gametime))
                    if scheduleData.stt?.count ?? 0 >= 1{
                        Divider()
                            .frame(width: 2.0, height: 20.0)
                            .background(Color(red: 87.0 / 255.0, green: 93.0 / 255.0, blue: 99.0 / 255.0))
                        Text(scheduleData.stt ?? "")
                            .textCase(.uppercase)
                    }
                }
                .foregroundColor(Color.white)
                
                HStack{
                    if !visitorTeamLogo.isEmpty{
                        StringToImageView(imageString: visitorTeamLogo)
                            .frame(width: 60)
                            .aspectRatio(1.1, contentMode: .fit)
                    } else {
                        Text("Null")
                    }
                    Spacer()
                    if scheduleData.v.ta.count >= 1{
                        Text(scheduleData.v.ta)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    Text(tid == scheduleData.h.tid ? "VS" : "@")
                        .foregroundColor(Color.white)
                    Spacer()
                    if scheduleData.h.ta.count >= 1{
                        Text(scheduleData.h.ta)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    if !homeTeamLogo.isEmpty{
                        StringToImageView(imageString: homeTeamLogo)
                            .frame(width: 60)
                            .aspectRatio(1.1, contentMode: .fit)
                    } else {
                        Text("Null")
                    }
                }
            }
            .padding(.horizontal, 50.0)
            
            Capsule()
                .fill(Color.white)
                .frame(maxWidth: .infinity)
                .overlay{
                    Text("BUY TICKETS ON ticketmaster")
                        .foregroundColor(Color.black)
                }
                .frame(height: 35.0)
                .padding(.horizontal, 30.0)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16.0)
        .background(Color(red: 39.0 / 255.0, green: 45.0 / 255.0, blue: 51.0 / 255.0))
    }
}

//#Preview {
//    ScheduleFutureGameCardView()
//}
