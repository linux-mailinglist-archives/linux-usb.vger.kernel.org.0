Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2960EB8D7A
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 11:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405541AbfITJN3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 05:13:29 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45910 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393257AbfITJN3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 05:13:29 -0400
Received: by mail-qt1-f194.google.com with SMTP id c21so7791179qtj.12
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 02:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VlblYw9TvKcNF0r0/4U6mzJHTJUBEAcX9p89G4lUkMM=;
        b=Bh7rAcJ+Z8M9KMVeylsz3VmDTlxHaB+4J1UJzH75O8ctOEE7pvI7o7aGTJx27ANulU
         p67tLmA8zJynklmNRg6wzuesm55ZyhY1xPOOzsOqtK8EtTSOjKmpV/gtDucYg/RJDvdP
         VWx6LZnUVW8BCjLSdUKHVFgzfb+56ORYKPQiWMc+g1MHcO2jVCSMFWuE6yaX0f63pOSw
         zvpqn7iHJtTa1SClJbkV9vgRWmShinm3+jiii5PBAZo/vVf0JfBwzYpkBiyV60jVA6JS
         auV5oyOLd31/JN/LdqLA6e3ud17fk1+C0jr+WRW7FySVEemqoMKIm/Xe0mMfg2S3VB2c
         Sd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VlblYw9TvKcNF0r0/4U6mzJHTJUBEAcX9p89G4lUkMM=;
        b=htMu8oGBRYZSSoCvSPLa6PC3z11UHvZqX9Uv8qcpqd7tKwr3S0OSfkym2cR6CN49zA
         SOqHOUrmy54fvvX63yHnjtna7V1IVfw6oapLaXbvXJOGATblRNdLL9NxpyZSQ7ndtc7B
         NK5ozU98SQ7gc+VqpLMtAIUsIg3tVs24pJJnaKdLkPeCqLpbIsyKFBBEApRaTNF/ZoaH
         QEnxgCq66UtkTjz+6SYSXqLRLOJb0NJ9Lf/8+M6ohIeh1Lgq2OqrHx0yYaFyWG9Nau/g
         Qio/1UUIeVCMsub8ywIU/r6yzhJhLJ7WvVf8wLqghzG9EiC1R79esITkNt4pfe7Encxw
         Za+w==
X-Gm-Message-State: APjAAAWPHeurjpTo3O+xUoBA+eu0zc+znc96M5FadVpZaDBBYjC9g50H
        MRWQ2DcUvnnKoJSLiidJ5UhOKVVmi7jMw6oPnV0Vh9Qm1wc=
X-Google-Smtp-Source: APXvYqznVzhQy/Ch1GCHLQCgO3zRcYq+M3+/6Epf0aN0IiVeQKkuBw0n4Oj+NkjQca5yuIyFu5gxNYJSw33yFfMIhHA=
X-Received: by 2002:ac8:4a8d:: with SMTP id l13mr2205266qtq.158.1568970807239;
 Fri, 20 Sep 2019 02:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000d12d24058f5d6b65@google.com> <000000000000a12822058fb4f408@google.com>
 <20190920090803.GM30545@localhost>
In-Reply-To: <20190920090803.GM30545@localhost>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 20 Sep 2019 11:13:14 +0200
Message-ID: <CACT4Y+Yg5wTsMUGRmTwexKUMzi1ZxrH3k3yaMaJvLaEp7qnjSw@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in adu_disconnect
To:     Johan Hovold <johan@kernel.org>
Cc:     syzbot <syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        dmg@turingmachine.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 20, 2019 at 11:08 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Aug 09, 2019 at 01:24:04PM -0700, syzbot wrote:
> > syzbot has found a reproducer for the following crash on:
> >
> > HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=13871a4a600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> > dashboard link: https://syzkaller.appspot.com/bug?extid=0243cb250a51eeefb8cc
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c4c8e2600000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11d80d2c600000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com
> >
> > usb 1-1: USB disconnect, device number 4
> > ==================================================================
> > BUG: KASAN: use-after-free in atomic64_read
> > include/asm-generic/atomic-instrumented.h:836 [inline]
> > BUG: KASAN: use-after-free in atomic_long_read
> > include/asm-generic/atomic-long.h:28 [inline]
> > BUG: KASAN: use-after-free in __mutex_unlock_slowpath+0x96/0x670
> > kernel/locking/mutex.c:1211
> > Read of size 8 at addr ffff8881d1d0aa00 by task kworker/0:1/12
>
> Let's resend and retest with commit id from latest report to make sure
> the patch was actually applied during the last run:

The reply contains:
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1440268d600000
that's what's being parsed and applied during testing.


> #syz test: https://github.com/google/kasan.git e96407b4
>
> Johan
>
>
> From 6f09430ae18085a1552fc641e53d3a3e678db6f3 Mon Sep 17 00:00:00 2001
> From: Johan Hovold <johan@kernel.org>
> Date: Thu, 19 Sep 2019 11:48:38 +0200
> Subject: [PATCH] USB: adutux: fix use-after-free on disconnect
>
> The driver was clearing its struct usb_device pointer, which it uses as
> an inverted disconnected flag, before deregistering the character device
> and without serialising against racing release().
>
> This could lead to a use-after-free if a racing release() callback
> observes the cleared pointer and frees the driver data before
> disconnect() is finished with it.
>
> This could also lead to NULL-pointer dereferences in a racing open().
>
> Fixes: f08812d5eb8f ("USB: FIx locks and urb->status in adutux (updated)")
> Reported-by: syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com
> Cc: stable <stable@vger.kernel.org>     # 2.6.24
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>
>  drivers/usb/misc/adutux.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
> index 344d523b0502..bcc138990e2f 100644
> --- a/drivers/usb/misc/adutux.c
> +++ b/drivers/usb/misc/adutux.c
> @@ -762,14 +762,15 @@ static void adu_disconnect(struct usb_interface *interface)
>
>         dev = usb_get_intfdata(interface);
>
> -       mutex_lock(&dev->mtx);  /* not interruptible */
> -       dev->udev = NULL;       /* poison */
>         usb_deregister_dev(interface, &adu_class);
> -       mutex_unlock(&dev->mtx);
>
>         mutex_lock(&adutux_mutex);
>         usb_set_intfdata(interface, NULL);
>
> +       mutex_lock(&dev->mtx);  /* not interruptible */
> +       dev->udev = NULL;       /* poison */
> +       mutex_unlock(&dev->mtx);
> +
>         /* if the device is not opened, then we clean up right now */
>         if (!dev->open_count)
>                 adu_delete(dev);
> --
> 2.23.0
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20190920090803.GM30545%40localhost.
