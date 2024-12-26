//
//  GameCardModel.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 28/11/24.
//

import Foundation

struct Welcome: Decodable {
    let entry: GameModel
}

struct GameModel: Decodable {
    let title: String
    let game_card_config: GameCardConfig
    let past_game_card, upcoming_game, future_game: FutureGame
    let tags: [String]
    let locale, uid, created_by, updated_by: String
    let created_at, updated_at: String
    let ACL: ACL
    let _version: Int
    let _in_progress: Bool
    let promotion_cards: [PromotionCard]
    let publish_details: [PublishDetail]
}

struct ACL: Decodable {
    // Define the structure if ACL has any fields
}

struct FutureGame: Decodable {
    let background_image: BackgroundImage
    let button: Button
}

struct BackgroundImage: Decodable {
    let uid, created_at, updated_at, created_by: String
    let updated_by, content_type, file_size: String
    let tags: [String]
    let filename: String
    let url: String
    let ACL: [String]
    let is_dir: Bool
    let parent_uid: String
    let _version: Int
    let title: String
    let dimension: Dimension
    let publish_details: [PublishDetail]
}

struct Dimension: Decodable {
    let height, width: Int
}

struct PublishDetail: Decodable {
    let environment, locale, time, user: String
    let version: Int
}

struct Button: Decodable {
    let cta_text: String
    let icons: Icons
    let cta_link: String
}

struct Icons: Decodable {
    let leading_icon: BackgroundImage?
    let trailing_icon: BackgroundImage?
}

struct GameCardConfig: Decodable {
    let focus_card, future_game_count, past_game_count: Int
}

struct PromotionCard: Decodable {
    let position: Int
    let _metadata: Metadata
    let card: [Card]
}

struct Card: Decodable {
    let uid, _content_type_uid: String
}

struct Metadata: Decodable {
    let uid: String
}
