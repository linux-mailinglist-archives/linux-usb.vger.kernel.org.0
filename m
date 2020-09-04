Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C4C25E0DF
	for <lists+linux-usb@lfdr.de>; Fri,  4 Sep 2020 19:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgIDRdZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Sep 2020 13:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgIDRdY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Sep 2020 13:33:24 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED67C061244
        for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2020 10:33:24 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id t3so1811844ook.8
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2020 10:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yOptks9m9uhTb9nDEC5CKpJAlbKLLjxnjF9Rq1qEG60=;
        b=XBqZbhnfPfjekzuDeZY5ETYcRjj4oUkIE8MlXR9q3H8aau/FN5aGTcfPvsAoF0FuUl
         HqSwV/h8LPmKoEojcFGqMnMhhFoN4GvV30DcT7nhhqtmH9kU19VCnnTHe+eHC/I4uzBg
         RbNnxz1sF1lo3Zeu64SRGIYldBnAp60kyC6/QKBaI5jLNb5RdB/mdBPPI6w1HdEi76/p
         DE4YVMN3XpFonvt1AZUjHXIk+20L5Fj9QdSGLyJoURh9nk1NQG1+9ckiAQ/U/H0gftH4
         U72of90v85Xe6+sXMn7mjVTViupIAbMmxFr1VCmqYCLmRCGi0GZMpnD+ZhGxrqT+pYUy
         DELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yOptks9m9uhTb9nDEC5CKpJAlbKLLjxnjF9Rq1qEG60=;
        b=XvLEMM0Q6WAbxg0LIRCaSE9MiLC8sD/rey8DQebLlLDH6sh/ewTQJslHK93x03qy3A
         ahiGyswkS3YkMLp+iJb4VgWx3R5MnKjCm+hiJj3WNGJVukH4d7hZgkqD2zCcXq7QV1G2
         jfxTMUCZ7z35E7FyWaGdVS+6C4+T7g8ejEo7ETIzGYV+saE4iGyI7ipis42ZknwZJQAk
         51N0NJ8S251D+sqB5GSS9Zy0BY3eU2pSp1Ddui+rb6h0rd0vq2gZ8khAPgZmh0x70gjl
         B9qzgy7k8P5FrEHSdTBE0Ls48bLW6MNlqshQpOr/OmvcSyS5QKnvoE0WuU2/caJwzMX0
         8hFA==
X-Gm-Message-State: AOAM530ExbuxJ4h298kozQqXjOhUoMLhsNz8JG3v7gA9ZmM98J39uG48
        RQJGzBADCwJvR//zveqL2Tcbbz5v/PEx6xj1NuY=
X-Google-Smtp-Source: ABdhPJxuxi2wGWhyQ+uslaE92WdxFLk9nIBUFBjfRkSvyx+VwfNyVr04+QmY/zRva7tcKQ50jXwTUAeSl2eLyfprVD4=
X-Received: by 2002:a4a:de4b:: with SMTP id z11mr6643262oot.34.1599240801725;
 Fri, 04 Sep 2020 10:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2008271035320.30454@montezuma.home>
 <0013fe6c-c0a2-1759-c769-cda025e5eb38@infradead.org> <alpine.DEB.2.21.2008271058220.37762@montezuma.home>
 <alpine.DEB.2.21.2008271131570.37762@montezuma.home> <20200828123328.GF174928@kuha.fi.intel.com>
 <alpine.DEB.2.21.2008300220350.37231@montezuma.home> <20200903111047.GH1279097@kuha.fi.intel.com>
In-Reply-To: <20200903111047.GH1279097@kuha.fi.intel.com>
From:   Zwane Mwaikambo <zwanem@gmail.com>
Date:   Fri, 4 Sep 2020 10:33:10 -0700
Message-ID: <CANbjs6Qs9qZQ9vocLmDj=q-C_ndHS3XR6HWnezShb2cqFF=pYA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] usb/typec: fix array overruns in ucsi.c partner_altmode[]
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 3, 2020 at 4:10 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Zwane,
>
> Sorry to keep you waiting. I'm trying to find a board I can use to
> test these...
>
> On Sun, Aug 30, 2020 at 02:26:36AM -0700, Zwane Mwaikambo wrote:
> > con->partner_altmode[i] ends up with the value 0x2 in the call to
> > typec_altmode_update_active because the array has been accessed out of
> > bounds causing a random memory read.
> >
> > This patch fixes the first occurrence and 2/2 the second.
>
> That, when read from the final commit log, does not actually tell you
> anything.


True :( I can resend a v6 to fix that if needed.

Thanks!

>
> > [  565.452023] BUG: kernel NULL pointer dereference, address: 00000000000002fe
> > [  565.452025] #PF: supervisor read access in kernel mode
> > [  565.452026] #PF: error_code(0x0000) - not-present page
> > [  565.452026] PGD 0 P4D 0
> > [  565.452028] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > [  565.452030] CPU: 0 PID: 502 Comm: kworker/0:3 Not tainted 5.8.0-rc3+ #1
> > [  565.452031] Hardware name: LENOVO 20RD002VUS/20RD002VUS,
> > BIOS R16ET25W (1.11 ) 04/21/2020
> > [  565.452034] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
> > [  565.452039] RIP: 0010:typec_altmode_update_active+0x1f/0x100 [typec]
> > [  565.452040] Code: 0f 1f 84 00 00 00 00 00 0f 1f 00 0f 1f 44 00 00 55 48
> > 89 e5 41 54 53 48 83 ec 10 65 48 8b 04 25 28 00 00 00 48 89 45 e8 31 c0
> > <0f> b6 87 fc 02 00 00 83 e0 01 40 38 f0 0f 84 95 00 00 00 48 8b 47
> > [  565.452041] RSP: 0018:ffffb729c066bdb0 EFLAGS: 00010246
> > [  565.452042] RAX: 0000000000000000 RBX: ffffa067c3e64a70 RCX: 0000000000000000
> > [  565.452043] RDX: ffffb729c066bd20 RSI: 0000000000000000 RDI: 0000000000000002
> > [  565.452044] RBP: ffffb729c066bdd0 R08: 00000083a7910a4f R09: 0000000000000000
> > [  565.452044] R10: ffffffffa106a220 R11: 0000000000000000 R12: 0000000000000000
> > [  565.452045] R13: ffffa067c3e64a98 R14: ffffa067c3e64810 R15: ffffa067c3e64800
> > [  565.452046] FS:  0000000000000000(0000) GS:ffffa067d1400000(0000)
> > knlGS:0000000000000000
> > [  565.452047] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  565.452048] CR2: 00000000000002fe CR3: 00000001b060a003 CR4: 00000000003606f0
> > [  565.452048] Call Trace:
> > [  565.452052]  ucsi_altmode_update_active+0x83/0xd0 [typec_ucsi]
> > [  565.452054]  ucsi_handle_connector_change+0x1dc/0x320 [typec_ucsi]
> > [  565.452057]  process_one_work+0x1df/0x3d0
> > [  565.452059]  worker_thread+0x4d/0x3d0
> > [  565.452060]  ? process_one_work+0x3d0/0x3d0
> > [  565.452062]  kthread+0x127/0x170
> > [  565.452063]  ? kthread_park+0x90/0x90
> > [  565.452065]  ret_from_fork+0x1f/0x30
> >
> > The failing instruction is;
> >
> > 0x0000000000000380 <+0>:     callq  0x385 <typec_altmode_update_active+5>
> > 0x0000000000000385 <+5>:     push   %rbp
> > 0x0000000000000386 <+6>:     mov    %rsp,%rbp
> > 0x0000000000000389 <+9>:     push   %r12
> > 0x000000000000038b <+11>:    push   %rbx
> > 0x000000000000038c <+12>:    sub    $0x10,%rsp
> > 0x0000000000000390 <+16>:    mov    %gs:0x28,%rax
> > 0x0000000000000399 <+25>:    mov    %rax,-0x18(%rbp)
> > 0x000000000000039d <+29>:    xor    %eax,%eax
> > 0x000000000000039f <+31>:    movzbl 0x2fc(%rdi),%eax <======
> > 0x00000000000003a6 <+38>:    and    $0x1,%eax
> >
> > (gdb) list  *typec_altmode_update_active+0x1f
> > 0x39f is in typec_altmode_update_active (drivers/usb/typec/class.c:221).
> > 216      */
> > 217     void typec_altmode_update_active(struct typec_altmode *adev, bool active)
> > 218     {
> > 219             char dir[6];
> > 220
> > 221             if (adev->active == active)
> > 222                     return;
> > 223
> > 224             if (!is_typec_port(adev->dev.parent) && adev->dev.driver) {
> > 225                     if (!active)
> >
> > (gdb) list *ucsi_altmode_update_active+0x83
> > 0x12a3 is in ucsi_altmode_update_active (drivers/usb/typec/ucsi/ucsi.c:221).
> > 216             }
> > 217
> > 218             if (cur < UCSI_MAX_ALTMODES)
> > 219                     altmode = typec_altmode_get_partner(con->port_altmode[cur]);
> > 220
> > 221             for (i = 0; con->partner_altmode[i]; i++)
> > 222                     typec_altmode_update_active(con->partner_altmode[i],
> > 223                                                con->partner_altmode[i] == altmode);
> > 224     }
> >
> > Fixes: ad74b8649beaf ("usb: typec: ucsi: Preliminary support for alternate modes")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Zwane Mwaikambo <zwane@yosper.io>
> > ---
> > v2 addresses both instances of array overrun
> > v3 addresses patch submission/formatting issues
> > v4 addresses patch submission/formatting issues
> > v5 adds and cc to stable
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index affd024190c9..16906519c173 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -218,9 +218,10 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
> >       if (cur < UCSI_MAX_ALTMODES)
> >               altmode = typec_altmode_get_partner(con->port_altmode[cur]);
> >
> > -     for (i = 0; con->partner_altmode[i]; i++)
> > -             typec_altmode_update_active(con->partner_altmode[i],
> > -                                         con->partner_altmode[i] == altmode);
> > +     for (i = 0; i < UCSI_MAX_ALTMODES; i++)
> > +             if (con->partner_altmode[i])
> > +                     typec_altmode_update_active(con->partner_altmode[i],
> > +                             con->partner_altmode[i] == altmode);
> >  }
> >
> >  static u8 ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
> >
>
> thanks,
>
> --
> heikki
