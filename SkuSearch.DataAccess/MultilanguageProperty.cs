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
    
    public partial class MultilanguageProperty
    {
        public MultilanguageProperty()
        {
            this.AdditionalProperty = new HashSet<AdditionalProperty>();
        }
    
        public int MultilanguagePropertyID { get; set; }
        public string WorldLanguageRef { get; set; }
        public int ProductRef { get; set; }
        public string MultilanguagePropertyProductName { get; set; }
        public string MultilanguagePropertyProductDescription { get; set; }
        public string MultilanguagePropertyProductURL { get; set; }
    
        public virtual ICollection<AdditionalProperty> AdditionalProperty { get; set; }
        public virtual WorldLanguage WorldLanguage { get; set; }
    }
}
