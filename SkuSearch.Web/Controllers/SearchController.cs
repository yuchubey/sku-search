using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SkuSearch.DataAccess;


namespace SkuSearch.Web.Controllers
{
    public class SearchController : Controller
    {
        SkuSearchDBEntities db = new SkuSearchDBEntities();

        //
        // GET: /Search/
        public ActionResult Index()
        { 
            return View();
        }         

        //
        // GET: /Search/Browse?category=Apparel
        public ActionResult Browse(int id = 0)
        {

            var specificProducts = (from p in db.Product
                                   where p.CategoryRef == id
                                   select p);

            var productProperties = (from pp in db.MultilanguageProperty                                     
                                    select pp);

            var tuple = new Tuple<IEnumerable<SkuSearch.DataAccess.MultilanguageProperty>, IEnumerable<SkuSearch.DataAccess.Product>>(productProperties, specificProducts);

            return View(tuple);    
        }

        //
        // GET: /Search/Details/5
        public ActionResult Details (int id)
        {
            var detailedProduct = from dp in
                                      (
                                          from translatedProduct in db.MultilanguageProperty
                                          where translatedProduct.WorldLanguageRef == "EN"
                                          select translatedProduct).DefaultIfEmpty()
                                  where dp.MultilanguagePropertyID == id
                                  select dp;

            var originalProduct = from op in db.Product
                                  where op.ProductID == detailedProduct.FirstOrDefault().ProductRef
                                  select op;

            var tuple = new Tuple<IEnumerable<SkuSearch.DataAccess.MultilanguageProperty>, IEnumerable<SkuSearch.DataAccess.Product>>(detailedProduct, originalProduct);
 
            return View(tuple);
        }
        
        //
        //GET: /Search/CategoryMenu
        [ChildActionOnly]
        public ActionResult CategoryMenu()
        {
            var categories = db.Category.ToList();
            return PartialView(categories);
        }

        [ChildActionOnly]
        public ActionResult SearchingTextbox(string searchString)
        {
            // Searching by description
            var searchingProducts = from sp in db.MultilanguageProperty
                                    where sp.MultilanguagePropertyProductDescription.Contains(searchString)
                                    select sp;
            var originalProducts = from op in db.Product                                  
                                   select op;

            // Searching by name
            if (!searchingProducts.Any())
            {
                searchingProducts = from sp in db.MultilanguageProperty
                                    where sp.MultilanguagePropertyProductName.Contains(searchString)
                                    select sp;
            }

            if (searchString == null)
            {
                searchingProducts = from sp in db.MultilanguageProperty                                    
                                    select sp;
            }
            
            
            var tuple = new Tuple<IEnumerable<SkuSearch.DataAccess.MultilanguageProperty>, IEnumerable<SkuSearch.DataAccess.Product>>(searchingProducts, originalProducts);
            return  PartialView(tuple);

        }       
    }
}
