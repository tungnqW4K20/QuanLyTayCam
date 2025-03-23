using BUS.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class HoaDonBanController : ControllerBase
	{
		private IHoaDonBanBusiness _customerBusiness;
		public HoaDonBanController(IHoaDonBanBusiness customerBusiness)
		{
			_customerBusiness = customerBusiness;
		}


		[Route("create-item")]
		[HttpPost]
		public HoaDonBanModel CreateItem([FromBody] HoaDonBanModel model)
		{
			_customerBusiness.Create(model);
			return model;
		}

        [Authorize]
        [Route("update-item")]
		[HttpPut]
		public HoaDonBanModel UpdateItem([FromBody] HoaDonBanModel model)
		{
			_customerBusiness.Update(model);
			return model;
		}

        [Authorize]
        [Route("delete-item")]
		[HttpDelete]
		public IActionResult DeleteItem([FromBody] string id)
		{
			_customerBusiness.Delete(id);
			return Ok();
		}


		[Route("getall-item")]
		[HttpGet]
		public IEnumerable<HoaDonBanModel> GetAllItem()
		{

			return _customerBusiness.GetAll();
		}

        [Route("getall-itemTT")]
        [HttpGet]
        public IEnumerable<HoaDonBanTTModel> GetAllItemTT()
        {

            return _customerBusiness.GetAllTT();
        }


        [Route("gettopmax")]
		[HttpGet]
		public IEnumerable<HoaDonKhachHangModel> GetAllHDMax()
		{

			return _customerBusiness.GetAllHDMax();
		}


		[Route("getall-itembyid")]
		[HttpGet]
		public IEnumerable<HoaDonBanModel> GetAllItembyID(int id)
		{

			return _customerBusiness.GetAllByID(id);
		}

        [Route("getall-itembyidtheouser")]
        [HttpGet]
        public IEnumerable<HoaDonDatHangModel> GetAllItembyIDtheouser(string id)
        {

            return _customerBusiness.GetAllByIDtheouser(id);
        }





    }
}
