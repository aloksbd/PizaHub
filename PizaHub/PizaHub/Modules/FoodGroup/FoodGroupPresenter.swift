//
//  FoodGroupPresenter.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import RxCocoa

final class FoodGroupPresenter {
    var foodGroups = BehaviorRelay(value: [PresentableFoodGroup]())
}
