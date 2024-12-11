Return-Path: <linux-usb+bounces-18396-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AB49ECD1A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 14:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94437282233
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 13:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD10E22915C;
	Wed, 11 Dec 2024 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfvDxqIk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EB523FD06
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733923381; cv=none; b=X5y8qxvvV581B8eFgCTMqQUj0eQcTnkCD1WvItDuOcev/JlVYSdz48raAbmDbnCwYXvuQTlLMgcOsvs/v/wynfJxd8DJNjIURmoQBUOeN/bGXWBNXQEnl6gZsnXv1VC0bdoI2ZTHS7r/UqNNYe0QN41ApJI0pzwQsEnrBNbIYeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733923381; c=relaxed/simple;
	bh=KN6fzIByeoS2kAP7gC2cc2pjeJ0vpZJcdd99nF3P79I=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UD89H4OiPkzjNBhmVpTH3p1yxq5Ns5KQ8CrTOVNqCv07h0Wf41VF1CTCM9SLwNXYCs/LHGMxhv2v3+7lpvqG1Ypj3HZzwEH/DDaXoubCcgPF54Lb2pCVwHv6rBOeZy6KnFWjSzJRVvm9gFy8oSrab1QpYZFjI1KXNK/DKqzyzaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfvDxqIk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B89CEC4CEDD
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733923380;
	bh=KN6fzIByeoS2kAP7gC2cc2pjeJ0vpZJcdd99nF3P79I=;
	h=From:To:Subject:Date:From;
	b=jfvDxqIkiMdb0ACPNiOUr2bIYnJYtJk4REHsAORjj6AtEMWQUe8uWgzKX7K7S076N
	 uniyUnO4qFiQHiTZIhI7MMDX8ucZbHDbbyUpRShzLai/MVRf/fWd/9p6UR+VoX1Gph
	 or/WbqsJrWaTPmgx5+KHjZ3/AsIoluqgr1GPEkdqFxuKmp6Qg7x0GBL2lZOZOybjOb
	 jC01q3TCVtNIYr9N3YnsKXvH+8UswmsqjGcBg+ibQ9ovGW+cJSBs1mL2cUEBpT7w0+
	 pFJAIdmZneoO2+DRk748UYHfL8o+a5KnC4RJp4cUoYgAeNmaPA6oie5ZQRSxyk5kXO
	 WeqXCLVa7fLzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A0302C3279E; Wed, 11 Dec 2024 13:23:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] New: Linux 6.13 ucsi driver error
Date: Wed, 11 Dec 2024 13:23:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219590-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

            Bug ID: 219590
           Summary: Linux 6.13 ucsi driver error
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: guido.iodice@gmail.com
        Regression: No

11.12.2024 14:15:37:410 kernel  ------------[ cut here ]------------
11.12.2024 14:15:37:410 kernel  WARNING: CPU: 7 PID: 82 at
drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]
11.12.2024 14:15:37:410 kernel  Modules linked in: cmac algif_hash
algif_skcipher af_alg bnep uvcvideo videobuf2_vmalloc uvc btusb
videobuf2_memops videobuf2_v4l2 btrtl videobuf2_common btintel btbcm videod=
ev
btmtk mc bluetooth vfat fat snd_ctl_led snd_soc_skl_hda_dsp
snd_soc_intel_sof_board_helpers snd_sof_probes snd_soc_intel_hda_dsp_common
cdc_ether usbnet snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_gen=
eric
snd_hda_scodec_component snd_soc_dmic snd_sof_pci_intel_tgl
snd_sof_pci_intel_cnl snd_sof_intel_hda_generic soundwire_intel
soundwire_cadence snd_sof_intel_hda_common snd_soc_hdac_hda
snd_sof_intel_hda_mlink snd_sof_intel_hda snd_sof_pci snd_sof_xtensa_dsp r8=
152
intel_uncore_frequency mii intel_uncore_frequency_common libphy snd_sof
snd_sof_utils snd_soc_acpi_intel_match snd_soc_acpi_intel_sdca_quirks
soundwire_generic_allocation snd_soc_acpi hid_sensor_custom soundwire_bus
x86_pkg_temp_thermal intel_powerclamp coretemp snd_soc_sdca hid_sensor_hub
kvm_intel intel_ishtp_hid snd_soc_avs snd_soc_hda_codec kvm
11.12.2024 14:15:37:410 kernel   snd_hda_ext_core joydev mousedev snd_soc_c=
ore
crct10dif_pclmul ath10k_pci polyval_clmulni snd_compress polyval_generic
ac97_bus ghash_clmulni_intel ath10k_core sha512_ssse3 snd_pcm_dmaengine
sha256_ssse3 sha1_ssse3 snd_hda_intel aesni_intel intel_pmc_bxt ath
snd_intel_dspcfg gf128mul dell_pc snd_intel_sdw_acpi platform_profile
hid_multitouch ee1004 iTCO_vendor_support mei_pxp mei_hdcp ext4 crypto_simd
mac80211 cryptd dell_laptop crc32c_generic snd_hda_codec rapl crc32c_intel
intel_rapl_msr dell_wmi crc16 processor_thermal_device_pci_legacy snd_hda_c=
ore
tcp_bbr intel_cstate mbcache dell_smbios xe jbd2 intel_uncore sch_fq snd_hw=
dep
psmouse processor_thermal_device pcspkr dell_wmi_sysman snd_pcm dcdbas liba=
rc4
dell_smm_hwmon dell_wmi_ddv processor_thermal_wt_hint i2c_i801 ucsi_acpi
spi_nor processor_thermal_rfim firmware_attributes_class dell_wmi_descriptor
wmi_bmof mtd uhid drm_gpuvm typec_ucsi snd_timer processor_thermal_rapl
i2c_smbus cfg80211 i2c_mux drm_exec intel_pmc_core mei_me intel_rapl_common
typec
11.12.2024 14:15:37:410 kernel   snd gpu_sched i2c_dev pmt_telemetry
intel_lpss_pci processor_thermal_wt_req intel_ish_ipc int3400_thermal intel=
_hid
i2c_hid_acpi intel_lpss processor_thermal_power_floor drm_ttm_helper sg
processor_thermal_mbox soundcore int3403_thermal rfkill mei intel_ishtp idm=
a64
thunderbolt drm_suballoc_helper intel_soc_dts_iosf roles igen6_edac intel_v=
sec
i2c_hid acpi_thermal_rel pmt_class int340x_thermal_zone acpi_tad acpi_pad
pinctrl_tigerlake sparse_keymap mac_hid crypto_user dm_mod loop nfnetlink z=
ram
842_decompress 842_compress ip_tables x_tables hid_generic ums_realtek uas
usbhid usb_storage f2fs crc32_generic lz4hc_compress lz4_compress intel_agp
serio_raw atkbd libps2 nvme vivaldi_fmap nvme_core crc32_pclmul spi_intel_p=
ci
i915 nvme_auth spi_intel i8042 serio i2c_algo_bit drm_buddy video wmi ttm
drm_display_helper cec intel_gtt
11.12.2024 14:15:37:410 kernel  CPU: 7 UID: 0 PID: 82 Comm: kworker/7:1
Tainted: G     U             6.13.0-rc2-1-MANJARO #1
6d43e27d429ca07d76d7976ef33956c8e42d8727
11.12.2024 14:15:37:410 kernel  Tainted: [U]=3DUSER
11.12.2024 14:15:37:410 kernel  Hardware name: Dell Inc. Inspiron 5502/0WNV=
YK,
BIOS 1.32.0 09/12/2024
11.12.2024 14:15:37:410 kernel  Workqueue: events_long ucsi_init_work
[typec_ucsi]
11.12.2024 14:15:37:410 kernel  RIP: 0010:ucsi_reset_ppm+0x1b4/0x1c0
[typec_ucsi]
11.12.2024 14:15:37:410 kernel  Code: 8b 44 24 04 a9 00 00 00 08 0f 85 36 f=
f ff
ff 4c 89 74 24 10 48 8b 05 9b fe 20 e0 49 39 c5 79 8f bb 92 ff ff ff e9 1b =
ff
ff ff <0f> 0b e9 50 ff ff ff e8 00 01 ee de 90 90 90 90 90 90 90 90 90 90
11.12.2024 14:15:37:410 kernel  RSP: 0018:ffffb849403abdb0 EFLAGS: 00010206
11.12.2024 14:15:37:410 kernel  RAX: 0000000008000000 RBX: 0000000000000000
RCX: 0000000000000002
11.12.2024 14:15:37:410 kernel  RDX: 00000000fffeab5b RSI: ffffb849403abdb4
RDI: ffff9d70b1f11000
11.12.2024 14:15:37:410 kernel  RBP: ffff9d70b1f11000 R08: 0000000000000002
R09: 0000000000000014
11.12.2024 14:15:37:410 kernel  R10: 0000000000000001 R11: 0000000000000000
R12: ffffb849403abdb4
11.12.2024 14:15:37:410 kernel  R13: 00000000fffeab59 R14: ffff9d70b1f11060
R15: ffff9d70b1f110c0
11.12.2024 14:15:37:410 kernel  FS:  0000000000000000(0000)
GS:ffff9d70bf780000(0000) knlGS:0000000000000000
11.12.2024 14:15:37:410 kernel  CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
11.12.2024 14:15:37:410 kernel  CR2: 000074f2cc000020 CR3: 0000000195a22002
CR4: 0000000000f72ef0
11.12.2024 14:15:37:410 kernel  PKRU: 55555554
11.12.2024 14:15:37:410 kernel  Call Trace:
11.12.2024 14:15:37:410 kernel   <TASK>
11.12.2024 14:15:37:410 kernel   ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi
73c1f8300683accb26cf49ce7a68d1bd10954a34]
11.12.2024 14:15:37:410 kernel   ? __warn.cold+0x93/0xf6
11.12.2024 14:15:37:410 kernel   ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi
73c1f8300683accb26cf49ce7a68d1bd10954a34]
11.12.2024 14:15:37:410 kernel   ? report_bug+0xff/0x140
11.12.2024 14:15:37:410 kernel   ? handle_bug+0x58/0x90
11.12.2024 14:15:37:410 kernel   ? exc_invalid_op+0x17/0x70
11.12.2024 14:15:37:410 kernel   ? asm_exc_invalid_op+0x1a/0x20
11.12.2024 14:15:37:410 kernel   ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi
73c1f8300683accb26cf49ce7a68d1bd10954a34]
11.12.2024 14:15:37:410 kernel   ucsi_init_work+0x3c/0x9c0 [typec_ucsi
73c1f8300683accb26cf49ce7a68d1bd10954a34]
11.12.2024 14:15:37:410 kernel   process_one_work+0x17b/0x330
11.12.2024 14:15:37:410 kernel   worker_thread+0x2ce/0x3f0
11.12.2024 14:15:37:410 kernel   ? __pfx_worker_thread+0x10/0x10
11.12.2024 14:15:37:410 kernel   kthread+0xcf/0x100
11.12.2024 14:15:37:410 kernel   ? __pfx_kthread+0x10/0x10
11.12.2024 14:15:37:410 kernel   ret_from_fork+0x31/0x50
11.12.2024 14:15:37:410 kernel   ? __pfx_kthread+0x10/0x10
11.12.2024 14:15:37:410 kernel   ret_from_fork_asm+0x1a/0x30
11.12.2024 14:15:37:410 kernel   </TASK>
11.12.2024 14:15:37:410 kernel  ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

