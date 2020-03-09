Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2741C17E711
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 19:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbgCIS1M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 14:27:12 -0400
Received: from mail-wm1-f73.google.com ([209.85.128.73]:52059 "EHLO
        mail-wm1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727369AbgCIS1L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 14:27:11 -0400
Received: by mail-wm1-f73.google.com with SMTP id 20so178585wmk.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2020 11:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=GdJNQzOJFOqKdISqoHHBK9SjrIVmjZPZx9ZPz8U0D/Q=;
        b=tx4O/611hF+ZbF+8vaJD7WcRX5OInMP1WOHxCQKUTa3W3rIUCRRa0Pzbr2+XXke4id
         5pD1evIXnvUfJCRQ4zZRPlUQrDTBGifP7DgXKYQ3Xr3ykk4OFLIswSR8dh27YXgoZyCs
         DSYuLjTZ19uExvo6oR6613S3ecWt2O3GfpS4SenptNGaGjDx9K8a+HlI2DPoaXUCVPLl
         3NYtdjengW8w0REmafpeMt+Qvvbgfo85IXnOV1QeKWOwiNWBnbq/2yqY7yNiQ1XuQFcx
         Z2XLT+PVGoezeoLE7YBEHdzmh9liPSInWDvD+3EvfyuhJ6IeGb7AhroMscta9qfmBAzP
         bPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=GdJNQzOJFOqKdISqoHHBK9SjrIVmjZPZx9ZPz8U0D/Q=;
        b=br8+EUI3TqV7hifTNvGoTvzxjQUHBICKQmyicVNaaoRdfgqOgLu16CTX5YMUDbJ6yG
         T8e34OCZMDaEs4hdNFXIYCmkRD+6F36iCs6DcqXwfwIzP/khab8tPrjQADPEvW3rirXQ
         7Q/hGzeAa751bqMYr5uGg9qRUk07kT8HoMn2vXs3pFsHvznsF2c6Sa+E1AOlCCuw8NsV
         Xn18/sJHVs5T/i69Kq/l594PqEhybOEKhfLEoo7LoQx0GRzit5IA1eIVpiBP4j6FYpmV
         XAzIAHtThdPX0tmIv2OrYNTjJh8r4ncyjQutYT9vsTqYv0qP+j3BZ55da+3nWZeTe0U/
         +KGA==
X-Gm-Message-State: ANhLgQ0THh2saP3kY4rqE5APD9D3N+v6pNllnat3q4l4Zd9Jzzie/WD8
        RpCzbRFRvazxoE+Lhw6VBotXio2R5GgqAdq2
X-Google-Smtp-Source: ADFU+vtkEwBY/nTScyMNiVe58Ykd9fd07sDOnDWHkswsdgdjfDTZhoICv/rUfDfy4cqiqZpt6pB6VdIckbeAF6Aw
X-Received: by 2002:adf:ea42:: with SMTP id j2mr21611992wrn.377.1583778429837;
 Mon, 09 Mar 2020 11:27:09 -0700 (PDT)
Date:   Mon,  9 Mar 2020 19:27:03 +0100
Message-Id: <cover.1583778264.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v2 0/3] kcov: collect coverage from usb soft interrupts
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset extends kcov to allow collecting coverage from soft
interrupts and then uses the new functionality to collect coverage from
USB code.

This has allowed to find at least one new HID bug [1], which was recently
fixed by Alan [2].

[1] https://syzkaller.appspot.com/bug?extid=09ef48aa58261464b621
[2] https://patchwork.kernel.org/patch/11283319/

Any subsystem that uses softirqs (e.g. timers) can make use of this in
the future. Looking at the recent syzbot reports, an obvious candidate
is the networking subsystem [3, 4, 5 and many more].

[3] https://syzkaller.appspot.com/bug?extid=522ab502c69badc66ab7
[4] https://syzkaller.appspot.com/bug?extid=57f89d05946c53dbbb31
[5] https://syzkaller.appspot.com/bug?extid=df358e65d9c1b9d3f5f4

This patchset has been pushed to the public Linux kernel Gerrit instance:

https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2225

Changes v1 -> v2:
- Add local_irq_save/restore() critical sections to simplify dealing with
  softirqs happening during kcov_remote_start/stop().
- Set kcov_softirq after flag kcov_start() in kcov_remote_start().

Changes RFC -> v1:
- Don't support hardirq or nmi, only softirq, to avoid issues with nested
  interrupts.
- Combined multiple per-cpu variables into one.
- Used plain accesses and kcov_start/stop() instead of xchg()'s.
- Simplified handling of per-cpu variables.
- Avoid disabling interrupts for the whole kcov_remote_start/stop()
  region.
- Avoid overwriting t->kcov_sequence when saving/restoring state.
- Move kcov_remote_start/stop_usb() annotations into
  __usb_hcd_giveback_urb() to cover all urb complete() callbacks at once.
- Drop unneeded Dummy HCD changes.
- Split out a patch that removed debug messages.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>

Andrey Konovalov (3):
  kcov: cleanup debug messages
  kcov: collect coverage from interrupts
  usb: core: kcov: collect coverage from usb complete callback

 Documentation/dev-tools/kcov.rst |  17 +--
 drivers/usb/core/hcd.c           |   3 +
 include/linux/sched.h            |   3 +
 kernel/kcov.c                    | 221 +++++++++++++++++++++----------
 lib/Kconfig.debug                |   9 ++
 5 files changed, 178 insertions(+), 75 deletions(-)

-- 
2.25.1.481.gfbce0eb801-goog

