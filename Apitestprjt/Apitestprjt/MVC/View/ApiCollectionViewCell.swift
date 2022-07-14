//
//  ApiCollectionViewCell.swift
//  Apitestprjt
//
//  Created by Bimal@AppStation on 13/05/22.
//

import UIKit

class ApiCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewstyle: UIView!
    @IBOutlet weak var labelGetName: UILabel!
    @IBOutlet weak var labelGetCountry: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewstyle.layer.borderColor = UIColor.black.cgColor
        viewstyle.layer.borderWidth = 2
        viewstyle.layer.cornerRadius = 16
    }

func setCellCollection(collectionModel: universities) {
    self.labelGetName.text = collectionModel.name
    self.labelGetCountry.text = collectionModel.country
}
}
