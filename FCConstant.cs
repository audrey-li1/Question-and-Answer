using System;
using System.Collections.Generic;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for HaloConstant
/// </summary>
public class FCConstant
{
  
 	
    public const string Booking_Type_Quote = "Quote";
    public const string Booking_Type_Reserved = "Reserved";
    public const string Booking_Type_Confirmed = "Confirmed";
    public  const     string Booking_Type_Cancelled = "Cancelled";
    public const string Booking_Type_Complete = "Complete";
    public const string No_Record_Msg = "NO RESULT FOUND! Click plus icon to add new Record.";


    public  const     string Role_Admin = "admin";
    public  const     string Role_Partner = "partner";
    public  const     string Role_User = "user";
    public  const     string Role_Mentor = "mentor";


    public  const     string Discount_Code_Weekday = "WDD";
    public  const     string Discount_Code_Partner = "PD";
    public  const     string Discount_Code_Cash = "CD";
    public  const     string Discount_Code_Multi_Hours = "MHD";
    public const string Targeted_User = "Targeted_User";
    public const string Targeted_UserName = "Targeted_UserName";
    public const string User_Calender  = "User_Calender";

    public const string Survey_status_Unopen  = "Unopened";
    public const string Survey_status_Started  = "Started";
    public const string Survey_status_Completed  = "Completed";
    public const string Shared_Key  = "shared_key";

    public const int Width_10  =10;
    public const int Width_20  =20;
    public const int Width_200  =200;
    public const int Width_500  =500;
    public const int Width_1000  =1000;

     
}
public enum ImageType
{
    None,
    Random,
    Bar,
    Wedding,
    Concert,
    Game,
    Airport,
    Casino,
    Brithday,
    Anniversary,
    Quinceanera,
    Other,
    Eve,
}

public class DebugTextWriter : System.IO.TextWriter
{
    public override void Write(char[] buffer, int index, int count)
    {
        System.Diagnostics.Debug.Write(new String(buffer, index, count));
    }

    public override void Write(string value)
    {
        System.Diagnostics.Debug.Write(value);
    }

    public override Encoding Encoding
    {
        get { return System.Text.Encoding.Default; }
    }
}

partial class haloDataContext
{
    [Function(Name = "NEWID", IsComposable = true)]
    public Guid Random()
    { // to prove not used by our C# code... 
        throw new NotImplementedException();
    }
}

