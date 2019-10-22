Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20487E0990
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 18:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732062AbfJVQqk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 12:46:40 -0400
Received: from mail-wr1-f73.google.com ([209.85.221.73]:46017 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388743AbfJVQqj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 12:46:39 -0400
Received: by mail-wr1-f73.google.com with SMTP id f4so9419666wrj.12
        for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2019 09:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=FxzIQyDunHtVBZCVK6ttUg3oB9s0DEBjz5E3R+aCqJU=;
        b=bwG8FsZzFAPaLXF+EeN/hUCP9Ctc2PqOreWk2uXXPC1rx7igFgoYTwQmMPUoum8kN2
         BCDHyY+9Y3k4GDqLnxZX4DJeS4dHVZz2+0dRswv3cdpUzr/TwgGbwwFH8QyCXUgUjuhZ
         Nks82aX0zUMLehsuEDOPYo2bHPgtiRFXEe4h7LU+Z1NBLKnIwZRQ2yBDEq33H4IQb/8R
         eNidmD5c9kaZE2RILTyQvcpk2qanv245jpGAsz/TPPZSFFwDGPHmUQKp1M3LWnrLJXq7
         NuTimyO/udpVPVqtAL1NOviEG57gds0FKsZoYgaXz6fcekzuyx53kphtB0HI5IqkuVvQ
         aoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=FxzIQyDunHtVBZCVK6ttUg3oB9s0DEBjz5E3R+aCqJU=;
        b=kD/ZpBn9oAUGmR86LE1/5V17hnD6if2WF6cborfJqWqPgYBle622fXwwqn+0Qkdxxm
         5Ve7vly/5qK3DGxn607N8e5zys3kK65qFXrHu10p4kGeM65IJfL9E09TPRejRch/upkD
         5/sojGcrIFX1nSglJxZuPSx/pq1q1hcKNS01IIrm2m4VYH7SLEXm8bwQD8ej3GKLMqMZ
         RwzTbvLIXvcuvRoYz3X7boCGav2EAK6Eo5QhGTo6BYqpS3WB717srcrWa12acKNsuYFY
         +oJGKzUKMMVQQOO2Dl3e9mtnX/dzL1ctFwuCDVJ6Q6iSvgodOR2Hwx0KxfvH6IGWC71T
         3Rlg==
X-Gm-Message-State: APjAAAVKUtW/SRqpwx4U0QqzLvsZ76kE8r/OF8vqnstUZueAHd8Ycmy1
        aqVZA+xFtGfw61VGDpFr4QrwVDN154ZQSNw7ejSUZ1DywCTrLVr5zaQ2Ev+vz+Gww5hS2jZX680
        C8xLQ9kTj/UbdPRWF89l+x+p/6eGBHMyCWzWGt9w/+YxC+YR1AFnMe27DIKDqyk5cPN0zn6fFDp
        q1
X-Google-Smtp-Source: APXvYqzw4xdCDUIijFFJk3ia1kfm+QpMoPGMUaeGlY+KJBFhy0thno5gFZaPKu1JXCicdUguQwe6wX+B/HIHHpRY
X-Received: by 2002:a5d:4644:: with SMTP id j4mr944846wrs.355.1571762797288;
 Tue, 22 Oct 2019 09:46:37 -0700 (PDT)
Date:   Tue, 22 Oct 2019 18:46:30 +0200
Message-Id: <cover.1571762488.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 0/3] kcov: collect coverage from usb and vhost
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-usb@vger.kernel.org, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        David Windsor <dwindsor@gmail.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset extends kcov to allow collecting coverage from the USB
subsystem and vhost workers. See the first patch description for details
about the kcov extension. The other two patches apply this kcov extension
to USB and vhost.

These patches have been used to enable coverage-guided USB fuzzing with
syzkaller for the last few years, see the details here:

https://github.com/google/syzkaller/blob/master/docs/linux/external_fuzzing_usb.md

This patchset has been pushed to the public Linux kernel Gerrit instance:

https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/1524

Changes from RFC v1:
- Remove unnecessary #ifdef's from drivers/vhost/vhost.c.
- Reset t->kcov when area allocation fails in kcov_remote_start().
- Use struct_size to calculate array size in kcov_ioctl().
- Add a limit on area_size in kcov_remote_arg.
- Added kcov_disable() helper.
- Changed encoding of kcov remote handle ids, see the documentation.
- Added a comment reference for kcov_sequence task_struct field.
- Change common_handle type to u32.
- Add checks for handle validity into kcov_ioctl_locked() and
    kcov_remote_start().
- Updated documentation to reflect the changes.

Andrey Konovalov (3):
  kcov: remote coverage support
  usb, kcov: collect coverage from hub_event
  vhost, kcov: collect coverage from vhost_worker

 Documentation/dev-tools/kcov.rst | 120 ++++++++
 drivers/usb/core/hub.c           |   5 +
 drivers/vhost/vhost.c            |   6 +
 drivers/vhost/vhost.h            |   1 +
 include/linux/kcov.h             |   6 +
 include/linux/sched.h            |   6 +
 include/uapi/linux/kcov.h        |  20 ++
 kernel/kcov.c                    | 464 ++++++++++++++++++++++++++++---
 8 files changed, 593 insertions(+), 35 deletions(-)

-- 
2.23.0.866.gb869b98d4c-goog

