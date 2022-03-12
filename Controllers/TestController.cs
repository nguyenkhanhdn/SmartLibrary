using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartLibrary.Controllers
{
    public class TestController : Controller
    {
        // GET: Test
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Post(int id)
        {
            return Content("Post Id: " + id.ToString());
        }
        public ActionResult Hello()
        {
            return Content("Hello world");
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();

        }
        [HttpPost]
        public ActionResult Register(int id, string name, float mark)
        {
            ViewBag.Id = id;
            ViewBag.Name = name;
            ViewBag.Mark = mark;
            //Viết mã lệnh để xử lý chức năng đăng ký
            return View("RegistrationInfo");
        }

    }
}