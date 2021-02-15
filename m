Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A384E31B8B5
	for <lists+linux-usb@lfdr.de>; Mon, 15 Feb 2021 13:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhBOMGO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Feb 2021 07:06:14 -0500
Received: from foo.stuge.se ([212.116.89.98]:35878 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhBOMGJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Feb 2021 07:06:09 -0500
X-Greylist: delayed 398 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Feb 2021 07:06:08 EST
Received: (qmail 18304 invoked by uid 1000); 15 Feb 2021 11:58:44 -0000
Message-ID: <20210215115844.18303.qmail@stuge.se>
Date:   Mon, 15 Feb 2021 11:58:44 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        sam@ravnborg.org, lkundrak@v3.sk, markus@raatikainen.cc,
        pontus.fuchs@gmail.com, hudson@trmm.net, th020394@gmail.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v5 3/3] drm: Add Generic USB Display driver
References: <20210212174609.58977-1-noralf@tronnes.org>
 <20210212174609.58977-4-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210212174609.58977-4-noralf@tronnes.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Noralf,

I was happy to see v4 - thanks for accepting so much of my feedback -
and I have to say that the new recursive acronym makes me smile! :)


Noralf Trønnes wrote:
> +++ b/drivers/gpu/drm/gud/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config DRM_GUD
> +	tristate "GUD USB Display"
> +	depends on DRM && USB
> +	select LZ4_COMPRESS

Just a thought: Maybe LZ4_COMPRESS should be optional also on the host?

Ie. not select it here and make lz4 code conditional on CONFIG_LZ4_COMPRESS?


> +++ b/drivers/gpu/drm/gud/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +gud-objs			:= gud_drv.o gud_pipe.o gud_connector.o

Should this be gud-y instead, like in other drm/*/Makefile ?


> +++ b/drivers/gpu/drm/gud/gud_connector.c
..
> +static int gud_connector_atomic_check(struct drm_connector *connector,
> +				      struct drm_atomic_state *state)
> +{

This always returns 0, so could be void?


> +int gud_connector_create(struct gud_device *gdrm, unsigned int index)
> +{
> +	struct gud_connector_descriptor_req desc;
> +	struct drm_device *drm = &gdrm->drm;
> +	struct gud_connector *gconn;
> +	struct drm_connector *connector;
> +	struct drm_encoder *encoder;
> +	int ret, connector_type;
> +	u32 flags;
> +
> +	ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR, index, &desc, sizeof(desc));

Watch out for endianness bugs.

I'd suggest to stay with the pattern "little-endian on wire" and add
complexity on the host to deserialize/convert transfered data to native,
but perhaps with some generic method that scales better than explicitly
converting values on every use.


> +++ b/drivers/gpu/drm/gud/gud_drv.c
..
> +static int gud_usb_control_msg(struct usb_device *usb, u8 ifnum, bool in,
> +			       u8 request, u16 value, void *buf, size_t len)
> +{
> +	u8 requesttype = USB_TYPE_VENDOR | USB_RECIP_INTERFACE;
> +	unsigned int pipe;
> +	int ret;
> +
> +	if (in) {
> +		pipe = usb_rcvctrlpipe(usb, 0);
> +		requesttype |= USB_DIR_IN;
> +	} else {
> +		pipe = usb_sndctrlpipe(usb, 0);
> +		requesttype |= USB_DIR_OUT;

The above line seems unneccessary since USB_DIR_OUT is 0 by spec.


> +static int gud_get_display_descriptor(struct usb_interface *interface,
> +				      struct gud_display_descriptor_req *desc)
> +{
> +	u8 ifnum = interface->cur_altsetting->desc.bInterfaceNumber;
> +	struct usb_device *usb = interface_to_usbdev(interface);
> +	void *buf;
> +	int ret;
> +
> +	buf = kmalloc(sizeof(*desc), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	ret = gud_usb_control_msg(usb, ifnum, true, GUD_REQ_GET_DESCRIPTOR, 0, buf, sizeof(*desc));
> +	memcpy(desc, buf, sizeof(*desc));
> +	kfree(buf);

Is buf neccessary here? This isn't the hot path, but less dynamic memory
and copying is always nicer.


> +	if (desc->magic != GUD_DISPLAY_MAGIC)
> +		return -ENODATA;

It seems like this checks overlooks endianness, which happens very easily.

Maybe it's a good idea to create a function to fix endianness directly
after data transfers?

Such a function could take a pointer to memory and a kind of format
string made up of 'b', 'w', 'l' and 'q' or '1', '2', '4' and '8' to
describe field sizes, and would then convert wlq fields to native
endianness in-place.

Or are there some parts of the code that could really benefit from
keeping wire-endian values in host memory?


> +static int gud_usb_get_status(struct usb_device *usb, u8 ifnum, u8 *status)
> +{
> +	u8 *buf;
> +	int ret;
> +
> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	ret = gud_usb_control_msg(usb, ifnum, true, GUD_REQ_GET_STATUS, 0, buf, sizeof(*buf));
> +	*status = *buf;
> +	kfree(buf);

Ouch, kmalloc for a single byte here, this is the extreme case! :)

If it's not cool to transfer data directly through to the provided pointer
then how about bouncing onto a stack variable rather than kmalloc memory?

Ie:

u8 val;

gud_usb_control_msg(.. GUD_REQ_GET_STATUS, 0, &val, sizeof val)


> +static int gud_usb_transfer(struct gud_device *gdrm, bool in, u8 request, u16 index,
> +			    void *buf, size_t len)
> +{
> +	struct usb_device *usb = gud_to_usb_device(gdrm);
> +	void *trbuf = NULL;
> +	int idx, ret;
> +
> +	drm_dbg(&gdrm->drm, "%s: request=0x%x index=%u len=%zu\n",
> +		in ? "get" : "set", request, index, len);
> +
> +	if (!drm_dev_enter(&gdrm->drm, &idx))
> +		return -ENODEV;
> +
> +	mutex_lock(&gdrm->ctrl_lock);
> +
> +	if (buf) {
> +		if (in)
> +			trbuf = kmalloc(len, GFP_KERNEL);
> +		else
> +			trbuf = kmemdup(buf, len, GFP_KERNEL);

Also not the hot path, but is there no way to avoid copying memory around?


> +static int gud_set_version(struct usb_device *usb, u8 ifnum, u32 flags, u8 version)
> +{
> +	u8 *buf;
> +	int ret;
> +
> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	*buf = version;
> +	ret = gud_usb_control_msg(usb, ifnum, false, GUD_REQ_SET_VERSION, 0, buf, sizeof(*buf));

USB devices are usually expected to only support one protocol as advertised
by the device using some combination of bcdDevice in the device descriptor
and bInterfaceProtocol in interface descriptor(s), while the host is expected
to handle the complexities of different versions - so something like this
where the host instructs the device about versions isn't typical for USB.

The motivation behind that split is that USB devices are typically
simpler and lower cost than USB hosts, so devices should try to be
trivial to implement.

You can of course keep it anyway if you really want, I'm just letting
you know about the common pattern.


> +static int gud_probe(struct usb_interface *interface, const struct usb_device_id *id)
..
> +retry:
> +	/*
> +	 * Use plain kmalloc here since devm_kmalloc() places struct devres at the beginning
> +	 * of the buffer it allocates. This wastes a lot of memory when allocating big buffers.
> +	 * Asking for 2M would actually allocate 4M. This would also prevent getting the biggest
> +	 * possible buffer potentially leading to split transfers.
> +	 */

Just a note here that split transfers are not per se a big problem if
they are all submitted at once, since the USB host controller is able
to schedule different transfers back-to-back on the wire.


Kind regards

//Peter
