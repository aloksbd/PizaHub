//
//  HomeRouter.swift
//  PizaHub
//
//  Created by alok subedi on 23/08/2021.
//

final class HomeRouter {
    func view() -> HomeViewController {
        let presenter = HomePresenter()
        let view = HomeViewController(presenter: presenter)
        return view
    }
}
