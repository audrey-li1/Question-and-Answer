using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

/// <summary>
/// Summary description for IPLocationItem
/// </summary>
public class IPLocationItem
{
	public IPLocationItem()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public long Start { get; set; }
    public long End { get; set; }
    public String City { get; set; }

    public static long IP4ToLong(string ip)
    {
        return (long)(uint)IPAddress.NetworkToHostOrder(
             (int)IPAddress.Parse(ip).Address);

    }
    public static string Long2IP4(long longIP)
    {
        //return new IPAddress(longIP).ToString();
        return IPAddress.Parse(longIP.ToString()).ToString();
    }
}