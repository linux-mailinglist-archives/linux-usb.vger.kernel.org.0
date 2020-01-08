Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD30134CF6
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 21:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgAHUPc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 15:15:32 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37360 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgAHUPc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jan 2020 15:15:32 -0500
Received: by mail-pf1-f193.google.com with SMTP id p14so2176349pfn.4
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2020 12:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f5jGtDQk4W/7kwbhzU422zx3kqGO5CGZj+6s6uDuarU=;
        b=HCXL15JGGpFaynGNaL35XNOBOhFcVvFiz86bi5HRcq3rPFIk85hjdnNO9yc4y4Gugo
         rkYq0StJw4ZX5lEmrcWGyvfDiy8pSkVtHwZboU695QuhKFWVA4L/H7M75pa0EFcO5iFf
         e8GZNpNMzFRbgSPJcQ/Skm06ncZUpZPlvO9Ax71bWUFSBa02IkHW/2/Oh6rKTsBtY0Xt
         2yUOve/P8iTosvZLexlSdmE8xdSubQJAtfqaoA1xslqStZfCyTVH8HB7UQqyh4hCFsRT
         b3T1dGMPjztHMhivo/IKz0zJ/u1pZYgZIm84/k3a+e7zdw7Dx5wv23FwAzNo9AC+5DwT
         6kwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f5jGtDQk4W/7kwbhzU422zx3kqGO5CGZj+6s6uDuarU=;
        b=YoAuTIL1jxwerouHJzXe4lNDefH34VMBIz9z8t4w1TQz5V9Q5lsaeN+yPGqGYYRcnP
         22NLeHaTokwkYAWyz0NlKSYHS7Ks1Qpz0sM026eqWMbQ0ITRAaZ8yev7i3GSeCtuwdL4
         jKXFnx7uRIOX9i/IS3nDS+jKSsJGp0R3nF2tos2RwUuYCHNkX+7nAD5UAXEUTJ8c/NXi
         dDY0oV1TXsK4v89vTcx/wVv80wLpY/2ykFSQzvvJ9IOwNRbia7z4s7V6wKU6j7CBepU0
         NB0kHzOw4E+VJGNqBXht6jGJncuQIQenBzAm7PNuPKYV40LvBb1uNjGe5IPrlgkBfS3d
         JjKQ==
X-Gm-Message-State: APjAAAU+jCdwiwo9Xy7zrYng0cMmbS4sFfvjcWAKCnX7MLmtzSY9mlSZ
        5jCRBEGpBHCEvo9fDhCkaDRu9A8cP2LDoVrnwZ5ujjyb/LI=
X-Google-Smtp-Source: APXvYqx4CBdSrQfhaOLOac9tubqeO/y0WB3biPm8WlBtKUwxlgvmmGxE7IIroMkJWyqCRH6CB/DvdVrVkBEbZ+PyGNk=
X-Received: by 2002:aa7:9629:: with SMTP id r9mr7091599pfg.51.1578514531446;
 Wed, 08 Jan 2020 12:15:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697098.git.andreyknvl@google.com>
In-Reply-To: <cover.1576697098.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 8 Jan 2020 21:15:20 +0100
Message-ID: <CAAeHK+xDNwRat=BS7Jv02tNJcFZQefozuTW=CaGfUvGoUMg+DQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/1] usb: gadget: add raw-gadget interface
To:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Jonathan Corbet <corbet@lwn.net>, Felipe Balbi <balbi@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 18, 2019 at 8:27 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> This patchset (currently a single patch) adds a new userspace interface
> for the USB Gadget subsystem called USB Raw Gadget (I don't mind changing
> the name to something else if there are better ideas). This is what
> currently being used to enable coverage-buided USB fuzzing with syzkaller:
>
> https://github.com/google/syzkaller/blob/master/docs/linux/external_fuzzing_usb.md
>
> Initially I was using GadgetFS (together with the Dummy HCD/UDC module)
> to perform emulation of USB devices for fuzzing, but later switched to a
> custom written interface. The incentive to implement a different interface
> was to provide a somewhat raw and direct access to the USB Gadget layer
> for the userspace, where every USB request is passed to the userspace to
> get a response. See documentation for the list of differences between
> Raw Gadget and GadgetFS.
>
> This patchset has been pushed to the public Linux kernel Gerrit instance:
>
> https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2144

Hi Greg,

Just an after holidays reminder that I've sent v4 of this patchset and
looking forward to a review.

Thanks!

>
> Changes v3 -> v4:
> - Print debug message when maxpacket check fails.
> - Use module_misc_device() instead of module_init/exit().
> - Reuse DRIVER_NAME macro in raw_device struct definition.
> - Don't print WARNING in raw_release().
> - Add comment that explains locking into raw_event_queue_fetch().
> - Print a WARNING when event queue size is exceeded.
> - Rename raw.c to raw_gadget.c.
> - Mention module name in Kconfig.
> - Reworked logging to use dev_err/dbg() instead of pr_err/debug().
>
> Changes v2 -> v3:
> - Updated device path in documentation.
> - Changed usb_raw_init struct layout to make it the same for 32 bit compat
>   mode.
> - Added compat_ioctl to raw_fops.
> - Changed raw_ioctl_init() to return EINVAL for invalid USB speeds, except
>   for USB_SPEED_UNKNOWN, which defaults to USB_SPEED_HIGH.
> - Reject endpoints with maxpacket = 0 in raw_ioctl_ep_enable().
>
> Changes v1 -> v2:
> - Moved raw.c to legacy/.
> - Changed uapi header to use __u* types.
> - Switched from debugfs entry to a misc device.
> - Changed raw_dev from refcount to kref.
> - Moved UDC_NAME_LENGTH_MAX to uapi headers.
> - Used usb_endpoint_type() and usb_endpoint_dir_in/out() functions instead
>   of open coding them.
> - Added "WITH Linux-syscall-note" to SPDX id in the uapi header.
> - Removed pr_err() if case dev_new() fails.
> - Reduced the number of debugging messages.
>
> Andrey Konovalov (1):
>   usb: gadget: add raw-gadget interface
>
>  Documentation/usb/index.rst            |    1 +
>  Documentation/usb/raw-gadget.rst       |   59 ++
>  drivers/usb/gadget/legacy/Kconfig      |   11 +
>  drivers/usb/gadget/legacy/Makefile     |    1 +
>  drivers/usb/gadget/legacy/raw_gadget.c | 1071 ++++++++++++++++++++++++
>  include/uapi/linux/usb/raw_gadget.h    |  167 ++++
>  6 files changed, 1310 insertions(+)
>  create mode 100644 Documentation/usb/raw-gadget.rst
>  create mode 100644 drivers/usb/gadget/legacy/raw_gadget.c
>  create mode 100644 include/uapi/linux/usb/raw_gadget.h
>
> --
> 2.24.1.735.g03f4e72817-goog
>
