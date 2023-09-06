//
//  AppDelegate.swift
//  BookWarm
//
//  Created by 이승현 on 2023/07/31.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Realm Migration
        // 컬럼과 테이블 단순 추가 삭제의 경우엔 별도 코드가 필요없음
        // Column명 변경 코드를 작성하지 않으면 단순 삭제 -> 추가로 인식해 해당 값은 모두 null로 초기화 되버림. (컴파일 에러가 뜨지는 않음)
        
        let config = Realm.Configuration(schemaVersion: 1) { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 { } // Column 추가
            if oldSchemaVersion < 2 { } // Column 삭제
            if oldSchemaVersion < 3 {
                //migration.renameProperty(onType: DiaryTable.className(), from: "movieOverview", to: "Overview")
            } // movieOverview -> Overview Column명 변경
            if oldSchemaVersion < 4 { } // diaryContents -> contents Column명 변경
            if oldSchemaVersion < 5 {
                // movieSummary 컬럼 추가, title + contents 합쳐서 넣음
                migration.enumerateObjects(ofType: MovieTable.className()) { oldObject, newObject in
                    guard let new = newObject else { return }
                    guard let old = oldObject else { return }
                    
                    new["movieSummary"] = "제목은 '\(old["movieTitle"])' 이고, 내용은 '\(old["Overview"])'입니다."
                }
            }
        }
        Realm.Configuration.defaultConfiguration = config
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

