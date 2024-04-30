//
//  Transaksi Berhasil ViewController.swift
//  AplikasiMenuRestoran
//
//  Created by Markus Nugraha on 28/09/23.
//

import UIKit

class TransaksiBerhasilViewController: UIViewController {

    @IBOutlet weak var gambarChecked: UIImageView!
    @IBOutlet weak var labelFinalTransaction: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Halaman Terakhir untuk view jika order sudah dilakukan
        gambarChecked.image = UIImage(named:"greenCheck")
        
        // Do any additional setup after loading the view.
    }

}
