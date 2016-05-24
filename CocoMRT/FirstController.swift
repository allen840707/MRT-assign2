//
//  FirstController.swift
//  CocoMRT
//
//  Created by allen on 2016/5/19.
//  Copyright © 2016年 allen. All rights reserved.
//

import UIKit
import ObjectMapper


struct MRT {
    var name: String!
    var color: [UIColor] = []
    var lines: [String: String]!{
            didSet {
                let keyArray = Array(lines.keys)
                for key in keyArray {
                    switch key {
                    
                    case "文湖線":
                        //                    colors.append(UIColor.brownColor())
                        color.append( UIColor (red: 158/255, green: 101/255, blue: 46/255, alpha: 1))
                    case "板南線":
                        color.append( UIColor (red: 0/255, green: 94/255, blue: 184/255, alpha: 1))
                    case "淡水信義線":
                        color.append( UIColor (red: 203/255, green: 44/255, blue: 48/255, alpha: 1))
                    case "松山新店線":
                        color.append( UIColor (red: 0/255, green: 199/255, blue: 73/255, alpha: 1))
                    case "中和新蘆線":
                        color.append( UIColor (red: 255/255, green: 163/255, blue: 0/255, alpha: 1))
                    case "小碧潭支線":
                        color.append( UIColor (red: 206/255, green: 220/255, blue: 0/255, alpha: 1))
                    case "貓空纜車":
                        color.append( UIColor (red: 199/255, green: 185/255, blue: 51/255, alpha: 1))
                    case "新北投支線":
                        color.append( UIColor (red: 248/255, green: 144/255, blue: 165/255, alpha: 1))
                    default:
                        color.append( UIColor.blackColor())
                    
                    }
                }
            }
        
    }
    var coordiante: [Float]!

}

extension MRT: Mappable {
    init?(_ map: Map) {
    }
    
    mutating func mapping(map: Map) {
        self.name <- map["name"]
        self.lines <- map["lines"]
        self.coordiante <- map["coordinate"]
    }
    
}


class FirstController: UITableViewController {
    
    var MRTdata: [MRT]!
    var wholedata : [[MRT]] = []
    
    var wenhu : [MRT] = []
    var Bannan :[MRT] = []
    var Songshan : [MRT] = []
    var Tamsui : [MRT] = []
    var xinlu :[MRT] = []
    var newbato :[MRT] = []
    var bintan :[MRT] = []
    var moucon :[MRT] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("MRT", ofType: "json")!
        let  jsonContent = try! String(contentsOfFile: path)
        //NSLog(jsonContent)
        
        let MRTArray = Mapper<MRT>().mapArray(jsonContent)!
        //print(MRTArray)
       
        //var MRTdata :MRT = MRTArray
        
        self.MRTdata = MRTArray
        
        
        for  s in 0...(MRTdata.count-1) {
            
            for (key,value) in MRTdata[s].lines {
                if key == "文湖線" {
                    wenhu.append(MRTdata[s])
                                  }
                if key == "板南線" {
                    Bannan.append(MRTdata[s])
                }
                if key == "中和新蘆線" {
                    xinlu.append(MRTdata[s])
                }
                if key == "淡水信義線" {
                    Tamsui.append(MRTdata[s])
                }
                if key == "貓空纜車" {
                    moucon.append(MRTdata[s])
                }
                if key == "小碧潭支線" {
                    bintan.append(MRTdata[s])
                }
                if key == "松山新店線" {
                    Songshan.append(MRTdata[s])
                }
                if key == "新北投支線" {
                    newbato.append(MRTdata[s])
                }
            }//for key loop
    
        }
      
        wholedata.append(wenhu)
        wholedata.append(Bannan)
        wholedata.append(xinlu)
        wholedata.append(Tamsui)
        wholedata.append(moucon)
        wholedata.append(bintan)
        wholedata.append(Songshan)
        wholedata.append(newbato)
       
       // print (wholedata[4])
       // print (wholedata[4][2].name)
      //  print (wholedata[0][2].lines.values.)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return wholedata.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wholedata[section].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MRTCell
 
        cell.stationName.text = wholedata[indexPath.section][indexPath.row].name
        cell.stationName.layer.masksToBounds = true
        
        cell.line1.layer.cornerRadius = 8
        cell.line2.layer.cornerRadius = 8
        
        if wholedata[indexPath.section][indexPath.row].lines.count == 1 {
            let valuearray = Array(wholedata[indexPath.section][indexPath.row].lines.values)
        cell.line1.text = valuearray[0]
        cell.line1.backgroundColor = wholedata[indexPath.section][indexPath.row].color[0]
        cell.line2.text = ""
        cell.line2.backgroundColor = UIColor.whiteColor()
        cell.line1.layer.masksToBounds = true
        cell.line2.layer.masksToBounds = true
            
                }
        else if wholedata[indexPath.section][indexPath.row].lines.count == 2 {
            let valuearray = Array(wholedata[indexPath.section][indexPath.row].lines.values)
            
            cell.line1.text = valuearray[0]
            cell.line1.backgroundColor = wholedata[indexPath.section][indexPath.row].color[0]
            cell.line2.text = valuearray[1]
            cell.line2.backgroundColor = wholedata[indexPath.section][indexPath.row].color[1]
            cell.line2.layer.masksToBounds = true
            cell.line1.layer.masksToBounds = true
        }
        // Configure the cell...

        return cell

        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "文湖線"
        case 1:
            return "板南線"
        case 2:
            return "中和新蘆線"
        case 3:
            return "淡水信義線"
        case 4:
            return "貓空纜車"
        case 5:
            return "小碧潭支線"
        case 6:
            return "松山新店線"
        case 7:
            return "新北投支線"
            
        default:
            break
        }
            return "not in line"
    }
        
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
     if segue.identifier == "sendData" {
        let destViewController = segue.destinationViewController as! secondViewController
        if let indexPath = self.tableView.indexPathForSelectedRow {
            destViewController.receiveData = wholedata[indexPath.section][indexPath.row]

        }
        //destViewController.receiveData = wholedata[0][0]
        
        }
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
