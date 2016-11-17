//
//  ViewController.swift
//  RealmSample
//
//  Created by mizuno on 2016/11/16.
//  Copyright © 2016年 mizuno. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    let realmDB = RealmUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.realmConnect()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func realmConnect() {
        realmDB.id = 1;
        realmDB.age = 26;
        realmDB.nickname = "kazuhiro";
        self.save();
        self.find();
    }
    
    /**
     保存処理
     */
    func save() {
        do {
            let realm = try Realm()
            
            try realm.write {
                realm.add(self.realmDB)
            }
        } catch {
            
        }
    }
    
    func find() {
        let realm = try! Realm()
        let dataContent = realm.objects(RealmUser)
        print(dataContent)
    }
    
    func dataUpdate() {
        
        do {
            let realm = try! Realm()
            
            let data = realm.objects(RealmUser).last!
            try realm.write {
                data.nickname = "hirokazu"
            }
            
        } catch {
            
        }
    }
    
    func deleate() {
        
        do {
            let realm = try! Realm()
            
            let data = realm.objects(RealmUser).last!
            
            try realm.write {
                realm.delete(data)
            }
            
        } catch {
            
        }
    }

}

