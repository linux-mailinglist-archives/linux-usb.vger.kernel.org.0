Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D77F1FDF08
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 14:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727586AbfKONhS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 08:37:18 -0500
Received: from mail-qv1-f73.google.com ([209.85.219.73]:41062 "EHLO
        mail-qv1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727329AbfKONhR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 08:37:17 -0500
Received: by mail-qv1-f73.google.com with SMTP id m12so6565513qvv.8
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2019 05:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=G6EkFeMScJt97Zxa/Roqr4qkhmepcK8pLPvMI4jl0bE=;
        b=N9YDxlPJbBf24qBKjbmFUxwjp7HYh9Ovm2F3sroCnhW54f4ELGNBCOqk2ZiQX4Dgpy
         vmNv+jIJlJGo5typ0J71QQG814xAs4eigUB3DDbVSCl9nr3ZHSJ3yGZHReeTlnuqnMW5
         gOhV6h7VCN6ymjvH1Bz5ThBxZijXPiTx+sy+Hw39CD+TmfZblOa9QolPFOTUEigAAkuC
         /CMh8DjrEU8ykD8FXhkTiGp8EByDzvHlnJIUSYBkIztIBuNlNXE29mnqmfhER4dFr6bb
         TPqDohmWv+56Uy543hwCjVDvlbcudJl5rNp62XN2lUxzm3euJayVaClqXTmQIOqGYkTG
         +4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=G6EkFeMScJt97Zxa/Roqr4qkhmepcK8pLPvMI4jl0bE=;
        b=bMY6l3XKIxzEz1aoyiMTtDo2hZ6zXKfkzQvn/Cnz5uTN0lElYQKrY6PdLsHSfQl0TH
         pfRTMYJFf5TdfFnQPNbeuR8OB9e+Ycf6t5MXa5+eDF3T6acKnFVyhO0clVOEsjyEsLBW
         9ccEpLtQOB7UevqIaRlJzDoULW3JQUkZahsxYr39cs0dvpE4l/217zKITYKyCARJz7lF
         Qs15xazxFQzdiKqp0JK+gufQfEzORUAlfRlAAVX64W3w5w5xyFYWnJreclZTnsMozz67
         vVDDaTBCh4kd7KFUkqFJqdgQJY3pnEch5TamW6o+Kp/qQ2gShmDwMzCthXHt4O1GSv6c
         ywsQ==
X-Gm-Message-State: APjAAAVYZSSena3+bMewBDy524wTwMUjscq0oVZu9w970o5z7IwbpHja
        YHCPfFTI/CCqzCnLrVK8N0O7D3M2JgtpijwdbjEJPmZhpi98iTfa4JLYWCTAylc/1C77RhjaxGQ
        YYufliqjhn/OEq30bwKaOs2exCsaJRpSYfZfOKkbnZ5aAQ4H66WBZbYWwP/Y/GRAEc3CM0jN60/
        L7
X-Google-Smtp-Source: APXvYqzJ46bYPFjtSSq8kogygD+LPGa6FFnWHBGyFRx9kgGBVmWcTAg4PmkA5mIHPXfXKuLZjcGRJJ4EAOBufHLf
X-Received: by 2002:a37:98c6:: with SMTP id a189mr12586235qke.230.1573825036610;
 Fri, 15 Nov 2019 05:37:16 -0800 (PST)
Date:   Fri, 15 Nov 2019 14:37:11 +0100
Message-Id: <cover.1573824989.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
Subject: [PATCH v2 0/1] usb: gadget: add raw-gadget interface
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
 Documentation/usb/raw-gadget.rst    |   60 ++
 drivers/usb/gadget/legacy/Kconfig   |    8 +
 drivers/usb/gadget/legacy/Makefile  |    1 +
 drivers/usb/gadget/legacy/raw.c     | 1057 +++++++++++++++++++++++++++
 include/uapi/linux/usb/raw_gadget.h |  167 +++++
 6 files changed, 1294 insertions(+)
 create mode 100644 Documentation/usb/raw-gadget.rst
 create mode 100644 drivers/usb/gadget/legacy/raw.c
 create mode 100644 include/uapi/linux/usb/raw_gadget.h

-- 
2.24.0.432.g9d3f5f5b63-goog

