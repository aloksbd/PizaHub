//
//  FoodListLoader.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import Foundation
import RxSwift

final class FoodListLoader {
    private var type: FoodGroup
    private var url: URL!
    
    init(type: FoodGroup) {
        self.type = type
    }
    
    func load(from url: URL) -> Observable<[FoodListEntity]>{
        Observable.create{ observer in
            // TODO: load from url
            observer.onNext(self.type == .pizza ? FoodFactory.pizzas : FoodFactory.sushis)
            observer.onCompleted()

            return Disposables.create()
        }
    }
}

class FoodFactory {
    static var pizzas = [
        FoodListEntity(name: "ChickenPizza", description: "chicken, salami, cheese, tomato, pepper", imageData: UIImage.makeImage(withColor: .random).pngData()!, weight: 235, size: 30, pieces: nil, price: 1.99),
        FoodListEntity(name: "SpecialPizza", description: "chicken, salami, cheese, tomato, pepper, bacon, sausages, mustard, coriander", imageData: UIImage.makeImage(withColor: .random).pngData()!, weight: 235, size: nil, pieces: 30, price: 1.99),
        FoodListEntity(name: "Pizza", description: "chicken, salami, cheese, tomato, pepper", imageData: UIImage.makeImage(withColor: .random).pngData()!, weight: 235, size: 30, pieces: nil, price: 1.99)
    ]
    
    static var sushis = [
        FoodListEntity(name: "Red Sushi", description: "sushi with red chilli", imageData: UIImage.makeImage(withColor: .random).pngData()!, weight: 235, size: 30, pieces: nil, price: 1.99),
        FoodListEntity(name: "Special Sushi", description: "raw salmon, korean rice, soya sauce, olive oil, salmon eggs, special goat cheese", imageData: UIImage.makeImage(withColor: .random).pngData()!, weight: 235, size: nil, pieces: 30, price: 1.99),
        FoodListEntity(name: "Sushi", description: "regular", imageData: UIImage.makeImage(withColor: .random).pngData()!, weight: 235, size: 30, pieces: nil, price: 1.99)
    ]
}
