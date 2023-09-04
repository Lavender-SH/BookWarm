//
//  DetailViewController.swift
//  BookWarm
//
//  Created by 이승현 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
    
    var contents2: String = "빈 공간"

    @IBOutlet var defactLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defactLabel.text = "검색화면"
        title = "검색화면"
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
