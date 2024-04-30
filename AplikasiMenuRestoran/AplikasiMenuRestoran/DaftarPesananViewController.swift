//
//  DaftarPesananViewController.swift
//  DummyPeople
//
//  Created by Markus Nugraha on 24/09/23.
//

import UIKit

// Class dibuat untuk menyimpan data ke list daftar pesanan yang sudah dilakukan
public class DaftarPesanan {
    var fotoMenu: UIImage?
    var namaMenu: String = ""
    var jumlahPesanan: Int = 0
    var hargaMenu: Int = 0

    init(fotoMenu: UIImage?, namaMenu: String, jumlahPesanan: Int, hargaMenu: Int) {
        self.fotoMenu = fotoMenu
        self.namaMenu = namaMenu
        self.hargaMenu = hargaMenu
        self.jumlahPesanan = jumlahPesanan
    }
}

// Agar nilai di dalam list tidak hilang saat berpindah pindah halaman
class DaftarPesananManager {
    static let shared = DaftarPesananManager() // Singleton instance

    var listDaftarPesanan: [DaftarPesanan] = []

    private init() {}

    func tambahkanPesanan(_ pesanan: DaftarPesanan) {
        listDaftarPesanan.append(pesanan)
    }
}


class DaftarPesananViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalHargaPesanan: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        totalHargaPesanan.text = "\(hitungTotalHarga())"
    }
    
    
    @IBAction func btnOrderNow(_ sender: Any) {
        performSegue(withIdentifier: "moveToCheckedOrder", sender: self)
    }
    
    // Untuk menghitung semua harga dari daftar pesanan
    func hitungTotalHarga() -> Int {
        var total = 0
        for pesanan in DaftarPesananManager.shared.listDaftarPesanan {
            total += pesanan.hargaMenu * pesanan.jumlahPesanan
        }
        return total
    }
    
    // Dibuatkan tabel seperti halaman pertama, pada daftar Menu utama (menggunakan cell tableview)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DaftarPesananManager.shared.listDaftarPesanan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! PrototypeCell2
        
        let pesanan = DaftarPesananManager.shared.listDaftarPesanan[indexPath.row]
            
        cell.fotoMenu.image = pesanan.fotoMenu
        cell.namaMenu.text = pesanan.namaMenu
        cell.jumlahPesanan.text = "\(pesanan.jumlahPesanan)"
        cell.hargaMenu.text = "Rp. \(pesanan.hargaMenu*pesanan.jumlahPesanan)"
        
        return cell
    }

}
