using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Web.Mvc;


namespace projetSIABD.Models
{
    public class messageWithJoin
    {
        public messagesdbs nouvelle { get; set; }
        public string author { get; set; }
        public string theme { get; set; }
    }

    public class messageWithComments
    {
        private MySQLEntities db = new MySQLEntities();
        public messageWithJoin nouvelle { get; set; }
        public List<commentsdbs> associatedComments { get; set; }
        public List<likesdbs> likes { get; set; }
        public int nbLikes { get; set; }

        public messageWithComments(int messageID)
        {
            var messagesdbstest = from m in db.messagesdbs
                                  join u in db.my_aspnet_users on m.author equals u.id
                                  //join t in db.themesdbs on m.theme equals t.themeId
                                  select new projetSIABD.Models.messageWithJoin { nouvelle = m, author = u.name };
            nouvelle = messagesdbstest.Where(a => a.nouvelle.messageID.Equals(messageID)).FirstOrDefault();
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
        public List<my_aspnet_users> userList { get; set; }
        public int currentUser { get; set; }
        public bool isAdmin { get; set; }

        public newsFeedModels(List<messageWithJoin> listOfMessages, string name, bool role)
        {
            var tmp1 = new List<messageWithComments>();
            foreach (var item in listOfMessages)
            {
                var tmp2 = new messageWithComments(item.nouvelle.messageID);
                tmp1.Add(tmp2);
            }
            ListOfNew = tmp1;
                        
            my_aspnet_users user = db.my_aspnet_users.Where(a => a.name.Equals(name)).FirstOrDefault();
            currentUser = user.id;
            isAdmin = role;
        }
    }
}