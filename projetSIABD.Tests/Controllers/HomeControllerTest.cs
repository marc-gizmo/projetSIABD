﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using projetSIABD;
using projetSIABD.Controllers;

namespace projetSIABD.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Réorganiser
            HomeController controller = new HomeController();

            // Agir
            ViewResult result = controller.Index() as ViewResult;

            // Déclarer
            ViewDataDictionary viewData = result.ViewData;
            Assert.AreEqual("Bienvenue dans ASP.NET MVC !", viewData["Message"]);
        }

        [TestMethod]
        public void About()
        {
            // Réorganiser
            HomeController controller = new HomeController();

            // Agir
            ViewResult result = controller.About() as ViewResult;

            // Déclarer
            Assert.IsNotNull(result);
        }
    }
}
