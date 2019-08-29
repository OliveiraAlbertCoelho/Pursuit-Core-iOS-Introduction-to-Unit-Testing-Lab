//
//  SecondViewController.swift
//  unitTest
//
//  Created by albert coelho oliveira on 8/29/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    var starWarMovie = [Movie](){
        didSet{
    tableCell.reloadData()
        }}
    @IBOutlet weak var tableCell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableCell.delegate = self
        tableCell.dataSource = self
        loadData()
    }
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "starWars", ofType: "json") else {
            fatalError("coundn't find json file")}
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try
                Data(contentsOf: url)
            let starJson = try starWrapper.getStarWars(fron: data)
            starWarMovie = starJson.results
        }
        catch {
            print(error)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let starWarDetailVc = segue.destination as? starWarsDetailViewController else {
            fatalError("Unexpected segue")
        }
        guard let selectedIndexPath = tableCell.indexPathForSelectedRow
            else { fatalError("No row selected") }
        starWarDetailVc.movie = starWarMovie[selectedIndexPath.row]
    }
}
extension StarWarsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWarMovie.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableCell.dequeueReusableCell(withIdentifier: "starWar")
        cell?.textLabel?.text = starWarMovie[indexPath.row].title
        return cell!
    }
}
