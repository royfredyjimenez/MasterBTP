using {product_catalog as Product} from '../db/schema';
/*
service CatProd {
    entity Products  as projection on Product.materials.Products;
    entity Suppliers as projection on Product.sales.Suppliers;
    entity Currency  as projection on Product.materials.Currencies;
    entity Category  as projection on Product.materials.Categories;
    entity SalesData as projection on Product.sales.SalesData;
    entity Reviews   as projection on Product.materials.ProductReview;
}

service CatProd1 {
    entity Products  as projection on Product.materials.Products {
        Name
    };

    entity Suppliers as projection on Product.sales.Suppliers {

    };
}
*/

service CatProd {
    entity Products          as
        select from Product.materials.Products {
            /*
            ID,
            Name           as ProdCutName     @mandatory,
            Description                       @mandatory,
            ImageUrl,
            ReleaseDate,
            CreationDate,
            DiscontinuedDate,
            Price                             @mandatory,
            Height,
            Width,
            Depth,
            Quantity                          @(
                mandatory,
                assert.range: [
                    0.00,
                    20.00
                ]
            ),
            */
            *,
            UnitOfMeasure  as ToUnitOfMeasure @mandatory,
            Currency       as ToCurrency      @mandatory,
            Category       as FoCategory      @mandatory,
            Category.Name  as Category        @readonly,
            DimensionUnits as ToDimesionUnit  @mandatory,
            SalesData,
            Supplier,
            Reviews,
        };

    entity Supplier          as
        select from Product.sales.Suppliers {
            ID,
            Name,
            Address,
            Email,
            Phone,
            Fax,
            Product as ToProduct,
        };

    entity Reviews           as
        select from Product.materials.ProductReview {
            ID,
            Name,
            Rating,
            Comment,
            Product,
        };

    @readonly
    entity StockAvailability as
        select from Product.materials.StockAvailability {
            ID,
            Description,
            Product as ToProduct,
        };

    @readonly
    entity VH_Categories     as
        select from Product.materials.Categories {
            ID   as Code,
            Name as Text,

        };

    @readonly
    entity VH_UnitOfMeasure  as
        select from Product.materials.UnitOfMeasures {
            ID          as Code,
            Description as Text,
        };
/*
    @readonly
    entity VH_DimensionUnits as
        select
            ID          as Code,
            Description as Text,
     from   Product.materials.DimensionUnits;
     */
}
service MyService {
/*
    entity SuppliersProduct  as
        select from Product.materials.Products[Name = 'Bread']{
            *,
            Name,
            Supplier.Address
        }
        where
            Supplier.Address.PostalCode = 98074;
*/
    entity SupplierToSales   as
        select
            Supplier.Email,
            Category.Name,
            SalesData.Currency.ID,
            SalesData.Currency.Description
        from Product.materials.Products;
    /*
    entity EntityInfix       as
        select Supplier[Name = 'Exotic Liquids'].Phone from Product.materials.Products
        where
            Products.Name = 'Bread';

    entity EntityJoin        as
        select Phone from Product.materials.Products
        left join Product.sales.Suppliers as Supp
            on(
                Supp.ID = Products.Supplier.ID
            )
            and (
                Supp.Name = 'Exotic Liquids'
            )
        where
            Products.Name = 'Bread';
*/
}
