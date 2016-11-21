using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CartItemList
{
    int cartTotalCount;
    private List<CartItem> cartItems;

    public CartItemList()
    {
        cartItems = new List<CartItem>();
    }

    public int Count
    {
        get { return cartItems.Count; }
    }

    public int CartCount
    {
        get { return cartTotalCount; }
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
        cartTotalCount += quantity;
        CartItem c = new CartItem(product, quantity);
        cartItems.Add(c);
    }

    public void RemoveAt(int index)
    {
        CartItem tempCI = cartItems.ElementAt(index);
        cartTotalCount -= tempCI.Quantity;
        cartItems.RemoveAt(index);
    }

    public void Clear()
    {
        cartItems.Clear();
    }
}
