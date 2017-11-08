using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BlogHelper
/// </summary>
public class BlogHelper
{
    private static string openSlug = "<slug>";
    private static string closeSlug = "</slug>";
    public static int blogsCountToDisplay = 3;
    public static string blogsUrlTempalte;
    public string blogsRoot;
	public BlogHelper()
	{
		//
		// TODO: Add constructor logic here
		//

        blogsRoot = ConfigurationManager.AppSettings["blogsRoot"];
        blogsUrlTempalte = ConfigurationManager.AppSettings["blogsUrlTempalte"];
        string blogsCountToDisplayStr = ConfigurationManager.AppSettings["blogsCountToDisplay"];
        if(!Int32.TryParse(blogsCountToDisplayStr, out blogsCountToDisplay))
        {
            blogsCountToDisplay = 5;
        }

	}

    public static string FormatBlogUrl(string slug)
    {
        return string.Format(blogsUrlTempalte, slug);
    }
    private bool FileContainTag(FileInfo fileInfo, string tag, out string slug)
    {
        slug = null;
        bool found = false;
        string content = fileInfo.OpenText().ReadToEnd();
        if (content == null)
        {
            return false;
        }
        if (content.IndexOf("<tag>" + tag + "</tag>") > -1)
        {
            found = true;
        }

        int start = content.IndexOf(openSlug) + openSlug.Length;
        int end = content.IndexOf(closeSlug);

        slug = content.Substring(start, end - start);
        return found;
    }
    private string FindSlug(FileInfo fileInfo)
    {
         
      
        string content = fileInfo.OpenText().ReadToEnd();
        if (content == null)
        {
            return null;
        }
         
        int start = content.IndexOf(openSlug) + openSlug.Length;
        int end = content.IndexOf(closeSlug);

        return   content.Substring(start, end - start);
    
    }
    public List<string> GetBlogUrls( )
    {
        List<string> returnFiles = new List<string>();
        DirectoryInfo di = new DirectoryInfo(blogsRoot);
       var files = di.GetFiles("*.xml").OrderByDescending(f => f.CreationTime).ToList();
        foreach (FileInfo fileInfo in files)
        {


            string slug = FindSlug(fileInfo);
             returnFiles.Add(slug);
            
            if (returnFiles.Count >= blogsCountToDisplay)
            {
                break;
            }
        }
        return returnFiles;
    }

}