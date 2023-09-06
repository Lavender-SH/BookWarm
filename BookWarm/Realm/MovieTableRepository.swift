//
//  MovieTableRepository.swift
//  BookWarm
//
//  Created by 이승현 on 2023/09/06.
//

import Foundation
import RealmSwift

protocol MovieTableRepositoryType: AnyObject {
    func findFileURL() -> URL?
    func fetch() -> Results<MovieTable>
    func fetchFilter() -> Results<MovieTable>
    func createItem(_ item: MovieTable)
    func updateItem(id: ObjectId, movieTitle: String, Overview: String)
}

class MovieTableRepository: MovieTableRepositoryType {
    
    private let realm = try! Realm()
    
    func checkSchemaVersion() {
        do {
            let version = try schemaVersionAtURL(realm.configuration.fileURL!)
            print("Schema Version: \(version)")
        } catch {
            print(error)
        }
    }
    
    func findFileURL() -> URL? {
        let fileURL = realm.configuration.fileURL // 실제 데이터 저장 파일 경로
        return fileURL
    }
    
    func fetch() -> Results<MovieTable> {
        let data = realm.objects(MovieTable.self).sorted(byKeyPath: "movieTitle", ascending: false)
        return data
    }
    
    func fetchFilter() -> Results<MovieTable> {
        // filter
        // realm filter는 제약이 조금 많다.
        // 특수한 케이스 필터가 많이 없어서 복잡한 filter가 필요하다면 realm을 써야되는지 한번 다시 생각해볼 것.
        let result = realm.objects(MovieTable.self).where {
            // 1. Contain
            //             caseInsensitive (대소문자 구분 X)
            //            $0.diaryTitle.contains("제목", options: .caseInsensitive)
            
            // 2. Bool
                        $0.movieLike == true
            
            // 3. 사진이 있는 데이터만 불러오기
            //$0.photo != nil
        }
        return result
    }
    
    func createItem(_ item: MovieTable) {
        do {
            try realm.write {
                realm.add(item)
                print("Realm Add Succeed")
            }
        } catch {
            print("error")
        }
    }
    
    func updateItem(id _id: ObjectId, movieTitle: String, Overview: String) {
        // realm 데이터 저장이 안될리는 거의 없는데 그래도 일말의 가능성을 보고 do, catch 에러 잡기
        do {
            try realm.write {
                realm.create(
                    MovieTable.self,
                    value: [
                        "_id": _id,
                        "movieTitle": movieTitle,
                        "Overview": Overview
                    ],
                    update: .modified
                )
                //                realm.add(item, update: .modified)
            }
        } catch {
            print("error")
        }
    }
}
