Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD49337EA5
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 21:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhCKUCp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 15:02:45 -0500
Received: from foo.stuge.se ([212.116.89.98]:41366 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229674AbhCKUCd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 15:02:33 -0500
Received: (qmail 1167 invoked by uid 1000); 11 Mar 2021 20:02:26 -0000
Message-ID: <20210311200226.1166.qmail@stuge.se>
Date:   Thu, 11 Mar 2021 20:02:26 +0000
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
 <20210311144839.29454.qmail@stuge.se>
 <04a86207-325c-8170-6692-a87ec3b0fe4c@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04a86207-325c-8170-6692-a87ec3b0fe4c@tronnes.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Noralf Trønnes wrote:
> > Endianness matters because parts of pix32 are used.
> 
> This code:
..
> prints:
> 
> xrgb8888=aabbccdd
> 32-bit access:
> r=bb
> g=cc
> b=dd
> Byte access on LE:
> r=cc
> g=bb
> b=aa

As expected, and:

xrgb8888=aabbccdd
32-bit access:
r=bb
g=cc
b=dd
Byte access on BE:
r=bb
g=cc
b=dd

I've done similar tests in the past and did another before my last mail.

We agree about endian effects. Apologies if I came across as overbearing!


> > Hence the question: What does DRM promise about the XRGB8888 mode?
> 
> That it's a 32-bit value. From include/uapi/drm/drm_fourcc.h:
> 
> /* 32 bpp RGB */
> #define DRM_FORMAT_XRGB8888	fourcc_code('X', 'R', '2', '4') /* [31:0]
> x:R:G:B 8:8:8:8 little endian */

Okay, "[31:0] x:R:G:B 8:8:8:8" can certainly mean
[31:24]=x [23:16]=R [15:8]=G [7:0]=B, which when stored "little endian"
becomes B G R X in memory, for which your pix32 code is correct.

That's the reverse *memory* layout of what the name says :) but yes,
the name then matches the representation seen by software. That's the
"abstracted" case that I didn't expect, because I thought the name was
refering to memory layout and because I was thinking about how traditional
graphics adapter video memory has the R component at the lower
address, at least in early linear modes.

I also didn't pay attention to the fbset output:

    rgba 8/16,8/8,8/0,0/0


With drm format describing software pixel representation and per the
fbset rgba description my test file was incorrect. I've recreated it
with B G R X bytes and it shows correctly with your pix32 code.

Sending data directly to the device without the gud driver uses
different data, so isn't actually a fair comparison, but I didn't
change the device at all now, and that still works.


> If a raw buffer was passed from a BE to an LE machine, there would be
> problems because of how the value is stored,

And swab would be required on a LE machine with a graphics adapter in
a mode with X R G B memory layout, or that system would just never
present XRGB8888 for that adapter/mode but perhaps something called
BGRX8888 instead? I see.


> but here it's the same endianness in userspace and kernel space.

Ack.


> There is code in gud_prep_flush() that handles a BE host with a
> multibyte format:
> 
> 	} else if (gud_is_big_endian() && format->cpp[0] > 1) {
> 		drm_fb_swab(buf, vaddr, fb, rect, !import_attach);
> 
> In this case we can't just pass on the raw buffer to the device since
> the protocol is LE, and thus have to swap the bytes to match up how
> they're stored in memory on the device.

Ack.


> I'm not loosing any of the colors when running modetest. This is the
> test image that modetest uses and it comes through just like that:
> https://commons.wikimedia.org/wiki/File:SMPTE_Color_Bars.svg

So your destination rgb565 buffer has a [15:11]=R [10:5]=G [4:0]=B
pixel format, which stores as B+G G+R in memory, as opposed to R+G G+B.
All right.


Thanks a lot for clearing up my misunderstanding of drm format names
and my endianess concerns!


//Peter
