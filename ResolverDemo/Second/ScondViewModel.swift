//
//  ScondViewModel.swift
//  ResolverDemo
//
//  Created by Admin on 3/24/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation

class SecondViewModel: ViewModelType {
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    let input: Input
    let output: Output
    
    let dataFactory: DataFactory
    
    init(dataFactory: DataFactory) {
        self.dataFactory = dataFactory
        self.input = Input()
        self.output = Output()
    }
}
