using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SkuSearch.Web.ViewModels
{
    public class StockLocationsViewModel
    {
        public List<SkuSearch.DataAccess.MultilanguageProperty> searchingProducts { get; set; }
        public List<double> distance { get; set; }
        public List<SkuSearch.DataAccess.StockLocation> searchingAddress { get; set; }
        public List<SkuSearch.DataAccess.Product> originalProducts { get; set; }
        public List<SkuSearch.DataAccess.ProductStorage> productStorages { get; set; }

        public StockLocationsViewModel()
        {
            searchingProducts = new List<SkuSearch.DataAccess.MultilanguageProperty>();
            distance = new List<double>();
            searchingAddress = new List<SkuSearch.DataAccess.StockLocation>();
            originalProducts = new List<SkuSearch.DataAccess.Product>();
            productStorages = new List<DataAccess.ProductStorage>();
        }        
    }    
}