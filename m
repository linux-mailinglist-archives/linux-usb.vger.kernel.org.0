Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A05C229073C
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 16:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408890AbgJPOdf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 10:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408881AbgJPOdc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Oct 2020 10:33:32 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8858EC061755
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2020 07:33:32 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id f21so2087004qko.5
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2020 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5B2JHx1oEsLnYhPJ0E0oLsxJSDwxjG1w2DFx5zPQCSM=;
        b=Oe/2QOCSG/SDi0QQrY46fSiCcCIK2j3PJumDTv536yxaxYM4LY2q5W62Nzl8BTk/xG
         C5LteZVDRMdC+rJH0F64uebkLipY9PuIOWof+ZEwMDCWzY90R1r52WR2MOMyFuEAxo7x
         a2pcBC+vxs2HImfAC3aYVyYEvYeN9LUWhPiN482y/5zeOkitXcziNyPS5iwbLHR8s81J
         jnFo4d8ht2QN99WibP6Vilm16N0AI4qoDvZJjG5PjRMiyx3Lf1rQb3Ji3fb4USS40qqI
         wDzTdQyEK3fuRpMf/QmVX9rWWlBgYvrLhBNbBcehMkmxKrbC9UqzyJJCD+K65zkFl0pM
         tqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5B2JHx1oEsLnYhPJ0E0oLsxJSDwxjG1w2DFx5zPQCSM=;
        b=nKl8AP+oiwZt55Iyxs9+K0keQHDO9IRA3SYsQHX5l+DfN1muWvkDka7n0b+XlXtS/N
         4p435L5h+mgVxe2Y3/0PVzNomwJPJN3dmKo01z/xoWjbd+RxuVypo9n67bwWZulfZbe4
         R4s0hOKesgvwxwzY4wISTheYCcOJvsUlBA6TrNbtWa4ULLekBrawI7TExOZuGEbAhRUG
         j+I5l+1yFYy2TGlG0XZ+XmOvZf73WmRU4GwXKQ3r53Io6K5LD/5IrxHwuWCmlB4vA0MR
         DoDxJQt+T3bPVmVAVnKz81CVCtHqKrNUzl9xockri2vE0x/uAt7VDvu4EERhbI+bl0Qs
         lU9A==
X-Gm-Message-State: AOAM533I27KOx9kSq5c96q+UxKmRm+wvb5KhwvNx67pu+RDzvg1ih7UY
        ExmP60KeXMmiYWni+XbSj5ZGdCdKWPoua+qMn5xfDA==
X-Google-Smtp-Source: ABdhPJzOJJ39ZBF5KaEMQ76r/h2btQRvYOvm74EvptPnSWp8UnZ/OFvXcD5bVPD6sLskLrqThHaqMucuZlnGVojmHa4=
X-Received: by 2002:a05:620a:1188:: with SMTP id b8mr1888251qkk.265.1602858811326;
 Fri, 16 Oct 2020 07:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <f3a7a153f0719cb53ec385b16e912798bd3e4cf9.1602856358.git.andreyknvl@google.com>
In-Reply-To: <f3a7a153f0719cb53ec385b16e912798bd3e4cf9.1602856358.git.andreyknvl@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 16 Oct 2020 16:33:19 +0200
Message-ID: <CACT4Y+a4RZvZf=XjvE8eUTma8n5y-pqSxG=f37LRUjPwaVVm2w@mail.gmail.com>
Subject: Re: [PATCH v4] kcov, usb: only collect coverage from
 __usb_hcd_giveback_urb in softirq
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Shuah Khan <shuah@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Nazime Hande Harputluoglu <handeharput@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 16, 2020 at 3:57 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> Currently there's a KCOV remote coverage collection section in
> __usb_hcd_giveback_urb(). Initially that section was added based on the
> assumption that usb_hcd_giveback_urb() can only be called in interrupt
> context as indicated by a comment before it. This is what happens when
> syzkaller is fuzzing the USB stack via the dummy_hcd driver.
>
> As it turns out, it's actually valid to call usb_hcd_giveback_urb() in task
> context, provided that the caller turned off the interrupts; USB/IP does
> exactly that. This can lead to a nested KCOV remote coverage collection
> sections both trying to collect coverage in task context. This isn't
> supported by KCOV, and leads to a WARNING.
>
> Change __usb_hcd_giveback_urb() to only call kcov_remote_*() callbacks
> when it's being executed in a softirq. As the result, the coverage from
> USB/IP related usb_hcd_giveback_urb() calls won't be collected, but the
> WARNING is fixed.
>
> A potential future improvement would be to support nested remote coverage
> collection sections, but this patch doesn't address that.
>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> Acked-by: Marco Elver <elver@google.com>
> ---
>
> Changes v3->v4:
> - Don't make any kcov changes, do a softirq context check in usb code
>   instead.
>
> ---
>  drivers/usb/core/hcd.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index a33b849e8beb..2f6a39e09dc6 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1646,9 +1646,16 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
>
>         /* pass ownership to the completion handler */
>         urb->status = status;
> -       kcov_remote_start_usb((u64)urb->dev->bus->busnum);
> +       /*
> +        * This function can be called in task context inside another remote
> +        * coverage collection section, but KCOV doesn't support that kind of
> +        * recursion yet. Only collect coverage in softirq context for now.
> +        */
> +       if (in_serving_softirq())
> +               kcov_remote_start_usb((u64)urb->dev->bus->busnum);
>         urb->complete(urb);
> -       kcov_remote_stop();
> +       if (in_serving_softirq())
> +               kcov_remote_stop();

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Looks simpler :)

>         usb_anchor_resume_wakeups(anchor);
>         atomic_dec(&urb->use_count);
> --
> 2.29.0.rc1.297.gfa9743e501-goog
>
