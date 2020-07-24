using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineEdu_Session_HW.Attributes
{
    public class Checker : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (HttpContext.Current.Session["login"] == null)
            {
                filterContext.Result = new RedirectResult("/Auth/SignIn");
            }
            base.OnActionExecuting(filterContext);
        }
    }
}