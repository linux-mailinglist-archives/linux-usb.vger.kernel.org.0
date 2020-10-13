Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E5F28CFA2
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 15:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388107AbgJMN6Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 09:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387583AbgJMN6Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Oct 2020 09:58:25 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5C1C0613D0
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2020 06:58:24 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a1so40891pjd.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2020 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4GdnNvEoUKgxX4qOhs3krtiPwGsAdHL1Le9swFYFabo=;
        b=fqz9Lk8Tn3f41eiWhfzfyM8sxQFqw39PVqXAmHDl4gqxgy9SH4gW5iqO2xVGRNuuKT
         EUkrFal2KddYMHBWlPPpZaToe30PfAv7tWMHNaCUCfjSXkJ6U8RD7fvoLjBPkN4/0DpV
         KtebXA47d27sNS3Re0EncSGN7nWVKGWcSVvqOioRjyMPKhS6co87W9JFWm2YjxvrjaXO
         8yTZ2qhubxiYsFMzoHZRUxEUhvoWRx9Da8kDirPV/3wvGgidA+SmxKBr7v8SN6JUjz9A
         a9kLtg/5w7d/9qEmPJHW93kJgoLookI/os79BdAmmfEE16TpmvUhykapN+RqI+BiQMRk
         srhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4GdnNvEoUKgxX4qOhs3krtiPwGsAdHL1Le9swFYFabo=;
        b=LGzKbI51GHJCK1MTpfCxv6kmQQ5fPI4P127+pL55h3SBwI2JYzzvutbhPces9e/aBl
         Je8JI+XLa7NA83A3DfMaktGUyq2fStsw0R3FpEFIuB/61JrIzrYrezbes8JJNhe1NSmO
         lnZFK0BvkPDIlemJ0CLydjZZ7OKNMOpk2FplzaJ/3nEPiW9SPUBe9UAi8/g5rsr8QJ1o
         opztPbmoMOPfJOz76brjfYywKv5aJ119CoWQu86p0TvMShhXMAEFS0YU9ULq1Dfpiocc
         /igiRY939w/bq1oqHGt+pd058NghlRwWH4MjOARkp6oDYH2LRlKJOAK3K0wEZfeqmgHn
         b4Ug==
X-Gm-Message-State: AOAM533yyvC7vQAzrGCm6Paj1E2WHcaidb8+3BhSjKRu6SuvCh/kE8u5
        9Z/7MSZ5uYIyFX4Cr7kZuyyrs7SSWluJJ+/HC0islQ==
X-Google-Smtp-Source: ABdhPJwvC9F2gzr+AS6o+Ox4RKAQqXdjO+PQ5LENDvXkm1/v9K/jJclxQcOPW2gVzXn/gyVhMCrZs4z/IpWWio2WRqg=
X-Received: by 2002:a17:902:b40a:b029:d4:e1c7:db59 with SMTP id
 x10-20020a170902b40ab02900d4e1c7db59mr2623786plr.85.1602597503671; Tue, 13
 Oct 2020 06:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <c229372e5526b84ed0542028437111c2eb83d55f.1602522784.git.andreyknvl@google.com>
 <CACT4Y+aX-LN=tz2Xu3509K1tfrGiLWWKZQwMtRCg059whv-Gvg@mail.gmail.com>
In-Reply-To: <CACT4Y+aX-LN=tz2Xu3509K1tfrGiLWWKZQwMtRCg059whv-Gvg@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 13 Oct 2020 15:58:12 +0200
Message-ID: <CAAeHK+zur-CpmCj2bBucwVSAKkk8XBKZsQoGA8AmWraXuDctvA@mail.gmail.com>
Subject: Re: [PATCH v4] kcov, usb: specify contexts for remote coverage sections
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Shuah Khan <shuah@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Aleksandr Nogikh <nogikh@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 13, 2020 at 8:46 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, Oct 12, 2020 at 7:17 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > Currently there's a KCOV remote coverage collection section in
> > __usb_hcd_giveback_urb(). Initially that section was added based on the
> > assumption that usb_hcd_giveback_urb() can only be called in interrupt
> > context as indicated by a comment before it. This is what happens when
> > syzkaller is fuzzing the USB stack via the dummy_hcd driver.
> >
> > As it turns out, it's actually valid to call usb_hcd_giveback_urb() in task
> > context, provided that the caller turned off the interrupts; USB/IP does
> > exactly that. This can lead to a nested KCOV remote coverage collection
> > sections both trying to collect coverage in task context. This isn't
> > supported by KCOV, and leads to a WARNING.
>
> How does this recursion happen? There is literal recursion in the task
> context? A function starts a remote coverage section and calls another
> function that also starts a remote coverage section?

Yes, a literal recursion. Background thread for processing requests
for USB/IP hub (which we collect coverage from) calls
__usb_hcd_giveback_urb().

Here's the stack trace:

 kcov_remote_start_usb include/linux/kcov.h:52 [inline]
 __usb_hcd_giveback_urb+0x284/0x4b0 drivers/usb/core/hcd.c:1649
 usb_hcd_giveback_urb+0x367/0x410 drivers/usb/core/hcd.c:1716
 vhci_urb_enqueue.cold+0x37f/0x4c5 drivers/usb/usbip/vhci_hcd.c:801
 usb_hcd_submit_urb+0x2b1/0x20d0 drivers/usb/core/hcd.c:1547
 usb_submit_urb+0x6e5/0x13b0 drivers/usb/core/urb.c:570
 usb_start_wait_urb+0x10f/0x2c0 drivers/usb/core/message.c:58
 usb_internal_control_msg drivers/usb/core/message.c:102 [inline]
 usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:153
 hub_set_address drivers/usb/core/hub.c:4472 [inline]
 hub_port_init+0x23f6/0x2d20 drivers/usb/core/hub.c:4748
 hub_port_connect drivers/usb/core/hub.c:5140 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x1cc9/0x38d0 drivers/usb/core/hub.c:5576
 process_one_work+0x7b6/0x1190 kernel/workqueue.c:2269
 worker_thread+0x94/0xdc0 kernel/workqueue.c:2415
 kthread+0x372/0x450 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

> Or is there recursion between task context and softirq context?

No. This kind of recursion is actually supported by kcov right now. A
softirq with a coverage collection section can come in the middle of a
coverage collection section for a task.

> But
> this should not happen if softirq's disabled around
> usb_hcd_giveback_urb call in task context...

[...]

> We do want to collect coverage from usb_hcd_giveback_urb in the task
> context eventually, right?

Ideally, eventually, yes.

> Is this API supposed to be final? Or it only puts down fire re the warning?

Only puts down the fire.

> I don't understand how this API can be used in other contexts.
> Let's say there is recursion in task context and we want to collect
> coverage in task context (the function is only called in task
> context). This API won't help.

No, it won't. Full recursion support is required for this.

> Let's say a function is called from both task and softirq context and
> these can recurse (softirq arrive while in remote task section). This
> API won't help. It will force to choose either task or softirq, but
> let's say you can't make that choice because they are equally
> important.

This currently works, everything that happens in a softirq gets
associated with softirq, everything else - with the task. This seems
to be the only logical approach here, it makes no sense to associate
what happens in a softirq with the task where the softirq happened.

> The API helps to work around the unimplemented recursion in KCOV, but
> it's also specific to this particular case. It's not necessary that
> recursion is specific to one context only and it's not necessary that
> a user can choose to sacrifice one of the contexts.
> Also, if we support recursion in one way or another, we will never
> want to use this API, right?

Correct.
