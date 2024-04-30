//
//  PrototypeCell2.swift
//  DummyPeople
//
//  Created by Markus Nugraha on 24/09/23.
//

import UIKit

class PrototypeCell2: UITableViewCell {
    
    @IBOutlet weak var fotoMenu: UIImageView!
    @IBOutlet weak var namaMenu: UILabel!
    @IBOutlet weak var jumlahPesanan: UILabel!
    @IBOutlet weak var hargaMenu: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
