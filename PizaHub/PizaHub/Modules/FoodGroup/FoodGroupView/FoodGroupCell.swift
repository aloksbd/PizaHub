//
//  FoodGroupCell.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import UIKit

final class FoodGroupCell: UICollectionViewCell {
    var foodListView = UIView() {
        didSet {
            addView()
        }
    }
    
    private func addView() {
        addSubview(foodListView)
        setConstraints()
    }
    
    private func setConstraints() {
        foodListView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodListView.topAnchor.constraint(equalTo: topAnchor),
            foodListView.leadingAnchor.constraint(equalTo: leadingAnchor),
            foodListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            foodListView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
