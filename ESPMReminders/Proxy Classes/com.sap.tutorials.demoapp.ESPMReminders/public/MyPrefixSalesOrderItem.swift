// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class MyPrefixSalesOrderItem: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var currencyCode: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "CurrencyCode")

    public static var deliveryDate: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "DeliveryDate")

    public static var grossAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "GrossAmount")

    public static var itemNumber: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "ItemNumber")

    public static var salesOrderID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "SalesOrderId")

    public static var netAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "NetAmount")

    public static var productID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "ProductId")

    public static var quantity: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "Quantity")

    public static var quantityUnit: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "QuantityUnit")

    public static var taxAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "TaxAmount")

    public static var productDetails: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "ProductDetails")

    public static var header: Property = MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "Header")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: MyPrefixMyServiceClassMetadata.EntityTypes.salesOrderItem)
    }

    open class func array(from: EntityValueList) -> Array<MyPrefixSalesOrderItem> {
        return ArrayConverter.convert(from.toArray(), Array<MyPrefixSalesOrderItem>())
    }

    open func copy() -> MyPrefixSalesOrderItem {
        return CastRequired<MyPrefixSalesOrderItem>.from(self.copyEntity())
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixSalesOrderItem.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixSalesOrderItem.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open var deliveryDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: MyPrefixSalesOrderItem.deliveryDate))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixSalesOrderItem.deliveryDate, to: value)
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixSalesOrderItem.grossAmount))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixSalesOrderItem.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var header: MyPrefixSalesOrderHeader? {
        get {
            return CastOptional<MyPrefixSalesOrderHeader>.from(self.optionalValue(for: MyPrefixSalesOrderItem.header))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixSalesOrderItem.header, to: value)
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open var itemNumber: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: MyPrefixSalesOrderItem.itemNumber))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixSalesOrderItem.itemNumber, to: IntValue.of(optional: value))
        }
    }

    open class func key(itemNumber: Int?, salesOrderID: String?) -> EntityKey {
        return EntityKey().with(name: "ItemNumber", value: IntValue.of(optional: itemNumber)).with(name: "SalesOrderId", value: StringValue.of(optional: salesOrderID))
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixSalesOrderItem.netAmount))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixSalesOrderItem.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: MyPrefixSalesOrderItem {
        return CastRequired<MyPrefixSalesOrderItem>.from(self.oldEntity)
    }

    open var productDetails: MyPrefixProduct? {
        get {
            return CastOptional<MyPrefixProduct>.from(self.optionalValue(for: MyPrefixSalesOrderItem.productDetails))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixSalesOrderItem.productDetails, to: value)
        }
    }

    open var productID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixSalesOrderItem.productID))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixSalesOrderItem.productID, to: StringValue.of(optional: value))
        }
    }

    open var quantity: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixSalesOrderItem.quantity))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixSalesOrderItem.quantity, to: DecimalValue.of(optional: value))
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixSalesOrderItem.quantityUnit))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixSalesOrderItem.quantityUnit, to: StringValue.of(optional: value))
        }
    }

    open var salesOrderID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixSalesOrderItem.salesOrderID))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixSalesOrderItem.salesOrderID, to: StringValue.of(optional: value))
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixSalesOrderItem.taxAmount))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixSalesOrderItem.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
