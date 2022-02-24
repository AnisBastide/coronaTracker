//
//  CityListTableViewController.swift
//  CoronaTracker
//
//  Created by Anis Bastide on 23/02/2022.
//

import UIKit

class CityListTableViewController: UITableViewController {
    let url = URL(string:"https://coronavirusapifr.herokuapp.com/data/departement/Paris/12-02-2022")!
    override func viewDidLoad() {
        super.viewDidLoad()
        let decoder = JSONDecoder()
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with:url){
            (data, response,error) in
            if error != nil{
                print(error!.localizedDescription)
            }
            else{
                if let json = try? JSONSerialization.jsonObject(with:data!,
                                                                options:.mutableContainers){
                    if let data = json as? [[String:AnyObject]]{
                        print(data)
                        let covid = covidData(data['hosp'],data['incid_hosp'],data['rea'],data['incid_rea'],data['dchosp'],data['reg'],data['lib_reg'],data['lib_dep'],data['R'])
                        print(covid)
//                        if let items = data[1]["items"] as? [[String:AnyObject]]{
//                            for item in items {
//                                print(item["titre"]!)
//                            }
                        }
                    }
                }
            }
        task.resume()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


struct covidData{
    let hosp : Int
    let incid_hosp : Int
    let dchosp : Int
    let rea : Int
    let incid_rea : Int
    let reg : String
    let lib_dep : String
    let lib_reg : String
    let R : Int
}