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
    [Authorize]
    public class SachController : Controller
    {
        private LibraryModel db = new LibraryModel();

        // GET: Sachontroller
        public ActionResult Index()
        {
            var saches = db.Saches.Include(s => s.LoaiSach);
            return View(saches.ToList());
        }

        // GET: Sachontroller/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sach sach = db.Saches.Find(id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            return View(sach);
        }

        // GET: Sachontroller/Create
        public ActionResult Create()
        {
            ViewBag.MaLS = new SelectList(db.LoaiSaches, "MaLS", "TenLoai");
            return View();
        }

        // POST: Sachontroller/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSach,TenSach,MaLS,Tomtat,Anh,NhaXB,NamXB,Tacgia")] Sach sach)
        {
            if (ModelState.IsValid)
            {
                db.Saches.Add(sach);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLS = new SelectList(db.LoaiSaches, "MaLS", "TenLoai", sach.MaLS);
            return View(sach);
        }

        // GET: Sachontroller/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sach sach = db.Saches.Find(id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLS = new SelectList(db.LoaiSaches, "MaLS", "TenLoai", sach.MaLS);
            return View(sach);
        }

        // POST: Sachontroller/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSach,TenSach,MaLS,Tomtat,Anh,NhaXB,NamXB,Tacgia")] Sach sach)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sach).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaLS = new SelectList(db.LoaiSaches, "MaLS", "TenLoai", sach.MaLS);
            return View(sach);
        }

        // GET: Sachontroller/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sach sach = db.Saches.Find(id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            return View(sach);
        }

        // POST: Sachontroller/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Sach sach = db.Saches.Find(id);
            db.Saches.Remove(sach);
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
