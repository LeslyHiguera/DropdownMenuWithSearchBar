//
//  ViewController.swift
//  dropdown with search
//
//  Created by Wilson David Molina Lozano on 12/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    var nameArray: [String] = ["Azul", "Rojo","Verde","Amarrillo","Morado","Negro","Rosa","Gris","Naranja","Café","Blanco"]
    
    var nameTempArray: [String] = []
    var nameSearchArray: [String] = []

    
    // MARK: - IBOutlets
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var optionsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        optionsTableView.delegate = self
        optionsTableView.dataSource = self
        optionsTableView.isHidden = true
    }

    //MARK: - IBAction
    
 
    @IBAction func searchEditingDidBegin(_ sender: Any) {
        optionsTableView.isHidden = false
        nameTempArray = nameArray
    }
    
    @IBAction func searchEditingDidEnd(_ sender: Any) {
        optionsTableView.isHidden = true
        nameArray = nameTempArray
    }
    
    @IBAction func searchEditingChanged(_ sender: Any) {
        optionsTableView.isHidden = false
        nameArray = nameTempArray
        filterArray(searchText: searchTextField.text!)
        nameArray = nameSearchArray
        optionsTableView.reloadData()
    }
    
    @IBAction func searchTouchDown(_ sender: Any) {
        optionsTableView.isHidden = false
    }
    
    
    func filterArray(searchText: String) {
        nameSearchArray = nameArray.filter {
            item in return item.lowercased().contains(searchText.lowercased())
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchTextField.text = nameArray[indexPath.row]
        optionsTableView.isHidden = true
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = nameArray[indexPath.row]
        
        return cell
    }
    
    
}

