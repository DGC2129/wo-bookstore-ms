using System;
using System.Collections.Generic;

namespace SqlDb.Model;

public partial class UserBook
{
    public int UserBookId { get; set; }

    public int UserId { get; set; }

    public int BookId { get; set; }

    public DateOnly? BorrowedDate { get; set; }

    public DateOnly? ReturnDate { get; set; }

    public virtual Book Book { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
