Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA72717E506
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 17:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbgCIQvc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 12:51:32 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33624 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgCIQvc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 12:51:32 -0400
Received: by mail-pg1-f195.google.com with SMTP id m5so4982784pgg.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2020 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xHZH9VPoV7Aw9k1SYgU1P5fuT1bpUuCxKis+NgkeAi4=;
        b=SAQB+ReXBf03G48PPlwT/2/hiTQS/zA919hfI+DABNqfxCBHhfS2gaRAnqvf2zBCfK
         k3lgQldAhd1zjiz42r44pfx/dTYu2E/TXw63gXqHKNqavk3qPITmhxdbPQPyI+I6xjfI
         uuL9ycD/ULdCCi5f884HNw089C2R3zOlMiMPpN1rlgiUoE+KRIUBFrSJo38SFGnbFnhF
         J3+auI54wolvsaQ8TeS4lJaFYJe7tSf1g1TCvuhusdAAWV9f+UmZmoDMfomHacIODQi0
         mN9WUhn7T/TRBykNv9iU33nVwZtL/kWKJ54E0c1PkBf4LRQbv86unsPLE9cBqXp2D7WE
         xO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xHZH9VPoV7Aw9k1SYgU1P5fuT1bpUuCxKis+NgkeAi4=;
        b=ldOzVToQma3TtdaHCsuNWExPT9TMfqoZM4+VftlciZ4qn7P5nw6ZUxjAOc86FHgjcQ
         zefBbNiylziWR8xgcl210pKvsG+0OepHSyP+GZpx2xuOXZTozHttZpMN3ur3RwMh+t4J
         aKtAPQZ0ebcrl2AeGeXvzqFNqqs2VOk1S63G7DAUEHo1OHuMKcQpzjMMg10l0juNoqG4
         rq+R3SsEEBQCQlOPSW9/Gi/xfy/hfQ8wj63un/zcuSmR2cEfoatVZT6hc3sbMoXBc0TX
         cPoWvWd46xqC32G/9EV1gN9MRZMoisQMZA9xfytl1GMgXeOGnZQzh0yaVvcFAHcLQql2
         EUIw==
X-Gm-Message-State: ANhLgQ01zF8Zf3pHoCNjYzNtp59j6nmvNRQMi3ArAY7I819Jes/Iulva
        sqzNThI2mOW/pulPDIChyhwhr8s28UweJir9nT2+Ug==
X-Google-Smtp-Source: ADFU+vvCRywAAg1+WnA3Jt2+Es0KjYovJjx61mqJBBEGBcwgrvAoScaMwihQ8TmWYm+WfCDGioesXPYp9CJQd6Wil/k=
X-Received: by 2002:a63:b52:: with SMTP id a18mr17406821pgl.130.1583772690379;
 Mon, 09 Mar 2020 09:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1582560596.git.andreyknvl@google.com> <CAAeHK+y7yKwQP-prUv17gFXKnKtBdfz7fQ8Gc5vwL49R4yCHuA@mail.gmail.com>
In-Reply-To: <CAAeHK+y7yKwQP-prUv17gFXKnKtBdfz7fQ8Gc5vwL49R4yCHuA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 9 Mar 2020 17:51:19 +0100
Message-ID: <CAAeHK+wTbBC2Dm6GVXVqKTsn9gKg1_EZ5MggmLBMaA6wA-wq4w@mail.gmail.com>
Subject: Re: [PATCH v6 0/1] usb: gadget: add raw-gadget interface
To:     Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 24, 2020 at 5:17 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Mon, Feb 24, 2020 at 5:13 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > This patchset (currently a single patch) adds a new userspace interface
> > for the USB Gadget subsystem called USB Raw Gadget. This is what is
> > currently being used to enable coverage-guided USB fuzzing with syzkaller:
> >
> > https://github.com/google/syzkaller/blob/master/docs/linux/external_fuzzing_usb.md
> >
> > Initially I was using GadgetFS (together with the Dummy HCD/UDC module)
> > to perform emulation of USB devices for fuzzing, but later switched to a
> > custom written interface. The incentive to implement a different interface
> > was to provide a somewhat raw and direct access to the USB Gadget layer
> > for the userspace, where every USB request is passed to the userspace to
> > get a response. See documentation for the list of differences between
> > Raw Gadget and GadgetFS.
> >
> > Currently Raw Gadget only supports blocking I/O mode, that synchronously
> > waits for the result of each operation to allow collecting coverage per
> > operation.
> >
> > This patchset has been pushed to the public Linux kernel Gerrit instance:
> >
> > https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2144
> >
> > Changes v5 -> v6:
> > - Prevent raw_process_ep_io() racing with raw_ioctl_ep_disable() by
> >   checking urb_queued flag in the latter.
> > - Use GFP_KERNEL instead of GFP_ATOMIC where possible.
> > - Reject opening raw-gadget with O_NONBLOCK to allow future extensions to
> >   support nonblocking IO.
> > - Reduce RAW_EVENT_QUEUE_SIZE to 16.
>
> Hi Felipe! I'm still hoping for a review :)
>
> (Forgot to add a link to the example that emulates a USB keyboard via
> Raw Gadget into the cover letter:
>
> https://github.com/xairy/raw-gadget/blob/master/examples/keyboard.c)

Hi Greg, Felipe, and Alan,

I was wondering if there's a way to move forward with this patch?

Alan, since you have a very good knowledge of the USB subsystem, could
I ask you to take a look at the patch, while Felipe is busy?

Thanks!

>
> >
> > Changes v4 -> v5:
> > - Specified explicit usb_raw_event_type enum values for all entries.
> > - Dropped pointless locking in gadget_unbind().
> >
> > Changes v3 -> v4:
> > - Print debug message when maxpacket check fails.
> > - Use module_misc_device() instead of module_init/exit().
> > - Reuse DRIVER_NAME macro in raw_device struct definition.
> > - Don't print WARNING in raw_release().
> > - Add comment that explains locking into raw_event_queue_fetch().
> > - Print a WARNING when event queue size is exceeded.
> > - Rename raw.c to raw_gadget.c.
> > - Mention module name in Kconfig.
> > - Reworked logging to use dev_err/dbg() instead of pr_err/debug().
> >
> > Changes v2 -> v3:
> > - Updated device path in documentation.
> > - Changed usb_raw_init struct layout to make it the same for 32 bit compat
> >   mode.
> > - Added compat_ioctl to raw_fops.
> > - Changed raw_ioctl_init() to return EINVAL for invalid USB speeds, except
> >   for USB_SPEED_UNKNOWN, which defaults to USB_SPEED_HIGH.
> > - Reject endpoints with maxpacket = 0 in raw_ioctl_ep_enable().
> >
> > Changes v1 -> v2:
> > - Moved raw.c to legacy/.
> > - Changed uapi header to use __u* types.
> > - Switched from debugfs entry to a misc device.
> > - Changed raw_dev from refcount to kref.
> > - Moved UDC_NAME_LENGTH_MAX to uapi headers.
> > - Used usb_endpoint_type() and usb_endpoint_dir_in/out() functions instead
> >   of open coding them.
> > - Added "WITH Linux-syscall-note" to SPDX id in the uapi header.
> > - Removed pr_err() if case dev_new() fails.
> > - Reduced the number of debugging messages.
> >
> > Andrey Konovalov (1):
> >   usb: gadget: add raw-gadget interface
> >
> >  Documentation/usb/index.rst            |    1 +
> >  Documentation/usb/raw-gadget.rst       |   61 ++
> >  drivers/usb/gadget/legacy/Kconfig      |   11 +
> >  drivers/usb/gadget/legacy/Makefile     |    1 +
> >  drivers/usb/gadget/legacy/raw_gadget.c | 1078 ++++++++++++++++++++++++
> >  include/uapi/linux/usb/raw_gadget.h    |  167 ++++
> >  6 files changed, 1319 insertions(+)
> >  create mode 100644 Documentation/usb/raw-gadget.rst
> >  create mode 100644 drivers/usb/gadget/legacy/raw_gadget.c
> >  create mode 100644 include/uapi/linux/usb/raw_gadget.h
> >
> > --
> > 2.25.0.265.gbab2e86ba0-goog
> >
