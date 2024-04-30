//
//  ViewController.swift
//  DummyPeople
//
//  Created by Lionzwarrior on 20/09/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // Semua menu (nama, deskripsi, foto, dan harga di set secara hardcode)
    var namaMenu: [String] = ["Apple Pie", "Bread", "Burger", "Bacon Fries", "Cola"]
    var deskripsiMenu: [String] = [
        "Pie lezat yang terbuat dari apel segar dan kulit pastry yang renyah.",
        "Roti panggang dengan kulit keemasan dan bagian dalam yang lembut.",
        "Burger juicy dengan patty yang terasa sempurna, sayuran segar, dan roti yang dipanggang.",
        "Bacon renyah dipadukan dengan kentang goreng emas, bumbu yang pas.",
        "Minuman cola segar dengan keseimbangan sempurna antara manis dan berkarbonasi."]
    var foto: [String] = ["apple_pie", "bread", "burger", "bacon_fries", "cola"]    // Lihat di Assets
    var harga: [Int] = [25000, 20000, 15000, 18000, 3000]
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return namaMenu.count
    }
        
    // Set isi dari setiap cell tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! PrototypeCell
        
        if let image = UIImage(named: foto[indexPath.row]) {
            cell.fotoMenu.image = image
        }
        cell.fotoMenu.layer.cornerRadius = cell.fotoMenu.frame.height / 2
        cell.namaMenu.text = namaMenu[indexPath.row]
        cell.hargaMenu.text = "Harga: \(harga[indexPath.row])"
            
        return cell
    }
    
    // Pindah ke detail DetailMenuViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetailMenu", sender: indexPath)
    }
    
    // Export data ke segue DetailMenuViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailMenuViewController {
            let vc = segue.destination as? DetailMenuViewController

            if let indexPath = sender as? IndexPath {
                vc?.importNamaMenu = namaMenu[indexPath.row]
                vc?.importDeskripsiMenu = deskripsiMenu[indexPath.row]
                vc?.importHargaMenu = harga[indexPath.row]
                vc?.importGambar = UIImage(named: foto[indexPath.row])
            }
        }
    }
}

