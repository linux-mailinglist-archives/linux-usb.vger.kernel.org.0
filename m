Return-Path: <linux-usb+bounces-24667-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A432AD3A0B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 15:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C354C174778
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 13:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E1F2980B7;
	Tue, 10 Jun 2025 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGd43Ubj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803AA28DF43
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563798; cv=none; b=s5/ckP+RNp2XhBY4E/lXwZpPnvB98olTeFQJs9Lx5LM0S2ggNRXQQEadBlKAQ6paKjchurbXGH71uYAql7mAzsXrcte5ZXpwGDmjM1qCtbPCUYJofHawSsthHmreY43YrZ/5V7y42PxKs9dHRbxI+GF30eO9bn5JbAym/D26fPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563798; c=relaxed/simple;
	bh=YxbrGJBDQaAL+NyQnvJnEULY5TADnP7aU6pqO2oYoeU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JhGSUTrsWuKVBIWNjsTH8kcphm0FblZpl2c9fxKM+1o/DRLVtrxS1gSsxz77WX/QSdIXdZUGOJzWxTizzjIVpAm5fSepFSRk8HkudC1Zse+PU4wqgx9HB/bXn0iObDK133UGxxAVASJ5L9no90adHwaT300hkKWWRYjpjI6qybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGd43Ubj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52542C4CEED
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749563798;
	bh=YxbrGJBDQaAL+NyQnvJnEULY5TADnP7aU6pqO2oYoeU=;
	h=From:To:Subject:Date:From;
	b=lGd43Ubj6V8pRko7rfUru4osGyKrMroFEzhLicSTaX9fu6Xfwg7h/Taw5LGCdI6Rl
	 iIrBfFApU0Q0b2CamtM2vSFSUt9YLuRwJIUV4ACz+BqOivdM5Ctv1BziHJE+t8+eTY
	 iqutOYDQ4NGV4Nbv2fkD0LswbnLeHEa0Tm2gZWf5MYGKQJku1tWH1ySgIZm/zDjIWL
	 es7+l8qF9PpPYoNJoWykFdeWMxorKIQgP+6EP/5rYMYnw0izVigDu/o0UInNfflCmz
	 z2IcQ70pJgS8tCxHKTJZoJ8BATJhZtxjI/9fQUf2ez8w90T2C0EC7iPIipKfygPFj5
	 MgCbmmTNtP44g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 42FECC3279F; Tue, 10 Jun 2025 13:56:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220217] New: Linux 6.15.1 RIP: 0010:ucsi_reset_ppm+0x1a8/0x1c0
 [typec_ucsi]
Date: Tue, 10 Jun 2025 13:56:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bogdan.nicolae@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220217-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220217

            Bug ID: 220217
           Summary: Linux 6.15.1 RIP: 0010:ucsi_reset_ppm+0x1a8/0x1c0
                    [typec_ucsi]
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: bogdan.nicolae@gmail.com
        Regression: No

RIP at boot after upgrading to Linux 6.15.1-arch1-2. Worked just fine before
the upgrade on Linux 6.14.7-arch2-1.

------------[ cut here ]------------
[   14.894097] WARNING: CPU: 4 PID: 33 at drivers/usb/typec/ucsi/ucsi.c:1380
ucsi_reset_ppm+0x1a8/0x1c0 [typec_ucsi]
[   14.894104] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq
snd_seq_device nvidia_drm(OE) nvidia_modeset(OE) snd_hda_codec_realtek
snd_hda_codec_generic snd_hda_scodec_component snd_hda_codec_hdmi xt_conntr=
ack
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_filter vfat fat snd_soc_=
dmic
snd_soc_ps_mach snd_ps_pdm_dma snd_sof_amd_acp70 snd_sof_amd_acp63
snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp
snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps rtw89_8852be
snd_soc_acpi_amd_match rtw89_8852b snd_amd_sdw_acpi soundwire_amd
rtw89_8852b_common soundwire_generic_allocation rtw89_pci soundwire_bus
snd_soc_sdca rtw89_core snd_soc_core amd_atl snd_compress intel_rapl_msr
intel_rapl_common ac97_bus snd_hda_intel snd_pcm_dmaengine snd_intel_dspcfg
mac80211 snd_intel_sdw_acpi btusb snd_rpl_pci_acp6x uvcvideo snd_acp_pci bt=
rtl
snd_amd_acpi_mach snd_hda_codec videobuf2_vmalloc btintel snd_acp_legacy_co=
mmon
uvc btbcm videobuf2_memops snd_hda_core libarc4 snd_pci_acp6x btmtk
[   14.894148]  videobuf2_v4l2 snd_hwdep snd_pci_acp5x spd5118 hid_multitou=
ch
snd_pcm r8169 videobuf2_common ucsi_acpi amd_pmf snd_rn_pci_acp3x cfg80211
sp5100_tco snd_timer bluetooth typec_ucsi hp_wmi realtek kvm_amd amdtee
snd_acp_config videodev snd i2c_piix4 typec sparse_keymap mdio_devres
snd_soc_acpi amd_sfh kvm irqbypass rapl pcspkr wmi_bmof i2c_hid_acpi mc joy=
dev
amdxdna k10temp mousedev rfkill libphy i2c_smbus snd_pci_acp3x soundcore ro=
les
i2c_hid platform_profile amd_pmc acpi_tad nvidia_uvm(OE) mac_hid nvidia(OE)
i2c_dev crypto_user loop nfnetlink ip_tables x_tables xfs dm_crypt
encrypted_keys trusted asn1_encoder tee amdgpu dm_mod amdxcp i2c_algo_bit
polyval_clmulni drm_ttm_helper polyval_generic ttm ghash_clmulni_intel drm_=
exec
sha512_ssse3 gpu_sched sha256_ssse3 drm_suballoc_helper sha1_ssse3
drm_panel_backlight_quirks nvme aesni_intel drm_buddy nvme_core crypto_simd
drm_display_helper cryptd nvme_keyring ccp cec video nvme_auth wmi serio_raw
[   14.894213] CPU: 4 UID: 0 PID: 33 Comm: kworker/4:0 Tainted: G          =
 OE=20
     6.15.1-arch1-2 #1 PREEMPT(full)  cd63386364b969355862abafc710704c8116e=
874
[   14.894216] Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
[   14.894217] Hardware name: HP Victus by HP Gaming Laptop 16-s1xxx/8C9C, =
BIOS
F.15 03/26/2025
[   14.894218] Workqueue: events_long ucsi_init_work [typec_ucsi]
[   14.894222] RIP: 0010:ucsi_reset_ppm+0x1a8/0x1c0 [typec_ucsi]
[   14.894225] Code: 54 24 0c 81 e2 00 00 00 08 0f 85 33 ff ff ff 4c 89 6c =
24
18 48 8b 05 37 a2 a9 e4 48 39 c5 79 8f b8 92 ff ff ff e9 18 ff ff ff <0f> 0=
b e9
52 ff ff ff e8 ec b9 7a e3 66 66 2e 0f 1f 84 00 00 00 00
[   14.894226] RSP: 0018:ffffd4c1002c7da8 EFLAGS: 00010206
[   14.894228] RAX: 0000000008000000 RBX: ffff8ded8b764200 RCX:
0000000009e4c004
[   14.894229] RDX: 00000000fffba5cd RSI: ffffd4c1002c7db4 RDI:
ffff8ded8b764200
[   14.894230] RBP: 00000000fffba583 R08: 0000000000000000 R09:
ffffffffc05fa21d
[   14.894231] R10: ffff8ded8c7f6200 R11: fffffa020431fd80 R12:
ffff8dfc1ff31280
[   14.894232] R13: ffff8ded8b764200 R14: 0000000000000000 R15:
ffff8ded8b764260
[   14.894234] FS:  0000000000000000(0000) GS:ffff8dfc78c2f000(0000)
knlGS:0000000000000000
[   14.894235] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   14.894236] CR2: 00007f9d375c9000 CR3: 0000000bc7224000 CR4:
0000000000f50ef0
[   14.894237] PKRU: 55555554
[   14.894238] Call Trace:
[   14.894240]  <TASK>
[   14.894243]  ? srso_alias_return_thunk+0x5/0xfbef5
[   14.894248]  ucsi_init_work+0x3b/0x9c0 [typec_ucsi
a58e34a66711100478075e9035267b4c0b538e88]
[   14.894251]  ? kernfs_notify_workfn+0x32/0x250
[   14.894254]  process_one_work+0x190/0x350
[   14.894258]  worker_thread+0x2d7/0x410
[   14.894261]  ? __pfx_worker_thread+0x10/0x10
[   14.894263]  kthread+0xf9/0x240
[   14.894265]  ? __pfx_kthread+0x10/0x10
[   14.894267]  ret_from_fork+0x31/0x50
[   14.894270]  ? __pfx_kthread+0x10/0x10
[   14.894271]  ret_from_fork_asm+0x1a/0x30
[   14.894277]  </TASK>
[   14.894277] ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

