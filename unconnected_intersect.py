from osgeo import ogr
ogr.UseExceptions()
ogr_shape_directory = ogr.Open('data', True)

SQL = """\
    SELECT ST_Intersection(A.geometry, B.geometry) AS geometry,(CAST(A.highwaykey AS INT)*CAST(A.distance AS INT))AS weight, A.problem_id, A.way_id, A.node_id, A.highwaykey, A.distance, B.iso_a2 FROM unconnected_major A, ne_110m_admin_0_countries B WHERE ST_Intersects(A.geometry, B.geometry);
"""
results = ogr_shape_directory.ExecuteSQL(SQL, dialect='SQLITE')

# copy result back to datasource as a new shapefile
output = ogr_shape_directory.CopyLayer(results, 'output')
# save, close
results = output = ogr_shape_directory = None