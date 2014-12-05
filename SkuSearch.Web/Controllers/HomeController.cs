using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SkuSearch.DataAccess;
using SkuSearch.Web.Models;

namespace SkuSearch.Web.Controllers
{
    public class HomeController : Controller
    {
        SkuSearchDBEntities db = new SkuSearchDBEntities();

        public ActionResult Index()
        {
            var freshProducts = (from fp in (
                                            from  tp in db.MultilanguageProperty
                                            where tp.WorldLanguageRef == "EN"
                                            select tp)                                
                                    where fp.MultilanguagePropertyProductDescription != null                                
                                    select fp).Take(10);
            var products = from pr in db.Product
                           select pr;
            var tuple = new Tuple<IEnumerable<SkuSearch.DataAccess.MultilanguageProperty>, IEnumerable<SkuSearch.DataAccess.Product>>(freshProducts, products);

            return View(tuple);            
        }

        [HttpPost]
        public ActionResult StoreLocator(string address)
        {
            // Make sure we have an address
            if (string.IsNullOrEmpty(address))
                return View();

            var results = GoogleMapsAPIHelpersCS.GetGeocodingSearchResults(address);

            var resultCount = results.Elements("result").Count();

            if (resultCount == 0)
            {
                // No matching address found!
                ViewData["No Results"] = true;
                return View();
            }
            else if (resultCount == 1)
            {
                // Got back exactly one result, show it!
                return RedirectToAction("StoreLocatorResults", new { Address = results.Element("result").Element("formatted_address").Value });
            }
            else
            {
                // Got back multiple results - We need to ask the user which address they mean to use...
                var matches = from result in results.Elements("result")
                              let formatted_address = result.Element("formatted_address").Value
                              select formatted_address;

                ViewData["Matches"] = matches;
                return View();
            }
        }
    }
}
