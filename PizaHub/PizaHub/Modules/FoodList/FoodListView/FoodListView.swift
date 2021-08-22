//
//  FoodListView.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import UIKit
import RxSwift
import RxCocoa

final class FoodListView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FoodListCell.self, forCellReuseIdentifier: FoodListCell.cellId)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let disposeBag = DisposeBag()
    private var presenter: FoodListPresenter!
}

extension FoodListView {
    convenience init(presenter: FoodListPresenter) {
        self.init(frame: .zero)
        self.presenter = presenter
        
        addView()
        bindFoodsToTableView()
    }
}

extension FoodListView {
    private func bindFoodsToTableView() {
        presenter.foods.asObservable().bind(to: tableView.rx.items(cellIdentifier: FoodListCell.cellId, cellType: FoodListCell.self)
        ) { item, food, cell in
            cell.foodImageView.image = food.image
            cell.nameLabel.text = food.name
            cell.descriptionLabel.text = food.description
            cell.weightLabel.text = food.weight
            cell.priceButtonText = food.price
        }.disposed(by: disposeBag)
    }
}

extension FoodListView {
    private func addView() {
        addSubview(tableView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
