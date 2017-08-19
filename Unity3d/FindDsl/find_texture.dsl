input("*.tga","*.png","*.jpg")
{
	int("maxSize",256){
		range(1,1024);
	};
	string("prop",""){
		multiple(["readable","lightmap","mipmap"],[1,2,3]);
	};
	string("filter", "");
}
filter
{
	var(0) = loadasset(assetpath);
	if(isnull(var(0))){
		0;
	} else {;
		var(1) = var(0).width;
		var(2) = var(0).height;
		var(3) = importer.isReadable;
		var(4) = importer.lightmap;
		var(5) = importer.mipmapEnabled;
		unloadasset(var(0));
		order = var(1) < var(2) ? var(2) : var(1);
		if((var(1) > maxSize || var(2) > maxSize) && assetpath.Contains(filter) && (prop.Contains("1") && var(3) || !prop.Contains("1")) && (prop.Contains("2") && var(4) || !prop.Contains("2")) && (prop.Contains("3") && var(5) || !prop.Contains("3"))){
			info = format("size:{0},{1} readable:{2} lightmap:{3} mipmap:{4}", var(1), var(2), var(3), var(4), var(5));
			1;
		} else {
			0;
		};
	};
};