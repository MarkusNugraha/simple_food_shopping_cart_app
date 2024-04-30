//
//  DetailMenuViewController.swift
//  DummyPeople
//
//  Created by Markus Nugraha on 23/09/23.
//

import UIKit

class DetailMenuViewController: UIViewController {
    
    @IBOutlet weak var fotoMenu: UIImageView!
    @IBOutlet var namaMenu: UILabel!
    @IBOutlet weak var deskripsiMenu: UITextView!
    @IBOutlet weak var hargaMenu: UILabel!
    @IBOutlet weak var counterPesanan: UILabel!
    
    var importGambar: UIImage?
    var importNamaMenu: String = ""
    var importDeskripsiMenu: String = ""
    var importHargaMenu: Int = 0
    
    // Untuk menghitung jumlah pesanan
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let gambar = importGambar {
            fotoMenu.image = gambar
        }
        namaMenu.text = importNamaMenu
        deskripsiMenu.text = "\(importDeskripsiMenu)\n\nHarga: \(importHargaMenu)"
        hargaMenu.text = "Rp. \(importHargaMenu * counter)"    // Harga selalu terupdate ketika counter berubah
        counterPesanan.text = "\(counter)"
    }
    
    @IBAction func btnPesan(_ sender: UIButton) {
        // Jika jumlah pesanan 0 -> maka tidak akan ditambahkan ke list daftar pesanan
        if counter != 0 {
            let pesanan = DaftarPesanan(
                fotoMenu: importGambar,
                namaMenu: importNamaMenu,
                jumlahPesanan: counter,
                hargaMenu: importHargaMenu * counter
            )
                
            // Mengecek apakah pesanan dengan namaMenu yang sama sudah ada
            if let existingPesanan = DaftarPesananManager.shared.listDaftarPesanan.first(where: { $0.namaMenu == importNamaMenu }) {
                existingPesanan.jumlahPesanan += counter
                existingPesanan.hargaMenu = existingPesanan.jumlahPesanan * importHargaMenu
            } else {
                DaftarPesananManager.shared.tambahkanPesanan(pesanan)
            }
        }
        performSegue(withIdentifier: "moveToDaftarPesanan", sender: self)
    }
    
    // Setiap button di klik akan update harga sesuai jumlah pesanan
    @IBAction func btnPlus(_ sender: Any) {
        counter = counter+1
        counterPesanan.text = "\(counter)"
        hargaMenu.text = "Rp. \(importHargaMenu * counter)"
    }
    
    @IBAction func btnMinus(_ sender: Any) {
        if (counter > 0) {
            counter = counter-1
            counterPesanan.text = "\(counter)"
            hargaMenu.text = "Rp. \(importHargaMenu * counter)"
        }
        
    }
}
