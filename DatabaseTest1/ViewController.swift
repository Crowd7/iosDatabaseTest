//
//  ViewController.swift
//  DatabaseTest1
//
//  Created by 李昀璋 on 2024/4/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    let viewModel = MainViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell01")
        
    }

    @IBAction private func onClickInsert(_ sender: UIButton) {
        
        viewModel.insertAccount(name: "Crowd", tele: "0929115999")
        
        print("inserted")
        
        
    }
    
    @IBAction private func onClickQuery(_ sender: UIButton) {
        viewModel.queryAccountAll()
        
        tableView.reloadData()
        print("query all")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.accountList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell01", for: indexPath) as! TableViewCell
        
        let m = viewModel.accountList[indexPath.row]
        
        cell.lblName.text = m.name
        cell.lblTele.text = m.tele
        
        return cell
    }
    
    
    
    
    
    
}
