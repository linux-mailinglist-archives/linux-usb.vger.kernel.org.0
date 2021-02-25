Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C17325537
	for <lists+linux-usb@lfdr.de>; Thu, 25 Feb 2021 19:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbhBYSJU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Feb 2021 13:09:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233007AbhBYSHn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Feb 2021 13:07:43 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7C4C061574
        for <linux-usb@vger.kernel.org>; Thu, 25 Feb 2021 10:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DX60RB6KmgJHGc7SEXuVw8LZv6BoOlMx0I0YVqIYzdw=; b=d0Uyb9tujVFA6G3qvRKVbmAiOW
        YQfF8fiaEf05dDxIabpRCSj2vF+BT5xoPyN0nf26bs+Cx/zVbNKUvlj/VPHWy5I0ud/X7AjiTXmnL
        zOyRQfoIGzqNucGasVEKyrjklrNCWPdfdcRdhxVK1oVeU4R7UEVo4+nJgbQ7iZfzPqJmANXk/uJxR
        YneiRWUg+OkPQ4fyageXBSTCBAHA8qLel3U3fS6mnR8qetVJvBlR6x0Px8/7tbscQKN95YVzGWczs
        tpjQdob4vChsiXfIy87El5EFIu24cYX4zFIttZ9bxpOSNy7gFcc3vHgyloOyXuU62rN/gdec6WV4P
        OP+6EMfA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:63061 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lFL2D-0004iG-4j; Thu, 25 Feb 2021 19:06:45 +0100
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     dri-devel@lists.freedesktop.org, hudson@trmm.net,
        markus@raatikainen.cc, sam@ravnborg.org, linux-usb@vger.kernel.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
 <20210225095825.6196.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <ecd868f9-5877-63ea-7d3b-504147489b61@tronnes.org>
Date:   Thu, 25 Feb 2021 19:06:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225095825.6196.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 25.02.2021 10.58, skrev Peter Stuge:
> Hi Noralf,
> 
> Noralf Trønnes wrote:
>> The driver supports a one bit monochrome transfer format: R1. This is not
>> implemented in the gadget driver. It is added in preparation for future
>> monochrome e-ink displays.
> 
> I forgot, but I have a two-tone (black/red) e-ink display here, and I
> also have a 3-bpp RGB TFT display.
> 
> Should we add maybe R2 and R3? (or R3/R8 for number of colours?)
> 
> I'm particularly considering the 3-bpp RGB panel for GUD use now, and
> while it will surely work with say a 16-bit RGB mode many bits will
> be wasted in the process.
> 
> What are your thoughts? Would you take a patch for that now, later, never?
> 

I've been anticipating the need for more formats, but I didn't want to
add them without having a user. Otherwise I could end up adding stuff
that would never be used. If you can test, there's no problem adding
support for more formats now.

The R1 name is derived from DRM_FORMAT_R8 which is a 8 bit monochrome
(or one color channel) format.

Linux has these one byte color pixel formats currently defined:

/* color index */
#define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C */

/* 8 bpp Red */
#define DRM_FORMAT_R8		fourcc_code('R', '8', ' ', ' ') /* [7:0] R */

/* 8 bpp RGB */
#define DRM_FORMAT_RGB332	fourcc_code('R', 'G', 'B', '8') /* [7:0] R:G:B
3:3:2 */
#define DRM_FORMAT_BGR233	fourcc_code('B', 'G', 'R', '8') /* [7:0] B:G:R
2:3:3 */

And these two color formats:

/* 16 bpp RG */
#define DRM_FORMAT_RG88		fourcc_code('R', 'G', '8', '8') /* [15:0] R:G
8:8 little endian */
#define DRM_FORMAT_GR88		fourcc_code('G', 'R', '8', '8') /* [15:0] G:R
8:8 little endian */

/* 32 bpp RG */
#define DRM_FORMAT_RG1616	fourcc_code('R', 'G', '3', '2') /* [31:0] R:G
16:16 little endian */
#define DRM_FORMAT_GR1616	fourcc_code('G', 'R', '3', '2') /* [31:0] G:R
16:16 little endian */


Building on that I would define a 2 bpp RG format like this in the driver:

static const struct drm_format_info gud_drm_format_rg11 = {
	.format = GUD_DRM_FORMAT_RG11,
	.num_planes = 1,
	.char_per_block = { 1, 0, 0 },
	.block_w = { 4, 0, 0 }, /* 4 pixels per block/byte */
	.block_h = { 1, 0, 0 },
	.hsub = 1,
	.vsub = 1,
};

And a 3 bpp RGB format like this:

static const struct drm_format_info gud_drm_format_rgb111 = {
	.format = GUD_DRM_FORMAT_RGB111,
	.num_planes = 1,
	.char_per_block = { 1, 0, 0 },
	.block_w = { 2, 0, 0 }, /* 2 pixels per block/byte */
	.block_h = { 1, 0, 0 },
	.hsub = 1,
	.vsub = 1,
};

The MIPI DBI standard defines 2 ways to transmit 2x 3-bpp pixels in one
byte (X=pad bit):
- Option 1: X  X  R1 G1 B1 R2 G2 B2
- Option 2: X  R1 G1 B1 X  R2 G2 B2

So maybe we should have GUD_DRM_FORMAT_RGB111_OPTION1 and
GUD_DRM_FORMAT_RGB111_OPTION2?
Or just use option 2 and let the display fix it up if needed?

What format does your 3 bpp display use?

And then something like this for the conversion function:

static size_t gud_xrgb8888_to_color(u8 *dst, const struct
drm_format_info *format,
				    u32 *src, struct drm_framebuffer *fb,
				    struct drm_rect *rect)
{
	unsigned int block_width = drm_format_info_block_width(format, 0);
	unsigned int x, y, width, height;
	u8 r, g, b, *block = dst; /* Assign to silence compiler warning */
	size_t len;

	WARN_ON_ONCE(format->char_per_block[0] != 1);

	/* Start on a byte boundary */
	rect->x1 = ALIGN_DOWN(rect->x1, block_width);
	width = drm_rect_width(rect);
	height = drm_rect_height(rect);
	len = drm_format_info_min_pitch(format, 0, width) * height;

	for (y = 0; y < height; y++) {
		for (x = 0; x < width; x++) {
			if (!(x % block_width)) {
				block = dst++;
				*block = 0;
			}

			/* r,g,b are bytes so no need to mask out anything explicitly */
			r = *src >> 16;
			g = *src >> 8;
			b = *src++;

			switch (format->format) {
			case GUD_DRM_FORMAT_RG11:
				*block <<= 2;
				*block |= ((r >> 7) << 1) | (g >> 7);
				break;
			case GUD_DRM_FORMAT_RGB111_OPTION1:
				*block <<= 3;
				*block |= ((r >> 7) << 2) | ((g >> 7) << 1) | (b >> 7);
				break;
			case GUD_DRM_FORMAT_RGB111_OPTION2:
				*block <<= 4;
				*block |= ((r >> 7) << 2) | ((g >> 7) << 1) | (b >> 7);
				break;
			default:
				WARN_ON_ONCE(1);
				return len;
			};
		}
	}

	return len;
}

Noralf.
