using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using PagedList;
using SmartLibrary.Models;

namespace SmartLibrary.Controllers
{
    public class HomeController : Controller
    {
        private LibraryEntities db = new LibraryEntities();
        public ActionResult Index(int? page)
        {

            var books = db.Saches.OrderByDescending(b => b.Id);
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            return View(books.ToPagedList(pageNumber, pageSize));

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
            return View("SearchBook",books.ToList());
            //return View("Index", books.ToList());
        }
        public ActionResult SearchBook(string tensach)
        {
            var books = db.Saches;
            books.OrderBy(r => r.TenSach);
            return View(books.ToList());
        }
        [Authorize]
        public ActionResult Registration()
        {
            ShoppingCart cart = Session["cart"] as ShoppingCart;
            if (cart == null)
            {
                RedirectToAction("Index");
            }

            var hs = db.Hocsinhs.Where(h => h.Email == User.Identity.Name).FirstOrDefault();
            ViewBag.HocsinhId = hs.Id;
            ViewBag.Diachi = hs.Diachi;
            ViewBag.Dienthoai = hs.Dienthoai;
            ViewBag.Hoten = hs.Hoten;
            return View();
        }
        [Authorize()]
        public ActionResult Register(string hocsinhId, string ngaydk, string ngaynhan, string phuongthuc, string diachi, string dienthoai,string ghichu)
        {
            DangKyMuon regInfo = null;
            
            ShoppingCart cart = (ShoppingCart)Session["cart"];
            if (cart == null)
            {
                cart = new ShoppingCart();
                RedirectToAction("Index");
            }
            else
            {
                foreach (DataRow row in cart.CartItems.Rows)
                {
                    regInfo = new DangKyMuon();
                    regInfo.SachId = int.Parse(row[0].ToString());
                    regInfo.HocsinhId = int.Parse(hocsinhId);
                    regInfo.NgayDK = DateTime.Parse(ngaydk);
                    regInfo.NgayNhan = DateTime.Parse(ngaynhan);
                    regInfo.Phuongthuc = phuongthuc;
                    regInfo.Diachi = diachi;
                    regInfo.Dienthoai = dienthoai;
                    db.DangKyMuons.Add(regInfo);
                }
                db.SaveChanges();
            }
            
            Session["cart"] = null;
            return View("Success");
        }
    }
}