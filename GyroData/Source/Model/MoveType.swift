//  GyroData - MoveType.swift
//  created by vetto on 2023/06/13

enum MoveType {
    case accelerometer
    case gyro
    
    var description: String {
        switch self {
        case .accelerometer:
            return "Accelerometer"
        case .gyro:
            return "Gyro"
        }
    }
}
