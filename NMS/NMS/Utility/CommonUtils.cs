﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web.SessionState;
 
using System.Collections;

namespace NMS.Utility
{
    public static class CommonUtils
    {

        #region publicConstants

        #region feedback types
        public const string FEEDBACK_INFORMATION = "Info";
        public const string FEEDBACK_ERROR = "danger";
        public const string FEEDBACK_WARNING = "Warning";
        public const string FEEDBACK_NOTIFICATION = "Notification";
        public const string FEEDBACK_SUCCESS = "Success";

        #endregion

        #region Settings

        public static string DEFAULT_COLOR = "#8b5c7e";
        public const string DATE_FORMAT = "dd/MMM/yyyy";
        public const string NUMBER_FORMAT = "{0:d}";
        public const string NUMBER_FORMAT_NO_BRACES = "0:d";

        #endregion

        #region Data

        public const string STATUS_ENTERED = "Entered";
        public const string STATUS_PENDING = "Pending";
        public const string STATUS_RUNNING = "Running";
        public const string STATUS_PASSED = "Passed";
        public const string STATUS_ACTIVE = "Active";
        public const string STATUS_APPROVED = "Approved";
        public const string STATUS_CLOSED = "Closed";
        public const string STATUS_ENTEREDRETURN = "EnteredReturn";

        internal static IEnumerable GetStatusList()
        {
            return new List<string>
            {
                STATUS_ACTIVE,
                STATUS_CLOSED,
            };
        }

        public const string STATUS_HISTORY = "History";
        public const string STATUS_DISABLED = "Disabled";
        public const string STATUS_DELETED = "Deleted";
        public const string STATUS_SUSPENDED = "Suspended";
        public const string STATUS_OPENED = "Opened";
        public const string STATUS_ENTER_SALE = "EnteredSale";
        public const string STATUS_ENTER_TRANSAFER = "EnteredTransfer";
        public static string STATUS_ENDED = "Ended";

        public const string GENDER_MALE = "MALE";
        public const string GENDER_FEMALE = "FEMALE";

        public static int SocGuarantee = 103;


        #endregion

        #endregion

      
        public static void SetFeedback(string message, string type)
        {
            //Stopwatch stopwatch = new Stopwatch();
            //stopwatch.Start();

            #region Asynchronous

            //var _context = System.Web.HttpContext.Current;
            //Task t1 = Task.Run(() =>
            //{
            //    CallContext.HostContext = _context;
            //    _context.Session["Message"] = message;
            //});

            //Task t2 = Task.Run(() =>
            //{
            //    CallContext.HostContext = _context;
            //    _context.Session["MessageStyle"] = type;
            //});

            //Task t3 = Task.Run(() =>
            //{
            //    CallContext.HostContext = _context;
            //    _context.Session["Type"] = Feedback.ResourceManager.GetString("Feedback_" + type);
            //});

            //Task.WaitAll(t1, t2, t3);



            #endregion

            HttpContext.Current.Session["Message"] = message;
            HttpContext.Current.Session["MessageStyle"] = type;
          //  HttpContext.Current.Session["Type"] = Feedback.ResourceManager.GetString("Feedback_" + type);

            //stopwatch.Stop();
            //Debug.WriteLine($"Elapsed time = {stopwatch.Elapsed}");


        }

        public static string RenderPartialViewToString(Controller controller, string viewName, object model)
        {

            controller.ViewData.Model = model;

            using (var sw = new StringWriter())
            {
                var viewResult = ViewEngines.Engines.FindPartialView(controller.ControllerContext, viewName);

                var viewContext = new ViewContext(controller.ControllerContext, viewResult.View, controller.ViewData, controller.TempData, sw);

                viewResult.View.Render(viewContext, sw);

                return sw.GetStringBuilder().ToString();


            }
        }


        /// <summary>			      
        /// 	   Convert HttpPostedFileBase to byte[]
        /// </summary>
        /// <param name="file"> HttpPostedFileBase</param>
        /// <returns> byte[] of file</returns>

        public static byte[] fileToByte(HttpPostedFileBase file)
        {
            byte[] binary;

            using (var binaryReader = new BinaryReader(file.InputStream))
            {
                binary = binaryReader.ReadBytes(file.ContentLength);
            }

            return binary;
        }

        //public static string GetUserName(string userid)
        //{
        //    var singleOrDefault = db.USER_MAST.SingleOrDefault(i => i.USER_ID == userid);
        //    if (singleOrDefault != null)
        //        return singleOrDefault.USER_NAME;
        //    return string.Empty;
        //}

       


    }
    public class Constant
    {
        #region Constants
        //feedback types
        #region feedback types

        public const string FEEDBACK_INFORMATION = "Info";
        public const string FEEDBACK_ERROR = "danger";
        public const string FEEDBACK_WARNING = "Warning";
        public const string FEEDBACK_NOTIFICATION = "Notification";
        public const string FEEDBACK_SUCCESS = "Success";

        #endregion

        #region Settings

        public static string DEFAULT_COLOR = "#8b5c7e";
        public const string DATE_FORMAT = "dd/MMM/yyyy";
        public const string NUMBER_FORMAT = "{0:d}";
        public const string NUMBER_FORMAT_NO_BRACES = "0:d";

        #endregion

        #region Data


        public const string STATUS_ENTERED = "Entered";
        public const string STATUS_PENDING = "Pending";
        public const string STATUS_RUNNING = "Running";
        public const string STATUS_PASSED = "Passed";
        public const string STATUS_ACTIVE = "Active";
        public const string STATUS_APPROVED = "Approved";
        public const string STATUS_CLOSED = "Closed";
        public const string STATUS_HISTORY = "History";
        public const string STATUS_DISABLED = "Disabled";
        public const string STATUS_DELETED = "Deleted";
        public const string STATUS_SUSPENDED = "Suspended";
        public const string STATUS_OPENED = "Opened";
        public const string STATUS_ENTER_SALE = "EnteredSale";
        public const string STATUS_ENTER_TRANSAFER = "EnteredTransfer";
        public const string STATUS_HOLIDAY = "Holiday";
        public const string STATUS_REJECTED = "REJECTED";
        public const string STATUS_DELETED2 = "DELETED";
        public const string STATUS_APPROVED2 = "APPROVED";
        public const string STATUS_ENTERED2 = "ENTERED";
        public const string STATUS_ENTERSTOPPED = "ENTERSTOPPED";
        public const string STATUS_STOPPED = "STOPPED";
        public const string STATUS_ENTERRELESED = "ENTERRELEASED";
        public const string STATUS_RELEASED = "RELEASED";
        public const string STATUS_PAID = "PAID";
        public const string STATUS_ACTIVE2 = "ACTIVE";
        public const string STATUS_FIRED = "Fired";



        public const string GENDER_MALE = "MALE";
        public const string GENDER_FEMALE = "FEMALE";


        #endregion

        #endregion
    }




}