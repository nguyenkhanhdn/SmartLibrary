using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartLibrary.Controllers
{
    [Authorize(Users = "admin@sl.com")]
    public class adminController : Controller
    {
        // GET: admin
        public ActionResult Index()
        {
            return RedirectToAction("Index", "DangKyMuon");
        }
    }
}