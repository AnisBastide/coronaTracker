//
//  CityListTableViewController.swift
//  CoronaTracker
//
//  Created by Anis Bastide on 23/02/2022.
//
import UIKit

class CityListTableViewController: UITableViewController {
    let departement = ["Ain", "Aisne", "Allier", "Alpes-de-Haute-Provence", "Hautes-Alpes", "Alpes-Maritimes", "Ardeche", "Ardennes", "Ariege", "Aube", "Aude", "Aveyron", "Bouches-du-Rhône", "Calvados", "Cantal", "Charente", "Charente-Maritime", "Cher", "Correze", "Corse-du-Sud", "Haute-Corse", "Côte-d'Or", "Côtes d'Armor", "Creuse", "Dordogne", "Doubs", "Drôme", "Eure", "Eure-et-Loir", "Finistere", "Gard", "Haute-Garonne", "Gers", "Gironde", "Herault", "Ille-et-Vilaine", "Indre", "Indre-et-Loire", "Isere", "Jura", "Landes", "Loir-et-Cher", "Loire", "Haute-Loire", "Loire-Atlantique", "Loiret", "Lot", "Lot-et-Garonne", "Lozere", "Maine-et-Loire", "Manche", "Marne", "Haute-Marne", "Mayenne", "Meurthe-et-Moselle", "Meuse", "Morbihan", "Moselle", "Nievre", "Nord", "Oise", "Orne", "Pas-de-Calais", "Puy-de-Dôme", "Pyrenees-Atlantiques", "Hautes-Pyrenees", "Pyrenees-Orientales", "Bas-Rhin", "Haut-Rhin", "Rhône", "Haute-Saône", "Saône-et-Loire", "Sarthe", "Savoie", "Haute-Savoie", "Paris", "Seine-Maritime", "Seine-et-Marne", "Yvelines", "Deux-Sevres", "Somme", "Tarn", "Tarn-et-Garonne", "Var", "Vaucluse", "Vendee", "Vienne", "Haute-Vienne", "Vosges", "Yonne", "Territoire de Belfort", "Essonne", "Hauts-de-Seine", "Seine-St-Denis", "Val-de-Marne", "Val-D'Oise", "Guadeloupe", "Martinique", "Guyane", "La Reunion", "Mayotte"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return departement.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = departement[indexPath.row]
        // Configure the cell...
        return cell
    }
    
    override func tableView(_ tableView : UITableView,didSelectRowAt indexPath:IndexPath){
        var covidDataList = [] as [covidData]
        let dateList = ["11-02-2022","12-02-2022","13-02-2022","14-02-2022","15-02-2022","16-02-2022","17-02-2022"]
        for date in dateList {
            //print(departement[in/dexPath.row])
            getDataFromApi(_city:departement[indexPath.row], _date:date,{covidData in
                covidDataList.append(covidData)
                //print(covidDataList)
                
                if((dateList.firstIndex(of: date)) == dateList.count - 1){
                    DispatchQueue.main.async {
                        if let vc = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(identifier:"Detail") as? DetailViewController{
                            vc.covidDataList = covidDataList
                            //self.present(vc,animated: true,completion: nil)
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                }
            })
        }
    }
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
    
    func getDataFromApi(_city:String,_date:String,_ completion: @escaping (covidData) -> ()){
        print(_city)
        print(_date)
        let url = URL(string:"https://coronavirusapifr.herokuapp.com/data/departement/\(_city)/\(_date)")!
        //print("blblblblblb")
        //print(url)
        let config = URLSessionConfiguration.default

        let session = URLSession(configuration: config)
        let task = session.dataTask(with:url, completionHandler: { data,response,error in
                                    if error != nil {
            print(error?.localizedDescription ?? "error")
            }else {
            if let json = try? JSONSerialization.jsonObject(with:data!,
                                                            options:.mutableContainers){
                if let data = json as? [[String:AnyObject]] {
                    //print(data)
                    let covid = covidData(hosp: data[0]["hosp"] as? NSNumber,incid_hosp: data[0]["incid_hosp"] as? NSNumber,dchosp: data[0]["dchosp"] as? NSNumber ,rea: data[0]["rea"] as? NSNumber,incid_rea: data[0]["incid_rea"] as? NSNumber,reg: data[0]["reg"] as? NSNumber ,lib_dep: data[0]["lib_dep"] as? String,lib_reg: data[0]["lib_reg"] as? String,R: data[0]["R"] as? NSNumber,date:_date)
                    completion(covid)
                }}
            };
        })
        task.resume()
    }
}


struct covidData{
    let hosp : NSNumber?
    let incid_hosp : NSNumber?
    let dchosp : NSNumber?
    let rea : NSNumber?
    let incid_rea : NSNumber?
    let reg : NSNumber?
    let lib_dep : String?
    let lib_reg : String?
    let R : NSNumber?
    let date : String?
}
