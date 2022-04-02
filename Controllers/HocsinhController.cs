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
    [Authorize(Users = "admin@sl.com")]
    public class HocsinhController : Controller
    {
        private LibraryEntities db = new LibraryEntities();

        // GET: Hocsinh
        public ActionResult Index()
        {
            var hocsinhs = db.Hocsinhs.Include(h => h.Lop);
            return View(hocsinhs.ToList());
        }

        // GET: Hocsinh/Details/5
        public ActionResult Details(int? id)
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
        [AllowAnonymous]
        public ActionResult Create()
        {
            ViewBag.LopId = new SelectList(db.Lops, "Id", "Tenlop");
            return View();
        }

        // POST: Hocsinh/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]        
        public ActionResult Create([Bind(Include = "Id,Hoten,LopId,Dienthoai,Email,Diachi,Phuhuynh,Anh")] Hocsinh hocsinh)
        {
            if (ModelState.IsValid)
            {
                db.Hocsinhs.Add(hocsinh);
                db.SaveChanges();
                return RedirectToAction("index");
            }

            ViewBag.LopId = new SelectList(db.Lops, "Id", "Tenlop", hocsinh.LopId);
            return View(hocsinh);
        }

        // GET: Hocsinh/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.LopId = new SelectList(db.Lops, "Id", "Tenlop", hocsinh.LopId);
            return View(hocsinh);
        }

        // POST: Hocsinh/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Hoten,LopId,Dienthoai,Email,Diachi,Phuhuynh,Anh")] Hocsinh hocsinh)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hocsinh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LopId = new SelectList(db.Lops, "Id", "Tenlop", hocsinh.LopId);
            return View(hocsinh);
        }

        // GET: Hocsinh/Delete/5
        public ActionResult Delete(int? id)
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
        public ActionResult DeleteConfirmed(int id)
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
