//
//  ScheduleModel.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 29/11/24.
//

import Foundation

struct ScheduleModel: Decodable {
    let data: ScheduleModelDataClass
}

struct ScheduleModelDataClass: Decodable {
    let schedules: [Schedule]
}

struct Schedule: Identifiable, Decodable {
    var id: UUID = UUID()
    
    let uid: String
    let year: Int
    let league_id, season_id, gid, gcode: String
    let seri: Seri
    let is_game_necessary, gametime: String
    let cl: String
    let arena_name, arena_city, arena_state: String
    let st: Int
    let stt: String?
    let ppdst: String
    let buy_ticket: String?
    let buy_ticket_url: String?
    let logo_url: String?
    let hide: Bool
    let game_state: String
    let game_subtype: String?
    let h, v: H
    
    private enum CodingKeys: String, CodingKey {
        case uid, year, league_id, season_id, gid, gcode, seri, is_game_necessary, gametime, cl,
             arena_name, arena_city, arena_state, st, stt, ppdst, buy_ticket, buy_ticket_url,
             logo_url, hide, game_state, game_subtype, h, v
    }
}

struct H: Decodable {
    let tid, re, ta, tn: String
    let tc: String
    let s: String?
    let ist_group: String?
}

enum Seri: String, Decodable {
    case empty = ""
    case seriesTied11 = "Series tied 1-1"
}
