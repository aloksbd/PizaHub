//
//  OffersPresenter.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import RxSwift
import RxCocoa

final class OffersPresenter {
    var offers = BehaviorRelay(value: [PresentableOffers]())
}

