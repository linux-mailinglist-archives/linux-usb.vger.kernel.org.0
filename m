Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0075F35EC15
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 07:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346863AbhDNFIS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 01:08:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51221 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhDNFIR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Apr 2021 01:08:17 -0400
Received: from mail-oi1-f197.google.com ([209.85.167.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chris.chiu@canonical.com>)
        id 1lWXkp-0002wq-Tl
        for linux-usb@vger.kernel.org; Wed, 14 Apr 2021 05:07:56 +0000
Received: by mail-oi1-f197.google.com with SMTP id l197-20020acad4ce0000b02901593d7ecdd7so5923734oig.19
        for <linux-usb@vger.kernel.org>; Tue, 13 Apr 2021 22:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IkbQ5ckAQjtTBOWAZHajDnh8k2xtlifzyDlYnjCIWkY=;
        b=g6AMnnx3/KtSauxEV6iTCo2na8WsNe1uZUjNCKHhuV6iAylFTAODDg2N8IIEc3ESlo
         4ZMkOpgN2gO32N8uv/RQZ3JCgZc3+Qs1UCZDH65kz90F6CCoJA2aI3iAq+3EkNr5I8YI
         6i4acElqG6MBSgnx1Rmr5ja8r08Z8UEuboqMM9/sn/ak1ujrGzudQUY5IMOMkkWQgABW
         hczd2HdiDzGAP26b//0qi81yFhvMRCHcLrpacMLKUzcfYk4Q0zOdLXeuXBkhcVCnAr+b
         UevzURfXl0AN3N/Wx3KiF8Bl76BdEFA//QQjiw6POZsF4u9A5T3Q2eetCG5OcMGU2iPZ
         OllA==
X-Gm-Message-State: AOAM532/UqemVnJ5tyBxIgSuilQMDMzKEFcOqscPu4iBpsvue57ZZt1w
        ABsXOIClHmYk4qx7hYRHKCt18vwdRnPbcWr/YaDRkwF8ga4VTyo4gADgyyWhD+sRYD9eqC0Ic18
        VNhhOGkrxf4R4KwBI6E27v+iiPo3Y/6bNpe7XVjC96hT/tVHLIkZxwQ==
X-Received: by 2002:a05:6808:13d0:: with SMTP id d16mr1025913oiw.169.1618376874652;
        Tue, 13 Apr 2021 22:07:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6wvt/gb/Aacqb4Rj7+RURsaFJSPCAy+qlU+TKiNdbK+eKOWJ0P9h8uN0Df4oCFbbuBNPwmQcHr+fGu63Lq9g=
X-Received: by 2002:a05:6808:13d0:: with SMTP id d16mr1025900oiw.169.1618376874326;
 Tue, 13 Apr 2021 22:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210412150006.53909-1-chris.chiu@canonical.com>
 <20210412151205.GB1420451@rowland.harvard.edu> <CABTNMG1fvbOMrP+FmH0X5Yh04gf6vvhqhXfRrmpJ=f-fPBx4xw@mail.gmail.com>
 <20210413144416.GB1454681@rowland.harvard.edu>
In-Reply-To: <20210413144416.GB1454681@rowland.harvard.edu>
From:   Chris Chiu <chris.chiu@canonical.com>
Date:   Wed, 14 Apr 2021 13:07:43 +0800
Message-ID: <CABTNMG21xp6TA8SGJhamfM9D6JGvQHwg8AMySSCh09-DnAZ5qQ@mail.gmail.com>
Subject: Re: [PATCH] USB: Don't set USB_PORT_FEAT_SUSPEND on WD19's Realtek Hub
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, m.v.b@runbox.com, hadess@hadess.net,
        linux-usb@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 13, 2021 at 10:44 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, Apr 13, 2021 at 03:52:14PM +0800, Chris Chiu wrote:
> > On Mon, Apr 12, 2021 at 11:12 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Mon, Apr 12, 2021 at 11:00:06PM +0800, chris.chiu@canonical.com wrote:
> > > > The USB_PORT_FEAT_SUSPEND is not really necessary due to the
> > > > "global suspend" in USB 2.0 spec. It's only for many hub devices
> > > > which don't relay wakeup requests from the devices connected to
> > > > downstream ports. For this realtek hub, there's no problem waking
> > > > up the system from connected keyboard.
> > >
> > > What about runtime suspend?  That _does_ require USB_PORT_FEAT_SUSPEND.
> >
> > It's hard to reproduce the same thing with runtime PM. I also don't
> > know the aggressive
> > way to trigger runtime suspend. So I'm assuming the same thing will happen in
> > runtime PM case because they both go the same usb_port_resume path. Could
> > you please suggest a better way to verify this for runtime PM?
>
> To put a USB device into runtime suspend, do this:
>
>         echo 0 >/sys/bus/usb/devices/.../bConfigurationValue
>         echo auto >/sys/bus/usb/devices/.../power/control
>
> where ... is the pathname for the device you want to suspend.  (Note
> that this will unbind the device from its driver, so make sure there's
> no possibility of data loss before you do it.)
>
> To resume the device, write "on" to the power/control file.  You can
> verify the runtime-PM status by reading the files in the power/
> subdirectory.
>
Thanks for the instructions. I can hit the same timeout problem with
runtime PM. The
fail rate seems the same as normal PM. (around 1/4 ~ 1/7)
root@:/sys/bus/usb/devices/3-4.3# echo auto > power/control
root@:/sys/bus/usb/devices/3-4.3# echo on > power/control
root@:/sys/bus/usb/devices/3-4.3# dmesg -c
[ 2789.679807] usb 3-4: kworker/7:0 timed out on ep0out len=0/0
[ 2789.679812] usb 3-4-port3: can't suspend, status -110
[ 2789.680078] usb 3-4.3: Failed to suspend device, error -110


> > > > This commit bypasses the USB_PORT_FEAT_SUSPEND for the quirky hub.
> > > >
> > > > Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
> > > > ---
> > >
> > >
> > > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > > > index 7f71218cc1e5..8478d49bba77 100644
> > > > --- a/drivers/usb/core/hub.c
> > > > +++ b/drivers/usb/core/hub.c
> > > > @@ -3329,8 +3329,11 @@ int usb_port_suspend(struct usb_device *udev, pm_message_t msg)
> > > >        * descendants is enabled for remote wakeup.
> > > >        */
> > > >       else if (PMSG_IS_AUTO(msg) || usb_wakeup_enabled_descendants(udev) > 0)
> > > > -             status = set_port_feature(hub->hdev, port1,
> > > > -                             USB_PORT_FEAT_SUSPEND);
> > > > +             if (udev->quirks & USB_QUIRK_NO_SET_FEAT_SUSPEND)
> > >
> > > You should test hub->hdev->quirks, here, not udev->quirks.  The quirk
> > > belongs to the Realtek hub, not to the device that's plugged into the
> > > hub.
> > >
> >
> > Thanks for pointing that out. I'll verify again and propose a V2 after
> > it's done.
>
> Another thing to consider: You shouldn't return 0 from usb_port_suspend
> if the port wasn't actually suspended.  We don't want to kernel to have
> a false idea of the hardware's current state.
>
So we still need the "really_suspend=false". What if I replace it with
the following?
It's a little verbose but expressive enough. Any suggestions?

+       else if (!(hub->hdev->quirks & USB_QUIRK_NO_SET_FEAT_SUSPEND) &&
+               (PMSG_IS_AUTO(msg) || usb_wakeup_enabled_descendants(udev) > 0))
+               status = set_port_feature(hub->hdev, port1,
+                               USB_PORT_FEAT_SUSPEND);
        else {
                really_suspend = false;
                status = 0;

Chris

> Alan Stern
