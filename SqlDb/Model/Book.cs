using System;
using System.Collections.Generic;

namespace SqlDb.Model;

public partial class Book
{
    public int BookId { get; set; }

    public string Title { get; set; } = null!;

    public string? Genre { get; set; }

    public DateOnly? PublishedDate { get; set; }

    public int AuthorId { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual Author Author { get; set; } = null!;

    public virtual ICollection<UserBook> UserBooks { get; set; } = new List<UserBook>();
}
