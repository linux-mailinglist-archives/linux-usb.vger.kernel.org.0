Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5261F11BAEF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 19:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730743AbfLKSCs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 13:02:48 -0500
Received: from mail-wr1-f74.google.com ([209.85.221.74]:44630 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730697AbfLKSCs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 13:02:48 -0500
Received: by mail-wr1-f74.google.com with SMTP id u18so10689224wrn.11
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 10:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=sLn1RzN3MzIkubbF75sxXqKNycW/RmLmMWiDiI+hnxM=;
        b=hEC1fcDXnyqL/XYiJQhw7lfkKjoeTRhLDHBMALHzORBEe9uuMNK101CeKVYTICmCAE
         SI6+OPlpiRxJbnQdJca0rjbrnjy1owjs7R1UEOyOK9n+0tCTqPdMiEdRHBZ7OqCX1HR1
         mp/kOlGpVQjsOzlOH0cxRGCZQoRorsFMVbYCWSfbx1DYzLlsOFItWt3zM9gJx7TvY4ao
         0qUP4uWLPskya/UmJiKdXJ3udCEBr/s5A95ipsKEYvotSoCrrauD+043eWPiQcArBPgr
         gGQkTXX0Y7GOYmpKqGwh8PyQdWlwHiD2rr31jxT4AMl+AaKOJQTNZ9dVMM90jwahJo7m
         uB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=sLn1RzN3MzIkubbF75sxXqKNycW/RmLmMWiDiI+hnxM=;
        b=c6t0efYLqfP+SelGLmV1Q4RbWGLkZfTa3tUnFguNKFcnRcXh3i5rIYND2HSEuyXdE/
         qfLxmxOMr19UrK36n31QbUPDV5OjRyeZAKpfJLJPgz+rsxmBaBxY80UI2PyEejNJIZtx
         0SWR8hny0XdnvjI9CZ/S9+I/lTDxjbwiaITlMbI+0HdqeBTaC8vOLd7QqkCfNkXrCHl5
         j54H117YHbd0kaD7oT4or5N0FAcADcMBpiuhk/O5pTjLjT7I0AXeRIHj951fnaO0JxgG
         lBLj31+Hey4qKPv9davc5AcJODV+yG08ApNTO41wNxC7OmQoQv9gYrSp7TTcm6on2PLk
         OOTQ==
X-Gm-Message-State: APjAAAUq72q3mE2STem66B/xxZk41XGLAeskTMOXPGM/lbZgTgdp21LY
        mIULIH8/QD/VaLLu2MishpwiYPoC3IGhBAWeTFe6MTxgOtYAmKEz9Fr2rh0O3fUXH+tK0oAtUvt
        jbA6QzRX4NaV1LiOjV/gIaHc+Ooiv2NZSe/9bVm3+f3RcBZNJ4fuaZsdtw5hfgGEIU1f1IeGi7G
        80
X-Google-Smtp-Source: APXvYqyGi5BwTZYH3Ri2cMx7/FAUbaOuYm2sD00S1W75J+bpaZrv7tI2ix0vjhwMYEaKG7C7h5RQwjmqQ/bsUmT8
X-Received: by 2002:a5d:480f:: with SMTP id l15mr1124364wrq.305.1576087365834;
 Wed, 11 Dec 2019 10:02:45 -0800 (PST)
Date:   Wed, 11 Dec 2019 19:02:40 +0100
Message-Id: <cover.1576087039.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
Subject: [PATCH v3 0/1] usb: gadget: add raw-gadget interface
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Jonathan Corbet <corbet@lwn.net>, Felipe Balbi <balbi@kernel.org>,
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
for the USB Gadget subsystem called USB Raw Gadget (I don't mind changing
the name to something else if there are better ideas). This is what
currently being used to enable coverage-buided USB fuzzing with syzkaller:

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

 Documentation/usb/index.rst         |    1 +
 Documentation/usb/raw-gadget.rst    |   59 ++
 drivers/usb/gadget/legacy/Kconfig   |    8 +
 drivers/usb/gadget/legacy/Makefile  |    1 +
 drivers/usb/gadget/legacy/raw.c     | 1070 +++++++++++++++++++++++++++
 include/uapi/linux/usb/raw_gadget.h |  167 +++++
 6 files changed, 1306 insertions(+)
 create mode 100644 Documentation/usb/raw-gadget.rst
 create mode 100644 drivers/usb/gadget/legacy/raw.c
 create mode 100644 include/uapi/linux/usb/raw_gadget.h

-- 
2.24.1.735.g03f4e72817-goog

