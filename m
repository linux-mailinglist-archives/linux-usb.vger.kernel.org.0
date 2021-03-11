Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055623380FC
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 23:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhCKW6Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 17:58:24 -0500
Received: from foo.stuge.se ([212.116.89.98]:41464 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229441AbhCKW5z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 17:57:55 -0500
Received: (qmail 2722 invoked by uid 1000); 11 Mar 2021 22:57:51 -0000
Message-ID: <20210311225751.2721.qmail@stuge.se>
Date:   Thu, 11 Mar 2021 22:57:51 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Ilia Mirkin <imirkin@alum.mit.edu>
Cc:     hudson@trmm.net, markus@raatikainen.cc,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-usb@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>, th020394@gmail.com,
        lkundrak@v3.sk, pontus.fuchs@gmail.com,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
References: <20210310045544.28961.qmail@stuge.se>
 <1894f3f7-bd1d-493e-8d7f-8c10917da51b@tronnes.org>
 <20210311144839.29454.qmail@stuge.se>
 <04a86207-325c-8170-6692-a87ec3b0fe4c@tronnes.org>
 <20210311200226.1166.qmail@stuge.se>
 <CAKb7UvihLX0hgBOP3VBG7O+atwZcUVCPVuBdfmDMpg0NjXe-cQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKb7UvihLX0hgBOP3VBG7O+atwZcUVCPVuBdfmDMpg0NjXe-cQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ilia Mirkin wrote:
> > > #define DRM_FORMAT_XRGB8888   fourcc_code('X', 'R', '2', '4') /* [31:0]
> > > x:R:G:B 8:8:8:8 little endian */
> >
> > Okay, "[31:0] x:R:G:B 8:8:8:8" can certainly mean
> > [31:24]=x [23:16]=R [15:8]=G [7:0]=B, which when stored "little endian"
> > becomes B G R X in memory, for which your pix32 code is correct.
> >
> > That's the reverse *memory* layout of what the name says :)
> 
> The definition of the formats is memory layout in little endian.

To clarify, my new (hopefully correct?) understanding is this:

XRGB8888 does *not* mean that address 0=X, 1=R, 2=G, 3=B, but that
the most significant byte in a packed XRGB8888 32-bit integer is X
and the least significant byte is B, and that this is the case both
on LE and BE machines.

I previously thought that XRGB8888 indicated the memory byte order of
components being X R G B regardless of machine endianess, but now
understand XRGB to mean the MSB..LSB order of component bytes within
the 32-bit integer, as seen by software, not the order of bytes in memory.


> The definition you see is of a 32-bit packed little-endian integer,
> which is a fixed memory layout.

In the header definition I'm not completely sure what the "little endian"
means - I guess it refers to how the 32-bit integer will be stored in memory,
but it could also refer to the order of component packing within.

Noralf's code and testing and also what fbset tells me seems to support
this understanding, at least on LE machines.


> Now, if you're on an actual big-endian platform, and you want to
> accept big-endian-packed formats, there's a bit of unpleasantness that
> goes on.

In the particular case of XRGB8888 that Noralf has implemented and
I've tested every pixel is translated "manually" anyway; each
component byte is downconverted to a single bit, but this use case
is mostly for smaller resolutions, so no too big deal.


> I'm not sure why you guys were talking about BE in the first place,

I was worried that the translation didn't consider endianess.

Noralf, looking at the 3/3 patch again now, drm_fb_swab() gets called
on BE when format == fb->format, but does it also need to be called
on BE they are different, or will circumstances be such that it's
never neccessary then?


Thanks and sorry if I'm confusing things needlessly

//Peter
