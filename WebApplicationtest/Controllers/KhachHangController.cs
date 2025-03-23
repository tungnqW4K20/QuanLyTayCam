using BUS.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class KhachHangController : ControllerBase
	{
		private IKhachHangBusiness _customerBusiness;
		public KhachHangController(IKhachHangBusiness customerBusiness)
		{
			_customerBusiness = customerBusiness;
		}

		[Route("create-item")]
		[HttpPost]
		public KhachHangModel CreateItem([FromBody] KhachHangModel model)
		{
			_customerBusiness.Create(model);
			return model;
		}


		[Route("update-item")]
		[HttpPut]
		public KhachHangModel UpdateItem([FromBody] KhachHangModel model)
		{
			_customerBusiness.Update(model);
			return model;
		}
        [Route("update-itemtheouser")]
        [HttpPut]
        public KhachHangModel2 UpdateItemtheouser([FromBody] KhachHangModel2 model)
        {
            _customerBusiness.Updatetheouser(model);
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

       // [Authorize]
        [Route("getall-item")]
		[HttpGet]
		public IEnumerable<KhachHangModel> GetAllItem()
		{

			return _customerBusiness.GetAll();
		}

		

		[Route("getall-itembyid")]
		[HttpGet]
		public IEnumerable<KhachHangModel> GetAllItembyID(int id)
		{

			return _customerBusiness.GetAllByID(id);
		}

		[Route("getall-itembyiduser")]
		[HttpGet]
		public IEnumerable<KhachHangModel> GetAllByIDtheoUser(string id)
		{

			return _customerBusiness.GetAllByIDtheoUser(id);
		}



	}
}
