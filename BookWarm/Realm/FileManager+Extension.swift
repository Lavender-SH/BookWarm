//
//  FileManager+Extension.swift
//  BookWarm
//
//  Created by 이승현 on 2023/09/05.
//

import UIKit


//도큐먼트 폴더에 이미지를 저장하는 메서드
func saveImageToDocument(fileName: String, image: UIImage){
    //1. 도큐먼트 경로 찾기
    guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
    //2. 저장할 경로 설정 (세부 경로, 이미지를 저장할 위치)
    let fileURL = documentDirectory.appendingPathComponent(fileName)
    //3. 이미지 변환
    // compressionQuality: 압축률
    guard let data = image.jpegData(compressionQuality: 0.5) else { return }
    //4. 이미지 저장
    do {
        try data.write(to: fileURL)
        
    }catch let error {
        print("file save error", error)
    }
}
