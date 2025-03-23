using BUS.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class SoLuongController : ControllerBase
	{
		private ISoLuongBusiness _customerBusiness;
		public SoLuongController(ISoLuongBusiness customerBusiness)
		{
			_customerBusiness = customerBusiness;
		}

		[Route("create-item")]
		[HttpPost]
		public SoLuongModel CreateItem([FromBody] SoLuongModel model)
		{
			_customerBusiness.Create(model);
			return model;
		}


		[Route("update-item")]
		[HttpPut]
		public SoLuongModel UpdateItem([FromBody] SoLuongModel model)
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
		public IEnumerable<SoLuongModel> GetAllItem()
		{

			return _customerBusiness.GetAll();
		}

		[Route("getalltop-item")]
		[HttpGet]
		public IEnumerable<SoLuongModel> GetAlltopItem()
		{

			return _customerBusiness.GetAllTop();
		}

		[Route("getall-itembyid")]
		[HttpGet]
		public IEnumerable<SoLuongModel> GetAllItembyID(int id)
		{

			return _customerBusiness.GetAllByID(id);
		}
	}
}
