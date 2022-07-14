//
//  ApiCollectionViewController.swift
//  Apitestprjt
//
//  Created by Bimal@AppStation on 13/05/22.
//

import UIKit

class ApiCollectionViewController: UIViewController {
    var getdata = [universities]()
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
extension ApiCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellcollection = collectionview.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! ApiCollectionViewCell
        cellcollection.setCellCollection(collectionModel: getdata[indexPath.item])
        return cellcollection
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Storyboard.instantiateViewController(withIdentifier: "DataPassViewController") as! DataPassViewController
        vc.getUniversitiesModel = getdata[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
         */
        let receivedModel = getdata[indexPath.item]
        self.performSegue(withIdentifier: "segueCollection", sender: receivedModel)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "segueCollection") {
            let model = sender as! universities
            if let vc = segue.destination as? DataPassViewController {
                vc.getUniversitiesModel = model
            }
        }
    }
}
