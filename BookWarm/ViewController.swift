//
//  ViewController.swift
//  BookWarm
//
//  Created by 이승현 on 2023/07/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = "고래밥님의 책상"
        let xmark = UIImage(systemName: "magnifyingglass")

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "magnifyingglass", style: .plain, target: self, action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
    }
    
    @objc
    func closeButtonClicked(_ sender: UIBarButtonItem) {
        //Present - Dismiss & push - pop
        //dismiss(animated: true)
//        navigationController?.popViewController(animated: true)
    }
    


}

