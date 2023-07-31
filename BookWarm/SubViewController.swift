//
//  ViewController.swift
//  BookWarm
//
//  Created by 이승현 on 2023/07/31.
//

import UIKit

class SubViewController: UIViewController {
    
    @IBOutlet var detailLabel: UILabel!
    
    var contents: String = "빈 공간"
    var movieTitle: String = "빈 공간"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = contents
        print(contents)
        title = movieTitle
       // let xmark = UIImage(systemName: "magnifyingglass")

        
    }
    
    @objc
    func closeButtonClicked(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ViewController") as! SubViewController
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
        
        
        vc.contents = "검색화면"
    }
    


}

