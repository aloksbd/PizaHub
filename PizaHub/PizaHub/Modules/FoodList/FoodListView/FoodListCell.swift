//
//  FoodListCell.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import UIKit

final class FoodListCell: UITableViewCell {
    private func createLabel(font: UIFont = UIFont.systemFont(ofSize: 16), textColor: UIColor = .darkText, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createCardView(clipsToBounds: Bool) -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.3
        view.clipsToBounds = clipsToBounds
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private lazy var cardView = createCardView(clipsToBounds: true)
    private lazy var shadowView = createCardView(clipsToBounds: false)
    
    lazy var foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel = createLabel(font: UIFont.systemFont(ofSize: 32, weight: .semibold))
    
    lazy var descriptionLabel = createLabel(textColor: .gray, numberOfLines: 0)
    
    lazy var weightLabel = createLabel(textColor: .gray)
    
    lazy var priceButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(highlight), for: .touchDown)
        button.addTarget(self, action: #selector(unHighlight), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var priceButtonText: String? {
        didSet {
            priceButton.setTitle(priceButtonText, for: .normal)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        enableButtonInteraction()
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FoodListCell {
    private func enableButtonInteraction() {
        contentView.isUserInteractionEnabled = true
    }
    
    @objc private func highlight() {
        priceButton.backgroundColor = #colorLiteral(red: 0.1732313249, green: 0.6455482536, blue: 0.133341009, alpha: 1)
        priceButton.setTitle("added + 1", for: .normal)
    }
    
    @objc private func unHighlight() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.priceButton.setTitle(self.priceButtonText, for: .normal)
            UIView.animate(withDuration: 0.5) {
                self.priceButton.backgroundColor = .black
            }
        }
    }
}

extension FoodListCell {
    private func addViews() {
        addSubview(shadowView)
        addSubview(cardView)
        [foodImageView, nameLabel, descriptionLabel, weightLabel, priceButton].forEach { cardView.addSubview($0) }
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

            foodImageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            foodImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            foodImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            foodImageView.heightAnchor.constraint(equalToConstant: 300),

            nameLabel.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),

            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),

            weightLabel.centerYAnchor.constraint(equalTo: priceButton.centerYAnchor),
            weightLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),

            priceButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            priceButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            priceButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20)
        ])
    }
}
