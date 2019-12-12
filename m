Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A8F11D37F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 18:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730092AbfLLRPs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 12:15:48 -0500
Received: from mail-qk1-f201.google.com ([209.85.222.201]:54595 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730007AbfLLRPr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 12:15:47 -0500
Received: by mail-qk1-f201.google.com with SMTP id s9so1794259qkg.21
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2019 09:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=v2c9ZfhsjHl5yHeRsOkptCzwopqKyi8H+GjnL6ViNEI=;
        b=vrj3NH1ShlxM4YyYe0HqMM/dwIJ/fbhT+APeMTYtYoOG+CRXgaspmBasE4ErJdIIKi
         jKDBAG0QKul7viwQpYW6XAA0Zjs/OwBkQtBf1K05wZYbMMI0opQwGyzT+YsfLr3OMqla
         lDjR73vpeODB04Fr5k9u1dyE32YCXQ30LDRoDe1gHq4pwTdmfL8rUSdCJbvdFP3l45dg
         SR5r6aA/6DzNNbzAod12aErBMfwYaNEoTYiQcLyDBmiLButXvXObMUCU5tGqskbDvrJ2
         qfdxvJXSBSxcvZeWKiOarc8KAVx2GSe2x7sH+SPYxcSWpwQcQCSL3928o15KVRmxBP0Q
         KJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=v2c9ZfhsjHl5yHeRsOkptCzwopqKyi8H+GjnL6ViNEI=;
        b=LXC1biCbZrT81404pCnxpCE5WC2VnI7IiM1hqmL+LH8WGuDarFmIsaDdnSkiXI+cVx
         ko8mYwPJTk8wE6vqV11b3w85Syrj9k4aiujItoj4sPMJFKOc4kkboGCYeiWqXAr8p0SQ
         3Wmor4BFQk80kUqU6P5hYi9zcYE14KTxT1oKhLzC1JgAO+juRAmRM7sGURy+5y92Nweg
         JOYGzcB7ouPdRHhYcrgDgSjTCpAMS6+PjvEBfVZQg4DGahAQoSc91DgJaSoXsdnwjDGR
         n6Y8uVyM8P0t5Y44q4iOEK/ihleHmHh5/xsVXWibDM2ACV8QMWAkQtbR5/o9aiWikHtr
         Avqw==
X-Gm-Message-State: APjAAAU0LPp/opFdVfy7QqSTzaXCQdfFSVNENs8LZL4QwMfTuaC7Bwf0
        hwIry5lBEQqE3TqT44nwSXtLv6+vj8/GRTU3
X-Google-Smtp-Source: APXvYqzGw/ZgJf+JgIA+hGU/h4Uovf7mUvA8SaZcjm27w1n/jWOAvB9sAKZXyMLIHaH8dKOK3BumvDPhvQx5uZWo
X-Received: by 2002:ac8:6f2d:: with SMTP id i13mr4821925qtv.133.1576170946867;
 Thu, 12 Dec 2019 09:15:46 -0800 (PST)
Date:   Thu, 12 Dec 2019 18:15:37 +0100
Message-Id: <cover.1576170740.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
Subject: [PATCH RFC 0/2] kcov: collect coverage from usbhid interrupts
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset extends kcov to allow collecting coverage from interrupts
and then uses the new functionality to collect coverage from usbhid code.

What I'm not sure yet about this change is if we actually want to
selectively annotate some parts of the USB stack that are executed in
interrupt context, or maybe we can do this with some common approach.

For example patch #2 in this patchset annotates all functions that are
passed as completion callbacks to usb_fill_*() in drivers/hid/usbhid.
Maybe instead we could redefine usb_fill_*() in a way that would handle
all such cases without manual annotations.

Any suggestions are welcome.

This has allowed to find at least one new HID bug [1], which was recently
fixed by Alan [2].

[1] https://syzkaller.appspot.com/bug?extid=09ef48aa58261464b621
[2] https://patchwork.kernel.org/patch/11283319/

This patchset has been pushed to the public Linux kernel Gerrit instance:

https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2225

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>

Andrey Konovalov (2):
  kcov: collect coverage from interrupts
  HID: usbhid: kcov: add annotations for coverage collection

 Documentation/dev-tools/kcov.rst   |  16 +--
 drivers/hid/usbhid/hid-core.c      |  25 +++-
 drivers/hid/usbhid/usbkbd.c        |  15 ++-
 drivers/hid/usbhid/usbmouse.c      |   7 +-
 drivers/usb/gadget/udc/dummy_hcd.c |   1 +
 include/linux/sched.h              |   3 +
 kernel/kcov.c                      | 196 +++++++++++++++++++----------
 lib/Kconfig.debug                  |   9 ++
 8 files changed, 192 insertions(+), 80 deletions(-)

-- 
2.24.1.735.g03f4e72817-goog

