//
//  CustomerViewController.swift
//  ESPMReminders
//
//  Created by Robin van het Hof on 12/11/2017.
//  Copyright © 2017 SAP. All rights reserved.
//

import Foundation
import SAPFoundation
import SAPOData
import SAPFiori
import SAPCommon

import EventKit

class CustomerViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var myServiceClass: MyPrefixMyServiceClass<OnlineODataProvider> {
        return self.appDelegate.myServiceClass
    }
    
    private var entities: [MyPrefixCustomer] = [MyPrefixCustomer]()
    private let logger = Logger.shared(named: "CustomerViewControllerLogger")
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    var loadingIndicator: FUILoadingIndicatorView?

    private var activities = [FUIActivityItem.phone, FUIActivityItem.email, FUIActivityItem.detail]

    var eventStore: EKEventStore!
    var calendars:Array<EKCalendar> = []
    var espmCalendar: EKCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = []
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 98
        self.updateTable()
        
        eventStore = EKEventStore()
        eventStore.requestAccess(to: EKEntityType.reminder, completion: {(granted, error) in
            if !granted {
                print("Access to reminders not granted")
            }
        })
        
        calendars = eventStore.calendars(for: EKEntityType.reminder)
        
        checkIfESPMReminderListExists()
    }

    func checkIfESPMReminderListExists() {
        var calenderExists = false
        
        for calendar in calendars as [EKCalendar] {
            if calendar.title == "ESPM" {
                calenderExists = true
                self.espmCalendar = calendar
            }
        }
        
        if !calenderExists {
            createESPMReminderList()
        }
    }
    
    func createESPMReminderList() {
        espmCalendar = EKCalendar(for: EKEntityType.reminder, eventStore: self.eventStore)
        espmCalendar.title="ESPM"
        espmCalendar.source = self.eventStore.defaultCalendarForNewReminders()?.source
    
        do {
            try self.eventStore.saveCalendar(espmCalendar, commit:true)
        } catch let error {
            logger.error("Calendar creation failed with error \(error.localizedDescription)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        logger.info("Number of customers: \(self.entities.count)")
        
        return self.entities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! FUIContactCell
        
        let customer = self.entities[indexPath.row]
        
        cell.detailImage = #imageLiteral(resourceName: "PersonPlaceholder")
        
        cell.headlineText = "\(customer.firstName!) \(customer.lastName!)"
        cell.subheadlineText = "\(customer.city!), \(customer.country!)"
        
        cell.descriptionText = customer.phoneNumber
        cell.splitPercent = CGFloat(0.3) // Default is 30%

        cell.activityControl.addActivities(activities)
        cell.activityControl.maxVisibleItems = 4
        cell.onActivitySelectedHandler = { activityItem in
            switch activityItem {
            case FUIActivityItem.phone:
                guard let number = URL(string: "tel://" + customer.phoneNumber!) else { return }
                if UIApplication.shared.canOpenURL(number) {
                    UIApplication.shared.open(number)
                }
            case FUIActivityItem.message:
                guard let sms = URL(string: "sms:" + customer.phoneNumber!) else { return }
                if UIApplication.shared.canOpenURL(sms) {
                    UIApplication.shared.open(sms)
                }
            case FUIActivityItem.detail:
                self.createReminder(customer: customer)
            default:
                break
            }
        }
        
        return cell
    }

    func createReminder(customer: MyPrefixCustomer) {
        let reminder = EKReminder(eventStore: self.eventStore)
        
        reminder.title = "Call \(customer.firstName!) \(customer.lastName!)"
        reminder.notes = "Phone: \(customer.phoneNumber!)\nEmail: \(customer.emailAddress!)"
        
        reminder.calendar = self.espmCalendar
        
        do {
            try self.eventStore.save(reminder, commit: true)
            
            let alert = UIAlertController(title: NSLocalizedString("keyReminderCreated", value: "Reminder has been created", comment: "XTIT: Title of reminder creation pop up."), message: "Reminder has been created", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: self.okTitle, style: .default))
            self.present(alert, animated: true, completion: nil)
            
        } catch let error {
            print("Reminder failed with error \(error.localizedDescription)")
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Data accessing
    
    func requestEntities(completionHandler: @escaping (Error?) -> Void) {
        // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
        let query = DataQuery().selectAll().top(20)
        self.myServiceClass.fetchCustomers(matching: query) { customers, error in
            guard let customers = customers else {
                completionHandler(error!)
                return
            }
            self.entities = customers
            completionHandler(nil)
        }
    }

    // MARK: - Table update
    
    func updateTable() {
        self.showFioriLoadingIndicator()
        let oq = OperationQueue()
        oq.addOperation({
            self.loadData {
                self.hideFioriLoadingIndicator()
            }
        })
    }
    
    private func loadData(completionHandler: @escaping () -> Void) {
        self.requestEntities { error in
            defer {
                completionHandler()
            }
            if let error = error {
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorLoadingData", value: "Loading data failed!", comment: "XTIT: Title of loading data error pop up."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                self.logger.error("Could not update table. Error: \(error)", error: error)
                return
            }
            OperationQueue.main.addOperation({
                self.tableView.reloadData()
                self.logger.info("Table updated successfully!")
            })
        }
    }
    
    @objc func refresh() {
        let oq = OperationQueue()
        oq.addOperation({
            self.loadData {
                OperationQueue.main.addOperation({
                    self.refreshControl?.endRefreshing()
                })
            }
        })
    }
}
