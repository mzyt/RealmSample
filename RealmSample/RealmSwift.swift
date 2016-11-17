//
//  RealmSwift.swift
//  RealmSample
//
//  Created by mizuno on 2016/11/16.
//  Copyright © 2016年 mizuno. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUser: Object {
    dynamic var id : Int = 0;
    dynamic var nickname = "";
    dynamic var age: Int = 0;
}
