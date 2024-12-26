//
//  ScheduleLiveGameCardView.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 30/11/24.
//

import SwiftUI

struct ScheduleLiveGameCardView: View {
    var scheduleData: Schedule
    var visitorTeamLogo: String
    var homeTeamLogo: String
    let tid = "1610612748"
    
    var body: some View {
        VStack{
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
                VStack(spacing: 6.0){
                    if !visitorTeamLogo.isEmpty{
                        StringToImageView(imageString: visitorTeamLogo)
                            .frame(width: 60)
                            .aspectRatio(1.1, contentMode: .fit)
                    } else {
                        Text("Null")
                    }
                    Text(scheduleData.v.ta)
                        .foregroundColor(Color.white)
                }
                VStack{
                    Text("LIVE")
                        .foregroundColor(Color.white)
                        .padding(.vertical, 4.0)
                        .padding(.horizontal, 8.0)
                        .background(Color(red: 25.0 / 255.0, green: 27.0 / 255.0, blue: 29.0 / 255.0))
                        .cornerRadius(10.0)
                    HStack{
                        Spacer()
                        if let s = scheduleData.v.s{
                            Text(s)
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                        Text(tid == scheduleData.h.tid ? "VS" : "@")
                            .foregroundColor(Color.white)
                        Spacer()
                        if let s = scheduleData.h.s{
                            Text(s)
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                    }
                }
                VStack(spacing: 6.0){
                    if !homeTeamLogo.isEmpty{
                        StringToImageView(imageString: homeTeamLogo)
                            .frame(width: 60)
                            .aspectRatio(1.1, contentMode: .fit)
                    } else {
                        Text("Null")
                    }
                    Text(scheduleData.h.ta)
                        .foregroundColor(Color.white)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 50.0)
        .padding(.vertical, 16.0)
        .background(Color(red: 39.0 / 255.0, green: 45.0 / 255.0, blue: 51.0 / 255.0))
    }
}

//#Preview {
//    ScheduleLiveGameCardView()
//}
