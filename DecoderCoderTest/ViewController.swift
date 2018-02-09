//
//  ViewController.swift
//  DecoderCoderTest
//
//  Created by 南伊織 on 2018/02/10.
//  Copyright © 2018年 南伊織. All rights reserved.
//
import UIKit

class ViewController: UIViewController{
    
    var userArray: [userList] = []
    var archiver = dataArchiver()
    let userDefaults: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userArray.append(userList(name: "John", age: 34))
        userArray.append(userList(name: "Noel", age: 23))
        //ここでarchivedArrayに今アーカイブしたデータを入れる
        let archivedArray = NSKeyedArchiver.archivedData(withRootObject: userArray)
        
        //UserDefaultsに初期値として入れる。
        savedData().userDefaults.register(defaults: ["savedList": archivedArray])
        //ここで初期値を入れたuserdefaultsからデータを取り出してみる。
        userArray = archiver.unArchiveData(file: userDefaults.data(forKey: "savedList")!) as! [userList]
        print("The users name is \(userArray[0].name!) and he is \(userArray[0].age!) years old")
        print(userArray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
