Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701C03258CC
	for <lists+linux-usb@lfdr.de>; Thu, 25 Feb 2021 22:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234521AbhBYVib (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Feb 2021 16:38:31 -0500
Received: from foo.stuge.se ([212.116.89.98]:45620 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234498AbhBYViS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Feb 2021 16:38:18 -0500
Received: (qmail 16533 invoked by uid 1000); 25 Feb 2021 21:37:29 -0000
Message-ID: <20210225213729.16532.qmail@stuge.se>
Date:   Thu, 25 Feb 2021 21:37:29 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     hudson@trmm.net, markus@raatikainen.cc,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        sam@ravnborg.org
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
 <20210225095825.6196.qmail@stuge.se>
 <ecd868f9-5877-63ea-7d3b-504147489b61@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecd868f9-5877-63ea-7d3b-504147489b61@tronnes.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Noralf Trønnes wrote:
> > I forgot, but I have a two-tone (black/red) e-ink display here, and I
> > also have a 3-bpp RGB TFT display.
> 
> I've been anticipating the need for more formats, but I didn't want to
> add them without having a user. Otherwise I could end up adding stuff
> that would never be used. If you can test, there's no problem adding
> support for more formats now.

That's great! I can't promise to to test the three-color (b/w/r) e-ink
but I'll prepare a test setup for the RGB-TFT on the weekend.


> Building on that I would define a 2 bpp RG format like this in the driver:
> 
> static const struct drm_format_info gud_drm_format_rg11 = {
> 	.format = GUD_DRM_FORMAT_RG11,
> 	.num_planes = 1,
> 	.char_per_block = { 1, 0, 0 },
> 	.block_w = { 4, 0, 0 }, /* 4 pixels per block/byte */
> 	.block_h = { 1, 0, 0 },
> 	.hsub = 1,
> 	.vsub = 1,
> };
> 
> And a 3 bpp RGB format like this:
> 
> static const struct drm_format_info gud_drm_format_rgb111 = {
> 	.format = GUD_DRM_FORMAT_RGB111,
> 	.num_planes = 1,
> 	.char_per_block = { 1, 0, 0 },
> 	.block_w = { 2, 0, 0 }, /* 2 pixels per block/byte */
> 	.block_h = { 1, 0, 0 },
> 	.hsub = 1,
> 	.vsub = 1,
> };

I can't really comment; I know next to nothing about the drm subsystem. :)


> The MIPI DBI standard defines 2 ways to transmit 2x 3-bpp pixels in one
> byte (X=pad bit):
> - Option 1: X  X  R1 G1 B1 R2 G2 B2
> - Option 2: X  R1 G1 B1 X  R2 G2 B2
> 
> So maybe we should have GUD_DRM_FORMAT_RGB111_OPTION1 and
> GUD_DRM_FORMAT_RGB111_OPTION2?
> Or just use option 2 and let the display fix it up if needed?

It would of course be lovely to be able to set up an automated DMA from
a USB endpoint to the panel in the device and not have to touch the data,
but that would require the DRM driver to support all the combinations,
which quickly becomes complicated.


> What format does your 3 bpp display use?

It supports three formats:

- R1 G1 B1 R2 G2 B2
- R1 G1 B1 X R2 G2 B2 X (your option 2)
- R1 R2 R3 (simulated monochrome, same data bit to all three subpixels)


> And then something like this for the conversion function:
> 
> static size_t gud_xrgb8888_to_color(u8 *dst, const struct

All right!


//Peter
