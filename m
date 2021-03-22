Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474F7343C64
	for <lists+linux-usb@lfdr.de>; Mon, 22 Mar 2021 10:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhCVJKS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Mar 2021 05:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhCVJKO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Mar 2021 05:10:14 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DCDC061574
        for <linux-usb@vger.kernel.org>; Mon, 22 Mar 2021 02:10:14 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id y1so20049434ljm.10
        for <linux-usb@vger.kernel.org>; Mon, 22 Mar 2021 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M3ncdJbzV5djHe6v5+SxNtTLM9VOiUYBkfdB2EZ54p0=;
        b=fitFgnQG6QMtw/JzvkOrnVmUrblMTTqlVK47ZJi05GgUXlQoW3xkQlJc+4paiJ0HpW
         gElR0avDcty1WB/LpeUvPYjyZE4J24uyQJRdZ/Z/DI5K0EdPPf+0hh7Qz0lQkGH8qqKj
         292wWCg2xP2nK/XgDSvOLU208xnN4HlwtatSogA/Bsp+1pe4U4nXj48I0SWjFtmFt3Cs
         pA9UYB/y+O/tYEm6DCLZ0lUE1jg6JKleGlHuNyakFEwB4ni5sRnu1+x0o0O7KGPjURWz
         uw9WuGNygOzhhRnB1IyCPjKgWPwmqQ37CJdxVrtT+N91y+am/EUk5DHzxp17hJhYwRju
         Zi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M3ncdJbzV5djHe6v5+SxNtTLM9VOiUYBkfdB2EZ54p0=;
        b=uHZcqVvAaiQfWQvvIRMgNmXqGsubiYN+zZ5NHHG1ZIL3d2knbS2UKGJrlKdTPX8liL
         mubhiQm4oNidQxaPotVJC0MLO42Pu/x4i/8CPEsApQAR3OJ9yfbM4VtiwfjEh01tuADD
         wTYX3tlASTzbuyaIezMPPS1da/YIuoQ5vnHdlBSTKXNzs/Je70VZKpHfmWST6GNvIxnT
         Se1/nSLnIZpu20V/ewWASqH8OsnUgW/m6QEwpYxSa3iUXsxXAS2bEYymS8UdhEv0hbba
         XFUfRgYCXrYQuAPw/+qusd3Vjp1LZqmT+nE2BFxi/ooBvwvqF0Vz9Y4P942rdxrr99aZ
         O5nA==
X-Gm-Message-State: AOAM530sJ8SZRNTKOBYR7YFerfMvEZUjViIpu8dTW96pfsBJv6peVLpc
        flK+rGa8gonROdXMdE8eDkA=
X-Google-Smtp-Source: ABdhPJxEIVgP+rJWU9sx0HXklCp2h9hCDU8pwm2UGlXiyJdtyN0eDtRf0Fe9nDLMTSw026CH8bl0Sw==
X-Received: by 2002:a05:651c:481:: with SMTP id s1mr8697891ljc.152.1616404212618;
        Mon, 22 Mar 2021 02:10:12 -0700 (PDT)
Received: from mobilestation ([95.79.86.76])
        by smtp.gmail.com with ESMTPSA id h28sm1498463lfp.155.2021.03.22.02.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 02:10:12 -0700 (PDT)
Date:   Mon, 22 Mar 2021 12:10:10 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: The fix e5f4ca3fce90 broke Intel Edison host mode
Message-ID: <20210322091010.a6h3u2omj52c77zq@mobilestation>
References: <CAHp75VcN8X3dJUrmaO+CiVEu9-1V8eMV_LMFb19_rvVcr2a0gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcN8X3dJUrmaO+CiVEu9-1V8eMV_LMFb19_rvVcr2a0gg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Andy

On Fri, Mar 12, 2021 at 09:33:59PM +0200, Andy Shevchenko wrote:
> Hi!
> 
> The fix in the commit
> e5f4ca3fce90 ("usb: dwc3: ulpi: Fix USB2.0 HS/FS/LS PHY suspend regression")
> effectively broke host mode on Intel Edison.
> 
> When device in a gadget mode and I attach the USB Mass Storage device
> 
> Before: automatically switches to host mode and detects storage and
> everything okay
> After: automatically switches to host mode and that's it.
> 
> Revert, as obviously from above, helps.
> 
> So, please fix this or I will send revert near to rc5,

As I've explained in the patchlog the commit was required because the
original functionality submitted by Felipe three years ago aside with
questionable fix introduced the suspend mode regression. So an access to
any PHY register over the ULPI interface just disabled "Suspend USB 2.0
HS/FS/LS PHY" mode, which made pointless enabling it in the main part of
the driver and consequently increased the USB bus power consumption. See
the commit e0082698b689 ("usb: dwc3: ulpi: conditionally resume ULPI PHY")
for details. It clears the SusPHY flag and never gets it back. Instead it
was enough to wait a little longer in the ULPI RegAccess busy-loop to let
PHY to get out of the suspend mode and restore the link. So to speak
reverting my patch would mean to get the regression back for all
IP-core versions, which isn't what any of us would want.

What I can suggest to you is to investigate the problem more thorough of why
you having the mass storage device undetected after the mode switching.
At least you need to look at the system log and find out whether it's ULPI
Registers commands timeout to blame. If so then I would take a look at the
PHY hardware manual whether it supports the Low-power mode. In any case
most likely setting "snps,dis_u2_susphy_quirk" property in the DWC USB3 DT
node will help you to work around the problem. Declaring that DT-prop will
effectively disable using the LPM for any mode (Host/gadget/DRD), but will
permit PHY suspension on the system suspend procedure (please see
snps,dis_u2_susphy_quirk implementation for details).

-Sergey

> 
> Happy to test any proposed patches! (Maybe Ferry also can help with that)
> 
> -- 
> With Best Regards,
> Andy Shevchenko
