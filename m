Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3C1A51716C
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 16:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385475AbiEBOXE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 10:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385338AbiEBOXC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 10:23:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAFA8C1C
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 07:19:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8086460F10
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 14:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E142BC385A4
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651501172;
        bh=6Cer2/+9OnHYrPzV98P6sMHZSHPPDVF9Zr95VOJAAD4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VeKO0/t8x7bW/cJb5REhLoevJAv8ABVOlNLBbAHlNf+ogE1YKBxf/CeY9nfj1a+4U
         CLOcmZzz337aSD/iS/2V1wZPs5x3HFKfOZADCugTehEtnjoDa+5QBHKWOxGrEzV8TP
         yeslux4Jo7HJvt4LXwdZnC2meEWPQfLIDFdNMyfJPzVNEoOWjP/Zn0YhvN6x0srVJj
         +N8eMAEe1d4l7rfK0/RvXJhsxwOKaYGX5QJVDDPPwpBctIOfINnfZ4rNmFcun9wgiJ
         5r9sO+F7lucKCI7Qt8tr+uBxGY20hkO7KrQYr3qtk+s6rzh48qrKvyNwBiY19dY1TD
         OVVVai//jpXDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C4D45C05F98; Mon,  2 May 2022 14:19:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Mon, 02 May 2022 14:19:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-BLXIeA5HLl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #1 from Satadru Pramanik (satadru@umich.edu) ---
Here is the same issue on 5.18-rc5:

[    6.809261] ------------[ cut here ]------------
[    6.809263] xhci_hcd 0000:00:14.0: rejecting DMA map of vmalloc memory
[    6.809276] WARNING: CPU: 4 PID: 964 at include/linux/dma-mapping.h:326
usb_hcd_map_urb_for_dma+0x4c4/0x4f0
[    6.809282] Modules linked in: btrtl mei_hdcp(+) snd_seq_midi joydev
snd_seq_midi_event mei_pxp(+) snd_rawmidi kvm_intel(+) btbcm btintel snd_seq
btmtk wl(POE+) snd_seq_device bluetooth kvm cmdlinepart input_leds ecdh_gen=
eric
snd_timer rapl mei_me bcm5974 spi_nor applesmc ecc intel_cstate efi_pstore(=
+)
apple_mfi_fastcharge cfg80211 mtd snd mei soundcore acpi_als sbs(+)
industrialio_triggered_buffer kfifo_buf sbshc industrialio apple_gmux mac_h=
id
apple_bl facetimehd(OE) videobuf2_dma_sg videobuf2_memops videobuf2_v4l2
videobuf2_common videodev mc coretemp ipmi_devintf ipmi_msghandler msr
parport_pc ppdev lp parport ip_tables x_tables autofs4 zfs(POE) zunicode(PO=
E)
zzstd(OE) zlua(OE) zavl(POE) icp(POE) zcommon(POE) znvpair(POE) spl(OE) z3f=
old
lz4 lz4_compress hid_apple hid_generic usbhid hid i915 nouveau mxm_wmi wmi
drm_buddy i2c_algo_bit drm_ttm_helper ttm drm_dp_helper cec rc_core
drm_kms_helper uas syscopyarea usb_storage sysfillrect crct10dif_pclmul
crc32_pclmul ghash_clmulni_intel
[    6.809350]  sysimgblt fb_sys_fops aesni_intel spi_intel_platform nvme
spi_intel crypto_simd i2c_i801 cryptd nvme_core drm thunderbolt i2c_smbus
lpc_ich xhci_pci xhci_pci_renesas video
[    6.809362] CPU: 4 PID: 964 Comm: systemd-udevd Tainted: P           OE=
=20=20=20=20
5.18.0-051800rc5-generic #202205011831
[    6.809365] Hardware name: Apple Inc. MacBookPro11,3/Mac-2BD1B31983FE166=
3,
BIOS 432.60.3.0.0 10/27/2021
[    6.809366] RIP: 0010:usb_hcd_map_urb_for_dma+0x4c4/0x4f0
[    6.809369] Code: 50 c6 05 e9 91 89 01 01 4d 85 f6 75 03 4d 8b 32 4c 89 =
d7
e8 ae 36 ef ff 4c 89 f2 48 c7 c7 f8 ff 64 b9 48 89 c6 e8 62 98 37 00 <0f> 0=
b e9
58 ff ff ff 48 8b 05 5e 5a 49 01 e9 ad fe ff ff 48 8b 05
[    6.809371] RSP: 0018:ffffb7d94cd6b9c8 EFLAGS: 00010282
[    6.809373] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000027
[    6.809375] RDX: ffff90a2af3205a8 RSI: 0000000000000001 RDI:
ffff90a2af3205a0
[    6.809376] RBP: ffffb7d94cd6ba00 R08: 0000000000000000 R09:
00000000ba5e2bb8
[    6.809378] R10: ffffffffffffffff R11: 0000000000000001 R12:
ffff909f45045240
[    6.809379] R13: ffff909f41156000 R14: ffff909f41565820 R15:
00000000000001de
[    6.809381] FS:  00007f67314bf8c0(0000) GS:ffff90a2af300000(0000)
knlGS:0000000000000000
[    6.809383] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.809384] CR2: 000056081d685260 CR3: 000000010506e003 CR4:
00000000001706e0
[    6.809386] Call Trace:
[    6.809388]  <TASK>
[    6.809390]  xhci_map_urb_for_dma+0x149/0x170
[    6.809396]  usb_hcd_submit_urb+0x81/0x300
[    6.809398]  usb_submit_urb+0x254/0x6d0
[    6.809402]  bcm5974_start_traffic+0x4c/0xa0 [bcm5974]
[    6.809406]  bcm5974_open+0x45/0x90 [bcm5974]
[    6.809409]  input_open_device+0x8d/0xe0
[    6.809413]  evdev_open+0x1cc/0x200
[    6.809417]  chrdev_open+0xc4/0x240
[    6.809421]  ? cdev_device_add+0x90/0x90
[    6.809423]  do_dentry_open+0x157/0x380
[    6.809427]  vfs_open+0x2d/0x30
[    6.809429]  do_open+0x207/0x460
[    6.809432]  ? path_init+0x2c2/0x3f0
[    6.809434]  path_openat+0x10f/0x2b0
[    6.809436]  ? filemap_map_pages+0x2ba/0x530
[    6.809439]  do_filp_open+0xb2/0x160
[    6.809442]  ? __check_object_size+0x1a/0x20
[    6.809445]  ? alloc_fd+0xb9/0x170
[    6.809449]  do_sys_openat2+0x9c/0x160
[    6.809452]  __x64_sys_openat+0x55/0x90
[    6.809454]  do_syscall_64+0x59/0x80
[    6.809458]  ? do_user_addr_fault+0x1dc/0x670
[    6.809461]  ? exit_to_user_mode_prepare+0x37/0xb0
[    6.809465]  ? irqentry_exit_to_user_mode+0x9/0x20
[    6.809467]  ? irqentry_exit+0x35/0x40
[    6.809469]  ? exc_page_fault+0x87/0x180
[    6.809471]  ? asm_exc_page_fault+0x8/0x30
[    6.809473]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[    6.809475] RIP: 0033:0x7f6731c516eb
[    6.809476] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 8b 04 25 18 00 =
00
00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3=
d 00
f0 ff ff 0f 87 91 00 00 00 48 8b 54 24 28 64 48 2b 14 25
[    6.809477] RSP: 002b:00007ffc2f15b910 EFLAGS: 00000246 ORIG_RAX:
0000000000000101
[    6.809479] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007f6731c516eb
[    6.809480] RDX: 0000000000080902 RSI: 000056081d7a7810 RDI:
00000000ffffff9c
[    6.809480] RBP: 000056081d7a7810 R08: 0000000000000000 R09:
0000000000000000
[    6.809481] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000080902
[    6.809482] R13: 00007ffc2f15b9b0 R14: 000056081d7a73c0 R15:
000056081d7a73ca
[    6.809484]  </TASK>
[    6.809484] ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
