using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Web.Mvc;


namespace projetSIABD.Models
{
    public class messageWithComments
    {
        private MySQLEntities db = new MySQLEntities();
        public messagesdbs nouvelle { get; set; }
        public List<commentsdbs> associatedComments { get; set; }
        public List<likesdbs> likes { get; set; }
        public int nbLikes { get; set; }

        public messageWithComments(int messageID)
        {
            nouvelle = db.messagesdbs.Where(a => a.messageID.Equals(messageID)).FirstOrDefault();
            associatedComments = db.commentsdbs.Where(a => a.messageId.Equals(messageID)).OrderByDescending(a => a.date).ToList();
            likes = db.likesdbs.Where(l => l.messageApproved.Equals(messageID)).ToList();
            nbLikes = likes.Count();
            
        }
    }

    public class newsFeedModels
    {
        MySQLEntities db = new MySQLEntities();
        public List<messageWithComments> ListOfNew { get; set; }
        public messagesdbs aux { get; set; }
        public commentsdbs aux2 { get; set; }
        public int currentuser { get; set; }

        public newsFeedModels(List<messagesdbs> listOfMessages, string name)
        {
            var tmp1 = new List<messageWithComments>();
            foreach (var item in listOfMessages)
            {
                var tmp2 = new messageWithComments(item.messageID);
                tmp1.Add(tmp2);
            }
            ListOfNew = tmp1;
                        
            my_aspnet_users user = db.my_aspnet_users.Where(a => a.name.Equals(name)).FirstOrDefault();
            currentuser = user.id;
        }
    }
}