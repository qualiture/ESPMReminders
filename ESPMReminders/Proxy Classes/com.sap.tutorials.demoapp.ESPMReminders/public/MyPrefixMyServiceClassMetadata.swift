// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

public class MyPrefixMyServiceClassMetadata {
    public static var document: CSDLDocument = MyPrefixMyServiceClassMetadata.resolve()

    private static func resolve() -> CSDLDocument {
        try! MyPrefixMyServiceClassFactory.registerAll()
        MyPrefixMyServiceClassMetadataParser.parsed.hasGeneratedProxies = true
        return MyPrefixMyServiceClassMetadataParser.parsed
    }

    public class EntityTypes {
        public static var customer: EntityType = MyPrefixMyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.Customer")

        public static var product: EntityType = MyPrefixMyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.Product")

        public static var productCategory: EntityType = MyPrefixMyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.ProductCategory")

        public static var productText: EntityType = MyPrefixMyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.ProductText")

        public static var purchaseOrderHeader: EntityType = MyPrefixMyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.PurchaseOrderHeader")

        public static var purchaseOrderItem: EntityType = MyPrefixMyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.PurchaseOrderItem")

        public static var salesOrderHeader: EntityType = MyPrefixMyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.SalesOrderHeader")

        public static var salesOrderItem: EntityType = MyPrefixMyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.SalesOrderItem")

        public static var stock: EntityType = MyPrefixMyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.Stock")

        public static var supplier: EntityType = MyPrefixMyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.Supplier")
    }

    public class EntitySets {
        public static var customers: EntitySet = MyPrefixMyServiceClassMetadataParser.parsed.entitySet(withName: "Customers")

        public static var productCategories: EntitySet = MyPrefixMyServiceClassMetadataParser.parsed.entitySet(withName: "ProductCategories")

        public static var productTexts: EntitySet = MyPrefixMyServiceClassMetadataParser.parsed.entitySet(withName: "ProductTexts")

        public static var products: EntitySet = MyPrefixMyServiceClassMetadataParser.parsed.entitySet(withName: "Products")

        public static var purchaseOrderHeaders: EntitySet = MyPrefixMyServiceClassMetadataParser.parsed.entitySet(withName: "PurchaseOrderHeaders")

        public static var purchaseOrderItems: EntitySet = MyPrefixMyServiceClassMetadataParser.parsed.entitySet(withName: "PurchaseOrderItems")

        public static var salesOrderHeaders: EntitySet = MyPrefixMyServiceClassMetadataParser.parsed.entitySet(withName: "SalesOrderHeaders")

        public static var salesOrderItems: EntitySet = MyPrefixMyServiceClassMetadataParser.parsed.entitySet(withName: "SalesOrderItems")

        public static var stock: EntitySet = MyPrefixMyServiceClassMetadataParser.parsed.entitySet(withName: "Stock")

        public static var suppliers: EntitySet = MyPrefixMyServiceClassMetadataParser.parsed.entitySet(withName: "Suppliers")
    }

    public class ActionImports {
        public static var generateSamplePurcharOrders: DataMethod = MyPrefixMyServiceClassMetadataParser.parsed.dataMethod(withName: "GenerateSamplePurcharOrders")

        public static var generateSampleSalesOrders: DataMethod = MyPrefixMyServiceClassMetadataParser.parsed.dataMethod(withName: "GenerateSampleSalesOrders")

        public static var resetSampleData: DataMethod = MyPrefixMyServiceClassMetadataParser.parsed.dataMethod(withName: "ResetSampleData")

        public static var updateSalesOrderStatus: DataMethod = MyPrefixMyServiceClassMetadataParser.parsed.dataMethod(withName: "UpdateSalesOrderStatus")
    }
}
