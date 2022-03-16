using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SmartLibrary.Models;

namespace SmartLibrary.Controllers
{
    public class HocsinhController : Controller
    {
        private LibraryModel db = new LibraryModel();

        // GET: Hocsinh
        public ActionResult Index()
        {
            var hocsinhs = db.Hocsinhs.Include(h => h.Lop);
            return View(hocsinhs.ToList());
        }

        // GET: Hocsinh/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hocsinh hocsinh = db.Hocsinhs.Find(id);
            if (hocsinh == null)
            {
                return HttpNotFound();
            }
            return View(hocsinh);
        }

        // GET: Hocsinh/Create
        public ActionResult Create()
        {
            ViewBag.MaLop = new SelectList(db.Lops, "MaLop", "TenLop");
            return View();
        }

        // POST: Hocsinh/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaHS,TenHS,MaLop,Dienthoai,Email,Diachi,Phuhuynh,Anh")] Hocsinh hocsinh)
        {
            if (ModelState.IsValid)
            {
                db.Hocsinhs.Add(hocsinh);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLop = new SelectList(db.Lops, "MaLop", "TenLop", hocsinh.MaLop);
            return View(hocsinh);
        }

        // GET: Hocsinh/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hocsinh hocsinh = db.Hocsinhs.Find(id);
            if (hocsinh == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLop = new SelectList(db.Lops, "MaLop", "TenLop", hocsinh.MaLop);
            return View(hocsinh);
        }

        // POST: Hocsinh/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaHS,TenHS,MaLop,Dienthoai,Email,Diachi,Phuhuynh,Anh")] Hocsinh hocsinh)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hocsinh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaLop = new SelectList(db.Lops, "MaLop", "TenLop", hocsinh.MaLop);
            return View(hocsinh);
        }

        // GET: Hocsinh/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hocsinh hocsinh = db.Hocsinhs.Find(id);
            if (hocsinh == null)
            {
                return HttpNotFound();
            }
            return View(hocsinh);
        }

        // POST: Hocsinh/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Hocsinh hocsinh = db.Hocsinhs.Find(id);
            db.Hocsinhs.Remove(hocsinh);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
