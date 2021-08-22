//
//  OffersLoader.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import Foundation
import RxSwift

final class OffersLoader {
    private var url: URL!
    
    func load(from url: URL) -> Observable<[OffersEntity]>{
        Observable.create{ observer in
            // TODO: load from url
            observer.onNext([
                OffersEntity(id: UUID(), imageData: UIImage.makeImage(withColor: .random).pngData()!),
                OffersEntity(id: UUID(), imageData: UIImage.makeImage(withColor: .random).pngData()!),
                OffersEntity(id: UUID(), imageData: UIImage.makeImage(withColor: .random).pngData()!)
            ])
            observer.onCompleted()

            return Disposables.create()
        }
    }
}
