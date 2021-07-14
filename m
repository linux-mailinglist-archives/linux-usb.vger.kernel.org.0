Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1773C8AAC
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 20:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240014AbhGNSWf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 14:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239992AbhGNSWe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 14:22:34 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378B5C06175F
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 11:19:42 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id p22so4706461yba.7
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 11:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Mfu5mlOhRn1T0HU1GxUnH4N7HW1/gQEDVQu4l7c3/HU=;
        b=W6oHBneTPs8TMnVM2f7XJgrfQ9N9sh1f51cpSjIKhr2HRWdluHQa/gJXim68QifNrE
         yua1zl/U01NOqUMjv1nNsTNXpZJq1Z5zPRvV7Enh7wnvbcBrXOGTlrqfwc5STFj2D60H
         GaiyPIZuJBVSIacYGGgsk5UtZwpmd4OtZ1gWG2Gv/n3+vdNyDzTJrqm2YQ155qrMfGyD
         zQDc3OpKGJpo/xrnOpVynN51m4o7eWquMKLNzg3J8VXYje66mvtYRwLBcijnJxAsiZFN
         R7yFfyQCByU86FenXEmjr0Up+GM0gfkQUp/mDs/PePgiKS9JDEBjF4Jr8VyUu/bWp00B
         xD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Mfu5mlOhRn1T0HU1GxUnH4N7HW1/gQEDVQu4l7c3/HU=;
        b=AV2OZ43cL+LGZC+iRH5OGLDztIJD/mIVDCMqe8mDLedsOrxmzJNJBKR570ySz5Hp77
         2wnccwOGDdM+5VFSrePn0nyduhvECLqUOse+VndVpercMNVmZkmjVEfvevY4rkALtmBl
         OP6YpEW9dsTX++DXkgz2M4hklGj0aCAJSEzaMBsxlutvMK82RQIXlGUfzvy4sDPdk/cX
         lhPVJSanoDG363Du/7W2zSdGpht93Hy56nxktZQghRLIj1l7n4a3diJItrhBvOKg9TFd
         QF8q2MtsUU4PovkhMU6anubZLty+ed1aStspWRztWl+A5dmlDd89Fzax/201uqT2rnI1
         d59g==
X-Gm-Message-State: AOAM532XEeSM08iaqcep8W8xs6grvCZXyZwquwOLIR7tmvLyvNPVqEZj
        r8UNLuobbEGypnQaqIR5SWAtk1tz1VL3mPlvB2WAFNuME0w=
X-Google-Smtp-Source: ABdhPJyNVCp37YxA/mRTLbRi6t+Hn+LUXebzu11AP5u4l/sGcQxKrFfnn2SxcBZSE8oRoXmKyBx+78XW8mPrd2PVMi0=
X-Received: by 2002:a25:b793:: with SMTP id n19mr15403064ybh.488.1626286781303;
 Wed, 14 Jul 2021 11:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <CABUoX8tR+DpknjXCwtVkBh6O-rUisZ2V5RepzxRO-k5XBX7J=g@mail.gmail.com>
 <20210713184251.GC355405@rowland.harvard.edu> <CABUoX8sNbLuG0FB2_VtH14KhuBoRFB19a2V3cpgzdNDqiVUULA@mail.gmail.com>
 <CABUoX8sT_=8aUdzhphwJXnRN2m_cKuJrDi1MtOrkaCTThT0wmA@mail.gmail.com>
 <CABUoX8tX6+JpPRz7oyJV2fsiEbWxE+aZEYoBdjqWvLKL-4Odow@mail.gmail.com>
 <20210714145423.GB380727@rowland.harvard.edu> <CABUoX8uUhW4bdUZ6Roo=jEn=3UwUq2QVAMPcnyg8rbLzua09=w@mail.gmail.com>
 <20210714180512.GF380727@rowland.harvard.edu> <CABUoX8vWDRtr4hiVOEkT48=doG8xbAVD65Hve0QByLJpV0JsqQ@mail.gmail.com>
In-Reply-To: <CABUoX8vWDRtr4hiVOEkT48=doG8xbAVD65Hve0QByLJpV0JsqQ@mail.gmail.com>
From:   Hylke Hellinga <hylke.hellinga@gmail.com>
Date:   Wed, 14 Jul 2021 20:19:30 +0200
Message-ID: <CABUoX8uiYvDTcc8JvRk=T2n9Dr8ero+9dM1U7kh86_0f_U6rSw@mail.gmail.com>
Subject: RE: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller causing
 random full speed USB resets
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

What I find odd is that the switch works fine on my pop os linux
installation on my laptop.

I've already tried connecting it to a different usb port on the same
computer. Without luck...

How would I go about making the usbhid driver ignore the mouse issues?

When I unplug the mouse from the switch, and have only the keyboard
connected, it still randomly disconnects.


The thing is: this linux system used to live as an ssd in my laptop.
But I've literally unplugged it from my onboard laptop and plugged it
into my pc to see if I could boot from it.
Which worked.

So perhaps there is something in the kernel or in the linux distro
misconfigured to work with laptops exclusively?
And is therefore causing the issues?

Are there any laptop specific kernel modules or services/binaries that
can cause power management or signal issues?

Op wo 14 jul. 2021 om 20:05 schreef Alan Stern <stern@rowland.harvard.edu>:
>
> On Wed, Jul 14, 2021 at 07:39:51PM +0200, Hylke Hellinga wrote:
> > Yes, I did.
> >
> > I've connected both the mouse, keyboard and headset to the pc and it would
> > function normally. I know it has to do with the switch itself. But I have
> > no idea how to fix it.
>
> When you connect the mouse directly to the PC, does it still run at full
> speed or does it go up to high speed?
>
> > The switch works fine under windows and macos, and it is even advertised to
> > work under linux. But you never know with amazon products whether that is
> > actually the case.
>
> Do you have any other Linux computers you can try the switch with?  Or
> USB ports on your computer connected to a different host controller?
>
> > I don't have a different usb switch I can test. I've tried different input
> > usb cables as well. The usb cable coming from the switch going into my
> > computer is pretty long.
>
> Well, maybe a shorter cable would help.  But basically, I have no idea
> how to fix it either.  A possible workaround would be to make the usbhid
> driver ignore all the errors coming from the mouse instead of resetting
> it, but such a change would not be generally acceptable for the kernel.
>
> It ought to be possible to get the equivalent of a usbmon trace under
> Windows or Mac OS, using Wireshark.  That would at least show if the
> same errors occur in those settings, and if they do, how the operating
> systems deal with them.
>
> To track down the problem any further would require a more detailed
> knowledge of the USB support in Windows or Mac OS (which I don't have)
> and/or some rather expensive USB bus analyzer hardware.  It would be
> cheaper and quicker just to get a different brand of switch.  :-(
>
> Alan Stern
