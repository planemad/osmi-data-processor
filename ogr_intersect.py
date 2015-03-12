from osgeo import ogr
ogr.UseExceptions()
ogr_shape_directory = ogr.Open('data', True)

SQL = """\
    SELECT ST_Intersection(A.geometry, B.geometry) AS geometry, A.*, B.iso_a2
    FROM unconnected_major A, countries.ne_110m_admin_0_countries B
    WHERE ST_Intersects(A.geometry, B.geometry);
"""
results = ogr_shape_directory.ExecuteSQL(SQL, dialect='SQLITE')

# copy result back to datasource as a new shapefile
layer2 = ogr_shape_directory.CopyLayer(results, 'output')
# save, close
layer = layer2 = ogr_shape_directory = None