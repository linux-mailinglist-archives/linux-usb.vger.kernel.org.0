Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F673443A6
	for <lists+linux-usb@lfdr.de>; Mon, 22 Mar 2021 13:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhCVMxU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Mar 2021 08:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbhCVMvF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Mar 2021 08:51:05 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BFB9C061574
        for <linux-usb@vger.kernel.org>; Mon, 22 Mar 2021 05:51:05 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id j25so10862273pfe.2
        for <linux-usb@vger.kernel.org>; Mon, 22 Mar 2021 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HpiEeAoAnB+Vtkh/D4yjuY2LWUgpJGLn1b0wx1ed3qI=;
        b=CXu8jCwSGBVfrT+Qv1+sFAl7pdyI/h5pRtwDpyR4YJvR6KtFfV1BuAJtkP9yTeYK0e
         RbOYU02osMiQ4r3DwNsHtIFzTZq+yVxSUnzHH7p/JcJF5ockD65Le3/6Gu49eHX76I6z
         z2TF+uGI86kVuFW1MQguRHNDtiqZuF+SCuoU6DWWX1C9Ev4m395zT7vD5lvhf1jgROte
         WOsWAiWJrE4MVhw148O48fY+6bqysOwgSfEq97zXRr0N2hEAp2RukUukHPdg23z2g8q4
         PF9eGzY/TwFnwRAUtfw4VBThR1ameMis4Ji6JMNXouGZoFy50MS2rp4en2eC/vTmt3w5
         MMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HpiEeAoAnB+Vtkh/D4yjuY2LWUgpJGLn1b0wx1ed3qI=;
        b=iqXGrmnuz6mb1lLz7lnDN4KOFfj7M72FxNuTTcryB21lmrmzJcbKCO5K5L1CjRimns
         LCYA1XzMeLWyHgWrjlhJHq6oJnwFFBWTthuqzlKDICtlK+hTduSZPGSEVNQgkOtpBA6o
         I8KCpQNI08PKYPU3zSwq4drykymVXL656prqdiOG+rodRMWvYApAY0Ib0QaVomUXf/86
         m8DCcZrW+xQMuXpBIrOKLA8fepDzE9Z69kOIsKYuHDUxcZSNhilJg2vVeGrYMIpzmLVV
         NBIvg6H1BwipNPEQI9oUSaHb48BXJHWx7iGGuqg5hwcyQ/i0hVHwLZsCOIYTKES1kHiP
         F+UA==
X-Gm-Message-State: AOAM5330IL3WHV+75XD+NFmX5nHNcS8dcSuZBDX+CGRTfaJNf6VD2nDD
        DtNkupy4rQCqfDjtWktek6rYZyvGxVbRgqZ9FiU=
X-Google-Smtp-Source: ABdhPJzTjcUyRQIBVEBwKAk79RXXOiSS5GSD5/pgDehElJdOBL0NDyzLpKGQOHdoHG+H2aSebgFkJb8y097FKJB2dzA=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr12156164pff.73.1616417464479; Mon, 22
 Mar 2021 05:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VcN8X3dJUrmaO+CiVEu9-1V8eMV_LMFb19_rvVcr2a0gg@mail.gmail.com>
 <20210322091010.a6h3u2omj52c77zq@mobilestation> <CAHp75VeHUyMt75MC9tQVXiZ7yDwar78oakoheHz8m6bDL9BvdA@mail.gmail.com>
 <CAHp75Ve+Ta_Shtw5cgjJLSrJLaKoBH4Pyg3sed0bBVXN0-=Vwg@mail.gmail.com>
In-Reply-To: <CAHp75Ve+Ta_Shtw5cgjJLSrJLaKoBH4Pyg3sed0bBVXN0-=Vwg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Mar 2021 14:50:48 +0200
Message-ID: <CAHp75VdPviyTcNPYDcpJZFovxfx18cVckfbDe49+zbx3yw3ghQ@mail.gmail.com>
Subject: Re: The fix e5f4ca3fce90 broke Intel Edison host mode
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>, Ferry Toth <fntoth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 22, 2021 at 11:49 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Mar 22, 2021 at 11:46 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Mar 22, 2021 at 11:10 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> > >
> > > Hello Andy
> > >
> > > On Fri, Mar 12, 2021 at 09:33:59PM +0200, Andy Shevchenko wrote:
> > > > Hi!
> > > >
> > > > The fix in the commit
> > > > e5f4ca3fce90 ("usb: dwc3: ulpi: Fix USB2.0 HS/FS/LS PHY suspend regression")
> > > > effectively broke host mode on Intel Edison.
> > > >
> > > > When device in a gadget mode and I attach the USB Mass Storage device
> > > >
> > > > Before: automatically switches to host mode and detects storage and
> > > > everything okay
> > > > After: automatically switches to host mode and that's it.
> > > >
> > > > Revert, as obviously from above, helps.
> > > >
> > > > So, please fix this or I will send revert near to rc5,
> > >
> > > As I've explained in the patchlog the commit was required because the
> > > original functionality submitted by Felipe three years ago aside with
> > > questionable fix introduced the suspend mode regression. So an access to
> > > any PHY register over the ULPI interface just disabled "Suspend USB 2.0
> > > HS/FS/LS PHY" mode, which made pointless enabling it in the main part of
> > > the driver and consequently increased the USB bus power consumption. See
> > > the commit e0082698b689 ("usb: dwc3: ulpi: conditionally resume ULPI PHY")
> > > for details. It clears the SusPHY flag and never gets it back. Instead it
> > > was enough to wait a little longer in the ULPI RegAccess busy-loop to let
> > > PHY to get out of the suspend mode and restore the link. So to speak
> > > reverting my patch would mean to get the regression back for all
> > > IP-core versions, which isn't what any of us would want.
> > >
> > > What I can suggest to you is to investigate the problem more thorough of why
> > > you having the mass storage device undetected after the mode switching.
> > > At least you need to look at the system log and find out whether it's ULPI
> > > Registers commands timeout to blame. If so then I would take a look at the
> > > PHY hardware manual whether it supports the Low-power mode. In any case
> > > most likely setting "snps,dis_u2_susphy_quirk" property in the DWC USB3 DT
> > > node will help you to work around the problem. Declaring that DT-prop will
> > > effectively disable using the LPM for any mode (Host/gadget/DRD), but will
> > > permit PHY suspension on the system suspend procedure (please see
> > > snps,dis_u2_susphy_quirk implementation for details).
> >
> > Before the patch there was no regression on the board in question.
> > After the patch
> > I got a clear regression that I may reproduce 100%. It's the
> > responsibility of the author of the patch to try to figure out what
> > broke other's cases. It's as simple as that.
> >
> > As I told you, I am happy to test any suggestion how to fix, otherwise
> > I will send a revert and I have a good justification to do that.
> >
> > > > Happy to test any proposed patches! (Maybe Ferry also can help with that)
>
> With regards to the second part of the second paragraph, I will look
> at that quirk if it helps.
> Thanks.

Quirk helped, I will send a patch. Thanks for a hint.

-- 
With Best Regards,
Andy Shevchenko
