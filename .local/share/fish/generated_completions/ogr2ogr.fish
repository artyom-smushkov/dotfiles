# ogr2ogr
# Autogenerated from man page /usr/share/man/man1/ogr2ogr.1.gz
complete -c ogr2ogr -s f -d 'Output file format name, e. g.  ESRI Shapefile, MapInfo File, PostgreSQL'
complete -c ogr2ogr -o append -d 'Append to existing layer instead of creating new . UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o upsert -d 'New in version 3. 6'
complete -c ogr2ogr -o overwrite -d 'Delete the output layer and recreate it empty . UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o update -d 'Open existing output datasource in update mode rather than trying to create a…'
complete -c ogr2ogr -o select -d 'Comma-delimited list of fields from input layer to copy to the new layer'
complete -c ogr2ogr -o progress -d 'Display progress on terminal'
complete -c ogr2ogr -o sql -d 'SQL statement to execute'
complete -c ogr2ogr -o dialect -d 'SQL dialect'
complete -c ogr2ogr -o where -d 'Attribute query (like SQL WHERE).  Starting with GDAL 2'
complete -c ogr2ogr -o skipfailures -d 'Continue after a failure, skipping the failed feature. UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o spat -d 'spatial query extents, in the SRS of the source layer(s) (or the one specifie…'
complete -c ogr2ogr -o spat_srs -d 'Override spatial filter SRS. UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o geomfield -d 'Name of the geometry field on which the spatial filter operates on'
complete -c ogr2ogr -o dsco -d 'Dataset creation option (format specific) . UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o lco -d 'Layer creation option (format specific) . UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o nln -d 'Assign an alternate name to the new layer . UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o nlt -d 'Define the geometry type for the created layer'
complete -c ogr2ogr -o dim -d 'Force the coordinate dimension to val (valid values are XY, XYZ, XYM, and XYZ…'
complete -c ogr2ogr -o a_srs -d 'Assign an output SRS, but without reprojecting (use \\%-t_srs to reproject) '
complete -c ogr2ogr -o a_coord_epoch -d 'New in version 3. 4. sp Assign a coordinate epoch, linked with the output SRS'
complete -c ogr2ogr -o t_srs -d 'Reproject/transform to this SRS on output, and assign it as output SRS'
complete -c ogr2ogr -o t_coord_epoch -d 'New in version 3. 4. sp Assign a coordinate epoch, linked with the output SRS'
complete -c ogr2ogr -o s_srs -d 'Override source SRS'
complete -c ogr2ogr -o s_coord_epoch -d 'New in version 3. 4. sp Assign a coordinate epoch, linked with the source SRS'
complete -c ogr2ogr -o ct -d 'A PROJ string (single step operation or multiple step string starting with +p…'
complete -c ogr2ogr -o preserve_fid -d 'Use the FID of the source features instead of letting the output driver autom…'
complete -c ogr2ogr -o fid -d 'If provided, only the feature with the specified feature id will be processed'
complete -c ogr2ogr -o limit -d 'Limit the number of features per layer. UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o oo -d 'Input dataset open option (format specific). UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o doo -d 'Destination dataset open option (format specific), only valid in -update mode'
complete -c ogr2ogr -o gt -d 'Group n features per transaction (default 100 000)'
complete -c ogr2ogr -o ds_transaction -d 'Force the use of a dataset level transaction (for drivers that support such m…'
complete -c ogr2ogr -o clipsrc -d 'Clip geometries to the specified bounding box (expressed in source SRS), WKT …'
complete -c ogr2ogr -o clipsrcsql -d 'Select desired geometries using an SQL query instead. UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o clipsrclayer -d 'Select the named layer from the source clip datasource. UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o clipsrcwhere -d 'Restrict desired geometries based on attribute query. UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o clipdst -d 'Clip geometries after reprojection to the specified bounding box (expressed i…'
complete -c ogr2ogr -o clipdstsql -d 'Select desired geometries using an SQL query instead. UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o clipdstlayer -d 'Select the named layer from the destination clip datasource. UNINDENT NDENT 0'
complete -c ogr2ogr -o clipdstwhere -d 'Restrict desired geometries based on attribute query. UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o wrapdateline -d 'Split geometries crossing the dateline meridian (long.  = +/- 180deg) '
complete -c ogr2ogr -o datelineoffset -d 'Offset from dateline in degrees (default long'
complete -c ogr2ogr -o simplify -d 'Distance tolerance for simplification'
complete -c ogr2ogr -o segmentize -d 'Maximum distance between 2 nodes.  Used to create intermediate points'
complete -c ogr2ogr -o makevalid -d 'Run the \\%OGRGeometry::MakeValid() operation, followed by \\%OGRGeometryFactor…'
complete -c ogr2ogr -o fieldTypeToString -d 'Converts any field of the specified type to a field of type string in the des…'
complete -c ogr2ogr -o mapFieldType -d 'Converts any field of the specified type to another type'
complete -c ogr2ogr -o unsetFieldWidth -d 'Set field width and precision to 0. UNINDENT NDENT 0. 0'
complete -c ogr2ogr -o splitlistfields -d 'Split fields of type StringList, RealList or IntegerList into as many fields …'
complete -c ogr2ogr -o maxsubfields -d 'To be combined with -splitlistfields to limit the number of subfields created…'
complete -c ogr2ogr -o explodecollections -d 'Produce one feature for each geometry in any kind of geometry collection in t…'
complete -c ogr2ogr -o zfield -d 'Uses the specified field to fill the Z coordinate of geometries'
complete -c ogr2ogr -o gcp -d 'Add the indicated ground control point'
complete -c ogr2ogr -o order -d 'Order of polynomial used for warping (1 to 3)'
complete -c ogr2ogr -o tps -d 'Force use of thin plate spline transformer based on available GCPs'
complete -c ogr2ogr -o fieldmap -d 'Specifies the list of field indexes to be copied from the source to the desti…'
complete -c ogr2ogr -o addfields -d 'This is a specialized version of -append'
complete -c ogr2ogr -o relaxedFieldNameMatch -d 'Do field name matching between source and existing target layer in a more rel…'
complete -c ogr2ogr -o forceNullable -d 'Do not propagate not-nullable constraints to target layer if they exist in so…'
complete -c ogr2ogr -o unsetDefault -d 'Do not propagate default field values to target layer if they exist in source…'
complete -c ogr2ogr -o unsetFid -d 'Can be specified to prevent the name of the source FID column and source feat…'
complete -c ogr2ogr -o emptyStrAsNull -d 'New in version 3. 3. sp Treat empty string values as null. UNINDENT NDENT 0'
complete -c ogr2ogr -o resolveDomains -d 'New in version 3. 3'
complete -c ogr2ogr -o nomd -d 'To disable copying of metadata from source dataset and layers into target dat…'
complete -c ogr2ogr -o mo -d 'Passes a metadata key and value to set on the output dataset, when supported …'
complete -c ogr2ogr -o noNativeData -d 'To disable copying of native data, i. e'

