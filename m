Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1A23C7802
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 22:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234615AbhGMUdw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 16:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbhGMUdv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 16:33:51 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1749DC0613DD
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 13:31:00 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id r135so37054957ybc.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 13:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=m0gZGCIdmCNXtNtFTnD+pcxzVYENi9WuotVH3rgq7Sw=;
        b=oCfkGMOcJkSwq8tNFg+fRQchF1Ydik5W56RwNzE708ptAhnX4wQGBFB+Q1rqFiGprY
         lGR2Lw0d8t+el5GmDPB1o6JwcBzqFpCmN7hmsvTGcXN+7axQV5B71rPALPzu0xEESdK6
         jsYeTCN/4LHYDiUPNUPa95o0q6BdMIPFx9F7WnRsl63Z+8/sLvZqqB81m7s3rVS9gyUp
         KMHlyrmHOeDU7ZcXJoOu3246A6/4m3NGD5Llt/XtdwLhrxLucX43LQGzM1Cmwtky8ZhN
         a60aYgWKvK2skBCDyvRcoGmECpSqATdcFEH74UhzUayOamWFAIl6IK9dzXKHGkvl+A80
         NKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=m0gZGCIdmCNXtNtFTnD+pcxzVYENi9WuotVH3rgq7Sw=;
        b=VEAGhfF0vQBakFE+/MFuleW6BvqQ4QPb+GrtmeSPnLIDlL86aDXsxqFv5KRVDBfKiT
         cLybyCnrDL4qhXupyTzu493/cSLppMOuUFGXpbAAOGmjmw+41n0fL2E8dT54tEkE39l5
         FcevItVuXPCv3UARB2KesFe3MKUz24TF2rIz98n122dJKsNY7RdpzEtByzATxCqY0Ozo
         /G9Nu5zhWoBa7fGYZQMIAi6yZTDDbFedViQjUFJs+0KHTHMmXhNpiCPradjSB0guF642
         L1tCzvsBFWVwOczGheYND9xllAPtgJPLJHUoPxl5+NglvPceYR72JnmhB1R5H9iOwalH
         Xlwg==
X-Gm-Message-State: AOAM530XrlwksbIdws9aKoG6uCBdKtClGxxIMP7Pjd8QoY6C2X3dwEWo
        W/hmL4pT6bhsAIEsC1xmoPCyo7L1tKxh9J3QlEZbihN0UCNfsw==
X-Google-Smtp-Source: ABdhPJyDaRb4aU56mKWLYn0RuFv5tR5ChHIGuGIF5XsKhPnVfXXN3Taa6hij+pvi0uNjLNAWwdVDsTBfSB+WKGtPDEM=
X-Received: by 2002:a25:7316:: with SMTP id o22mr8324754ybc.349.1626208259248;
 Tue, 13 Jul 2021 13:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <CABUoX8tR+DpknjXCwtVkBh6O-rUisZ2V5RepzxRO-k5XBX7J=g@mail.gmail.com>
 <20210713184251.GC355405@rowland.harvard.edu> <CABUoX8sNbLuG0FB2_VtH14KhuBoRFB19a2V3cpgzdNDqiVUULA@mail.gmail.com>
 <CABUoX8sT_=8aUdzhphwJXnRN2m_cKuJrDi1MtOrkaCTThT0wmA@mail.gmail.com>
In-Reply-To: <CABUoX8sT_=8aUdzhphwJXnRN2m_cKuJrDi1MtOrkaCTThT0wmA@mail.gmail.com>
From:   Hylke Hellinga <hylke.hellinga@gmail.com>
Date:   Tue, 13 Jul 2021 22:30:48 +0200
Message-ID: <CABUoX8tX6+JpPRz7oyJV2fsiEbWxE+aZEYoBdjqWvLKL-4Odow@mail.gmail.com>
Subject: Re: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller causing
 random full speed USB resets
To:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Alan,

Thank you.

I've just created the usbmon trace. It's fairly large due to it taking
quite some time before the bug appears.
I'm guessing it also has a lot of output due to the mouse moving x and
y and me typing?

It can be viewed here:
https://gist.github.com/Simbaclaws/70014d584d96dc0ac4920dffb1996583

Sorry for the somewhat late reply. Was helping someone on irc.

Please let me know if this can help debug the issue.

Sorry for the previous mails that I've send to you personally.
I didn't notice linux-usb@vger.kernel.org was not in the cc.
I'm also a bit new to mailing lists.

I've removed the previous messages and added this message to the
linux-usb kernel mailing archive for further reference.

Hylke Hellinga
Software Engineer

> Op di 13 jul. 2021 om 20:42 schreef Alan Stern <stern@rowland.harvard.edu>:
> >
> > On Tue, Jul 13, 2021 at 08:19:23PM +0200, Hylke Hellinga wrote:
> > > Hey there,
> > >
> > > For my desktop setup I have a usb kvm switch ordered from amazon.
> > > Found here:
> > > https://www.amazon.com/Switcher-Selector-Computers-Keyboard-Compatbile/dp/B082K87B87/ref=sr_1_6?dchild=1&keywords=usb+switch&qid=1626199073&sr=8-6
> > >
> > > I've got 3 usb devices attached to this switch. A full speed ROG
> > > Claymore keyboard, a full speed Roccat Tyon mouse, and a full speed
> > > Arctis 5 headset.
> >
> > Oddly, the log you provided indicates that the ROCCAT mouse could run
> > at high speed but it running only at full speed.  No obvious reason
> > why.
> >
> > > Whenever I have this switch connected and I'm on my gentoo linux
> > > system with kernel:
> > >
> > > Linux 5.12.9-gentoo-x86_64 #1 SMP Mon Jul 5 03:11:12 CEST 2021 x86_64
> > > AMD Ryzen 9 3950X 16-Core Processor AuthenticAMD GNU/Linux
> > >
> > > It is randomly disconnecting and connecting my devices.
> > > So I figured this would be a power issue, where the usb port of my
> > > desktop is drawing not enough power for the supported devices.
> > >
> > > The switch comes with a 5v micro usb power interface. I have this
> > > micro usb connected to a 5v power adapter at all times in a separate
> > > power socket.
> > >
> > > This problem does not occur on proprietary operating systems such as
> > > Windows 10 and Mac OS X on the same hardware.
> > > Which has led me to believe that perhaps this has to do with the USB
> > > chipset drivers for my motherboard in the linux kernel.
> > >
> > > Underneath is my dmesg log that will display the following entries at the end:
> > > [ 5620.383044] usb 1-7.2: reset full-speed USB device number 7 using xhci_hcd
> > > [ 5649.905700] usb 1-7.3: reset full-speed USB device number 9 using xhci_hcd
> > >
> > > https://gist.github.com/Simbaclaws/3cde9ea6732b1db151e69a71c1978965
> > >
> > > Here is my lspci output:
> > >
> > > https://gist.github.com/Simbaclaws/b88b7d0e2fd7609af1cf579527b6326f
> > >
> > > I think the one that is causing issues is:
> > > 04:00.0 USB controller: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller
> >
> > Actually it's the 02:00.0 controller (the one connected to USB buses
> > 1 and 2).
> >
> > > The motherboard that I am using is a Crosshair VI Hero, I doubt that
> > > the motherboard hardware is the issue here, since these issues don't
> > > seem to apply to other operating systems.
> > >
> > > Are there any further steps I can take to diagnose this issue any further?
> > > Perhaps I can debug the kernel that I'm using somehow?
> >
> > You can collect a usbmon trace showing the problem:
> >
> >         cat /sys/kernel/debug/usb/usbmon/1u >usbmon.txt
> >
> > Let the trace run long enough to encounter two or three of these
> > resets, then kill the "cat" process and post the output file.
> >
> > > I'm not that familiar with C code, the best I can do is write some
> > > small patches for DWM. Just so you get a feeling of what my current
> > > expertise is at in this regard.
> > >
> > > Please help me fix this annoying bug, since it is literally
> > > disconnecting my keyboard every random amount of seconds causing me to
> > > have a hard time on linux.
> > >
> > >
> > > Let me know if this is the right place to ask these kind of things.
> > > I've never reported a kernel issue before.
> >
> > Yes, this mailing list is absolutely the right place to report such
> > issues.
> >
> > Alan Stern
