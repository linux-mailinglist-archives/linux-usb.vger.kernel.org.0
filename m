Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED0E35F969
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 19:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232821AbhDNRGe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 13:06:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44877 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhDNRGd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Apr 2021 13:06:33 -0400
Received: from mail-oi1-f200.google.com ([209.85.167.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chris.chiu@canonical.com>)
        id 1lWixu-00021y-Nw
        for linux-usb@vger.kernel.org; Wed, 14 Apr 2021 17:06:10 +0000
Received: by mail-oi1-f200.google.com with SMTP id i19-20020a0568080313b029015a3ff29eb0so3496164oie.20
        for <linux-usb@vger.kernel.org>; Wed, 14 Apr 2021 10:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YpsXtEawgolI0DfTMmyGF8OuvZmi6Wsr2eEhJbR0QL0=;
        b=O9/kTe/EsGLCdKF8vCZTu90dzfHjsdQfCVV1M5pGAjfOeLUAojmJjGcCJyjQ9xTMcz
         awvxmKgFdQs+ZefgAxeD0RlyMVNqxEnpZ+i/iyUo9FxRHgPr7auSSXvNGuMwzSkZxYJS
         r6aPss7Ux+oIOHgxHPFcWm2uvmcGpiNXhW1Zv8Z+8apLG5ASwt6cxGylLzQLWYCyQ7bw
         nlnNiwDH0Ug5lHdZK+0/67J5xcgrg3vmibKdoQRK0dkBsVd5DEKCc3jvsj0oQKl5bFxe
         P8UQPS2XKwWRdIT8KxH15KujY2QlvYl2u7u3jL2idMg61DuOClNk+I00AuBNl1Kt03QY
         dmug==
X-Gm-Message-State: AOAM5316HrpgPw8mSQujivQPOEbjOPDWeq5xvA1gIrk2a+tN9jrppCBW
        6QQ7saFUvzekFLfw1u+x/a4aUcBrgdGSgVnnzQjPtMA/3iWZw2bZf/X5fbcQpIah8ZQBb4H15ci
        gl9eKZq/X1PN838LttJJ6uwPgnLK+971IPfbXBkAvLRlOvlPNbcqEqw==
X-Received: by 2002:a05:6808:13d0:: with SMTP id d16mr3129691oiw.169.1618419969512;
        Wed, 14 Apr 2021 10:06:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKxW80hPvFydQSjvbOuV9CivaqgZXPTF4t7nhBHN/CAAChTjTkW91k4+vMxBx5gd2v4XXONeFncT85ZDjgelU=
X-Received: by 2002:a05:6808:13d0:: with SMTP id d16mr3129656oiw.169.1618419968947;
 Wed, 14 Apr 2021 10:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210412150006.53909-1-chris.chiu@canonical.com>
 <20210412151205.GB1420451@rowland.harvard.edu> <CABTNMG1fvbOMrP+FmH0X5Yh04gf6vvhqhXfRrmpJ=f-fPBx4xw@mail.gmail.com>
 <20210413144416.GB1454681@rowland.harvard.edu> <CABTNMG21xp6TA8SGJhamfM9D6JGvQHwg8AMySSCh09-DnAZ5qQ@mail.gmail.com>
 <20210414143206.GA1493067@rowland.harvard.edu>
In-Reply-To: <20210414143206.GA1493067@rowland.harvard.edu>
From:   Chris Chiu <chris.chiu@canonical.com>
Date:   Thu, 15 Apr 2021 01:05:57 +0800
Message-ID: <CABTNMG3P3UNm-a=1iM_RbC9GXqKZGUkVWg=7ZyjhJV4C3Zarmg@mail.gmail.com>
Subject: Re: [PATCH] USB: Don't set USB_PORT_FEAT_SUSPEND on WD19's Realtek Hub
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, m.v.b@runbox.com, hadess@hadess.net,
        linux-usb@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 14, 2021 at 10:32 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, Apr 14, 2021 at 01:07:43PM +0800, Chris Chiu wrote:
> > Thanks for the instructions. I can hit the same timeout problem with
> > runtime PM. The
> > fail rate seems the same as normal PM. (around 1/4 ~ 1/7)
> > root@:/sys/bus/usb/devices/3-4.3# echo auto > power/control
> > root@:/sys/bus/usb/devices/3-4.3# echo on > power/control
> > root@:/sys/bus/usb/devices/3-4.3# dmesg -c
> > [ 2789.679807] usb 3-4: kworker/7:0 timed out on ep0out len=0/0
> > [ 2789.679812] usb 3-4-port3: can't suspend, status -110
> > [ 2789.680078] usb 3-4.3: Failed to suspend device, error -110
>
> Since these are random failures, occurring at a low rate, maybe it would
> help simply to retry the transfer that timed out.  Have you tested this?
>

The problem is the port seems to be dead (at least unresponsive) after
USB_PORT_FEAT_SUSPEND. If I turned on the xhci_hcd debug message,
I'll see lots of retries of the control URB as follows which never get acked
in failure cases.
[  126.616105] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1
bytes untransferred

I tried to increase the timeout from 1 second to 2 second and also tried
set USB_PORT_FEAT_SUSPEND again after timeout, but still get timeout.
That also explains why hub_ext_port_status returns -71 (EPROTO from xhci)
in hub_activate() during resuming since the port is in an unknown state.

> > > > > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > > > > > index 7f71218cc1e5..8478d49bba77 100644
> > > > > > --- a/drivers/usb/core/hub.c
> > > > > > +++ b/drivers/usb/core/hub.c
> > > > > > @@ -3329,8 +3329,11 @@ int usb_port_suspend(struct usb_device *udev, pm_message_t msg)
> > > > > >        * descendants is enabled for remote wakeup.
> > > > > >        */
> > > > > >       else if (PMSG_IS_AUTO(msg) || usb_wakeup_enabled_descendants(udev) > 0)
> > > > > > -             status = set_port_feature(hub->hdev, port1,
> > > > > > -                             USB_PORT_FEAT_SUSPEND);
> > > > > > +             if (udev->quirks & USB_QUIRK_NO_SET_FEAT_SUSPEND)
> > > > >
> > > > > You should test hub->hdev->quirks, here, not udev->quirks.  The quirk
> > > > > belongs to the Realtek hub, not to the device that's plugged into the
> > > > > hub.
> > > > >
> > > >
> > > > Thanks for pointing that out. I'll verify again and propose a V2 after
> > > > it's done.
> > >
> > > Another thing to consider: You shouldn't return 0 from usb_port_suspend
> > > if the port wasn't actually suspended.  We don't want to kernel to have
> > > a false idea of the hardware's current state.
> > >
> > So we still need the "really_suspend=false". What if I replace it with
> > the following?
> > It's a little verbose but expressive enough. Any suggestions?
> >
> > +       else if (!(hub->hdev->quirks & USB_QUIRK_NO_SET_FEAT_SUSPEND) &&
> > +               (PMSG_IS_AUTO(msg) || usb_wakeup_enabled_descendants(udev) > 0))
> > +               status = set_port_feature(hub->hdev, port1,
> > +                               USB_PORT_FEAT_SUSPEND);
> >         else {
> >                 really_suspend = false;
> >                 status = 0;
>
> You should do something more like this:
>
> -       else if (PMSG_IS_AUTO(msg) || usb_wakeup_enabled_descendants(udev) > 0)
> -               status = set_port_feature(hub->hdev, port1,
> -                               USB_PORT_FEAT_SUSPEND);
> -       else {
> +       else if (PMSG_IS_AUTO(msg) || usb_wakeup_enabled_descendants(udev) > 0) {
> +               if (hub->hdev->quirks & USB_QUIRK_NO_SUSPEND)
> +                       status = -EIO;
> +               else
> +                       status = set_port_feature(hub->hdev, port1,
> +                                       USB_PORT_FEAT_SUSPEND);
> +       } else {
>                 really_suspend = false;
>                 status = 0;
>         }
>
> But I would prefer to find a way to make port suspend actually work,
> instead of giving up on it.
>
> Alan Stern

I tried to do that and also dig into the xhci code to check why the TD
(Transfer Descriptor) of the corresponding control msg URB was not
completed. Unfortunately, I didn't find a reasonable answer. I'll verify
the status -EIO and propose a v3 if everything's fine. Please let me
know if there's anything worth trying. Thanks.

Chris
