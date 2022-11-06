//
//  TargetDate.swift
//  CountDown
//
//  Created by Klaus Fischer on 05.11.22.
//

import Foundation


struct TargetDate: Identifiable, Codable{
    var id: UUID = UUID()
    let date: Date
    let title: String
}


extension Date {
    public func setTime(hour: Int, min: Int, sec: Int, timeZoneAbbrev: String = "UTC") -> Date {
        let x: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        let cal = Calendar.current
        var components = cal.dateComponents(x, from: self)

        components.timeZone = TimeZone(abbreviation: timeZoneAbbrev)
        components.hour = hour
        components.minute = min
        components.second = sec

        return cal.date(from: components) ?? self
    }
    
    public func getDaysBetweenToday() -> Int{
        let result = self.setTime(hour: 0, min: 0, sec: 0).timeIntervalSinceNow
        return Int(ceil(result / (3600 * 24)))
    }

}
