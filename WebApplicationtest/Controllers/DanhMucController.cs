using BUS.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DanhMucController : ControllerBase
    {
        private IDanhMucBusiness _customerBusiness;
        public DanhMucController(IDanhMucBusiness customerBusiness)
        {
            _customerBusiness = customerBusiness;
        }

        [Route("create-item")]
        [HttpPost]
        public DanhMucModel CreateItem([FromBody] DanhMucModel model)
        {
            _customerBusiness.Create(model);
            return model;
        }


        [Route("update-item")]
        [HttpPut]
        public DanhMucModel UpdateItem([FromBody] DanhMucModel model)
        {
            _customerBusiness.Update(model);
            return model;
        }


        [Route("delete-item")]
        [HttpDelete]
        public DanhMucModel DeleteItem([FromBody] DanhMucModel model)
        {
            _customerBusiness.Delete(model);
            return model;
        }

        [Route("getall-item")]
        [HttpGet]
        public IEnumerable<DanhMucModel> GetAllItem()
        {

            return _customerBusiness.GetAll();
        }



    }
}
