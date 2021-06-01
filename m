Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F47E39791F
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 19:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234294AbhFARdI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 13:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbhFARdH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Jun 2021 13:33:07 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A19C061574
        for <linux-usb@vger.kernel.org>; Tue,  1 Jun 2021 10:31:24 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id m8-20020a17090a4148b029015fc5d36343so109625pjg.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Jun 2021 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+rNu5BKrHXq6GeHu34TfeZR/b6RKpdGImwlc7G9LKeo=;
        b=BIdkmYsVV1cscyNRi1gcIiC4h25liSDFvRvSC4cuJOpUFcaiHjZbnx3z15HJp+N+lO
         Syx2+U6Yv4iif34UBHgYIGi+k909qUmSC5UkIISsg5GhxEoP25orLDIuewsqEOHEMQmV
         5e7f5QObmOXm5KkQPgU7VCYBWpyNfnoEHx1G2N+ER8cSynAZOL0x0Z5ofwgwsnDXeDBA
         5tQ2wkgGSn9sb18eisTB0GT/r4IPwMHYVUgmXnitGoVgspYCVY66ayhO4SAEeZj49KEH
         Q42+PRnilRVOg7wqXZ+RjaZ6JkagEa1ZPN2cvjojz34G0iij4nUOGnnqNnnjbYC6SuDd
         V6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+rNu5BKrHXq6GeHu34TfeZR/b6RKpdGImwlc7G9LKeo=;
        b=FOcB8IiIqli7zgGsIJD5NdIpfhf1DIea57LWTxQZpcAwGQoQI+MPq0IxgZIq8QWw74
         7gJF+4t72/kq2PUM+Gl1Budc2cGRMVlRciE67XkhWfCCijDVK5ZOm8rLIxakzEyaXPtA
         FgIGjB3yYHthAu/5Q6X5jyydlVq/kRnbV06gYvbE1VfhOx2aOicBvcTcuaVjU7l4Cda5
         GViPn+ZyIx9dJ0qnjY5xPIb/8wu7Nj2iENvHgfWmuOGAc439c7Jb7kta4EHfiUwUtdKK
         kQbo3sS1lVfoSXhYqAOkknGlvkjK6f3YLa+fj+/Dl75HJJNSW7/ukLPwW+3y03Rj5C+U
         U3RQ==
X-Gm-Message-State: AOAM531bA5e+l8cSdvE6RaM37LryepZ/yQWMoU3pGGRiwDwGf2kdTC60
        7ImitpSzpU7J2VEiUwoz+2Sq3PA/zsiGi/EsI2UR3gtTPTc=
X-Google-Smtp-Source: ABdhPJyT1aI/DexJbQgotcJmPdSKX0WdtuTUgP1PWG8vyBZ7uNLvVR7F+A6sBJna/9EJF7m/ghFHBSlYFjcnCSgZiDo=
X-Received: by 2002:a17:90a:80c5:: with SMTP id k5mr962075pjw.129.1622568683754;
 Tue, 01 Jun 2021 10:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vc1BHSOfzUg2a1EEV_hNQK_MNNnVKA4wG_tWAWgTmnE9w@mail.gmail.com>
 <YLT3lHWFimB3GiHy@kroah.com> <CAHp75Vdjrj6=8thopwD7OPb-gxyVZx895Vd66mLSA4-BggdcWg@mail.gmail.com>
 <CAHp75Vc93a67fVqApGZ9qWy9d0yfasrO3S9-Ns7GqdSZSROuEQ@mail.gmail.com>
In-Reply-To: <CAHp75Vc93a67fVqApGZ9qWy9d0yfasrO3S9-Ns7GqdSZSROuEQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 1 Jun 2021 20:31:07 +0300
Message-ID: <CAHp75VfJidDcBROMH6iQucZ5WkEgQ6mmbcL3qow1uHnwh2xDeg@mail.gmail.com>
Subject: Re: v5.13-rc3 --> v5.13-rc4 DWC3 breakage
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB <linux-usb@vger.kernel.org>, Ferry Toth <fntoth@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 31, 2021 at 11:22 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, May 31, 2021 at 6:45 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, May 31, 2021 at 5:49 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, May 31, 2021 at 05:33:02PM +0300, Andy Shevchenko wrote:
> > > > Hi!
> > > >
> > > > The only patch that made v5.13-rc4 effectively broke USB on Intel Merrifield.
> > > >
> > > > My reproducer:
> > > >  1. Boot with switch in gadget mode
> > > >  2. Enable USB ethernet
> > > >  3. Switch to host
> > > >  4. wait a bit for device enumeration, etc
> > > >  5. Switch back
> > > >  6. No gadget mode, kernel RCU stall detected (USB become unusable, so
> > > > does the system)
> > > >
> > > > [  115.792620] rcu: INFO: rcu_sched self-detected stall on CPU
> > > > [  115.798410] rcu:     0-....: (24089 ticks this GP)
> > > > idle=886/1/0x4000000000000000 softirq=3796/3797 fqs=5240
> > > > [  115.808333]  (t=21000 jiffies g=6505 q=12158)
> > > > [  115.812847] NMI backtrace for cpu 0
> > > > [  115.816472] CPU: 0 PID: 23 Comm: kworker/0:1 Not tainted 5.13.0-rc4+ #213
> > > > ...
> > > >
> > > > [  115.977913]  add_dma_entry+0xd4/0x1d0
> > > > [  115.981760]  dma_map_page_attrs+0xd8/0x220
> > > > [  115.986063]  usb_hcd_map_urb_for_dma+0x3b6/0x4f0
> > > > [  115.990895]  usb_hcd_submit_urb+0x98/0xbf0
> > > > [  115.995263]  dln2_rx+0x1ae/0x280 [dln2]
> > > > ...
> > > >
> > > > 100% Reproducibility, revert of the 25dda9fc56bd ("usb: dwc3: gadget:
> > > > Properly track pending and queued SG") fixes the issue.
> > > >
> > > > Please, fix it properly or revert. Thanks!
> > >
> > > Care to send the revert?
> >
> > Sure, But I want to give Thinh a chance to react to this, maybe it
> > would be a better idea.
> > Let's say if nothing happens I will send it on Wednesday.
>
> Please, hold on, I have to perform additional testing (something odd
> is going on on my side).

It appears that the reported patch has nothing to do with the issue.
It "luckily" helped, but under more tests I managed to dive as deep as
v5.11 and got the same issue. I will continue investigating and will
inform / send patch / etc when I find more robust reproducer. Anyway
it's not the reported patch for sure, sorry for the noise.

(It seems I'm looking in a wrong corner< I have some ideas, but it
requires time to check)

-- 
With Best Regards,
Andy Shevchenko
