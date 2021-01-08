Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA4D2EEBFB
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 04:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbhAHDoE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 22:44:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbhAHDoE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jan 2021 22:44:04 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC7CC0612F4
        for <linux-usb@vger.kernel.org>; Thu,  7 Jan 2021 19:43:23 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id b9so12821431ejy.0
        for <linux-usb@vger.kernel.org>; Thu, 07 Jan 2021 19:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p2m6LtSdXslT5k/jlieRoXHeU0l2jufsh23Ksbl5Of8=;
        b=UMKxq6Dohmlt9YeOlCbg8vTv7eGJOT720rswvrldFMHxAYmsDqOOPWNRZxmBpIa9UL
         l+eDJ0B0/p3ciKkD91YBCdftFJ7q3B7GBMqDyaVqfhf8u0hg4WBpYstCoKaL9bsnCwuu
         N3j59NuaVccGldKAp19X+tRMcXdAfldfHtJqjj6YHhNex1Vq0QTEAY/NVtCAwWv2IZpP
         LkWD3PZQ6pnWsikKbwUwwZA8Wdz7OrplOAQrd38cDhkGqCHh4S6ygg6asyOb3l5U+Xca
         aEJjfBVDiC+U8CaWRmtIvKPnNCnbKOnp/sP9Tizv9AUk7CwkFwY4H/dNgv9GbsazHEe/
         /tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p2m6LtSdXslT5k/jlieRoXHeU0l2jufsh23Ksbl5Of8=;
        b=F0cvl2fXfnOFj5UfpoUI+cZ75vy669Iayb0FlNZ0FuTNZdX5Rz2ahdFG459CDqi9KS
         /nPRPOMzUxGr/JkIOPMr981uaA0c8rLJV9t5SxOwQHsOep0/Jor6qDxLQcZ421lygWFs
         0IVqS9REzXiTmTM2DPgCICAhETo+AfrICI2hj+HTHAe47r/L2ImIAUcILO32/4BgS9f0
         pyjN26V8dPqlAhhfZOl9yAsQlQvTd+V8XulW3LetH6oLtw2kFFLcMj1N567RCGE6Za47
         oMjMaRP4Gc1mYAy+wpsJlbJzCeEaY3SzVp5ZVXJof+CoKAtlXzMljOssCqGfN59U5BAb
         Rtbg==
X-Gm-Message-State: AOAM530xvNNU/AtshTrK7xqP1UrOER5lw4ui0J/CsAzz7Z3XvTCSqbV9
        to4kRn1TF1KTHO+8hLjpiIppMyDXmXCpf5SmyuWeYw==
X-Google-Smtp-Source: ABdhPJxYfAO4pfWtdqKG45EzFwZM+OurmPA5gFx5pFHUEALLGBD6B8wOWjqGxKCTMZkdvZ4h46g7gHIPRpmEbj78Nl4=
X-Received: by 2002:a17:906:1a4e:: with SMTP id j14mr1294526ejf.507.1610077402250;
 Thu, 07 Jan 2021 19:43:22 -0800 (PST)
MIME-Version: 1.0
References: <20210107090604.299270-1-albertccwang@google.com>
 <X/bZbluYJ0syB/Do@kroah.com> <20210108021642.GA4672@b29397-desktop>
In-Reply-To: <20210108021642.GA4672@b29397-desktop>
From:   Albert Wang <albertccwang@google.com>
Date:   Fri, 8 Jan 2021 11:43:11 +0800
Message-ID: <CANqn-rjVZRW+Y+_CMPJKBTi83VwSHV+Ow2k0AgooHRaKJozY6w@mail.gmail.com>
Subject: Re: [PATCH] Revert "usb: gadget: Quieten gadget config message"
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, balbi@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Usually, the developer him(her)self wants to read it to know if current
> USB gadget enumerated and what speed is recognized, reading from the
> console by eyes is the quickest way. Without this message, there is no
> any messages when the USB gadget connects to host.
Yes, especially when enumeration USB3 failed then downgrade to USB2.

> If enable debug message, there are too many messages,
This is the reason why it is not a good solution, when I just need to
confirm what the enumeration result is.

--
Thanks,
Albert

On Fri, Jan 8, 2021 at 10:16 AM Peter Chen <hzpeterchen@gmail.com> wrote:
>
> On 21-01-07 10:50:38, Greg KH wrote:
> > On Thu, Jan 07, 2021 at 09:06:04AM +0000, Albert Wang wrote:
> > > This reverts commit 1cbfb8c4f62d667f6b8b3948949737edb92992cc.
> > >
> > > The log of USB enumeration result is a useful log and only occupies
> > > one line especially when USB3 enumeration failed and then downgrade
> > > to USB2.
> > >
> > > Signed-off-by: Albert Wang <albertccwang@google.com>
> > > ---
> > >  drivers/usb/gadget/composite.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> > > index c6d455f2bb92..5b0d6103a63d 100644
> > > --- a/drivers/usb/gadget/composite.c
> > > +++ b/drivers/usb/gadget/composite.c
> > > @@ -840,9 +840,9 @@ static int set_config(struct usb_composite_dev *cdev,
> > >             result = 0;
> > >     }
> > >
> > > -   DBG(cdev, "%s config #%d: %s\n",
> > > -       usb_speed_string(gadget->speed),
> > > -       number, c ? c->label : "unconfigured");
> > > +   INFO(cdev, "%s config #%d: %s\n",
> > > +        usb_speed_string(gadget->speed),
> > > +        number, c ? c->label : "unconfigured");
> >
> > When everything is working properly, the kernel should be quiet.  If you
> > have to see this message, you can turn it on at runtime, as Felipe
> > pointed out, to enable it for your system.  But it's not a good default
> > thing to have.
>
> For most production kernel (or kernel ready for customers), it may not enable
> CONFIG_DYNAMIC_DEBUG.
>
> >
> > What do you need to see this message for?  What tool relies on it?  Who
> > reads it?
> >
>
> Usually, the developer him(her)self wants to read it to know if current
> USB gadget enumerated and what speed is recognized, reading from the
> console by eyes is the quickest way. Without this message, there is no
> any messages when the USB gadget connects to host.
>
> If enable debug message, there are too many messages, but I think most
> developers may only need one information message to know if enumeration
> is established correctly.
>
> --
>
> Thanks,
> Peter Chen
>
