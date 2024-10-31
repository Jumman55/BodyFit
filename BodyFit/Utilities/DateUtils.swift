//
//  DateUtils.swift
//  BodyFit
//
//  Created by Jumman Hossen on 31/10/24.
//

import Foundation

struct DateUtils {
    /// Returns the current date as a string in "YYYY-MM-DD" format
    static func currentDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"  // Ensure it matches `DietEntry.date` format
        return formatter.string(from: Date())
    }
    
    /// Converts a date string in "YYYY-MM-DD" format to a human-readable day name
    static func dayName(from dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "EEEE"
            return formatter.string(from: date)
        }
        return ""
    }
}
