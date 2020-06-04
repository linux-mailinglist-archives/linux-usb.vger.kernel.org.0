Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258C81EE438
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jun 2020 14:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgFDMJe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jun 2020 08:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgFDMJd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jun 2020 08:09:33 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A8FC08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2020 05:09:32 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id k22so4935254qtm.6
        for <linux-usb@vger.kernel.org>; Thu, 04 Jun 2020 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+jNY0OxQKLd1WvX6JnPs3onyVCUthdyvu9aUn5huzkI=;
        b=L8MKx8WkT410qkYvFSaTqRUr4fVYNHkSx0TMJzFvPuA2qozcz5nNF31doad1qmcZKG
         P+/u60vsnCSow0+vcJywo5Va0rIDFMJI7XeaoXkowyTEd1A4yhgXqJZFl5lMpn1Vr9MN
         gsB2kNOJ1Dbye6GCsOfSyAieGfa9zN8RmLiaawnsVZugTqUP3yMbERpToeMHPoNX+wQO
         J+1uylPX/SIoay8Hu+MJW1JpozVVWfPbXAcE+VjSHVQpSbbt4WR8nzbWsdZeFFl+Wfp7
         EmjmiF7TSLVX7Qm4hr7oiO1r7VTVCt0CkzDw4eb0qlSjivO5ACgwGxQ7h7e+ZS3g6fax
         c2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+jNY0OxQKLd1WvX6JnPs3onyVCUthdyvu9aUn5huzkI=;
        b=Pzm7RIDNA8ntQXrdAm0aBrXQPe4WtYSAMQZ0fvnWYV60aAk52yePNn8Y47qI0oKHB+
         WSA7TszSeoXjgMF3yquLkOOz0yBP+OQswQ3DeNWpvGpZhgkmHgOFYONlaFUvrHIE2fbP
         dl+XJmq5UcjLnhl+X04h7oVDI3h5vn2n9+uduFixU5MPwlylpnl7K38V67KDrQwxUTB9
         e3DzdsIkvnQfLgShxdm19lrEi4ajvkw8sLB+/bbGXrtKyIXn1y1JLVOy7YTs5VjZsPSw
         pD6CddZm21Sr5/QGGSX9syhxmOMOQBoN1c2c9iWfkjTAUhiNNrM01M3vyQnm0arco6CY
         kmjg==
X-Gm-Message-State: AOAM533AB+9Af0puAoMwlTTZUy90GuVncHl1MfeWRESHgmNKMmWxubiy
        f65zzbEhQQulyIIvnNKBc/amTaF0w5ChbyytIgt4kg==
X-Google-Smtp-Source: ABdhPJyC/ODun0saZltRdN6aUWpqSrTbDPEU82krsoQnxXg3qXfZSSCrXgNUXCpEpixt5SDFFEFb5jC0FeGyhciChxA=
X-Received: by 2002:ac8:32dc:: with SMTP id a28mr4156710qtb.158.1591272571334;
 Thu, 04 Jun 2020 05:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585233617.git.andreyknvl@google.com> <6644839d3567df61ade3c4b246a46cacbe4f9e11.1585233617.git.andreyknvl@google.com>
In-Reply-To: <6644839d3567df61ade3c4b246a46cacbe4f9e11.1585233617.git.andreyknvl@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 4 Jun 2020 14:09:20 +0200
Message-ID: <CACT4Y+aH-ScaO4wwciZQbOB-tLXYun3vFwGNf8MOpCQ+JMbptg@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] kcov: move t->kcov assignments into kcov_start/stop
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 26, 2020 at 3:44 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> Every time kcov_start/stop() is called, t->kcov is also assigned, so
> move the assignment into the functions.
>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  kernel/kcov.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index cc5900ac2467..888d0a236b04 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -309,10 +309,12 @@ void notrace __sanitizer_cov_trace_switch(u64 val, u64 *cases)
>  EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
>  #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
>
> -static void kcov_start(struct task_struct *t, unsigned int size,
> -                       void *area, enum kcov_mode mode, int sequence)
> +static void kcov_start(struct task_struct *t, struct kcov *kcov,
> +                       unsigned int size, void *area, enum kcov_mode mode,
> +                       int sequence)
>  {
>         kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
> +       t->kcov = kcov;
>         /* Cache in task struct for performance. */
>         t->kcov_size = size;
>         t->kcov_area = area;
> @@ -326,6 +328,7 @@ static void kcov_stop(struct task_struct *t)
>  {
>         WRITE_ONCE(t->kcov_mode, KCOV_MODE_DISABLED);
>         barrier();
> +       t->kcov = NULL;
>         t->kcov_size = 0;
>         t->kcov_area = NULL;
>  }
> @@ -333,7 +336,6 @@ static void kcov_stop(struct task_struct *t)
>  static void kcov_task_reset(struct task_struct *t)
>  {
>         kcov_stop(t);
> -       t->kcov = NULL;
>         t->kcov_sequence = 0;
>         t->kcov_handle = 0;
>  }
> @@ -584,9 +586,8 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>                         return mode;
>                 kcov_fault_in_area(kcov);
>                 kcov->mode = mode;
> -               kcov_start(t, kcov->size, kcov->area, kcov->mode,
> +               kcov_start(t, kcov, kcov->size, kcov->area, kcov->mode,
>                                 kcov->sequence);
> -               t->kcov = kcov;
>                 kcov->t = t;
>                 /* Put either in kcov_task_exit() or in KCOV_DISABLE. */
>                 kcov_get(kcov);
> @@ -778,7 +779,6 @@ void kcov_remote_start(u64 handle)
>         kcov = remote->kcov;
>         /* Put in kcov_remote_stop(). */
>         kcov_get(kcov);
> -       t->kcov = kcov;
>         /*
>          * Read kcov fields before unlock to prevent races with
>          * KCOV_DISABLE / kcov_remote_reset().
> @@ -792,7 +792,6 @@ void kcov_remote_start(u64 handle)
>         if (!area) {
>                 area = vmalloc(size * sizeof(unsigned long));
>                 if (!area) {
> -                       t->kcov = NULL;
>                         kcov_put(kcov);
>                         return;
>                 }
> @@ -800,7 +799,7 @@ void kcov_remote_start(u64 handle)
>         /* Reset coverage size. */
>         *(u64 *)area = 0;
>
> -       kcov_start(t, size, area, mode, sequence);
> +       kcov_start(t, kcov, size, area, mode, sequence);
>
>  }
>  EXPORT_SYMBOL(kcov_remote_start);
> @@ -873,7 +872,6 @@ void kcov_remote_stop(void)
>                 return;
>
>         kcov_stop(t);
> -       t->kcov = NULL;
>
>         spin_lock(&kcov->lock);
>         /*
> --
> 2.26.0.rc2.310.g2932bb562d-goog
>
