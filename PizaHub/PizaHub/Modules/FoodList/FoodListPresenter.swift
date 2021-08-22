//
//  FoodListPresenter.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import RxCocoa

final class FoodListPresenter {
    var foods = BehaviorRelay(value: [PresentableFoods]())
}
