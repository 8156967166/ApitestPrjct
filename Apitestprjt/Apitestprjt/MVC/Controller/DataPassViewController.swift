//
//  DataPassViewController.swift
//  Apitestprjt
//
//  Created by Bimal@AppStation on 13/05/22.
//

import UIKit

class DataPassViewController: UIViewController {
    var getUniversitiesModel: universities!
    @IBOutlet weak var labelGetsName: UILabel!
    @IBOutlet weak var labelGetsCountry: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.labelGetsCountry.text = getUniversitiesModel.name
        self.labelGetsName.text = getUniversitiesModel.country
        
    }
    @IBAction func buttonActionProfile(sender: UIButton) {
        self.performSegue(withIdentifier: "profileSegue", sender: self)
    }
}
