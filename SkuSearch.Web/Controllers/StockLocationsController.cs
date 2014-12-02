using SkuSearch.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SkuSearch.Web.ViewModels;

namespace SkuSearch.Web.Controllers
{
    public class StockLocationsController : Controller
    {
        SkuSearchDBEntities db = new SkuSearchDBEntities();
        //
        // GET: /StockLocations/

        public ActionResult Index(decimal Latitude, decimal Longitude)
        {
            //get ids of products located in the nearby stocks 
            var _productIds = (from sa in db.StockLocation.AsEnumerable()
                             where (Math.Abs((float)(sa.StockLocationLatitude - Latitude)) < 0.25 && Math.Abs((float)(sa.StockLocationLongitude - Longitude)) < 0.25)
                             join ps in db.ProductStorage
                             on sa.StockLocationID equals ps.StockLocationRef
                             let dist = Math.Sqrt(Convert.ToDouble((sa.StockLocationLatitude - Latitude) * (sa.StockLocationLatitude - Latitude) + (sa.StockLocationLongitude - Longitude) * (sa.StockLocationLongitude - Longitude)))
                             orderby dist
                             select ps.ProductRef).ToList();

            //get nearby stocks 
            var _searchingAddress = (from sa in db.StockLocation.AsEnumerable()
                                     where (Math.Abs((float)(sa.StockLocationLatitude - Latitude)) < 0.25 && Math.Abs((float)(sa.StockLocationLongitude - Longitude)) < 0.25)
                                     let dist = Math.Sqrt(Convert.ToDouble((sa.StockLocationLatitude - Latitude) * (sa.StockLocationLatitude - Latitude) + (sa.StockLocationLongitude - Longitude) * (sa.StockLocationLongitude - Longitude)))
                                     orderby dist
                                     select sa).ToList();

            //get ids of nearby stocks
            var _stockIds = (from sa in db.StockLocation.AsEnumerable()
                                     where (Math.Abs((float)(sa.StockLocationLatitude - Latitude)) < 0.25 && Math.Abs((float)(sa.StockLocationLongitude - Longitude)) < 0.25)
                                     let dist = Math.Sqrt(Convert.ToDouble((sa.StockLocationLatitude - Latitude) * (sa.StockLocationLatitude - Latitude) + (sa.StockLocationLongitude - Longitude) * (sa.StockLocationLongitude - Longitude)))
                                     orderby dist
                                     select sa.StockLocationID).ToList();

            //get appropriate productStorages
            var _storage = (from prodStorage in db.ProductStorage
                            where _productIds.Contains(prodStorage.ProductRef) && _stockIds.Contains(prodStorage.StockLocationRef)
                            select prodStorage).ToList();

            //get ids of nearby stocks with repeatings (not sorted)
            List<int> searchingStocks = new List<int>();

            foreach (var storage in _storage)
            {
                searchingStocks.Add(storage.StockLocationRef);
            }

            //get nearby stocks with repeatings (sorted by distance)
            List<SkuSearch.DataAccess.StockLocation> _searchingStockProperties = new List<StockLocation>();

            foreach (var stock in _searchingAddress)
            {
                foreach (var stockId in searchingStocks)
                {
                    if (stockId == stock.StockLocationID)
                    {
                        _searchingStockProperties.Add(stock);
                    }
                }                
            }
            
            
            //get all product names 
            var allProducts = (from products in db.MultilanguageProperty 
                               where products.WorldLanguageRef == "EN"                                      
                                    select products).ToList();            

            //get product properties searched by user
            List<SkuSearch.DataAccess.MultilanguageProperty> _searchingProducts = new List<MultilanguageProperty>();

            foreach (var prodId in _productIds)
            {
                foreach (var prodName in allProducts)
                {
                    
                        if (prodId == prodName.ProductRef)
                        {
                            _searchingProducts.Add(prodName);
                        }                   
                }
            }          

            //get distance from stocks to the address set by user
            List<double> distancesWithRepeatings = new List<double>();

            foreach (var searchingStock in _searchingStockProperties)
            {
                distancesWithRepeatings.Add(Math.Sqrt(Convert.ToDouble((searchingStock.StockLocationLatitude - Latitude) * (searchingStock.StockLocationLatitude - Latitude) + (searchingStock.StockLocationLongitude - Longitude) * (searchingStock.StockLocationLongitude - Longitude))));
            }            
            
            //get original products (for images)
            List<SkuSearch.DataAccess.Product> _originalProducts = new List<SkuSearch.DataAccess.Product>();

            foreach (var prodId in _productIds)
            {
                foreach (var orignalProd in db.Product)
                {
                    if (prodId == orignalProd.ProductID)
                    {
                        _originalProducts.Add(orignalProd);
                    }
                }
            }
            
            StockLocationsViewModel model = new StockLocationsViewModel
            {
                searchingProducts = _searchingProducts,
                distance = distancesWithRepeatings,
                searchingAddress = _searchingStockProperties,
                originalProducts = _originalProducts,
                productStorages = _storage
            };

            return View(model);
        }

    }
}
