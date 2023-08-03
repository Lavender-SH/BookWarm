//
//  newTableViewCell.swift
//  BookWarm
//
//  Created by 이승현 on 2023/08/03.
//

import UIKit

class newTableViewCell: UITableViewCell {
    
    var movieInfo = MovieInformation()

    @IBOutlet var mooImage2: UIImageView!
    @IBOutlet var motitleLabel2: UILabel!
    
    
    
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }
}
    extension newTableViewCell {
        
        // MARK: - Configuration Methods
        /// 셀을 구성하는 함수
        /// - Parameter row: 셀을 구성할 무비 데이터
        func configureCell3(row: Movie) {
            motitleLabel2.text = row.title
        }
        
        /// 타이틀 레이블의 텍스트를 movieTitle과 비교하여 일치하는 이미지로 이미지 뷰를 구성
        /// - Parameters:
        ///   - movieTitle: 이미지 파일 제목과 일치하는 제목
        func imageMatching2(movieTitle: String) {
            if motitleLabel2.text == "암살" {
                self.mooImage2.image = UIImage(named: "암살")
            } else if motitleLabel2.text == "명량" {
                self.mooImage2.image = UIImage(named: "명량")
            } else if motitleLabel2.text == "광해" {
                self.mooImage2.image = UIImage(named: "광해")
            } else if motitleLabel2.text == "부산행" {
                self.mooImage2.image = UIImage(named: "부산행")
            } else if motitleLabel2.text == "아바타" {
                self.mooImage2.image = UIImage(named: "아바타")
            } else if motitleLabel2.text == "어벤져스엔드게임" {
                self.mooImage2.image = UIImage(named: "어벤져스엔드게임")
            } else if motitleLabel2.text == "해운대" {
                self.mooImage2.image = UIImage(named: "해운대")
            } else if motitleLabel2.text == "7번방의선물" {
                self.mooImage2.image = UIImage(named: "7번방의선물")
            } else if motitleLabel2.text == "겨울왕국2" {
                self.mooImage2.image = UIImage(named: "겨울왕국2")
            }
        }
    }




    
    

