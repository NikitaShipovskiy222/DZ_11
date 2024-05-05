//
//  MessengeViewController.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 05/05/2024.
//

import UIKit

class MessengeViewController: UIViewController {
    
    private let items = ItemMessenge.mockData()
    
    private lazy var tabelMessenge: UITableView = {
        $0.dataSource = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.delegate = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Сообщения"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tabelMessenge)
        
    }
    

}

extension MessengeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        let item = items[indexPath.row]
        
        config.text = item.name
        config.textProperties.font = UIFont.systemFont(ofSize: 14, weight: .light)
        config.secondaryText = item.discription
        config.secondaryTextProperties.font = UIFont.systemFont(ofSize: 12, weight: .light)
        
        config.image = UIImage(named: item.image)
        config.imageProperties.maximumSize = CGSize(width: 56, height: 56)
        config.imageProperties.cornerRadius = 28
    
        cell.contentConfiguration = config
        return cell
        
        
    }
}

extension MessengeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tabelMessenge.deleteRows(at: [indexPath], with: .automatic)
    }
}
