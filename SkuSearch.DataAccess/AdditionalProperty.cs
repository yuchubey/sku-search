//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SkuSearch.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class AdditionalProperty
    {
        public int AdditionalPropertyID { get; set; }
        public int MultilanguagePropertyRef { get; set; }
        public string AdditionalPropertyName { get; set; }
        public string AdditionalPropertyValue { get; set; }
        public bool AdditionalPropertyImportance { get; set; }
    
        public virtual MultilanguageProperty MultilanguageProperty { get; set; }
    }
}
