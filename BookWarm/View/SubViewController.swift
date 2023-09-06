//
//  ViewController.swift
//  BookWarm
//
//  Created by 이승현 on 2023/07/31.
//

import UIKit
import RealmSwift

class SubViewController: UIViewController {
    
    var data: MovieTable?
    let realm = try! Realm()
    let repository = MovieTableRepository()
    
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var inLabel: UILabel!
    @IBOutlet var infoTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    let placeholderText = "내용을 입력해주세요"
    
    var contents: String = "빈 공간"
    var movieTitle: String = "빈 공간"
    var infoText: String? = "빈 공간"
    var photo: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = contents
        infoTextView.text = infoText
        infoTextView.text = placeholderText
        photoImageView = photo
        print(contents)
        title = movieTitle
        // let xmark = UIImage(systemName: "magnifyingglass")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(editButtonClicked))
        
    }
    @objc func editButtonClicked() {

        guard let data = data else { return }
        
        repository.updateItem(
            id: data.id,
            movieTitle: movieTitle,
            Overview: placeholderText
        )
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc
    func closeButtonClicked(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ViewController") as! SubViewController
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
        
        
        vc.contents = "검색화면"
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
        }
        
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText {
            textView.text = nil
            textView.textColor = .black
            }
            
            
        }
        
        
    }
    
}
