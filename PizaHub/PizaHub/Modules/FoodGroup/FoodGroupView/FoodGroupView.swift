//
//  FoodGroupView.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import UIKit
import RxCocoa
import RxSwift

final class FoodGroupView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FoodGroupCell.self, forCellWithReuseIdentifier: FoodGroupCell.cellId)
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var bubbleCollectionViewWidthAnchor: NSLayoutConstraint!
    private let disposeBag = DisposeBag()
    
    private var presenter: FoodGroupPresenter!
    
}

extension FoodGroupView {
    convenience init(presenter: FoodGroupPresenter) {
        self.init(frame: .zero)
        self.presenter = presenter
        addViews()
        
        bindFoodGroupsToCollectionView()
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    private func bindFoodGroupsToCollectionView() {
        presenter.foodGroups.asObservable().bind(to: collectionView.rx.items(cellIdentifier: FoodGroupCell.cellId, cellType: FoodGroupCell.self)
        ) { item, group, cell in
            cell.foodListView = group.foodListView
        }.disposed(by: disposeBag)
    }
}

extension FoodGroupView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width, height: bounds.height)
    }
}

extension FoodGroupView {
    private func addViews() {
        addSubview(collectionView)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
