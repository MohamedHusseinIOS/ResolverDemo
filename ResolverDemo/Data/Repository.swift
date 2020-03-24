//
//  RemoteRepository.swift
//  ResolverDemo
//
//  Created by Admin on 3/23/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

protocol RepositoryProtocol {
    //associatedtype T
    func get<T: BaseModel>(url: String, parameters: [String: Any]? ,model: T.Type) -> Observable<Any>
    func post<T: BaseModel>(url: String, parameters: [String: Any]? ,model: T.Type) -> Observable<Any>
    
    func save <T: BaseModel>(_ items: [T]?)
    func load<T: BaseModel>(model: T.Type) -> Observable<Any>
}


extension RepositoryProtocol {
    
   private func handelResponse<T: BaseModel>(responseEnum: ResponseEnum, model: T.Type, observer: AnyObserver<Any>){
        switch responseEnum {
            case .success(let value):
                guard let value = value, let responseData = model.decodeJSON(value, To: model, format: .convertFromSnakeCase) else {
                    let error = ErrorModel()
                    error.message = ""
                    error.code = 0
                    return  observer.onError(error)
                }
                self.save(responseData as? [T])
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
    
    func save<T: BaseModel> (_ items: [T]?) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(items!)
        }
    }
    
    func load<T: BaseModel>(model: T.Type) -> Observable<Any> {
        return Observable<Any>.create { (observer) -> Disposable in
            let realm = try! Realm()
            let result = realm.objects(model.self)
            observer.onNext(result)
            return Disposables.create()
        }
    }
     
}

class RemoteRepository: RepositoryProtocol {
    init() {
        print("RemoteRepository")
    }
    
    func getOnlineMessage() -> String {
        return "Remote message"
    }
}

class LocalRepository: RepositoryProtocol {
    init() {
        print("LocalRepository")
    }
    
    func getLocalMessage() -> String {
        return "local message"
    }
}
