Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B26D5320063
	for <lists+linux-usb@lfdr.de>; Fri, 19 Feb 2021 22:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhBSVng (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Feb 2021 16:43:36 -0500
Received: from foo.stuge.se ([212.116.89.98]:38306 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229515AbhBSVne (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Feb 2021 16:43:34 -0500
Received: (qmail 11331 invoked by uid 1000); 19 Feb 2021 21:42:43 -0000
Message-ID: <20210219214243.11330.qmail@stuge.se>
Date:   Fri, 19 Feb 2021 21:42:43 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, hudson@trmm.net,
        markus@raatikainen.cc, sam@ravnborg.org, linux-usb@vger.kernel.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210219121702.50964-4-noralf@tronnes.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Noralf,

Noralf Trønnes wrote:
> +++ b/drivers/gpu/drm/gud/gud_connector.c
..
> +static int gud_connector_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
..
> +	struct gud_connector *gconn = ctx->gconn;
> +	size_t start = block * EDID_LENGTH;
> +
> +	if (start + len > gconn->edid_len)
> +		return -1;
> +
> +	if (!block) {
> +		struct gud_device *gdrm = to_gud_device(gconn->connector.dev);
> +		int ret;
> +
> +		/* Check because drm_do_get_edid() will retry on failure */
> +		if (!ctx->buf)
> +			ctx->buf = kmalloc(gconn->edid_len, GFP_KERNEL);
> +		if (!ctx->buf)
> +			return -1;
> +
> +		ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_EDID, gconn->connector.index,
> +				  ctx->buf, gconn->edid_len);
..
> +	memcpy(buf, ctx->buf + start, len);

Danger, danger?

gconn->edid_len in this call to gud_usb_get() comes from the device in
gud_connector_status_request() where the only validation is that
edid_len % EDID_LENGTH == 0, so a device could write past the buffer
if drm_do_get_edid() passes a buffer smaller than edid_len.

I guess the buffer passed is just 128, EDID_LENGTH, so a malicious
or buggy device could overwrite 64k-128 kernel memory? Ouch!


More generally it's not very typical in USB to report the data size
separately from the data itself, if reporting size explicitly at all.

Sizes can be part of the data structure itself (like in descriptors) but
on the application layer (like here) it's convenient to just decide a
sensible fixed maximum size and let the host try to always transfer
that size while accepting short transfers. Unlike read() a short
transfer only ever happens if and when a device intends for it,
so that's like an in-band handshake but "for free".

Oh, and does/should the GUD EDID change if the panel "behind" the device
CPU on a hotpluggable connector changes? It wouldn't be great to require
GUD driver reprobe in that case. But maybe DRM requires that anyway?


I'm sorry I didn't spot this pattern earlier, I understand that it's late
in the game and that changing it needs the gadget to change as well, but I
do really think this is a worthwhile change throughout the protocol.

And I think it applies to more than EDID, e.g. both GUD and connector
properties, maybe formats, something else?


Unfortunately, the gud_usb_control_msg() check (ret != len) creates a
requirement to know in advance how much data will be transfered.

That could be revised at least for the general case, even if not used
everywhere; maybe something like adding a size_t required_min_len
parameter to gud_usb_control_msg()?


> +static int gud_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct gud_connector *gconn = to_gud_connector(connector);
> +	struct gud_device *gdrm = to_gud_device(connector->dev);
> +	struct gud_connector_get_edid_ctx edid_ctx = {
> +		.gconn = gconn,
> +	};
> +	struct gud_display_mode_req *reqmodes = NULL;
> +	unsigned int i, num_modes = 0;

The error path of this function executes "return num_modes" with num_modes
unmodified; ie. 0. Is that intentional?


> +static int gud_connector_add_tv_mode(struct gud_device *gdrm,
..
> +	buf_len = num_modes * GUD_CONNECTOR_TV_MODE_NAME_LEN;
> +	modes = kmalloc_array(num_modes, sizeof(*modes), GFP_KERNEL);
> +	buf = kmalloc(buf_len, GFP_KERNEL);

Maybe moving the buf assignment immediately following the buf_len assignment
would help readability? This is quite minor.


> +static int gud_connector_add_properties(struct gud_device *gdrm, struct gud_connector *gconn,
> +					unsigned int num_properties)
> +{
> +	struct drm_device *drm = &gdrm->drm;
> +	struct drm_connector *connector = &gconn->connector;
> +	struct gud_property_req *properties;
> +	unsigned int i;
> +	int ret;
> +
> +	gconn->properties = kcalloc(num_properties, sizeof(*gconn->properties), GFP_KERNEL);
> +	if (!gconn->properties)
> +		return -ENOMEM;
> +
> +	properties = kcalloc(num_properties, sizeof(*properties), GFP_KERNEL);
> +	if (!properties)
> +		return -ENOMEM;

I think this error path leaks gconn->properties?


> +int gud_connector_create(struct gud_device *gdrm, unsigned int index)

Most error paths in this function seem to leak both gconn and connector?


> +++ b/drivers/gpu/drm/gud/gud_drv.c
..
> +static int gud_usb_get_status(struct usb_device *usb, u8 ifnum, u8 *status)
..
> +	ret = gud_usb_control_msg(usb, ifnum, true, GUD_REQ_GET_STATUS, 0, buf, sizeof(*buf));
> +	*status = *buf;

Maybe make this conditional on 0 == ret.


> +static int gud_set_version(struct usb_device *usb, u8 ifnum, u32 flags, u8 version)
..
> +	if (ret == -EPIPE)
> +		return -EPROTONOSUPPORT;

So yeah, this isn't typical, devices usually describe optional things that
the driver may need to know about, unless it's something that can change
during operation.

Arguably mildly contradictory to the short transfer pattern, but one is
capability and the other is "runtime" data.


> +static int gud_get_properties(struct gud_device *gdrm, unsigned int num_properties)
> +{
> +	struct gud_property_req *properties;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!num_properties)
> +		return 0;
> +
> +	gdrm->properties = drmm_kcalloc(&gdrm->drm, num_properties, sizeof(*gdrm->properties),
> +					GFP_KERNEL);
> +	if (!gdrm->properties)
> +		return -ENOMEM;
> +
> +	properties = kcalloc(num_properties, sizeof(*properties), GFP_KERNEL);
> +	if (!properties)
> +		return -ENOMEM;

It looks like this function leaks gdrm->properties in all error paths?


> +		default:
> +			/* New ones might show up in future devices, skip those we don't know. */
> +			drm_dbg(&gdrm->drm, "Unknown property: %u\n", prop);

Maybe "Ignoring unknown property: %u\n" would be a little more clear?


> +static int gud_stats_debugfs(struct seq_file *m, void *data)
..
> +	seq_puts(m, "Compression:      ");
> +	if (gdrm->compression & GUD_COMPRESSION_LZ4)
> +		seq_puts(m, " lz4");
> +	seq_puts(m, "\n");

Maybe an explicit seq_puts(m, " none") if there are none?


> +	if (gdrm->compression) {
> +		u64 remainder;
> +		u64 ratio = div64_u64_rem(gdrm->stats_length, gdrm->stats_actual_length,
> +					  &remainder);
> +		u64 ratio_frac = div64_u64(remainder * 10, gdrm->stats_actual_length);
> +
> +		seq_printf(m, "Compression ratio: %llu.%llu\n", ratio, ratio_frac);
> +	}

Will the fraction ever need zero padding?


> +static int gud_probe(struct usb_interface *interface, const struct usb_device_id *id)

I appreciate very much that GUD works on interface level, so that it
can also be used in composite devices at some point. Thanks a lot! \o/


> +++ b/drivers/gpu/drm/gud/gud_pipe.c
..
> +int gud_pipe_check(struct drm_simple_display_pipe *pipe,
..
> +	req = kzalloc(len, GFP_KERNEL);
> +	if (!req)
> +		return -ENOMEM;
> +
> +	gud_from_display_mode(&req->mode, mode);
> +
> +	req->format = gud_from_fourcc(format->format);
> +	if (WARN_ON_ONCE(!req->format))
> +		return -EINVAL;

req leaks?


> +	req->connector = drm_connector_index(connector);
> +	req->num_properties = num_properties;
> +
> +	num_properties = gud_connector_fill_properties(connector, connector_state,
> +						       req->properties);

Following this new assignment to num_properties the new value is used
to (hopefully!) append at the first req->properties[] index after the
old value was used as index, that doesn't feel great..

I mean, it's harmless as long as gud_connector_fill_properties() is
sure to return the same value, but, well, maybe sometime later it
doesn't, or is that guaranteed if there is no error? Then maybe at
least document that requirement by the function. What do you think?


Thanks a lot

//Peter
