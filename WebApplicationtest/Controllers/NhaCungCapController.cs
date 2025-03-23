using BUS.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NhaCUngCapController : ControllerBase
    {
        private INhaCungCapBusiness _customerBusiness;
        public NhaCUngCapController(INhaCungCapBusiness customerBusiness)
        {
            _customerBusiness = customerBusiness;
        }

        [Route("create-item")]
        [HttpPost]
        public NhaCungCapModel CreateItem([FromBody] NhaCungCapModel model)
        {
            _customerBusiness.Create(model);
            return model;
        }


        [Route("update-item")]
        [HttpPut]
        public NhaCungCapModel UpdateItem([FromBody] NhaCungCapModel model)
        {
            _customerBusiness.Update(model);
            return model;
        }


        [Route("delete-item")]
        [HttpDelete]
        public IActionResult DeleteItem([FromBody] string id)
        {
            _customerBusiness.Delete(id);
            return Ok();
        }


        [Route("getall-item")]
        [HttpGet]
        public IEnumerable<NhaCungCapModel> GetAllItem()
        {

            return _customerBusiness.GetAll();
        }

        

        [Route("getall-itembyid")]
        [HttpGet]
        public IEnumerable<NhaCungCapModel> GetAllItembyID(int id)
        {

            return _customerBusiness.GetAllByID(id);
        }

        
        [Route("getall-itembyidTenSP")]
        [HttpGet]
        public IEnumerable<NhaCungCapModel> GetAllByTenM(string id)
        {

            return _customerBusiness.GetAllByTenM(id);
        }
    }
}
