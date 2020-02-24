Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F09916AB27
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2020 17:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgBXQSK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 11:18:10 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33723 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbgBXQSK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Feb 2020 11:18:10 -0500
Received: by mail-pj1-f65.google.com with SMTP id m7so84828pjs.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2020 08:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gsYjXT5y25umLgajERgJkh5L1V1CQFDUxeGT2hMU0Ag=;
        b=acqvOVaeFEL79wYat2Tu3xMbROsub914649oLTiIJFKmM6hLpIwCk81mP38kiSLcG7
         hpW8G8cTnyB7C2ICizsNPFnKw5yk46IsPsiViE1aaPyKts/TRsCu8ZkCRQaAKZ8Zf3kr
         JxJuk5BXNUySbjUF6LqA79YyCYOLsiIVFRRPIwhUOyplAIgTR7wmWPsaBM4mLr0CWM8q
         3YOABfY9X004jaZotMkXA0kEpXibJ6hwd83/sr7aCJWt/tHYOMmc1QUYlXjNmc295M++
         dWdwI/yfuchvWch1On+7IfjfuhRgXjVLzq8RdNfqV+9Za2yQvGv9rlrSIX6qHol4jMPf
         L7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gsYjXT5y25umLgajERgJkh5L1V1CQFDUxeGT2hMU0Ag=;
        b=ttQuSBLnoGkZYr00yt6jrPRcJdTpr8wpz2b3ATDXaQXMXZiZGqzKVOVd/EhWBUunu7
         d+R9agzG9V48G8VSk6/HC7oRvnDqtQ3G2D+ePP4YO/ORfNQVnkS1ZDh3O6Hivk/ZPgJ8
         sJZQohW0exYPbooIkEhaJbybBzzTQEaSLa47mqQ1+Pxoz/TRwJXWbhh2sVj/bStg1Jqj
         Hqbz6LLjeyHwNVOgq0P5xp1oERIqo7zUJkgoVzhWYFyn+x7d299g3oqEoYQFVNlB2OEn
         vHvV/3a/7BSC97SiMz6dOiZuNHGXdNOd8LN/dScqjJd1PZ+UKj/Y672kFSdcm2f1rVmL
         D+xA==
X-Gm-Message-State: APjAAAVWeQbIfXFMVrg+KgZF91J8Ot61M/DXFubqGRp5+J/qEulZuVJI
        Ah9wO/t7kcSkWiJOv2AMTAhA0g9k1vJeUdrUkg2ZOA==
X-Google-Smtp-Source: APXvYqyct0MEZT8sBmLAJscQlsCSHUJ5kQli5XgQjFwmUvv+IvpSsHmF36IHxJv2zBF57KhhLIrasKR3AYCHB69TpOE=
X-Received: by 2002:a17:902:9889:: with SMTP id s9mr46549947plp.252.1582561089283;
 Mon, 24 Feb 2020 08:18:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582560596.git.andreyknvl@google.com>
In-Reply-To: <cover.1582560596.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 24 Feb 2020 17:17:58 +0100
Message-ID: <CAAeHK+y7yKwQP-prUv17gFXKnKtBdfz7fQ8Gc5vwL49R4yCHuA@mail.gmail.com>
Subject: Re: [PATCH v6 0/1] usb: gadget: add raw-gadget interface
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 24, 2020 at 5:13 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> This patchset (currently a single patch) adds a new userspace interface
> for the USB Gadget subsystem called USB Raw Gadget. This is what is
> currently being used to enable coverage-guided USB fuzzing with syzkaller:
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
> Currently Raw Gadget only supports blocking I/O mode, that synchronously
> waits for the result of each operation to allow collecting coverage per
> operation.
>
> This patchset has been pushed to the public Linux kernel Gerrit instance:
>
> https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2144
>
> Changes v5 -> v6:
> - Prevent raw_process_ep_io() racing with raw_ioctl_ep_disable() by
>   checking urb_queued flag in the latter.
> - Use GFP_KERNEL instead of GFP_ATOMIC where possible.
> - Reject opening raw-gadget with O_NONBLOCK to allow future extensions to
>   support nonblocking IO.
> - Reduce RAW_EVENT_QUEUE_SIZE to 16.

Hi Felipe! I'm still hoping for a review :)

(Forgot to add a link to the example that emulates a USB keyboard via
Raw Gadget into the cover letter:

https://github.com/xairy/raw-gadget/blob/master/examples/keyboard.c)

>
> Changes v4 -> v5:
> - Specified explicit usb_raw_event_type enum values for all entries.
> - Dropped pointless locking in gadget_unbind().
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
>  Documentation/usb/raw-gadget.rst       |   61 ++
>  drivers/usb/gadget/legacy/Kconfig      |   11 +
>  drivers/usb/gadget/legacy/Makefile     |    1 +
>  drivers/usb/gadget/legacy/raw_gadget.c | 1078 ++++++++++++++++++++++++
>  include/uapi/linux/usb/raw_gadget.h    |  167 ++++
>  6 files changed, 1319 insertions(+)
>  create mode 100644 Documentation/usb/raw-gadget.rst
>  create mode 100644 drivers/usb/gadget/legacy/raw_gadget.c
>  create mode 100644 include/uapi/linux/usb/raw_gadget.h
>
> --
> 2.25.0.265.gbab2e86ba0-goog
>
