Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17C17FE257
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 17:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbfKOQKk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 11:10:40 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40041 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbfKOQKj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 11:10:39 -0500
Received: by mail-pg1-f193.google.com with SMTP id 15so6216307pgt.7
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2019 08:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i2mKqsHIqvbZAZ0WDjADmYmV16mipx+NhGwUpGMVRPk=;
        b=QSg7P7k6a4NoOiEm/m2KSGEcxDfoo2C5gR2wGSxLJD5BgMDUji6puslnELYQdBdz6s
         8khFRfAUsETkjZgRItEs4Mnk+GYEqLhv3IFErl+wl88rUlxEwSZTXn3sk7eWDHxpn3Ul
         IgScesM3wVVI8PloqgQoGN2ztib+AzNOJXo9Sy4VklgtT0+o6OVFYjdXL1Mz1oerqh/u
         M/CVdBqv5XAh0sgeqHCRXgIFC2SssoZemiHNhKRWgTA7yhqIgLB+RojTozBFhGWbh5Qh
         2ioPm8OZ9TElFQlCO3JscyaeEFXyUubHbLVTu+nBzr3TQdC3m2H9ao/W7EtgnDYSjdla
         1OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i2mKqsHIqvbZAZ0WDjADmYmV16mipx+NhGwUpGMVRPk=;
        b=hRPSxxyKyqDqSKMbkUfgN8MGX/9LWIxbuTvc4d2BJhbOUsIYKYNqJJwsiNn5jA2OXz
         FduF59EXhQTZbiqnnYM5h97HA+eWLywmumiQ4vslgWxHMk9OFdolQ6WskZmenfUTuDyk
         UBFXLHptQX5ZN0bXom9IduBdqO6YaAJKptU3cHFFCF1Q3uO7rCpc/f9QBKHZehi9e+HU
         7xYUz40HTrq2cOgsdOMG+rRB5PCZAFrKrQibH7Uw5m6EAQJS9ioq/8Bts4KOOd/qwIhE
         X6NztgHTzR06F7CNAkGjCLZUqa4et1351bOvnwPpEJJHJUNzXAuhFJtChcsL/7bIZ28H
         Rk+w==
X-Gm-Message-State: APjAAAVMvawOP3otXQnmtfYUS2TluX9WfRqYBGqAVsx4xfMP9NYXTi/4
        uiny40j2w20FDJnlSS1rLmCX4oFNrB0KPK50o7IGdg==
X-Google-Smtp-Source: APXvYqxCQJVDelaYlp2TE9BdKrJmkrXeAepSiSol7SIUphZBcaABb4L7MMBwm+zM8BTq6NAfyAgBvghBbHASw/l+aXA=
X-Received: by 2002:a63:c804:: with SMTP id z4mr17420743pgg.440.1573834237427;
 Fri, 15 Nov 2019 08:10:37 -0800 (PST)
MIME-Version: 1.0
References: <CAAeHK+yyKeV8h6UO2-4zZM_ndUaHcG1Ex5GYHxdmh_GJxDOa4w@mail.gmail.com>
 <Pine.LNX.4.44L0.1911151038480.1527-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1911151038480.1527-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 15 Nov 2019 17:10:26 +0100
Message-ID: <CAAeHK+z6m8mXEH-L+W+8FxjasrMX6BGMEdTq_hgUYerp+_0kjA@mail.gmail.com>
Subject: Re: Exporting USB device ids from the kernel
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 15, 2019 at 4:44 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 15 Nov 2019, Andrey Konovalov wrote:
>
> > Hi Greg and Alan,
> >
> > For USB fuzzing it would be nice to be able to export usb_device_id
> > structs from the kernel to facilitate the fuzzer with generating USB
> > descriptors that match to actual drivers. The same is required for
> > hid_device_id structs, since those are matched separately by the
> > usbhid driver (are there other cases like this?).
> >
> > Currently I have a hacky patch [1] that walks all drivers for USB and
> > HID buses and then prints all device ids for those drivers into the
> > kernel log. Those are manually parsed and built into the fuzzer [2]
> > and then used to generate USB descriptors [3].
>
> There are so many different flags for those id structures, parsing and
> understanding them must be quite difficult.
>
> > I'm thinking of making a proper patch that will add a debugfs entry
> > like usb/drivers (and usb/hid_drivers?), that can be read to get
> > USB/HID device ids for all loaded drivers. Would that be acceptable?
> > Or should I use some other interface to do that?
>
> I can't think of a better way to get the information from a running
> kernel.
>
> There is another possibility, though.  If the drivers are built as
> modules, the information is already available to userspace tools via
> depmod.  You could get it from the modules.dep.bin file.  This has the
> advantage that it will work even for drivers that aren't currently
> loaded.

This is the same thing Greg mentions above, right? Would this work for
drivers that are built into the kernel (as =y)?
