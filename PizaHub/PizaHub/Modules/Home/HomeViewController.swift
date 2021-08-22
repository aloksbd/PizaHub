//
//  HomeViewController.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import UIKit
import RxCocoa
import RxSwift

final class HomeViewController: UIViewController {
    var offerView: UIView!
    var foodView: UIView!
    var pullView: UIView!
    var foodViewTopAnchor: NSLayoutConstraint!
    
    let presenter: HomePresenter!
    let disposeBag = DisposeBag()
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        presenter.offerView.asObservable().bind { view in
            self.offerView = view
            self.addOfferView()
        }.disposed(by: disposeBag)
        
        presenter.foodsView.asObservable().bind { view in
            self.foodView = view
            self.addFoodView()
        }.disposed(by: disposeBag)
    }

    func addFoodView() {
        view.addSubview(foodView)
        foodView.layer.cornerRadius = 20
        foodViewTopAnchor = foodView.topAnchor.constraint(equalTo: offerView.bottomAnchor, constant: -20)
        foodView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodViewTopAnchor,
            foodView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foodView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foodView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func addOfferView() {
        view.addSubview(offerView)
        offerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            offerView.topAnchor.constraint(equalTo: view.topAnchor),
            offerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            offerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            offerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
