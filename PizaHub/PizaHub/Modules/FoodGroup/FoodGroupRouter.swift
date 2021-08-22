//
//  FoodGroupRouter.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

final class FoodGroupRouter {
    func view() -> FoodGroupView {
        let presenter = FoodGroupPresenter()
        let interactor = FoodGroupInteractor(presenter: presenter, loader: FoodGroupLoader())
        let view = FoodGroupView(presenter: presenter)
        interactor.loadFoods()
        return view
    }
}
