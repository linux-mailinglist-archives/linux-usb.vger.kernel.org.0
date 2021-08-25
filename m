Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234B13F7AD6
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 18:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241316AbhHYQm0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 12:42:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:37484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237319AbhHYQmY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 12:42:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2924161056
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 16:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629909698;
        bh=OT3CTfhXeq8RifS0irPh/0EBjqEUYcecRPkGJ1bFgrs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tb+dMACRVbZEeC3ZpN3xdteN+xlq6borE7eR5+SlaQxt9dQ9QocQTrM75ipCfoxFJ
         FfLLdaPJvLVAXC/zh62x9DFdMD+Cr8tCj0zXKr2wqOoSHIE3wfSP9ld80gnZ6AP/Mf
         C6GLvta1DaHa5mk2q+W+QUlRMz6Kb/MreHlX4mhv8YZNVJ09tpvj8aV/VIsCCQXCSy
         iZpSNXK912mXBym4vmE62wQGBfgICH4ZdKKxZl7V13E1XZUzbY8CXWyuxVgnpxTuAT
         sMJ/RngvaXDszCr0iXiEHSm7pe+YN/2KRxGvWnHppDoPsdqUqGQvkUlc3JEebem5Ks
         MkN+mDunyjZUQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 1CDF660FF0; Wed, 25 Aug 2021 16:41:38 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB keyboard (and other devices) connected to Thinkpad
 Dock hangs after a while
Date:   Wed, 25 Aug 2021 16:41:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: catchall-kernelbug@blubbbla.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207887-208809-cxzsdWeqrT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207887-208809@https.bugzilla.kernel.org/>
References: <bug-207887-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D207887

--- Comment #12 from Johannes Wegener (catchall-kernelbug@blubbbla.de) ---
But at least the Call-Trace looks a bit more helpful (mentions hub_event) a=
nd
seems to hang in a mutex:


[ +43.245062] INFO: task kworker/0:1:19 blocked for more than 245 seconds.
[  +0.000014]       Tainted: P           OE     5.13.12-arch1-1 #1
[  +0.000005] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables t=
his
message.
[  +0.000004] task:kworker/0:1     state:D stack:    0 pid:   19 ppid:     2
flags:0x00004000
[  +0.000011] Workqueue: usb_hub_wq hub_event
[  +0.000015] Call Trace:
[  +0.000005]  __schedule+0x310/0x930
[  +0.000013]  schedule+0x5b/0xc0
[  +0.000007]  schedule_preempt_disabled+0x11/0x20
[  +0.000008]  __mutex_lock.constprop.0+0x2f8/0x4e0
[  +0.000011]  hub_event+0x1a8/0x17f0
[  +0.000011]  ? finish_task_switch.isra.0+0xaa/0x290
[  +0.000012]  process_one_work+0x1e3/0x3b0
[  +0.000010]  worker_thread+0x50/0x3b0
[  +0.000007]  ? process_one_work+0x3b0/0x3b0
[  +0.000007]  kthread+0x133/0x160
[  +0.000005]  ? set_kthread_struct+0x40/0x40
[  +0.000006]  ret_from_fork+0x22/0x30
[  +0.000022] INFO: task kworker/u8:2:84 blocked for more than 245 seconds.
[  +0.000006]       Tainted: P           OE     5.13.12-arch1-1 #1
[  +0.000004] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables t=
his
message.
[  +0.000003] task:kworker/u8:2    state:D stack:    0 pid:   84 ppid:     2
flags:0x00004000
[  +0.000007] Workqueue: scsi_tmf_8 scmd_eh_abort_handler
[  +0.000012] Call Trace:
[  +0.000003]  __schedule+0x310/0x930
[  +0.000008]  schedule+0x5b/0xc0
[  +0.000007]  schedule_timeout+0x11c/0x160
[  +0.000011]  wait_for_completion+0xa3/0x100
[  +0.000011]  command_abort+0x63/0x80 [usb_storage]
[  +0.000013]  scmd_eh_abort_handler+0x7e/0x230
[  +0.000009]  process_one_work+0x1e3/0x3b0
[  +0.000008]  worker_thread+0x50/0x3b0
[  +0.000007]  ? process_one_work+0x3b0/0x3b0
[  +0.000007]  kthread+0x133/0x160
[  +0.000005]  ? set_kthread_struct+0x40/0x40
[  +0.000005]  ret_from_fork+0x22/0x30
[  +0.000036] INFO: task udisksd:2185 blocked for more than 245 seconds.
[  +0.000005]       Tainted: P           OE     5.13.12-arch1-1 #1
[  +0.000004] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables t=
his
message.
[  +0.000003] task:udisksd         state:D stack:    0 pid: 2185 ppid:     1
flags:0x00000000
[  +0.000007] Call Trace:
[  +0.000003]  __schedule+0x310/0x930
[  +0.000008]  schedule+0x5b/0xc0
[  +0.000007]  schedule_timeout+0x11c/0x160
[  +0.000009]  wait_for_completion+0xa3/0x100
[  +0.000008]  __flush_work.isra.0+0x15b/0x210
[  +0.000008]  ? flush_workqueue_prep_pwqs+0x130/0x130
[  +0.000008]  __cancel_work_timer+0x12e/0x1c0
[  +0.000010]  disk_block_events+0x6f/0x90
[  +0.000007]  blkdev_get_by_dev+0xe5/0x220
[  +0.000008]  ? blkdev_get_by_dev+0x220/0x220
[  +0.000006]  blkdev_open+0x4c/0x90
[  +0.000006]  do_dentry_open+0x14b/0x380
[  +0.000013]  path_openat+0xb93/0x1000
[  +0.000010]  ? _copy_to_iter+0xdb/0x7b0
[  +0.000008]  do_filp_open+0xa5/0x150
[  +0.000014]  do_sys_openat2+0xb0/0x160
[  +0.000006]  __x64_sys_openat+0x53/0x90
[  +0.000006]  do_syscall_64+0x61/0x80
[  +0.000008]  ? exc_page_fault+0x78/0x180
[  +0.000009]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  +0.000012] RIP: 0033:0x7f7a234a5f04
[  +0.000006] RSP: 002b:00007ffc593edb50 EFLAGS: 00000293 ORIG_RAX:
0000000000000101
[  +0.000007] RAX: ffffffffffffffda RBX: 00007ffc593edc54 RCX: 00007f7a234a=
5f04
[  +0.000004] RDX: 0000000000000000 RSI: 000055a67b147e40 RDI: 00000000ffff=
ff9c
[  +0.000005] RBP: 000055a67b147e40 R08: 0000000000000000 R09: 463801417d48=
3af5
[  +0.000003] R10: 0000000000000000 R11: 0000000000000293 R12: 000000000000=
0000
[  +0.000004] R13: 0000000000000000 R14: 000055a67b12b160 R15: 000055a67a59=
a828
[Aug25 18:36] INFO: task kworker/0:1:19 blocked for more than 368 seconds.
[  +0.000014]       Tainted: P           OE     5.13.12-arch1-1 #1
[  +0.000005] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables t=
his
message.
[  +0.000004] task:kworker/0:1     state:D stack:    0 pid:   19 ppid:     2
flags:0x00004000
[  +0.000011] Workqueue: usb_hub_wq hub_event
[  +0.000014] Call Trace:
[  +0.000006]  __schedule+0x310/0x930
[  +0.000012]  schedule+0x5b/0xc0
[  +0.000007]  schedule_preempt_disabled+0x11/0x20
[  +0.000007]  __mutex_lock.constprop.0+0x2f8/0x4e0
[  +0.000011]  hub_event+0x1a8/0x17f0
[  +0.000012]  ? finish_task_switch.isra.0+0xaa/0x290
[  +0.000012]  process_one_work+0x1e3/0x3b0
[  +0.000010]  worker_thread+0x50/0x3b0
[  +0.000007]  ? process_one_work+0x3b0/0x3b0
[  +0.000007]  kthread+0x133/0x160
[  +0.000005]  ? set_kthread_struct+0x40/0x40
[  +0.000006]  ret_from_fork+0x22/0x30
[  +0.000021] INFO: task kworker/u8:2:84 blocked for more than 368 seconds.
[  +0.000006]       Tainted: P           OE     5.13.12-arch1-1 #1
[  +0.000004] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables t=
his
message.
[  +0.000003] task:kworker/u8:2    state:D stack:    0 pid:   84 ppid:     2
flags:0x00004000
[  +0.000007] Workqueue: scsi_tmf_8 scmd_eh_abort_handler
[  +0.000011] Call Trace:
[  +0.000004]  __schedule+0x310/0x930
[  +0.000008]  schedule+0x5b/0xc0
[  +0.000007]  schedule_timeout+0x11c/0x160
[  +0.000010]  wait_for_completion+0xa3/0x100
[  +0.000011]  command_abort+0x63/0x80 [usb_storage]
[  +0.000014]  scmd_eh_abort_handler+0x7e/0x230
[  +0.000009]  process_one_work+0x1e3/0x3b0
[  +0.000008]  worker_thread+0x50/0x3b0
[  +0.000006]  ? process_one_work+0x3b0/0x3b0
[  +0.000008]  kthread+0x133/0x160
[  +0.000004]  ? set_kthread_struct+0x40/0x40
[  +0.000006]  ret_from_fork+0x22/0x30

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
