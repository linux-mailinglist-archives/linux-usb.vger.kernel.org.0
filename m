Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA401E8B9A
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 00:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgE2W5p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 18:57:45 -0400
Received: from foo.stuge.se ([212.116.89.98]:45898 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726898AbgE2W5p (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 May 2020 18:57:45 -0400
X-Greylist: delayed 724 seconds by postgrey-1.27 at vger.kernel.org; Fri, 29 May 2020 18:57:42 EDT
Received: (qmail 22262 invoked by uid 1000); 29 May 2020 22:45:31 -0000
Message-ID: <20200529224531.22261.qmail@stuge.se>
Date:   Fri, 29 May 2020 22:45:31 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, balbi@kernel.org,
        linux-usb@vger.kernel.org, sam@ravnborg.org
Subject: Re: [PATCH v3 4/6] drm: Add Generic USB Display driver
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-5-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200529175643.46094-5-noralf@tronnes.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Noralf,

Noralf Trønnes wrote:
> This adds a generic USB display driver with the intention that it can be
> used with future USB interfaced low end displays/adapters.

Fun!


> The Linux gadget device driver will serve as the canonical device
> implementation.

That's a great goal, but as proposed it isn't as generic as I would like.

Several Linux/DRM internals have "leaked" into the USB protocol - this
should be avoided if you want device implementations other than your
gadget, because those internals can change within Linux in the future,
while the protocol must not.


> If the device transfer buffer can't fit an uncompressed framebuffer
> update, the update is split up into parts that do fit.

Does "device transfer buffer" refer to something like display RAM on
the device side? If so, its size is a device implementation detail
which shouldn't be exposed over USB.

It's true that the host drives USB communication but the device decides
whether it will accept data or not. If not, it responds with a NAK
handshake in the OUT transaction, and the host controller will then
try to resend the data later, until the transfer timeout given by the
host software expires. Retries are invisible to host software.

The point is: USB has native flow control on the lowest level; that's
far more efficient than anything the application can construct, and
flow control in the application protocol would be redundant.

When using gadgetfs IIRC device controllers NAK as long as the
userspace process doesn't write new data to the ep?out-bulk fd.
Have you tried/seen this?


> The driver supports a one bit monochrome transfer format: R1. This is not
> implemented in the gadget driver. It is added in preparation for future
> monochrome e-ink displays.

The R1 idea is great!


> - Use donated Openmoko USB pid

If Linux will be the reference for this protocol then perhaps a PID
under the Linux Foundation VID (1d6b) makes more sense?

But: A PID applies on device level, not to interfaces.

Until this protocol becomes a USB-IF device class maybe it's better
to create a probe for GUD interface(s) rather than binding to PID?

Does the driver btw. already support a composite device with multiple GUD
interfaces? Say a microcontroller with two independent panels. It seems no?

If yes, would any of the control requests currently sent to the interface
be better directed at the device? If so, then a PID might make sense again,
but it's still not possible to create a composite device which uses this
protocol, without risking collissions with other vendor specific requests
on other (vendor specific) interfaces, that would be a real shame.

I can imagine a composite device wanting to implement HID and GUD,
let's make sure that it's possible.


On to the code.


> +static int gud_drm_usb_control_msg(struct usb_device *usb, u8 ifnum, bool in,
> +				   u8 request, u16 value, void *buf, size_t len,
> +				   bool check_len)
> +{
> +	u8 requesttype = USB_TYPE_VENDOR | USB_RECIP_INTERFACE;

This takes struct usb_device rather than struct usb_interface - again,
would this actually work with a composite device? The driver doesn't
ever claim the interface so I guess no?


> +static int gud_get_vendor_descriptor(struct usb_interface *interface,
> +				     struct gud_drm_display_descriptor *desc)
> +{
..
> +	ret = gud_drm_usb_control_msg(usb, ifnum, true, USB_REQ_GET_DESCRIPTOR,
> +				      GUD_DRM_USB_DT_DISPLAY << 8, buf, sizeof(*desc), false);

GUD_DRM_USB_DT_DISPLAY is defined as (USB_TYPE_VENDOR | 0x4),
but USB_TYPE_VENDOR only applies to bmRequestType[6:5] in control transfers,
nowhere else. I know of no standardized way to introduce vendor-specific
descriptors. Squatting is possible, but I think it would be nice to do
better here. It is easy enough.

It could be argued that the vendor specific interface gives flexibility here,
but actually it just means that the semantics of the standardized and
well-defined USB_REQ_GET_DESCRIPTOR have been duplicated by this protocol,
that is not very common - but if you want to go ahead then at least drop
USB_TYPE_VENDOR from the GUD_DRM_USB_DT_DISPLAY definition.

Maybe it's good to think about the data exchange some more - anything not
transfered by standardized USB_REQ_GET_DESCRIPTOR (bmRequestType 10000000B;
Device-to-host data, Standard type, Device recipient) isn't actually
a descriptor, it's vendor-specific, free-format data. Does that enable
any simplifications?


> +static int gud_usb_get_status(struct usb_device *usb, u8 ifnum)
> +{
> +	struct gud_drm_req_get_status *status;
> +	int ret, status_retries = 2000 / 5; /* maximum wait ~2 seconds */
> +	unsigned long delay = 500;
> +
> +	status = kmalloc(sizeof(*status), GFP_KERNEL);
> +	if (!status)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Poll due to lack of data/status stage control on the gadget side.

I hope we can find something better here.

Doesn't gadgetfs allow userspace to (indirectly) control the status stage,
as I wrote above?


> +	 * If we did not use polling and gave up here after waiting 2 seconds,
> +	 * the worker in the gadget would finally get to queuing up the status
> +	 * respons, but by that time the host has moved on. The gadget side
> +	 * (at least dwc2) would now be left in a non-recoverable state.

Independently of the above, how does the gadget become non-recoverable?

If a transfer times out on the host without other error then the device
has replied with NAK in the data stage transactions sent by the host
until the host stopped trying. The device controller then sees no
further data stage transactions and shouldn't be in a weird state?


> +	 * Worst case commit timeout in DRM can be tens of seconds (wait for
> +	 * various _done completions).
> +	 */
> +	while (status_retries--) {
> +		ret = gud_drm_usb_control_msg(usb, ifnum, true, USB_REQ_GET_STATUS, 0,
> +					      status, sizeof(*status), true);

Instead of this loop a single request with 2000 ms timeout would
avoid software overhead on the host. The header file says that
0 == PENDING is the only exit condition for the loop besides timeout,
as long as there are no other conditions it's better to just wait for
the timeout.


> +		if (!(status->flags & GUD_DRM_STATUS_PENDING)) {
> +			ret = -status->errno;

So this exposes errno (an implementation detail) in the bus protocol,
at an absolute minimum it needs some le_to_cpu() adjustment, but I
think it would be cleaner to define the specific errors that are
application relevant.


If this get_status thing is in fact really really required then how about
adding an interrupt IN endpoint for it? I think that would be cleaner and
it costs less bus time with arguably lower latency. See e.g. usblp.


> +static struct drm_gem_object *
> +gud_drm_driver_gem_create_object(struct drm_device *dev, size_t size)
> +{
> +	struct drm_gem_shmem_object *shmem;
..
> +	/*
> +	 * This doesn't make a difference on x86, but on ARM (pi4) it was
> +	 * necessary to avoid black lines all over and it made it possible to
> +	 * compress directly from the framebuffer without performance drop.
> +	 */
> +	shmem->map_cached = true;

Can you explain what this does exactly?


> +static int gud_drm_probe(struct usb_interface *interface,
> +			 const struct usb_device_id *id)
> +{
..
> +	struct gud_drm_display_descriptor desc;
..
> +		/* Check if the device can support us */
> +		*version = 1;
> +		ret = gud_drm_usb_control_msg(usb, ifnum, false, GUD_DRM_USB_REQ_SET_VERSION,
> +					      0, version, sizeof(*version), true);
> +		if (!ret)
> +			ret = gud_usb_get_status(usb, ifnum);
> +		kfree(version);
> +		if (ret) {
> +			dev_err(dev, "Protocol version %u is not supported\n", desc.bVersion);
> +			return -EPROTONOSUPPORT;

Could't this work without _get_status()? What does usb_control_msg()
return for a STALL handshake in the data stage?

Anyway, usb_get_status() (which I guess inspired gud_usb_get_status()) is
usually for administrative device status rather than application status.
Ideally the application status can be deduced by host software based on
device responses.


..
> +	gdrm->compression = desc.bCompression & GUD_DRM_COMPRESSION_LZ4;

This is a perfect example of doing things right! :)

GUD_DRM_COMPRESSION_LZ4 is specific for this protocol, not DRM/Linux.

What do you think about s,GUD_DRM_,GUD_, for such names?

And would it make sense to expose the protocol (names, structures) in uapi?

Or at least in Documentation/ ?


> +static size_t gud_drm_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format,
> +				       void *src, struct drm_framebuffer *fb,
> +				       struct drm_rect *rect)
> +{
..
> +	buf = kmalloc(width * height, GFP_KERNEL);
> +	if (!buf)
> +		return len; /* To keep logic simple, just transmit garbage */

Ouch! Shouldn't this bubble up somehow? If there is memory pressure
then I really think something above should fail.


> +static int gud_drm_fb_flush(struct gud_drm_device *gdrm, struct drm_framebuffer *fb,
> +			    const struct drm_format_info *format, struct drm_rect *rect)
> +{

This is in the hot path, right?


> +	ret = gud_drm_usb_set(gdrm, GUD_DRM_USB_REQ_SET_BUFFER, 0, &req, sizeof(req));
> +	if (ret)
> +		goto vunmap;
> +
> +	ret = usb_bulk_msg(gdrm->usb, gdrm->bulk_pipe, gdrm->bulk_buf, trlen,
> +			   &actual_length, msecs_to_jiffies(3000));

I would definitely change this pattern so that the hot path has only bulk
transactions, ideally a single transfer. The control transfer wastes
precious bus time in the hot path.

Maybe it's insignificant with FHD data but then again, the more data
the less overhead we want, and in any case for small R1 data the
control transfer is easily more expensive than the data itself!

A control transfer somehow compares to an ioctl() from userspace with
much context switching, while a bulk transfer is more like mmaped kernel
memory or aio.

Why not just add the values in struct gud_drm_req_set_buffer as a header
before the data instead?

That would mean two bulk transfers, but they could be asynchronous, at least
the first, but making both async would also fit more data onto the bus.
Maybe later.


> + * struct gud_drm_req_get_connector - Connector descriptor
> + * @connector_type: Connector type (DRM_MODE_CONNECTOR_*)
> + * @flags: Flags
> + * @num_properties: Number of supported properties
> + */
> +struct gud_drm_req_get_connector {
> +	__u8 connector_type;

This is intended for the (Generic) USB Display to report the connector type
used for its panel, right? It should not use Linux/DRM-internal values such
as DRM_MODE_CONNECTOR_SPI to do so, if it wants to be generic and stable
over time.

Why does the host software need to know anything about the connector
inside the device, anyway? With a microcontroller that could be anything,
especially with actual R1 displays.

Would it make sense to introduce DRM_MODE_CONNECTOR_USB on the host, and
keep this implementation detail in the device?

Make the protocol application specific and avoid implementation specifics.


> + * struct gud_drm_req_get_connector_status - Connector status

How does this work if and when the status on the device changes?


> +/*
> + * Internal monochrome transfer format presented to userspace as XRGB8888.
> + * Pixel lines are byte aligned.
> + */
> +#define GUD_DRM_FORMAT_R1	fourcc_code('R', '1', ' ', ' ')

This is also a data format over USB, right? Then it's not really internal,
because it also exists on the device. I have several uses for this, but
none will be using Linux gadgets, rather microcontrollers.


> +/* USB Control requests: */
> +
> +/*
> + * If the host driver doesn't support the device protocol version it will send
> + * the versions it supports starting with the latest. If the device isn't
> + * backwards compatible or doesn't support the version the host suggests, it
> + * shall return EPROTONOSUPPORT.
> + */
> +#define GUD_DRM_USB_REQ_SET_VERSION			0x30

USB devices report errors to a control requests with a STALL handshake,
which is passed all the way back to the host software. Please use that?

How/where would the EPROTONOSUPPORT value be returned? It's another
implementation specific, that should be used on the bus.


> +/* Get supported pixel formats as an array of fourcc codes. See include/uapi/drm/drm_fourcc.h */
> +#define GUD_DRM_USB_REQ_GET_FORMATS			0x40

Plus R1, right? I can understand if you don't want to add R1 to uapi, but
then at least document that the array can contain both uapi codes and R1.


> +/* Apply the prevoius _STATE_CHECK configuration */
> +#define GUD_DRM_USB_REQ_SET_STATE_COMMIT		0x62

Typo -> previous



I hope this helps.

Kind regards

//Peter
