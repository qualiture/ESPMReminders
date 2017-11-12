//
// CollectionType.swift
// ESPMReminders
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 11/11/17
//

import Foundation

enum CollectionType: String {

    case myPrefixCustomers = "Customers"
    case myPrefixPurchaseOrderHeaders = "PurchaseOrderHeaders"
    case myPrefixStock = "Stock"
    case myPrefixProductTexts = "ProductTexts"
    case myPrefixSalesOrderItems = "SalesOrderItems"
    case myPrefixProductCategories = "ProductCategories"
    case myPrefixSalesOrderHeaders = "SalesOrderHeaders"
    case myPrefixProducts = "Products"
    case myPrefixSuppliers = "Suppliers"
    case myPrefixPurchaseOrderItems = "PurchaseOrderItems"
    case none = ""

    static let all = [
        myPrefixCustomers, myPrefixPurchaseOrderHeaders, myPrefixStock, myPrefixProductTexts, myPrefixSalesOrderItems, myPrefixProductCategories, myPrefixSalesOrderHeaders, myPrefixProducts, myPrefixSuppliers, myPrefixPurchaseOrderItems,
    ]
}
