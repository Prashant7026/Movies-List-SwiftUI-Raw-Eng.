//
//  PastGameCardViewCell.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 29/11/24.
//

import SwiftUI

struct PastGameCardViewCell: View {
    @State var cardData: GameCardDataModel?
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            StringToImageView(imageString: cardData?.gameDataCard?.background_image.url)
            
            VStack{
                HStack{
                    
                    teamLogoAndName(cardData?.visitorTeamLogo, cardData?.visitorTeamName)
                    
                    Spacer()
                    if let score = cardData?.visitorTeamScore{
                        Text(score)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    if let displayVs = cardData?.displayVs{
                        Text(displayVs ? "VS" : "@")
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    if let score = cardData?.homeTeamScore{
                        Text("102")
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    
                    teamLogoAndName(cardData?.homeTeamLogo, cardData?.homeTeamName)
                }
                .padding(.horizontal, 36.0)
                Capsule()
                    .fill(Color.yellow)
                    .frame(maxWidth: .infinity)
                    .overlay{
                        Text(cardData?.gameDataCard?.button.cta_text ?? "Game")
                            .foregroundColor(Color.black)
                    }
                    .frame(height: 35.0)
                    .padding(.horizontal, 20.0)
            }
            .padding(.bottom, 16.0)
        }
    }
    
    private func teamLogoAndName(_ logo: String? = nil, _ name: String? = nil) -> some View{
        VStack(spacing: 6.0){
            if logo?.count ?? 0 >= 1{
                StringToImageView(imageString: logo)
                    .frame(width: 60)
                    .aspectRatio(1.1, contentMode: .fit)
            } else {
                Text("Null")
            }
            if name?.count ?? 0 >= 1{
                Text(name ?? "")
                    .foregroundColor(Color.white)
            }
        }
    }
}
