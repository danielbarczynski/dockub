using Microsoft.EntityFrameworkCore;

public class Db : DbContext
{
    public Db(DbContextOptions<Db> options) : base(options) {}
    public DbSet<PersonModel>? Persons { get; set; }
}