Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46AF932066A
	for <lists+linux-usb@lfdr.de>; Sat, 20 Feb 2021 18:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhBTR3F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Feb 2021 12:29:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhBTR3E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Feb 2021 12:29:04 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC09C061786
        for <linux-usb@vger.kernel.org>; Sat, 20 Feb 2021 09:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pMXAH8nHleBFkBRH8croATWiV4JZzCIFeooqoN2mEpM=; b=GLzEB3pXZtivp/fdElB6tWN7RX
        Q0yDMQ90Ee+MzuVgYinPJ4rCe0JUtoPewzg3LikpEhl7Qw9mYqiToLSpuVcj1RnJiDhz6GKHSFmmX
        oefCwouFptJLjG/VDeu2UbaiA8HqZLTkumERwp0aYiV3qlIDYcz2/oyLcOJSRqZKd29Uw5R/b82HI
        SXxXbaSHXx+pNxEOjtwPjBkpJ8ugC0iHs8+zFDooBoTUstOVxCtrVuKTtNfghcKahGwTtRtWU/pYt
        U6ud/V+2dPOoe2Zy2RBJbyySq1gU3eLpk4BS/ANVdjGiQ/LoNCwmxDMIEOqk3BcHGbk44qew0wfSP
        RPGUt75g==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:63552 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lDW2z-0005jP-I1; Sat, 20 Feb 2021 18:28:01 +0100
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     dri-devel@lists.freedesktop.org, hudson@trmm.net,
        markus@raatikainen.cc, sam@ravnborg.org, linux-usb@vger.kernel.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
 <20210219214243.11330.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <5c00a868-3a2f-438b-3670-ee86caef4d2a@tronnes.org>
Date:   Sat, 20 Feb 2021 18:27:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219214243.11330.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 19.02.2021 22.42, skrev Peter Stuge:
> Hi Noralf,
> 
> Noralf Trønnes wrote:
>> +++ b/drivers/gpu/drm/gud/gud_connector.c
> ..
>> +static int gud_connector_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> ..
>> +	struct gud_connector *gconn = ctx->gconn;
>> +	size_t start = block * EDID_LENGTH;
>> +
>> +	if (start + len > gconn->edid_len)
>> +		return -1;
>> +
>> +	if (!block) {
>> +		struct gud_device *gdrm = to_gud_device(gconn->connector.dev);
>> +		int ret;
>> +
>> +		/* Check because drm_do_get_edid() will retry on failure */
>> +		if (!ctx->buf)
>> +			ctx->buf = kmalloc(gconn->edid_len, GFP_KERNEL);
>> +		if (!ctx->buf)
>> +			return -1;
>> +
>> +		ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_EDID, gconn->connector.index,
>> +				  ctx->buf, gconn->edid_len);
> ..
>> +	memcpy(buf, ctx->buf + start, len);
> 
> Danger, danger?
> 
> gconn->edid_len in this call to gud_usb_get() comes from the device in
> gud_connector_status_request() where the only validation is that
> edid_len % EDID_LENGTH == 0, so a device could write past the buffer
> if drm_do_get_edid() passes a buffer smaller than edid_len.
> 
> I guess the buffer passed is just 128, EDID_LENGTH, so a malicious
> or buggy device could overwrite 64k-128 kernel memory? Ouch!
> 

The result goes into ctx->buf which is big enough. Then each edid block
is copied from that buffer as the parser runs the callback.

Maybe I should add a cap on ->edid_len, but I don't know how big it
should be. There's no danger as such not having a cap, the host will
either fail to allocate memory (max 4MB usually) or do a very big
transfer and error out in the edid parser.

> 
> More generally it's not very typical in USB to report the data size
> separately from the data itself, if reporting size explicitly at all.
> 
> Sizes can be part of the data structure itself (like in descriptors) but
> on the application layer (like here) it's convenient to just decide a
> sensible fixed maximum size and let the host try to always transfer
> that size while accepting short transfers. Unlike read() a short
> transfer only ever happens if and when a device intends for it,
> so that's like an in-band handshake but "for free".
> 
> Oh, and does/should the GUD EDID change if the panel "behind" the device
> CPU on a hotpluggable connector changes? It wouldn't be great to require
> GUD driver reprobe in that case. But maybe DRM requires that anyway?
> 

If gud_connector_status_req.status has changed since last poll or
GUD_CONNECTOR_STATUS_CHANGED is set, DRM will notify userspace which
will reprobe the connector. connector->epoch_counter++ in
gud_connector_status_request() triggers that.

> 
> I'm sorry I didn't spot this pattern earlier, I understand that it's late
> in the game and that changing it needs the gadget to change as well, but I
> do really think this is a worthwhile change throughout the protocol.
> 

I see what you mean, I'll give it a try.

> And I think it applies to more than EDID, e.g. both GUD and connector
> properties, maybe formats, something else?
> 
> 
> Unfortunately, the gud_usb_control_msg() check (ret != len) creates a
> requirement to know in advance how much data will be transfered.
> 
> That could be revised at least for the general case, even if not used
> everywhere; maybe something like adding a size_t required_min_len
> parameter to gud_usb_control_msg()?
> 
> 
>> +static int gud_connector_get_modes(struct drm_connector *connector)
>> +{
>> +	struct gud_connector *gconn = to_gud_connector(connector);
>> +	struct gud_device *gdrm = to_gud_device(connector->dev);
>> +	struct gud_connector_get_edid_ctx edid_ctx = {
>> +		.gconn = gconn,
>> +	};
>> +	struct gud_display_mode_req *reqmodes = NULL;
>> +	unsigned int i, num_modes = 0;
> 
> The error path of this function executes "return num_modes" with num_modes
> unmodified; ie. 0. Is that intentional?
> 

It's not allowed to return an error code so 0 is the only option. The
caller drm_helper_probe_single_connector_modes() adds a fallback
1024x768 mode in that case which probably won't fit for a display panel,
but the device should reject an illegal mode on GUD_REQ_SET_STATE_CHECK
so we're fine.

> 
>> +static int gud_connector_add_tv_mode(struct gud_device *gdrm,
> ..
>> +	buf_len = num_modes * GUD_CONNECTOR_TV_MODE_NAME_LEN;
>> +	modes = kmalloc_array(num_modes, sizeof(*modes), GFP_KERNEL);
>> +	buf = kmalloc(buf_len, GFP_KERNEL);
> 
> Maybe moving the buf assignment immediately following the buf_len assignment
> would help readability? This is quite minor.
> 
> 
>> +static int gud_connector_add_properties(struct gud_device *gdrm, struct gud_connector *gconn,
>> +					unsigned int num_properties)
>> +{
>> +	struct drm_device *drm = &gdrm->drm;
>> +	struct drm_connector *connector = &gconn->connector;
>> +	struct gud_property_req *properties;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	gconn->properties = kcalloc(num_properties, sizeof(*gconn->properties), GFP_KERNEL);
>> +	if (!gconn->properties)
>> +		return -ENOMEM;
>> +
>> +	properties = kcalloc(num_properties, sizeof(*properties), GFP_KERNEL);
>> +	if (!properties)
>> +		return -ENOMEM;
> 
> I think this error path leaks gconn->properties?
> 

It's freed in gud_connector_destroy() which will be called on error at
this stage.

> 
>> +int gud_connector_create(struct gud_device *gdrm, unsigned int index)
> 
> Most error paths in this function seem to leak both gconn and connector?
> 

Everything that happens after the drm_connector_init() call is cleaned
up automatically when the DRM device is torn down.
devm_drm_dev_alloc() and drmm_mode_config_init() sets this up.

> 
>> +++ b/drivers/gpu/drm/gud/gud_drv.c
> ..
>> +static int gud_usb_get_status(struct usb_device *usb, u8 ifnum, u8 *status)
> ..
>> +	ret = gud_usb_control_msg(usb, ifnum, true, GUD_REQ_GET_STATUS, 0, buf, sizeof(*buf));
>> +	*status = *buf;
> 
> Maybe make this conditional on 0 == ret.
> 
> 
>> +static int gud_set_version(struct usb_device *usb, u8 ifnum, u32 flags, u8 version)
> ..
>> +	if (ret == -EPIPE)
>> +		return -EPROTONOSUPPORT;
> 
> So yeah, this isn't typical, devices usually describe optional things that
> the driver may need to know about, unless it's something that can change
> during operation.
> 
> Arguably mildly contradictory to the short transfer pattern, but one is
> capability and the other is "runtime" data.
> 
> 
>> +static int gud_get_properties(struct gud_device *gdrm, unsigned int num_properties)
>> +{
>> +	struct gud_property_req *properties;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	if (!num_properties)
>> +		return 0;
>> +
>> +	gdrm->properties = drmm_kcalloc(&gdrm->drm, num_properties, sizeof(*gdrm->properties),
>> +					GFP_KERNEL);
>> +	if (!gdrm->properties)
>> +		return -ENOMEM;
>> +
>> +	properties = kcalloc(num_properties, sizeof(*properties), GFP_KERNEL);
>> +	if (!properties)
>> +		return -ENOMEM;
> 
> It looks like this function leaks gdrm->properties in all error paths?
> 

drmm_kcalloc() is the DRM version of devm_kcalloc() which frees the
memory when the last DRM fd is closed. There might be open fd's when the
device goes away so the devm_ versions can't be used.

> 
>> +		default:
>> +			/* New ones might show up in future devices, skip those we don't know. */
>> +			drm_dbg(&gdrm->drm, "Unknown property: %u\n", prop);
> 
> Maybe "Ignoring unknown property: %u\n" would be a little more clear?
> 

Sure.

> 
>> +static int gud_stats_debugfs(struct seq_file *m, void *data)
> ..
>> +	seq_puts(m, "Compression:      ");
>> +	if (gdrm->compression & GUD_COMPRESSION_LZ4)
>> +		seq_puts(m, " lz4");
>> +	seq_puts(m, "\n");
> 
> Maybe an explicit seq_puts(m, " none") if there are none?
> 

That makes sense.

> 
>> +	if (gdrm->compression) {
>> +		u64 remainder;
>> +		u64 ratio = div64_u64_rem(gdrm->stats_length, gdrm->stats_actual_length,
>> +					  &remainder);
>> +		u64 ratio_frac = div64_u64(remainder * 10, gdrm->stats_actual_length);
>> +
>> +		seq_printf(m, "Compression ratio: %llu.%llu\n", ratio, ratio_frac);
>> +	}
> 
> Will the fraction ever need zero padding?
> 

No, I don't see why.

> 
>> +static int gud_probe(struct usb_interface *interface, const struct usb_device_id *id)
> 
> I appreciate very much that GUD works on interface level, so that it
> can also be used in composite devices at some point. Thanks a lot! \o/
> 

This was a design requirement since I wanted to make room for at least
HID touch and maybe audio. It will also tolerate other vendor class
interfaces and just silently ignore them.

The Pi images on the wiki has the ability to add a serial console USB
interface for debugging.

> 
>> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> ..
>> +int gud_pipe_check(struct drm_simple_display_pipe *pipe,
> ..
>> +	req = kzalloc(len, GFP_KERNEL);
>> +	if (!req)
>> +		return -ENOMEM;
>> +
>> +	gud_from_display_mode(&req->mode, mode);
>> +
>> +	req->format = gud_from_fourcc(format->format);
>> +	if (WARN_ON_ONCE(!req->format))
>> +		return -EINVAL;
> 
> req leaks?
> 

Yep, you're right.

> 
>> +	req->connector = drm_connector_index(connector);
>> +	req->num_properties = num_properties;
>> +
>> +	num_properties = gud_connector_fill_properties(connector, connector_state,
>> +						       req->properties);
> 
> Following this new assignment to num_properties the new value is used
> to (hopefully!) append at the first req->properties[] index after the
> old value was used as index, that doesn't feel great..
> 
> I mean, it's harmless as long as gud_connector_fill_properties() is
> sure to return the same value, but, well, maybe sometime later it
> doesn't, or is that guaranteed if there is no error? Then maybe at
> least document that requirement by the function. What do you think?
> 

The number of properties doesn't change, it is returned by
GUD_REQ_GET_CONNECTOR during probe.
There is a small comment in gud_connector_fill_properties() but I can
expand on that and put it before the function definition.

Thanks for your scrutiny.

Noralf.
