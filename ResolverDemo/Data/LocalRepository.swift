//
//  LocalRepository.swift
//  ResolverDemo
//
//  Created by Admin on 3/23/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation
import RxSwift

protocol LocalRepositoryProtocol {
    func save <T: BaseModel>(_ items: [T])
    func load() -> Observable<Any>
}

extension LocalRepositoryProtocol {
    
    func save<T: BaseModel> (_ items: [T]) {
       
    }
    
    func load() -> Observable<Any> {
        return Observable<Any>.create { (observable) -> Disposable in
            return Disposables.create()
        }
    }
}


class LocalRepository: LocalRepositoryProtocol {}
