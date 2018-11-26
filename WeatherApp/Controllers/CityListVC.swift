//
//  CityListVC.swift
//  WeatherApp
//
//  Created by Rauan on 11/26/18.
//  Copyright © 2018 Rauan. All rights reserved.
//

import UIKit

class CityListVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
let nib = UINib(nibName: "CityListCell", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nib, forCellReuseIdentifier: "CityListCell")
        navigationItem.title = "Главная"
            }
    


    
    
    
    

}



extension CityListVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CityListCell", for: indexPath) as? CityListCell {
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CityWeatherVC")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Список городов"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    
    
    
}
