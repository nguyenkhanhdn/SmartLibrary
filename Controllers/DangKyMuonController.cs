using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Services;
using System.Web.Services;
using SmartLibrary.Models;

namespace SmartLibrary.Controllers
{
    [Authorize(Users = "admin@sl.com")]
    public class DangKyMuonController : Controller
    {
        private LibraryEntities db = new LibraryEntities();

        public ActionResult ShowAll()
        {
            var dangKyMuons = db.DangKyMuons.Include(d => d.Hocsinh).Include(d => d.Sach);
            return View(dangKyMuons.ToList());
        }

       

        //[WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [HttpGet]
        public ActionResult doXuLy(int id)
        {
            
            if (id == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DangKyMuon dangKyMuon = db.DangKyMuons.Find(id);
            dangKyMuon.Xuly = true;
            db.Entry(dangKyMuon).State = EntityState.Modified;
            

            MuonTra muon = new MuonTra();
            muon.SachId = dangKyMuon.SachId;
            muon.HocsinhId = dangKyMuon.HocsinhId;
            muon.NgayMuon = DateTime.Today;
            muon.Ngayphaitra = DateTime.Today.AddDays(14);
            muon.Tienphat = 0;
            muon.Ghichu = "Mượn sách";

            db.MuonTras.Add(muon);
            
            
            db.SaveChanges();

            return RedirectToAction("Index");
        }

        // GET: DangKyMuon
        public ActionResult Index()
        {
            var dangKyMuons = db.DangKyMuons.Include(d => d.Hocsinh).Include(d => d.Sach).Where(r => r.Xuly == false);
            return View(dangKyMuons.ToList());
        }

        // GET: DangKyMuon/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DangKyMuon dangKyMuon = db.DangKyMuons.Find(id);
            if (dangKyMuon == null)
            {
                return HttpNotFound();
            }
            return View(dangKyMuon);
        }

        // GET: DangKyMuon/Create
        public ActionResult Create()
        {
            ViewBag.HocsinhId = new SelectList(db.Hocsinhs, "Id", "Hoten");
            ViewBag.SachId = new SelectList(db.Saches, "Id", "TenSach");
            return View();
        }

        // POST: DangKyMuon/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,HocsinhId,SachId,NgayDK,NgayNhan,Phuongthuc,Diachi,Dienthoai,Ghichu")] DangKyMuon dangKyMuon)
        {
            if (ModelState.IsValid)
            {
                db.DangKyMuons.Add(dangKyMuon);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.HocsinhId = new SelectList(db.Hocsinhs, "Id", "Hoten", dangKyMuon.HocsinhId);
            ViewBag.SachId = new SelectList(db.Saches, "Id", "TenSach", dangKyMuon.SachId);
            return View(dangKyMuon);
        }

        // GET: DangKyMuon/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DangKyMuon dangKyMuon = db.DangKyMuons.Find(id);
            if (dangKyMuon == null)
            {
                return HttpNotFound();
            }
            ViewBag.HocsinhId = new SelectList(db.Hocsinhs, "Id", "Hoten", dangKyMuon.HocsinhId);
            ViewBag.SachId = new SelectList(db.Saches, "Id", "TenSach", dangKyMuon.SachId);
            return View(dangKyMuon);
        }

        // POST: DangKyMuon/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,HocsinhId,SachId,NgayDK,NgayNhan,Phuongthuc,Diachi,Dienthoai,Ghichu")] DangKyMuon dangKyMuon)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dangKyMuon).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.HocsinhId = new SelectList(db.Hocsinhs, "Id", "Hoten", dangKyMuon.HocsinhId);
            ViewBag.SachId = new SelectList(db.Saches, "Id", "TenSach", dangKyMuon.SachId);
            return View(dangKyMuon);
        }

        // GET: DangKyMuon/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DangKyMuon dangKyMuon = db.DangKyMuons.Find(id);
            if (dangKyMuon == null)
            {
                return HttpNotFound();
            }
            return View(dangKyMuon);
        }

        // POST: DangKyMuon/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DangKyMuon dangKyMuon = db.DangKyMuons.Find(id);
            db.DangKyMuons.Remove(dangKyMuon);
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
