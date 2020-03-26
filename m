Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C16881941BC
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 15:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgCZOoR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 10:44:17 -0400
Received: from mail-wm1-f73.google.com ([209.85.128.73]:53773 "EHLO
        mail-wm1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgCZOoQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 10:44:16 -0400
Received: by mail-wm1-f73.google.com with SMTP id w12so2246462wmc.3
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 07:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=0ztpTFHM/v7rzyTjMcN9ecVfmbpO/4eeH0zSH5A1cB8=;
        b=mb8n+0XP3VZEfZbb/sgxZX+Mw4EdJ33EiWkhZbVsFj/z255W5CMC2Go0zBEZa8uMFA
         5++O/PqFxoEisnerq2JVADg+5UWUWTv+bZHdhien57wGtqAGrKN/nx8O5hcqQ4FrVVGU
         C8+t4GyD+yZp10zYO6kGBbFzUYDBgcyIvTXGzp026xSVbwSMfW0NscDlstKZBS+bDEKF
         u4I1vnvJvJDweRY21AqEKPv6yIvfLGKo2GAhM4uI3rPccvmfuC8g4X18WlX1VlAg6qp6
         MiWQLdpMlvCXFzlN7jV7yF0uwM0e+CoQTHI9IHuL+hqGazhWjhZxguPVWaJllxSqCeVm
         dYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=0ztpTFHM/v7rzyTjMcN9ecVfmbpO/4eeH0zSH5A1cB8=;
        b=DOmJwx0JZ14PWJj4XsBzrr5DssDduST5ir/7xFZNqcqUIHuufE2YyjwkD+NysznKo1
         xCGFvXjivlud6KCBmdbJXWFmc1OY4KWEbT4iGC9jLcpYRzf+UylZPynj8XfhXCDLF8BU
         ybsMFqrG1P4Gs174wPN0qqUUY0wjt4EQdGulEnPFbmNtFHrIGZ2i/46Ni1YVG8zEH6+Q
         nsms9ALrJl4/nTQgjSrNg37zUnitdu7Pab0RKtv+n2pdbhs28xEmcfURgbGdmqxIx7R1
         3PoNgPeAM61CmnZpobq1KdLolaY+8sO1y1ORHpBTozz8gazwAMn/f+F8exuum4ez3iGl
         WFLw==
X-Gm-Message-State: ANhLgQ1xQy0Zptd4AITDJ5PkCz2GvSqIDGWj9f2hT31ETQ15L4ZdGOpw
        6FWXUcBRsqBlxrTLvaJrT3Lnmoz12d/SWYtG
X-Google-Smtp-Source: ADFU+vvL/mqu+E+tMzhP0YiCEZMtOtZV6EtBGz5v+Oc+VaxAb1XnkthAoj46R9aoazEl/bTKDhY1HNMmYt4DSPza
X-Received: by 2002:a5d:6104:: with SMTP id v4mr10335836wrt.213.1585233853690;
 Thu, 26 Mar 2020 07:44:13 -0700 (PDT)
Date:   Thu, 26 Mar 2020 15:43:59 +0100
Message-Id: <cover.1585233617.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v4 0/7] kcov: collect coverage from usb soft interrupts
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

Any subsystem that uses softirqs (e.g. timers) can make use of this in
the future. Looking at the recent syzbot reports, an obvious candidate
is the networking subsystem [1, 2, 3 and many more].

[1] https://syzkaller.appspot.com/bug?extid=522ab502c69badc66ab7
[2] https://syzkaller.appspot.com/bug?extid=57f89d05946c53dbbb31
[3] https://syzkaller.appspot.com/bug?extid=df358e65d9c1b9d3f5f4

This patchset has been pushed to the public Linux kernel Gerrit instance:

https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2225

Changes v3 -> v4:
- Turn current->kcov_softirq into unsigned int to fix objtool warning.
- Fix commit author email address.

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
2.26.0.rc2.310.g2932bb562d-goog

