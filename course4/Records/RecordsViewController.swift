//
//  RecordsViewController.swift
//  course4
//
//  Created by Вячеслав Поляков on 02.09.2021.
//

import UIKit

class RecordsViewController: UIViewController {
    
    var questionViewController = GameViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension RecordsViewController: UITableViewDelegate {
    
}


extension RecordsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let record = Game.shared.records[indexPath.row]
        
        let localizedDate = DateFormatter.localizedString(
            from: record.date,
            dateStyle: .medium,
            timeStyle: .medium
        )
        
        cell.textLabel?.text = localizedDate
        cell.detailTextLabel?.text = "\(record.answerQuestions)/\(record.totalQuestions)"
    }
    
}
