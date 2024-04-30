//
//  PrototypeCell.swift
//  DummyPeople
//
//  Created by Lionzwarrior on 20/09/23.
//

import UIKit

class PrototypeCell: UITableViewCell {
    @IBOutlet weak var fotoMenu: UIImageView!
    @IBOutlet weak var namaMenu: UILabel!
    @IBOutlet weak var hargaMenu: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
