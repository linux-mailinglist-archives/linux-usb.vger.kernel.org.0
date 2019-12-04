Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D99DF112349
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 08:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfLDHIC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Dec 2019 02:08:02 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:34158 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfLDHIC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Dec 2019 02:08:02 -0500
Received: by mail-vk1-f193.google.com with SMTP id t184so1850591vka.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2019 23:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OnkkDqzzWZ7ko76SaJQtORbCXdve+uF2P+mzM2G6HOo=;
        b=iDEL9iS/EMPOok9afqUeURuVVBWQu2rgnp9u7NRyLxffysoGn/smQASezgGuQEGqmS
         /8UwFv7Nr9TwsZ3c+Sn4sdNe7BBdCIPTqOLBjutkMNnhAGUPakhlGvUiWDPiYgFthnlk
         GbkAPob+qPjb9GKbnKSLQUxix4i9d0ZTJrduo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OnkkDqzzWZ7ko76SaJQtORbCXdve+uF2P+mzM2G6HOo=;
        b=tSwhfTkphTOEwLrqkS6Cay8XE6GlD+HKxZb1W2RQkBR2KbEky/1srPJC8FlNVx4COQ
         iVp1QrSHLZhVw4Ykan8hKkDfcpIQJuwdWDLlzUnKe3tDMPaFyDOgWplAcyWHoncmUsbV
         5BCsC1uDyOuZbxJ7afmDDg4QDKJ4n9t3wmDw7TXRbDxzgrXWKjc6MzTZ/bxv1SX7J5pE
         Nu8Dy1oqsC+anox04nNHBj890df9vK6Fzlr9+leRzr044x3bASOsOSLd8vVUND/l50Ie
         qwa/0C8wt4iCA/bLJWNO/bOY+csI1Io4cDCmJomGbL2hoz+acYtQPjSyBpdEvH/2ssRu
         l+eg==
X-Gm-Message-State: APjAAAU866ltjHkvnxV/OUaC7susLL5Ji5pyETaF+q8DfkGPcm/MuJnm
        syW1n4KRLvuHKarXuaA92L5oTfGA82wE88bLtOusCA==
X-Google-Smtp-Source: APXvYqxMtDuWHWsIKqXE8KLvKaAuALmnb1dIz8TyrC1W4+0VCyLzJebseWTY1hSp0YU4qqoU9TqZ/pluQh0JsQvhQPU=
X-Received: by 2002:a1f:d904:: with SMTP id q4mr317337vkg.13.1575443281606;
 Tue, 03 Dec 2019 23:08:01 -0800 (PST)
MIME-Version: 1.0
References: <20191203101552.199339-1-ikjn@chromium.org> <Pine.LNX.4.44L0.1912031021120.1505-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912031021120.1505-100000@iolanthe.rowland.org>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Wed, 4 Dec 2019 15:07:50 +0800
Message-ID: <CAATdQgCNEyBjaFijBpWHnqtk90_17WbY2PhVoYSKKccPY3SxZQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: overridable hub bInterval by device node
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        JohanHovold <johan@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 3, 2019 at 11:23 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 3 Dec 2019, Ikjoon Jang wrote:
>
> > This patch enables hub device to override its own endpoint descriptor's
> > bInterval when the hub has a device node with "hub,interval" property.
> >
> > When we know reducing autosuspend delay for built-in HIDs is better for
> > power saving, we can reduce it to the optimal value. But if a parent hub
> > has a long bInterval, mouse lags a lot from more frequent autosuspend.
> > So this enables overriding bInterval for a hard wired hub device only
> > when we know that reduces the power consumption.
> >
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> > ---
> >  drivers/usb/core/config.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> > index 5f40117e68e7..95ec5af42a1c 100644
> > --- a/drivers/usb/core/config.c
> > +++ b/drivers/usb/core/config.c
> > @@ -6,6 +6,7 @@
> >  #include <linux/usb.h>
> >  #include <linux/usb/ch9.h>
> >  #include <linux/usb/hcd.h>
> > +#include <linux/usb/of.h>
> >  #include <linux/usb/quirks.h>
> >  #include <linux/module.h>
> >  #include <linux/slab.h>
> > @@ -257,6 +258,14 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno, int inum,
> >       memcpy(&endpoint->desc, d, n);
> >       INIT_LIST_HEAD(&endpoint->urb_list);
> >
> > +     /* device node property overrides bInterval */
> > +     if (usb_of_has_combined_node(to_usb_device(ddev))) {
> > +             u32 interval = 0;
>
> Coding style: there should be a blank line here.  Also, you don't need
> the "= 0" initializer.
>
> Otherwise okay.

Okay, I will fix that.
Thank you!

>
> Alan Stern
>
> > +             if (!of_property_read_u32(ddev->of_node, "hub,interval",
> > +                                 &interval))
> > +                     d->bInterval = min_t(u8, interval, 255);
> > +     }
> > +
> >       /*
> >        * Fix up bInterval values outside the legal range.
> >        * Use 10 or 8 ms if no proper value can be guessed.
>
