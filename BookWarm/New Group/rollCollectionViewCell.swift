//
//  rollCollectionViewCell.swift
//  BookWarm
//
//  Created by 이승현 on 2023/08/02.
//

import UIKit

class rollCollectionViewCell: UICollectionViewCell {

    @IBOutlet var rollaImage: UIImageView!
    @IBOutlet var motittleLabel2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell2(row: Movie) {
        motittleLabel2.text = row.title
    }
    
    /// 타이틀 레이블의 텍스트를 movieTitle과 비교하여 일치하는 이미지로 이미지 뷰를 구성
    /// - Parameters:
    ///   - movieTitle: 이미지 파일 제목과 일치하는 제목
    func imageMatching2(movieTitle: String) {
        if motittleLabel2.text == "암살" {
            self.rollaImage.image = UIImage(named: "암살")
        } else if motittleLabel2.text == "명량" {
            self.rollaImage.image = UIImage(named: "명량")
        } else if motittleLabel2.text == "광해" {
            self.rollaImage.image = UIImage(named: "광해")
        } else if motittleLabel2.text == "부산행" {
            self.rollaImage.image = UIImage(named: "부산행")
        } else if motittleLabel2.text == "아바타" {
            self.rollaImage.image = UIImage(named: "아바타")
        } else if motittleLabel2.text == "어벤져스엔드게임" {
            self.rollaImage.image = UIImage(named: "어벤져스엔드게임")
        } else if motittleLabel2.text == "해운대" {
            self.rollaImage.image = UIImage(named: "해운대")
        } else if motittleLabel2.text == "7번방의선물" {
            self.rollaImage.image = UIImage(named: "7번방의선물")
        } else if motittleLabel2.text == "겨울왕국2" {
            self.rollaImage.image = UIImage(named: "겨울왕국2")
        }
    }

}
