docker run ^
  -it ^
  --rm ^
  -v C:/docker/licenses/oe-11.7:/app/license ^
  -p 10000:10000 ^
  pas-httpbin
