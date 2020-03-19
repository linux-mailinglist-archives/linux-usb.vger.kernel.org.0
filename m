Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA1918C2C1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2020 23:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgCSWLr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 18:11:47 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:54401 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgCSWLr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 18:11:47 -0400
Received: by mail-qt1-f201.google.com with SMTP id r3so2742785qtp.21
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 15:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=VTNvjGbtv+rJdA49QP9OyHSdusD/AeN0IX2HvMc3zR0=;
        b=JPG7XzZaHH0XjWC/90MErvGgNicxMfN2BDKtuLKjuszT+tRxUY2YABTeDguPgaBN9M
         DMKB6n1tM89aVbQ8q2RZRR4N3ZmIfYKKzG6YoHSZ9WCSmhqX00SvrBaRL4kDz+ANvq/N
         V1a5qCaVDBlo9IvmIxGxbGglxSuLvPvKS0E0dSGDjuiMacGU/pbocygtX5/sUbxFqWDs
         ler0qrBpCVk9pOVfaq+7Vxf1/X9t38YJ4EUcrukaFz56Kx5pCFa7q5rKH7Zwy6mnZsXn
         fqKBcgjlgHBojyaXr8cvhMRr3l8DZza8FNqZiNxLlk/ICGwFCVpekKJe5QlLYhwN8oNi
         pgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=VTNvjGbtv+rJdA49QP9OyHSdusD/AeN0IX2HvMc3zR0=;
        b=UXO7TmxurQ8m4krB+EklmIrdL4vb7GW3K6brHqXM6p2bOKoBbHvqNXuLHwc0zkglQZ
         LHqIltbMEu45JXWmelFuSiQMiCxDCYqDYloqjN2soGT9Pjc1KJtkQc530ncUkiAq0r1Y
         UuIKi3K/Yw3pejO+IEEhhfRRjOUQcc1ELNtu0ChAZREEarJ9+BwHdKzvrJzQYtBKqIzf
         rffvNLp5tLMUAZYbcl4HPEcCzxus+9uBKDFYpZT0Bx9wX6rgnaOemSB58KmEjc3lx6wP
         9mf/JInDsRv/QkBCn+8hGvcWjRzer5xAmReE/Ic6W61s35N15inY0fBrKbBpAotkgm4+
         jySA==
X-Gm-Message-State: ANhLgQ2wgwDAgdh/XgP0wTFL7ws5JYZ96gU45XkbT4ibqa8Al5JuVklR
        VUcrR0skLDefiSp65cAV0BOHzqcoPS8WFnIv
X-Google-Smtp-Source: ADFU+vtDDVSGNtLbDlpY7K187U2l/dbvf5RSvskr4+U8bogD2dnap7fb4A9wUqSbvEnrh3MFPuHaY9syO9SqrEIx
X-Received: by 2002:a0c:e88d:: with SMTP id b13mr5421478qvo.219.1584655905980;
 Thu, 19 Mar 2020 15:11:45 -0700 (PDT)
Date:   Thu, 19 Mar 2020 23:11:33 +0100
Message-Id: <cover.1584655448.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 0/7] kcov: collect coverage from usb soft interrupts
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

Changes v2 -> v3:
- New patch: "kcov: fix potential use-after-free in kcov_remote_start".
- New patch: "kcov: move t->kcov assignments into kcov_start/stop".
- New patch: "kcov: move t->kcov_sequence assignment".
- New patch: "kcov: use t->kcov_mode as enabled indicator".
- Dropped out-of-memory error message from kcov_init() as checkpatch
  complains.
- Use a single local_irq_disable section when accessing per-task kcov
  variables in kcov_remote_start/stop().

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

Andrey Konovalov (7):
  kcov: cleanup debug messages
  kcov: fix potential use-after-free in kcov_remote_start
  kcov: move t->kcov assignments into kcov_start/stop
  kcov: move t->kcov_sequence assignment
  kcov: use t->kcov_mode as enabled indicator
  kcov: collect coverage from interrupts
  usb: core: kcov: collect coverage from usb complete callback

 Documentation/dev-tools/kcov.rst |  17 +-
 drivers/usb/core/hcd.c           |   3 +
 include/linux/sched.h            |   3 +
 kernel/kcov.c                    | 266 ++++++++++++++++++++++---------
 lib/Kconfig.debug                |   9 ++
 5 files changed, 213 insertions(+), 85 deletions(-)

-- 
2.25.1.696.g5e7596f4ac-goog

