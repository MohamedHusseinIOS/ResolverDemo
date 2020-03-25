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
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    private func registerDataFactory(){
        container.register(RemoteRepository.self) { _ in
            RemoteRepository()
        }.inObjectScope(.container)
        
        container.register(LocalRepository.self) { _ in
            LocalRepository()
        }.inObjectScope(.container)
        
        container.register(DataFactory.self) { r in
            let remote = r.resolve(RemoteRepository.self)!
            let local = r.resolve(LocalRepository.self)!
            DataFactory(remoteRepo: remote, localRepo: local)
        }.inObjectScope(.container)
    }
    
    private func registerVMs(){
        container.register(MainViewModel.self) { r in
            let dataFactory = r.resolve(DataFactory.self)!
            MainViewModel(dataFactory: dataFactory)
        }
        
        container.register(SecondViewModel.self) { r in
            let dataFactory = r.resolve(DataFactory.self)!
            SecondViewModel(dataFactory: dataFactory)
        }
    }
    
    func register(){
        registerDataFactory()
        registerVMs()
    }
}

