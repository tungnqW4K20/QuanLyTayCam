using BUS.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace WebApplicationtest.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class LoginController : ControllerBase
	{
		private ILoginBusiness _loginBusiness;
		public LoginController(ILoginBusiness loginBusiness)
		{
			_loginBusiness = loginBusiness;
		}


		[Route("login-KH")]
		[HttpPost]
		public IActionResult loginKH([FromBody] LoginModel model)
		{
			  if(_loginBusiness.Loginstring(model))
			{
                return Ok();

			}
			else
			{
				return NotFound();

			}
			
		}


	}
}
