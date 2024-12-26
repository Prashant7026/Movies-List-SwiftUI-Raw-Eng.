//
//  TeamsModel.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 29/11/24.
//

import Foundation

struct TeamsModel: Decodable {
    let data: TeamsModelDataClass
}

struct TeamsModelDataClass: Decodable {
    let teams: [Team]
}

struct Team: Decodable {
    let uid: String
    let year: Int
    let league_id, season_id, ist_group, tid: String
    let tn, ta, tc, di: String
    let co: String
    let sta: String
    let logo: String?
    let color: String
}
