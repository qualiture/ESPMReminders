//
// CellCreationHelper.swift
// ESPMReminders
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 11/11/17
//

import Foundation
import UIKit
import SAPOData
import SAPFiori

class CellCreationHelper {
    static func cellForProperty(tableView: UITableView, indexPath: IndexPath, entity: EntityValue, property: Property, value: String, changeHandler: @escaping ((String) -> Bool)) -> UITableViewCell {
        let cell: UITableViewCell!

        if property.dataType.isBasic {
            // The property is a key or we are creating new entity
            if !property.isKey || entity.isNew {
                // .. that CAN be edited
                cell = self.cellWithEditableContent(tableView: tableView, indexPath: indexPath, property: property, with: value, changeHandler: changeHandler)
            } else {
                // .. that CANNOT be edited
                cell = self.cellWithNonEditableContent(tableView: tableView, indexPath: indexPath, for: property.name, with: value)
            }
        } else {
            // A complex property
            cell = self.cellWithNonEditableContent(tableView: tableView, indexPath: indexPath, for: property.name, with: "...")
        }
        return cell
    }

    static func cellForDefault(tableView: UITableView, indexPath: IndexPath) -> FUISimplePropertyFormCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUISimplePropertyFormCell.reuseIdentifier, for: indexPath) as! FUISimplePropertyFormCell
        cell.textLabel!.text = ""
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.keyName = "default"

        return cell
    }

    static func cellWithEditableContent(tableView: UITableView, indexPath: IndexPath, property: Property, with value: String, changeHandler: @escaping ((String) -> Bool)) -> FUISimplePropertyFormCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUISimplePropertyFormCell.reuseIdentifier, for: indexPath) as! FUISimplePropertyFormCell

        cell.isEditable = true
        cell.keyName = property.name
        cell.value = value
        cell.isTrackingLiveChanges = true

        if !property.isOptional {
            cell.valueTextField!.placeholder = NSLocalizedString("keyRequiredPlaceholder", value: "Required", comment: "XSEL: Placeholder text for required but currently empty textfield.")
        }

        cell.onChangeHandler = { (newValue) -> Void in
            let isNewValueValid = changeHandler(newValue)
            if !isNewValueValid {
                cell.valueTextField.textColor = UIColor.red
            } else {
                cell.valueTextField.textColor = UIColor.gray
            }
        }

        return cell
    }

    static func cellWithNonEditableContent(tableView: UITableView, indexPath: IndexPath, for key: String, with value: String) -> FUISimplePropertyFormCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUISimplePropertyFormCell.reuseIdentifier, for: indexPath) as! FUISimplePropertyFormCell

        cell.keyName = key
        cell.value = value

        return cell
    }

    static func objectCellWithNonEditableContent(tableView: UITableView, indexPath: IndexPath, key: String, value: String) -> FUIObjectTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath as IndexPath) as! FUIObjectTableViewCell
        cell.headlineText = value
        cell.footnoteText = key
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    static func defaultValueFor(_ property: Property) -> Double {
        if let defaultValue = property.defaultValue {
            return Double(defaultValue.toString())!
        } else {
            return Double()
        }
    }

    static func defaultValueFor(_ property: Property) -> BigDecimal {
        if let defaultValue = property.defaultValue {
            return (defaultValue as! DecimalValue).value
        } else {
            return BigDecimal.fromDouble(Double())
        }
    }

    static func defaultValueFor(_ property: Property) -> Int {
        if let defaultValue = property.defaultValue {
            return Int(defaultValue.toString())!
        } else {
            return Int()
        }
    }

    static func defaultValueFor(_ property: Property) -> BigInteger {
        if let defaultValue = property.defaultValue {
            return BigInteger(defaultValue.toString())
        } else {
            return BigInteger.fromInt(Int())
        }
    }

    static func defaultValueFor(_ property: Property) -> Int64 {
        if let defaultValue = property.defaultValue {
            return Int64(defaultValue.toString())!
        } else {
            return Int64()
        }
    }

    static func defaultValueFor(_ property: Property) -> Float {
        if let defaultValue = property.defaultValue {
            return Float(defaultValue.toString())!
        } else {
            return Float()
        }
    }

    static func defaultValueFor(_ property: Property) -> LocalDateTime {
        if let defaultValue = property.defaultValue {
            return LocalDateTime.parse(defaultValue.toString())!
        } else {
            return LocalDateTime.now()
        }
    }

    static func defaultValueFor(_ property: Property) -> GlobalDateTime {
        if let defaultValue = property.defaultValue {
            return GlobalDateTime.parse(defaultValue.toString())!
        } else {
            return GlobalDateTime.now()
        }
    }

    static func defaultValueFor(_ property: Property) -> GuidValue {
        if let defaultValue = property.defaultValue {
            return GuidValue.parse(defaultValue.toString())!
        } else {
            return GuidValue.random()
        }
    }

    static func defaultValueFor(_ property: Property) -> String {
        if let defaultValue = property.defaultValue {
            return defaultValue.toString()
        } else {
            return ""
        }
    }

    static func defaultValueFor(_ property: Property) -> Bool {
        if let defaultValue = property.defaultValue {
            return Bool(defaultValue.toString()) ?? false
        } else {
            return Bool()
        }
    }
}
