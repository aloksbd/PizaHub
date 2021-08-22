//
//  FoodGroupLoader.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import RxSwift

final class FoodGroupLoader {
    func load() -> Observable<[FoodGroupEntity]> {
        Observable.create{ observer in
            
            observer.onNext([
                FoodGroupEntity(type: .pizza),
                FoodGroupEntity(type: .sushi)
            ])
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
}
