//
//  TargetDate.swift
//  CountDown
//
//  Created by Klaus Fischer on 05.11.22.
//

import Foundation


struct TargetDate: Identifiable, Codable{
    let id: UUID = UUID()
    let date: Date
    let title: String
}
