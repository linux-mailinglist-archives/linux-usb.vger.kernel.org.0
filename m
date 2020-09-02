Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EABFF25AB33
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 14:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgIBMei convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 2 Sep 2020 08:34:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:34416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726124AbgIBMeh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 08:34:37 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB devices connected to Thinkpad Dock hangs after a
 while
Date:   Wed, 02 Sep 2020 12:34:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207887-208809-sVzPH2Yx7h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207887-208809@https.bugzilla.kernel.org/>
References: <bug-207887-208809@https.bugzilla.kernel.org/>
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

--- Comment #2 from Marco Trevisan (Treviño) (mail@3v1n0.net) ---
Not sure if this is totally related to the dock or more likely to an USB
mechanical keyboard (both TEX Yoda II and TEX Shinobi - this one is also
bluetooth when connected) that seems to behave differently. 
This is on kernel 5.4.0-42-generic (ubuntu)

In the middle of using it I've got a:

set 01 18:35:44 tricky kernel: usb 1-3.2.3: reset full-speed USB device number
33 using xhci_hcd
set 01 18:36:11 tricky acpid[2940]: input device has been disconnected, fd 28
set 01 18:36:11 tricky acpid[2940]: input device has been disconnected, fd 29
set 01 18:36:13 tricky kernel: Bluetooth: hci0: advertising data len corrected
set 01 18:36:16 tricky kernel: input: TEX-BLE-KB-1 Mouse as
/devices/virtual/misc/uhid/0005:0000:0000.0038/input/input108
set 01 18:36:16 tricky kernel: input: TEX-BLE-KB-1 Keyboard as
/devices/virtual/misc/uhid/0005:0000:0000.0038/input/input109
set 01 18:36:16 tricky kernel: input: TEX-BLE-KB-1 Consumer Control as
/devices/virtual/misc/uhid/0005:0000:0000.0038/input/input110
set 01 18:36:16 tricky kernel: hid-generic 0005:0000:0000.0038: input,hidraw4:
BLUETOOTH HID v0.00 Mouse [TEX-BLE-KB-1] on 44:85:00:64:22:b9
set 01 18:36:16 tricky systemd-logind[3018]: Watching system buttons on
/dev/input/event26 (TEX-BLE-KB-1 Keyboard)
set 01 18:38:11 tricky kernel: INFO: task kworker/u16:8:183192 blocked for more
than 120 seconds.
set 01 18:38:11 tricky kernel:       Tainted: G         C OE K  
5.4.0-42-generic #46-Ubuntu
set 01 18:38:11 tricky kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
set 01 18:38:11 tricky kernel: kworker/u16:8   D    0 183192      2 0x80004000
set 01 18:38:11 tricky kernel: Workqueue: scsi_tmf_4 scmd_eh_abort_handler
set 01 18:38:11 tricky kernel: Call Trace:
set 01 18:38:11 tricky kernel:  __schedule+0x2e3/0x740
set 01 18:38:11 tricky kernel:  schedule+0x42/0xb0
set 01 18:38:11 tricky kernel:  schedule_timeout+0x203/0x2f0
set 01 18:38:11 tricky kernel:  wait_for_completion+0xb1/0x120
set 01 18:38:11 tricky kernel:  ? wake_up_q+0x70/0x70
set 01 18:38:11 tricky kernel:  command_abort+0x60/0xa0 [usb_storage]
set 01 18:38:11 tricky kernel:  scmd_eh_abort_handler+0x8d/0x220
set 01 18:38:11 tricky kernel:  process_one_work+0x1eb/0x3b0
set 01 18:38:11 tricky kernel:  worker_thread+0x4d/0x400
set 01 18:38:11 tricky kernel:  kthread+0x104/0x140
set 01 18:38:11 tricky kernel:  ? process_one_work+0x3b0/0x3b0
set 01 18:38:11 tricky kernel:  ? kthread_park+0x90/0x90

... repeated various times ...

Then when trying to reonnect:
set 01 21:34:08 tricky kernel: usb 1-3: USB disconnect, device number 30
set 01 21:34:08 tricky kernel: usb 1-3.2: USB disconnect, device number 31
set 01 21:34:08 tricky kernel: usb 1-3.3: cannot submit urb (err = -19)
set 01 21:34:08 tricky kernel: usb 1-3.3: cannot submit urb 0, error -19: no
device
set 01 21:34:08 tricky kernel: usb 2-4: USB disconnect, device number 10
set 01 21:34:08 tricky kernel: usb 2-4.2: USB disconnect, device number 11



Then it fails when trying to suspend:

set 01 21:34:54 tricky kernel: PM: suspend entry (deep)
set 01 21:34:54 tricky systemd-sleep[319991]: Suspending system...
set 01 21:34:54 tricky kernel: Filesystems sync: 0.012 seconds
set 01 21:35:14 tricky kernel: Freezing user space processes ... (elapsed 0.005
seconds) done.
set 01 21:35:14 tricky kernel: OOM killer disabled.
set 01 21:35:14 tricky kernel: Freezing remaining freezable tasks ... 
set 01 21:35:14 tricky kernel: Freezing of tasks failed after 20.008 seconds (0
tasks refusing to freeze, wq_busy=1):
set 01 21:35:14 tricky kernel: Showing busy workqueues and worker pools:
set 01 21:35:14 tricky kernel: workqueue events_freezable: flags=0x4
set 01 21:35:14 tricky kernel:   pwq 0: cpus=0 node=0 flags=0x0 nice=0
active=0/0 refcnt=2
set 01 21:35:14 tricky kernel:     delayed: pci_pme_list_scan
set 01 21:35:14 tricky kernel: workqueue events_freezable_power_: flags=0x86
set 01 21:35:14 tricky kernel:   pwq 16: cpus=0-7 flags=0x4 nice=0 active=1/0
refcnt=3
set 01 21:35:14 tricky kernel:     in-flight: 255885:disk_events_workfn
set 01 21:35:14 tricky kernel: workqueue usb_hub_wq: flags=0x4
set 01 21:35:14 tricky kernel:   pwq 0: cpus=0 node=0 flags=0x0 nice=0
active=4/0 refcnt=5
set 01 21:35:14 tricky kernel:     in-flight: 314094:hub_event hub_event,
279442:hub_event hub_event
set 01 21:35:14 tricky kernel: workqueue scsi_tmf_4: flags=0x2000a
set 01 21:35:14 tricky kernel:   pwq 16: cpus=0-7 flags=0x4 nice=0 active=1/1
refcnt=3
set 01 21:35:14 tricky kernel:     in-flight: 183192:scmd_eh_abort_handler
set 01 21:35:14 tricky kernel: pool 0: cpus=0 node=0 flags=0x0 nice=0 hung=0s
workers=5 idle: 319427 317598 319488
set 01 21:35:14 tricky kernel: pool 16: cpus=0-7 flags=0x4 nice=0 hung=1s
workers=13 idle: 311397 312581 300348 280847 275132 317871 252113 305935 212775
279932 300931
set 01 21:35:14 tricky kernel: Restarting kernel threads ... done.
set 01 21:35:14 tricky kernel: OOM killer enabled.
set 01 21:35:14 tricky kernel: Restarting tasks ... done.


Rebooting seems to be the only option.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
