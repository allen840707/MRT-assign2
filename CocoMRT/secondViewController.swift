//
//  secondViewController.swift
//  CocoMRT
//
//  Created by allen on 2016/5/24.
//  Copyright © 2016年 allen. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    @IBOutlet weak var namelabel: UILabel!
 
    @IBOutlet weak var fulllinelabel: UILabel!
    
    @IBOutlet weak var onelinelabel: UILabel!
  
    @IBOutlet weak var twolinelabel: UILabel!
    
    var receiveData: MRT!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
   
        self.navigationItem.title = receiveData.name
        namelabel.text = receiveData.name
        namelabel.layer.masksToBounds = true
        fulllinelabel.layer.masksToBounds = true
        onelinelabel.layer.masksToBounds  = true
        twolinelabel.layer.masksToBounds = true
        
        if receiveData.lines.count == 1 {
            let valuearray = Array(receiveData.lines.keys)
            fulllinelabel.text = valuearray[0]
            fulllinelabel.backgroundColor = receiveData.color[0]
           
            onelinelabel.text = ""
            
            twolinelabel.text = ""
            
        }
        else if receiveData.lines.count == 2 {
            let valuearray = Array(receiveData.lines.keys)
            
            fulllinelabel.text = ""
            onelinelabel.text = valuearray[0]
            //onelinelabel.center.x = (namelabel.center.x)/2
            onelinelabel.backgroundColor = receiveData.color[0]
            twolinelabel.text = valuearray[1]
            //twolinelabel.center.x = (namelabel.center.x)*2/3
            twolinelabel.backgroundColor = receiveData.color[1]
        }
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
