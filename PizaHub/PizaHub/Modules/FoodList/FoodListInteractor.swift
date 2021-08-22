//
//  FoodListInteractor.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import Foundation
import RxCocoa
import RxSwift

final class FoodListInteractor {
    private var loader: FoodListLoader!
    private var presenter: FoodListPresenter!
    private let url = URL(string: "https://url.com")!
    private let disposeBag = DisposeBag()
    private var foods = BehaviorRelay(value: [FoodListEntity]())
    
    func loadFoods() {
        loader.load(from: url).subscribe { foods in
            self.foods.accept(foods)
        }.disposed(by: disposeBag)
    }
    
    init(presenter: FoodListPresenter, loader: FoodListLoader) {
        self.loader = loader
        self.presenter = presenter
        foods.asObservable().subscribe (onNext: { [weak self] foods in
            self?.presenter.foods.accept(foods.map {
                let stringForWeightPieceAndSize = "\($0.weight) gms " + ($0.size != nil ? "\($0.size ?? 0) cms" : "\($0.pieces ?? 0) cms")
                return PresentableFoods(name: $0.name, description: $0.description, image: UIImage(data: $0.imageData)!, weight: stringForWeightPieceAndSize, price: String($0.price))
            })
        }).disposed(by: disposeBag)
    }
}
