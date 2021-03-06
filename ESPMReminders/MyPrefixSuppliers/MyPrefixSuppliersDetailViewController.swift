//
// MyPrefixSuppliersDetailViewController.swift
// ESPMReminders
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 11/11/17
//

import Foundation
import SAPFoundation
import SAPOData
import SAPFiori
import SAPCommon

class MyPrefixSuppliersDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var myServiceClass: MyPrefixMyServiceClass<OnlineODataProvider> {
        return self.appDelegate.myServiceClass
    }

    private var validity = [String: Bool]()
    private var _entity: MyPrefixSupplier?
    var entity: MyPrefixSupplier {
        get {
            if self._entity == nil {
                self._entity = self.createEntityWithDefaultValues()
            }
            return self._entity!
        }
        set {
            self._entity = newValue
        }
    }

    private let logger = Logger.shared(named: "MyPrefixSuppliersMasterViewControllerLogger")
    var loadingIndicator: FUILoadingIndicatorView?
    var tableUpdater: TableUpdaterDelegate?
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return self.cellForCity(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixSupplier.city)
        case 1:
            return self.cellForCountry(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixSupplier.country)
        case 2:
            return self.cellForEmailAddress(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixSupplier.emailAddress)
        case 3:
            return self.cellForHouseNumber(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixSupplier.houseNumber)
        case 4:
            return self.cellForPhoneNumber(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixSupplier.phoneNumber)
        case 5:
            return self.cellForPostalCode(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixSupplier.postalCode)
        case 6:
            return self.cellForStreet(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixSupplier.street)
        case 7:
            return self.cellForSupplierID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixSupplier.supplierID)
        case 8:
            return self.cellForSupplierName(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixSupplier.supplierName)
        case 9:
            return self.cellForUpdatedTimestamp(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixSupplier.updatedTimestamp)
        default:
            return CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 10
    }

    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    // MARK: - OData property specific cell creators

    private func cellForCity(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixSupplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.city {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.city = nil
                isNewValueValid = true
            } else {
                if MyPrefixSupplier.city.isOptional || newValue != "" {
                    currentEntity.city = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCountry(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixSupplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.country {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.country = nil
                isNewValueValid = true
            } else {
                if MyPrefixSupplier.country.isOptional || newValue != "" {
                    currentEntity.country = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForEmailAddress(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixSupplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.emailAddress {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.emailAddress = nil
                isNewValueValid = true
            } else {
                if MyPrefixSupplier.emailAddress.isOptional || newValue != "" {
                    currentEntity.emailAddress = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForHouseNumber(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixSupplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.houseNumber {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.houseNumber = nil
                isNewValueValid = true
            } else {
                if MyPrefixSupplier.houseNumber.isOptional || newValue != "" {
                    currentEntity.houseNumber = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPhoneNumber(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixSupplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.phoneNumber {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.phoneNumber = nil
                isNewValueValid = true
            } else {
                if MyPrefixSupplier.phoneNumber.isOptional || newValue != "" {
                    currentEntity.phoneNumber = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPostalCode(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixSupplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.postalCode {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.postalCode = nil
                isNewValueValid = true
            } else {
                if MyPrefixSupplier.postalCode.isOptional || newValue != "" {
                    currentEntity.postalCode = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForStreet(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixSupplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.street {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.street = nil
                isNewValueValid = true
            } else {
                if MyPrefixSupplier.street.isOptional || newValue != "" {
                    currentEntity.street = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForSupplierID(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixSupplier, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.supplierID ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if MyPrefixSupplier.supplierID.isOptional || newValue != "" {
                currentEntity.supplierID = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForSupplierName(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixSupplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.supplierName {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.supplierName = nil
                isNewValueValid = true
            } else {
                if MyPrefixSupplier.supplierName.isOptional || newValue != "" {
                    currentEntity.supplierName = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForUpdatedTimestamp(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixSupplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.updatedTimestamp {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.updatedTimestamp = nil
                isNewValueValid = true
            } else {
                if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                    currentEntity.updatedTimestamp = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    // MARK: - OData functionalities

    @IBAction func updateEntity(_: AnyObject) {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Updating entity in backend.")
        self.myServiceClass.updateEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Update entry failed. Error: \(error)", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityUpdateTitle", value: "Update entry failed", comment: "XTIT: Title of alert message about entity update failure."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            self.logger.info("Update entry finished successfully.")
            FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Updated", comment: "XTIT: Title of alert message about successful entity update."))
            self.tableUpdater?.updateTable()
        }
    }

    @objc func createEntity() {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Creating entity in backend.")
        self.myServiceClass.createEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Create entry failed. Error: \(error)", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityCreationTitle", value: "Create entry failed", comment: "XTIT: Title of alert message about entity creation error."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            self.logger.info("Create entry finished successfully.")
            OperationQueue.main.addOperation({
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyEntityCreationBody", value: "Created", comment: "XMSG: Title of alert message about successful entity creation."))
                    self.tableUpdater?.updateTable()
                }
            })
        }
    }

    func createEntityWithDefaultValues() -> MyPrefixSupplier {
        let newEntity = MyPrefixSupplier()
        // Fill the mandatory properties with default values
        newEntity.supplierID = CellCreationHelper.defaultValueFor(MyPrefixSupplier.supplierID)

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.supplierID == nil || newEntity.supplierID!.isEmpty {
            self.validity["SupplierId"] = false
        }
        self.barButtonShouldBeEnabled()
        return newEntity
    }

    // MARK: - other logic, helper

    @objc func cancel() {
        OperationQueue.main.addOperation({
            self.dismiss(animated: true)
        })
    }

    // Check if all text fields are valid
    private func barButtonShouldBeEnabled() {
        let anyFieldInvalid = self.validity.values.first { field in
            return field == false
        }
        self.navigationItem.rightBarButtonItem?.isEnabled = anyFieldInvalid == nil
    }
}
