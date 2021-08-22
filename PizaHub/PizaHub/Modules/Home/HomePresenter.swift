//
//  HomePresenter.swift
//  PizaHub
//
//  Created by alok subedi on 23/08/2021.
//

import RxCocoa

final class HomePresenter {
    var offerView = BehaviorRelay(value: OffersRouter().view())
    var foodsView = BehaviorRelay(value: FoodGroupRouter().view())
}
