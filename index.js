addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})
/*
 * @param {Request} request
 */
async function handleRequest(request) {
  return new Response('Mannamótum Fallsforritunarfélags Reykjavíkur hefur verið aflýst. Þráðurinn verður tekinn upp í sumar. \r\n\r\n--Bjartur Thorlacius', {
    headers: {
    'Content-Type': 'text/plain; charset=UTF-8',
    'Content-Language': 'is'
    },
  })
}