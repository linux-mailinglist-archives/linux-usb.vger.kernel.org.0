Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB4649CB19
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 14:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240924AbiAZNnq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 08:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240816AbiAZNnq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 08:43:46 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C704C06173B
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 05:43:46 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id s9so37469700oib.11
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 05:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rr+l+3YPPwRTSEbBSweFMi0OELn7GiUo4k2tlyEVHMg=;
        b=gOIJcZXaXXQMP5TQQb3+a511e4PtdsQ+mmJSG5HyHtCG4zEeGZY46QtERskNdNO4AG
         amJ6cGABSzyoPLUjtVFjmBmvU5lNmEMjgJPfcRVgSD9MsMzNyqYu2jKO4EKQo3q+IXc4
         Goq+hZuKOFJV1atAg36DjpuXI4TnF12a5XCoqth0GTAq0sqbzrGE8nIKUqxZ/muFOdUy
         gDDvUxPWo70Xu6uuVQluRKNKsNBCnrRaFY4M+6CXlQNRkY3sSu7GnCshRm1+7/zuZgQF
         2qGOiwD6o+gysO7A1Cxz5aEKKEa/WC0y8avnGz6rNA6KPsvyD99/wqxdDAqNDZaqkQ8P
         exLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rr+l+3YPPwRTSEbBSweFMi0OELn7GiUo4k2tlyEVHMg=;
        b=FGaov+6iIQsFC9il0ArjPgk3cOlFtFFlfKQE5YUNxdM9KcHWoT2elf41SMxSWaRrF+
         4+Lmh/9I672d7Pvn/VA3m+3v8+3B1L2GgS6y4+StUO2JDSZU/tsE+WGXMsBE6sr4SXPc
         PQen76ZkDdcMtU/lQMKV+tXPyf2WRvZj0jXDSZMusSa7djBnC39wpf3arkes/yrh9Mst
         cqmnx+9aYXEsG8JnM0IsxYLj+QQRytCTspO1YRTYXJSS2CBzjnGBEXFdSuEs7j4bdAJu
         dnwN9vVwHsXoOmW6vJt72y24xmmKLoU1Ge+lRdHyyC+pHVOi+tUjG6sODRcIlMdCcy/C
         c1cA==
X-Gm-Message-State: AOAM533gXJgmwjmoGvw7mJszl8lW/JqkuhEWfGaSlf5MGCXQRAGURFMw
        nMsdIyh/7kYglWYlfbuuQKxExHpjZB1aGSN26DA=
X-Google-Smtp-Source: ABdhPJyqDlDcQjoH9Y85kXP9Ca5OzkgfO8On8e3cfSD141Kj/aycPtJRwaTSnTz10JO/eqXryWZxutuP1pfuv6MAdZ8=
X-Received: by 2002:a05:6808:128f:: with SMTP id a15mr3738643oiw.116.1643204623773;
 Wed, 26 Jan 2022 05:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
 <3bb113cd-fbf6-6898-6ae3-2f8cb8c64992@leemhuis.info> <YfE8nyH1lW/I8NTV@kroah.com>
 <CACjc_5o9eO5YTVt4jE7v1E9nirCwFMc1=Ub-jXSFCg1_8A2M-A@mail.gmail.com>
In-Reply-To: <CACjc_5o9eO5YTVt4jE7v1E9nirCwFMc1=Ub-jXSFCg1_8A2M-A@mail.gmail.com>
From:   Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Date:   Wed, 26 Jan 2022 10:43:17 -0300
Message-ID: <CACjc_5pmqLAo5X-Yj6Om9vvktR-0FN5SYgDxn=GvCn-yxcee+w@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget (atmel_usba_udc)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thorsten Leemhuis <regressions@leemhuis.info>,
        regressions@lists.linux.dev,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Cristian Birsan <cristian.birsan@microchip.com>,
        linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Jonas Bonn <jonas@norrbonn.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Wed, Jan 26, 2022 at 9:20 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sun, Dec 12, 2021 at 10:48:14AM +0100, Thorsten Leemhuis wrote:
> > [TLDR: adding this regression to regzbot; most of this mail is compiled
> > from a few templates paragraphs some of you might have seen already.]
> >
> > Hi, this is your Linux kernel regression tracker speaking.
> >
> > Top-posting for once, to make this easy accessible to everyone.
> >
> > Thanks for the report. BTW, if anyone like me wonders what the included
> > patch is about: it afaics is the revert of the patch causing the
> > problem. Anyway:
> >
> > To be sure this issue doesn't fall through the cracks unnoticed, I'm
> > adding it to regzbot, my Linux kernel regression tracking bot:
> >
> > #regzbot ^introduced 70a7f8be8598
> > #regzbot title usb: gadget: atmel: ethernet over USB Gadget not
> > recognized anymore after disconnect and reconnect
> > #regzbot ignore-activity
>
> How do I say "this isn't a regression, it's a broken board
> configuration" and get regzbot to stop tracking this?

I sent the logs to Cristian on Jan, 14, but I don't know if they were
helpful. The problem is pretty much reproducible here. I understand
that from the previously quoted specification sentence, the hardware
must perform VBUS sensing, and this is something I can confirm the
hardware is not capable of. But if Cristian cannot reproduce it in a
different SOC configured without a VBUS sensing pin, I can only hope
Microchip/Atmel will look into the issue. On my side, it seems like I
will have to maintain a patched kernel for this hardware.

So, let's move on.

> thanks,
>
> greg k-h

Best regards,
Marcelo.
