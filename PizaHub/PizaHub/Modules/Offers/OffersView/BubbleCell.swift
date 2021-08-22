//
//  BubbleCell.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import UIKit

final class BubbleCell: UICollectionViewCell {
    static let selectedSize: CGFloat = 10
    private let deselectedSize: CGFloat = 7
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var width: NSLayoutConstraint!
    private var height: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addImageView()
        deselect()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BubbleCell {
    override var isSelected: Bool {
        didSet {
            isSelected ? select() : deselect()
        }
    }
    
    private func select() {
        changeImageViewSize(size: Self.selectedSize)
    }
    
    private func deselect() {
        changeImageViewSize(size: deselectedSize)
    }
    
    private func changeImageViewSize(size: CGFloat) {
        UIView.animate(withDuration: 0.5) {
            self.width.constant = size
            self.height.constant = size
            self.imageView.layer.cornerRadius = size/2
            self.layoutIfNeeded()
        }
    }
}

extension BubbleCell {
    private func addImageView() {
        addSubview(imageView)
        setConstraints()
    }
    
    private func setConstraints() {
        setWidthAndHeightConstraints()
        NSLayoutConstraint.activate([
            width,
            height,
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setWidthAndHeightConstraints() {
        width = imageView.widthAnchor.constraint(equalToConstant: deselectedSize)
        height = imageView.heightAnchor.constraint(equalToConstant: deselectedSize)
    }
}
