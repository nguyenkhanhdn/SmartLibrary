using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using SmartLibrary.Models;
namespace SmartLibrary.Controllers
{
    public class HomeController : Controller
    {
        private SmartLibrary.Models.LibraryModel db = new  Models.LibraryModel();
        public ActionResult Index()
        {
            var books = db.Saches;
            //books.Take(8);
            //return View(books.ToList().Take(12));
            return View(books.ToList().Take(12));

        }
        public ActionResult AddToCart(string id, string title, int quantity = 1)
        {
            string[] s = id.Split('-');
            ShoppingCart cart = (ShoppingCart)Session["cart"];
            if (cart == null)
            {
                cart = new ShoppingCart();
            }
            cart.AddItem(s[0], s[1], quantity);
            //Save cart
            Session["cart"] = cart;
            return RedirectToAction("YourCart");
        }
        [Authorize]
        public ActionResult YourCart()
        {
            //Models.NorthwindEntities db = new Models.NorthwindEntities();
            //return View(db.Categories.Include("Products").ToList());
            return View();
        }
        public ActionResult RemoveItem(string id)
        {
            ShoppingCart cart = (ShoppingCart)Session["cart"];
            if (cart == null)
            {
                cart = new ShoppingCart();
            }
            cart.RemoveItem(id);
            Session["cart"] = cart;
            return RedirectToAction("YourCart");
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [HttpPost]
        public ActionResult doSearch(string tensach)
        {
            var books = db.Saches.Where(x=>x.TenSach.Contains(tensach));
            books.OrderBy(r => r.TenSach);
            return View("Index", books.ToList());
        }
        public ActionResult SearchBook()
        {
            var books = db.Saches;
            books.OrderBy(r => r.TenSach);
            return View(books.ToList());
        }
        //[Authorize]
        public ActionResult Registration()
        {
            ShoppingCart cart = Session["cart"] as ShoppingCart;
            if (cart == null)
            {
                RedirectToAction("Index");
            }
            var info = db.GetMemberInfo(User.Identity.GetUserId());
            ViewBag.Email = info.Email;
            ViewBag.UserName = info.UserName;
            ViewBag.Phone = info.PhoneNumber;
            return View();
        }
        //[Authorize()]
        //public ActionResult doRegister(string MemberId, string Fullname, string Phone, string note)
        //{
        //    Registration regInfo = null;

        //    ShoppingCart cart = (ShoppingCart)Session["cart"];
        //    if (cart == null)
        //    {
        //        cart = new ShoppingCart();
        //        RedirectToAction("Index");
        //    }
        //    else
        //    {
        //        foreach (DataRow row in cart.CartItems.Rows)
        //        {
        //            regInfo = new Registration();
        //            regInfo.BookId = row["bookId"].ToString();
        //            regInfo.MemberId = MemberId;
        //            regInfo.Fullname = Fullname;
        //            regInfo.Phone = Phone;
        //            regInfo.note = note;
        //            regInfo.RegDate = DateTime.Today;
        //            regInfo.RecDate = DateTime.Today.AddDays(1);
        //            db.Registrations.Add(regInfo);
        //        }
        //        db.SaveChanges();
        //    }

        //    Session["cart"] = null;
        //    return View("Success");
        //}
    }
}