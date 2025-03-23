using BUS.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ChiTietHoaDonBanController : ControllerBase
	{
		private IChiTietHoaDonBanBusiness _customerBusiness;
		public ChiTietHoaDonBanController(IChiTietHoaDonBanBusiness customerBusiness)
		{
			_customerBusiness = customerBusiness;
		}

		[Route("create-item")]
		[HttpPost]
		public ChiTietHoaDonBanModel CreateItem([FromBody] ChiTietHoaDonBanModel model)
		{
			_customerBusiness.Create(model);
			return model;
		}



		[Route("ThemHoaDon")]
		[HttpPost]
		public IActionResult ThemHoaDon([FromBody] List<ThongTinHoaDonMoDel> model)
		{
			if(_customerBusiness.ThemHoaDon(model))
			{
				return Ok();
			}	
			else
			{
				return NotFound();
			}	


		}

		[Route("update-item")]
		[HttpPut]
		public ChiTietHoaDonBanModel UpdateItem([FromBody] ChiTietHoaDonBanModel model)
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
		public IEnumerable<ChiTietHoaDonBanModel> GetAllItem()
		{

			return _customerBusiness.GetAll();
		}

		

		[Route("getall-itembyid")]
		[HttpGet]
		public IEnumerable<ChiTietHoaDonBanModel> GetAllItembyID(int id)
		{

			return _customerBusiness.GetAllByID(id);
		}


        [Route("getall-itembyidmahd")]
        [HttpGet]
        public IEnumerable<CHiTietHDBanKHModel> GetAllItembyIDtheoMaHD(int id)
        {

            return _customerBusiness.GetAllByIDtheoMaHD(id);
        }


    }
}
