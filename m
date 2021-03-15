Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D115833C6EC
	for <lists+linux-usb@lfdr.de>; Mon, 15 Mar 2021 20:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhCOTiB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Mar 2021 15:38:01 -0400
Received: from foo.stuge.se ([212.116.89.98]:45376 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232063AbhCOThi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Mar 2021 15:37:38 -0400
Received: (qmail 10167 invoked by uid 1000); 15 Mar 2021 19:37:29 -0000
Message-ID: <20210315193729.10166.qmail@stuge.se>
Date:   Mon, 15 Mar 2021 19:37:29 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, hudson@trmm.net,
        markus@raatikainen.cc, sam@ravnborg.org, linux-usb@vger.kernel.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v8 3/3] drm: Add GUD USB Display driver
References: <20210313112545.37527-1-noralf@tronnes.org>
 <20210313112545.37527-4-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210313112545.37527-4-noralf@tronnes.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Noralf,

super fair call with the BE testing, let's hope for some testing soonish.


I was thinking about my device doing protocol STALL when I try to
return 0 bytes, and while it *is* a bug in my device, from a standards
point of view it's actually completely valid, if not expected:

--8<-- usb_20.pdf 8.5.3.4 STALL Handshakes Returned by Control Pipes
If the device is unable to complete a command, it returns a STALL in the
Data and/or Status stages of the control transfer. Unlike the case of a
functional stall, protocol stall does not indicate an error with the device.
-->8--

I think it's fair to say that a device can't complete the command
when it has no data to return.

So how about allowing STALL for optional GUD_REQ_GET_:s to mean the same
as a 0 byte response? Should I propose a separate patch for it later?


Noralf Trønnes wrote:
> +++ b/drivers/gpu/drm/gud/gud_connector.c
..
> +static int gud_connector_get_modes(struct drm_connector *connector)
..
> +	ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_EDID, connector->index,
> +			  edid_ctx.buf, GUD_CONNECTOR_MAX_EDID_LEN);

if (ret == -EPIPE)
	ret = 0;

> +	if (ret > 0 && ret % EDID_LENGTH) {
> +		gud_conn_err(connector, "Invalid EDID size", ret);
> +	} else if (ret > 0) {
> +		edid_ctx.len = ret;
> +		edid = drm_do_get_edid(connector, gud_connector_get_edid_block, &edid_ctx);
> +	}


> +static int gud_connector_add_properties(struct gud_device *gdrm, struct gud_connector *gconn)
..
> +	ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_PROPERTIES, connector->index,
> +			  properties, GUD_CONNECTOR_PROPERTIES_MAX_NUM * sizeof(*properties));

if (ret == -EPIPE)
	ret = 0;

> +	if (ret <= 0)
> +		goto out;
> +	if (ret % sizeof(*properties)) {
> +		ret = -EIO;
> +		goto out;
> +	}


> +++ b/drivers/gpu/drm/gud/gud_drv.c
..
..
> +static int gud_get_properties(struct gud_device *gdrm)
..
> +	ret = gud_usb_get(gdrm, GUD_REQ_GET_PROPERTIES, 0,
> +			  properties, GUD_PROPERTIES_MAX_NUM * sizeof(*properties));

if (ret == -EPIPE)
	ret = 0;

> +	if (ret <= 0)
> +		goto out;
> +	if (ret % sizeof(*properties)) {
> +		ret = -EIO;
> +		goto out;
> +	}


Then I looked whether a device could cause trouble in the driver by
returning complex/unexpected data, and found this:

> +static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
..
> +	/* Add room for emulated XRGB8888 */
> +	formats = devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*formats), GFP_KERNEL);

It looks like this +1 and the way xrgb8888_emulation_format works means
that an interface will not always work correctly if multiple emulated
formats (R1, XRGB1111, RGB565) are returned, because only one emulated
mode is added after the loop, with struct drm_format_info for the last
emulated format returned by the device. So userspace would only see the
last emulated mode and the bulk output would only ever use that
particular pixel format, any earlier ones would be unavailable?

If this is EWONTFIX then how about adding an error message if multiple
emulated modes are returned and ignore all but the first, rather than
all but the last?


Related: Can userspace find out which GUD_PIXEL_FORMAT_* is behind an
emulated format? It's needed to decide how the emulated framebuffer
should be used, in particular to not use G or B if GUD_PIXEL_FORMAT_R1.


> +		switch (format) {
> +		case GUD_DRM_FORMAT_R1:
> +			fallthrough;
> +		case GUD_DRM_FORMAT_XRGB1111:
> +			if (!xrgb8888_emulation_format)
> +				xrgb8888_emulation_format = info;
> +			break;
> +		case DRM_FORMAT_RGB565:
> +			rgb565_supported = true;
> +			if (!xrgb8888_emulation_format)
> +				xrgb8888_emulation_format = info;
> +			break;

Could RGB565 go before XRGB111 (or R1) and also fallthrough; in this
construct? Not terribly important, but the repetition caught my eye.


Then, in gud_connector.c I saw this, which surprised me:

+int gud_connector_fill_properties(struct drm_connector_state *connector_state,
..
+		if (prop == GUD_PROPERTY_BACKLIGHT_BRIGHTNESS) {
+			val = connector_state->tv.brightness;
+		} else {

Why is this using tv.brightness rather than say gconn->initial_brightness?

It looks like the end result might be the same because tv.brightness is
set to gconn->initial_brightness in gud_connector_reset() but it's a
little confusing to me, since a GUD backlight isn't a drm/TV thing?


Thanks a lot

//Peter
