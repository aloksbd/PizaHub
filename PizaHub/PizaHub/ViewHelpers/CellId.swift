//
//  CellId.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import UIKit

extension UICollectionViewCell {
    static var cellId: String {
        String(describing: self)
    }
}

extension UITableViewCell {
    static var cellId: String {
        String(describing: self)
    }
}
