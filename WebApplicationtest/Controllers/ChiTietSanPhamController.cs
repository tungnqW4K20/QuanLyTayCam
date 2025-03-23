using BUS.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ChiTietSanPhamController : ControllerBase
	{
		private IChiTietSanPhamBusiness _customerBusiness;
		public ChiTietSanPhamController(IChiTietSanPhamBusiness customerBusiness)
		{
			_customerBusiness = customerBusiness;
		}

		[Route("create-item")]
		[HttpPost]
		public ChiTietSanPhamModel CreateItem([FromBody] ChiTietSanPhamModel model)
		{
			_customerBusiness.Create(model);
			return model;
		}


		[Route("update-item")]
		[HttpPut]
		public ChiTietSanPhamModel UpdateItem([FromBody] ChiTietSanPhamModel model)
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


		
		

		[Route("getall-itembyid")]
		[HttpGet]
		public IEnumerable<ChiTietSanPhamModel1> GetAllItembyID(int id)
		{

			return _customerBusiness.GetAllByID(id);
		}


	}
}
