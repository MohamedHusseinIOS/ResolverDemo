//
//  RemoteRepository.swift
//  ResolverDemo
//
//  Created by Admin on 3/23/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation
import RxSwift

protocol RemoteRepositoryProtocol {
    //associatedtype T
    func get<T: BaseModel>(url: String, parameters: [String: Any]? ,model: T.Type) -> Observable<Any>
    func post<T: BaseModel>(url: String, parameters: [String: Any]? ,model: T.Type) -> Observable<Any>
}


extension RemoteRepositoryProtocol {
    
   private func handelResponse<T: BaseModel>(responseEnum: ResponseEnum, model: T.Type, observer: AnyObserver<Any>){
        switch responseEnum {
            case .success(let value):
                guard let value = value, let responseData = model.decodeJSON(value, To: model, format: .convertFromSnakeCase) else {
                    let error = ErrorModel(message: ApiError.ClientSideError.message, code: 0)
                    return  observer.onError(error)
                }
                observer.onNext(responseData)
            case .failure( _, let data):
                guard let errorModel = data as? ErrorModel else {
                    observer.onCompleted()
                    return
                }
                observer.onError(errorModel)
                observer.onCompleted()
        }
    }
    
    func get<T: BaseModel>(url: String, parameters: [String: Any]?, model: T.Type) -> Observable<Any> {
        return Observable<Any>.create { (observer) -> Disposable in
            NetworkManager.shared.get(url: url, paramters: parameters) { (responseEnum) in
                self.handelResponse(responseEnum: responseEnum, model: model.self, observer: observer)
            }
            return Disposables.create()
        }
    }
    
    func post<T: BaseModel>(url: String, parameters: [String: Any]?, model: T.Type) -> Observable<Any> {
        return Observable<Any>.create { (observer) -> Disposable in
            NetworkManager.shared.post(url: url, paramters: parameters) { (responseEnum) in
                self.handelResponse(responseEnum: responseEnum, model: model.self, observer: observer)
            }
            return Disposables.create()
        }
    }
     
}


class RemoteRepository: RemoteRepositoryProtocol {}
