//
//  OffersRouter.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

final class OffersRouter {
    func view() -> OffersView {
        let presenter = OffersPresenter()
        let interactor = OffersInteractor(presenter: presenter, loader: OffersLoader())
        let view = OffersView(presenter: presenter)
        interactor.loadOffers()
        return view
    }
}
