Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B170D345132
	for <lists+linux-usb@lfdr.de>; Mon, 22 Mar 2021 21:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhCVUxY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Mar 2021 16:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhCVUxO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Mar 2021 16:53:14 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A863C061574
        for <linux-usb@vger.kernel.org>; Mon, 22 Mar 2021 13:53:13 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 75so23405541lfa.2
        for <linux-usb@vger.kernel.org>; Mon, 22 Mar 2021 13:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Izg991dx1JI0wS88DnmODMQyA2/GXznhwVWbzzlLxo8=;
        b=Cz/SMCdL2CG1EOhq8BUXA13lhSLp+hE92iWNq3TRdALeMRaLNTQONKclCcV5fDgJ9g
         0QDBjOSMa1nWgE1xrMTXDhNQPymCgLwMCIntCuDdaHR1Ex/WxSp80speTpyffjxTHsOE
         bK+AAK7Vo3s0ZnqdqcPS+gmTdhSzCQ+D+R5ZvDySlveqqEKBXj2SERgF/wmqCQQGwv5q
         OowErgbr5THo5+AwQqAqbz3i7j1+3DF1DE1WE/Vcn6cwDKSmCxvIgzVE6VCSrf1B5nH/
         1+sIgVti03xZKlmCzwABysb5qp4T0OPY/xDjd586aAKwd+H5P/SE2ZyHir1vUEXWhX1o
         ZjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Izg991dx1JI0wS88DnmODMQyA2/GXznhwVWbzzlLxo8=;
        b=FGOYshH+M2Fuv6jZ2VZQ0hafH8aWNJ7g+vdI2V/0YwE2ZA5pR0k2V6Nt8VzAUkXmNj
         d/Y4SJYcpFi/3NIsu/A2wHQjFhhO9p4w4vauIqN0AmTBXlWHGEBPCdjyBytoW76RFVhB
         vLBEeI0gy0shisPj2rwR6cOdWrSK5PVvAnIYoIzdbzBQBYiMDtU6BG8QyQgpEbXX10ng
         QfYjzOtOyAbx47dzwRfEOExIVG5py/jU7q49ePSJo91NvuDsidyXAmdcAtd9JrB8ensb
         q2TRlqLbfPpCa8x77DNPdUn1wnp82PrzjcF3+FQbCtEBUcV8U5k8ZlJ2vE/83Llh9fBE
         eBJw==
X-Gm-Message-State: AOAM530KPjT1vt1qTrsytnBgfuksatLaCd2tME4JmJELhuATZDsDo41s
        2EpiLhPjXN9Sy6FjGICu6TI=
X-Google-Smtp-Source: ABdhPJyaenCzQreDMzdIK7ClRi0MbXFsefqy8vE4+rBufHO5c6v7/oD88X0ivFvRALuxoIyNHXVV3A==
X-Received: by 2002:a19:c18f:: with SMTP id r137mr592279lff.519.1616446391712;
        Mon, 22 Mar 2021 13:53:11 -0700 (PDT)
Received: from mobilestation ([95.79.86.76])
        by smtp.gmail.com with ESMTPSA id a16sm2070674ljj.124.2021.03.22.13.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 13:53:10 -0700 (PDT)
Date:   Mon, 22 Mar 2021 23:53:08 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: The fix e5f4ca3fce90 broke Intel Edison host mode
Message-ID: <20210322205308.rgu3ylnfj3qncdcl@mobilestation>
References: <CAHp75VcN8X3dJUrmaO+CiVEu9-1V8eMV_LMFb19_rvVcr2a0gg@mail.gmail.com>
 <20210322091010.a6h3u2omj52c77zq@mobilestation>
 <CAHp75VeHUyMt75MC9tQVXiZ7yDwar78oakoheHz8m6bDL9BvdA@mail.gmail.com>
 <CAHp75Ve+Ta_Shtw5cgjJLSrJLaKoBH4Pyg3sed0bBVXN0-=Vwg@mail.gmail.com>
 <CAHp75VdPviyTcNPYDcpJZFovxfx18cVckfbDe49+zbx3yw3ghQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdPviyTcNPYDcpJZFovxfx18cVckfbDe49+zbx3yw3ghQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 22, 2021 at 02:50:48PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 22, 2021 at 11:49 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Mar 22, 2021 at 11:46 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Mon, Mar 22, 2021 at 11:10 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > >
> > > > Hello Andy
> > > >
> > > > On Fri, Mar 12, 2021 at 09:33:59PM +0200, Andy Shevchenko wrote:
> > > > > Hi!
> > > > >
> > > > > The fix in the commit
> > > > > e5f4ca3fce90 ("usb: dwc3: ulpi: Fix USB2.0 HS/FS/LS PHY suspend regression")
> > > > > effectively broke host mode on Intel Edison.
> > > > >
> > > > > When device in a gadget mode and I attach the USB Mass Storage device
> > > > >
> > > > > Before: automatically switches to host mode and detects storage and
> > > > > everything okay
> > > > > After: automatically switches to host mode and that's it.
> > > > >
> > > > > Revert, as obviously from above, helps.
> > > > >
> > > > > So, please fix this or I will send revert near to rc5,
> > > >
> > > > As I've explained in the patchlog the commit was required because the
> > > > original functionality submitted by Felipe three years ago aside with
> > > > questionable fix introduced the suspend mode regression. So an access to
> > > > any PHY register over the ULPI interface just disabled "Suspend USB 2.0
> > > > HS/FS/LS PHY" mode, which made pointless enabling it in the main part of
> > > > the driver and consequently increased the USB bus power consumption. See
> > > > the commit e0082698b689 ("usb: dwc3: ulpi: conditionally resume ULPI PHY")
> > > > for details. It clears the SusPHY flag and never gets it back. Instead it
> > > > was enough to wait a little longer in the ULPI RegAccess busy-loop to let
> > > > PHY to get out of the suspend mode and restore the link. So to speak
> > > > reverting my patch would mean to get the regression back for all
> > > > IP-core versions, which isn't what any of us would want.
> > > >
> > > > What I can suggest to you is to investigate the problem more thorough of why
> > > > you having the mass storage device undetected after the mode switching.
> > > > At least you need to look at the system log and find out whether it's ULPI
> > > > Registers commands timeout to blame. If so then I would take a look at the
> > > > PHY hardware manual whether it supports the Low-power mode. In any case
> > > > most likely setting "snps,dis_u2_susphy_quirk" property in the DWC USB3 DT
> > > > node will help you to work around the problem. Declaring that DT-prop will
> > > > effectively disable using the LPM for any mode (Host/gadget/DRD), but will
> > > > permit PHY suspension on the system suspend procedure (please see
> > > > snps,dis_u2_susphy_quirk implementation for details).
> > >
> > > Before the patch there was no regression on the board in question.
> > > After the patch
> > > I got a clear regression that I may reproduce 100%. It's the
> > > responsibility of the author of the patch to try to figure out what
> > > broke other's cases. It's as simple as that.
> > >
> > > As I told you, I am happy to test any suggestion how to fix, otherwise
> > > I will send a revert and I have a good justification to do that.
> > >
> > > > > Happy to test any proposed patches! (Maybe Ferry also can help with that)
> >
> > With regards to the second part of the second paragraph, I will look
> > at that quirk if it helps.
> > Thanks.
> 
> Quirk helped, I will send a patch. Thanks for a hint.

Glad I could help.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
