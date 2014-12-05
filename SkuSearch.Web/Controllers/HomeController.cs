using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SkuSearch.DataAccess;

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
    }
}
