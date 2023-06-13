//  GyroData - Data.swift
//  created by vetto on 2023/06/13

import Foundation

struct MoveData: Hashable {
    let id = UUID()
    let moveType: MoveType
    let createDate: Date
    let time: Double
}
