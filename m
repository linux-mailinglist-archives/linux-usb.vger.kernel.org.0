Return-Path: <linux-usb+bounces-36985-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oENsMqI++mmjLAMAu9opvQ
	(envelope-from <linux-usb+bounces-36985-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 21:01:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E96D4D2FE8
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 21:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA9D2300CC0E
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 19:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE294BC00C;
	Tue,  5 May 2026 19:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1bqWkZw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B0E3C1984
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 19:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007707; cv=none; b=j0dH/FAXNlzqAjvwrt1KCy32hgQNdVbl1dFzpdn3J4c8kx2o/JM1PHqgtvvksc8/fY7QAWdNSi8+6RtenEthm3v4OD/Gig4HitrQzDb7DKcAkt0JXfpy39995Rm8ulKG8vGE3VO0PzgrbMw3RFzUxYbFK23pqhsifgNPprfdnUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007707; c=relaxed/simple;
	bh=4upy47EsepCS/e7hdmjHfdh10zxoBuDjEf7g0HFMk8w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YdLHUSdHC7F7RTnEcLRWAqQ8PNHnhcKF845WHGfurJ9+rJTEnNXFNHtts0azcIsmrMZr5A7VbofY3Yj5Xu9y8J8s3FBxioaq/GEVG3tlaBfNxcOZLeETjQZtZLFhxpwy9Wui53uPo8+8bweStYFziheyTueAdgLs1MXODLSHBWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1bqWkZw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40F9CC2BCC7
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 19:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778007704;
	bh=4upy47EsepCS/e7hdmjHfdh10zxoBuDjEf7g0HFMk8w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=S1bqWkZwvQrFcq4pQSqAvZ6Pzw9vVzihHjhZlwUEIxpPgD11yQbSbCbNLrRodnmLD
	 J6wE2vjUF6CSyM9aYOHbY/JoS/xeaj60T/t/vhWsgEkmiivUDR/vmRmMroW02QZ4DC
	 7Eob05YEro9MZ+Km6ztgY5SVutJOXQeO6VxgdCdqldtWFckJ3nR0VSak7Vw2Ya4TKN
	 2VsPtGJ4fjN++0hdtfP+jbPUkdVyt3c1cJnW8TbtM5CG+0V5CJdjugiTbrx7ggJQoO
	 7VrmO/t/m07Jkk1NJPfFcRw7pHjkYPg0KfkDeQREJ5b/Rxqxtflz+evEyuSS2YyWvL
	 Vq1zkLxEFo15A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 322E2C53BBF; Tue,  5 May 2026 19:01:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 205841] Lenovo USB-C dock audio NULL pointer
Date: Tue, 05 May 2026 19:01:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmike2001@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205841-208809-xbz3jLwKDA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205841-208809@https.bugzilla.kernel.org/>
References: <bug-205841-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 2E96D4D2FE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36985-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1]

https://bugzilla.kernel.org/show_bug.cgi?id=3D205841

Mike (pmike2001@mail.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pmike2001@mail.ru

--- Comment #13 from Mike (pmike2001@mail.ru) ---
Wow, this bug with usb-typec is quite old.

I'm getting crashes in `typec_altmode_update_active` on recent kernel 7.0.2

```
2026-05-05T21:53:56.654401+03:00 113896057i kernel: ------------[ cut here
]------------
2026-05-05T21:53:56.654434+03:00 113896057i kernel: WARNING:
drivers/usb/typec/class.c:311 at typec_altmode_update_active+0x101/0x110
[typec], CPU#4: kworker/u64:32/1052736
2026-05-05T21:53:56.654438+03:00 113896057i kernel: Modules linked in: btusb
cpuid cdc_acm typec_displayport ccm dummy rfcomm snd_seq_dummy snd_hrtimer =
uhid
cmac algif_hash algif_skcipher af_alg bnep zram 842_decompress 842_compress
lz4hc_compress lz4_compress snd_soc_skl_hda_dsp snd_soc_intel_sof_board_hel=
pers
snd_sof_probes snd_soc_intel_hda_dsp_common snd_hda_codec_intelhdmi
snd_hda_codec_hdmi hid_multitouch snd_soc_dmic snd_hda_codec_alc269
snd_hda_codec_realtek_lib snd_hda_intel snd_hda_scodec_component
snd_hda_codec_generic snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl
snd_sof_intel_hda_generic soundwire_intel snd_sof_intel_hda_sdw_bpt
snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda_mlink
snd_sof_intel_hda soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof
snd_sof_utils snd_soc_acpi_intel_match snd_ctl_led
snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation snd_soc_sdw_uti=
ls
snd_soc_acpi soundwire_bus snd_soc_sdca crc8 binfmt_misc snd_soc_avs
xt_hashlimit snd_soc_hda_codec xt_conntrack iwlmvm snd_hda_ext_core
nf_conntrack
2026-05-05T21:53:56.654442+03:00 113896057i kernel:  snd_hda_codec
nf_defrag_ipv6 snd_hda_core hid_generic intel_rapl_msr spi_nor nf_defrag_ip=
v4
mei_pxp mei_hdcp mac80211 snd_intel_dspcfg xt_tcpudp mtd nft_compat
snd_intel_sdw_acpi x_tables snd_hwdep processor_thermal_device_pci libarc4
uvcvideo nf_tables snd_soc_core processor_thermal_device intel_uncore_frequ=
ency
snd_compress videobuf2_vmalloc intel_uncore_frequency_common
processor_thermal_wt_hint ac97_bus uvc platform_temperature_control
intel_tcc_cooling snd_pcm_dmaengine videobuf2_memops
processor_thermal_soc_slider x86_pkg_temp_thermal videobuf2_v4l2
processor_thermal_rfim intel_powerclamp btmtk snd_pcm videobuf2_common
ucsi_acpi processor_thermal_rapl btrtl typec_ucsi iwlwifi intel_rapl_common
btbcm videodev thinkpad_acpi snd_seq typec coretemp think_lmi btintel
intel_lpss_pci ghash_clmulni_intel processor_thermal_wt_req nls_iso8859_1 r=
apl
usbhid intel_cstate mc firmware_attributes_class bluetooth wmi_bmof i2c_i801
nvram snd_seq_device processor_thermal_power_floor snd_timer mei_me
spi_intel_pci
2026-05-05T21:53:56.654445+03:00 113896057i kernel:  platform_profile
int3403_thermal intel_lpss processor_thermal_mbox cfg80211 snd spi_intel
i2c_smbus i2c_hid_acpi thunderbolt mei idma64 i2c_mux igen6_edac soundcore
mei_vsc_hw i2c_hid int340x_thermal_zone soc_button_array hid intel_pmc_core
pmt_telemetry pmt_discovery intel_hid pmt_class int3400_thermal
intel_pmc_ssram_telemetry acpi_thermal_rel sparse_keymap acpi_pad acpi_tad
sch_fq_codel ntsync efi_pstore nfnetlink dmi_sysfs autofs4 dm_crypt xe
drm_ttm_helper drm_suballoc_helper gpu_sched drm_gpuvm drm_exec
drm_gpusvm_helper i2c_algo_bit drm_buddy ttm nvme drm_display_helper nvme_c=
ore
video psmouse cec nvme_keyring mac_hid nvme_auth rc_core hkdf intel_vsec wmi
pinctrl_tigerlake aesni_intel [last unloaded: btusb]
2026-05-05T21:53:56.654447+03:00 113896057i kernel: CPU: 4 UID: 0 PID: 1052=
736
Comm: kworker/u64:32 Tainted: G     U  W           7.0.2-070002-generic
#202604271502 PREEMPT(lazy)=20
2026-05-05T21:53:56.654449+03:00 113896057i kernel: Tainted: [U]=3DUSER, [W=
]=3DWARN
2026-05-05T21:53:56.654451+03:00 113896057i kernel: Hardware name: LENOVO
21HNS8JH00/21HNS8JH00, BIOS N3XET42W (1.17 ) 08/02/2023
2026-05-05T21:53:56.654454+03:00 113896057i kernel: Workqueue: USBC000:00-c=
on1
ucsi_poll_worker [typec_ucsi]
2026-05-05T21:53:56.654476+03:00 113896057i kernel: RIP:
0010:typec_altmode_update_active+0x101/0x110 [typec]
2026-05-05T21:53:56.654478+03:00 113896057i kernel: Code: 4d c8 c4 fc 75 2b=
 48
8b 5d f8 c9 31 c0 31 d2 31 c9 31 f6 31 ff c3 cc cc cc cc e8 da 7b d9 f9 8b =
75
e4 84 c0 0f 85 6d ff ff ff <0f> 0b e9 66 ff ff ff e8 13 3e f4 fa 0f 1f 00 9=
0 90
90 90 90 90 90
2026-05-05T21:53:56.654481+03:00 113896057i kernel: RSP: 0018:ffffcd40051ff=
d80
EFLAGS: 00010246
2026-05-05T21:53:56.654483+03:00 113896057i kernel: RAX: 0000000000000000 R=
BX:
ffff8bf663d8ac08 RCX: 0000000000000000
2026-05-05T21:53:56.654571+03:00 113896057i kernel: RDX: 0000000000000000 R=
SI:
0000000000000001 RDI: 0000000000000000
2026-05-05T21:53:56.654581+03:00 113896057i kernel: RBP: ffffcd40051ffda0 R=
08:
0000000000000000 R09: 0000000000000000
2026-05-05T21:53:56.654582+03:00 113896057i kernel: R10: 0000000000000000 R=
11:
0000000000000000 R12: ffff8bf6123c0000
2026-05-05T21:53:56.654583+03:00 113896057i kernel: R13: ffff8bf663d8ac08 R=
14:
0000000000000000 R15: ffff8bf7522ebd40
2026-05-05T21:53:56.654584+03:00 113896057i kernel: FS:  0000000000000000(0=
000)
GS:ffff8bf992004000(0000) knlGS:0000000000000000
2026-05-05T21:53:56.654590+03:00 113896057i kernel: CS:  0010 DS: 0000 ES: =
0000
CR0: 0000000080050033
2026-05-05T21:53:56.654592+03:00 113896057i kernel: CR2: 000055eabf2a8178 C=
R3:
000000011a4ec001 CR4: 0000000000f70ef0
2026-05-05T21:53:56.654592+03:00 113896057i kernel: PKRU: 55555554
2026-05-05T21:53:56.654594+03:00 113896057i kernel: Call Trace:
2026-05-05T21:53:56.654599+03:00 113896057i kernel:  <TASK>
2026-05-05T21:53:56.654610+03:00 113896057i kernel:=20
ucsi_altmode_update_active+0x116/0x1b0 [typec_ucsi]
2026-05-05T21:53:56.654614+03:00 113896057i kernel:=20
ucsi_check_altmodes+0x82/0xc0 [typec_ucsi]
2026-05-05T21:53:56.654615+03:00 113896057i kernel:  ? mutex_lock+0x3b/0x50
2026-05-05T21:53:56.654616+03:00 113896057i kernel:=20
ucsi_poll_worker+0x3d/0x130 [typec_ucsi]
2026-05-05T21:53:56.654617+03:00 113896057i kernel:=20
process_one_work+0x1ac/0x3d0
2026-05-05T21:53:56.654618+03:00 113896057i kernel:  worker_thread+0x1b8/0x=
360
2026-05-05T21:53:56.654618+03:00 113896057i kernel:  ?
_raw_spin_lock_irqsave+0xe/0x20
2026-05-05T21:53:56.654619+03:00 113896057i kernel:  ?
__pfx_worker_thread+0x10/0x10
2026-05-05T21:53:56.654624+03:00 113896057i kernel:  kthread+0xf7/0x130
2026-05-05T21:53:56.654625+03:00 113896057i kernel:  ? __pfx_kthread+0x10/0=
x10
2026-05-05T21:53:56.654626+03:00 113896057i kernel:  ret_from_fork+0x195/0x=
2a0
2026-05-05T21:53:56.654627+03:00 113896057i kernel:  ? __pfx_kthread+0x10/0=
x10
2026-05-05T21:53:56.654627+03:00 113896057i kernel:  ? __pfx_kthread+0x10/0=
x10
2026-05-05T21:53:56.654632+03:00 113896057i kernel:=20
ret_from_fork_asm+0x1a/0x30
2026-05-05T21:53:56.654639+03:00 113896057i kernel:  </TASK>
2026-05-05T21:53:56.654640+03:00 113896057i kernel: ---[ end trace
0000000000000000 ]---
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

