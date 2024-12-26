//
//  UpcomingCardViewCell.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 29/11/24.

import SwiftUI

struct UpcomingCardViewCell: View {
    @State var cardData: GameCardDataModel?
    
    var body: some View {
        ZStack {
            
            StringToImageView(imageString: cardData?.gameDataCard?.background_image.url)

            VStack{
                topView()
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                bottomView()
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
    
    private func topView() -> some View{
        VStack(alignment: .leading, spacing: 8.0){
            HStack {
                StringToImageView(imageString: cardData?.visitorTeamLogo)
                    .frame(width: 40)
                    .aspectRatio(1.1, contentMode: .fit)
                StringToImageView(imageString: cardData?.homeTeamLogo)
                    .frame(width: 40)
                    .aspectRatio(1.1, contentMode: .fit)
            }
            HStack{
                if cardData?.visitorTeamName?.count ?? 0 >= 1{
                    Text(cardData?.visitorTeamName ?? "")
                        .foregroundColor(cardData?.gameHomeOrAwat == "HOME" ? Color.white : Color.black)
                }
                Text(cardData?.displayVs ?? false ? "VS" : "@")
                    .foregroundColor(cardData?.gameHomeOrAwat == "HOME" ? Color.white : Color.black)
                if cardData?.homeTeamName?.count ?? 0 >= 1{
                    Text(cardData?.homeTeamName ?? "")
                        .foregroundColor(cardData?.gameHomeOrAwat == "HOME" ? Color.white : Color.black)
                }
            }
            .font(.system(size: 20))
            .bold()
            .italic()
            .foregroundColor(Color.black)
            HStack{
                Text(cardData?.gameHomeOrAwat ?? "")
                    .foregroundColor(cardData?.gameHomeOrAwat == "HOME" ? Color.white : Color.black)
                
                if cardData?.gameTime?.count ?? 0 >= 1{
                    Divider()
                        .frame(width: 2.0, height: 15.0)
                        .background(Color(red: 87.0 / 255.0, green: 93.0 / 255.0, blue: 99.0 / 255.0))
                    displayDate(cardData?.gameTime ?? "")
                        .foregroundColor(cardData?.gameHomeOrAwat == "HOME" ? Color.white : Color.black)
                }
                Divider()
                    .frame(width: 2.0, height: 15.0)
                    .background(Color(red: 87.0 / 255.0, green: 93.0 / 255.0, blue: 99.0 / 255.0))
                
                displayTime(cardData?.gameTime ?? "")
                    .foregroundColor(cardData?.gameHomeOrAwat == "HOME" ? Color.white : Color.black)
            }
            .font(.system(size: 10))
            .foregroundColor(Color.black)
        }
        .padding(.top, 16.0)
        .padding(.leading, 16.0)
    }
    
    private func bottomView() -> some View{
        VStack{
            HStack{
                timeUnitView("02", "DAYS")
                Divider()
                    .frame(width: 2.0, height: 60.0)
                    .background(Color(red: 87.0 / 255.0, green: 93.0 / 255.0, blue: 99.0 / 255.0))
                
                timeUnitView("21", "HRS")
                
                Divider()
                    .frame(width: 2.0, height: 60.0)
                    .background(Color(red: 87.0 / 255.0, green: 93.0 / 255.0, blue: 99.0 / 255.0))
                
                timeUnitView("57", "MIN")
                
            }
            .padding(.horizontal, 16.0)
            .background(Color.gray)
            .cornerRadius(16.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            if cardData?.gameHomeOrAwat == "HOME"{
                Capsule()
                    .fill(Color.white)
                    .frame(maxWidth: .infinity)
                    .overlay{
                        Text("BUY TICKETS ON")
                            .foregroundColor(Color.black)
                    }
                    .frame(height: 35.0)
            }
        }
        .padding(.horizontal, 20.0)
        .padding(.bottom, 16.0)
    }
    
    private func displayDate(_ date: String) -> some View {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE MMM dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        let formattedDate: String
        if let parsedDate = isoFormatter.date(from: date) {
            formattedDate = dateFormatter.string(from: parsedDate)
        } else {
            formattedDate = "Invalid Date"
        }
        
        return Text(formattedDate)

    }
    
    private func displayTime(_ date: String) -> some View {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        let formattedDate: String
        if let parsedDate = isoFormatter.date(from: date) {
            formattedDate = dateFormatter.string(from: parsedDate)
        } else {
            formattedDate = "Invalid Date"
        }
        
        return Text(formattedDate)
    }
    
    private func timeUnitView(_ str1: String, _ str2: String) -> some View {
        VStack {
            Text(str1)
                .foregroundColor(.white)
            Text(str2)
                .foregroundColor(Color(red: 87.0 / 255.0, green: 93.0 / 255.0, blue: 99.0 / 255.0))
        }
    }

}
