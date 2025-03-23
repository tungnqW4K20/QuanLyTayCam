using BUS.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class GioHangController : ControllerBase
	{
		private IGioHangBusiness _customerBusiness;
		public GioHangController(IGioHangBusiness customerBusiness)
		{
			_customerBusiness = customerBusiness;
		}

		//[Route("create-item")]
		//[HttpPost]
		//public GioHangModel CreateItem([FromBody] GioHangModel model)
		//{
		//	_customerBusiness.Create(model);
		//	return model;
		//}


		[Route("update-item")]
		[HttpPut]
		public GioHangModel UpdateItem([FromBody] GioHangModel model)
		{
			_customerBusiness.Update(model);
			return model;
		}


		[Route("delete-item")]
		[HttpDelete]
		public IActionResult DeleteItem(string id, string UserID)
		{
			_customerBusiness.Delete(id,UserID);
			return Ok();
		}


		[Route("getall-item")]
		[HttpGet]
		public IEnumerable<GioHangModel> GetAllItem()
		{

			return _customerBusiness.GetAll();
		}

		[Route("getalltop-item")]
		[HttpGet]
		public IEnumerable<GioHangModel> GetAlltopItem()
		{

			return _customerBusiness.GetAllTop();
		}

		[Route("getall-itembyid")]
		[HttpGet]
		public IEnumerable<GioHangKH1> GetAllItembyID(string id)
		{

			return _customerBusiness.GetAllByID(id);
		}

		[Route("getall-itembyidTangGH")]
		[HttpGet]
		public IEnumerable<GioHangKH1> GetAllItembyIDTangGH(string id,string UserID)
		{

			return _customerBusiness.TangGH(id, UserID);
		}

		[Route("getall-itembyidGiamGH")]
		[HttpGet]
		public IEnumerable<GioHangKH1> GetAllItembyIDGiamGH(string id, string UserID)
		{

			return _customerBusiness.GiamGH(id, UserID);
		}

		[Route("getall-itembyidThemGH")]
		[HttpGet]
		public IEnumerable<GioHangKH1> GetAllItembyIDThemGH(string id, string UserID)
		{
			return _customerBusiness.ThemGH(id, UserID);
		}

	}
}
