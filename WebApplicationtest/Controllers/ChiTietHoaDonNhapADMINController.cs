using BUS.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ChiTietHoaDonNhapADMINController : ControllerBase
    {

        private IChiTietHDNhapBusiness _customerBusiness;
        public ChiTietHoaDonNhapADMINController(IChiTietHDNhapBusiness customerBusiness)
        {
            _customerBusiness = customerBusiness;
        }
        [Authorize]
        [Route("create-item")]
        [HttpPost]
        public HoaDonNhapADMINModel CreateItem([FromBody] HoaDonNhapADMINModel model)
        {
            _customerBusiness.Create(model);
            return model;
        }



        [Authorize]
        [Route("update-item")]
        [HttpPut]
        public HoaDonNhapADMINModel UpdateItem([FromBody] HoaDonNhapADMINModel model)
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
        public IEnumerable<HoaDonNhapADModel> GetAllItem()
        {

            return _customerBusiness.GetAll();
        }

        [Route("getall-itemdt")]
        [HttpGet]
        public IEnumerable<ThongKeDoanhThu> GetAllItemDT()
        {

            return _customerBusiness.GetAllDT();
        }


        [Route("getall-itembyid")]
        [HttpGet]
        public IEnumerable<HoaDonNhapADMINModel> GetAllItembyID(int id)
        {

            return _customerBusiness.GetAllByID(id);
        }

    }
}
