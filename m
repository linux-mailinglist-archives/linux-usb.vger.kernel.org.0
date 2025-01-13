Return-Path: <linux-usb+bounces-19271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCA8A0C0D7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 19:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB25D168FB2
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 18:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848EF1C3F39;
	Mon, 13 Jan 2025 18:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1uxsFlj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EDD240251
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736794460; cv=none; b=Q90UkTs2pSiC31S3K/n7haF+dtEIa35yaTLedJF91PccMpZl9ClajC5Q1dPgLQkpXlaywIogMmjL8EMwOJ3iwsN1BMNrEkRyRqyzelxaVuzZjm7rtYKa/4kDRJy2PR1dHOtDO76eauisgCcNaZ9npLUMsEDxAwXTO1SXtEGiuEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736794460; c=relaxed/simple;
	bh=fdqmrgCXffI+guDd+EshJ/D6j3ex0HnosiYxqhB4LHY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tk8DVZdwG01JM/4+6qSAyFH+qmy8kKdaz66ljVaUrNOiMeEJ8DcFjKWCHwOP3BM0gZ23RsZTxacRMkQOxqf/9GPbG7tFD1i344qOw160m8OMddjBcNF991He7sacQe/arZsjOmEKwgdI4IDtwsbT8BDyyqSbHLYOz+y1KGVjR4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1uxsFlj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D3DAC4CED6
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 18:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736794459;
	bh=fdqmrgCXffI+guDd+EshJ/D6j3ex0HnosiYxqhB4LHY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a1uxsFljGutFLcqx2oNz0mYk4vS6m42WirgsgODMeONdF7Y9maUJmer2Va2cH5Ixc
	 SWZZykjQCpbzbjxjnGd5IyHg2O8FfWT4cmHo8vRSY82ilL+p+7wuBzddvT68gftClO
	 t+yCypwMoe/eYa8vwvurKHcHFacYRQ66SryPMDGph0oWcW9aJtnyYOSArfPGovlGve
	 hvW9GT/9HY8FBD60rPwTMT0sv65gyQQaiMBqK5a5mhcj2jtwjOE3T3KxWXKFuRZZOX
	 n7nl1aP+DjkKAePKZmJRpWWtLx2qa1W7r0/cA1qJ9BUgPuxyq29XeL9zOCvuUkA/SG
	 PJePbEQGfcMsQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 79E57C3279F; Mon, 13 Jan 2025 18:54:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Mon, 13 Jan 2025 18:54:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-v8OJInA5u9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

--- Comment #5 from Guido (guido.iodice@gmail.com) ---
sadly the problem is still there:

13.01.2025 19:40:36:297 kernel  ------------[ cut here ]------------
13.01.2025 19:40:36:297 kernel  WARNING: CPU: 2 PID: 229 at
drivers/usb/typec/ucsi/ucsi.c:1377 ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]
13.01.2025 19:40:36:297 kernel  Modules linked in: cmac algif_hash
algif_skcipher af_alg bnep snd_ctl_led snd_soc_skl_hda_dsp
snd_soc_intel_sof_board_helpers snd_sof_probes snd_soc_intel_hda_dsp_common
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic
snd_hda_scodec_component snd_soc_dmic vfat fat snd_sof_pci_intel_tgl
snd_sof_pci_intel_cnl snd_sof_intel_hda_generic soundwire_intel
soundwire_cadence snd_sof_intel_hda_common intel_uncore_frequency
snd_soc_hdac_hda intel_uncore_frequency_common snd_sof_intel_hda_mlink
snd_sof_intel_hda snd_sof_pci hid_sensor_custom snd_sof_xtensa_dsp uvcvideo
snd_sof videobuf2_vmalloc hid_sensor_hub uvc snd_sof_utils videobuf2_memops
snd_soc_acpi_intel_match videobuf2_v4l2 snd_soc_acpi_intel_sdca_quirks
intel_ishtp_hid soundwire_generic_allocation btusb videobuf2_common
x86_pkg_temp_thermal snd_soc_acpi btrtl intel_powerclamp btintel soundwire_=
bus
videodev btbcm coretemp snd_soc_sdca btmtk mc snd_soc_avs bluetooth kvm_int=
el
snd_soc_hda_codec cdc_ether snd_hda_ext_core ath10k_pci usbnet kvm
13.01.2025 19:40:36:297 kernel   snd_soc_core crct10dif_pclmul ath10k_core
polyval_clmulni snd_compress polyval_generic hid_multitouch ac97_bus
ghash_clmulni_intel sha512_ssse3 snd_pcm_dmaengine ath sha256_ssse3 sha1_ss=
se3
snd_hda_intel ee1004 aesni_intel dell_pc snd_intel_dspcfg intel_pmc_bxt
gf128mul platform_profile iTCO_vendor_support mei_hdcp mei_pxp intel_rapl_m=
sr
snd_intel_sdw_acpi dell_laptop ext4 crypto_simd snd_hda_codec mac80211 cryp=
td
snd_hda_core crc32c_generic processor_thermal_device_pci_legacy rapl r8152
processor_thermal_device crc32c_intel processor_thermal_wt_hint crc16
intel_cstate processor_thermal_rfim mii snd_hwdep mbcache libarc4 mousedev
libphy joydev jbd2 dell_smm_hwmon intel_uncore dell_wmi ucsi_acpi snd_pcm
processor_thermal_rapl i2c_i801 dell_wmi_ddv cfg80211 snd_timer
intel_rapl_common processor_thermal_wt_req spi_nor intel_lpss_pci psmouse
typec_ucsi processor_thermal_power_floor dell_smbios pcspkr mei_me i2c_smbus
i2c_hid_acpi snd intel_lpss intel_ish_ipc dell_wmi_sysman dcdbas
processor_thermal_mbox typec
13.01.2025 19:40:36:297 kernel   firmware_attributes_class dell_wmi_descrip=
tor
wmi_bmof intel_pmc_core mei soundcore mtd rfkill i2c_mux thunderbolt idma64
intel_ishtp roles igen6_edac intel_soc_dts_iosf i2c_hid intel_vsec
int3400_thermal pmt_telemetry int3403_thermal intel_hid int340x_thermal_zone
acpi_pad acpi_tad acpi_thermal_rel pmt_class pinctrl_tigerlake sparse_keymap
mac_hid tcp_bbr sch_fq uhid i2c_dev sg crypto_user dm_mod loop nfnetlink zr=
am
842_decompress 842_compress ip_tables x_tables hid_generic ums_realtek uas
usbhid usb_storage f2fs crc32_generic lz4hc_compress lz4_compress intel_agp
serio_raw atkbd nvme libps2 vivaldi_fmap nvme_core spi_intel_pci crc32_pclm=
ul
spi_intel nvme_auth i8042 serio i915 i2c_algo_bit drm_buddy video wmi ttm
drm_display_helper cec intel_gtt
13.01.2025 19:40:36:297 kernel  CPU: 2 UID: 0 PID: 229 Comm: kworker/2:2
Tainted: G     U             6.13.0-rc7-1-MANJARO #1
56395ce4eea9ed2b7ba363d4072cdedaa9dbb7e4
13.01.2025 19:40:36:297 kernel  Tainted: [U]=3DUSER
13.01.2025 19:40:36:297 kernel  Hardware name: Dell Inc. Inspiron 5502/0WNV=
YK,
BIOS 1.33.1 11/15/2024
13.01.2025 19:40:36:297 kernel  Workqueue: events_long ucsi_init_work
[typec_ucsi]
13.01.2025 19:40:36:297 kernel  RIP: 0010:ucsi_reset_ppm+0x1b4/0x1c0
[typec_ucsi]
13.01.2025 19:40:36:297 kernel  Code: 8b 44 24 04 a9 00 00 00 08 0f 85 36 f=
f ff
ff 4c 89 74 24 10 48 8b 05 8b fe e0 f5 49 39 c5 79 8f bb 92 ff ff ff e9 1b =
ff
ff ff <0f> 0b e9 50 ff ff ff e8 f0 5d ad f4 90 90 90 90 90 90 90 90 90 90
13.01.2025 19:40:36:297 kernel  RSP: 0018:ffffb816c05d7db0 EFLAGS: 00010206
13.01.2025 19:40:36:297 kernel  RAX: 0000000008000000 RBX: 0000000000000000
RCX: 0000000000000002
13.01.2025 19:40:36:297 kernel  RDX: 00000000fffeab3c RSI: ffffb816c05d7db4
RDI: ffff8b72c0d00a00
13.01.2025 19:40:36:297 kernel  RBP: ffff8b72c0d00a00 R08: 0000000000000000
R09: 0000000000000014
13.01.2025 19:40:36:297 kernel  R10: 0000000000000001 R11: 0000000000000000
R12: ffffb816c05d7db4
13.01.2025 19:40:36:297 kernel  R13: 00000000fffeab35 R14: ffff8b72c0d00a60
R15: ffff8b72c0d00ac0
13.01.2025 19:40:36:298 kernel  FS:  0000000000000000(0000)
GS:ffff8b763f500000(0000) knlGS:0000000000000000
13.01.2025 19:40:36:298 kernel  CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
13.01.2025 19:40:36:298 kernel  CR2: 00005ce06429a4a0 CR3: 00000002b7222004
CR4: 0000000000f72ef0
13.01.2025 19:40:36:298 kernel  PKRU: 55555554
13.01.2025 19:40:36:298 kernel  Call Trace:
13.01.2025 19:40:36:298 kernel   <TASK>
13.01.2025 19:40:36:298 kernel   ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi
6a404df311e90ab27e191f01403d346931166551]
13.01.2025 19:40:36:298 kernel   ? __warn.cold+0x93/0xf6
13.01.2025 19:40:36:298 kernel   ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi
6a404df311e90ab27e191f01403d346931166551]
13.01.2025 19:40:36:298 kernel   ? report_bug+0xff/0x140
13.01.2025 19:40:36:298 kernel   ? handle_bug+0x58/0x90
13.01.2025 19:40:36:298 kernel   ? exc_invalid_op+0x17/0x70
13.01.2025 19:40:36:298 kernel   ? asm_exc_invalid_op+0x1a/0x20
13.01.2025 19:40:36:298 kernel   ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi
6a404df311e90ab27e191f01403d346931166551]
13.01.2025 19:40:36:298 kernel   ucsi_init_work+0x3c/0x9c0 [typec_ucsi
6a404df311e90ab27e191f01403d346931166551]
13.01.2025 19:40:36:298 kernel   process_one_work+0x17b/0x330
13.01.2025 19:40:36:298 kernel   worker_thread+0x2ce/0x3f0
13.01.2025 19:40:36:298 kernel   ? __pfx_worker_thread+0x10/0x10
13.01.2025 19:40:36:298 kernel   kthread+0xcf/0x100
13.01.2025 19:40:36:298 kernel   ? __pfx_kthread+0x10/0x10
13.01.2025 19:40:36:298 kernel   ret_from_fork+0x31/0x50
13.01.2025 19:40:36:298 kernel   ? __pfx_kthread+0x10/0x10
13.01.2025 19:40:36:298 kernel   ret_from_fork_asm+0x1a/0x30
13.01.2025 19:40:36:298 kernel   </TASK>
13.01.2025 19:40:36:298 kernel  ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

