Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9EE4587BF
	for <lists+linux-usb@lfdr.de>; Mon, 22 Nov 2021 02:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhKVBb0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Nov 2021 20:31:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:56842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229594AbhKVBbY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 21 Nov 2021 20:31:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 14E6960C51
        for <linux-usb@vger.kernel.org>; Mon, 22 Nov 2021 01:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637544499;
        bh=AmeHeQ4116ou9F6fCrowBBiMUF1fPSdM1adnM+wSynU=;
        h=From:To:Subject:Date:From;
        b=go7H6n6F/oOoQY4JzmNGtN2BOT3FgMvmwSAItiuwg6MhjOvFP1HTPUgiy8qlYlX+b
         HyZsYRoGl3o7j9ynrVUWscH6Dw6W+pgspMdtPbPTY2PGekOKX7IguccUrJhCI8R27b
         ul25861Nr4TXUk126JvdOLULQIPar2y2OYNFecMJ3M4or8ZeD3gwKovcds3HjO6THK
         YjxepajKS+9zTJ+Amd9hdCkADCcWiZgafnO5gg0mUYwj2RafxWL6MavaXmGcWGWdXc
         vUv9WkzoYN5QSRoit9kgUkF0zmx6yhRikRt7fQMs15gd2sTWnnWmr5s19HC1sX6iv5
         cfsEbtEP5vjIw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 001D460EE5; Mon, 22 Nov 2021 01:28:18 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215095] New: USB ehci error -110 and soft lockup on kernel
 5.15.4 as kvm guest
Date:   Mon, 22 Nov 2021 01:28:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wangyugui@e16-tech.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215095-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215095

            Bug ID: 215095
           Summary: USB ehci error -110 and soft lockup on kernel 5.15.4
                    as kvm guest
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.4
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: wangyugui@e16-tech.com
        Regression: No

USB ehci error -110 and soft lockup on kernel 5.15.4/5.15.3 as kvm guest.

It happen when host kernel 5.15.4/5.15.3, but not happen when host kernel
5.10.76.

OS/KVM: RHEL 7.9 / qemu-kvm-1.5.3-175.el7_9.4.x86_64

[    1.009986] usb 1-1: new high-speed USB device number 2 using ehci-pci
...
[    2.696524] cdrom: Uniform CD-ROM driver Revision: 3.20
[   17.880021] usb 1-1: device not accepting address 2, error -110
[   17.995018] usb 1-1: new high-speed USB device number 3 using ehci-pci
[   34.776032] usb 1-1: device not accepting address 3, error -110
[   34.777331] usb usb1-port1: attempt power cycle
[   34.956027] usb 1-1: new high-speed USB device number 4 using ehci-pci
[   46.040013] usb 1-1: device not accepting address 4, error -110
[   46.154997] usb 1-1: new high-speed USB device number 5 using ehci-pci
[   57.304016] usb 1-1: device not accepting address 5, error -110
[   57.306286] usb usb1-port1: unable to enumerate USB device
[  OK  ] Started udev Wait for Complete Device Initialization.
         Starting Device-Mapper Multipath Device Controller...
[  OK  ] Started dracut initqueue hook.
[  OK  ] Reached target Remote File Systems (Pre).
[  OK  ] Reached target Remote File Systems.
         Starting dracut pre-mount hook...
[  OK  ] Started Device-Mapper Multipath Device Controller.
[  OK  ] Reached target Local File Systems (Pre).
[  OK  ] Reached target Local File Systems.
         Starting Create Volatile Files and Directories...
[  OK  ] Started Create Volatile Files and Directories.
[  OK  ] Reached target System Initialization.
[  OK  ] Reached target Basic System.
[  OK  ] Started dracut pre-mount hook.
         Starting File System Check on /dev/disk/by-label/OS_USB...
[  OK  ] Started File System Check on /dev/disk/by-label/OS_USB.
         Mounting /sysroot...
[   57.388906] BTRFS info (device vda1): flagging fs with big metadata feat=
ure
[   57.389868] BTRFS info (device vda1): enabling tiering(tier=3Dauto)
[   57.390720] BTRFS info (device vda1): has skinny extents
[   57.391494] BTRFS info (device vda1): disk space caching is enabled
[*     ] A start job is running for /sysroot (1min 22s / 2min 25s)[=20=20
84.295876] watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [kworker/0:1:7]
[   84.296909] Modules linked in: sr_mod cdrom sg ata_generic btrfs xor
raid6_pq zstd_compress cirrus zstd_decompress drm_kms_helper nvme_tcp
syscopyarea sysfillrect sysimgblt nvme_fabrics fb_sys_fops cec nvme ata_piix
nvme_core crct10dif_pclmul crc32_pclmul t10_pi crc32c_intel drm libata
virtio_net ghash_clmulni_intel virtio_console net_failover serio_raw virtio=
_blk
failover floppy dm_multipath sunrpc dm_mirror dm_region_hash dm_log dm_mod
i2c_dev
[   84.300771] CPU: 0 PID: 7 Comm: kworker/0:1 Not tainted 5.15.4-1.el7.x86=
_64
#1
[   84.301502] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[   84.302153] Workqueue: pm pm_runtime_work
[   84.302689] RIP: 0010:__synchronize_hardirq+0x7d/0xb0
[   84.303291] Code: 00 0f 95 44 24 07 75 17 40 84 ed 74 12 48 8d 54 24 07 =
be
01 00 00 00 4c 89 e7 e8 4e ff ff ff 4c 89 f6 48 89 df e8 d3 d4 92 00 <80> 7=
c 24
07 00 75 ad 48 8b 44 24 08 65 48 33 04 25 28 00 00 00 75
[   84.305017] RSP: 0018:ffffb3ee80047b88 EFLAGS: 00000206
[   84.305623] RAX: 0000000000000001 RBX: ffff95ec0012e6a4 RCX:
0000000000000000
[   84.306362] RDX: 0200000000000000 RSI: 0000000000000246 RDI:
ffff95ec0012e6a4
[   84.307096] RBP: 0000000000000001 R08: ffff95ec00400510 R09:
ffff95ec00400490
[   84.307813] R10: 0000000000000000 R11: ffffffffb5e66a28 R12:
ffff95ec0012e628
[   84.308541] R13: ffff95ec0012e600 R14: 0000000000000246 R15:
0000000000000000
[   84.309264] FS:  0000000000000000(0000) GS:ffff95f31f800000(0000)
knlGS:0000000000000000
[   84.310052] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   84.310693] CR2: 00007f44e8271000 CR3: 000000024e410002 CR4:
00000000007706f0
[   84.311408] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   84.312132] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[   84.312875] PKRU: 55555554
[   84.313347] Call Trace:
[   84.313804]  <TASK>
[   84.314234]  synchronize_irq+0x35/0xa0
[   84.314766]  ? preempt_schedule_common+0xa/0x20
[   84.315350]  ? __cond_resched+0x1d/0x30
[   84.315852]  ? usb_kill_urb+0x4c/0xc0
[   84.316357]  ehci_halt+0x66/0xe0
[   84.316826]  ehci_bus_suspend+0x235/0x480
[   84.317345]  hcd_bus_suspend+0x77/0x240
[   84.317849]  usb_generic_driver_suspend+0x3d/0x40
[   84.318405]  usb_suspend_both+0x199/0x230
[   84.318920]  ? usb_probe_interface+0x280/0x280
[   84.319462]  usb_runtime_suspend+0x2a/0x70
[   84.319984]  __rpm_callback+0x44/0x110
[   84.320479]  rpm_callback+0x59/0x60
[   84.320965]  ? usb_probe_interface+0x280/0x280
[   84.321532]  rpm_suspend.part.11+0x10d/0x590
[   84.322111]  ? rpm_idle+0x2f3/0x320
[   84.322607]  __pm_runtime_suspend+0x55/0x170
[   84.323154]  ? usb_runtime_resume+0x20/0x20
[   84.323689]  usb_runtime_idle+0x2d/0x40
[   84.324211]  __rpm_callback+0x44/0x110
[   84.324720]  rpm_idle+0x23a/0x320
[   84.325208]  pm_runtime_work+0x7a/0x190
[   84.325710]  process_one_work+0x1cb/0x370
[   84.326203]  worker_thread+0x30/0x380
[   84.326653]  ? process_one_work+0x370/0x370
[   84.327132]  kthread+0x118/0x140
[   84.327544]  ? set_kthread_struct+0x40/0x40
[   84.328010]  ret_from_fork+0x1f/0x30
[   84.328437]  </TASK>
[***   ] A start job is running for /sysroot (1min 37s / 2min 25s)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
