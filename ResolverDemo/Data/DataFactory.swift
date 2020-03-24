//
//  RemoteRepository.swift
//  ResolverDemo
//
//  Created by Admin on 3/23/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation
import RxSwift
import Resolver

protocol DataFactoryProtocol {
    
    var remoteRepository: RemoteRepositoryProtocol { get }
    var localRepository: LocalRepositoryProtocol { get }
    
    func get <T: BaseModel>(url: String, model: T.Type) -> Observable<Any>
    func save <T: BaseModel>(_ items: [T])
}

extension DataFactoryProtocol{
    
    func get <T: BaseModel>(url: String, model: T.Type) -> Observable<Any> {
        let remoteResponse = remoteRepository.get(url: url, parameters: nil, model: model.self)
        let localResponse = localRepository.load()
        return Observable<Any>.concat([remoteResponse, localResponse])
    }
    
    func save <T: BaseModel>(_ items: [T]) {
        
    }
}

class DataFactory: DataFactoryProtocol {
    
    var remoteRepository: RemoteRepositoryProtocol
    var localRepository: LocalRepositoryProtocol
    
    init(remoteRepo: RemoteRepositoryProtocol, localRepo: LocalRepositoryProtocol) {
        self.remoteRepository = remoteRepo
        self.localRepository = localRepo
    }
}
