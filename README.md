# RealmSample

## realmを使ってみる


### 環境
* xcode 8.1
* swift 3.0.1
* realm 2.0.4
* cocoapods 1.1.1

### 下準備
* RealmSampleというプロジェクトを作成する
* プロジェクトを閉じる

### Realmをcocoapodsでインストール
* ターミナルでプロジェクトに移動
* PodFileを作成する
```
pod init
```
* PodFileを編集する

```bash
mmac:RealmSample mizuno$ cat Podfile
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'RealmSample' do
  pod 'RealmSwift'
  use_frameworks!

  # Pods for RealmSample

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
```
* インストールする。

```bash
pod install
```
* 作成されたworkspaceで起動する。
```
open RealmSample.xcworkspace
```

### XcodeでRelamを使う

* XcodeのLinked Frameworks and Libraryに以下を追加
 - RealmSwift.Framework
 - Realm.fremework

* viewController.swiftを修正
** buildすることでエラーは取れる

```swift
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


```

＊ シュミレータを起動する。

### Realm Browserでデータを確認

* 以下のコマンドを実行し、Realm Browserを起動

```bash
open $(find ~/Library/Developer/CoreSimulator/Devices/$(ls -t1 ~/Library/Developer/CoreSimulator/Devices/ | head -1)/data/Containers/Data/Application/ -name \*.realm)
```









