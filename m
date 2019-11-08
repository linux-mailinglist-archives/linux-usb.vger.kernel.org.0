Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E15FDF5383
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2019 19:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbfKHS1C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Nov 2019 13:27:02 -0500
Received: from mail-vs1-f74.google.com ([209.85.217.74]:37731 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727894AbfKHS1C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Nov 2019 13:27:02 -0500
Received: by mail-vs1-f74.google.com with SMTP id m188so1997726vsd.4
        for <linux-usb@vger.kernel.org>; Fri, 08 Nov 2019 10:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=InCRmCaYMSJuejWdhbWZ80dHI+Ie599QAOMGzNVa8w0=;
        b=TP+7I1u88l92JkOCamU28Y5ZsK5+tbfj3eufSxGmmqP49N30NQLzAHdNGZ66T3MoPr
         RA/ZnHYToLy6UXCbTnIypGk1BGHP0XmqM+n8G7XL4DwXXFYSdZmYOJqeDkVKENYdmeG9
         AlR7d2DJ6GkwZfljvLkYTJH+AdsPWtr3jJ4BJ+W1/eu95Rvi/av/ntF9C1Jxjg+spfpZ
         LSUOLmspBQpXt+PYu69w3xGGs1kwiy5bYkqPlYFjG/nDl8Q2JeqRW9Necr+SLpsBrnOl
         WLxHgTI7ib54OB3WEJGhxxMF1EdzBMIrCBk+sYoS3YsSM7XqA1Lc7mHYPs7sDeClhCZu
         irPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=InCRmCaYMSJuejWdhbWZ80dHI+Ie599QAOMGzNVa8w0=;
        b=TUxx2uUWeoU7O2aqXNX8D8zqaCjlNy9i5TI3Fce9l1hpMa17OQOYKxNohTO3oMWqHC
         x7mJD4kR41MMom/pm2nqTpVMGbzaA1GI6x+cKfwX9KqiqsqWzsnQNDcbqRDQymJWcp1N
         itApqawQZ5IDYEI+NZRLsWgte2wXBLGtTDgV9PSlOaaiwoe6Fqp0huUnEfU82P19AW3l
         SSGBYZ1Bu21rSmd9QKcBk+4Vfl+7aGzJuy1zlZG2wCV9e5P1wEzJfDhybGbmQ1WWAsPc
         AZCc9jv8BlV6IbzvGrPysin0TGCiehJ+lMICwfphET/hZf8ZntfTV1Z1EJAPRJlZvAfL
         RHrg==
X-Gm-Message-State: APjAAAXnOk8XKOk4fCSUJWIPJlqdCj/nJcNT20oMK+vFMj8dVGekffrS
        xioZSAGqZWxN2XPJSbdOeQ8KG2vMxa60RUt45s3ANqfMFhfRdB1EguGVvseLjO6BU+/ON5JVSdv
        +BO8QfwkbSKxb7QcFmdMODfxV7KC/xzz9+zrTR7iunJP3U7aHpZcxRo6sxDyPaZScSsKcrNneTH
        o+
X-Google-Smtp-Source: APXvYqwq/EaWvDgTgw8EdmOJsazZTyA+tDGqijyvay3+yMvNeIB6nn8yXTHkAs9AyBx78GY1k5XNrKAqfUW/cUwV
X-Received: by 2002:a05:6102:835:: with SMTP id k21mr8718518vsb.11.1573237621016;
 Fri, 08 Nov 2019 10:27:01 -0800 (PST)
Date:   Fri,  8 Nov 2019 19:26:54 +0100
Message-Id: <cover.1573236684.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
Subject: [PATCH 0/1] usb: gadget: add raw-gadget interface
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

Andrey Konovalov (1):
  usb: gadget: add raw-gadget interface

 Documentation/usb/index.rst         |    1 +
 Documentation/usb/raw-gadget.rst    |   60 ++
 drivers/usb/gadget/Kconfig          |    9 +
 drivers/usb/gadget/Makefile         |    2 +
 drivers/usb/gadget/raw.c            | 1150 +++++++++++++++++++++++++++
 include/uapi/linux/usb/raw_gadget.h |  164 ++++
 6 files changed, 1386 insertions(+)
 create mode 100644 Documentation/usb/raw-gadget.rst
 create mode 100644 drivers/usb/gadget/raw.c
 create mode 100644 include/uapi/linux/usb/raw_gadget.h

-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

