using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SqlDb.Model;

namespace BookStore.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        private readonly PracticeDbContext _context;

        public BooksController(PracticeDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetBooks()
        {
            var books = await _context.Books
                .Include(b => b.Author)
                .ToListAsync();
            return Ok(books);
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> GetBooksById(int id)
        {
            var book = await _context.Books
                .Include(b => b.Author).FirstOrDefaultAsync();

            return Ok(book);
        }

        [HttpPost]
        public async Task<IActionResult> AddBook(Book book)
        {
            _context.Books.Add(book);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetBooks), new { id = book.BookId }, book);
        }
    }
}
