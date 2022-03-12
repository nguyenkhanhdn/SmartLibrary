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
    public class LopController : Controller
    {
        private LibraryModel db = new LibraryModel();

        // GET: Lop
        public ActionResult Index()
        {
            return View(db.Lops.ToList());
        }

        // GET: Lop/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lop lop = db.Lops.Find(id);
            if (lop == null)
            {
                return HttpNotFound();
            }
            return View(lop);
        }

        // GET: Lop/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Lop/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaLop,TenLop,GVCN,Ghichu")] Lop lop)
        {
            if (ModelState.IsValid)
            {
                db.Lops.Add(lop);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(lop);
        }

        // GET: Lop/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lop lop = db.Lops.Find(id);
            if (lop == null)
            {
                return HttpNotFound();
            }
            return View(lop);
        }

        // POST: Lop/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaLop,TenLop,GVCN,Ghichu")] Lop lop)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lop).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lop);
        }

        // GET: Lop/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lop lop = db.Lops.Find(id);
            if (lop == null)
            {
                return HttpNotFound();
            }
            return View(lop);
        }

        // POST: Lop/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Lop lop = db.Lops.Find(id);
            db.Lops.Remove(lop);
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
