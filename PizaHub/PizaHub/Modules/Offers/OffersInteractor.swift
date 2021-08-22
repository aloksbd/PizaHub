//
//  OffersInteractor.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import Foundation
import RxCocoa
import RxSwift

final class OffersInteractor {
    private var loader: OffersLoader!
    private var presenter: OffersPresenter!
    private let url = URL(string: "https://url.com")!
    private let disposeBag = DisposeBag()
    private var offers = BehaviorRelay(value: [OffersEntity]())
    
    func loadOffers() {
        loader.load(from: url).subscribe { offers in
            self.offers.accept(offers)
        }.disposed(by: disposeBag)
    }
    
    init(presenter: OffersPresenter, loader: OffersLoader) {
        self.loader = loader
        self.presenter = presenter
        offers.asObservable().subscribe (onNext: { [weak self] offers in
            self?.presenter.offers.accept(offers.map { PresentableOffers(data: $0.imageData) })
        }).disposed(by: disposeBag)
    }
}
