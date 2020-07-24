using OnlineEdu_Session_HW.DbContexts;
using OnlineEdu_Session_HW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

namespace OnlineEdu_Session_HW.Controllers
{
    public class AuthController : Controller
    {
        readonly UserContext db = new UserContext();

        //============================ SIGN IN
        public ActionResult SignIn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SignIn(string username, string password)
        {
            var User = db.Users.FirstOrDefault(x => x.Username == username);

            if (User != null)
            {
                bool isMatched = Crypto.VerifyHashedPassword(User.Password, password);

                if (isMatched)
                {
                    Session["login"] = true;
                    Session["userid"] = User.id;
                    Session["username"] = User.Username;

                    return RedirectToAction("Index", "Home");
                }
            }

            ModelState.AddModelError("Username", "No Such User Found");

            return View("SignIn");
        }


        //================================ SIGN UP
        public ActionResult SignUp()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SignUp(User user)
        {
            if (db.Users.FirstOrDefault(x => x.Username == user.Username) != null)
            {
                ModelState.AddModelError("Username", "Username already has taken");
            }

            if (db.Users.FirstOrDefault(x => x.Email == user.Email) != null)
            {
                ModelState.AddModelError("Email", "Email already has used");
            }

            if (ModelState.IsValid)
            {
                var hashPassword = Crypto.HashPassword(user.Password);
                user.Password = hashPassword;
                user.ConfirmPassword = hashPassword;

                db.Users.Add(user);
                db.SaveChanges();

                return RedirectToAction("SignIn", "Auth");
            }

            return View(user);
        }


        //=============================== SIGN OUT
        public ActionResult SignOut()
        {
            Session.Clear();
            return RedirectToAction("SignIn", "Auth");
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