Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1710CE1D4A
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 15:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391683AbfJWNu0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 09:50:26 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33337 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389887AbfJWNuZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 09:50:25 -0400
Received: by mail-qt1-f193.google.com with SMTP id r5so32416246qtd.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2019 06:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YRkY+aBxE9hZdBe1FL06hzEtAF+venmJUi6XuiuleYs=;
        b=Z7umXCP9MjNBDxPLTg06CWYluvjLNqLabwT5jgh+mIUUCO3NtEoNw8SSOy1h2gvBQs
         ti0A6f88arX4+LZVmjzwpPSUcFoX09Ef6GbbDpjhCUl+hVboNOf7Z+I0yex3UmoHTNI4
         pFy9UyRqQLlxWUt4FMv/sQgIKTlzdWxa8ZyljGm0umJ/IDY092SX0ezWjhlv0nZKTBGL
         Fw207fL5ChkW4et6Mv/Kcuu5n6Egiyr/4ILm3tWn6maGZlUeh3qjIY3d8WzHiIjhH0K8
         7nfgM4adsYjAD2BidWLEm0dimQhZWtGeAZCXHU+75V6n3O9urs7kBVw2Jd+3gved2aLR
         tpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YRkY+aBxE9hZdBe1FL06hzEtAF+venmJUi6XuiuleYs=;
        b=YVbEey5UJmSfEuE4OQZOZ62iO2DjGI9tdS3W6Yx7m1KwZ1FkifXJ9qB2zer5dsX7UE
         otHVua/wJQgGsSeQp6ZwFxmCGJjP9zbjyExBLhkAOsFuZgcTqioZptUr4o+buzI9Hi6t
         J0sxcttT760GJZoeQXB7vRx1BznuvKW/xtgleWcaxWHzdqNh5ed7/Y0vrgEr1Cj913DI
         Pto3SSdiRO9o6l3UdWAJZSx7AHSsyW5SyklPqWWC5EhPKCfSTh+t4TvWxRkJ5rnpTTyR
         nrt6YBC01kI2k6u5EZVJ+DjfGx0qZRfTkxsjg3XCtF7PXI/ng1f2PjlursP4jdW4pq3t
         JpjA==
X-Gm-Message-State: APjAAAV38gy7tHttgJlZv6wddlTFaOH2zdyE+AKsyiEEVSTRWp9vU9C6
        oFeCfPJFUI3NVTaqKuvz9nQZDvGZnavATaKad0msKA==
X-Google-Smtp-Source: APXvYqzw4YjCo83icRV+mrEHZmgPfBbFlldrPD5LYUxGJwtTpywYc9LXV0/W6t7MKVG/gnLc8w/UCFAy4gNRXqYJWlg=
X-Received: by 2002:aed:24af:: with SMTP id t44mr8934014qtc.57.1571838623993;
 Wed, 23 Oct 2019 06:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571762488.git.andreyknvl@google.com> <26e088ae3ebcaa30afe957aeabaa9f0c653df7d0.1571762488.git.andreyknvl@google.com>
 <CACT4Y+YntxT+cpESOBvbg+h=g-84ECJwQrFg7LM5tbq_zaMd3A@mail.gmail.com> <CAAeHK+yUTZc+BrGDvvTQD4O0hsDzhp0V6GGFdtnmE6U4yWabKw@mail.gmail.com>
In-Reply-To: <CAAeHK+yUTZc+BrGDvvTQD4O0hsDzhp0V6GGFdtnmE6U4yWabKw@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 23 Oct 2019 15:50:12 +0200
Message-ID: <CACT4Y+b+RTYjUyB1h0SYjEq8vmOZas3ByjeJqVU1LrjxpRKy2Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] vhost, kcov: collect coverage from vhost_worker
To:     Andrey Konovalov <andreyknvl@google.com>
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
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 23, 2019 at 3:35 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Wed, Oct 23, 2019 at 10:36 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > On Tue, Oct 22, 2019 at 6:46 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > >
> > > This patch adds kcov_remote_start()/kcov_remote_stop() annotations to the
> > > vhost_worker() function, which is responsible for processing vhost works.
> > > Since vhost_worker() threads are spawned per vhost device instance
> > > the common kcov handle is used for kcov_remote_start()/stop() annotations
> > > (see Documentation/dev-tools/kcov.rst for details). As the result kcov can
> > > now be used to collect coverage from vhost worker threads.
> > >
> > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > > ---
> > >  drivers/vhost/vhost.c | 6 ++++++
> > >  drivers/vhost/vhost.h | 1 +
> > >  2 files changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > > index 36ca2cf419bf..a5a557c4b67f 100644
> > > --- a/drivers/vhost/vhost.c
> > > +++ b/drivers/vhost/vhost.c
> > > @@ -30,6 +30,7 @@
> > >  #include <linux/sched/signal.h>
> > >  #include <linux/interval_tree_generic.h>
> > >  #include <linux/nospec.h>
> > > +#include <linux/kcov.h>
> > >
> > >  #include "vhost.h"
> > >
> > > @@ -357,7 +358,9 @@ static int vhost_worker(void *data)
> > >                 llist_for_each_entry_safe(work, work_next, node, node) {
> > >                         clear_bit(VHOST_WORK_QUEUED, &work->flags);
> > >                         __set_current_state(TASK_RUNNING);
> > > +                       kcov_remote_start(dev->kcov_handle);
> > >                         work->fn(work);
> > > +                       kcov_remote_stop();
> > >                         if (need_resched())
> > >                                 schedule();
> > >                 }
> > > @@ -546,6 +549,7 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
> > >
> > >         /* No owner, become one */
> > >         dev->mm = get_task_mm(current);
> > > +       dev->kcov_handle = current->kcov_handle;
> >
> > kcov_handle is not present in task_struct if !CONFIG_KCOV
> >
> > Also this does not use KCOV_SUBSYSTEM_COMMON.
> > We discussed something along the following lines:
> >
> > u64 kcov_remote_handle(u64 subsys, u64 id)
> > {
> >   WARN_ON(subsys or id has wrong bits set).
>
> Hm, we can't have warnings in kcov_remote_handle() that is exposed in
> uapi headers. What we can do is return 0 (invalid handle) if subsys/id
> have incorrect bits set. And then we can either have another
> kcov_remote_handle() internally (with a different name though) that
> has a warning, or have warning in kcov_remote_start(). WDYT?

I would probably add the warning to kcov_remote_start(). This avoids
the need for another function and will catch a wrong ID if caller
generated it by some other means.
And then ioctls should also detect bad handles passed in and return
EINVAL. Then we will cover errors for both kernel and user programs.

>
> >   return ...;
> > }
> >
> > kcov_remote_handle(KCOV_SUBSYSTEM_USB, bus);
> > kcov_remote_handle(KCOV_SUBSYSTEM_COMMON, current->kcov_handle);
> >
> >
> > >         worker = kthread_create(vhost_worker, dev, "vhost-%d", current->pid);
> > >         if (IS_ERR(worker)) {
> > >                 err = PTR_ERR(worker);
> > > @@ -571,6 +575,7 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
> > >         if (dev->mm)
> > >                 mmput(dev->mm);
> > >         dev->mm = NULL;
> > > +       dev->kcov_handle = 0;
> > >  err_mm:
> > >         return err;
> > >  }
> > > @@ -682,6 +687,7 @@ void vhost_dev_cleanup(struct vhost_dev *dev)
> > >         if (dev->worker) {
> > >                 kthread_stop(dev->worker);
> > >                 dev->worker = NULL;
> > > +               dev->kcov_handle = 0;
> > >         }
> > >         if (dev->mm)
> > >                 mmput(dev->mm);
> > > diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> > > index e9ed2722b633..a123fd70847e 100644
> > > --- a/drivers/vhost/vhost.h
> > > +++ b/drivers/vhost/vhost.h
> > > @@ -173,6 +173,7 @@ struct vhost_dev {
> > >         int iov_limit;
> > >         int weight;
> > >         int byte_weight;
> > > +       u64 kcov_handle;
> > >  };
> > >
> > >  bool vhost_exceeds_weight(struct vhost_virtqueue *vq, int pkts, int total_len);
> > > --
> > > 2.23.0.866.gb869b98d4c-goog
> > >
