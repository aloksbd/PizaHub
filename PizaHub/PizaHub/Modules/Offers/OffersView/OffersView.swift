//
//  OffersView.swift
//  PizaHub
//
//  Created by alok subedi on 21/08/2021.
//

import UIKit
import RxSwift
import RxCocoa

final class OffersView: UIView {
    private lazy var bubbleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: BubbleCell.selectedSize, height: BubbleCell.selectedSize)
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BubbleCell.self, forCellWithReuseIdentifier: BubbleCell.cellId)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(OffersCell.self, forCellWithReuseIdentifier: OffersCell.cellId)
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var bubbleCollectionViewWidthAnchor: NSLayoutConstraint!
    private let disposeBag = DisposeBag()
    private var presenter: OffersPresenter!
}

extension OffersView {
    convenience init(presenter: OffersPresenter) {
        self.init(frame: .zero)
        self.presenter = presenter
        addViews()
        
        bindOffersToCollectionView()
        bindOffersToBubbleCollectionView()
        bindCollectionViewItemToBubbleCollectionViewItem()
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    private func bindOffersToCollectionView() {
        presenter.offers.asObservable().bind(to: collectionView.rx.items(cellIdentifier: OffersCell.cellId, cellType: OffersCell.self)
        ) { item, offer, cell in
            cell.imageView.image = offer.image
        }.disposed(by: disposeBag)
    }
    
    private func bindOffersToBubbleCollectionView() {
        presenter.offers.asObservable().bind(to: bubbleCollectionView.rx.items(cellIdentifier: BubbleCell.cellId, cellType: BubbleCell.self)
        ) { _,_,_ in }.disposed(by: disposeBag)

        presenter.offers.asObservable().bind { _ in
            self.selectBubble(at: 0)
        }.disposed(by: disposeBag)
    }
    
    private func bindCollectionViewItemToBubbleCollectionViewItem() {
        collectionView.rx.didEndDecelerating.subscribe { _ in
            let x = self.collectionView.contentOffset.x
            let w = self.collectionView.bounds.size.width
            let currentPage = Int(x/w)
            self.selectBubble(at: currentPage)
        }.disposed(by: disposeBag)
    }
    
    private func selectBubble(at item: Int) {
        self.bubbleCollectionView.selectItem(at: IndexPath(item: item, section: 0), animated: false, scrollPosition: .centeredHorizontally)
    }
}

extension OffersView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width, height: bounds.height)
    }
}

extension OffersView {
    private func addViews() {
        addSubview(collectionView)
        addSubview(bubbleCollectionView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        bubbleCollectionViewWidthAnchor = bubbleCollectionView.widthAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            bubbleCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bubbleCollectionView.heightAnchor.constraint(equalToConstant: BubbleCell.selectedSize),
            bubbleCollectionViewWidthAnchor,
            bubbleCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}

