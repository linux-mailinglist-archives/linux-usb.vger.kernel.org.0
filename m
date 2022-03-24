Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0F5B4E65E9
	for <lists+linux-usb@lfdr.de>; Thu, 24 Mar 2022 16:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241927AbiCXPTr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Mar 2022 11:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236651AbiCXPTq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Mar 2022 11:19:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55ED5E74D
        for <linux-usb@vger.kernel.org>; Thu, 24 Mar 2022 08:18:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89264617B4
        for <linux-usb@vger.kernel.org>; Thu, 24 Mar 2022 15:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6807C340F3
        for <linux-usb@vger.kernel.org>; Thu, 24 Mar 2022 15:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648135092;
        bh=wFdDi2YbweqP31Kix5fwzIo252s01+Mxo1JuuSPQ4fs=;
        h=From:To:Subject:Date:From;
        b=AoFg1l5t+pLUAWWT9B5HnQddo9NI38C43WxtBKsnEjm9h5VSkMkK4JONtM/Nw5Av4
         SGnzkNjlOar7qDeImoHdsee2HsmtlUjfdC4rl8fsD/LOWMU4LaYj1b3eyjYr1zHlCp
         LZKWTVAuN/5DufXoDp9QgiwTrEZ1Lt+v2vq3hrYi+KZZoZBKKk8d9L4/m9s4khjnQm
         Ew6wuTIIEgUGEEEkbvsX7/HNk/WX+FMgxbd+D2P/afFjFfq7XKCgc/u9CcdpJlVFkP
         0RVdDgb5WBfgHddEJpGLCyv7LQCTWM+qk70OTfNT2vwddyB/79TGOgDcAiLDdd4tWS
         6XwqB4y1TE75g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D3F3FC05FD6; Thu, 24 Mar 2022 15:18:12 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215740] New: kernel warning: DMA-API: xhci_hcd: cacheline
 tracking EEXIST, overlapping mappings aren't supported
Date:   Thu, 24 Mar 2022 15:18:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: travneff@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215740-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

            Bug ID: 215740
           Summary: kernel warning: DMA-API: xhci_hcd: cacheline tracking
                    EEXIST, overlapping mappings aren't supported
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.17
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: travneff@gmail.com
        Regression: No

Created attachment 300612
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300612&action=3Dedit
full dmesg log with the warning

I have this kernel trace often while PC booting:

    DMA-API: xhci_hcd 0000:09:00.3: cacheline tracking EEXIST, overlapping
mappings aren't supported
    WARNING: CPU: 4 PID: 69 at kernel/dma/debug.c:570 add_dma_entry+0x1c7/0=
x250
    Modules linked in: bpf_preload
    CPU: 4 PID: 69 Comm: kworker/4:1 Not tainted 5.17.0 #1
    Hardware name: ASUS System Product Name/TUF GAMING B550M-PLUS, BIOS 2423
08/10/2021
    Workqueue: usb_hub_wq hub_event
    RIP: 0010:add_dma_entry+0x1c7/0x250
    Code: ff 0f 84 97 00 00 00 48 8b 5f 50 48 85 db 75 03 48 8b 1f e8 4b 53=
 80
00 48 89 c6 48 89 da 48 c7 c7 58 b3 84 94 e8 27 21 ca 00 <0f> 0b 48 85 ed 0=
f 85
69 d2 ca 00 8b 05 88 a0 30 02 85 c0 0f 85 f4
    RSP: 0018:ffff9cadc0c9ba88 EFLAGS: 00010292
    RAX: 0000000000000060 RBX: ffff9173d2c49ea0 RCX: 0000000000000000
    RDX: 0000000000000001 RSI: 00000000ffffdfff RDI: 00000000ffffffff
    RBP: ffff9173d11a5e80 R08: 0000000000000000 R09: ffff9cadc0c9b8c0
    R10: ffff9cadc0c9b8b8 R11: ffffffff95165128 R12: 0000000000000000
    R13: 0000000000000001 R14: 0000000000000206 R15: 00000000046882ee
    FS:  0000000000000000(0000) GS:ffff9182a8200000(0000)
knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00007fce5d52a130 CR3: 0000000119b28000 CR4: 0000000000350ee0
    Call Trace:
    <TASK>
    dma_map_page_attrs+0x82/0x250
    ? _raw_spin_unlock_irqrestore+0x30/0x60
    usb_hcd_map_urb_for_dma+0x3eb/0x4f0
    usb_hcd_submit_urb+0x9b/0xb90
    ? lockdep_init_map_type+0x62/0x260
    usb_start_wait_urb+0x55/0x130
    usb_control_msg+0xc9/0x110
    hub_ext_port_status+0x89/0x110
    hub_event+0x1e4/0x1920
    ? lock_acquire+0xe0/0x2d0
    ? lock_is_held_type+0xea/0x140
    process_one_work+0x29b/0x5f0
    worker_thread+0x4f/0x390
    ? process_one_work+0x5f0/0x5f0
    kthread+0xf5/0x120
    ? kthread_complete_and_exit+0x20/0x20
    ret_from_fork+0x22/0x30
    </TASK>

My usb devices:

$ lsusb -t
    /:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 10000M
        |__ Port 4: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M
            |__ Port 4: Dev 3, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M
                |__ Port 2: Dev 4, If 0, Class=3DMass Storage, Driver=3Duas=
, 5000M
                |__ Port 4: Dev 5, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M
                    |__ Port 4: Dev 6, If 0, Class=3DHub, Driver=3Dhub/4p, =
5000M
    /:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 480M
        |__ Port 2: Dev 2, If 3, Class=3DApplication Specific Interface, Dr=
iver=3D,
12M
        |__ Port 2: Dev 2, If 1, Class=3DVendor Specific Class, Driver=3Dbt=
usb, 12M
        |__ Port 2: Dev 2, If 2, Class=3DVendor Specific Class, Driver=3Dbt=
usb, 12M
        |__ Port 2: Dev 2, If 0, Class=3DVendor Specific Class, Driver=3Dbt=
usb, 12M
        |__ Port 4: Dev 3, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
            |__ Port 1: Dev 12, If 0, Class=3DCommunications, Driver=3Dcdc_=
ether,
480M
            |__ Port 1: Dev 12, If 1, Class=3DCDC Data, Driver=3Dcdc_ether,=
 480M
            |__ Port 4: Dev 4, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
                |__ Port 4: Dev 5, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
                    |__ Port 3: Dev 6, If 1, Class=3DHuman Interface Device,
Driver=3Dusbhid, 1.5M
                    |__ Port 3: Dev 6, If 0, Class=3DHuman Interface Device,
Driver=3Dusbhid, 1.5M
                    |__ Port 4: Dev 7, If 0, Class=3DHub, Driver=3Dhub/4p, =
480M
                        |__ Port 2: Dev 8, If 0, Class=3DHuman Interface De=
vice,
Driver=3Dusbfs, 1.5M
                        |__ Port 3: Dev 9, If 0, Class=3DVendor Specific Cl=
ass,
Driver=3D, 480M
                        |__ Port 4: Dev 10, If 0, Class=3DImaging, Driver=
=3D, 480M
    /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 10000M
    /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/10p, 480M
        |__ Port 6: Dev 2, If 2, Class=3DHuman Interface Device, Driver=3Du=
sbhid,
12M
        |__ Port 6: Dev 2, If 0, Class=3DVendor Specific Class, Driver=3D, =
12M
        |__ Port 7: Dev 3, If 0, Class=3DHub, Driver=3Dhub/4p, 480M

$ lsusb
    Bus 004 Device 006: ID 2109:0812 VIA Labs, Inc. VL812 Hub
    Bus 004 Device 005: ID 2109:0812 VIA Labs, Inc. VL812 Hub
    Bus 004 Device 004: ID 0578:0578 Intrinsix Corp. KingSpec
    Bus 004 Device 003: ID 2109:0812 VIA Labs, Inc. VL812 Hub
    Bus 004 Device 002: ID 2109:0812 VIA Labs, Inc. VL812 Hub
    Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
    Bus 003 Device 010: ID 1004:633e LG Electronics, Inc. LM-X420xxx/G2/G3
Android Phone (MTP/download mode)
    Bus 003 Device 009: ID 0bda:8812 Realtek Semiconductor Corp. RTL8812AU
802.11a/b/g/n/ac 2T2R DB WLAN Adapter
    Bus 003 Device 008: ID 0463:ffff MGE UPS Systems UPS
    Bus 003 Device 007: ID 2109:2812 VIA Labs, Inc. VL812 Hub
    Bus 003 Device 006: ID 046d:c30e Logitech, Inc. UltraX Keyboard (Y-BL49)
    Bus 003 Device 005: ID 2109:2812 VIA Labs, Inc. VL812 Hub
    Bus 003 Device 004: ID 2109:2812 VIA Labs, Inc. VL812 Hub
    Bus 003 Device 012: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB
Ethernet/RNDIS Gadget
    Bus 003 Device 003: ID 2109:2812 VIA Labs, Inc. VL812 Hub
    Bus 003 Device 002: ID 0b05:17cb ASUSTek Computer, Inc. Broadcom BCM207=
02A0
Bluetooth
    Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
    Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
    Bus 001 Device 003: ID 05e3:0610 Genesys Logic, Inc. Hub
    Bus 001 Device 002: ID 0b05:1939 ASUSTek Computer, Inc. AURA LED Contro=
ller
    Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Kernel is built from
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
at v5.17 tag (f443e374ae131c168a065ea1748feac6b2e76613)

Also reproduces for my distro kernel:
https://bugzilla.redhat.com/show_bug.cgi?id=3D2021242

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
