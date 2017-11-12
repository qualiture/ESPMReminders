//
// MyPrefixProductsDetailViewController.swift
// ESPMReminders
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 11/11/17
//

import Foundation
import SAPFoundation
import SAPOData
import SAPFiori
import SAPCommon

class MyPrefixProductsDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var myServiceClass: MyPrefixMyServiceClass<OnlineODataProvider> {
        return self.appDelegate.myServiceClass
    }

    private var validity = [String: Bool]()
    private var _entity: MyPrefixProduct?
    var entity: MyPrefixProduct {
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

    private let logger = Logger.shared(named: "MyPrefixProductsMasterViewControllerLogger")
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
            return self.cellForCategory(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.category)
        case 1:
            return self.cellForCategoryName(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.categoryName)
        case 2:
            return self.cellForCurrencyCode(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.currencyCode)
        case 3:
            return self.cellForDimensionDepth(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.dimensionDepth)
        case 4:
            return self.cellForDimensionHeight(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.dimensionHeight)
        case 5:
            return self.cellForDimensionUnit(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.dimensionUnit)
        case 6:
            return self.cellForDimensionWidth(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.dimensionWidth)
        case 7:
            return self.cellForLongDescription(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.longDescription)
        case 8:
            return self.cellForName(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.name)
        case 9:
            return self.cellForPictureUrl(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.pictureUrl)
        case 10:
            return self.cellForPrice(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.price)
        case 11:
            return self.cellForProductID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.productID)
        case 12:
            return self.cellForQuantityUnit(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.quantityUnit)
        case 13:
            return self.cellForShortDescription(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.shortDescription)
        case 14:
            return self.cellForSupplierID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.supplierID)
        case 15:
            return self.cellForUpdatedTimestamp(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.updatedTimestamp)
        case 16:
            return self.cellForWeight(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.weight)
        case 17:
            return self.cellForWeightUnit(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: MyPrefixProduct.weightUnit)
        default:
            return CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 18
    }

    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    // MARK: - OData property specific cell creators

    private func cellForCategory(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.category {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.category = nil
                isNewValueValid = true
            } else {
                if MyPrefixProduct.category.isOptional || newValue != "" {
                    currentEntity.category = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCategoryName(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.categoryName {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.categoryName = nil
                isNewValueValid = true
            } else {
                if MyPrefixProduct.categoryName.isOptional || newValue != "" {
                    currentEntity.categoryName = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCurrencyCode(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.currencyCode {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.currencyCode = nil
                isNewValueValid = true
            } else {
                if MyPrefixProduct.currencyCode.isOptional || newValue != "" {
                    currentEntity.currencyCode = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForDimensionDepth(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.dimensionDepth {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.dimensionDepth = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.dimensionDepth = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForDimensionHeight(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.dimensionHeight {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.dimensionHeight = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.dimensionHeight = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForDimensionUnit(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.dimensionUnit {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.dimensionUnit = nil
                isNewValueValid = true
            } else {
                if MyPrefixProduct.dimensionUnit.isOptional || newValue != "" {
                    currentEntity.dimensionUnit = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForDimensionWidth(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.dimensionWidth {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.dimensionWidth = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.dimensionWidth = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForLongDescription(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.longDescription {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.longDescription = nil
                isNewValueValid = true
            } else {
                if MyPrefixProduct.longDescription.isOptional || newValue != "" {
                    currentEntity.longDescription = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForName(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.name {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.name = nil
                isNewValueValid = true
            } else {
                if MyPrefixProduct.name.isOptional || newValue != "" {
                    currentEntity.name = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPictureUrl(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.pictureUrl {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.pictureUrl = nil
                isNewValueValid = true
            } else {
                if MyPrefixProduct.pictureUrl.isOptional || newValue != "" {
                    currentEntity.pictureUrl = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPrice(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.price {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.price = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.price = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForProductID(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.productID ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if MyPrefixProduct.productID.isOptional || newValue != "" {
                currentEntity.productID = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForQuantityUnit(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.quantityUnit {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.quantityUnit = nil
                isNewValueValid = true
            } else {
                if MyPrefixProduct.quantityUnit.isOptional || newValue != "" {
                    currentEntity.quantityUnit = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForShortDescription(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.shortDescription {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.shortDescription = nil
                isNewValueValid = true
            } else {
                if MyPrefixProduct.shortDescription.isOptional || newValue != "" {
                    currentEntity.shortDescription = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForSupplierID(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.supplierID {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.supplierID = nil
                isNewValueValid = true
            } else {
                if MyPrefixProduct.supplierID.isOptional || newValue != "" {
                    currentEntity.supplierID = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForUpdatedTimestamp(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
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

    private func cellForWeight(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.weight {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.weight = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.weight = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForWeightUnit(tableView: UITableView, indexPath: IndexPath, currentEntity: MyPrefixProduct, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.weightUnit {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.weightUnit = nil
                isNewValueValid = true
            } else {
                if MyPrefixProduct.weightUnit.isOptional || newValue != "" {
                    currentEntity.weightUnit = newValue
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

    func createEntityWithDefaultValues() -> MyPrefixProduct {
        let newEntity = MyPrefixProduct()
        // Fill the mandatory properties with default values
        newEntity.productID = CellCreationHelper.defaultValueFor(MyPrefixProduct.productID)

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.productID == nil || newEntity.productID!.isEmpty {
            self.validity["ProductId"] = false
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
