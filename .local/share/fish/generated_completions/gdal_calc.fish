# gdal_calc
# Autogenerated from man page /usr/share/man/man1/gdal_calc.1.gz
complete -c gdal_calc -l help -d 'Show this help message and exit'
complete -c gdal_calc -s h -d 'The same as %--help'
complete -c gdal_calc -l calc -d 'Calculation in numpy syntax using +, -, /, *, or any numpy array functions (i'
complete -c gdal_calc -s A -d 'Input gdal raster file, you can use any letter (a-z, A-Z)'
complete -c gdal_calc -l A_band -d 'Number of raster band for file A (default 1)'
complete -c gdal_calc -l outfile -d 'Output file to generate or fill'
complete -c gdal_calc -l NoDataValue -d 'Output NoDataValue (default datatype specific value)'
complete -c gdal_calc -l hideNoData -d 'New in version 3. 3.  Ignores the input bands NoDataValue'
complete -c gdal_calc -l type -d 'Output datatype, must be one of [Byte, UInt16, Int16, UInt32, Int32, UInt64, …'
complete -c gdal_calc -l format -d 'GDAL format for output file'
complete -c gdal_calc -l color-table -d 'Allows specifying a filename of a color table (or a ColorTable object) (with …'
complete -c gdal_calc -l extent -d 'New in version 3. 3'
complete -c gdal_calc -l projwin -d 'New in version 3. 3'
complete -c gdal_calc -l projectionCheck -d 'New in version 3. 3.  By default, no projection checking will be performed'
complete -c gdal_calc -l creation-option -d 'Passes a creation option to the output format driver'
complete -c gdal_calc -l co -d 'The same as %creation-option'
complete -c gdal_calc -l allBands -d 'Process all bands of given raster (a-z, A-Z)'
complete -c gdal_calc -l overwrite -d 'Overwrite output file if it already exists'
complete -c gdal_calc -l debug -d 'Print debugging information'
complete -c gdal_calc -l quiet -d 'Suppress progress messages'
