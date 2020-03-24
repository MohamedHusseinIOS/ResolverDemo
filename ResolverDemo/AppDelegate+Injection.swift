//
//  AppDelegate+Injection.swift
//  ResolverDemo
//
//  Created by Admin on 3/24/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerDataLayer()
        registerVMs()
    }
    
    public static func registerDataLayer(){
        register { DataFactory(remoteRepo: resolve(), localRepo: resolve()) }
        register { RemoteRepository() }
        register { LocalRepository() }
    }
    
    public static func registerVMs(){
        register { MainViewModel(dataFactory: resolve()) }
        register { SecondViewModel(dataFactory: resolve()) }
    }
}
