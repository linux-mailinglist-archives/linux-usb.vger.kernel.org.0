Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7467B343D34
	for <lists+linux-usb@lfdr.de>; Mon, 22 Mar 2021 10:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhCVJrU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Mar 2021 05:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhCVJrE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Mar 2021 05:47:04 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B69C3C061574
        for <linux-usb@vger.kernel.org>; Mon, 22 Mar 2021 02:47:03 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id ay2so6249001plb.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Mar 2021 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r1XgyXDfZozP/B4L1dhlhS6WqWOKdM5IAph0ExOpoKs=;
        b=dCBbf+eheyeqOA4Y0c5tw17zY1gRRwi/aieDV2geiRoNMDDg0ENlKJQ4ZWTk/qCa3J
         cDlXRca82mxL1rEZncpD2/OBOwLZPFNgF7YkXpwtuEPvrPx9xzegAYmg4iwqaq39xL8p
         zd4NNnLvNecLbVgIB56nJd9yvoK885xbeIHiFHll0IP/DkLBrE/gU78IJmOB8DrL6yAW
         ibzRbYHnZ5KsPn+FG0fXyy+ji4n691s4XGWUKNht5mdAO/6EvNP+RkZa/u0W0mE9ymBw
         RvTPMz1p1v/4ujUldOcFpDD6grP5QOzkPHtO3kjekZStpOKRYSqHs3nfnh5Q6Wjd7A1P
         smxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r1XgyXDfZozP/B4L1dhlhS6WqWOKdM5IAph0ExOpoKs=;
        b=gvGgmpzZVGLRal7qGbyFPK9zJoCDM5rjkwi/PFFhiqfQRf/H2vwwU2Pzd0Lby5Ms24
         IgRkzl9kv5SMFEQk4vlZ7mhrcQKO76a3jjv0Fjt6pY7G0CPzeOvCcOB5N5XNzDeq9E0b
         lOH0ykUdV3y6cHwX2khsySWNb8xPMk6ZFO2OQKfrdyf5c8QH4epPdSWzGqKgA2wjFjCF
         RI70jzUoRIq7iCm9n/B7eUBk4SIi/PiJDZ7fUjCvpnXRHke67M6zrdPngVBklFHT8VJ2
         ncnKIKAOBbPIScUwNeuc2zrS9O097yTDytmbnLt0aETbGCaGwL9Wnwm5aU6f8RrZeLv9
         2LMw==
X-Gm-Message-State: AOAM5328MV5Skj9gA30n0de/zFPfAUAgO1fsL0Ug9Xd0j5Xgz/TrdQAk
        vdcKcySdfp1Ganh+e8FDKKn4Oh/kkmUxT1+8YAw=
X-Google-Smtp-Source: ABdhPJzWCgWNKnaxPb679tuLDUiq22CU6lVNyytpYLyw2fNjvKaQzqygS5mCseYcuPqJG6EL3DVQbXAI6gfkvBxk6PU=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr21659310plb.21.1616406423172; Mon, 22
 Mar 2021 02:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VcN8X3dJUrmaO+CiVEu9-1V8eMV_LMFb19_rvVcr2a0gg@mail.gmail.com>
 <20210322091010.a6h3u2omj52c77zq@mobilestation>
In-Reply-To: <20210322091010.a6h3u2omj52c77zq@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Mar 2021 11:46:46 +0200
Message-ID: <CAHp75VeHUyMt75MC9tQVXiZ7yDwar78oakoheHz8m6bDL9BvdA@mail.gmail.com>
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

On Mon, Mar 22, 2021 at 11:10 AM Serge Semin <fancer.lancer@gmail.com> wrote:
>
> Hello Andy
>
> On Fri, Mar 12, 2021 at 09:33:59PM +0200, Andy Shevchenko wrote:
> > Hi!
> >
> > The fix in the commit
> > e5f4ca3fce90 ("usb: dwc3: ulpi: Fix USB2.0 HS/FS/LS PHY suspend regression")
> > effectively broke host mode on Intel Edison.
> >
> > When device in a gadget mode and I attach the USB Mass Storage device
> >
> > Before: automatically switches to host mode and detects storage and
> > everything okay
> > After: automatically switches to host mode and that's it.
> >
> > Revert, as obviously from above, helps.
> >
> > So, please fix this or I will send revert near to rc5,
>
> As I've explained in the patchlog the commit was required because the
> original functionality submitted by Felipe three years ago aside with
> questionable fix introduced the suspend mode regression. So an access to
> any PHY register over the ULPI interface just disabled "Suspend USB 2.0
> HS/FS/LS PHY" mode, which made pointless enabling it in the main part of
> the driver and consequently increased the USB bus power consumption. See
> the commit e0082698b689 ("usb: dwc3: ulpi: conditionally resume ULPI PHY")
> for details. It clears the SusPHY flag and never gets it back. Instead it
> was enough to wait a little longer in the ULPI RegAccess busy-loop to let
> PHY to get out of the suspend mode and restore the link. So to speak
> reverting my patch would mean to get the regression back for all
> IP-core versions, which isn't what any of us would want.
>
> What I can suggest to you is to investigate the problem more thorough of why
> you having the mass storage device undetected after the mode switching.
> At least you need to look at the system log and find out whether it's ULPI
> Registers commands timeout to blame. If so then I would take a look at the
> PHY hardware manual whether it supports the Low-power mode. In any case
> most likely setting "snps,dis_u2_susphy_quirk" property in the DWC USB3 DT
> node will help you to work around the problem. Declaring that DT-prop will
> effectively disable using the LPM for any mode (Host/gadget/DRD), but will
> permit PHY suspension on the system suspend procedure (please see
> snps,dis_u2_susphy_quirk implementation for details).

Before the patch there was no regression on the board in question.
After the patch
I got a clear regression that I may reproduce 100%. It's the
responsibility of the author of the patch to try to figure out what
broke other's cases. It's as simple as that.

As I told you, I am happy to test any suggestion how to fix, otherwise
I will send a revert and I have a good justification to do that.

> > Happy to test any proposed patches! (Maybe Ferry also can help with that)



-- 
With Best Regards,
Andy Shevchenko
