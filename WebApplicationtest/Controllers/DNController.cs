using BUS.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class DNController : ControllerBase
	{
		private IDNBusiness _customerBusiness;
		public DNController(IDNBusiness customerBusiness)
		{
			_customerBusiness = customerBusiness;
		}

		[Route("create-item")]
		[HttpPost]
		public DangNhapModel CreateItem([FromBody] DangNhapModel model)
		{
			_customerBusiness.Create(model);
			return model;
		}


		[Route("update-item")]
		[HttpPut]
		public DangNhapModel UpdateItem([FromBody] DangNhapModel model)
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
		public IEnumerable<DangNhapModel> GetAllItem()
		{

			return _customerBusiness.GetAll();
		}

		[Route("getalltop-item")]
		[HttpGet]
		public IEnumerable<DangNhapModel> GetAlltopItem()
		{

			return _customerBusiness.GetAllTop();
		}

		[Route("getall-itembyid")]
		[HttpGet]
		public IEnumerable<DangNhapModel> GetAllItembyID(int id)
		{

			return _customerBusiness.GetAllByID(id);
		}








	}
}
