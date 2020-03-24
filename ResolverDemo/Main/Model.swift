//
//  Model.swift
//  ResolverDemo
//
//  Created by Admin on 3/24/20.
//  Copyright © 2020 Sure. All rights reserved.
//

import Foundation
import RealmSwift

class Model: Object ,BaseModel  {
    @objc dynamic var message: String?
}
