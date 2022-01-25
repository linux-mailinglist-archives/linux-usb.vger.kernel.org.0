Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3637D49AAB0
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jan 2022 05:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3415395AbiAYDpF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 22:45:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3415599AbiAYBsF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jan 2022 20:48:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78947C055A84
        for <linux-usb@vger.kernel.org>; Mon, 24 Jan 2022 17:47:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3DC02B81619
        for <linux-usb@vger.kernel.org>; Tue, 25 Jan 2022 01:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3AADC340E4
        for <linux-usb@vger.kernel.org>; Tue, 25 Jan 2022 01:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643075241;
        bh=jr6sjCpxD/t3JCepjCTzhYQ+x3iX8VJIIamCBzHXWOo=;
        h=From:To:Subject:Date:From;
        b=SBsnQFKsBWvQvCUSHZuimD9lwGSImQp9Xk9pM0lqU2oT3SxsjMISXwFo2PNxDj5VN
         nISoZY7ldDNFjBeBEhCzJ5NCs6ba8T8lulctiSy3cSB2TAbmTdB1nYo3Y7H+zYvFlz
         wFpxKSN6Wr34sivXxlj2ES3K8CRORAN979/Iw7U0tX7B9SzfnD1JHVLiLZC193EB3e
         X8jJwvEV51xY7h9SxcBP1BV68Lc0lun5wM9gf3Q0FBarw/9P81LrppntU+I0/doHMv
         4DQP7OHZjLYkNOOws+EClLEnLy5q4lmYUov1jAHGf0BDOuIUc2XkevdLaifVvM4BwG
         h66LOVHL/1X3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D0EDACC13A7; Tue, 25 Jan 2022 01:47:20 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215530] New: typec kernel error
Date:   Tue, 25 Jan 2022 01:47:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hi2@n101n.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215530-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215530

            Bug ID: 215530
           Summary: typec kernel error
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.17-rc1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: hi2@n101n.xyz
        Regression: No

almost same config for working v5.16 build. but fail on v5.17-rc1
dmesg:


[    7.967005] Oops: 0000 [#1] PREEMPT SMP NOPTI
[    7.967694] CPU: 3 PID: 265 Comm: kworker/3:2 Not tainted 5.17.0-rc1-gs =
#1
[    7.968374] Hardware name: ASUS System Product Name/PRIME B550M-A (WI-FI=
),
BIOS 2423 08/09/2021
[    7.969043] Workqueue: events_long ucsi_init_work [typec_ucsi]
[    7.969714] RIP: 0010:typec_port_match+0x4b/0x90 [typec]
[    7.970382] Code: 8b 98 90 02 00 00 48 89 df 48 83 eb 10 e8 dd 59 c1 c0 =
84
c0 b8 00 00 00 00 48 0f 44 d8 4c 39 eb 74 0c 41 8b 84 24 70 fd ff ff <39> 0=
3 74
0b 5b 31 c0 41 5c 41 5d 41 5e 5d c3 49 8b 3e 49 8d 76 08
[    7.971099] RSP: 0018:ffffacf640ffbd48 EFLAGS: 00010207
[    7.971810] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000000
[    7.972525] RDX: 0000000000000001 RSI: ffffacf640ffbdb8 RDI:
0000000000000000
[    7.973238] RBP: ffffacf640ffbd68 R08: ffff9a62003d96a0 R09:
ffffacf640ffbc08
[    7.973955] R10: ffff9a6225f36000 R11: 0000000000000000 R12:
ffff9a62016e7a90
[    7.974679] R13: ffff9a62016e7800 R14: ffffacf640ffbdb8 R15:
ffff9a6200c96c08
[    7.975405] FS:  0000000000000000(0000) GS:ffff9a80ae8c0000(0000)
knlGS:0000000000000000
[    7.976128] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.976844] CR2: 0000000000000000 CR3: 0000000121dfa000 CR4:
0000000000350ee0
[    7.977561] Call Trace:
[    7.978272]=20=20
[    7.978979]  ? typec_port_compare+0x10/0x10 [typec]
[    7.979694]  bus_for_each_dev+0x7e/0xc0
[    7.980408]  typec_link_ports+0x45/0x80 [typec]
[    7.981110]  typec_register_port+0x1d4/0x2d0 [typec]
[    7.981808]  ucsi_init_work+0x401/0x720 [typec_ucsi]
[    7.982508]  process_one_work+0x21d/0x3f0
[    7.983202]  worker_thread+0x50/0x3d0
[    7.983887]  ? rescuer_thread+0x380/0x380
[    7.984571]  kthread+0xff/0x130
[    7.985246]  ? kthread_complete_and_exit+0x20/0x20
[    7.985927]  ret_from_fork+0x22/0x30
[    7.986608]=20=20
[    7.987282] Modules linked in: snd_hda_codec_realtek snd_hda_codec_gener=
ic
kvm_amd ledtrig_audio iwlmvm(+) kvm snd_hda_codec_hdmi crct10dif_pclmul
mac80211 ghash_clmulni_intel libarc4 snd_hda_intel btusb snd_intel_dspcfg
snd_intel_sdw_acpi aesni_intel btrtl snd_hda_codec btbcm iwlwifi crypto_simd
btintel asus_wmi snd_hda_core cryptd platform_profile btmtk sparse_keymap
snd_hwdep input_leds rapl wmi_bmof video bluetooth ucsi_ccg cfg80211 snd_pcm
efi_pstore typec_ucsi snd_timer ecdh_generic k10temp typec snd sp5100_tco c=
cp
ecc soundcore mac_hid amdgpu iommu_v2 gpu_sched drm_ttm_helper ttm
drm_kms_helper cec drm i2c_algo_bit fb_sys_fops syscopyarea sysfillrect
sysimgblt hid_generic crc32_pclmul i2c_piix4 r8169 usbhid i2c_designware_pci
realtek hid wmi gpio_amdpt gpio_generic
[    7.990356] CR2: 0000000000000000
[    7.991132] ---[ end trace 0000000000000000 ]---
[    8.060078] iwlwifi 0000:09:00.0: Detected RF HR B3, rfid=3D0x10a100
[    8.129116] RIP: 0010:typec_port_match+0x4b/0x90 [typec]
[    8.130024] Code: 8b 98 90 02 00 00 48 89 df 48 83 eb 10 e8 dd 59 c1 c0 =
84
c0 b8 00 00 00 00 48 0f 44 d8 4c 39 eb 74 0c 41 8b 84 24 70 fd ff ff <39> 0=
3 74
0b 5b 31 c0 41 5c 41 5d 41 5e 5d c3 49 8b 3e 49 8d 76 08
[    8.130919] RSP: 0018:ffffacf640ffbd48 EFLAGS: 00010207
[    8.131763] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000000
[    8.132462] iwlwifi 0000:09:00.0: base HW address: 08:5b:d6:51:40:96
[    8.132598] RDX: 0000000000000001 RSI: ffffacf640ffbdb8 RDI:
0000000000000000
[    8.134511] RBP: ffffacf640ffbd68 R08: ffff9a62003d96a0 R09:
ffffacf640ffbc08
[    8.135417] R10: ffff9a6225f36000 R11: 0000000000000000 R12:
ffff9a62016e7a90
[    8.136317] R13: ffff9a62016e7800 R14: ffffacf640ffbdb8 R15:
ffff9a6200c96c08
[    8.137190] FS:  0000000000000000(0000) GS:ffff9a80ae8c0000(0000)
knlGS:0000000000000000
[    8.138035] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.138869] CR2: 0000000000000000 CR3: 0000000121dfa000 CR4:
0000000000350ee0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
