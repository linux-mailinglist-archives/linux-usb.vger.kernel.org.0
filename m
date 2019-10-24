Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D44DAE2B0E
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 09:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408577AbfJXH1F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 03:27:05 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40869 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408568AbfJXH1F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 03:27:05 -0400
Received: by mail-qt1-f195.google.com with SMTP id o49so28633210qta.7
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2019 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rR+/2C/x3kiaj39AAUm04JfYyfeKX8N8SiuzYvghj0s=;
        b=hrzuVLf6ajJ+WcLgB9Lbeu+QpAKrWbF2mPO3sT9AzVHmiPQ8GqYWJy+AD/rywikhqB
         kIC2LFBHqmBatWlJcp+iSROqXmTBz7Dd++TJT5kItpu82Z9Gty9fgCQ4N9UWAAHbwP0F
         A4Y9IuMKaITHBf9ElHLWQpsXNa1+seMtGTfUDEwXo1HoTQN4WuLIZROZLtq9P0s3Uldb
         1eevF1n6l3IiVU0DYm0huy3PlsYWiOIvPsX6Nm7PYpi+djps9p7blVDq638WYodKNHRM
         KLn+qX1P9g6t+BtjPQywgvJJjDDsSc5C0xltydxvDS6PIejjVYDnTS07VNS5svGYtvP6
         MvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rR+/2C/x3kiaj39AAUm04JfYyfeKX8N8SiuzYvghj0s=;
        b=J1HV8zj6/jsdiHP1otBFglUwOE28Xmn+4lz3zciTjHWaeSjtAgnAtuFBZJW21krMUP
         gXoe/UEkNl/TNwVkiR8p+F6YcqAxY5eDJTorIH4pLk1TnFitpD71qemMglDyXm5hTasg
         8x1c8jaZT6beFlXEc3qJEHxBDerwgbkAO2Er8KZ+jBgq39UhtvqrY2qWk7JWTWpQYerb
         KH0GtYfa0G183GaSXetmp3Vg6wf4VFsxCMGaPdz9xTftmx13hEbIG9qg3Jh5xXinQbEU
         NpgksJTMI1/YxTqF4dZDUegCDHahUMZW15mVHEnID6W/FK+bsVb4QuPeqiXuwCSbZKBQ
         x6xQ==
X-Gm-Message-State: APjAAAX9a0YvQDYM8DACm8YWpoITopJZlCE73CunC9KRPTe/oKIFmyX4
        bNDlcHKQGw+c3iIYthnjuebLZWmRdb9c3//U6atxFw==
X-Google-Smtp-Source: APXvYqzLkvPiMyJIYtWQ5uRQfPL6nkIrOlG3sj9/1E1Wc1lj5bM1AzSKU18YzvgzGKdHfFrN7b/Qd0KdcTZhcyEtoVY=
X-Received: by 2002:a0c:95ca:: with SMTP id t10mr7062131qvt.22.1571902023325;
 Thu, 24 Oct 2019 00:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571844200.git.andreyknvl@google.com> <beeae42e313ef57b4630cc9f36e2e78ad42fd5b7.1571844200.git.andreyknvl@google.com>
In-Reply-To: <beeae42e313ef57b4630cc9f36e2e78ad42fd5b7.1571844200.git.andreyknvl@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 24 Oct 2019 09:26:52 +0200
Message-ID: <CACT4Y+a6t08RmtSYfF=3TuASx9ReCEe0Qp0AP=GbCtNyL2j+TA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kcov: remote coverage support
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
        Anders Roxell <anders.roxell@linaro.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 23, 2019 at 5:24 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> This patch adds background thread coverage collection ability to kcov.
...
> +static struct kcov_remote *kcov_remote_add(struct kcov *kcov, u64 handle)
> +{
> +       struct kcov_remote *remote;
> +
> +       if (kcov_remote_find(handle))
> +               return ERR_PTR(-EEXIST);
> +       remote = kmalloc(sizeof(*remote), GFP_ATOMIC);
> +       if (!remote)
> +               return ERR_PTR(-ENOMEM);
> +       remote->handle = handle;
> +       remote->kcov = kcov;
> +       hash_add(kcov_remote_map, &remote->hnode, handle);

I think it will make sense to check that there is no existing kcov
with the same handle registered. Such condition will be extremely hard
to debug based on episodically missing coverage.

...
>  void kcov_task_exit(struct task_struct *t)
>  {
>         struct kcov *kcov;
> @@ -256,15 +401,23 @@ void kcov_task_exit(struct task_struct *t)
>         kcov = t->kcov;
>         if (kcov == NULL)
>                 return;
> +
>         spin_lock(&kcov->lock);
> +       kcov_debug("t = %px, kcov->t = %px\n", t, kcov->t);
> +       /*
> +        * If !kcov->remote, this checks that t->kcov->t == t.
> +        * If kcov->remote == true then the exiting task is either:
> +        * 1. a remote task between kcov_remote_start() and kcov_remote_stop(),
> +        *    in this case t != kcov->t and we'll print a warning; or

Why? Is kcov->t == NULL for remote kcov's? May be worth mentioning in
the comment b/c it's a very condensed form to check lots of different
things at once.

Otherwise the series look good to me:

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

But Andrew's comments stand. It's possible I understand all of this
only because I already know how it works and why it works this way.
