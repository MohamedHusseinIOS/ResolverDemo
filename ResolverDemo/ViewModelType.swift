//
//  ViewModelType.swift
//  ResolverDemo
//
//  Created by Admin on 3/24/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation

protocol ViewModelType {
    
    var dataFactory: DataFactory { get }
    
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}
