Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95613968B5
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 22:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbhEaUYl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 16:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbhEaUYZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 May 2021 16:24:25 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB70C061760
        for <linux-usb@vger.kernel.org>; Mon, 31 May 2021 13:22:39 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id lx17-20020a17090b4b11b029015f3b32b8dbso202704pjb.0
        for <linux-usb@vger.kernel.org>; Mon, 31 May 2021 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LitQBbJQWqQUrB9JZGLzDtkeFx5Okxog/En0Tti53gE=;
        b=Hzj2Y7IVZnBJu0eA1i1vDXHtJ0eeNRHS53gKZ0MoVUGWlbXchGp15RYSRH+XGceC/b
         xozVReTjKTF2fUYdwKQ4TeJwMzgWV4pYQ2LE9H09+sgkhpbGIT/e8RYMJHUbNtkzEyJE
         b5fQ1pw770fgVJIwLbFLwCoNVyh+YKjlNT64E6RDkFyn3ZwShqVMpvlokOXOP0JqYHyf
         2DtpX28+HUdYURadwkDLZoMFXuGrBPnN6IyHvAKeBRllz07euSQOEADuKvUUd+K7wopS
         PQsZ8hZbpRzU3DNEsYiyLBL+m4M1THKJsDM9Ou7iRDi429SBcZpvVXIX1y5eKgS+ZQbx
         VMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LitQBbJQWqQUrB9JZGLzDtkeFx5Okxog/En0Tti53gE=;
        b=Cs5Umcv7P8oP01TDCSSY3bnYALm8XbDI4KgadL5/qxb9d0sR+Q97dWYMJvv6wddAe3
         hQ9FgwE4QXNhbe9Ah/7M2nQg7OWUd/KiG0RmZNRNsEXgd2EOE2iQRQpIQcoKRElkjy32
         7nnRjZrVdhj+DmeTwHiGBvl8TRXu3kYk497BQ0a3t3HF3t+3ZqTxBz+p7GEAkJjVxI4l
         wDCden8NMKmoIEB1ZesVKfCbddDdpsGbDoSjulc8ovQJYegXlVqF41NqzYs3t3YoUnmu
         5ZBlm6pFtoThI7v9PzQBmPgrsHkxpVJZDMukI8UcAroLaOg9G7YXg8XKF2jL2d2P9lEn
         wt5A==
X-Gm-Message-State: AOAM530yqSai1VXL90dSJjbWDlPsL1hYdjthLq6iXoEpt4tgTntg7JCL
        jgZIYzUNgoD5VI8AcRSnenlIYJ7rppbe28FgDbc=
X-Google-Smtp-Source: ABdhPJxvCo5LBNs7zG9x74tAF6CtFFBc4y6ZLt40m8GubSM/TIWAElF4lYwwxtK5ZLqihTdF+dW894fBdXymOjRVAi4=
X-Received: by 2002:a17:90a:af8b:: with SMTP id w11mr21086142pjq.228.1622492559223;
 Mon, 31 May 2021 13:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vc1BHSOfzUg2a1EEV_hNQK_MNNnVKA4wG_tWAWgTmnE9w@mail.gmail.com>
 <YLT3lHWFimB3GiHy@kroah.com> <CAHp75Vdjrj6=8thopwD7OPb-gxyVZx895Vd66mLSA4-BggdcWg@mail.gmail.com>
In-Reply-To: <CAHp75Vdjrj6=8thopwD7OPb-gxyVZx895Vd66mLSA4-BggdcWg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 31 May 2021 23:22:23 +0300
Message-ID: <CAHp75Vc93a67fVqApGZ9qWy9d0yfasrO3S9-Ns7GqdSZSROuEQ@mail.gmail.com>
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

On Mon, May 31, 2021 at 6:45 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, May 31, 2021 at 5:49 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, May 31, 2021 at 05:33:02PM +0300, Andy Shevchenko wrote:
> > > Hi!
> > >
> > > The only patch that made v5.13-rc4 effectively broke USB on Intel Merrifield.
> > >
> > > My reproducer:
> > >  1. Boot with switch in gadget mode
> > >  2. Enable USB ethernet
> > >  3. Switch to host
> > >  4. wait a bit for device enumeration, etc
> > >  5. Switch back
> > >  6. No gadget mode, kernel RCU stall detected (USB become unusable, so
> > > does the system)
> > >
> > > [  115.792620] rcu: INFO: rcu_sched self-detected stall on CPU
> > > [  115.798410] rcu:     0-....: (24089 ticks this GP)
> > > idle=886/1/0x4000000000000000 softirq=3796/3797 fqs=5240
> > > [  115.808333]  (t=21000 jiffies g=6505 q=12158)
> > > [  115.812847] NMI backtrace for cpu 0
> > > [  115.816472] CPU: 0 PID: 23 Comm: kworker/0:1 Not tainted 5.13.0-rc4+ #213
> > > ...
> > >
> > > [  115.977913]  add_dma_entry+0xd4/0x1d0
> > > [  115.981760]  dma_map_page_attrs+0xd8/0x220
> > > [  115.986063]  usb_hcd_map_urb_for_dma+0x3b6/0x4f0
> > > [  115.990895]  usb_hcd_submit_urb+0x98/0xbf0
> > > [  115.995263]  dln2_rx+0x1ae/0x280 [dln2]
> > > ...
> > >
> > > 100% Reproducibility, revert of the 25dda9fc56bd ("usb: dwc3: gadget:
> > > Properly track pending and queued SG") fixes the issue.
> > >
> > > Please, fix it properly or revert. Thanks!
> >
> > Care to send the revert?
>
> Sure, But I want to give Thinh a chance to react to this, maybe it
> would be a better idea.
> Let's say if nothing happens I will send it on Wednesday.

Please, hold on, I have to perform additional testing (something odd
is going on on my side).

-- 
With Best Regards,
Andy Shevchenko
