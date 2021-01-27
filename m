Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9303B3060E3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 17:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343545AbhA0QUq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 11:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343931AbhA0QUG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jan 2021 11:20:06 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B656CC061573
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 08:19:20 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id c128so2182792wme.2
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 08:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+s/XXTuz5XeA9DDfXnC/9CAtWS/ZHZWZMgPo4FrMyhg=;
        b=Qq1twnJ7124IZlB9N1ytiodVfFHYnJz86YvKmIJuGuuxiS6caLVEixK6AEqKw4R59X
         0d+Hd+24FjDQsouwYWcIm17Cn3OGTs45S9cVgxvO1qU+swRXVpmWxSrf92KY8kHXAr3V
         VSy0ujH7o7T+vnpPFYeCsQ2aqN8YsPAsBAi/xPIaaOQdAwNAfgJLcFaQUmGglkzXLsZT
         x36h/SDmTuxw/WmXlD1K2CPWvfl7IMSYuBHONpvP/Z2NgCRd6vX+5BxPBVR6pF/RxfQL
         stNuBInD0JNvMj/4PV7pgfLMgKgpz0gXI5QSejAHXs+lAk7ZTJWcy8erspbG7MV33x/c
         4S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+s/XXTuz5XeA9DDfXnC/9CAtWS/ZHZWZMgPo4FrMyhg=;
        b=OpjNAUA7/denB7LqiYadhHjJZsPGS28YZNenUvgb9YZTuf92QYHJkR+UmHu6R5NAq3
         n3VdGxNaZ//sYbS0QxAaWdjhHnDBBvDe6CbldpLS67m2EdpWaJb7qFPoVDUpv+whIBAu
         Vnj8bbe4I5JOdIxg7eg8pNRDUVX80ui4zmMI6UXnUApo/kb+LmKhzSlE8X8Gvpqk4Ijk
         yw90dKjJMDIu6hnRMeVvrsBaMfQ2zgFcQhbCVwhs8dS+4gLk5re5zro7lVlikLaxM0dn
         UnvljYWAWQ0NufFzOn77Cm/KSBQFLgVYAo7pwHV+dSYShGwCEYijqcEo2yPLWz5li/2Y
         INYQ==
X-Gm-Message-State: AOAM533n2VoF3ywOXyca2FbnG0uffBl6rhqFvPrrsoV4XoYs68VL2byu
        t76GALzJiBnKLVjNS3npEwuBZA==
X-Google-Smtp-Source: ABdhPJyRzMkY4N21FTxAozFb01rwEKCUtFPql1SmOVEjUr37g82KnWDz+g+pK3VEcauv8gEfnTqi6A==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr4882597wmb.14.1611764359458;
        Wed, 27 Jan 2021 08:19:19 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id x1sm3136271wmi.14.2021.01.27.08.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 08:19:18 -0800 (PST)
Date:   Wed, 27 Jan 2021 16:19:16 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 01/12] thunderbolt: dma_port: Remove unused variable 'ret'
Message-ID: <20210127161916.GL4903@dell>
References: <20210127112554.3770172-1-lee.jones@linaro.org>
 <20210127112554.3770172-2-lee.jones@linaro.org>
 <CAHp75VdnvG75bTZ9Zqpn=pm0_KNwK0GGBGGjZv1DpSY-6Ef_Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdnvG75bTZ9Zqpn=pm0_KNwK0GGBGGjZv1DpSY-6Ef_Xw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 27 Jan 2021, Andy Shevchenko wrote:

> On Wednesday, January 27, 2021, Lee Jones <lee.jones@linaro.org> wrote:
> 
> > Fixes the following W=1 kernel build warning(s):
> >
> >  drivers/thunderbolt/dma_port.c: In function ‘dma_port_flash_write_block’:
> >  drivers/thunderbolt/dma_port.c:331:6: warning: variable ‘ret’ set but
> > not used [-Wunused-but-set-variable]
> >
> >
> Is it scripted somehow?

A script opens up the file on the warning line.

The patch is hand-written.

> Because I am not sure we are okay to simply drop the assignment.

I've been careful not to change the semantics of the code.

The return value has never been checked since the driver's inception 4
years ago.

However, if this is an oversight and the intention was to check the
value and error-out during a failure condition, I can make that
happen.

I would need a nod from the author before I make such a change.

> > Cc: Andreas Noever <andreas.noever@gmail.com>
> > Cc: Michael Jamet <michael.jamet@intel.com>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/thunderbolt/dma_port.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/thunderbolt/dma_port.c b/drivers/thunderbolt/dma_
> > port.c
> > index 847dd07a7b172..5aced91e17dc4 100644
> > --- a/drivers/thunderbolt/dma_port.c
> > +++ b/drivers/thunderbolt/dma_port.c
> > @@ -328,13 +328,12 @@ static int dma_port_flash_write_block(struct
> > tb_dma_port *dma, u32 address,
> >  {
> >         struct tb_switch *sw = dma->sw;
> >         u32 in, dwaddress, dwords;
> > -       int ret;
> >
> >         dwords = size / 4;
> >
> >         /* Write the block to MAIL_DATA registers */
> > -       ret = dma_port_write(sw->tb->ctl, buf, tb_route(sw), dma->port,
> > -                           dma->base + MAIL_DATA, dwords,
> > DMA_PORT_TIMEOUT);
> > +       dma_port_write(sw->tb->ctl, buf, tb_route(sw), dma->port,
> > +                      dma->base + MAIL_DATA, dwords, DMA_PORT_TIMEOUT);
> >
> >         in = MAIL_IN_CMD_FLASH_WRITE << MAIL_IN_CMD_SHIFT;
> >
> >
> >
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
