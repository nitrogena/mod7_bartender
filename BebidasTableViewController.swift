//
//  BebidasTableViewController.swift
//  BartenderProy
//
//  Created by Invitado on 08/10/16.
//  Copyright © 2016 Invitado. All rights reserved.
//

import UIKit

class BebidasTableViewController: UITableViewController {
    
    var arrBebidas:NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        let bdlPath = NSBundle.mainBundle().pathForResource("Drinks", ofType: "plist")
        self.arrBebidas = NSArray(contentsOfFile:bdlPath!)
        self.navigationItem.title="Drinks"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.arrBebidas!.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        
        // Configure the cell...
        let dictInfo = self.arrBebidas![indexPath.row] as! NSDictionary
        cell.textLabel?.text = (dictInfo["name"] as! String)
        
        //DE FORMA NATIVA LA CELDA YA TIENE UNA IMAGEN
        let strImagen = (dictInfo["image"] as! String)
        cell.imageView?.image = UIImage(named:strImagen)
        
        
        let itemSize:CGSize = CGSizeMake(50, 50)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.mainScreen().scale)
        let imageRect : CGRect = CGRectMake(0, 0, itemSize.width, itemSize.height)
        cell.imageView!.image?.drawInRect(imageRect)
        cell.imageView!.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
       
        
        
        return cell
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
        */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        //a donde va el seague
        //Necesitamos algo por lo que hacemos el cast
        let destino = segue.destinationViewController as! DetalleBebidasViewController
        
        // Pass the selected object to the new view controller.
        let elIndexPath = self.tableView.indexPathForSelectedRow
        let dictInfo = self.arrBebidas! [elIndexPath!.row] as! NSDictionary
        destino.info = dictInfo
        
        
        
    }


}
