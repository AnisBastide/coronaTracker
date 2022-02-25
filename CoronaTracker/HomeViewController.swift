//
//  HomeViewController.swift
//  CoronaTracker
//
//  Created by Anis Bastide on 25/02/2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(_ sender: Any) {
        if let vc = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(identifier:"TabBar") as? TabBarController{
            //self.present(vc,animated: true,completion: nil)
            self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }
    
}
