//
//  campusnewsViewController.swift
//  PencilBox
//
//  Created by gyp on 4/16/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

class campusnewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,NSXMLParserDelegate {
    @IBOutlet var newsTableView: UITableView!
    var parser:NSXMLParser = NSXMLParser()
    private var newsTitles:[String] = []
    var isParsingTitle:Bool = false
    var isParsingItem:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        newsTableView.dataSource = self
        if let urlToSend:NSURL = NSURL(string: "http://publish.wm.edu/recent.rss"){
            parser = NSXMLParser(contentsOfURL: urlToSend)!
            parser.delegate = self
            let parseSuccess:Bool = parser.parse()
            if parseSuccess{
                print("parse done")
            }
            else{
                print("problem parsing")
            }
        }
        else{
            print("rss url failed")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTitles.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:campusnewsCell = self.newsTableView.dequeueReusableCellWithIdentifier("campusnewscell", forIndexPath: indexPath) as! campusnewsCell
        cell.newsTextStr = newsTitles[indexPath.row]
        return cell
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "title" {
            isParsingTitle = false
            print("\n")
        }else if elementName == "item"{
            isParsingItem = false
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if isParsingItem{
            if isParsingTitle{
                print(string)
                newsTitles.append(string)
            }
        }
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if elementName == "title" {
            isParsingTitle = true
        }else if elementName == "item"{
            isParsingItem = true
        }
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
