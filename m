Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19BE712914E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2019 05:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfLWE3v convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 22 Dec 2019 23:29:51 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:47820 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbfLWE3v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 22 Dec 2019 23:29:51 -0500
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chia-lin.kao@canonical.com>)
        id 1ijFLo-0007Pm-UO
        for linux-usb@vger.kernel.org; Mon, 23 Dec 2019 04:29:49 +0000
Received: by mail-wm1-f69.google.com with SMTP id t16so3346385wmt.4
        for <linux-usb@vger.kernel.org>; Sun, 22 Dec 2019 20:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dpoHWFqcQ1TpfseO0Nokc21cLrtit4YIE7VtBBHccsA=;
        b=d9jxQCqkh/JOmguiKeZ35qpqVOqUu0xJCewokOgc3QM8s1EKJVX9/Vijb61wPpMrTG
         Q6ivKjNXJVaxzR2img1Do9SrL6AL+xDOkjuAmxC6U2dan1WyjUZfbrX77toWaS4gctob
         RT2vxGr3KFUaVv5wfRjD6wTonRL4rGypOoNSaQCm9TNIgwGMKQH4O1VxnIOJbeWetyGr
         SiyltcBU4Ms4Ha9aKL/T+ptMcAZeP8ITJOhPrq5xVlOxrvw0Fims2bE/e5DOPDHD2UoY
         QPFASZtB2FcPhQqFTpBYgZ4pXaVgn18AHtRRQHaWCDTBwa5W6yJHhzWPWlathfISsp0q
         M1HQ==
X-Gm-Message-State: APjAAAVOWbik0O7bOkmZpeaQDG3bYX2Sg2NEj4TFUio+D7rnP4q4Ai2z
        FHpv7Hu8EgeSaa+AX5q21PYuR7VA1LswDvdxMUoSfFlgMkfQE5dSIA+w1CFjwOq8cxuUSXtNJS6
        cy59LK42tbNwTu8c7/Cs+Jfy9SxFeyBXEWVAv0ExVRQDF4/9RghPJQQ==
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr28533301wmd.102.1577075388588;
        Sun, 22 Dec 2019 20:29:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzXUVi+UA1DavsCkDJBWIA4JcWT51MR9k+QDkiXMWpluAHzH7/yMod/quGq56oywTJgiXzqZ6cyOPbczgqW8Mk=
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr28533284wmd.102.1577075388321;
 Sun, 22 Dec 2019 20:29:48 -0800 (PST)
MIME-Version: 1.0
References: <20191220025917.11886-1-acelan.kao@canonical.com> <Pine.LNX.4.44L0.1912201040000.2513-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912201040000.2513-100000@netrider.rowland.org>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Mon, 23 Dec 2019 12:29:37 +0800
Message-ID: <CAFv23Qn9h=pwaHkiMB2ci-OaR54gY6fdc1Q_7ZMz5mH7wHr9+w@mail.gmail.com>
Subject: Re: [PATCH] usb: hub: move resume delay at the head of all USB access functions
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Harry Pan <harry.pan@intel.com>,
        David Heinzelmann <heinzelmann.david@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Mathieu Malaterre <malat@debian.org>,
        linux-usb@vger.kernel.org,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alan Stern <stern@rowland.harvard.edu> 於 2019年12月20日 週五 下午11:48寫道：
>
> On Fri, 20 Dec 2019, AceLan Kao wrote:
>
> > usb_control_msg() function should be called after the resume delay, or
>
> Which usb_control_msg() call are you referring to?  Is it the call
> under hub_port_status()?
usb_port_resume() -> hub_port_status() -> hub_ext_port_status()
-> get_port_status() -> usb_control_msg()

>
> > you'll encounter the below errors sometime.
> > After the issue happens, have to re-plug the USB cable to recover.
> >
> > [ 837.483573] hub 2-3:1.0: hub_ext_port_status failed (err = -71)
> > [ 837.490889] hub 2-3:1.0: hub_ext_port_status failed (err = -71)
> > [ 837.506780] usb 2-3-port4: cannot disable (err = -71)
>
> You need to do a better job of figuring out why these errors occur.  It
> is not connected to the resume delay; there must be a different reason.
> Hint: This is the sort of error you would expect to see if the kernel
> tried to resume a device while its parent hub was still suspended.
Once this error shows, the USB port doesn't work until re-plug the cable.
I have no idea what else I can do to this, do you have any idea that I
could try?
Thanks.

>
> > Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> > ---
> >  drivers/usb/core/hub.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index f229ad6952c0..2fb2816b0d38 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -3522,6 +3522,7 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
> >               }
> >       }
> >
> > +     msleep(USB_RESUME_TIMEOUT);
>
> This makes no sense at all.  At this point we haven't even started to
> do the resume signalling, so there's no reason to wait for it to
> finish.
I thought the h/w need some time to be back to stable status when resuming.
>
> >       usb_lock_port(port_dev);
> >
> >       /* Skip the initial Clear-Suspend step for a remote wakeup */
> > @@ -3544,7 +3545,6 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
> >               /* drive resume for USB_RESUME_TIMEOUT msec */
> >               dev_dbg(&udev->dev, "usb %sresume\n",
> >                               (PMSG_IS_AUTO(msg) ? "auto-" : ""));
> > -             msleep(USB_RESUME_TIMEOUT);
>
> This is wrong also.  At this point the resume signal _is_ being sent,
> and the USB spec requires that we wait a minimum amount of time for the
> device to fully resume.
I don't see the difference that after the delay, it calls hub_port_status(), but
in the beginning of usb_port_resume() it call the same function, too.
So, I think it should be good to move the delay before the first
hub_port_status()
>
> Alan Stern
>
