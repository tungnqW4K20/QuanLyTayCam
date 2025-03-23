using BUS.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class GiaNhapController : ControllerBase
	{
		private IGiaNhapBusiness _customerBusiness;
		public GiaNhapController(IGiaNhapBusiness customerBusiness)
		{
			_customerBusiness = customerBusiness;
		}

		[Route("create-item")]
		[HttpPost]
		public GiaNhapModel CreateItem([FromBody] GiaNhapModel model)
		{
			_customerBusiness.Create(model);
			return model;
		}


		[Route("update-item")]
		[HttpPut]
		public GiaNhapModel UpdateItem([FromBody] GiaNhapModel model)
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
		public IEnumerable<GiaNhapModel> GetAllItem()
		{

			return _customerBusiness.GetAll();
		}

		[Route("getalltop-item")]
		

		[Route("getall-itembyid")]
		[HttpGet]
		public IEnumerable<GiaNhapModel> GetAllItembyID(int id)
		{

			return _customerBusiness.GetAllByID(id);
		}


	}
}
