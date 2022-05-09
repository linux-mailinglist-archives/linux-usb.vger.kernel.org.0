Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCE5751F227
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 03:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbiEIB3R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 May 2022 21:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235820AbiEIAyJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 May 2022 20:54:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC8165CA
        for <linux-usb@vger.kernel.org>; Sun,  8 May 2022 17:50:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA77A60F18
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 00:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 252BBC385A4
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 00:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652057416;
        bh=xEmQGqefMHlEIT9LfgB8RZ2fP2ScRiBSOWsrHX6zU6U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FoxJqcVUXkNzlEf7vNfAo8fSi8ejg4mSWj6KZatGbY/z00qhRnEB/AAZGlLc1ZgYQ
         Q8D5diTHAiqdlduvzEmQldacA0dzq6Mg2tK3k3XeTLtT3g+Oyb0jXu7nNLfd5wKgh0
         49GDU77AaXexhaxrzDSaXBqu2EIboGazISBVUMUMX0iu0b4rKy3FE2G0aFZF9y6Q16
         JM6ImDfOkouaulwAbnTc+9rV+cr82QJFlxNAGhRy5SgL+Op1M8JbzVTueTmlMPECr0
         7RC9329NZ8Qy9eorEMFVyhUGi1DjcADdMu6dUHMwBNFjLYky0n5/unQjxlfSAHEsj4
         erGsGDnhBJlRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 08E4FC05F98; Mon,  9 May 2022 00:50:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Mon, 09 May 2022 00:50:15 +0000
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
Message-ID: <bug-215890-208809-tpTkptwWXM@https.bugzilla.kernel.org/>
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

--- Comment #3 from Satadru Pramanik (satadru@umich.edu) ---
the same issue exists with 5.18-rc6.



[    6.585246] ------------[ cut here ]------------
[    6.585248] xhci_hcd 0000:00:14.0: rejecting DMA map of vmalloc memory
[    6.585260] WARNING: CPU: 2 PID: 944 at include/linux/dma-mapping.h:326
usb_hcd_map_urb_for_dma+0x4c4/0x4f0
[    6.585266] Modules linked in: applesmc(+) intel_rapl_common
x86_pkg_temp_thermal intel_powerclamp kvm_intel kvm rapl snd_hda_codec_cirr=
us
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel btusb
snd_intel_dspcfg snd_intel_sdw_acpi btrtl sch_fq_codel snd_hda_codec btbcm
intel_cstate btintel snd_hda_core btmtk snd_seq_midi snd_hwdep
snd_seq_midi_event snd_pcm wl(POE) cmdlinepart bluetooth snd_rawmidi snd_seq
snd_seq_device spi_nor snd_timer ecdh_generic ecc efi_pstore joydev snd mtd
mei_me input_leds bcm5974 cfg80211 apple_mfi_fastcharge mei soundcore sbs(+)
acpi_als industrialio_triggered_buffer sbshc kfifo_buf industrialio apple_g=
mux
mac_hid apple_bl facetimehd(OE) videobuf2_dma_sg videobuf2_memops
videobuf2_v4l2 videobuf2_common videodev mc coretemp ipmi_devintf
ipmi_msghandler msr parport_pc ppdev lp parport ip_tables x_tables autofs4
zfs(POE) zunicode(POE) zzstd(OE) zlua(OE) zavl(POE) icp(POE) zcommon(POE)
znvpair(POE) spl(OE) z3fold lz4 lz4_compress
[    6.585333]  hid_logitech_hidpp hid_apple hid_logitech_dj hid_generic us=
bhid
hid uas i915 usb_storage nouveau mxm_wmi wmi drm_buddy i2c_algo_bit
drm_ttm_helper ttm drm_dp_helper cec rc_core drm_kms_helper syscopyarea
sysfillrect spi_intel_platform sysimgblt crct10dif_pclmul crc32_pclmul
fb_sys_fops ghash_clmulni_intel aesni_intel spi_intel nvme crypto_simd i2c_=
i801
cryptd drm nvme_core i2c_smbus thunderbolt lpc_ich xhci_pci xhci_pci_renesas
video
[    6.585365] CPU: 2 PID: 944 Comm: systemd-udevd Tainted: P           OE=
=20=20=20=20
5.18.0-051800rc6-generic #202205082130
[    6.585367] Hardware name: Apple Inc. MacBookPro11,3/Mac-2BD1B31983FE166=
3,
BIOS 432.60.3.0.0 10/27/2021
[    6.585369] RIP: 0010:usb_hcd_map_urb_for_dma+0x4c4/0x4f0
[    6.585372] Code: 50 c6 05 19 8e 89 01 01 4d 85 f6 75 03 4d 8b 32 4c 89 =
d7
e8 ae 36 ef ff 4c 89 f2 48 c7 c7 38 00 05 a2 48 89 c6 e8 d2 94 37 00 <0f> 0=
b e9
58 ff ff ff 48 8b 05 ce 56 49 01 e9 ad fe ff ff 48 8b 05
[    6.585374] RSP: 0018:ffffaa6e8c883a28 EFLAGS: 00010282
[    6.585377] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000027
[    6.585378] RDX: ffff9443ef2a05a8 RSI: 0000000000000001 RDI:
ffff9443ef2a05a0
[    6.585380] RBP: ffffaa6e8c883a60 R08: 0000000000000000 R09:
00000000a2fe3bc8
[    6.585381] R10: ffffffffffffffff R11: 0000000000000001 R12:
ffff944085dc30c0
[    6.585382] R13: ffff944080d90000 R14: ffff944081566bd0 R15:
00000000000001de
[    6.585384] FS:  00007fc26cbd88c0(0000) GS:ffff9443ef280000(0000)
knlGS:0000000000000000
[    6.585386] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.585388] CR2: 00005561b2f6f2f8 CR3: 000000010643a006 CR4:
00000000001706e0
[    6.585390] Call Trace:
[    6.585391]  <TASK>
[    6.585394]  xhci_map_urb_for_dma+0x149/0x170
[    6.585399]  usb_hcd_submit_urb+0x81/0x300
[    6.585402]  usb_submit_urb+0x254/0x6d0
[    6.585406]  bcm5974_start_traffic+0x4c/0xa0 [bcm5974]
[    6.585410]  bcm5974_open+0x45/0x90 [bcm5974]
[    6.585413]  input_open_device+0x8d/0xe0
[    6.585418]  evdev_open+0x1cc/0x200
[    6.585421]  chrdev_open+0xc4/0x240
[    6.585425]  ? cdev_device_add+0x90/0x90
[    6.585428]  do_dentry_open+0x157/0x380
[    6.585432]  vfs_open+0x2d/0x30
[    6.585434]  do_open+0x207/0x460
[    6.585437]  ? path_init+0x2c2/0x3f0
[    6.585439]  path_openat+0x10f/0x2b0
[    6.585442]  do_filp_open+0xb2/0x160
[    6.585445]  ? __check_object_size+0x1a/0x20
[    6.585448]  ? alloc_fd+0xb9/0x170
[    6.585452]  do_sys_openat2+0x9c/0x160
[    6.585455]  __x64_sys_openat+0x55/0x90
[    6.585458]  do_syscall_64+0x59/0x80
[    6.585462]  ? irqentry_exit_to_user_mode+0x9/0x20
[    6.585465]  ? irqentry_exit+0x35/0x40
[    6.585467]  ? exc_page_fault+0x87/0x180
[    6.585470]  ? asm_exc_page_fault+0x8/0x30
[    6.585472]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[    6.585475] RIP: 0033:0x7fc26d36a6eb
[    6.585477] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 8b 04 25 18 00 =
00
00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3=
d 00
f0 ff ff 0f 87 91 00 00 00 48 8b 54 24 28 64 48 2b 14 25
[    6.585479] RSP: 002b:00007ffc55bb8980 EFLAGS: 00000246 ORIG_RAX:
0000000000000101
[    6.585481] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007fc26d36a6eb
[    6.585482] RDX: 0000000000080902 RSI: 00005561b4d8f8f0 RDI:
00000000ffffff9c
[    6.585484] RBP: 00005561b4d8f8f0 R08: 0000000000000000 R09:
0000000000000000
[    6.585485] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000080902
[    6.585486] R13: 00007ffc55bb8a20 R14: 00005561b4d9f2a0 R15:
00005561b4d9f2aa
[    6.585489]  </TASK>
[    6.585490] ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
