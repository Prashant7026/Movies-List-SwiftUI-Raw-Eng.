//
//  GamesView.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 28/11/24.
//

import SwiftUI

struct GamesView: View {
    @StateObject var viewModel: GamesViewModel
    var gameData: GameModel?
    @State private var showPastCardCount: Int = 0
    @State private var showUpcomingCardCount: Int = 0
    @State private var showFutureCardCount: Int = 0
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 16.0) {
                    ForEach(viewModel.gameCardData.filter { $0.gameStatus == 3 }.prefix(showPastCardCount)) { gameCardData in
                        PastGameCardViewCell(cardData: gameCardData)
                            .frame(width: 320.0, height: 320.0)
                    }
                    ForEach(viewModel.gameCardData.filter { $0.gameStatus == 2 }.prefix(showUpcomingCardCount)) { gameCardData in
                        UpcomingCardViewCell(cardData: gameCardData)
                            .frame(width: 320.0, height: 320.0)
                    }
                    ForEach(viewModel.gameCardData.filter { $0.gameStatus == 1 }.prefix(showFutureCardCount)) { gameCardData in
                        UpcomingCardViewCell(cardData: gameCardData)
                            .frame(width: 320.0, height: 320.0)
                    }
                }
            }
            .padding(.top, 16.0)
            Spacer()
        }
        .task {
            initializeCardCounts()
            viewModel.gameData = self.gameData
            viewModel.getGameCardsData()
        }
    }
    
    private func initializeCardCounts() {
        showPastCardCount = gameData?.game_card_config.past_game_count ?? 0
        showUpcomingCardCount = gameData?.game_card_config.focus_card ?? 0
        showFutureCardCount = gameData?.game_card_config.future_game_count ?? 0
    }
}

//#Preview {
//    GamesView()
//}
