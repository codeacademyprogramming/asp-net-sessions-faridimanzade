using OnlineEdu_Session_HW.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineEdu_Session_HW.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [Checker]
        public ActionResult Courses()
        {
            ViewBag.Message = "Your courses page.";

            return View();
        }

        [Checker]
        public ActionResult Instructor()
        {
            ViewBag.Message = "Your instructor page.";

            return View();
        }

        public ActionResult Blog()
        {
            ViewBag.Message = "Your blog page.";

            return View();
        }

        public ActionResult BlogDetails()
        {
            ViewBag.Message = "Your blog Details page.";

            return View();
        }

        public ActionResult Elements()
        {
            ViewBag.Message = "Your elements page.";

            return View();
        }
    }
}