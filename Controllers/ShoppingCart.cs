using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace SmartLibrary.Controllers
{
    public class ShoppingCart
    {
        // internal member variables
        private String user;
        private DataTable items;
        private Double total;

        // public properties
        public String UserID
        {
            get { return user; }
            set { user = value; }
        }
        public DataTable CartItems
        {
            get { return items; }
            set { items = value; }
        }
        public Double TotalValue
        {
            get { return total; }
            set { total = value; }
        }
        // default constructor
        public ShoppingCart()
        {
            // create an empty shopping cart
            user = String.Empty;
            // create an empty DataTable to hold the cart items
            items = new DataTable("Items");
            items.Columns.Add(new DataColumn("bookId", Type.GetType("System.String")));
            items.Columns.Add(new DataColumn("title", Type.GetType("System.String")));
            items.Columns.Add(new DataColumn("quantity", Type.GetType("System.Int32")));
            // set total value of the new cart to zero 
            total = 0;
        }
        public void UpdateCart()
        {
            //your Update cart
        }
        public void RemoveItem(string bookId)
        {
            DataRow[] rows = items.Select("bookId='" + bookId + "'");
            if (rows.Length > 0)
            {
                items.Rows.Remove(rows[0]);
            }
        }
        // add an item to the cart
        public void AddItem(String bookId, String title, int quantity)
        {
            if (!IsExistItem(bookId))
            {
                // create new DataTable row and populate with values - Hàng mới
                DataRow row = items.NewRow();
                row["bookId"] = bookId;
                row["title"] = title;
                row["quantity"] = quantity;
                // add row to DataTable update total value
                items.Rows.Add(row);
                total += quantity;
            }
            else
            {
                //Đã có rồi thì thôi, không thêm được nữa
                for (int i = 0; i < items.Rows.Count; i++)
                {
                    if (items.Rows[i]["bookId"].Equals(bookId))
                    {
                        break;//Thoat vong lap
                    }
                }
            }
        }
        public bool IsExistItem(string bookId)
        {
            bool b = false;
            if (items.Rows.Count > 0)
            {
                for (int i = 0; i < items.Rows.Count; i++)
                {
                    if (items.Rows[i]["bookId"].Equals(bookId))
                    {
                        b = true;
                        break;//Thoat vong lap
                    }
                }
            }
            return b;
        }
        // empty the cart by clearing the DataTable
        public void Clear()
        {
            items.Rows.Clear();
            total = 0;
        }
    }
}