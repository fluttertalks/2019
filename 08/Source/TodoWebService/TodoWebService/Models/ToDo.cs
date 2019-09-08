using System;

namespace ToDoWebService.Models
{
    public class ToDo
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public DateTime Date { get; set; }
        public bool Finished { get; set; }

        public ToDo()
        {
            Finished = false;
        }
    }
}
