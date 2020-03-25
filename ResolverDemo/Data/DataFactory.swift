//
//  RemoteRepository.swift
//  ResolverDemo
//
//  Created by Admin on 3/23/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation
import RxSwift


class DataFactory {
    
    private let remoteRepository: RemoteRepository
    private let localRepository: LocalRepository
    
    init(remoteRepo: RemoteRepository, localRepo: LocalRepository) {
        self.remoteRepository = remoteRepo
        self.localRepository = localRepo
        
        print("DataFactory")
    }
    
    func get <T: BaseModel>(url: String, model: T.Type) -> Observable<Any> {
        let remoteResponse = remoteRepository.get(url: url, parameters: nil, model: model.self)
        let localResponse = localRepository.load(model: model.self)
        return Observable<Any>.concat([remoteResponse, localResponse])
    }
    
    func save <T: BaseModel>(_ items: [T]) {
        localRepository.save(items)
    }
    
    func getMessage(isOnline: Bool) -> String {
        return isOnline ? remoteRepository.getOnlineMessage() : localRepository.getLocalMessage()
    }
    
}
