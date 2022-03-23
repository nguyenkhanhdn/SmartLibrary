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
    public class MuonTraController : Controller
    {
        private LibraryEntities db = new LibraryEntities();

        // GET: MuonTra

        public ActionResult Returns()
        {
            //var borrows = db.MuonTras.Include(b => b.Sach).Include(b => b.Hocsinh).ToList();
            //borrows = borrows.Where(b => b.Ngaytra is not null);
            //return View("Index", borrows.ToList());
            return View();
        }

        public ActionResult Quahan()
        {
            var borrows = db.MuonTras.Include(b => b.Sach).Include(b => b.Hocsinh).ToList();

            var duebooks = borrows.Where((b => b.NgayMuon.AddDays(14) < DateTime.Today));
            duebooks = duebooks.Where(d => d.Ngaytra == null);
            return View(duebooks);
        }

        public ActionResult Chuatra()
        {
            var borrows = db.MuonTras.Include(b => b.Sach).Include(b => b.Hocsinh).ToList();

            var duebooks = borrows.Where(d => d.Ngaytra == null);
            return View(duebooks);
        }

        public ActionResult Index()
        {
            var muonTras = db.MuonTras.Include(m => m.Hocsinh).Include(m => m.Sach);
            return View(muonTras.ToList());
        }

        // GET: MuonTra/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MuonTra muonTra = db.MuonTras.Find(id);
            if (muonTra == null)
            {
                return HttpNotFound();
            }
            return View(muonTra);
        }

        // GET: MuonTra/Create
        public ActionResult Create()
        {
            ViewBag.HocsinhId = new SelectList(db.Hocsinhs, "Id", "Hoten");
            ViewBag.SachId = new SelectList(db.Saches, "Id", "TenSach");
            return View();
        }

        // POST: MuonTra/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,HocsinhId,SachId,NgayMuon,Ngaytra,Ngayphaitra,Tienphat,Ghichu")] MuonTra muonTra)
        {
            if (ModelState.IsValid)
            {
                db.MuonTras.Add(muonTra);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.HocsinhId = new SelectList(db.Hocsinhs, "Id", "Hoten", muonTra.HocsinhId);
            ViewBag.SachId = new SelectList(db.Saches, "Id", "TenSach", muonTra.SachId);
            return View(muonTra);
        }

        // GET: MuonTra/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MuonTra muonTra = db.MuonTras.Find(id);
            if (muonTra == null)
            {
                return HttpNotFound();
            }
            ViewBag.HocsinhId = new SelectList(db.Hocsinhs, "Id", "Hoten", muonTra.HocsinhId);
            ViewBag.SachId = new SelectList(db.Saches, "Id", "TenSach", muonTra.SachId);
            return View(muonTra);
        }

        // POST: MuonTra/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,HocsinhId,SachId,NgayMuon,Ngaytra,Ngayphaitra,Tienphat,Ghichu")] MuonTra muonTra)
        {
            if (ModelState.IsValid)
            {
                db.Entry(muonTra).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.HocsinhId = new SelectList(db.Hocsinhs, "Id", "Hoten", muonTra.HocsinhId);
            ViewBag.SachId = new SelectList(db.Saches, "Id", "TenSach", muonTra.SachId);
            return View(muonTra);
        }

        // GET: MuonTra/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MuonTra muonTra = db.MuonTras.Find(id);
            if (muonTra == null)
            {
                return HttpNotFound();
            }
            return View(muonTra);
        }

        // POST: MuonTra/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MuonTra muonTra = db.MuonTras.Find(id);
            db.MuonTras.Remove(muonTra);
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
