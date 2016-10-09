//
//  DetalleBebidasViewController.swift
//  BartenderProy
//
//  Created by Invitado on 09/10/16.
//  Copyright © 2016 Invitado. All rights reserved.
//

import UIKit

class DetalleBebidasViewController: UIViewController {
    var info:NSDictionary?
    
    
    @IBOutlet weak var txtVwNombre: UITextView!
    @IBOutlet weak var txtVwDetalles: UITextView!

    @IBOutlet weak var imgVwImg: UIImageView!
    @IBOutlet weak var txtVwIngredientes: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.txtVwNombre!.text = self.info?["name"] as! String
        self.txtVwDetalles!.text = self.info?["directions"] as! String
        self.txtVwIngredientes!.text = self.info?["ingredients"] as! String
        
        let strImagen = self.info?["image"] as! String
        self.imgVwImg.image = UIImage(named:strImagen)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
