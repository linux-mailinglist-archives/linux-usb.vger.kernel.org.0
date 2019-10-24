Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14D4EE3507
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 16:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409326AbfJXOHS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 10:07:18 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33048 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404950AbfJXOHS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 10:07:18 -0400
Received: by mail-pf1-f193.google.com with SMTP id c184so5716099pfb.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2019 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uJy55SIwOEViP+KRXPJ0Yoq5S5v3p1+WPbnz7NQz+Rw=;
        b=DHleAkBO43p7Td0l0m9fgcBg++GJfNaNysbPHYOR3EDKGcJfyjw+OFG87PHiqq46J0
         b+PjEYAiFPnWvFmBCuHUuh6eAeOek4OscCicD3vplvCzdPMXyu657mMLAMkHbzjhK3jN
         5K77AR3icppTUGMPykEyp4oE112KmrSJj7aOQ6jgUt8wMMmAGTFCPijZCHBiO0GhmhAg
         Cun7dZY3nHT1/wd2XTEYPYzcj//YDCcQ6J2FC+aFksKcn4/Hp9MBI7iUDuDH0U+JUq6a
         7e515Jz29iNCGkWrFI9AwL9HiU33MxNv4ofUHbXEiCz41WSYgUhgyfjgDDn7Tdq8wb+7
         bSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uJy55SIwOEViP+KRXPJ0Yoq5S5v3p1+WPbnz7NQz+Rw=;
        b=s7Eox0cy6frKoKq01uuB6KhYl1fT6BvLkxzhtk+m++h1dAWI1fhU65O7gVQKTyGb5v
         05OF+mmQEkw8onP4VZSBVbsV+RWk2Eym/ng9d9HbxzkYrhpkz43YJ6e2Tr/Dk5j0GCIe
         hGAtZhBg9ljgS1/MaiEsa5xW24DsjEzt/Sr8ZinXqgfik38F0hmRrPRqKzPKt05x1m/y
         liP11PO4QaxmWwto1v+GqSz+iR5G/exgZkxmMT6asCgwW7ZcRK4T3X4QIkue8eW7uzdk
         fFVzengoDG9uFNzGYux0F1nitZvfsjYNglV5tsWNIgRtq073DDukrJQQcqII7hNzPKlp
         a/yg==
X-Gm-Message-State: APjAAAUh4UWvM4nEyYukLyRXv2GeehKL+PtIZiPLtoDmXUgEVItTqKkx
        tCQAzXa1XQ+kPYPNldl5MRqrwMg4p8mClrK0/a8r5w==
X-Google-Smtp-Source: APXvYqyV0t4sRpTwI6AFnypLA2oz7oqaLuam9C1OVUwv5QmmO1DL5KIwlKtuylj4NxY4ud+gg2s3kte/wvyq7XiVR1g=
X-Received: by 2002:a65:4c03:: with SMTP id u3mr16829386pgq.440.1571926037251;
 Thu, 24 Oct 2019 07:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571844200.git.andreyknvl@google.com> <beeae42e313ef57b4630cc9f36e2e78ad42fd5b7.1571844200.git.andreyknvl@google.com>
 <CACT4Y+a6t08RmtSYfF=3TuASx9ReCEe0Qp0AP=GbCtNyL2j+TA@mail.gmail.com>
In-Reply-To: <CACT4Y+a6t08RmtSYfF=3TuASx9ReCEe0Qp0AP=GbCtNyL2j+TA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 24 Oct 2019 16:07:05 +0200
Message-ID: <CAAeHK+xnRSZp5fxikyDzMB18bsDMmCvmrZexrjr_JV3Wgw80Ww@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kcov: remote coverage support
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        David Windsor <dwindsor@gmail.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 24, 2019 at 9:27 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Wed, Oct 23, 2019 at 5:24 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > This patch adds background thread coverage collection ability to kcov.
> ...
> > +static struct kcov_remote *kcov_remote_add(struct kcov *kcov, u64 handle)
> > +{
> > +       struct kcov_remote *remote;
> > +
> > +       if (kcov_remote_find(handle))
> > +               return ERR_PTR(-EEXIST);
> > +       remote = kmalloc(sizeof(*remote), GFP_ATOMIC);
> > +       if (!remote)
> > +               return ERR_PTR(-ENOMEM);
> > +       remote->handle = handle;
> > +       remote->kcov = kcov;
> > +       hash_add(kcov_remote_map, &remote->hnode, handle);
>
> I think it will make sense to check that there is no existing kcov
> with the same handle registered. Such condition will be extremely hard
> to debug based on episodically missing coverage.

Will do in v3.

>
> ...
> >  void kcov_task_exit(struct task_struct *t)
> >  {
> >         struct kcov *kcov;
> > @@ -256,15 +401,23 @@ void kcov_task_exit(struct task_struct *t)
> >         kcov = t->kcov;
> >         if (kcov == NULL)
> >                 return;
> > +
> >         spin_lock(&kcov->lock);
> > +       kcov_debug("t = %px, kcov->t = %px\n", t, kcov->t);
> > +       /*
> > +        * If !kcov->remote, this checks that t->kcov->t == t.
> > +        * If kcov->remote == true then the exiting task is either:
> > +        * 1. a remote task between kcov_remote_start() and kcov_remote_stop(),
> > +        *    in this case t != kcov->t and we'll print a warning; or
>
> Why? Is kcov->t == NULL for remote kcov's? May be worth mentioning in
> the comment b/c it's a very condensed form to check lots of different
> things at once.

For remote kcov instances kcov->t points to the thread that created
the kcov device (I'll update the comment in struct kcov). When a task
is between kcov_remote_start() and kcov_remote_stop(), it's t->kcov
point to the remote kcov. So t is current for this task, and
t->kcov->t is the task that created the kcov instance. I'll expand the
comment to explain this better.

> Otherwise the series look good to me:
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Great, thanks!

>
> But Andrew's comments stand. It's possible I understand all of this
> only because I already know how it works and why it works this way.
