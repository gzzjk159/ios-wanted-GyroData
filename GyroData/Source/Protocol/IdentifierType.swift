//  GyroData - IdentifierType.swift
//  created by vetto on 2023/06/13

import UIKit

public protocol IdentifierType {
    static var identifier: String { get }
}

extension IdentifierType {
    public static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: IdentifierType {}
extension UIViewController: IdentifierType {}
