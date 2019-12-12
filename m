Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 835BF11C650
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 08:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbfLLHTm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 12 Dec 2019 02:19:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:48090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728043AbfLLHTm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Dec 2019 02:19:42 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 205841] New: Lenovo USB-C dock audio NULL pointer
Date:   Thu, 12 Dec 2019 07:19:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: owl@ow1.in
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-205841-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=205841

            Bug ID: 205841
           Summary: Lenovo USB-C dock audio NULL pointer
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.2
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: owl@ow1.in
        Regression: No

Created attachment 286257
  --> https://bugzilla.kernel.org/attachment.cgi?id=286257&action=edit
Full dmesg

After rebuilding new kernel (5.4.2 instead 5.0.21) from blank config I've got a
problems with Dock audio. This bug affect all sound subsystem on my laptop. If
dock is detached - sound works perfectly (I use external usb sound card)

[    4.513754] usb 1-2.4.2.3: New USB device found, idVendor=17ef,
idProduct=3063, bcdDevice= 9.02
[    4.513755] usb 1-2.4.2.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    4.513757] usb 1-2.4.2.3: Product: ThinkPad USB-C Dock Audio
[    4.513758] usb 1-2.4.2.3: Manufacturer: Lenovo
[    4.513758] usb 1-2.4.2.3: SerialNumber: 000000000000
[    4.614903] input: Lenovo ThinkPad USB-C Dock Audio as
/devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2.4/1-2.4.2/1-2.4.2.3/1-2.4.2.3:1.3/0003:17EF:3063.0008/input/input25
[    4.666674] hid-generic 0003:17EF:3063.0008: input,hidraw7: USB HID v1.11
Device [Lenovo ThinkPad USB-C Dock Audio] on usb-0000:00:14.0-2.4.2.3/input3
[    8.011481] BUG: kernel NULL pointer dereference, address: 00000000000002de
[    8.011482] #PF: supervisor read access in kernel mode
[    8.011483] #PF: error_code(0x0000) - not-present page
[    8.011483] PGD 0 P4D 0 
[    8.011485] Oops: 0000 [#1] SMP NOPTI
[    8.011486] CPU: 0 PID: 51 Comm: kworker/0:1 Not tainted 5.4.2 #6
[    8.011486] Hardware name: LENOVO 20N8005JMH/20N8005JMH, BIOS R0YET34W (1.17
) 07/27/2019
[    8.011489] Workqueue: events_long ucsi_init
[    8.011492] RIP: 0010:typec_altmode_update_active+0x16/0xf0
[    8.011492] Code: ff ff ff 31 c0 c3 b8 ea ff ff ff c3 0f 1f 84 00 00 00 00
00 55 53 48 83 ec 10 65 48 8b 04 25 28 00 00 00 48 89 44 24 08 31 c0 <0f> b6 87
dc 02 00 00 83 e0 01 40 38 f0 0f 84 8d 00 00 00 48 8b 47
[    8.011493] RSP: 0018:ffffae1f00257dc8 EFLAGS: 00010246
[    8.011494] RAX: 0000000000000000 RBX: ffff9e60dbbc2270 RCX:
0000000000000000
[    8.011494] RDX: ffff9e60dcd18c28 RSI: 0000000000000000 RDI:
0000000000000002
[    8.011494] RBP: 0000000000000000 R08: 0000000000000000 R09:
0000000000000000
[    8.011495] R10: 0000000000000000 R11: 0000000000000001 R12:
0000000000000000
[    8.011495] R13: ffff9e60dcd18c00 R14: ffff9e60dbbc22c0 R15:
ffff9e60dbbc2000
[    8.011496] FS:  0000000000000000(0000) GS:ffff9e60e6200000(0000)
knlGS:0000000000000000
[    8.011496] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.011497] CR2: 00000000000002de CR3: 0000000193c0a006 CR4:
00000000003606f0
[    8.011497] Call Trace:
[    8.011499]  ucsi_altmode_update_active+0xa8/0xf0
[    8.011501]  ucsi_init+0x37e/0x570
[    8.011503]  process_one_work+0x1db/0x380
[    8.011504]  worker_thread+0x45/0x3c0
[    8.011505]  kthread+0xf6/0x130
[    8.011506]  ? process_one_work+0x380/0x380
[    8.011507]  ? kthread_park+0x80/0x80
[    8.011509]  ret_from_fork+0x35/0x40
[    8.011510] Modules linked in:
[    8.011511] CR2: 00000000000002de
[    8.011512] ---[ end trace 284cb2221d91180a ]---
[    8.011514] RIP: 0010:typec_altmode_update_active+0x16/0xf0
[    8.011514] Code: ff ff ff 31 c0 c3 b8 ea ff ff ff c3 0f 1f 84 00 00 00 00
00 55 53 48 83 ec 10 65 48 8b 04 25 28 00 00 00 48 89 44 24 08 31 c0 <0f> b6 87
dc 02 00 00 83 e0 01 40 38 f0 0f 84 8d 00 00 00 48 8b 47
[    8.011515] RSP: 0018:ffffae1f00257dc8 EFLAGS: 00010246
[    8.011515] RAX: 0000000000000000 RBX: ffff9e60dbbc2270 RCX:
0000000000000000
[    8.011516] RDX: ffff9e60dcd18c28 RSI: 0000000000000000 RDI:
0000000000000002
[    8.011516] RBP: 0000000000000000 R08: 0000000000000000 R09:
0000000000000000
[    8.011516] R10: 0000000000000000 R11: 0000000000000001 R12:
0000000000000000
[    8.011517] R13: ffff9e60dcd18c00 R14: ffff9e60dbbc22c0 R15:
ffff9e60dbbc2000
[    8.011517] FS:  0000000000000000(0000) GS:ffff9e60e6200000(0000)
knlGS:0000000000000000
[    8.011518] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.011518] CR2: 00000000000002de CR3: 0000000193c0a006 CR4:
00000000003606f0

...

[   59.149702] usb 1-2.4.2.3: Not enough bandwidth for new device state.
[   59.149707] usb 1-2.4.2.3: Not enough bandwidth for altsetting 1
[   59.149708] usb 1-2.4.2.3: 2:1: usb_set_interface failed (-28)
[   59.150124] usb 1-2.4.2.3: Not enough bandwidth for new device state.
[   59.150131] usb 1-2.4.2.3: Not enough bandwidth for altsetting 1
[   59.150132] usb 1-2.4.2.3: 2:1: usb_set_interface failed (-28)
[   59.150587] usb 1-2.4.2.3: Not enough bandwidth for new device state.
[   59.150594] usb 1-2.4.2.3: Not enough bandwidth for altsetting 1
[   59.150595] usb 1-2.4.2.3: 2:1: usb_set_interface failed (-28)
[   59.151075] usb 1-2.4.2.3: Not enough bandwidth for new device state.
[   59.151079] usb 1-2.4.2.3: Not enough bandwidth for altsetting 1
[   59.151080] usb 1-2.4.2.3: 2:1: usb_set_interface failed (-28)
[   59.151538] usb 1-2.4.2.3: Not enough bandwidth for new device state.
[   59.151545] usb 1-2.4.2.3: Not enough bandwidth for altsetting 1
[   59.151546] usb 1-2.4.2.3: 2:1: usb_set_interface failed (-28)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
