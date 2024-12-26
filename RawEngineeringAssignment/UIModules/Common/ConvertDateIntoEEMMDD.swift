//
//  ConvertDateIntoEEMMDD.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 30/11/24.
//

import Foundation

class ConvertDateIntoEEMMDD{
    class func getDateInEEMMDD(_ dateString: String) -> String{
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        if let date = isoFormatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEE MMM dd"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            return "Invalid date format"
        }
    }
}
