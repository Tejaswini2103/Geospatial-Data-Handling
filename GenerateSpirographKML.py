import math

R, r, a = 8.0, 1.0, 4.0
t, pi, n_rev = 0.0, math.pi, 16.0
x, y = R+r-1, 0.0
tommy_trojan_long, tommy_trojan_lat = -118.28545753109441, 34.02072640503276


print("<kml xmlns=\"http://www.opengis.net/kml/2.2\">\n<Document>\n<name>Coordinates</name>\n<visibility>1</visibility>\n<open>1</open>\n<Style id=\"yellowLineGreenPoly\">\n<LineStyle>\n<color>7f00ffff</color>\n<width>4</width>\n</LineStyle>\n<PolyStyle>\n<color>7f00ff00</color>\n</PolyStyle>\n</Style>\n")
print("<Folder>\n<name>Placemarks</name>\n<Placemark>\n<name>Tommy Trojan</name>\n<description>Tommy Trojan</description>\n<Point>\n<coordinates>\n-118.28545753109441, 34.02072640503276\n</coordinates>\n</Point>\n</Placemark>\n</Folder>\n")
print("<Folder>\n<name>Polygons</name>\n<Placemark>\n<name>convex_hull</name>\n<visibility>1</visibility>\n<styleUrl>#yellowLineGreenPoly</styleUrl>\n<Polygon>\n<extrude>0</extrude>\n<altitudeMode>relativeToGround</altitudeMode>\n<outerBoundaryIs>\n<LinearRing>\n<coordinates>")

while t < pi * n_rev:
	x = tommy_trojan_long + (R+r) * math.cos((r / R) * t) - a * math.cos((1 + r / R) * t)
	y = tommy_trojan_lat + (R+r) * math.sin((r / R) * t) - a * math.sin(((1 + r / R) * t))
	

	coordinates = "{:.14f},{:.14f}".format(x, y)
	print(coordinates)
	t += 0.01

print("</coordinates>\n</LinearRing>\n</outerBoundaryIs>\n</Polygon>\n</Placemark>\n</Folder>\n</Document>\n</kml>")