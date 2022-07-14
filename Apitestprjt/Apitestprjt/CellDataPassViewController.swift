//
//  CellDataPassViewController.swift
//  Apitestprjt
//
//  Created by Bimal@AppStation on 12/05/22.
//

//import UIKit
//
//class CellDataPassViewController: UIViewController {
//    var details = [University]()
//    @IBOutlet weak var collectionview: UICollectionView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        setapicall()
//    }
//    func setapicall() {
//        let url = URL(string: "http://universities.hipolabs.com/search?country=United+States")!
//        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//            if let error = error {
//                print("Error", error)
//                return
//            }
//            guard let httpRes = response as? HTTPURLResponse, (200...299).contains(httpRes.statusCode) else{
//                print("Error")
//                return
//            }
//            if let data = data {
//                let universityListResponse = try? JSONDecoder().decode([University].self, from: data)
//                self.details = universityListResponse!
//                
//                DispatchQueue.main.async {
//                    self.collectionview.reloadData()
//                }
//            }
//        }
//        task.resume()
//    
//    }
//}
//struct University: Codable{
//    let alpha_two_code: String
//    let country: String
//    let domains: [String]
//    let web_pages: [String]
//    let name: String
//    
//}
//extension CellDataPassViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//        
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return details.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! ApiCollectionViewCell
//        cell.setModel(strNm: details[indexPath.item])
//        return cell
//    }
//    
//    
//}
