//
//  ViewController.swift
//  Api(A)
//
//  Created by undhad kaushik on 01/03/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var myTabelView: UITableView!
    
    var arr: Main!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nibregister()
        apiCall()
    }
    
    private func nibregister(){
        let nibFile: UINib = UINib(nibName: "TableViewCell", bundle: nil)
        myTabelView.register(nibFile, forCellReuseIdentifier: "cell")
        myTabelView.dataSource = self
        myTabelView.delegate = self
        myTabelView.separatorStyle = .none
    }
    
    
    private func apiCall(){
        AF.request("https://ipinfo.io/161.185.160.93/geo", method: .get).responseData{ [self] response in
            debugPrint(response)
            
            if response.response?.statusCode == 200 {
                guard let apiData = response.data else { return }
                do{
                    let result = try JSONDecoder().decode(Main.self, from: apiData)
                    print(result)
                    arr = result
                    myTabelView.reloadData()
                    
                }catch{
                    print(error.localizedDescription)
                }
            }else{
                print("sumthing went rong")
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr?.ip.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.dataSourceNameLabel.text = arr.ip
        cell.descriptionLabel.text = arr.city
        cell.datasetNameLabel.text = arr.region
        cell.datasetLinkLabel.text = arr.country
        cell.tabelIdLabel.text = arr.loc
        cell.topicLabel.text = arr.org
        cell.subTopicLabel.text = arr.postal
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
}




struct Main: Decodable{
    var ip: String
    var city: String
    var region: String
    var country: String
    var loc: String
    var org: String
    var postal: String
    var timezone: String
    var readme: String
    
    private enum CodingKeys: String,CodingKey{
        case ip = "ip"
        case city = "city"
        case region = "region"
        case country = "country"
        case loc = "loc"
        case org = "org"
        case postal = "postal"
        case timezone = "timezone"
        case readme = "readme"
    }
    
}
