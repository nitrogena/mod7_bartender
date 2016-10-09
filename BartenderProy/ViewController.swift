//
//  ViewController.swift
//  BartenderProy
//
//  Created by Invitado on 08/10/16.
//  Copyright © 2016 Invitado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContrasena: UITextField!
    
    
    @IBAction func btnEntrar(sender: AnyObject) {
        //ES UN TOUCH UP INSIDE
        if self.txtUsuario.text != "" {
            if self.txtContrasena.text != ""{
                self.performSegueWithIdentifier("login", sender: self)
            }
        }else{
            //variable inmutable
            let alertControl:UIAlertController = UIAlertController(title: "Mensaje", message: "Todos los campos son requeridos. Por favor, ingréselos", preferredStyle: .Alert)
            
            let alertAct = UIAlertAction(title:"Aceptar", style: .Default, handler: nil)
            alertControl.addAction(alertAct)
            self.presentViewController(alertControl, animated: true, completion: nil)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

