Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6129459AC7
	for <lists+linux-usb@lfdr.de>; Tue, 23 Nov 2021 04:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhKWDzG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Nov 2021 22:55:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:43576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229802AbhKWDzF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Nov 2021 22:55:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5B25460FD7
        for <linux-usb@vger.kernel.org>; Tue, 23 Nov 2021 03:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637639518;
        bh=LwGOGhYlTs/D/mRLOH8Uv60ziTR1WjXhtaE9o5/dYLQ=;
        h=From:To:Subject:Date:From;
        b=VKHp9UzFeoauz/1IZvyp73Xp/Y5MiSf5oxAfb2xX8MrGTJJZusmnxLFaIZcd9z7m9
         Kpf9D+zJFKHlCoyutl4KiUf6nsME+ZAiO8qoJXK1A8LCR8arjnqo+1m5E8VxWbhH7S
         Ba3gOiMOWLAdj9T6Xkl23IQ61tL/1EzUitnPpHx5vd6MkThPmm821X52JkJ3+HlW0L
         neHj3tW4UQKrsld1dli+4p1z59q5snAzm1IPxB5Q2Tnpa+vRXd26KSEFzPa7C/2OFt
         l//MFWbrsZLLcMI8yxY4t3VXhNUaTmRXrGxcJZ+oNZAdTaE0SfyrHnT1BVLZLRTcci
         rawUCZ8b61hGQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 1A07A60EE8; Tue, 23 Nov 2021 03:51:58 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215117] New: ucsi_acpi: kernel NULL pointer dereference
Date:   Tue, 23 Nov 2021 03:51:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux-kernel-bugs@hixontech.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215117-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215117

            Bug ID: 215117
           Summary: ucsi_acpi: kernel NULL pointer dereference
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.16-rc2
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: linux-kernel-bugs@hixontech.com
        Regression: No

Created attachment 299677
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299677&action=3Dedit
journal and lshw

The system fails to boot completely (or shutdown properly) after kernel oop=
s,
apparently in the ucsi_acpi module. It boots up fine with this module
blacklisted. I first noticed the issue on 5.16-rc1; the problem continues w=
ith
5.16-rc2.

HW: HP ENVY x360, AMD Ryzen 7 4700U with Radeon Graphics, Renoir

Attached: full kernel journal log and output from lshw.

OOPS:

Nov 22 06:44:04 kernel: BUG: kernel NULL pointer dereference, address:
0000000000000058
Nov 22 06:44:04 kernel: #PF: supervisor read access in kernel mode
Nov 22 06:44:04 kernel: #PF: error_code(0x0000) - not-present page
Nov 22 06:44:04 kernel: PGD 0 P4D 0=20
Nov 22 06:44:04 kernel: Oops: 0000 [#1] PREEMPT SMP NOPTI
Nov 22 06:44:04 kernel: CPU: 0 PID: 394 Comm: kworker/0:2 Not tainted
5.16.0-rc2-1-mainline #1 4a5aa185cbfb8b63cd50dfec190bc41096ea30a5
Nov 22 06:44:04 kernel: Hardware name: HP HP ENVY x360 Convertible
15-ds1xxx/87A9, BIOS F.07 03/18/2021
Nov 22 06:44:04 kernel: Workqueue: events_long ucsi_init_work [typec_ucsi]
Nov 22 06:44:04 kernel: RIP: 0010:typec_register_altmode+0x2e/0x3a0 [typec]
Nov 22 06:44:04 kernel: Code: 00 41 57 41 56 41 55 41 54 49 89 f4 55 48 89 =
fd
48 8d bf 08 03 00 00 53 48 83 ec 28 65 48 8b 04 25 28 00 00 00 48 89 44 24 =
20
<48> 8b 87 50 fd ff ff 48 3d e0 99 5b c0 74 18 48 8d 95 f8 02 00 00
Nov 22 06:44:04 kernel: RSP: 0018:ffffa171c0f9fd30 EFLAGS: 00010286
Nov 22 06:44:04 kernel: RAX: 8a5a9eb1bcae6600 RBX: ffff94994f1b7800 RCX:
0000000000000001
Nov 22 06:44:04 kernel: RDX: 0000000000000000 RSI: ffffa171c0f9fdd0 RDI:
0000000000000308
Nov 22 06:44:04 kernel: RBP: 0000000000000000 R08: 0000000000000000 R09:
0000000000000000
Nov 22 06:44:04 kernel: R10: 0000000000000000 R11: 0000000000000000 R12:
ffffa171c0f9fdd0
Nov 22 06:44:04 kernel: R13: 0000000000000000 R14: 0000000000000000 R15:
ffff94994f1b7800
Nov 22 06:44:04 kernel: FS:  0000000000000000(0000) GS:ffff949c3f600000(000=
0)
knlGS:0000000000000000
Nov 22 06:44:04 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Nov 22 06:44:04 kernel: CR2: 0000000000000058 CR3: 0000000103c3e000 CR4:
0000000000350ef0
Nov 22 06:44:04 kernel: Call Trace:
Nov 22 06:44:04 kernel:  <TASK>
Nov 22 06:44:04 kernel:  ? ucsi_acpi_sync_write+0x4a/0x70 [ucsi_acpi
02bdd89c7010256e11856d8931a8362b48e4c3f7]
Nov 22 06:44:04 kernel:  ucsi_register_altmode.constprop.0+0x1f0/0x250
[typec_ucsi 5c5256aa8a0bedb6e8965681f3f36303c0e1b18d]
Nov 22 06:44:04 kernel:  ucsi_register_altmodes+0x161/0x1c0 [typec_ucsi
5c5256aa8a0bedb6e8965681f3f36303c0e1b18d]
Nov 22 06:44:04 kernel:  ucsi_check_altmodes+0x17/0x50 [typec_ucsi
5c5256aa8a0bedb6e8965681f3f36303c0e1b18d]
Nov 22 06:44:04 kernel:  ucsi_init_work+0x6c7/0x720 [typec_ucsi
5c5256aa8a0bedb6e8965681f3f36303c0e1b18d]
Nov 22 06:44:04 kernel:  process_one_work+0x1e8/0x3c0
Nov 22 06:44:04 kernel:  worker_thread+0x50/0x3c0
Nov 22 06:44:04 kernel:  ? rescuer_thread+0x390/0x390
Nov 22 06:44:04 kernel:  kthread+0x15c/0x180
Nov 22 06:44:04 kernel:  ? set_kthread_struct+0x50/0x50
Nov 22 06:44:04 kernel:  ret_from_fork+0x22/0x30
Nov 22 06:44:04 kernel:  </TASK>
Nov 22 06:44:04 kernel: Modules linked in: snd_hda_codec_realtek(+) fjes(-)
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi joydev iwlmvm(+)
mousedev snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi mac80211
nls_iso8859_1 snd_hda_codec btusb vfat amdgpu(+) libarc4 snd_hda_core btrtl=
 fat
snd_hwdep btbcm iwlwifi snd_pcm btintel snd_timer bluetooth snd_pci_acp5x
snd_rn_pci_acp3x k10temp gpu_sched amd_sfh snd_pci_acp3x cfg80211 snd
ecdh_generic ucsi_acpi drm_ttm_helper sp5100_tco soundcore rfkill typec_ucsi
ttm i2c_piix4 typec mac_hid roles wmi video tpm_crb tpm_tis wireless_hotkey
tpm_tis_core hp_accel acpi_cpufreq lis3lv02d amd_pmc acpi_tad 9pnet_virtio =
9p
9pnet fscache netfs sg crypto_user fuse bpf_preload ip_tables x_tables ext4
crc32c_generic crc16 mbcache jbd2 dm_crypt cbc encrypted_keys dm_mod trusted
asn1_encoder tee tpm rtsx_pci_sdmmc mmc_core crct10dif_pclmul serio_raw
crc32_pclmul crc32c_intel ghash_clmulni_intel atkbd aesni_intel libps2
crypto_simd cryptd ccp xhci_pci
Nov 22 06:44:04 kernel:  xhci_pci_renesas rng_core rtsx_pci i8042 serio
hid_multitouch i2c_hid_acpi i2c_hid pinctrl_amd
Nov 22 06:44:04 kernel: CR2: 0000000000000058
Nov 22 06:44:04 kernel: ---[ end trace bdd82aa217da2b8a ]---
Nov 22 06:44:04 kernel: RIP: 0010:typec_register_altmode+0x2e/0x3a0 [typec]
Nov 22 06:44:04 kernel: Code: 00 41 57 41 56 41 55 41 54 49 89 f4 55 48 89 =
fd
48 8d bf 08 03 00 00 53 48 83 ec 28 65 48 8b 04 25 28 00 00 00 48 89 44 24 =
20
<48> 8b 87 50 fd ff ff 48 3d e0 99 5b c0 74 18 48 8d 95 f8 02 00 00
Nov 22 06:44:04 kernel: RSP: 0018:ffffa171c0f9fd30 EFLAGS: 00010286
Nov 22 06:44:04 kernel: RAX: 8a5a9eb1bcae6600 RBX: ffff94994f1b7800 RCX:
0000000000000001
Nov 22 06:44:04 kernel: RDX: 0000000000000000 RSI: ffffa171c0f9fdd0 RDI:
0000000000000308
Nov 22 06:44:04 kernel: RBP: 0000000000000000 R08: 0000000000000000 R09:
0000000000000000
Nov 22 06:44:04 kernel: R10: 0000000000000000 R11: 0000000000000000 R12:
ffffa171c0f9fdd0
Nov 22 06:44:04 kernel: R13: 0000000000000000 R14: 0000000000000000 R15:
ffff94994f1b7800
Nov 22 06:44:04 kernel: FS:  0000000000000000(0000) GS:ffff949c3f600000(000=
0)
knlGS:0000000000000000
Nov 22 06:44:04 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Nov 22 06:44:04 kernel: CR2: 0000000000000058 CR3: 0000000103c3e000 CR4:
0000000000350ef0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
