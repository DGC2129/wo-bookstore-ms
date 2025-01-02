using System;
using System.Collections.Generic;

namespace SqlDb.Model;

public partial class User
{
    public int UserId { get; set; }

    public string Name { get; set; } = null!;

    public string Email { get; set; } = null!;

    public DateTime? CreatedAt { get; set; }

    public virtual ICollection<UserBook> UserBooks { get; set; } = new List<UserBook>();
}
