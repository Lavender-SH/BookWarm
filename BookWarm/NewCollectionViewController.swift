


import UIKit

class NewCollectionViewController: UICollectionViewController {
    
    let searchBar = UISearchBar()
    let list = ["암살", "명량", "광해", "부산행", "아바타", "어벤져스앤드게임", "해운대", "7번방의선물"]
    var movieInfo = MovieInformation()
    var searchList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "BookWarmCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "BookWarmCollectionViewCell")
        
        setCollectionViewLayout()
        
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력해주세요"
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
    }
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchList.count
    }
    
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
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SubViewController") as! SubViewController
        let nav = UINavigationController(rootViewController: vc)
        let row = movieInfo.movie[indexPath.row]
        
        vc.infoText = row.overview
        vc.contents = "개봉일\(row.releaseDate) | \(row.runtime)분 | 평점\(row.rate)"
        vc.modalPresentationStyle = .fullScreen
        vc.movieTitle = row.title
        
        present(nav, animated: true)
    }
    
    func getRandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    @IBAction func addClickedBarButton(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc2 = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let nav = UINavigationController(rootViewController: vc2)
        
        vc2.contents2 = "검색화면"
        present(nav, animated: true)
    }
    
    func searchQuery(text: String) {
        searchList.removeAll()
        for item in list {
            if item.lowercased().contains(text) {
                searchList.append(item)
            }
        }
        collectionView.reloadData()
    }
}

extension NewCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        searchQuery(text: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchList = list
        searchBar.text = ""
        collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchQuery(text: searchText)
    }
}

