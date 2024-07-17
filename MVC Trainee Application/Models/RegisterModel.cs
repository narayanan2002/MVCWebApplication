using System.ComponentModel.DataAnnotations;

namespace Application1.Models
{
    public class RegisterModel
    {
        public int SNo { get; set; } 

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Username { get; set; }

        public string PhoneNumber { get; set; }


        public string EmailId { get; set; }
    }
}
