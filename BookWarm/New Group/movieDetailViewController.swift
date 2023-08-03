//
//  movieDetailViewController.swift
//  BookWarm
//
//  Created by 이승현 on 2023/08/02.
//

import UIKit

class movieDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rollCollectionViewCell", for: indexPath) as! rollCollectionViewCell
        let row = movieInfo.movie[indexPath.row]
        
        // 이미지 설정
        cell.imageMatching2(movieTitle: row.title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfo.movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newTableViewCell", for: indexPath) as! newTableViewCell
        let row = movieInfo.movie[indexPath.row]
        
        cell.configureCell3(row: row)
        cell.imageMatching2(movieTitle: row.title)
        return cell
    }
    
    
    
    var movieInfo = MovieInformation()
    
    
    @IBOutlet var rollCollectionView: UICollectionView!
    @IBOutlet var listTableView: UITableView!
    
    // MARK: - 뷰디드로드에 델리게이트, 데이터소스 연결
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rollCollectionView.delegate = self
        rollCollectionView.dataSource = self
        
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.rowHeight = 140
        
        let nib = UINib(nibName: "rollCollectionViewCell", bundle: nil)
        let nib2 = UINib(nibName: "newTableViewCell", bundle: nil)
        
        rollCollectionView.register(nib, forCellWithReuseIdentifier: "rollCollectionViewCell")
        listTableView.register(nib2, forCellReuseIdentifier: "newTableViewCell")
        
        configureCollectionViewLayout()
    }
    
    // MARK: - 컬렉션뷰 레이아웃 관련 함수
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        rollCollectionView.collectionViewLayout = layout
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1. 스토리보드 파일 찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        //2. 스토리보드 파일 내 뷰컨트롤러 찾기
        let vc = sb.instantiateViewController(withIdentifier: "SubViewController") as! SubViewController
        //2-1(옵션). 네비게이션 컨트롤러가 있는 형태(제목바)로 Present 하고 싶은 경우
        let nav = UINavigationController(rootViewController: vc)
        //3. 화면 전환 방식 설정
        //vc.modalTransitionStyle.crossDissolve //모달 애니메이션
        vc.modalPresentationStyle = .fullScreen //모달 방식
        //4. 화면 띄우기
        present(nav, animated: true)
    }
}

