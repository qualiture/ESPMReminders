// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

internal class MyPrefixMyServiceClassMetadataChanges: ObjectBase {
    override init() {
    }

    class func merge(metadata: CSDLDocument) {
        metadata.hasGeneratedProxies = true
        MyPrefixMyServiceClassMetadata.document = metadata
        MyPrefixMyServiceClassMetadataChanges.merge1(metadata: metadata)
        try! MyPrefixMyServiceClassFactory.registerAll()
    }

    private class func merge1(metadata: CSDLDocument) {
        Ignore.valueOf_any(metadata)
        if !MyPrefixMyServiceClassMetadata.EntityTypes.customer.isRemoved {
            MyPrefixMyServiceClassMetadata.EntityTypes.customer = metadata.entityType(withName: "ESPM.Customer")
        }
        if !MyPrefixMyServiceClassMetadata.EntityTypes.product.isRemoved {
            MyPrefixMyServiceClassMetadata.EntityTypes.product = metadata.entityType(withName: "ESPM.Product")
        }
        if !MyPrefixMyServiceClassMetadata.EntityTypes.productCategory.isRemoved {
            MyPrefixMyServiceClassMetadata.EntityTypes.productCategory = metadata.entityType(withName: "ESPM.ProductCategory")
        }
        if !MyPrefixMyServiceClassMetadata.EntityTypes.productText.isRemoved {
            MyPrefixMyServiceClassMetadata.EntityTypes.productText = metadata.entityType(withName: "ESPM.ProductText")
        }
        if !MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.isRemoved {
            MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader = metadata.entityType(withName: "ESPM.PurchaseOrderHeader")
        }
        if !MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.isRemoved {
            MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem = metadata.entityType(withName: "ESPM.PurchaseOrderItem")
        }
        if !MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.isRemoved {
            MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader = metadata.entityType(withName: "ESPM.SalesOrderHeader")
        }
        if !MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.isRemoved {
            MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem = metadata.entityType(withName: "ESPM.SalesOrderItem")
        }
        if !MyPrefixMyServiceClassMetadata.EntityTypes.stock.isRemoved {
            MyPrefixMyServiceClassMetadata.EntityTypes.stock = metadata.entityType(withName: "ESPM.Stock")
        }
        if !MyPrefixMyServiceClassMetadata.EntityTypes.supplier.isRemoved {
            MyPrefixMyServiceClassMetadata.EntityTypes.supplier = metadata.entityType(withName: "ESPM.Supplier")
        }
        if !MyPrefixMyServiceClassMetadata.EntitySets.customers.isRemoved {
            MyPrefixMyServiceClassMetadata.EntitySets.customers = metadata.entitySet(withName: "Customers")
        }
        if !MyPrefixMyServiceClassMetadata.EntitySets.productCategories.isRemoved {
            MyPrefixMyServiceClassMetadata.EntitySets.productCategories = metadata.entitySet(withName: "ProductCategories")
        }
        if !MyPrefixMyServiceClassMetadata.EntitySets.productTexts.isRemoved {
            MyPrefixMyServiceClassMetadata.EntitySets.productTexts = metadata.entitySet(withName: "ProductTexts")
        }
        if !MyPrefixMyServiceClassMetadata.EntitySets.products.isRemoved {
            MyPrefixMyServiceClassMetadata.EntitySets.products = metadata.entitySet(withName: "Products")
        }
        if !MyPrefixMyServiceClassMetadata.EntitySets.purchaseOrderHeaders.isRemoved {
            MyPrefixMyServiceClassMetadata.EntitySets.purchaseOrderHeaders = metadata.entitySet(withName: "PurchaseOrderHeaders")
        }
        if !MyPrefixMyServiceClassMetadata.EntitySets.purchaseOrderItems.isRemoved {
            MyPrefixMyServiceClassMetadata.EntitySets.purchaseOrderItems = metadata.entitySet(withName: "PurchaseOrderItems")
        }
        if !MyPrefixMyServiceClassMetadata.EntitySets.salesOrderHeaders.isRemoved {
            MyPrefixMyServiceClassMetadata.EntitySets.salesOrderHeaders = metadata.entitySet(withName: "SalesOrderHeaders")
        }
        if !MyPrefixMyServiceClassMetadata.EntitySets.salesOrderItems.isRemoved {
            MyPrefixMyServiceClassMetadata.EntitySets.salesOrderItems = metadata.entitySet(withName: "SalesOrderItems")
        }
        if !MyPrefixMyServiceClassMetadata.EntitySets.stock.isRemoved {
            MyPrefixMyServiceClassMetadata.EntitySets.stock = metadata.entitySet(withName: "Stock")
        }
        if !MyPrefixMyServiceClassMetadata.EntitySets.suppliers.isRemoved {
            MyPrefixMyServiceClassMetadata.EntitySets.suppliers = metadata.entitySet(withName: "Suppliers")
        }
        if !MyPrefixMyServiceClassMetadata.ActionImports.generateSamplePurcharOrders.isRemoved {
            MyPrefixMyServiceClassMetadata.ActionImports.generateSamplePurcharOrders = metadata.dataMethod(withName: "GenerateSamplePurcharOrders")
        }
        if !MyPrefixMyServiceClassMetadata.ActionImports.generateSampleSalesOrders.isRemoved {
            MyPrefixMyServiceClassMetadata.ActionImports.generateSampleSalesOrders = metadata.dataMethod(withName: "GenerateSampleSalesOrders")
        }
        if !MyPrefixMyServiceClassMetadata.ActionImports.resetSampleData.isRemoved {
            MyPrefixMyServiceClassMetadata.ActionImports.resetSampleData = metadata.dataMethod(withName: "ResetSampleData")
        }
        if !MyPrefixMyServiceClassMetadata.ActionImports.updateSalesOrderStatus.isRemoved {
            MyPrefixMyServiceClassMetadata.ActionImports.updateSalesOrderStatus = metadata.dataMethod(withName: "UpdateSalesOrderStatus")
        }
        if !MyPrefixCustomer.city.isRemoved {
            MyPrefixCustomer.city = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "City")
        }
        if !MyPrefixCustomer.country.isRemoved {
            MyPrefixCustomer.country = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "Country")
        }
        if !MyPrefixCustomer.customerID.isRemoved {
            MyPrefixCustomer.customerID = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "CustomerId")
        }
        if !MyPrefixCustomer.dateOfBirth.isRemoved {
            MyPrefixCustomer.dateOfBirth = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "DateOfBirth")
        }
        if !MyPrefixCustomer.emailAddress.isRemoved {
            MyPrefixCustomer.emailAddress = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "EmailAddress")
        }
        if !MyPrefixCustomer.firstName.isRemoved {
            MyPrefixCustomer.firstName = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "FirstName")
        }
        if !MyPrefixCustomer.houseNumber.isRemoved {
            MyPrefixCustomer.houseNumber = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "HouseNumber")
        }
        if !MyPrefixCustomer.lastName.isRemoved {
            MyPrefixCustomer.lastName = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "LastName")
        }
        if !MyPrefixCustomer.phoneNumber.isRemoved {
            MyPrefixCustomer.phoneNumber = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "PhoneNumber")
        }
        if !MyPrefixCustomer.postalCode.isRemoved {
            MyPrefixCustomer.postalCode = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "PostalCode")
        }
        if !MyPrefixCustomer.street.isRemoved {
            MyPrefixCustomer.street = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "Street")
        }
        if !MyPrefixCustomer.updatedTimestamp.isRemoved {
            MyPrefixCustomer.updatedTimestamp = MyPrefixMyServiceClassMetadata.EntityTypes.customer.property(withName: "UpdatedTimestamp")
        }
        if !MyPrefixProduct.category.isRemoved {
            MyPrefixProduct.category = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "Category")
        }
        if !MyPrefixProduct.categoryName.isRemoved {
            MyPrefixProduct.categoryName = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "CategoryName")
        }
        if !MyPrefixProduct.currencyCode.isRemoved {
            MyPrefixProduct.currencyCode = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "CurrencyCode")
        }
        if !MyPrefixProduct.dimensionDepth.isRemoved {
            MyPrefixProduct.dimensionDepth = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionDepth")
        }
        if !MyPrefixProduct.dimensionHeight.isRemoved {
            MyPrefixProduct.dimensionHeight = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionHeight")
        }
        if !MyPrefixProduct.dimensionUnit.isRemoved {
            MyPrefixProduct.dimensionUnit = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionUnit")
        }
        if !MyPrefixProduct.dimensionWidth.isRemoved {
            MyPrefixProduct.dimensionWidth = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionWidth")
        }
        if !MyPrefixProduct.longDescription.isRemoved {
            MyPrefixProduct.longDescription = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "LongDescription")
        }
        if !MyPrefixProduct.name.isRemoved {
            MyPrefixProduct.name = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "Name")
        }
        if !MyPrefixProduct.pictureUrl.isRemoved {
            MyPrefixProduct.pictureUrl = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "PictureUrl")
        }
        if !MyPrefixProduct.price.isRemoved {
            MyPrefixProduct.price = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "Price")
        }
        if !MyPrefixProduct.productID.isRemoved {
            MyPrefixProduct.productID = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "ProductId")
        }
        if !MyPrefixProduct.quantityUnit.isRemoved {
            MyPrefixProduct.quantityUnit = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "QuantityUnit")
        }
        if !MyPrefixProduct.shortDescription.isRemoved {
            MyPrefixProduct.shortDescription = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "ShortDescription")
        }
        if !MyPrefixProduct.supplierID.isRemoved {
            MyPrefixProduct.supplierID = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "SupplierId")
        }
        if !MyPrefixProduct.updatedTimestamp.isRemoved {
            MyPrefixProduct.updatedTimestamp = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "UpdatedTimestamp")
        }
        if !MyPrefixProduct.weight.isRemoved {
            MyPrefixProduct.weight = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "Weight")
        }
        if !MyPrefixProduct.weightUnit.isRemoved {
            MyPrefixProduct.weightUnit = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "WeightUnit")
        }
        if !MyPrefixProduct.stockDetails.isRemoved {
            MyPrefixProduct.stockDetails = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "StockDetails")
        }
        if !MyPrefixProduct.supplierDetails.isRemoved {
            MyPrefixProduct.supplierDetails = MyPrefixMyServiceClassMetadata.EntityTypes.product.property(withName: "SupplierDetails")
        }
        if !MyPrefixProductCategory.category.isRemoved {
            MyPrefixProductCategory.category = MyPrefixMyServiceClassMetadata.EntityTypes.productCategory.property(withName: "Category")
        }
        if !MyPrefixProductCategory.categoryName.isRemoved {
            MyPrefixProductCategory.categoryName = MyPrefixMyServiceClassMetadata.EntityTypes.productCategory.property(withName: "CategoryName")
        }
        if !MyPrefixProductCategory.mainCategory.isRemoved {
            MyPrefixProductCategory.mainCategory = MyPrefixMyServiceClassMetadata.EntityTypes.productCategory.property(withName: "MainCategory")
        }
        if !MyPrefixProductCategory.mainCategoryName.isRemoved {
            MyPrefixProductCategory.mainCategoryName = MyPrefixMyServiceClassMetadata.EntityTypes.productCategory.property(withName: "MainCategoryName")
        }
        if !MyPrefixProductCategory.numberOfProducts.isRemoved {
            MyPrefixProductCategory.numberOfProducts = MyPrefixMyServiceClassMetadata.EntityTypes.productCategory.property(withName: "NumberOfProducts")
        }
        if !MyPrefixProductCategory.updatedTimestamp.isRemoved {
            MyPrefixProductCategory.updatedTimestamp = MyPrefixMyServiceClassMetadata.EntityTypes.productCategory.property(withName: "UpdatedTimestamp")
        }
        if !MyPrefixProductText.id.isRemoved {
            MyPrefixProductText.id = MyPrefixMyServiceClassMetadata.EntityTypes.productText.property(withName: "Id")
        }
        if !MyPrefixProductText.language.isRemoved {
            MyPrefixProductText.language = MyPrefixMyServiceClassMetadata.EntityTypes.productText.property(withName: "Language")
        }
        if !MyPrefixProductText.longDescription.isRemoved {
            MyPrefixProductText.longDescription = MyPrefixMyServiceClassMetadata.EntityTypes.productText.property(withName: "LongDescription")
        }
        if !MyPrefixProductText.name.isRemoved {
            MyPrefixProductText.name = MyPrefixMyServiceClassMetadata.EntityTypes.productText.property(withName: "Name")
        }
        if !MyPrefixProductText.productID.isRemoved {
            MyPrefixProductText.productID = MyPrefixMyServiceClassMetadata.EntityTypes.productText.property(withName: "ProductId")
        }
        if !MyPrefixProductText.shortDescription.isRemoved {
            MyPrefixProductText.shortDescription = MyPrefixMyServiceClassMetadata.EntityTypes.productText.property(withName: "ShortDescription")
        }
        if !MyPrefixPurchaseOrderHeader.currencyCode.isRemoved {
            MyPrefixPurchaseOrderHeader.currencyCode = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "CurrencyCode")
        }
        if !MyPrefixPurchaseOrderHeader.grossAmount.isRemoved {
            MyPrefixPurchaseOrderHeader.grossAmount = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "GrossAmount")
        }
        if !MyPrefixPurchaseOrderHeader.netAmount.isRemoved {
            MyPrefixPurchaseOrderHeader.netAmount = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "NetAmount")
        }
        if !MyPrefixPurchaseOrderHeader.purchaseOrderID.isRemoved {
            MyPrefixPurchaseOrderHeader.purchaseOrderID = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "PurchaseOrderId")
        }
        if !MyPrefixPurchaseOrderHeader.supplierID.isRemoved {
            MyPrefixPurchaseOrderHeader.supplierID = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "SupplierId")
        }
        if !MyPrefixPurchaseOrderHeader.taxAmount.isRemoved {
            MyPrefixPurchaseOrderHeader.taxAmount = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "TaxAmount")
        }
        if !MyPrefixPurchaseOrderHeader.items.isRemoved {
            MyPrefixPurchaseOrderHeader.items = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "Items")
        }
        if !MyPrefixPurchaseOrderItem.currencyCode.isRemoved {
            MyPrefixPurchaseOrderItem.currencyCode = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "CurrencyCode")
        }
        if !MyPrefixPurchaseOrderItem.grossAmount.isRemoved {
            MyPrefixPurchaseOrderItem.grossAmount = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "GrossAmount")
        }
        if !MyPrefixPurchaseOrderItem.netAmount.isRemoved {
            MyPrefixPurchaseOrderItem.netAmount = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "NetAmount")
        }
        if !MyPrefixPurchaseOrderItem.productID.isRemoved {
            MyPrefixPurchaseOrderItem.productID = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "ProductId")
        }
        if !MyPrefixPurchaseOrderItem.itemNumber.isRemoved {
            MyPrefixPurchaseOrderItem.itemNumber = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "ItemNumber")
        }
        if !MyPrefixPurchaseOrderItem.purchaseOrderID.isRemoved {
            MyPrefixPurchaseOrderItem.purchaseOrderID = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "PurchaseOrderId")
        }
        if !MyPrefixPurchaseOrderItem.quantity.isRemoved {
            MyPrefixPurchaseOrderItem.quantity = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "Quantity")
        }
        if !MyPrefixPurchaseOrderItem.quantityUnit.isRemoved {
            MyPrefixPurchaseOrderItem.quantityUnit = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "QuantityUnit")
        }
        if !MyPrefixPurchaseOrderItem.taxAmount.isRemoved {
            MyPrefixPurchaseOrderItem.taxAmount = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "TaxAmount")
        }
        if !MyPrefixPurchaseOrderItem.productDetails.isRemoved {
            MyPrefixPurchaseOrderItem.productDetails = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "ProductDetails")
        }
        if !MyPrefixPurchaseOrderItem.header.isRemoved {
            MyPrefixPurchaseOrderItem.header = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "Header")
        }
        if !MyPrefixSalesOrderHeader.createdAt.isRemoved {
            MyPrefixSalesOrderHeader.createdAt = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "CreatedAt")
        }
        if !MyPrefixSalesOrderHeader.currencyCode.isRemoved {
            MyPrefixSalesOrderHeader.currencyCode = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "CurrencyCode")
        }
        if !MyPrefixSalesOrderHeader.customerID.isRemoved {
            MyPrefixSalesOrderHeader.customerID = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "CustomerId")
        }
        if !MyPrefixSalesOrderHeader.grossAmount.isRemoved {
            MyPrefixSalesOrderHeader.grossAmount = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "GrossAmount")
        }
        if !MyPrefixSalesOrderHeader.lifeCycleStatus.isRemoved {
            MyPrefixSalesOrderHeader.lifeCycleStatus = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "LifeCycleStatus")
        }
        if !MyPrefixSalesOrderHeader.lifeCycleStatusName.isRemoved {
            MyPrefixSalesOrderHeader.lifeCycleStatusName = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "LifeCycleStatusName")
        }
        if !MyPrefixSalesOrderHeader.netAmount.isRemoved {
            MyPrefixSalesOrderHeader.netAmount = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "NetAmount")
        }
        if !MyPrefixSalesOrderHeader.salesOrderID.isRemoved {
            MyPrefixSalesOrderHeader.salesOrderID = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "SalesOrderId")
        }
        if !MyPrefixSalesOrderHeader.taxAmount.isRemoved {
            MyPrefixSalesOrderHeader.taxAmount = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "TaxAmount")
        }
        if !MyPrefixSalesOrderHeader.customerDetails.isRemoved {
            MyPrefixSalesOrderHeader.customerDetails = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "CustomerDetails")
        }
        if !MyPrefixSalesOrderHeader.items.isRemoved {
            MyPrefixSalesOrderHeader.items = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "Items")
        }
        if !MyPrefixSalesOrderItem.currencyCode.isRemoved {
            MyPrefixSalesOrderItem.currencyCode = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "CurrencyCode")
        }
        if !MyPrefixSalesOrderItem.deliveryDate.isRemoved {
            MyPrefixSalesOrderItem.deliveryDate = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "DeliveryDate")
        }
        if !MyPrefixSalesOrderItem.grossAmount.isRemoved {
            MyPrefixSalesOrderItem.grossAmount = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "GrossAmount")
        }
        if !MyPrefixSalesOrderItem.itemNumber.isRemoved {
            MyPrefixSalesOrderItem.itemNumber = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "ItemNumber")
        }
        if !MyPrefixSalesOrderItem.salesOrderID.isRemoved {
            MyPrefixSalesOrderItem.salesOrderID = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "SalesOrderId")
        }
        if !MyPrefixSalesOrderItem.netAmount.isRemoved {
            MyPrefixSalesOrderItem.netAmount = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "NetAmount")
        }
        if !MyPrefixSalesOrderItem.productID.isRemoved {
            MyPrefixSalesOrderItem.productID = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "ProductId")
        }
        if !MyPrefixSalesOrderItem.quantity.isRemoved {
            MyPrefixSalesOrderItem.quantity = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "Quantity")
        }
        if !MyPrefixSalesOrderItem.quantityUnit.isRemoved {
            MyPrefixSalesOrderItem.quantityUnit = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "QuantityUnit")
        }
        if !MyPrefixSalesOrderItem.taxAmount.isRemoved {
            MyPrefixSalesOrderItem.taxAmount = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "TaxAmount")
        }
        if !MyPrefixSalesOrderItem.productDetails.isRemoved {
            MyPrefixSalesOrderItem.productDetails = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "ProductDetails")
        }
        if !MyPrefixSalesOrderItem.header.isRemoved {
            MyPrefixSalesOrderItem.header = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "Header")
        }
        if !MyPrefixStock.lotSize.isRemoved {
            MyPrefixStock.lotSize = MyPrefixMyServiceClassMetadata.EntityTypes.stock.property(withName: "LotSize")
        }
        if !MyPrefixStock.minStock.isRemoved {
            MyPrefixStock.minStock = MyPrefixMyServiceClassMetadata.EntityTypes.stock.property(withName: "MinStock")
        }
        if !MyPrefixStock.productID.isRemoved {
            MyPrefixStock.productID = MyPrefixMyServiceClassMetadata.EntityTypes.stock.property(withName: "ProductId")
        }
        if !MyPrefixStock.quantity.isRemoved {
            MyPrefixStock.quantity = MyPrefixMyServiceClassMetadata.EntityTypes.stock.property(withName: "Quantity")
        }
        if !MyPrefixStock.quantityLessMin.isRemoved {
            MyPrefixStock.quantityLessMin = MyPrefixMyServiceClassMetadata.EntityTypes.stock.property(withName: "QuantityLessMin")
        }
        if !MyPrefixStock.updatedTimestamp.isRemoved {
            MyPrefixStock.updatedTimestamp = MyPrefixMyServiceClassMetadata.EntityTypes.stock.property(withName: "UpdatedTimestamp")
        }
        if !MyPrefixStock.productDetails.isRemoved {
            MyPrefixStock.productDetails = MyPrefixMyServiceClassMetadata.EntityTypes.stock.property(withName: "ProductDetails")
        }
        if !MyPrefixSupplier.city.isRemoved {
            MyPrefixSupplier.city = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "City")
        }
        if !MyPrefixSupplier.country.isRemoved {
            MyPrefixSupplier.country = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "Country")
        }
        if !MyPrefixSupplier.emailAddress.isRemoved {
            MyPrefixSupplier.emailAddress = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "EmailAddress")
        }
        if !MyPrefixSupplier.houseNumber.isRemoved {
            MyPrefixSupplier.houseNumber = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "HouseNumber")
        }
        if !MyPrefixSupplier.phoneNumber.isRemoved {
            MyPrefixSupplier.phoneNumber = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "PhoneNumber")
        }
        if !MyPrefixSupplier.postalCode.isRemoved {
            MyPrefixSupplier.postalCode = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "PostalCode")
        }
        if !MyPrefixSupplier.street.isRemoved {
            MyPrefixSupplier.street = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "Street")
        }
        if !MyPrefixSupplier.supplierID.isRemoved {
            MyPrefixSupplier.supplierID = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "SupplierId")
        }
        if !MyPrefixSupplier.supplierName.isRemoved {
            MyPrefixSupplier.supplierName = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "SupplierName")
        }
        if !MyPrefixSupplier.updatedTimestamp.isRemoved {
            MyPrefixSupplier.updatedTimestamp = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "UpdatedTimestamp")
        }
        if !MyPrefixSupplier.products.isRemoved {
            MyPrefixSupplier.products = MyPrefixMyServiceClassMetadata.EntityTypes.supplier.property(withName: "Products")
        }
    }
}
