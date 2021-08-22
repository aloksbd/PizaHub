//
//  FoodGroupInteractor.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import RxSwift
import RxCocoa

final class FoodGroupInteractor {
    private var loader: FoodGroupLoader!
    private var presenter: FoodGroupPresenter!
    private let disposeBag = DisposeBag()
    private var groups = BehaviorRelay(value: [FoodGroupEntity]())
    
    func loadFoods() {
        loader.load().subscribe { groups in
            self.groups.accept(groups)
        }.disposed(by: disposeBag)
    }
    
    init(presenter: FoodGroupPresenter, loader: FoodGroupLoader) {
        self.loader = loader
        self.presenter = presenter
        groups.asObservable().subscribe (onNext: { [weak self] groups in
            self?.presenter.foodGroups.accept(groups.map {group in
                PresentableFoodGroup(foodListView: FoodListRouter().view(type: group.type))
            })
        }).disposed(by: disposeBag)
    }
}
