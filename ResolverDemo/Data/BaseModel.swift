//
//  BaseModel.swift
//  ResolverDemo
//
//  Created by Admin on 3/23/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation

protocol BaseModel: Codable, Decoderable {}

struct ErrorModel: Error, BaseModel{
    var message: String?
    var code: Int?
}



