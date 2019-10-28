Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 131B6E740C
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 15:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390346AbfJ1Owv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 10:52:51 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37432 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730792AbfJ1Owv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Oct 2019 10:52:51 -0400
Received: by mail-pf1-f195.google.com with SMTP id u9so2308019pfn.4
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2019 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r/ZN69HHuOFnS9cWLYatlx74ffqaKAQaJ3cnRG1cgls=;
        b=aYv5EUsMiW22UOQ3r/keTuM97nEFS7f6ZnG3TZWZMk+mlgYkg4IPxuYkN0Ea4JiUU/
         RElwSY1CO0apdpylRiD7LAH0A0vxxyK6eC5MsPMYyO7+beA2XWP5B8BiuH0qeTxiH58g
         w+ENEpCMoEWBO9SMWbHJiCFtLSrm9RVKJdQokxGtrg2oHB5ItmeUs8QrMCRZMKtkPLGm
         qQYG5ARTACj25YopzDiso2dRnkYI7kahXYxE2u0uHQ+0meSnpFMzZPQjej6/N1QVVZVn
         B7aMxwYXeMo3dbSs4V6iT7ZkJjj18GD2NtFExxOpTqv6kC8vpVCVb4daHG6TnxMfjdc5
         7KQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r/ZN69HHuOFnS9cWLYatlx74ffqaKAQaJ3cnRG1cgls=;
        b=QsxEBtDaQJvqWSBKWAZ0eKPSB6zvVPy0tZuErN9MsnSHiq2y7jbHtg3vj9qLE9E0Nu
         jfEhMVcb5CDyFh4E04Za9lVI6svvWg4ET60JlX1XErQxB5+91GQ2/CFOXKoJdpZGn5Vt
         wdALDl/PxY9verQOj/wpjWlU0WPu1kD9xF9C9UmhGkOs7bInB/c6aj3Dmi0FSH3ADZA9
         CIYjQ3cRkkc71qQMLC70oQ8Plt/OEsnIyXCyrEtkzXDDWMirJYytg9J/jFcvdS2CFQO7
         5Mzzp3GC/L5cQDiuh0KiCeg/Z4bFH7KkSJF7t92pBXsTvBa3kWq9sARl3LnezIFthFfw
         mjbg==
X-Gm-Message-State: APjAAAVMlpcySGCGObbl90Lh2fdToO123p5fNXq1ZX8/GM0iYg7sAi1M
        blPK8qbmZjexT3w+U2xZxnbbvu0jeC3AEdJPV0Tjfd2lR0U=
X-Google-Smtp-Source: APXvYqwHpzWpxsE157pTd0mjJtwumeSC9OekC0v14esCLBGinGof1IJSWYv8UJE8cKXcYcgUJhJTTVpDOSWILpO90Fo=
X-Received: by 2002:a63:6bc2:: with SMTP id g185mr2756564pgc.286.1572274370362;
 Mon, 28 Oct 2019 07:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571844200.git.andreyknvl@google.com> <beeae42e313ef57b4630cc9f36e2e78ad42fd5b7.1571844200.git.andreyknvl@google.com>
 <CACT4Y+a6t08RmtSYfF=3TuASx9ReCEe0Qp0AP=GbCtNyL2j+TA@mail.gmail.com>
In-Reply-To: <CACT4Y+a6t08RmtSYfF=3TuASx9ReCEe0Qp0AP=GbCtNyL2j+TA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 28 Oct 2019 15:52:38 +0100
Message-ID: <CAAeHK+w+Q_mM-WEiGFGJXiZQsn1-dnNcPU6i_8YpfispDYv1HA@mail.gmail.com>
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

Although looking at this again: we already check that by calling
kcov_remote_find().

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
>
> Otherwise the series look good to me:
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>
> But Andrew's comments stand. It's possible I understand all of this
> only because I already know how it works and why it works this way.
