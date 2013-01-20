﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace projetSIABD.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "Bienvenu sur le réseau social de l'entreprise *******";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
