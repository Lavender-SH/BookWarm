//
//  BookWarmCollectionViewController.swift
//  BookWarm
//
//  Created by 이승현 on 2023/07/31.
//

import UIKit


class BookWarmCollectionViewController: UICollectionViewController {
    
    
    let searchBar = UISearchBar()
    let list = ["암살", "명량", "광해", "부산행", "아바타", "어벤져스앤드게임", "해운대", "7번방의선물"]
    var movieInfo = MovieInformation()
    var searchList: [String] = []
//    {
//        didSet { //변수가 달라짐을 감지!
//            print("DidSet이 뭘까...")
//            collectionView.reloadData() }
//    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "BookWarmCollectionViewCell", bundle: nil)

        collectionView.register(nib, forCellWithReuseIdentifier: "BookWarmCollectionViewCell")
        
        setCollectionViewLayout()
        
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력해주세요"
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
        
        // MARK: - 상자모양 세팅
    }
    func setCollectionViewLayout() {
        //cell estimated size none으로 인터페이스 빌더에서 설정할 것!
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 3)
        

        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        collectionView.collectionViewLayout = layout
    }
    
    
    
    
    
    
    
    // MARK: - collectionView method
    //1.
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    //2.
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookWarmCollectionViewCell", for: indexPath) as! BookWarmCollectionViewCell
        let row = movieInfo.movie[indexPath.row]
        
        cell.configureCell(row: row)
        cell.imageMatching(movieTitle: row.title)
        cell.backgroundColor = getRandomColor()
        cell.layer.cornerRadius = 20
        cell.titleLabel.text = row.title
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        print("clicked \(sender.tag)")
        
        movieInfo.movie[sender.tag].like.toggle()
       collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ddd")
        
        //DetailViewController(UIViewController) 생성해서 present 해보기!
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SubViewController") as! SubViewController
        let nav = UINavigationController(rootViewController: vc)
        let row = movieInfo.movie[indexPath.row]
        
        let text = row.overview
        vc.infoText = text
        vc.contents = "개봉일\(row.releaseDate) | \(row.runtime)분 | 평점\(row.rate)"
        vc.modalPresentationStyle = .fullScreen
        
        
        
        
       // vc.contents = "상세화면"
      //  contents.fontSize = 15
      //  vc.title = row.title
        vc.movieTitle = row.title
        
        
        present(nav, animated: true)
        //vc.contents = list[indexPath.row]
        //값 전달 시 아웃렛을 활용할 수는 없음
//        vc.contentsLabel.text = list[indexPath.row]
        
        //인터페이스 빌더에 네비게이션 컨트롤러가 임베드 되어 있어야만 Push가 동작합니다!
        //navigationController?.pushViewController(vc, animated: true)
        //UISwipeActiionsConfiguration(actions: [UIContextualAction]
        
    }
    
    func getRandomColor() -> UIColor {
            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    
    
    
    @IBAction func addClickedBarButton(_ sender: UIBarButtonItem) {
        //1. 스토리보드 파일 찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        //2. 스토리보드 파일 내 뷰컨트롤러 찾기
        let vc2 = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        //2-1(옵션). 네비게이션 컨트롤러가 있는 형태(제목바)로 Present 하고 싶은 경우
        let nav = UINavigationController(rootViewController: vc2)
        
        //3. 화면 전환 방식 설정
//        v                                                                                                                                                                          c.modalTransitionStyle.crossDissolve //모달 애니메이션
//        vc.modalPresentationStyle = .fullScreen //모달 방식
        //4. 화면 띄우기
        vc2.contents2 = "검색화면"
        
        
        present(nav, animated: true)
        
        
    }
    
    
    
}

extension BookWarmCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()
        print(searchBar.text!)
        for item in list {
            if item.lowercased().contains(searchBar.text!) {
                searchList.append(item)
            }
        }
        print(searchList)
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()
        searchBar.text = ""
        collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchList.removeAll()
        for item in list {
            if item.lowercased().contains(searchText) {
                searchList.append(item)
            }
        }
        print(searchList)
        collectionView.reloadData()
    }
}



