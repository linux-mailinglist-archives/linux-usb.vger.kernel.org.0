Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E52833DEBE
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 21:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhCPU3Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 16:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhCPU2s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 16:28:48 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14814C06174A
        for <linux-usb@vger.kernel.org>; Tue, 16 Mar 2021 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ewtQ6oEgdnQBPOpUDyoc21YP+uvolAB570CcsVJHI1Y=; b=AcldiIjK918qSLqKGa6Gx1PtJg
        fg/9YrtfwthK5aPcSu65xh+DD4ySjElIHVSJfJK2rMQWbP9rk1yv2LA8ltPzmfX5tSuHB6wY6MIfw
        /y9tqdtEIa4gpF6qYMNHxO4R1AFrp+MeSe0v1yT97b5MAKTBFzkis02UWr7+MmhQgmeLLdSjz2TEC
        TdH2AYeu42lVgfGmAlWtKN/WCSng8otb0j26geyvxYLMJOYH8MvjQSFgALf/lkCjPB5JxzMbgr2Rb
        xqJpE8ZjO2FNM1BBZqv29BXFz/qeVw0uTYBLMev0dFeGh/cQBQ0nnjoWMuLYjzdqpTexbcY8EULdb
        EL+DH3DQ==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=62895)
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lMGJ0-0006nk-05; Tue, 16 Mar 2021 21:28:42 +0100
Subject: Re: [PATCH v8 3/3] drm: Add GUD USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     dri-devel@lists.freedesktop.org, hudson@trmm.net,
        markus@raatikainen.cc, sam@ravnborg.org, linux-usb@vger.kernel.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210313112545.37527-1-noralf@tronnes.org>
 <20210313112545.37527-4-noralf@tronnes.org>
 <20210315193729.10166.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e030be96-e484-daf3-f147-bc042c24457e@tronnes.org>
Date:   Tue, 16 Mar 2021 21:28:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315193729.10166.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 15.03.2021 20.37, skrev Peter Stuge:
> Hi Noralf,
> 
> super fair call with the BE testing, let's hope for some testing soonish.
> 
> 
> I was thinking about my device doing protocol STALL when I try to
> return 0 bytes, and while it *is* a bug in my device, from a standards
> point of view it's actually completely valid, if not expected:
> 
> --8<-- usb_20.pdf 8.5.3.4 STALL Handshakes Returned by Control Pipes
> If the device is unable to complete a command, it returns a STALL in the
> Data and/or Status stages of the control transfer. Unlike the case of a
> functional stall, protocol stall does not indicate an error with the device.
> -->8--
> 
> I think it's fair to say that a device can't complete the command
> when it has no data to return.
> 
> So how about allowing STALL for optional GUD_REQ_GET_:s to mean the same
> as a 0 byte response? Should I propose a separate patch for it later?
> 

Yeah, that would be nice.

We can't look for -EPIPE though, since GUD_REQ_GET_STATUS will ask for
the actual error. We have these to choose from currently:

  #define GUD_STATUS_OK				0x00
  #define GUD_STATUS_BUSY			0x01
  #define GUD_STATUS_REQUEST_NOT_SUPPORTED	0x02
  #define GUD_STATUS_PROTOCOL_ERROR		0x03
  #define GUD_STATUS_INVALID_PARAMETER		0x04
  #define GUD_STATUS_ERROR			0x05

Maybe REQUEST_NOT_SUPPORTED (-EOPNOTSUPP) or add a more fitting status
value.

If the driver sees -EPIPE this means that the device has failed to
respond properly. See gud_usb_transfer().

> 
> Noralf Trønnes wrote:
>> +++ b/drivers/gpu/drm/gud/gud_connector.c
> ..
>> +static int gud_connector_get_modes(struct drm_connector *connector)
> ..
>> +	ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_EDID, connector->index,
>> +			  edid_ctx.buf, GUD_CONNECTOR_MAX_EDID_LEN);
> 
> if (ret == -EPIPE)
> 	ret = 0;
> 
>> +	if (ret > 0 && ret % EDID_LENGTH) {
>> +		gud_conn_err(connector, "Invalid EDID size", ret);
>> +	} else if (ret > 0) {
>> +		edid_ctx.len = ret;
>> +		edid = drm_do_get_edid(connector, gud_connector_get_edid_block, &edid_ctx);
>> +	}
> 
> 
>> +static int gud_connector_add_properties(struct gud_device *gdrm, struct gud_connector *gconn)
> ..
>> +	ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_PROPERTIES, connector->index,
>> +			  properties, GUD_CONNECTOR_PROPERTIES_MAX_NUM * sizeof(*properties));
> 
> if (ret == -EPIPE)
> 	ret = 0;
> 
>> +	if (ret <= 0)
>> +		goto out;
>> +	if (ret % sizeof(*properties)) {
>> +		ret = -EIO;
>> +		goto out;
>> +	}
> 
> 
>> +++ b/drivers/gpu/drm/gud/gud_drv.c
> ..
> ..
>> +static int gud_get_properties(struct gud_device *gdrm)
> ..
>> +	ret = gud_usb_get(gdrm, GUD_REQ_GET_PROPERTIES, 0,
>> +			  properties, GUD_PROPERTIES_MAX_NUM * sizeof(*properties));
> 
> if (ret == -EPIPE)
> 	ret = 0;
> 
>> +	if (ret <= 0)
>> +		goto out;
>> +	if (ret % sizeof(*properties)) {
>> +		ret = -EIO;
>> +		goto out;
>> +	}
> 
> 
> Then I looked whether a device could cause trouble in the driver by
> returning complex/unexpected data, and found this:
> 
>> +static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
> ..
>> +	/* Add room for emulated XRGB8888 */
>> +	formats = devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*formats), GFP_KERNEL);
> 
> It looks like this +1 and the way xrgb8888_emulation_format works means
> that an interface will not always work correctly if multiple emulated
> formats (R1, XRGB1111, RGB565) are returned, because only one emulated
> mode is added after the loop, with struct drm_format_info for the last
> emulated format returned by the device. So userspace would only see the
> last emulated mode and the bulk output would only ever use that
> particular pixel format, any earlier ones would be unavailable?
> 
> If this is EWONTFIX then how about adding an error message if multiple
> emulated modes are returned and ignore all but the first, rather than
> all but the last?
> 

It does ignore all but the first... doesn't it?

You could make a patch if you care about this:

		case GUD_DRM_FORMAT_R1:
			fallthrough;
		case GUD_DRM_FORMAT_XRGB1111:
			if (!xrgb8888_emulation_format)
				xrgb8888_emulation_format = info;
+			else
+				dev_err(dev, "...");
			break;

It's only needed for the formats that are not exported to userspace.

> 
> Related: Can userspace find out which GUD_PIXEL_FORMAT_* is behind an
> emulated format? It's needed to decide how the emulated framebuffer
> should be used, in particular to not use G or B if GUD_PIXEL_FORMAT_R1.
> 

There's no way for userspace to know that. drm_fb_xrgb8888_to_gray8()
uses ITU BT.601 rgb conversion so userspace doesn't have to know which
colors to use, but ofc it will need to know there's a monochrome display
for it to look good.

XRGB8888 is the only format that is allowed to be emulated since some
userspace only supports that one format. So we can't have a device that
supports both R1 and XRGB1111.

> 
>> +		switch (format) {
>> +		case GUD_DRM_FORMAT_R1:
>> +			fallthrough;
>> +		case GUD_DRM_FORMAT_XRGB1111:
>> +			if (!xrgb8888_emulation_format)
>> +				xrgb8888_emulation_format = info;
>> +			break;
>> +		case DRM_FORMAT_RGB565:
>> +			rgb565_supported = true;
>> +			if (!xrgb8888_emulation_format)
>> +				xrgb8888_emulation_format = info;
>> +			break;
> 
> Could RGB565 go before XRGB111 (or R1) and also fallthrough; in this
> construct? Not terribly important, but the repetition caught my eye.
> 

It could but I'd like to keep the increasing bits-per-pixel order.

> 
> Then, in gud_connector.c I saw this, which surprised me:
> 
> +int gud_connector_fill_properties(struct drm_connector_state *connector_state,
> ..
> +		if (prop == GUD_PROPERTY_BACKLIGHT_BRIGHTNESS) {
> +			val = connector_state->tv.brightness;
> +		} else {
> 
> Why is this using tv.brightness rather than say gconn->initial_brightness?
> 
> It looks like the end result might be the same because tv.brightness is
> set to gconn->initial_brightness in gud_connector_reset() but it's a
> little confusing to me, since a GUD backlight isn't a drm/TV thing?
> 

I'm reusing the tv state property since that saves me from subclassing
the connector state. I want to have the value in the state because that
makes it less of a special case. Some time in the future DRM will have
proper backlight support as a DRM property, but so far no one has been
willing to invest the necessary time and effort to make it happen.

Noralf.
