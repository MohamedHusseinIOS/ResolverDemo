//
//  DataLayer+Injection.swift
//  ResolverDemo
//
//  Created by Admin on 3/24/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation
import Resolver

extension Resolver {
    
    public static func registerDataLayer(){
        register { DataFactory(remoteRepo: resolve(), localRepo: resolve()) }
        register { RemoteRepository() as RemoteRepositoryProtocol }
        register { LocalRepository() as LocalRepositoryProtocol }
    }
}
