//
//  scrapbookTableViewCell.swift
//  ViewerApp
//
//  Created by Khirish Meshram on 30/12/20.
//

import UIKit

class scrapbookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scrapTitle: UILabel!
    @IBOutlet weak var scrapDate: UILabel!
    @IBOutlet weak var scrapDetail: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
