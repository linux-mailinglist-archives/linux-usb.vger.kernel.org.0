Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E677337A98
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 18:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhCKRQg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 12:16:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbhCKRQ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 12:16:28 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7678FC061574
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 09:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=j1FzFZM9+A16MgEux0f22T9rdxqzQ+p4UFH4JwhMF2w=; b=n3ZFeSD2rrBzDpAWHUHOhL0SHa
        rszfiDx9KcaDStlTXvsBHgy+Gr+Iu/ofzFGBBcakELMYsmsFpAuwT0EmYfHLDTdjvez9sNM9kxP2S
        L2bPlqlIDy5zqajlumeChfL6UOcEHmjAaaBJMDy6BDVG1Urm0sfL0PfgT29zhyxQzoCooV6596yIE
        Opu/AUOXHS4o8IK/QbVqwsIhyLhiF5Eevn0l1wM0pqraeJr91v560Gp6Mb/kyuuHFCVSVq+xtyr59
        MrPJ0vlmH8ZAjTv4T+xo4Y+7PPf2I9q9e8aLISoA5ctsUc+vpFNP/n4x8boy1+RsfalOe6sdIoeRu
        QkjeTGCQ==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=49992)
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lKOvB-0007gW-Q4; Thu, 11 Mar 2021 18:16:25 +0100
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     hudson@trmm.net, markus@raatikainen.cc,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        sam@ravnborg.org
References: <20210310045544.28961.qmail@stuge.se>
 <1894f3f7-bd1d-493e-8d7f-8c10917da51b@tronnes.org>
 <20210311144839.29454.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <04a86207-325c-8170-6692-a87ec3b0fe4c@tronnes.org>
Date:   Thu, 11 Mar 2021 18:16:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210311144839.29454.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 11.03.2021 15.48, skrev Peter Stuge:
> Noralf Trønnes wrote:
>>> I didn't receive the expected bits/bytes for RGB111 on the bulk endpoint,
>>> I think because of how components were extracted in gud_xrgb8888_to_color().
>>>
>>> Changing to the following gets me the expected (X R1 G1 B1 X R2 G2 B2) bytes:
>>>
>>> 			r = (*pix32 >> 8) & 0xff;
>>> 			g = (*pix32 >> 16) & 0xff;
>>> 			b = (*pix32++ >> 24) & 0xff;
>>
>> We're accessing the whole word here through pix32, no byte access, so
>> endianess doesn't come into play.
> 
> Endianness matters because parts of pix32 are used.
> 

This code:

#include <stdio.h>
#include <stdint.h>

void main()
{
	volatile uint32_t endian = 0x01234567;
	uint32_t v = 0xaabbccdd;
	uint32_t *pix32 = &v;
	uint8_t r, g, b, *p;

	r = *pix32 >> 16;
	g = *pix32 >> 8;
	b = *pix32++;

	printf("xrgb8888=%08x\n", v);

	printf("32-bit access:\n");
	printf("r=%02x\n", r);
	printf("g=%02x\n", g);
	printf("b=%02x\n", b);

	printf("Byte access on %s:\n", (*((uint8_t*)(&endian))) == 0x67 ? "LE"
: "BE");
	p = (uint8_t *)&v;
	printf("r=%02x\n", p[1]);
	printf("g=%02x\n", p[2]);
	printf("b=%02x\n", p[3]);
}

prints:

xrgb8888=aabbccdd
32-bit access:
r=bb
g=cc
b=dd
Byte access on LE:
r=cc
g=bb
b=aa

> Software only sees bytes (or larger) because addresses are byte granular,
> but must pay attention to the bit order when dealing with smaller values
> inside larger memory accesses.
> 
> Given 4 bytes of memory {0x11, 0x22, 0x33, 0x44} at address A, both LE
> and BE machines appear the same when accessing individual bytes, but with
> uint32_t *a32 = A then a32[0] is 0x44332211 on LE and 0x11223344 on BE.
> 
> 
> Hence the question: What does DRM promise about the XRGB8888 mode?
> 

That it's a 32-bit value. From include/uapi/drm/drm_fourcc.h:

/* 32 bpp RGB */
#define DRM_FORMAT_XRGB8888	fourcc_code('X', 'R', '2', '4') /* [31:0]
x:R:G:B 8:8:8:8 little endian */

If a raw buffer was passed from a BE to an LE machine, there would be
problems because of how the value is stored, but here it's the same
endianness in userspace and kernel space.

There is code in gud_prep_flush() that handles a BE host with a
multibyte format:

	} else if (gud_is_big_endian() && format->cpp[0] > 1) {
		drm_fb_swab(buf, vaddr, fb, rect, !import_attach);

In this case we can't just pass on the raw buffer to the device since
the protocol is LE, and thus have to swap the bytes to match up how
they're stored in memory on the device.

I'm not loosing any of the colors when running modetest. This is the
test image that modetest uses and it comes through just like that:
https://commons.wikimedia.org/wiki/File:SMPTE_Color_Bars.svg

Noralf.

> Is it guaranteed that the first byte in memory is always unused, the second
> represents red, the third green and the fourth blue (endianess agnostic)?
> I'd expect this and I guess that it is the case, but I don't know DRM?
> 
> Or is it instead guaranteed that when accessed natively as one 32-bit
> value the blue component is always in the most significant byte (endianess
> abstracted, always LE in memory) or always in the least significant byte
> (endianess abstracted, always BE in memory)?
> This would be annoying for userspace, but well, it's possible.
> 
> In the abstracted (latter) case pix32 would work, but could still be
> questioned on style, and in fact, pix32 didn't work for me, so at a
> minimum the byte order would be the reverse.
> 
> 
> In the agnostic (former) case your code was correct for BE and mine
> for LE, but I'd then suggest using a u8 * to both work correctly
> everywhere and be obvious.
> 
> 
>> This change will flip r and b, which gives: XRGB8888 -> XBGR1111
> 
> The old code was:
> 			r = *pix32 >> 16;
> 			g = *pix32 >> 8;
> 			b = *pix32++;
> 
> On my LE machine this set r to the third byte (G), g to the second (R)
> and b to the first (X), explaining the color confusion that I saw.
> 
> 
>> BGR is a common thing on controllers, are you sure yours are set to RGB
>> and not BGR?
> 
> Yes; I've verified that my display takes red in MSB both in its data
> sheet and by writing raw bits to it on a system without the gud driver.
> 
> 
>> And the 0xff masking isn't necessary since we're assigning to a byte, right?
> 
> Not strictly neccessary but I like to do it anyway, both to be explicit
> and also to ensure that the compiler will never sign extend, if types
> are changed or if values become treated as signed and/or larger by the
> compiler because the code is changed.
> 
> It's frustrating to debug such unexpected changes in behavior due to
> a type change or calculation change, but if you find it too defensive
> then go ahead and remove it, if pix32 does stay.
> 
> 
>> I haven't got a native R1G1B1 display so I have emulated and I do get
>> the expected colors. This is the conversion function I use on the device
>> which I think is correct:
>>
>> static size_t rgb111_to_rgb565(uint16_t *dst, uint8_t *src,
>>                                uint16_t src_width, uint16_t src_height)
>> {
>>     uint8_t rgb111, val = 0;
>>     size_t len = 0;
>>
>>     for (uint16_t y = 0; y < src_height; y++) {
>>         for (uint16_t x = 0; x < src_width; x++) {
>>             if (!(x % 2))
>>                 val = *src++;
>>             rgb111 = val >> 4;
>>             *dst++ = ((rgb111 & 0x04) << 13) | ((rgb111 & 0x02) << 9) |
>>                      ((rgb111 & 0x01) << 4);
> 
> I'm afraid this isn't correct. Two wrongs end up cancelling each other
> out and it's not so obvious because the destination has symmetric (565)
> components.
> 
> If you were to convert to xrgb8888 in the same way I think you'd also
> see some color confusion, and in any case blue is getting lost already
> in gud_xrgb8888_to_color() on LE.
> 
> 
> //Peter
> 
