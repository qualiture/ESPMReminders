//
// CollectionsViewController.swift
// ESPMReminders
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 11/11/17
//

import Foundation
import SAPFiori

protocol TableUpdaterDelegate {
    func updateTable()
}

class CollectionsViewController: FUIFormTableViewController {

    private var collections = CollectionType.all

    // Variable to store the selected index path
    private var selectedIndex: IndexPath?

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var isPresentedInSplitView: Bool {
        return !(self.splitViewController?.isCollapsed ?? true)
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 320, height: 480)

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.makeSelection()
    }

    override func viewWillTransition(to _: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion: { _ in
            let isNotInSplitView = !self.isPresentedInSplitView
            self.tableView.visibleCells.forEach { cell in
                // To refresh the disclosure indicator of each cell
                cell.accessoryType = isNotInSplitView ? .disclosureIndicator : .none
            }
            self.makeSelection()
        })
    }

    // MARK: - UITableViewDelegate
    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.collections.count
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> FUIObjectTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        cell.headlineLabel.text = self.collections[indexPath.row].rawValue
        cell.accessoryType = !self.isPresentedInSplitView ? .disclosureIndicator : .none
        cell.isMomentarySelection = false
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        self.collectionSelected(at: indexPath)
    }

    // CollectionType selection helper

    private func collectionSelected(at: IndexPath) {
        // Load the EntityType specific ViewController from the specific storyboard
        var masterViewController: UIViewController!
        switch self.collections[at.row] {
        case .myPrefixCustomers:
            let myPrefixCustomersStoryBoard = UIStoryboard(name: "MyPrefixCustomers", bundle: nil)
            masterViewController = myPrefixCustomersStoryBoard.instantiateViewController(withIdentifier: "MyPrefixCustomersMaster")
            masterViewController.navigationItem.title = "Customers"
        case .myPrefixPurchaseOrderHeaders:
            let myPrefixPurchaseOrderHeadersStoryBoard = UIStoryboard(name: "MyPrefixPurchaseOrderHeaders", bundle: nil)
            masterViewController = myPrefixPurchaseOrderHeadersStoryBoard.instantiateViewController(withIdentifier: "MyPrefixPurchaseOrderHeadersMaster")
            masterViewController.navigationItem.title = "PurchaseOrderHeaders"
        case .myPrefixStock:
            let myPrefixStockStoryBoard = UIStoryboard(name: "MyPrefixStock", bundle: nil)
            masterViewController = myPrefixStockStoryBoard.instantiateViewController(withIdentifier: "MyPrefixStockMaster")
            masterViewController.navigationItem.title = "Stock"
        case .myPrefixProductTexts:
            let myPrefixProductTextsStoryBoard = UIStoryboard(name: "MyPrefixProductTexts", bundle: nil)
            masterViewController = myPrefixProductTextsStoryBoard.instantiateViewController(withIdentifier: "MyPrefixProductTextsMaster")
            masterViewController.navigationItem.title = "ProductTexts"
        case .myPrefixSalesOrderItems:
            let myPrefixSalesOrderItemsStoryBoard = UIStoryboard(name: "MyPrefixSalesOrderItems", bundle: nil)
            masterViewController = myPrefixSalesOrderItemsStoryBoard.instantiateViewController(withIdentifier: "MyPrefixSalesOrderItemsMaster")
            masterViewController.navigationItem.title = "SalesOrderItems"
        case .myPrefixProductCategories:
            let myPrefixProductCategoriesStoryBoard = UIStoryboard(name: "MyPrefixProductCategories", bundle: nil)
            masterViewController = myPrefixProductCategoriesStoryBoard.instantiateViewController(withIdentifier: "MyPrefixProductCategoriesMaster")
            masterViewController.navigationItem.title = "ProductCategories"
        case .myPrefixSalesOrderHeaders:
            let myPrefixSalesOrderHeadersStoryBoard = UIStoryboard(name: "MyPrefixSalesOrderHeaders", bundle: nil)
            masterViewController = myPrefixSalesOrderHeadersStoryBoard.instantiateViewController(withIdentifier: "MyPrefixSalesOrderHeadersMaster")
            masterViewController.navigationItem.title = "SalesOrderHeaders"
        case .myPrefixProducts:
            let myPrefixProductsStoryBoard = UIStoryboard(name: "MyPrefixProducts", bundle: nil)
            masterViewController = myPrefixProductsStoryBoard.instantiateViewController(withIdentifier: "MyPrefixProductsMaster")
            masterViewController.navigationItem.title = "Products"
        case .myPrefixSuppliers:
            let myPrefixSuppliersStoryBoard = UIStoryboard(name: "MyPrefixSuppliers", bundle: nil)
            masterViewController = myPrefixSuppliersStoryBoard.instantiateViewController(withIdentifier: "MyPrefixSuppliersMaster")
            masterViewController.navigationItem.title = "Suppliers"
        case .myPrefixPurchaseOrderItems:
            let myPrefixPurchaseOrderItemsStoryBoard = UIStoryboard(name: "MyPrefixPurchaseOrderItems", bundle: nil)
            masterViewController = myPrefixPurchaseOrderItemsStoryBoard.instantiateViewController(withIdentifier: "MyPrefixPurchaseOrderItemsMaster")
            masterViewController.navigationItem.title = "PurchaseOrderItems"
        case .none:
            masterViewController = UIViewController()
        }

        // Load the NavigationController and present with the EntityType specific ViewController
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [masterViewController]
        self.splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }

    // MARK: - Handle highlighting of selected cell
    private func makeSelection() {
        if let selectedIndex = selectedIndex {
            self.tableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
            self.tableView.scrollToRow(at: selectedIndex, at: .none, animated: true)
        } else {
            self.selectDefault()
        }
    }

    private func selectDefault() {
        // Automatically select first element if we have two panels (iPhone plus and iPad only)
        if self.splitViewController!.isCollapsed || self.appDelegate.myServiceClass == nil {
            return
        }
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        self.collectionSelected(at: indexPath)
    }
}
