//
//  ViewController.swift
//  Apitestprjt
//
//  Created by Bimal@AppStation on 11/05/22.

import UIKit

class ApiTableViewController: UIViewController {
    
    var datas = [universities]()
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setapi()
            
    }
    func setapi() {
        let url = URL(string: "http://universities.hipolabs.com/search?country=United+States")!
        let task = URLSession.shared.dataTask(with: url) {( data, response, error) in
            if let error = error {
                print("Error", error)
                return
            }
            guard let httpRes = response as? HTTPURLResponse, (200...299).contains(httpRes.statusCode) else{
                print("Error")
                return
            }
            if let data = data {
                let universitiesListResponse = try? JSONDecoder().decode([universities].self, from: data)
//                    print(universitiesListResponse)
                self.datas = universitiesListResponse!
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
        }
        task.resume()
    }
}
struct universities: Codable{
    let alpha_two_code: String
    let country: String
    let domains: [String]
    let web_pages: [String]
    let name: String	
    
}

extension ApiTableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Tablecell", for: indexPath) as! ApiTableViewCell
        cell.settablecell(tableModel: datas[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = Storyboard.instantiateViewController(withIdentifier: "ApiCollectionViewController") as! ApiCollectionViewController
        dvc.getdata = datas
        self.navigationController?.pushViewController(dvc, animated: true)
        */
        self.performSegue(withIdentifier: "segueTable", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueTable") {
            if let vc = segue.destination as? ApiCollectionViewController {
                vc.getdata = datas
            }
        }
    }
}
    
    


