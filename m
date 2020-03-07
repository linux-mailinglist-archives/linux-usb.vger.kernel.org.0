Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7D617CF49
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2020 17:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgCGQVi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 7 Mar 2020 11:21:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:56190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbgCGQVi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 7 Mar 2020 11:21:38 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206779] usb subsystems hang
Date:   Sat, 07 Mar 2020 16:21:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206779-208809-SCFxwEJ07j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206779-208809@https.bugzilla.kernel.org/>
References: <bug-206779-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206779

--- Comment #1 from sander44 (ionut_n2001@yahoo.com) ---
(In reply to sander44 from comment #0)
> Hi,
> 
> I observed issue with this version with one usb device.
> 
> My setup is:
> 
> Ubuntu 19.10 clean install
> Kernel 5.5.7 vanilla, 5.5.7-vanilla
> 
> My issue is:
> [  726.043665] INFO: task fastboot:1531 blocked for more than 120 seconds.
> [  726.043716]       Not tainted 5.5.7-vanilla #1
> [  726.043734] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
> this message.
> [  726.043753] fastboot        D    0  1531   1413 0x00000004
> [  726.043755] Call Trace:
> [  726.043778]  __schedule+0x28c/0x6e0
> [  726.043779]  schedule+0x44/0xb0
> [  726.043780]  schedule_timeout+0x1d3/0x2f0
> [  726.043783]  ? ttwu_do_activate+0x5a/0x70
> [  726.043784]  wait_for_completion_timeout+0xb3/0x140
> [  726.043785]  ? wake_up_q+0xb0/0xb0
> [  726.043787]  usb_start_wait_urb+0x8c/0x180
> [  726.043788]  usb_bulk_msg+0xb8/0x160
> [  726.043790]  proc_bulk+0x158/0x3a0
> [  726.043791]  usbdev_ioctl+0xc08/0x1480
> [  726.043794]  do_vfs_ioctl+0xa5/0x680
> [  726.043796]  ? finish_task_switch+0x70/0x260
> [  726.043798]  ? tomoyo_file_ioctl+0x19/0x20
> [  726.043799]  ksys_ioctl+0x75/0x80
> [  726.043801]  __x64_sys_ioctl+0x1a/0x20
> [  726.043803]  do_syscall_64+0x57/0x1c0
> [  726.043804]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  726.043810] RIP: 0033:0x7f1da431867b
> [  726.043815] Code: Bad RIP value.
> [  726.043816] RSP: 002b:00007ffdb4c22af8 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  726.043817] RAX: ffffffffffffffda RBX: 000055b82cb5c2a0 RCX:
> 00007f1da431867b
> [  726.043818] RDX: 00007ffdb4c22b00 RSI: 00000000c0185502 RDI:
> 0000000000000004
> [  726.043818] RBP: 0000000000000040 R08: 00000000000001ec R09:
> 00007ffdb4c22b40
> [  726.043819] R10: 00007ffdb4c22b00 R11: 0000000000000246 R12:
> 0000000000000040
> [  726.043819] R13: 00000006fc23abff R14: 0000000000000000 R15:
> 00007ffdb4c22c70
> [  774.124057] usb 1-2: USB disconnect, device number 4
> 
> I had to restart the machine - vm so I could continue the process.
> My task is: writing a phone with adb and fastboot.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
