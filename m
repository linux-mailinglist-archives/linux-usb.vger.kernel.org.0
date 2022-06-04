Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B684B53D73A
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jun 2022 16:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236640AbiFDO3t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jun 2022 10:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbiFDO3t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jun 2022 10:29:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9B8E0BB
        for <linux-usb@vger.kernel.org>; Sat,  4 Jun 2022 07:29:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A305F60C3A
        for <linux-usb@vger.kernel.org>; Sat,  4 Jun 2022 14:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FF94C385B8
        for <linux-usb@vger.kernel.org>; Sat,  4 Jun 2022 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654352987;
        bh=YlsU1JFlfNeEE8HV7qFBR9M1MWqneG6hn1wb2b6/haE=;
        h=From:To:Subject:Date:From;
        b=Ip/g5NeEmMl2g70f7GYhAdC9Fu0lV1oSlzEq3/IUK8KbkpesLmw6teZjOmUrxNBXD
         Jw8YaVesYUuHkWcvgNZv1+zdfIX9ygksR/mK6rf6OnNkqcFMTjNwKU45rTF6Bdyy3O
         0CHd1WaVlMYOFfXaPUIyiFTsEUkqS0vaBcR0kuH3CsaZqXh83eudkzxH3d75049ZXE
         vo45L7KxYfcNgn9n0Rt3kTa76qX+SdbqPYEfbtz8Psq+mcOvH1oyl7mJgWms8XH9W4
         p2K0S72FCp/Yfr/wgwP4gY+UBbhvIRXPy0O3l4GPukX+ixBoYAqW5H07y6R4Yzz/Lp
         FcppWXZnxv+vA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DC3FCC05FD4; Sat,  4 Jun 2022 14:29:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216071] New: rtsx_usb: probe of 1-4:1.0 failed with error -11
Date:   Sat, 04 Jun 2022 14:29:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: patricknicolas@laposte.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216071-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216071

            Bug ID: 216071
           Summary: rtsx_usb: probe of 1-4:1.0 failed with error -11
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: patricknicolas@laposte.net
        Regression: No

Created attachment 301102
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301102&action=3Dedit
kernel config of failing version

On my Asus UX333FA, embedded SD card reader fails since kernel 5.18.

[    1.556215] ------------[ cut here ]------------
[    1.556219] xhci_hcd 0000:00:14.0: rejecting DMA map of vmalloc memory
[    1.556239] WARNING: CPU: 5 PID: 245 at include/linux/dma-mapping.h:326
usb_hcd_map_urb_for_dma+0x4d9/0x500
[    1.556255] Modules linked in: rtsx_usb(+) snd_hda_codec_realtek(+)
snd_hda_codec_generic hid_multitouch(+) snd_sof_pci_intel_cnl
snd_sof_intel_hda_common snd_sof_pci intel_rapl_msr asus_nb_wmi
snd_sof_xtensa_dsp i2c_designware_platform snd_sof_intel_hda asus_wmi
intel_rapl_common wmi_bmof i2c_designware_core snd_sof platform_profile
snd_sof_utils snd_soc_acpi_intel_match sparse_keymap snd_soc_acpi
x86_pkg_temp_thermal snd_soc_hdac_hda intel_powerclamp snd_hda_ext_core
snd_soc_core snd_compress kvm_intel i915 input_leds ledtrig_audio iwlmvm kvm
drm_buddy snd_hda_intel snd_intel_dspcfg drm_dp_helper irqbypass snd_hda_co=
dec
drm_kms_helper snd_hwdep syscopyarea intel_lpss_pci snd_hda_core xhci_pci
sysfillrect intel_lpss sysimgblt snd_pcm xhci_hcd fb_sys_fops iwlwifi mfd_c=
ore
ttm intel_pch_thermal i2c_hid_acpi wmi i2c_hid i2c_dev fuse configfs efivar=
fs
[    1.556354] CPU: 5 PID: 245 Comm: systemd-udevd Not tainted 5.18.1-gento=
o-r2
#2
[    1.556361] Hardware name: ASUSTeK COMPUTER INC. ZenBook
UX333FA_UX333FA/UX333FA, BIOS UX333FA.309 10/16/2019
[    1.556364] RIP: 0010:usb_hcd_map_urb_for_dma+0x4d9/0x500
[    1.556374] Code: 50 c6 05 09 cb da 00 01 4d 85 ed 75 03 4d 8b 2a 4c 89 =
d7
e8 89 d9 fb ff 4c 89 ea 48 c7 c7 98 17 c0 96 48 89 c6 e8 2b 87 2f 00 <0f> 0=
b e9
05 ff ff ff 48 8b 05 29 88 bd 00 e9 a7 fc ff ff 48 8b 05
[    1.556378] RSP: 0018:ffff9d4e00687ae8 EFLAGS: 00010292
[    1.556383] RAX: 000000000000003a RBX: ffff9d4e007d5000 RCX:
0000000000000027
[    1.556387] RDX: ffff8a03d5d5b468 RSI: 0000000000000001 RDI:
ffff8a03d5d5b460
[    1.556390] RBP: ffff8a028aa0ba80 R08: ffffffff96f28fa8 R09:
00000000ffffdfff
[    1.556393] R10: ffffffff96e48fc0 R11: ffffffff96ef8fc0 R12:
ffff8a0288280000
[    1.556396] R13: ffff8a02810f3e60 R14: 0000000000000001 R15:
000000000000000c
[    1.556400] FS:  00007f153c230800(0000) GS:ffff8a03d5d40000(0000)
knlGS:0000000000000000
[    1.556404] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.556408] CR2: 00007f153cbefafb CR3: 000000010201c002 CR4:
00000000003706e0
[    1.556412] Call Trace:
[    1.556416]  <TASK>
[    1.556423]  usb_hcd_submit_urb+0x70/0xa20
[    1.556431]  ? __bpf_trace_tick_stop+0x10/0x10
[    1.556441]  ? usb_start_wait_urb+0x8d/0xd0
[    1.556448]  ? kfree+0xa5/0x270
[    1.556454]  ? __cond_resched+0x11/0x40
[    1.556462]  usb_start_wait_urb+0x50/0xd0
[    1.556471]  rtsx_usb_send_cmd+0x57/0xa0 [rtsx_usb]
[    1.556483]  rtsx_usb_probe+0x124/0x2d0 [rtsx_usb]
[    1.556494]  usb_probe_interface+0xcd/0x240
[    1.556500]  really_probe.part.0+0xaa/0x220
[    1.556510]  __driver_probe_device+0x8b/0x120
[    1.556519]  driver_probe_device+0x19/0xd0
[    1.556528]  __driver_attach+0xa3/0x170
[    1.556536]  ? __device_attach_driver+0xe0/0xe0
[    1.556545]  bus_for_each_dev+0x5c/0x90
[    1.556553]  bus_add_driver+0x16d/0x1c0
[    1.556561]  driver_register+0x8a/0xe0
[    1.556566]  usb_register_driver+0x7f/0x120
[    1.556575]  ? 0xffffffffc0426000
[    1.556579]  do_one_initcall+0x3c/0x1b0
[    1.556585]  ? __cond_resched+0x11/0x40
[    1.556590]  ? kmem_cache_alloc_trace+0x3e/0x3e0
[    1.556596]  do_init_module+0x46/0x210
[    1.556602]  __do_sys_finit_module+0x95/0xd0
[    1.556609]  do_syscall_64+0x35/0x80
[    1.556617]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[    1.556627] RIP: 0033:0x7f153ca5a659
[    1.556631] Code: 08 44 89 e0 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 97 17 0f 00 f7 d8 64 89 01 48
[    1.556635] RSP: 002b:00007fffa95f68c8 EFLAGS: 00000202 ORIG_RAX:
0000000000000139
[    1.556641] RAX: ffffffffffffffda RBX: 0000560327c9f940 RCX:
00007f153ca5a659
[    1.556644] RDX: 0000000000000000 RSI: 00007f153cbc7b85 RDI:
0000000000000006
[    1.556647] RBP: 0000000000020000 R08: 0000000000000000 R09:
0000560327ca4db0
[    1.556650] R10: 0000000000000006 R11: 0000000000000202 R12:
00007f153cbc7b85
[    1.556653] R13: 0000000000000000 R14: 0000560327bef320 R15:
0000560327c9f940
[    1.556658]  </TASK>
[    1.556659] ---[ end trace 0000000000000000 ]---
[    1.556817] rtsx_usb: probe of 1-4:1.0 failed with error -11
[    1.556872] usbcore: registered new interface driver rtsx_usb


I have bissected the issue, and it appears since
f5ff79fddf0efecca538046b5cc20fb3ded2ec4f
dma-mapping: remove CONFIG_DMA_REMAP

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
