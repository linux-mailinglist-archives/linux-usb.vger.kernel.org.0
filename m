Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4076D337FBB
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 22:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhCKVhg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 16:37:36 -0500
Received: from mail-io1-f44.google.com ([209.85.166.44]:44763 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbhCKVhH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 16:37:07 -0500
Received: by mail-io1-f44.google.com with SMTP id 81so23528019iou.11
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 13:37:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=88YoBu3IChQNr/V3l4UggEOXALs8K2tk4zELlhVMgFY=;
        b=Le+FAwcpdwzlVoAx2dH9QBpkC9YEwdht0HZpCnUR0D7TNpciwbILHb9nxU1h9RsMdJ
         0TRw6Lg7k519et4pVljrvOnXiFpxJrrOjt+aozM7kK26AbXoZJHTHeOS2cjtSMWx4nh4
         H/cIrIa2gOgG2uyUHYBbJDJ/mQBodIuH6rqtxDS0rROGxyKSKR7embNXx4CxcBB8Q1ZC
         u0VUWnEyClH5atWmIL9H3Xil8q2prsrmnR6k9Cnnu3YowAjHirdfwRQGeGcdIQnebeRu
         86Lq0rV5pQPx6rYJ2x7mZCeEXwL2shTbW+M3Poz668xpCTReKkR3YhywNlDgMV8OB3lS
         Q3Rg==
X-Gm-Message-State: AOAM5301WiHB5x7QZ9kW9ylFNj48pptblMSMEbm1xSGlC8ACcwLZEcnW
        dxPCxvLp0iKp4FZ0VtwBdisOo6j5tDvS24xDE8c=
X-Google-Smtp-Source: ABdhPJw+YTm5PRWrc1GuPKUsimfEN4Wp8nCWrWwvqjSef29BAoUxRTJMC+nYrrWkOEw2ou0D9TVZCg7ED8EPPW+sLhE=
X-Received: by 2002:a02:7419:: with SMTP id o25mr5589952jac.100.1615498627003;
 Thu, 11 Mar 2021 13:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20210310045544.28961.qmail@stuge.se> <1894f3f7-bd1d-493e-8d7f-8c10917da51b@tronnes.org>
 <20210311144839.29454.qmail@stuge.se> <04a86207-325c-8170-6692-a87ec3b0fe4c@tronnes.org>
 <20210311200226.1166.qmail@stuge.se>
In-Reply-To: <20210311200226.1166.qmail@stuge.se>
From:   Ilia Mirkin <imirkin@alum.mit.edu>
Date:   Thu, 11 Mar 2021 16:36:56 -0500
Message-ID: <CAKb7UvihLX0hgBOP3VBG7O+atwZcUVCPVuBdfmDMpg0NjXe-cQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        hudson@trmm.net, markus@raatikainen.cc,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-usb@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>, th020394@gmail.com,
        lkundrak@v3.sk, pontus.fuchs@gmail.com,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 11, 2021 at 3:02 PM Peter Stuge <peter@stuge.se> wrote:
> > > Hence the question: What does DRM promise about the XRGB8888 mode?
> >
> > That it's a 32-bit value. From include/uapi/drm/drm_fourcc.h:
> >
> > /* 32 bpp RGB */
> > #define DRM_FORMAT_XRGB8888   fourcc_code('X', 'R', '2', '4') /* [31:0]
> > x:R:G:B 8:8:8:8 little endian */
>
> Okay, "[31:0] x:R:G:B 8:8:8:8" can certainly mean
> [31:24]=x [23:16]=R [15:8]=G [7:0]=B, which when stored "little endian"
> becomes B G R X in memory, for which your pix32 code is correct.
>
> That's the reverse *memory* layout of what the name says :) but yes,
> the name then matches the representation seen by software. That's the
> "abstracted" case that I didn't expect, because I thought the name was
> refering to memory layout and because I was thinking about how traditional
> graphics adapter video memory has the R component at the lower
> address, at least in early linear modes.

The definition of the formats is memory layout in little endian. The
definition you see is of a 32-bit packed little-endian integer, which
is a fixed memory layout.

Now, if you're on an actual big-endian platform, and you want to
accept big-endian-packed formats, there's a bit of unpleasantness that
goes on. Basically there are two options:

1. Ignore the above definition and interpret the formats as
*big-endian* layouts. This is what nouveau and radeon do. They also
don't support AddFB2 (which is what allows supplying a format) -- only
AddFB which just has depth (and bpp). That's fine for nouveau and
radeon because the relevant userspace just uses AddFB, and knows what
the drivers want, so it all works out.

2. Comply with the above definition and set
dev->mode_config.quirk_addfb_prefer_host_byte_order to false. This
loses you native host packing of RGB565/etc, since they're just not
defined as formats. There's a DRM_FORMAT_BIG_ENDIAN bit but it's not
properly supported for anything but the 8888 formats.

I'm not sure why you guys were talking about BE in the first place,
but since this is a topic I've looked into (in the context of moving
nouveau from 1 to 2 - but that can't happen due to the reduced format
availability), figured I'd share some of the current sad state.

Cheers,

  -ilia
