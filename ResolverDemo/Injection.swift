//
//  AppDelegate+Injection.swift
//  ResolverDemo
//
//  Created by Admin on 3/25/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation
import Swinject

class Injection {
    
    
    static let container = Container()
    
    private init() {}
    
    private static func registerDataFactory(){
        container.register(RemoteRepository.self) { _ in
            RemoteRepository()
        }.inObjectScope(.container)
        
        container.register(LocalRepository.self) { _ in
            LocalRepository()
        }.inObjectScope(.container)
        
        container.register(DataFactory.self) { r in
            let remote = r.resolve(RemoteRepository.self)!
            let local = r.resolve(LocalRepository.self)!
            return DataFactory(remoteRepo: remote, localRepo: local)
        }.inObjectScope(.container)
    }
    
    private static func registerVMs(){
        container.register(MainViewModel.self) { r in
            let dataFactory = r.resolve(DataFactory.self)!
            return MainViewModel(dataFactory: dataFactory)
        }
        
        container.register(SecondViewModel.self) { r in
            let dataFactory = r.resolve(DataFactory.self)!
            return SecondViewModel(dataFactory: dataFactory)
        }
    }
    
    public static func register(){
        registerDataFactory()
        registerVMs()
    }
}

