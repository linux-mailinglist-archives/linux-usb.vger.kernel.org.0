Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDFCF35D957
	for <lists+linux-usb@lfdr.de>; Tue, 13 Apr 2021 09:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240394AbhDMHwy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 03:52:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45312 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236569AbhDMHwt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Apr 2021 03:52:49 -0400
Received: from mail-ot1-f69.google.com ([209.85.210.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chris.chiu@canonical.com>)
        id 1lWDqU-0001Oe-Q9
        for linux-usb@vger.kernel.org; Tue, 13 Apr 2021 07:52:27 +0000
Received: by mail-ot1-f69.google.com with SMTP id c21so551027oto.18
        for <linux-usb@vger.kernel.org>; Tue, 13 Apr 2021 00:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ljXjuvz4Jv8aBpfldr3T9n0q0usWQY26/7yRTXdXMI4=;
        b=B3SAAby68Q/SQRIijYhUK3faQv1F0f7JzC+DE9eI/ukQk9QV64EtkKlWnA4JrHQ3qi
         3FnLjVv+F0obhopfrnrtXA8zp96mVF6mKUEhm3GB3FzzOitg1J8I+eld+CS/Mwp0824l
         P4kmGMuvXWEM+ZzkkZ8jEpcBbRWDXoRCFjigh7SUC9kZ81I6ujPki2PZajb849SQHF6v
         CnrtoaZg+De2RYSD9b8eHaDkOnRhGDcHyosE1PKnKHfkdDmdHGOV7kqcgIas+C7iubED
         GwUHUoYdATeS0c0bV0g25OxtRm42TMf+dzVxWB89wpfLxu0IV4KD0iikDjnTrWk/8Q6/
         h4MQ==
X-Gm-Message-State: AOAM531+kodV0wxCUQlAPNaOoAAWAllIvRm6OqmXHiDIEjaVGSnHTOnw
        wJx95sLw9BqQyOnt0qnWM/3kWofw1D+lLDDpKYJJfK/MueDWtoX7XWO35/qqkbYw/Jky/kk4XkG
        /X7jmAQ9/UjWZIqXNXa5MrfHOyKPNy7W+vN2i1UnAO6UdT/g1GqsxbQ==
X-Received: by 2002:a9d:5ae:: with SMTP id 43mr32422otd.347.1618300345623;
        Tue, 13 Apr 2021 00:52:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvtuobHhuc2wAPav117FZE6k7twCbistMjAw4zmdtHFNN8Vym1ZUHk8KLXKmnnNCzmhjvoCQNdJjhUEcMbRro=
X-Received: by 2002:a9d:5ae:: with SMTP id 43mr32408otd.347.1618300345387;
 Tue, 13 Apr 2021 00:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210412150006.53909-1-chris.chiu@canonical.com> <20210412151205.GB1420451@rowland.harvard.edu>
In-Reply-To: <20210412151205.GB1420451@rowland.harvard.edu>
From:   Chris Chiu <chris.chiu@canonical.com>
Date:   Tue, 13 Apr 2021 15:52:14 +0800
Message-ID: <CABTNMG1fvbOMrP+FmH0X5Yh04gf6vvhqhXfRrmpJ=f-fPBx4xw@mail.gmail.com>
Subject: Re: [PATCH] USB: Don't set USB_PORT_FEAT_SUSPEND on WD19's Realtek Hub
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, m.v.b@runbox.com, hadess@hadess.net,
        linux-usb@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 12, 2021 at 11:12 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Apr 12, 2021 at 11:00:06PM +0800, chris.chiu@canonical.com wrote:
> > From: Chris Chiu <chris.chiu@canonical.com>
> >
> > Realtek Hub (0bda:5413) in Dell Dock WD19 sometimes fails to work
> > after the system resumes from suspend with remote wakeup enabled
> > device connected:
> > [ 1947.640907] hub 5-2.3:1.0: hub_ext_port_status failed (err = -71)
> > [ 1947.641208] usb 5-2.3-port5: cannot disable (err = -71)
> > [ 1947.641401] hub 5-2.3:1.0: hub_ext_port_status failed (err = -71)
> > [ 1947.641450] usb 5-2.3-port4: cannot reset (err = -71)
> >
> > Information of this hub:
> > T:  Bus=01 Lev=02 Prnt=02 Port=02 Cnt=01 Dev#=  9 Spd=480  MxCh= 6
> > D:  Ver= 2.10 Cls=09(hub  ) Sub=00 Prot=02 MxPS=64 #Cfgs=  1
> > P:  Vendor=0bda ProdID=5413 Rev= 1.21
> > S:  Manufacturer=Dell Inc.
> > S:  Product=Dell dock
> > C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  0mA
> > I:  If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=01 Driver=hub
> > E:  Ad=81(I) Atr=03(Int.) MxPS=   1 Ivl=256ms
> > I:* If#= 0 Alt= 1 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=02 Driver=hub
> > E:  Ad=81(I) Atr=03(Int.) MxPS=   1 Ivl=256ms
> >
> > The failure results from the ETIMEDOUT by chance when turning on
> > the suspend feature of the hub. The usb_resume_device will not be
> > invoked since the device state is not set to suspended, then the
> > hub fails to activate subsequently.
> >
> > The USB_PORT_FEAT_SUSPEND is not really necessary due to the
> > "global suspend" in USB 2.0 spec. It's only for many hub devices
> > which don't relay wakeup requests from the devices connected to
> > downstream ports. For this realtek hub, there's no problem waking
> > up the system from connected keyboard.
>
> What about runtime suspend?  That _does_ require USB_PORT_FEAT_SUSPEND.

It's hard to reproduce the same thing with runtime PM. I also don't
know the aggressive
way to trigger runtime suspend. So I'm assuming the same thing will happen in
runtime PM case because they both go the same usb_port_resume path. Could
you please suggest a better way to verify this for runtime PM?

>
> > This commit bypasses the USB_PORT_FEAT_SUSPEND for the quirky hub.
> >
> > Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
> > ---
>
>
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 7f71218cc1e5..8478d49bba77 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -3329,8 +3329,11 @@ int usb_port_suspend(struct usb_device *udev, pm_message_t msg)
> >        * descendants is enabled for remote wakeup.
> >        */
> >       else if (PMSG_IS_AUTO(msg) || usb_wakeup_enabled_descendants(udev) > 0)
> > -             status = set_port_feature(hub->hdev, port1,
> > -                             USB_PORT_FEAT_SUSPEND);
> > +             if (udev->quirks & USB_QUIRK_NO_SET_FEAT_SUSPEND)
>
> You should test hub->hdev->quirks, here, not udev->quirks.  The quirk
> belongs to the Realtek hub, not to the device that's plugged into the
> hub.
>

Thanks for pointing that out. I'll verify again and propose a V2 after
it's done.

> Alan Stern
