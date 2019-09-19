//
//  DetailsViewModel.swift
//  NYTimesPopular
//
//  Created by Mostafa on 9/19/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    var popularViewModel: PopularViewModel?
    
    var colorRGB: Binder<(Double, Double, Double)> = Binder(nil)
    
    func generateRandomNumber(maxNumber: Int) -> Int {
        if maxNumber < 1 {
            return 0
        }
        let randomNumber = Int.random(in: 0 ..< maxNumber)
        return randomNumber
    }
    
    func getRandomColorRGB() {
        
        let maxNumber = popularViewModel?.availableArrayRGB.count ?? 0
        let randomNumber = generateRandomNumber(maxNumber: maxNumber)
        
        colorRGB.value = popularViewModel?.availableArrayRGB[randomNumber]
    }
}
















