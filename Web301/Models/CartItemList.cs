using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CartItemList
{
    int cartTotalCount;//*** ADDED BY PAUL
    decimal cartCost;//*** ADDED BY PAUL
    private List<CartItem> cartItems;

    public CartItemList()
    {
        cartItems = new List<CartItem>();
    }

    public int Count
    {
        get { return cartItems.Count; }
    }

    public int CartCount//*** ADDED BY PAUL
    {
        get { return cartTotalCount; }
    }

    public decimal GetCartCost//*** ADDED BY PAUL
    {
        get { return cartCost; }
    }

    public CartItem this[int index]
    {
        get { return cartItems[index]; }
        set { cartItems[index] = value; }
    }

    public CartItem this[string id]
    {
        get
        {
            foreach (CartItem c in cartItems)
                if (c.Product.ProductID == id) return c;
            return null;
        }
    }

    public static CartItemList GetCart()
    {
        CartItemList cart = (CartItemList)HttpContext.Current.Session["Cart"];
        if (cart == null)
            HttpContext.Current.Session["Cart"] = new CartItemList();
        return (CartItemList)HttpContext.Current.Session["Cart"];
    }

    public void AddItem(Product product, int quantity)
    {
        cartCost += (product.UnitPrice * Convert.ToDecimal(quantity));//*** ADDED BY PAUL
        cartTotalCount += quantity;//*** ADDED BY PAUL
        CartItem c = new CartItem(product, quantity);
        cartItems.Add(c);
    }

    public void RemoveAt(int index)
    {
        CartItem tempCI = cartItems.ElementAt(index);//*** ADDED BY PAUL
        cartTotalCount -= tempCI.Quantity;//*** ADDED BY PAUL
        cartCost -= (tempCI.Product.UnitPrice * tempCI.Quantity);//*** ADDED BY PAUL
        cartItems.RemoveAt(index);
    }

    public void Clear()
    {
        cartItems.Clear();
    }
}
