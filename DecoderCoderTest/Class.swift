//
//  Class.swift
//  DecoderCoderTest
//
//  Created by 南伊織 on 2018/02/10.
//  Copyright © 2018年 南伊織. All rights reserved.
//

import UIKit

class userList: NSObject, NSCoding{
    var name: String!
    var age: Int!
    
    //initialize class
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    //decoder initializing
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.age = decoder.decodeObject(forKey: "age") as? Int
    }
    
    //encode method
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(age, forKey: "age")
    }
}

class savedData{
    var userDefaults: UserDefaults = UserDefaults.standard
}

class dataArchiver{
    func archiveData(file: Any) -> Any{
        let archivedArray = NSKeyedArchiver.archivedData(withRootObject: file)
        return archivedArray
    }
    
    func unArchiveData(file: Data) -> Any{
        let unArchivedArray = NSKeyedUnarchiver.unarchiveObject(with: file)
        return unArchivedArray!
    }
}
