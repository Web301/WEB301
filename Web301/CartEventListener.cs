using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Web301
{
    public class CartEventListener
    {
        // Delegate declaration
        public delegate void ThresholdExceededHandler(string message);
        // Event raised
        public event ThresholdExceededHandler Exceeded;

        private decimal priceTotal = 0;
        private decimal thresholdValue;
        //private Label labelForMessage;
        private string labelMessage;

        public CartEventListener(string message, decimal thresholdValue)
        {
            this.labelMessage = message;
            this.thresholdValue = thresholdValue;
        }
        public void AddPriceToTotal(decimal price)
        {
            priceTotal = price;
            if (priceTotal > thresholdValue)
            {
                Exceeded(labelMessage);
            }

        }
    }
}