Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F64131CB07
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 14:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhBPNUQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 08:20:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhBPNUN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Feb 2021 08:20:13 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A74C061574
        for <linux-usb@vger.kernel.org>; Tue, 16 Feb 2021 05:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=2oAdCTt159xurWXHSTbneaA8aBsipaCYwVn3NV4iiT0=; b=eDaQeQ2dH05CYSIgYuGkjMkkmY
        Wg1zZqjthQr2jvMLLFHxKzWUT36KMTh/nCVHqv398x6Hlw5VbX9aSFwroQM3IL5fx5xoQq85QLHnA
        6fjw43HekIz/9IAhE+C67ATEiUgog0zUX9X7kzPFbS2aQOMU1L5Eq9m4eTAE3OG13T1VY3GOAaJGI
        nuldqC2Xhc5VKtUSw9k/RQDLPrWH8oiJy1phmu7FAAKgiHnp34VEkvRoGMdhGR8ol2xGS7iAeA/bE
        nXsnmMRF24mc8tjnvq56izGzccCRoO22RjhEAhQIfmWceOJKx8EEu98CjA4O78AZOLTryN9Y7vwmX
        Z7F7/Fzw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:65106 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lC0Fu-0000b7-Le; Tue, 16 Feb 2021 14:19:06 +0100
Subject: Re: [PATCH v5 3/3] drm: Add Generic USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        sam@ravnborg.org, lkundrak@v3.sk, markus@raatikainen.cc,
        pontus.fuchs@gmail.com, hudson@trmm.net, th020394@gmail.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210212174609.58977-1-noralf@tronnes.org>
 <20210212174609.58977-4-noralf@tronnes.org>
 <20210215115844.18303.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <465d9221-f235-1073-e639-0f6145db5f4b@tronnes.org>
Date:   Tue, 16 Feb 2021 14:19:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115844.18303.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 15.02.2021 12.58, skrev Peter Stuge:
> Hi Noralf,
> 
> I was happy to see v4 - thanks for accepting so much of my feedback -
> and I have to say that the new recursive acronym makes me smile! :)
> 

Yeah I also had to smile when Simon Ser suggested it.

> 
> Noralf Trønnes wrote:
>> +++ b/drivers/gpu/drm/gud/Kconfig
>> @@ -0,0 +1,14 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +config DRM_GUD
>> +	tristate "GUD USB Display"
>> +	depends on DRM && USB
>> +	select LZ4_COMPRESS
> 
> Just a thought: Maybe LZ4_COMPRESS should be optional also on the host?
> 
> Ie. not select it here and make lz4 code conditional on CONFIG_LZ4_COMPRESS?
> 

LZ4_COMPRESS is a tiny library so I'd like it to stay to keep things simple.

> 
>> +++ b/drivers/gpu/drm/gud/Makefile
>> @@ -0,0 +1,4 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +gud-objs			:= gud_drv.o gud_pipe.o gud_connector.o
> 
> Should this be gud-y instead, like in other drm/*/Makefile ?
> 

Yeah, everyone else does it seems.

> 
>> +++ b/drivers/gpu/drm/gud/gud_connector.c
> ..
>> +static int gud_connector_atomic_check(struct drm_connector *connector,
>> +				      struct drm_atomic_state *state)
>> +{
> 
> This always returns 0, so could be void?
> 

It needs to follow the struct drm_connector_helper_funcs.atomic_check
signature.

> 
>> +int gud_connector_create(struct gud_device *gdrm, unsigned int index)
>> +{
>> +	struct gud_connector_descriptor_req desc;
>> +	struct drm_device *drm = &gdrm->drm;
>> +	struct gud_connector *gconn;
>> +	struct drm_connector *connector;
>> +	struct drm_encoder *encoder;
>> +	int ret, connector_type;
>> +	u32 flags;
>> +
>> +	ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR, index, &desc, sizeof(desc));
> 
> Watch out for endianness bugs.
> 
> I'd suggest to stay with the pattern "little-endian on wire" and add
> complexity on the host to deserialize/convert transfered data to native,
> but perhaps with some generic method that scales better than explicitly
> converting values on every use.
> 

I follow USB here and use little endian for all request structures.
All req members are marked with __u8, __le16, __le32 or __le64.

For this particular request only the flags field needs treatment, like this:

	flags = le32_to_cpu(desc.flags);

> 
>> +++ b/drivers/gpu/drm/gud/gud_drv.c
> ..
>> +static int gud_usb_control_msg(struct usb_device *usb, u8 ifnum, bool in,
>> +			       u8 request, u16 value, void *buf, size_t len)
>> +{
>> +	u8 requesttype = USB_TYPE_VENDOR | USB_RECIP_INTERFACE;
>> +	unsigned int pipe;
>> +	int ret;
>> +
>> +	if (in) {
>> +		pipe = usb_rcvctrlpipe(usb, 0);
>> +		requesttype |= USB_DIR_IN;
>> +	} else {
>> +		pipe = usb_sndctrlpipe(usb, 0);
>> +		requesttype |= USB_DIR_OUT;
> 
> The above line seems unneccessary since USB_DIR_OUT is 0 by spec.
> 
> 
>> +static int gud_get_display_descriptor(struct usb_interface *interface,
>> +				      struct gud_display_descriptor_req *desc)
>> +{
>> +	u8 ifnum = interface->cur_altsetting->desc.bInterfaceNumber;
>> +	struct usb_device *usb = interface_to_usbdev(interface);
>> +	void *buf;
>> +	int ret;
>> +
>> +	buf = kmalloc(sizeof(*desc), GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	ret = gud_usb_control_msg(usb, ifnum, true, GUD_REQ_GET_DESCRIPTOR, 0, buf, sizeof(*desc));
>> +	memcpy(desc, buf, sizeof(*desc));
>> +	kfree(buf);
> 
> Is buf neccessary here? This isn't the hot path, but less dynamic memory
> and copying is always nicer.
> 

The USB stack wants DMA capable buffers so it can't be avoided.

> 
>> +	if (desc->magic != GUD_DISPLAY_MAGIC)
>> +		return -ENODATA;
> 
> It seems like this checks overlooks endianness, which happens very easily.
> 

Thanks, I missed this one :)

> Maybe it's a good idea to create a function to fix endianness directly
> after data transfers?
> 
> Such a function could take a pointer to memory and a kind of format
> string made up of 'b', 'w', 'l' and 'q' or '1', '2', '4' and '8' to
> describe field sizes, and would then convert wlq fields to native
> endianness in-place.
> 

I would like to avoid more layers and just use the leNN_to_cpu()
functions directly.

> Or are there some parts of the code that could really benefit from
> keeping wire-endian values in host memory?
> 

Everything on the wire should be little endian. Two reasons for this,
USB does it like that, and I don't think we will ever see a big endian
device. Or are there big endian microcontrollers maybe?

> 
>> +static int gud_usb_get_status(struct usb_device *usb, u8 ifnum, u8 *status)
>> +{
>> +	u8 *buf;
>> +	int ret;
>> +
>> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	ret = gud_usb_control_msg(usb, ifnum, true, GUD_REQ_GET_STATUS, 0, buf, sizeof(*buf));
>> +	*status = *buf;
>> +	kfree(buf);
> 
> Ouch, kmalloc for a single byte here, this is the extreme case! :)
> 
> If it's not cool to transfer data directly through to the provided pointer
> then how about bouncing onto a stack variable rather than kmalloc memory?
> 
> Ie:
> 
> u8 val;
> 
> gud_usb_control_msg(.. GUD_REQ_GET_STATUS, 0, &val, sizeof val)
> 

The USB stack needs the buffer to DMA accessible.
And a small buffer like this is likely to be available in the cache AFAIK.

> 
>> +static int gud_usb_transfer(struct gud_device *gdrm, bool in, u8 request, u16 index,
>> +			    void *buf, size_t len)
>> +{
>> +	struct usb_device *usb = gud_to_usb_device(gdrm);
>> +	void *trbuf = NULL;
>> +	int idx, ret;
>> +
>> +	drm_dbg(&gdrm->drm, "%s: request=0x%x index=%u len=%zu\n",
>> +		in ? "get" : "set", request, index, len);
>> +
>> +	if (!drm_dev_enter(&gdrm->drm, &idx))
>> +		return -ENODEV;
>> +
>> +	mutex_lock(&gdrm->ctrl_lock);
>> +
>> +	if (buf) {
>> +		if (in)
>> +			trbuf = kmalloc(len, GFP_KERNEL);
>> +		else
>> +			trbuf = kmemdup(buf, len, GFP_KERNEL);
> 
> Also not the hot path, but is there no way to avoid copying memory around?
> 

I'm afraid not, but this is really fast though. Most buffers are smaller
than 32 bytes. The exception is EDID which is 128 or 256 bytes.

> 
>> +static int gud_set_version(struct usb_device *usb, u8 ifnum, u32 flags, u8 version)
>> +{
>> +	u8 *buf;
>> +	int ret;
>> +
>> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	*buf = version;
>> +	ret = gud_usb_control_msg(usb, ifnum, false, GUD_REQ_SET_VERSION, 0, buf, sizeof(*buf));
> 
> USB devices are usually expected to only support one protocol as advertised
> by the device using some combination of bcdDevice in the device descriptor
> and bInterfaceProtocol in interface descriptor(s), while the host is expected
> to handle the complexities of different versions - so something like this
> where the host instructs the device about versions isn't typical for USB.
> 
> The motivation behind that split is that USB devices are typically
> simpler and lower cost than USB hosts, so devices should try to be
> trivial to implement.
> 
> You can of course keep it anyway if you really want, I'm just letting
> you know about the common pattern.
> 

The device can just ignore this if they're not interested to work with
older drivers.
It's for devices that want to work with older drivers that don't support
the new protocol.

Not sure if there ever will be a version 2 of the protocol, but who knows.

> 
>> +static int gud_probe(struct usb_interface *interface, const struct usb_device_id *id)
> ..
>> +retry:
>> +	/*
>> +	 * Use plain kmalloc here since devm_kmalloc() places struct devres at the beginning
>> +	 * of the buffer it allocates. This wastes a lot of memory when allocating big buffers.
>> +	 * Asking for 2M would actually allocate 4M. This would also prevent getting the biggest
>> +	 * possible buffer potentially leading to split transfers.
>> +	 */
> 
> Just a note here that split transfers are not per se a big problem if
> they are all submitted at once, since the USB host controller is able
> to schedule different transfers back-to-back on the wire.
> 

This isn't a USB split transfer as such, it's the driver splitting up
the changed buffer rectangle because the device is unable to decompress
the entire buffer in one go (the lz4 compression method used doesn't
handle streams). This can kick in for devices that set
gud_display_descriptor_req.max_buffer_size. See gud_flush_work() for
details.

Noralf.
