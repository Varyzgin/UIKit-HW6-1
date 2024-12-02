//
//  ViewController.swift
//  UIKit-HW6-1
//
//  Created by Дима on 12/2/24.
//

import UIKit

class ViewController: UIViewController {
    lazy var data = CardContent.mockData()
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.separatorStyle = .none
        $0.register(ViewCell.self, forCellReuseIdentifier: ViewCell.identifier)
        return $0
    }(UITableView(frame: view.frame, style: .plain))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewCell.identifier, for: indexPath) as? ViewCell
        else { return UITableViewCell() }
        let card = data[indexPath.row]
        cell.setupCell(card: card)
        cell.selectionStyle = .none

        return cell
    }
}

