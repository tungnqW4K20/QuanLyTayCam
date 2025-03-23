using BUS.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private ISanPhamBusiness _customerBusiness;
        public SanPhamController(ISanPhamBusiness customerBusiness)
        {
            _customerBusiness = customerBusiness;
        }

        [Authorize]
        [Route("create-item")]
        [HttpPost]
        public SanPhamModel CreateItem([FromBody] SanPhamModel model)
        {
            _customerBusiness.Create(model);
            return model;
        }

        [Authorize]
        [Route("update-item")]
        [HttpPut]
        public SanPhamModel UpdateItem([FromBody] SanPhamModel model)
        {
            _customerBusiness.Update(model);
            return model;
        }

        [Authorize]
        [Route("delete-item")]
        [HttpDelete]
        public IActionResult DeleteItem([FromBody] string id)
        {
            if(_customerBusiness.Delete(id))
            {
                return Ok();
            }
            else
            {

                return BadRequest();
            }
          
        }


        [Route("getall-item")]
        [HttpGet]
        public IEnumerable<SanPhamModel> GetAllItem()
        {

            return _customerBusiness.GetAll();
        }

        [Route("getall-itemadmin")]
        [HttpGet]
        public IEnumerable<SanPhamADMINModel> GetAllItemADMIN()
        {

            return _customerBusiness.GetAllADMIN();
        }


        [Route("getall-itemadminhethang")]
        [HttpGet]
        public IEnumerable<SanPhamADMINModel> GetAllItemADMINHetHang()
        {

            return _customerBusiness.GetAllADMINHetHang();
        }



        [Route("getalltop-item")]
		[HttpGet]
		public IEnumerable<SanPhamModel> GetAlltopItem()
		{

			return _customerBusiness.GetAllTop();
		}

		[Route("getall-itembyid")]
        [HttpGet]
        public IEnumerable<SanPhamModel> GetAllItembyID(int id)
        {

            return _customerBusiness.GetAllByID(id);
        }

        [Route("getall-itembyidDM")]
        [HttpGet]
        public IEnumerable<SanPhamModel> GetAllItembyIDDM(int id)
        {

            return _customerBusiness.GetAllByIDDM(id);
        }

        [Route("getall-itembyidTenSP")]
        [HttpGet]
        public IEnumerable<SanPhamModel> GetAllByTenM(string id)
        {

            return _customerBusiness.GetAllByTenM(id);
        }
    }
}
