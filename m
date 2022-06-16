Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8672554DFE6
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jun 2022 13:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376754AbiFPLUd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 07:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376720AbiFPLUc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 07:20:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41515E748
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 04:20:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 66BC9B8235A
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 11:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 074BFC34114
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 11:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655378429;
        bh=GQcookd3d4LnF4IPU7o1xr7jM3Xxd59x/Yu7+2KOA10=;
        h=From:To:Subject:Date:From;
        b=bi1KPphp51GVbWgDLo0mPagioy6msRHW3l2xarCnq3Qkd4oD2nrGK7+nlXFi5jc0A
         vseCpcFLNuPUl3ErhEh7LufQWtbOlJcJgcNSoQdZvP7m0uuzDWe1JypI5MHebDRI8F
         Q4lq7YlE+6kMtA3MdplDvWC+WPPKesc61fpMiZbCPHtCS1441chxLmBLFFamznf1ZV
         wgvVTMzjk6J+hGnV315RN4TckgGt60iARFh+YeISH0M0UvxjhhSjaoCsib2n9LRp5S
         dJKpEenyGfrQRQ5c8wrKjPrUt26okkGYuvvm58iWg9IU2UCVdUs6pTYHZLPU/jJMrN
         toyUk0l5aBRPA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E737ECBF854; Thu, 16 Jun 2022 11:20:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216140] New: rtsx_usb causes error: xhci_hcd rejecting DMA map
 of vmalloc memory
Date:   Thu, 16 Jun 2022 11:20:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: buboleck@abv.bg
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216140-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216140

            Bug ID: 216140
           Summary: rtsx_usb causes error: xhci_hcd rejecting DMA map of
                    vmalloc memory
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18, 5.18.1, 5.18.2, 5.18.3, 5.18.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: buboleck@abv.bg
        Regression: No

This is present with all 5.18 kernels I tried, 5.17.x kernels are fine, lik=
ely
related to https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

[Thu Jun 16 13:24:58 2022] Modules linked in: rtsx_usb(+) sparse_keymap
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel ahci(+) snd_pcm libahci
aesni_intel platform_profile hid_generic(+) crypto_simd usbkbd usbmouse
input_leds snd_timer k10temp cryptd led_class usbhid pkcs8_key_parser snd c=
cp
rfkill cec wmi_bmof soundcore i2c_amd_mp2_pci libata rapl serio_raw efi_pst=
ore
hwmon sp5100_tco i2c_hid_acpi wmi i2c_hid video
[Thu Jun 16 13:24:58 2022] CPU: 4 PID: 803 Comm: systemd-udevd Not tainted
5.18.4-gentoo #2
[Thu Jun 16 13:24:58 2022] Hardware name: ASUSTeK COMPUTER INC.
VivoBook_ASUSLaptop X509DA_M509DA/X509DA, BIOS X509DA.309 10/08/2021
[Thu Jun 16 13:24:58 2022] RIP: 0010:usb_hcd_map_urb_for_dma+0x48d/0x4b0
[Thu Jun 16 13:24:58 2022] Code: 50 c6 05 22 a6 ea 00 01 4d 85 f6 75 03 4d =
8b
32 4c 89 d7 e8 a5 29 f4 ff 4c 89 f2 48 c7 c7 e8 9f b7 94 48 89 c6 e8 13 1b =
21
00 <0f> 0b e9 52 ff ff ff 48 8b 05 25 26 cb 00 e9 d3 fc ff ff 48 8b 05
[Thu Jun 16 13:24:58 2022] RSP: 0018:ffffa6fd898a77c8 EFLAGS: 00010282
[Thu Jun 16 13:24:58 2022] RAX: 0000000000000000 RBX: 000000000000000c RCX:
0000000000000003
[Thu Jun 16 13:24:58 2022] RDX: 0000000000000000 RSI: ffffa6fd898a75c0 RDI:
0000000000000001
[Thu Jun 16 13:24:58 2022] RBP: ffffa6fd898a7800 R08: 0000000000000000 R09:
ffffffff94e468c0
[Thu Jun 16 13:24:58 2022] R10: 0000000000000001 R11: 0000000000000001 R12:
ffff9657cee1fe40
[Thu Jun 16 13:24:58 2022] R13: ffff9657c0aaa000 R14: ffff9657c0f1ed70 R15:
0000000000000001
[Thu Jun 16 13:24:58 2022] FS:  00007f70f0fff7c0(0000)
GS:ffff965bccf00000(0000) knlGS:0000000000000000
[Thu Jun 16 13:24:58 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Thu Jun 16 13:24:58 2022] CR2: 00007f70f12fab0f CR3: 0000000109570000 CR4:
00000000003506e0
[Thu Jun 16 13:24:58 2022] Call Trace:
[Thu Jun 16 13:24:58 2022]  <TASK>
[Thu Jun 16 13:24:58 2022]  xhci_map_urb_for_dma+0x14c/0x2a0
[Thu Jun 16 13:24:58 2022]  usb_hcd_submit_urb+0x9f/0xc70
[Thu Jun 16 13:24:58 2022]  ? del_timer_sync+0x70/0xb0
[Thu Jun 16 13:24:58 2022]  ? schedule_timeout+0x93/0x150
[Thu Jun 16 13:24:58 2022]  ? __bpf_trace_tick_stop+0x20/0x20
[Thu Jun 16 13:24:58 2022]  usb_submit_urb+0x256/0x6a0
[Thu Jun 16 13:24:58 2022]  ? kfree+0xd2/0x2f0
[Thu Jun 16 13:24:58 2022]  usb_start_wait_urb+0x71/0x180
[Thu Jun 16 13:24:58 2022]  usb_bulk_msg+0xbf/0x180
[Thu Jun 16 13:24:58 2022]  rtsx_usb_send_cmd+0x69/0xc0 [rtsx_usb]
[Thu Jun 16 13:24:58 2022]  rtsx_usb_probe+0x149/0x3c0 [rtsx_usb]
[Thu Jun 16 13:24:58 2022]  usb_probe_interface+0xef/0x2a0
[Thu Jun 16 13:24:58 2022]  really_probe+0x1a4/0x380
[Thu Jun 16 13:24:58 2022]  __driver_probe_device+0x10a/0x180
[Thu Jun 16 13:24:58 2022]  driver_probe_device+0x23/0x90
[Thu Jun 16 13:24:58 2022]  __driver_attach+0xb0/0x1b0
[Thu Jun 16 13:24:58 2022]  ? __device_attach_driver+0xe0/0xe0
[Thu Jun 16 13:24:58 2022]  bus_for_each_dev+0x83/0xd0
[Thu Jun 16 13:24:58 2022]  driver_attach+0x22/0x30
[Thu Jun 16 13:24:58 2022]  bus_add_driver+0x166/0x200
[Thu Jun 16 13:24:58 2022]  driver_register+0x99/0xf0
[Thu Jun 16 13:24:58 2022]  usb_register_driver+0x8d/0x130
[Thu Jun 16 13:24:58 2022]  ? 0xffffffffc0113000
[Thu Jun 16 13:24:58 2022]  rtsx_usb_driver_init+0x27/0x1000 [rtsx_usb]
[Thu Jun 16 13:24:58 2022]  do_one_initcall+0x4d/0x200
[Thu Jun 16 13:24:58 2022]  ? kmem_cache_alloc_trace+0x187/0x2e0
[Thu Jun 16 13:24:58 2022]  do_init_module+0x52/0x260
[Thu Jun 16 13:24:58 2022]  load_module+0x235e/0x2550
[Thu Jun 16 13:24:58 2022]  ? 0xffffffffc0113000
[Thu Jun 16 13:24:58 2022]  __do_sys_finit_module+0xcb/0x140
[Thu Jun 16 13:24:58 2022]  ? __do_sys_finit_module+0xcb/0x140
[Thu Jun 16 13:24:58 2022]  __x64_sys_finit_module+0x1c/0x20
[Thu Jun 16 13:24:58 2022]  do_syscall_64+0x3a/0x90
[Thu Jun 16 13:24:58 2022]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[Thu Jun 16 13:24:58 2022] RIP: 0033:0x7f70f114cdb9
[Thu Jun 16 13:24:58 2022] Code: 08 44 89 e0 5b 41 5c c3 66 0f 1f 84 00 00 =
00
00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 =
0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 37 e0 0e 00 f7 d8 64 89 01 48
[Thu Jun 16 13:24:58 2022] RSP: 002b:00007ffe0e4f8c38 EFLAGS: 00000202
ORIG_RAX: 0000000000000139
[Thu Jun 16 13:24:58 2022] RAX: ffffffffffffffda RBX: 00005594ea8e0eb0 RCX:
00007f70f114cdb9
[Thu Jun 16 13:24:58 2022] RDX: 0000000000000000 RSI: 00007f70f12c6b7d RDI:
0000000000000005
[Thu Jun 16 13:24:58 2022] RBP: 0000000000020000 R08: 0000000000000000 R09:
00005594ea859320
[Thu Jun 16 13:24:58 2022] R10: 0000000000000005 R11: 0000000000000202 R12:
00007f70f12c6b7d
[Thu Jun 16 13:24:58 2022] R13: 0000000000000000 R14: 00005594ea83bf80 R15:
00005594ea8e0eb0
[Thu Jun 16 13:24:58 2022]  </TASK>
[Thu Jun 16 13:24:58 2022] ---[ end trace 0000000000000000 ]---
[Thu Jun 16 13:24:58 2022] rtsx_usb: probe of 3-1:1.0 failed with error -11
[Thu Jun 16 13:24:58 2022] usbcore: registered new interface driver rtsx_usb

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
