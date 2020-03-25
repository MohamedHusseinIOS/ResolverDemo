//
//  ViewModel.swift
//  ResolverDemo
//
//  Created by Admin on 3/23/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation

class MainViewModel: ViewModelType  {

    struct Input {
        
    }
    
    struct Output {
        
    }
    
    let input: Input
    let output: Output
    
    private let dataFactory: DataFactory
    
    init(dataFactory: DataFactory) {
        self.dataFactory = dataFactory
        self.input = Input()
        self.output = Output()
    }
    
    func getMessage(isOnline: Bool) -> String {
        return dataFactory.getMessage(isOnline: isOnline)
    }
}
