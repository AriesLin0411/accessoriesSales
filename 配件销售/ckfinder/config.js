/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckfinder.com/license
*/

CKFinder.customConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.skin = 'v1';
    // config.language = 'fr';
    config.filebrowserBrowseUrl = '/配件销售/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/配件销售/ckfinder/ckfinder.html?Type=Images';
    config.filebrowserFlashBrowseUrl = '/配件销售/ckfinder/ckfinder.html?Type=Flash';
    config.filebrowserUploadUrl = '/配件销售/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/配件销售/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images';
    config.filebrowserFlashUploadUrl = '/配件销售/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';
    config.filebrowserWindowWidth = '800';
    config.filebrowserWindowHeight = '500';  
};
