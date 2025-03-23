
using API;
using BLL;
using BUS;
using BUS.Interfaces;
using DAL;
using DAL.Helper;
using DAL.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddTransient<IDatabaseHelper, DatabaseHelper>();
builder.Services.AddTransient<IDanhMucRepository, DanhMucRepository>();
builder.Services.AddTransient<IDanhMucBusiness, DanhMucBusiness>();

builder.Services.AddTransient<ISanPhamRepository, SanPhamRepository>();
builder.Services.AddTransient<ISanPhamBusiness, SanPhamBusiness>();

builder.Services.AddTransient<IChiTietSanPhamRepository, ChiTietSanPhamRepository>();
builder.Services.AddTransient<IChiTietSanPhamBusiness, ChiTietSanPhamBusiness>();

builder.Services.AddTransient<IKhachHangReponsitory, KhachHangReponsitory>();
builder.Services.AddTransient<IKhachHangBusiness, KhachHangBusiness>();


builder.Services.AddTransient<ISoLuongRepository, SoLuongReposity>();
builder.Services.AddTransient<ISoLuongBusiness, SoLuongBusiness>();

builder.Services.AddTransient<IGiaNhapReponsitory, GiaNhapReponsitory>();
builder.Services.AddTransient<IGiaNhapBusiness, GiaNhapBusiness>();


builder.Services.AddTransient<IDNPhanHoi, DNPH>();
builder.Services.AddTransient<IDNBusiness, DNBusiness>();

builder.Services.AddTransient<ILoginRepository, LoginReponsitory>();
builder.Services.AddTransient<ILoginBusiness, LoginBusiness>();


builder.Services.AddTransient<IGioHangRepository, GioHangRepository>();
builder.Services.AddTransient<IGioHangBusiness, GioHangBusiness>();


builder.Services.AddTransient<IHoaDonBanReponsitory, HoaDonBanReponsitory>();
builder.Services.AddTransient<IHoaDonBanBusiness, HoaDonBanBusiness>();


builder.Services.AddTransient<IChiTietHoaDonBanReponsitory, ChiTietHoaDonBanReponsitory>();
builder.Services.AddTransient<IChiTietHoaDonBanBusiness, ChiTietHoaDonBanBusiness>();

builder.Services.AddTransient<INhaCungCapReponsitory, NhaCungCapReponsitory>();
builder.Services.AddTransient<INhaCungCapBusiness, NhaCungCapBusiness>();


builder.Services.AddTransient<IGiaNhapReponsitory, GiaNhapReponsitory>();
builder.Services.AddTransient<IGiaNhapBusiness, GiaNhapBusiness>();


builder.Services.AddTransient<IChiTietHoaDonNhapADMINReponsitory, ChiTietHoaDonNhapADMINReponsitory>();
builder.Services.AddTransient<IChiTietHDNhapBusiness, ChiTietHDNhapBusiness>();

builder.Services.AddTransient<IUserRepository, UserRepository>();
builder.Services.AddTransient<IUserBusiness, UserBusiness>();

builder.Services.AddCors(p => p.AddPolicy("myCors", build => {
    build.WithOrigins("*").AllowAnyMethod().AllowAnyHeader();

}));


// configure strongly typed settings objects
IConfiguration configuration = builder.Configuration;
var appSettingsSection = configuration.GetSection("AppSettings");
builder.Services.Configure<AppSettings>(appSettingsSection);

// configure jwt authentication
var appSettings = appSettingsSection.Get<AppSettings>();
var key = Encoding.ASCII.GetBytes(appSettings.Secret);
builder.Services.AddAuthentication(x =>
{
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(x =>
{
    x.RequireHttpsMetadata = false;
    x.SaveToken = true;
    x.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(key),
        ValidateIssuer = false,
        ValidateAudience = false
    };
});



var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
	app.UseApiMiddleware();
	app.UseSwagger();
    app.UseSwaggerUI();
}

//app.UseMiddleware<ApiMiddleware>();
app.UseCors("myCors");

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();



