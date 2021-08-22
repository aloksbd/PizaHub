//
//  PresentableOffer.swift
//  PizaHub
//
//  Created by alok subedi on 22/08/2021.
//

import UIKit

struct PresentableOffers {
    let image: UIImage
    
    init(data: Data) {
        image = UIImage(data: data)!
    }
}
