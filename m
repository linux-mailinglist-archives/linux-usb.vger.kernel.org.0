Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA50013AAD3
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 14:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgANNYu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 08:24:50 -0500
Received: from mail-wm1-f73.google.com ([209.85.128.73]:52975 "EHLO
        mail-wm1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgANNYu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jan 2020 08:24:50 -0500
Received: by mail-wm1-f73.google.com with SMTP id m133so1853619wmf.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2020 05:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=hGuyL9FzNtQNL/0ScoRIInHWpYCNF5HmdXbCvKgZdsw=;
        b=ECdYGu+rdNNIUjG9dckwkjr2qnEvgJejBefK64t5DEy7cOZwEdzeAUQTRgEEbCZkfV
         4+cgsw7JgcZ1qEFJebVNc3Y9TaPzf3q/OuWAGoWGrMtYbo6kq3c3XUiv6t+lYnP5M2kb
         8Zqxd2ZvsXWaY5IkqE6BsaKprCK71+fkBRIw7mVQXdr5J4+xZ1fGPh2INqx+p4ySG/cU
         hr26+UnkjfM8T8tCmhf6kgyi4Ad4+Owpjs2xvQmahlYLH0BfmHw8NrbJHLOhkWNXPyIc
         qDmTRD+mp3QCwd6oeBoE+CPXmSjILWsmGy48C6nm1vJ1qdGkI0fUu/JG8tcFn/XAMreZ
         hiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=hGuyL9FzNtQNL/0ScoRIInHWpYCNF5HmdXbCvKgZdsw=;
        b=kRCWrrhyuPGR1LPUZQ8iGZuaXVX2d8RSdKN6Xca1R8is2wegb9Hwf1ow7qe1u/fCQN
         zBvC92gi4EIEiloeyoKCrR804d0QUNpdDCLjgwfYsaoujgHTBr59A+oZ+EBXpPpkvSkZ
         lO0l41apOFtHWVPnvEFGLUUFPx7LgBb2LASW2SfvD4cSTkfaz4zbra+tWkZos/L/XpGn
         7CZh21buSuGCiAkqnrv7noHP/PJaJmfaoA+bDchUPiy1UXYj0EI68Ry1KZIKXV7Wf871
         4yYw4y4yw2Di3CW8QhTQX0KV1ARAJ/RgKJpJ6Jyg8uJmSrGBfIRC2mslsVLjVF4taoj3
         f+WQ==
X-Gm-Message-State: APjAAAVzUH9mnq4K0G7mdrAvvoQZ7I9v89rYdSaDe70TlB0wdhDu+RD3
        hFbeCnZsnWxvbwm4kd8aqTVty5XadteBK5Pay+GpQiE0bSNzV5UDgJcJvj80qNKFk/wEooQqF1z
        wtDCFObN93ZyzPemMmhZShuRo+vcPTegpu0olsvjsV8OHYZiWZo8QbC5ws9K/jTFtkmHH6SGg+b
        iD
X-Google-Smtp-Source: APXvYqxlmlyHpaXcRCFZeWfdpQwZFPBtaJP9KPxj4U8akF6FmJiQ4zOUe/zTidX/4h8lU976IaebhU3x1A4VCej7
X-Received: by 2002:a5d:5273:: with SMTP id l19mr25340120wrc.175.1579008288477;
 Tue, 14 Jan 2020 05:24:48 -0800 (PST)
Date:   Tue, 14 Jan 2020 14:24:42 +0100
Message-Id: <cover.1579007786.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
Subject: [PATCH v5 0/1] usb: gadget: add raw-gadget interface
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset (currently a single patch) adds a new userspace interface
for the USB Gadget subsystem called USB Raw Gadget. This is what is
currently being used to enable coverage-guided USB fuzzing with syzkaller:

https://github.com/google/syzkaller/blob/master/docs/linux/external_fuzzing_usb.md

Initially I was using GadgetFS (together with the Dummy HCD/UDC module)
to perform emulation of USB devices for fuzzing, but later switched to a
custom written interface. The incentive to implement a different interface
was to provide a somewhat raw and direct access to the USB Gadget layer
for the userspace, where every USB request is passed to the userspace to
get a response. See documentation for the list of differences between
Raw Gadget and GadgetFS.

This patchset has been pushed to the public Linux kernel Gerrit instance:

https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2144

Changes v4 -> v5:
- Specified explicit usb_raw_event_type enum values for all entries.
- Dropped pointless locking in gadget_unbind().

Changes v3 -> v4:
- Print debug message when maxpacket check fails.
- Use module_misc_device() instead of module_init/exit().
- Reuse DRIVER_NAME macro in raw_device struct definition.
- Don't print WARNING in raw_release().
- Add comment that explains locking into raw_event_queue_fetch().
- Print a WARNING when event queue size is exceeded.
- Rename raw.c to raw_gadget.c.
- Mention module name in Kconfig.
- Reworked logging to use dev_err/dbg() instead of pr_err/debug().

Changes v2 -> v3:
- Updated device path in documentation.
- Changed usb_raw_init struct layout to make it the same for 32 bit compat
  mode.
- Added compat_ioctl to raw_fops.
- Changed raw_ioctl_init() to return EINVAL for invalid USB speeds, except
  for USB_SPEED_UNKNOWN, which defaults to USB_SPEED_HIGH.
- Reject endpoints with maxpacket = 0 in raw_ioctl_ep_enable().

Changes v1 -> v2:
- Moved raw.c to legacy/.
- Changed uapi header to use __u* types.
- Switched from debugfs entry to a misc device.
- Changed raw_dev from refcount to kref.
- Moved UDC_NAME_LENGTH_MAX to uapi headers.
- Used usb_endpoint_type() and usb_endpoint_dir_in/out() functions instead
  of open coding them.
- Added "WITH Linux-syscall-note" to SPDX id in the uapi header.
- Removed pr_err() if case dev_new() fails.
- Reduced the number of debugging messages.

Andrey Konovalov (1):
  usb: gadget: add raw-gadget interface

 Documentation/usb/index.rst            |    1 +
 Documentation/usb/raw-gadget.rst       |   59 ++
 drivers/usb/gadget/legacy/Kconfig      |   11 +
 drivers/usb/gadget/legacy/Makefile     |    1 +
 drivers/usb/gadget/legacy/raw_gadget.c | 1068 ++++++++++++++++++++++++
 include/uapi/linux/usb/raw_gadget.h    |  167 ++++
 6 files changed, 1307 insertions(+)
 create mode 100644 Documentation/usb/raw-gadget.rst
 create mode 100644 drivers/usb/gadget/legacy/raw_gadget.c
 create mode 100644 include/uapi/linux/usb/raw_gadget.h

-- 
2.25.0.rc1.283.g88dfdc4193-goog

