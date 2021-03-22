Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A64343D37
	for <lists+linux-usb@lfdr.de>; Mon, 22 Mar 2021 10:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhCVJug (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Mar 2021 05:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhCVJuN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Mar 2021 05:50:13 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD379C061574
        for <linux-usb@vger.kernel.org>; Mon, 22 Mar 2021 02:50:12 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so7916440pjb.4
        for <linux-usb@vger.kernel.org>; Mon, 22 Mar 2021 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HTXbH44Ff4AxR9pV85dlawDsMmzKIadeD1JtqB6Pbpk=;
        b=YJLOtNeYuD72sdpe2as9qEykahSzquMtFGtEEl7yqyiPgTD4a2N9plgFz5EAkV4cG4
         GFFsra85d52zKK6rEDKF05ixUZLhrZ/FXJ30Lphn6yYu96061FShcM53mDTCwRWP1mhI
         oy9KcZRwJF8Il2GpRm7b2/OJR2utfZxIjSD//KoPbVjG13tgIDH/wob2Job3M0TjP/gH
         nSmXCKev4g+H7XuQH31yjGknxMmInmhu7DiptPMEc+54EXHrmW7S51Sx7Rs0iZNfLVFJ
         c0rubPeGaCZIygdGPFJpIEgDjBwEJG0tQeMgdhhHma6mTtnhxHYoaNN0R3UJQ1W06wfU
         OXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HTXbH44Ff4AxR9pV85dlawDsMmzKIadeD1JtqB6Pbpk=;
        b=mHENIAIX4qZKVSIINjalqi/Zu9cz3vR8To/qfcpKbbehWamC0zdC65tRN7vycF4zw3
         N38WGa2ai9Y9HZzTG+yRdwhupsJyDVsYO/K9wsbqgNQ+7CYY6ruRyt+RvfYPNEHrgqYH
         mLads8jTb2aviOKQFWh7AQ/RTdxteXYLLVkYR4hXOxV8AZs5mRWvAlOV0Omvgs9RSO2I
         1EU+yEFrcWfC+Cfv52zsr66zioA8xxA3BJgceemEWygWwcHLiHTTNrPnTT6GMO2gYkSk
         KKVl/6hb7YOrVegFvVFnoz3NJsopZ64lv0tY+SDN2jqDuFVOEv/0wY1kOG8u1TXeeQyE
         Jefw==
X-Gm-Message-State: AOAM531/Cn8S/0LUE0qz72GFyd9fZ6fmsXb3c3/4OJ5nzrgn+75s21gq
        nOmCZdFLtqd55cNWEuZuu91C/nvai9fxuWDjtU8=
X-Google-Smtp-Source: ABdhPJzvJm5UfurXggJLeA3/UeIbySEwxxEDdUyR8uLDnhixlvUD97/ShYaLjRAxG+LyqaqEk9s6X1zT/6bm7XUE9h4=
X-Received: by 2002:a17:902:c808:b029:e6:4204:f62f with SMTP id
 u8-20020a170902c808b02900e64204f62fmr26666372plx.0.1616406612320; Mon, 22 Mar
 2021 02:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VcN8X3dJUrmaO+CiVEu9-1V8eMV_LMFb19_rvVcr2a0gg@mail.gmail.com>
 <20210322091010.a6h3u2omj52c77zq@mobilestation> <CAHp75VeHUyMt75MC9tQVXiZ7yDwar78oakoheHz8m6bDL9BvdA@mail.gmail.com>
In-Reply-To: <CAHp75VeHUyMt75MC9tQVXiZ7yDwar78oakoheHz8m6bDL9BvdA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Mar 2021 11:49:56 +0200
Message-ID: <CAHp75Ve+Ta_Shtw5cgjJLSrJLaKoBH4Pyg3sed0bBVXN0-=Vwg@mail.gmail.com>
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

On Mon, Mar 22, 2021 at 11:46 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Mar 22, 2021 at 11:10 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> >
> > Hello Andy
> >
> > On Fri, Mar 12, 2021 at 09:33:59PM +0200, Andy Shevchenko wrote:
> > > Hi!
> > >
> > > The fix in the commit
> > > e5f4ca3fce90 ("usb: dwc3: ulpi: Fix USB2.0 HS/FS/LS PHY suspend regression")
> > > effectively broke host mode on Intel Edison.
> > >
> > > When device in a gadget mode and I attach the USB Mass Storage device
> > >
> > > Before: automatically switches to host mode and detects storage and
> > > everything okay
> > > After: automatically switches to host mode and that's it.
> > >
> > > Revert, as obviously from above, helps.
> > >
> > > So, please fix this or I will send revert near to rc5,
> >
> > As I've explained in the patchlog the commit was required because the
> > original functionality submitted by Felipe three years ago aside with
> > questionable fix introduced the suspend mode regression. So an access to
> > any PHY register over the ULPI interface just disabled "Suspend USB 2.0
> > HS/FS/LS PHY" mode, which made pointless enabling it in the main part of
> > the driver and consequently increased the USB bus power consumption. See
> > the commit e0082698b689 ("usb: dwc3: ulpi: conditionally resume ULPI PHY")
> > for details. It clears the SusPHY flag and never gets it back. Instead it
> > was enough to wait a little longer in the ULPI RegAccess busy-loop to let
> > PHY to get out of the suspend mode and restore the link. So to speak
> > reverting my patch would mean to get the regression back for all
> > IP-core versions, which isn't what any of us would want.
> >
> > What I can suggest to you is to investigate the problem more thorough of why
> > you having the mass storage device undetected after the mode switching.
> > At least you need to look at the system log and find out whether it's ULPI
> > Registers commands timeout to blame. If so then I would take a look at the
> > PHY hardware manual whether it supports the Low-power mode. In any case
> > most likely setting "snps,dis_u2_susphy_quirk" property in the DWC USB3 DT
> > node will help you to work around the problem. Declaring that DT-prop will
> > effectively disable using the LPM for any mode (Host/gadget/DRD), but will
> > permit PHY suspension on the system suspend procedure (please see
> > snps,dis_u2_susphy_quirk implementation for details).
>
> Before the patch there was no regression on the board in question.
> After the patch
> I got a clear regression that I may reproduce 100%. It's the
> responsibility of the author of the patch to try to figure out what
> broke other's cases. It's as simple as that.
>
> As I told you, I am happy to test any suggestion how to fix, otherwise
> I will send a revert and I have a good justification to do that.
>
> > > Happy to test any proposed patches! (Maybe Ferry also can help with that)

With regards to the second part of the second paragraph, I will look
at that quirk if it helps.
Thanks.

-- 
With Best Regards,
Andy Shevchenko
