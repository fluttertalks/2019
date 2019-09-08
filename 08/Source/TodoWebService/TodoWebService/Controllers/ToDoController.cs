using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using ToDoWebService.Models;

namespace ToDoWebService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ToDoController : ControllerBase
    {
        private List<ToDo> _ToDoList = new List<ToDo> {
             new ToDo
             {
                 Id = 1,
                 Description = "Test 1",
                 Date = DateTime.Now
             },
             new ToDo
             {
                 Id = 2,
                 Description = "Test 2",
                 Date = DateTime.Now
             },
             new ToDo
             {
                 Id = 3,
                 Description = "Test 3",
                 Date = DateTime.Now,
                 Finished = true
             }
            };

        // GET api/ToDo
        [HttpGet]
        public ActionResult<IEnumerable<ToDo>> Get()
        {
            return _ToDoList;
        }

        // GET api/ToDo/5
        [HttpGet("{id}")]
        public ActionResult<ToDo> Get(int id)
        {
            ToDo toDo = _ToDoList.FirstOrDefault<ToDo>(t => t.Id == id);

            if (toDo != null)
                return toDo;

            return NotFound();
        }

        // POST api/ToDo
        [HttpPost]
        public void Post([FromBody] ToDo value)
        {
            Console.WriteLine("TODO: INSERTED");

            _ToDoList.Add(value);
        }

        // PUT api/ToDo/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] ToDo value)
        {
            Console.WriteLine("TODO: UPDATED");

            var toDo = _ToDoList.Find(t => t.Id == id);

            toDo.Date = value.Date;
            toDo.Description = value.Description;
            toDo.Finished = value.Finished;                            
        }

        // DELETE api/ToDo/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            ToDo toDo = _ToDoList.FirstOrDefault<ToDo>(t => t.Id == id);

            _ToDoList.Remove(toDo);
        }
    }
}
