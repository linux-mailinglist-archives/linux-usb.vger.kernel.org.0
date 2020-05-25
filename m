Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BEC1E12A4
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 18:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731470AbgEYQ2c convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 25 May 2020 12:28:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:35048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731458AbgEYQ2b (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 12:28:31 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] New: USB devices connected to Thinkpad Dock hangs after
 a while
Date:   Mon, 25 May 2020 16:28:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@3v1n0.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-207887-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207887

            Bug ID: 207887
           Summary: USB devices connected to Thinkpad Dock hangs after a
                    while
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.0.0 -> master
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: mail@3v1n0.net
        Regression: No

Created attachment 289275
  --> https://bugzilla.kernel.org/attachment.cgi?id=289275&action=edit
DMesg of the hang with kernel-5.4.26-050426

Since I've moved from kernel 4.15 to kernel 5, the USB hub managed of my
Thinkpad Dock doesn't seem to work well after some usage (unfortunately is
quite hard to find a reproducer, as it "just happens", normally while writing).

This seems to be mostly triggered by the usage of an USB keyboard, as when the
USB traffic is limited to other devices, it doesn't seem to happen.

[  +0,136020] Freezing of tasks failed after 20.006 seconds (2 tasks refusing
to freeze, wq_busy=0):
[  +0,000387] device poll     D    0 22575   4818 0x00000004
[  +0,000006] Call Trace:
[  +0,000014]  __schedule+0x2e3/0x740
[  +0,000005]  ? __switch_to_asm+0x40/0x70
[  +0,000003]  ? __switch_to_asm+0x34/0x70
[  +0,000006]  schedule+0x42/0xb0
[  +0,000005]  schedule_preempt_disabled+0xe/0x10
[  +0,000005]  __mutex_lock.isra.0+0x182/0x4f0
[  +0,000008]  ? device_match_of_node+0x20/0x20
[  +0,000005]  __mutex_lock_slowpath+0x13/0x20
[  +0,000005]  mutex_lock+0x2e/0x40
[  +0,000007]  usbdev_open+0xd9/0x240
[  +0,000007]  chrdev_open+0xd3/0x1c0
[  +0,000006]  ? cdev_default_release+0x20/0x20
[  +0,000006]  do_dentry_open+0x143/0x3a0
[  +0,000006]  vfs_open+0x2d/0x30
[  +0,000005]  do_last+0x194/0x900
[  +0,000006]  path_openat+0x8d/0x290
[  +0,000006]  do_filp_open+0x91/0x100
[  +0,000006]  ? __alloc_fd+0x46/0x150
[  +0,000006]  do_sys_open+0x17f/0x230
[  +0,000007]  __x64_sys_openat+0x20/0x30
[  +0,000006]  do_syscall_64+0x57/0x190
[  +0,000004]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  +0,000005] RIP: 0033:0x7f9942175d19
[  +0,000010] Code: Bad RIP value.
[  +0,000003] RSP: 002b:00007f9940d2dab0 EFLAGS: 00000293 ORIG_RAX:
0000000000000101
[  +0,000005] RAX: ffffffffffffffda RBX: 00007f9930000bab RCX: 00007f9942175d19
[  +0,000002] RDX: 0000000000080000 RSI: 00007f9930010bf0 RDI: 00000000ffffff9c
[  +0,000002] RBP: 0000000000080000 R08: 0000000000000000 R09: 0000000000000000
[  +0,000002] R10: 0000000000000000 R11: 0000000000000293 R12: 00007f9930010bf0
[  +0,000002] R13: 00007f9930010bf0 R14: 00007f9930000b20 R15: 000055ed68c60c60
[  +0,000094] colord-sane     D    0  4630   3097 0x00000004
[  +0,000005] Call Trace:
[  +0,000006]  __schedule+0x2e3/0x740
[  +0,000004]  ? __switch_to_asm+0x40/0x70
[  +0,000003]  ? __switch_to_asm+0x34/0x70
[  +0,000005]  schedule+0x42/0xb0
[  +0,000005]  schedule_preempt_disabled+0xe/0x10
[  +0,000005]  __mutex_lock.isra.0+0x182/0x4f0
[  +0,000006]  ? device_match_of_node+0x20/0x20
[  +0,000006]  __mutex_lock_slowpath+0x13/0x20
[  +0,000005]  mutex_lock+0x2e/0x40
[  +0,000005]  usbdev_open+0xd9/0x240
[  +0,000006]  chrdev_open+0xd3/0x1c0
[  +0,000006]  ? cdev_default_release+0x20/0x20
[  +0,000005]  do_dentry_open+0x143/0x3a0
[  +0,000006]  vfs_open+0x2d/0x30
[  +0,000004]  do_last+0x194/0x900
[  +0,000006]  path_openat+0x8d/0x290
[  +0,000005]  ? do_anonymous_page+0x2e6/0x650
[  +0,000005]  do_filp_open+0x91/0x100
[  +0,000005]  ? __alloc_fd+0x46/0x150
[  +0,000006]  do_sys_open+0x17f/0x230
[  +0,000006]  __x64_sys_openat+0x20/0x30
[  +0,000006]  do_syscall_64+0x57/0x190
[  +0,000004]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  +0,000002] RIP: 0033:0x7f9e090a1dae
[  +0,000006] Code: Bad RIP value.
[  +0,000002] RSP: 002b:00007ffd77440af0 EFLAGS: 00000293 ORIG_RAX:
0000000000000101
[  +0,000004] RAX: ffffffffffffffda RBX: 00005608306a3450 RCX: 00007f9e090a1dae
[  +0,000002] RDX: 0000000000000000 RSI: 00007ffd77441c10 RDI: 00000000ffffff9c
[  +0,000002] RBP: 00000000ffffffff R08: 0000000000000000 R09: 000056083069373b
[  +0,000002] R10: 0000000000000000 R11: 0000000000000293 R12: 00007f9df790a110
[  +0,000002] R13: 00005608306a3460 R14: 0000000000000000 R15: 00007ffd77441c10
[  +0,000010] OOM killer enabled.
[  +0,000001] Restarting tasks ... done.
[  +0,030746] thermal thermal_zone3: failed to read out thermal zone (-61)
[  +0,059657] PM: suspend exit
[  +0,000065] PM: suspend entry (s2idle)
[  +0,014476] Filesystems sync: 0.014 seconds
[  +0,000348] Freezing user space processes ... 
[  +0,397649] usb 2-4.2: reset SuperSpeed Gen 1 USB device number 13 using
xhci_hcd

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
