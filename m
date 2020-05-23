Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8FED1DFAB2
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2020 21:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387869AbgEWT2L convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 23 May 2020 15:28:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:42906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727996AbgEWT2L (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 May 2020 15:28:11 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207871] New: nullpointer dereference in
 uvc_video_stop_streaming
Date:   Sat, 23 May 2020 19:28:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ranma+kernel@tdiedrich.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-207871-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207871

            Bug ID: 207871
           Summary: nullpointer dereference in uvc_video_stop_streaming
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.26
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ranma+kernel@tdiedrich.de
        Regression: No

nullpointer dereference in V4L2CaptureThread when in-use USB3 uvcvideo device
drops of the bus:

[5473614.803782] usb 4-4.4: New USB device strings: Mfr=6, Product=7,
SerialNumber=3
[5473614.803784] usb 4-4.4: Product: HDMI to U3 capture
[5473614.803785] usb 4-4.4: Manufacturer: Video Grabber
[5473614.803787] usb 4-4.4: SerialNumber: 20000130041415
[5473614.804178] uvcvideo: Found UVC 1.00 device HDMI to U3 capture (1e4e:701f)
[5473614.818515] uvcvideo: UVC non compliance - GET_DEF(PROBE) not supported.
Enabling workaround.
[5473614.818716] uvcvideo 4-4.4:1.0: Entity type for entity Extension 4 was not
initialized!
[5473614.818718] uvcvideo 4-4.4:1.0: Entity type for entity Processing 3 was
not initialized!
[5473614.818720] uvcvideo 4-4.4:1.0: Entity type for entity Camera 1 was not
initialized!
[5473614.869980] systemd-udevd[16462]: Process '/usr/sbin/alsactl -E
HOME=/run/alsa restore 3' failed with exit code 99.

[5473633.057731] usb 4-4.4: reset SuperSpeed Gen 1 USB device number 58 using
xhci_hcd
[5473635.636401] usb 4-4.4: USB disconnect, device number 58
[5473635.642127] BUG: kernel NULL pointer dereference, address:
0000000000000000
[5473635.642132] #PF: supervisor read access in kernel mode
[5473635.642133] #PF: error_code(0x0000) - not-present page
[5473635.642135] PGD 0 P4D 0 
[5473635.642139] Oops: 0000 [#1] SMP
[5473635.642142] CPU: 0 PID: 16509 Comm: V4L2CaptureThre Not tainted 5.4.26 #2
[5473635.642144] Hardware name: Gigabyte Technology Co., Ltd.
AB350M-D3H/AB350M-D3H-CF, BIOS F31 05/06/2019
[5473635.642151] RIP: 0010:usb_ifnum_to_if+0x21/0x37
[5473635.642153] Code: ff ff 5b 5d 41 5c 41 5d c3 48 8b 87 98 03 00 00 48 85 c0
74 2a 0f b6 78 04 31 d2 39 d7 7e 1d 48 8b 8c d0 98 00 00 00 48 ff c2 <4c> 8b 01
45 0f b6 40 02 41 39 f0 75 e4 48 89 c8 eb 03 31 c0 c3 c3
[5473635.642155] RSP: 0018:ffffa140c109fb98 EFLAGS: 00010202
[5473635.642157] RAX: ffff89f4e64d2c00 RBX: ffff89f60d4b1000 RCX:
0000000000000000
[5473635.642159] RDX: 0000000000000001 RSI: 0000000000000001 RDI:
0000000000000004
[5473635.642160] RBP: ffff89f5b095fa88 R08: 00000000ffffffed R09:
0000000000000001
[5473635.642162] R10: 000000000000000b R11: 0045e025810cb2e0 R12:
0000000000000000
[5473635.642163] R13: ffff89f5b095fa88 R14: ffff89f5b095fad8 R15:
ffff89f3d2f60000
[5473635.642165] FS:  00007f9a5c6ce700(0000) GS:ffff89f61ee00000(0000)
knlGS:0000000000000000
[5473635.642167] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[5473635.642168] CR2: 0000000000000000 CR3: 00000003c193f000 CR4:
00000000003406f0
[5473635.642170] Call Trace:
[5473635.642175]  usb_hcd_alloc_bandwidth+0x1e8/0x2d9
[5473635.642179]  usb_set_interface+0x1b4/0x290
[5473635.642187]  uvc_video_stop_streaming+0x2f/0x75 [uvcvideo]
[5473635.642192]  uvc_stop_streaming+0x17/0x43 [uvcvideo]
[5473635.642196]  __vb2_queue_cancel+0x6c/0x2fd [videobuf2_common]
[5473635.642201]  vb2_core_streamoff+0x2b/0x73 [videobuf2_common]
[5473635.642205]  uvc_queue_streamoff+0x25/0x39 [uvcvideo]
[5473635.642209]  uvc_ioctl_streamoff+0x38/0x47 [uvcvideo]
[5473635.642213]  __video_do_ioctl+0x279/0x3c1
[5473635.642219]  ? _raw_spin_unlock_irqrestore+0xd/0xe
[5473635.642222]  ? try_to_wake_up+0x290/0x363
[5473635.642225]  video_usercopy+0x28b/0x46d
[5473635.642227]  ? v4l_g_ctrl+0x11f/0x11f
[5473635.642230]  ? vtime_delta.isra.10+0x9/0x1e
[5473635.642233]  v4l2_ioctl+0x42/0x48
[5473635.642236]  vfs_ioctl+0x19/0x26
[5473635.642238]  do_vfs_ioctl+0x526/0x54e
[5473635.642241]  ? finish_task_switch+0x1d4/0x218
[5473635.642245]  ? timekeeping_get_ns+0x19/0x2c
[5473635.642248]  ? paravirt_sched_clock+0x5/0x8
[5473635.642250]  ksys_ioctl+0x39/0x58
[5473635.642252]  __x64_sys_ioctl+0x11/0x14
[5473635.642255]  do_syscall_64+0x83/0x91
[5473635.642258]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[5473635.642261] RIP: 0033:0x7f9a614a5427
[5473635.642264] Code: 00 00 90 48 8b 05 69 aa 0c 00 64 c7 00 26 00 00 00 48 c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 39 aa 0c 00 f7 d8 64 89 01 48
[5473635.642265] RSP: 002b:00007f9a5c6cd258 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[5473635.642268] RAX: ffffffffffffffda RBX: 00002059db1a35f0 RCX:
00007f9a614a5427
[5473635.642269] RDX: 00007f9a5c6cd2ac RSI: 0000000040045613 RDI:
0000000000000017
[5473635.642270] RBP: 00007f9a5c6cd2f0 R08: 0000000000000000 R09:
00007f9a5c6cd3d8
[5473635.642272] R10: 00007ffeaab6e090 R11: 0000000000000246 R12:
00002059db230158
[5473635.642273] R13: 00002059db230000 R14: 00002059db230000 R15:
00007f9a5c6cd2ac
[5473635.642275] Modules linked in: cfg80211 snd_usb_audio bnep bluetooth
uvcvideo videobuf2_vmalloc videobuf2_memops snd_usbmidi_lib videobuf2_v4l2
snd_rawmidi videobuf2_common [last unloaded: snd_usb_audio]
[5473635.642282] CR2: 0000000000000000
[5473635.642284] ---[ end trace cbc4d60c1db09b1c ]---
[5473635.642287] RIP: 0010:usb_ifnum_to_if+0x21/0x37
[5473635.642289] Code: ff ff 5b 5d 41 5c 41 5d c3 48 8b 87 98 03 00 00 48 85 c0
74 2a 0f b6 78 04 31 d2 39 d7 7e 1d 48 8b 8c d0 98 00 00 00 48 ff c2 <4c> 8b 01
45 0f b6 40 02 41 39 f0 75 e4 48 89 c8 eb 03 31 c0 c3 c3
[5473635.642291] RSP: 0018:ffffa140c109fb98 EFLAGS: 00010202
[5473635.642292] RAX: ffff89f4e64d2c00 RBX: ffff89f60d4b1000 RCX:
0000000000000000
[5473635.642293] RDX: 0000000000000001 RSI: 0000000000000001 RDI:
0000000000000004
[5473635.642295] RBP: ffff89f5b095fa88 R08: 00000000ffffffed R09:
0000000000000001
[5473635.642296] R10: 000000000000000b R11: 0045e025810cb2e0 R12:
0000000000000000
[5473635.642297] R13: ffff89f5b095fa88 R14: ffff89f5b095fad8 R15:
ffff89f3d2f60000
[5473635.642299] FS:  00007f9a5c6ce700(0000) GS:ffff89f61ee00000(0000)
knlGS:0000000000000000
[5473635.642300] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[5473635.642302] CR2: 0000000000000000 CR3: 00000003c193f000 CR4:
00000000003406f0
[5473635.700061] show_signal_msg: 3729 callbacks suppressed
[5473635.700065] chrome[16497]: segfault at 0 ip 000056399a1110f4 sp
00007ffeaaa675c0 error 4 in chrome[563997639000+7349000]
[5473635.700080] Code: 48 89 de 31 d2 4c 89 f1 e8 b9 20 fa ff eb 07 48 8b 1d b0
fd 10 05 48 89 df 5b 41 5e 5d e9 64 2e 00 00 cc cc cc cc 55 48 89 e5 <48> 8b 0f
4c 8b 47 08 4c 89 c0 48 29 c8 74 41 48 c1 f8 03 48 bf ab

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
