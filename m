Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2175233761B
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 15:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbhCKOtD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 09:49:03 -0500
Received: from foo.stuge.se ([212.116.89.98]:41048 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233698AbhCKOsp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 09:48:45 -0500
Received: (qmail 29455 invoked by uid 1000); 11 Mar 2021 14:48:39 -0000
Message-ID: <20210311144839.29454.qmail@stuge.se>
Date:   Thu, 11 Mar 2021 14:48:38 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     hudson@trmm.net, markus@raatikainen.cc,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        sam@ravnborg.org
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
References: <20210310045544.28961.qmail@stuge.se>
 <1894f3f7-bd1d-493e-8d7f-8c10917da51b@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1894f3f7-bd1d-493e-8d7f-8c10917da51b@tronnes.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Noralf Trønnes wrote:
> > I didn't receive the expected bits/bytes for RGB111 on the bulk endpoint,
> > I think because of how components were extracted in gud_xrgb8888_to_color().
> > 
> > Changing to the following gets me the expected (X R1 G1 B1 X R2 G2 B2) bytes:
> > 
> > 			r = (*pix32 >> 8) & 0xff;
> > 			g = (*pix32 >> 16) & 0xff;
> > 			b = (*pix32++ >> 24) & 0xff;
> 
> We're accessing the whole word here through pix32, no byte access, so
> endianess doesn't come into play.

Endianness matters because parts of pix32 are used.

Software only sees bytes (or larger) because addresses are byte granular,
but must pay attention to the bit order when dealing with smaller values
inside larger memory accesses.

Given 4 bytes of memory {0x11, 0x22, 0x33, 0x44} at address A, both LE
and BE machines appear the same when accessing individual bytes, but with
uint32_t *a32 = A then a32[0] is 0x44332211 on LE and 0x11223344 on BE.


Hence the question: What does DRM promise about the XRGB8888 mode?

Is it guaranteed that the first byte in memory is always unused, the second
represents red, the third green and the fourth blue (endianess agnostic)?
I'd expect this and I guess that it is the case, but I don't know DRM?

Or is it instead guaranteed that when accessed natively as one 32-bit
value the blue component is always in the most significant byte (endianess
abstracted, always LE in memory) or always in the least significant byte
(endianess abstracted, always BE in memory)?
This would be annoying for userspace, but well, it's possible.

In the abstracted (latter) case pix32 would work, but could still be
questioned on style, and in fact, pix32 didn't work for me, so at a
minimum the byte order would be the reverse.


In the agnostic (former) case your code was correct for BE and mine
for LE, but I'd then suggest using a u8 * to both work correctly
everywhere and be obvious.


> This change will flip r and b, which gives: XRGB8888 -> XBGR1111

The old code was:
			r = *pix32 >> 16;
			g = *pix32 >> 8;
			b = *pix32++;

On my LE machine this set r to the third byte (G), g to the second (R)
and b to the first (X), explaining the color confusion that I saw.


> BGR is a common thing on controllers, are you sure yours are set to RGB
> and not BGR?

Yes; I've verified that my display takes red in MSB both in its data
sheet and by writing raw bits to it on a system without the gud driver.


> And the 0xff masking isn't necessary since we're assigning to a byte, right?

Not strictly neccessary but I like to do it anyway, both to be explicit
and also to ensure that the compiler will never sign extend, if types
are changed or if values become treated as signed and/or larger by the
compiler because the code is changed.

It's frustrating to debug such unexpected changes in behavior due to
a type change or calculation change, but if you find it too defensive
then go ahead and remove it, if pix32 does stay.


> I haven't got a native R1G1B1 display so I have emulated and I do get
> the expected colors. This is the conversion function I use on the device
> which I think is correct:
> 
> static size_t rgb111_to_rgb565(uint16_t *dst, uint8_t *src,
>                                uint16_t src_width, uint16_t src_height)
> {
>     uint8_t rgb111, val = 0;
>     size_t len = 0;
> 
>     for (uint16_t y = 0; y < src_height; y++) {
>         for (uint16_t x = 0; x < src_width; x++) {
>             if (!(x % 2))
>                 val = *src++;
>             rgb111 = val >> 4;
>             *dst++ = ((rgb111 & 0x04) << 13) | ((rgb111 & 0x02) << 9) |
>                      ((rgb111 & 0x01) << 4);

I'm afraid this isn't correct. Two wrongs end up cancelling each other
out and it's not so obvious because the destination has symmetric (565)
components.

If you were to convert to xrgb8888 in the same way I think you'd also
see some color confusion, and in any case blue is getting lost already
in gud_xrgb8888_to_color() on LE.


//Peter
