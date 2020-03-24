//
//  BaseModel.swift
//  ResolverDemo
//
//  Created by Admin on 3/23/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation
import RealmSwift


protocol BaseModel: Object ,Codable, Decoderable {}

class ErrorModel: Object, BaseModel, Error {
    var message: String?
    var code: Int?
}



