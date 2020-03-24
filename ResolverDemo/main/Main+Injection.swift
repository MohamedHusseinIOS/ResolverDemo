//
//  Main+Injection.swift
//  ResolverDemo
//
//  Created by Admin on 3/24/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation
import Resolver

extension Resolver {
    public static func registerMain(){
        register { MainViewModel(dataFactory: resolve()) }
    }
}
