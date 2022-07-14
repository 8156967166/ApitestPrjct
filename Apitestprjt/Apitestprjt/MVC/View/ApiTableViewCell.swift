//
//  ApiTableViewCell.swift
//  Apitestprjt
//
//  Created by Bimal@AppStation on 13/05/22.
//

import UIKit

class ApiTableViewCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func settablecell(tableModel: universities) {
        self.labelName.text = tableModel.name
        self.labelCountry.text = tableModel.country
    }
}
