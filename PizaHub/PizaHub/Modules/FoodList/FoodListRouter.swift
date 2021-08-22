//
//  FoodListRouter.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import Foundation

final class FoodListRouter {
    func view(type: FoodGroup) -> FoodListView {
        let presenter = FoodListPresenter()
        let interactor = FoodListInteractor(presenter: presenter, loader: FoodListLoader(type: type))
        let view = FoodListView(presenter: presenter)
        interactor.loadFoods()
        return view
    }
}
