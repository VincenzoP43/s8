//
//  DetailViewController.swift
//  FoodPin
//
//  Created by Vincenzo Persiano on 30/05/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet var restaurantNameView: UILabel!
    @IBOutlet var restaurantLocationView: UILabel!
    @IBOutlet var restaurantTypeView: UILabel!
    
    var restaurantImageName = ""
    var restaurantDetailName = ""
    var restaurantDetailLocation = ""
    var restaurantDetailType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurantImageName)
        restaurantNameView.text = restaurantDetailName
        restaurantLocationView.text = restaurantDetailLocation
        restaurantTypeView.text = restaurantDetailType
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
