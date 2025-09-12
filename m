Return-Path: <linux-usb+bounces-28024-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B3CB54E15
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 14:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E558B64343
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 12:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14555302755;
	Fri, 12 Sep 2025 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzYsf/t0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6D53009F1
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 12:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757680591; cv=none; b=XpN67JTIDs6nKJvLFDlP4dYR/DrNOorPb9ERLcGbx+VBTKT0yaPzHKxLiSaQXw7HAzSvlHkRR3Y1CVzmjQWafB1NljkG776QioprBKR1opUeTiYOxbirj+nxvQmMcNxcFHyh7wLRZSaaVbJSTAGXmPDXby2e1XjT4W6H+CWtbMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757680591; c=relaxed/simple;
	bh=S7nGlqBZTcmh2o/8iaemYurAfkatnbXKR99WlWs4xps=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uYtPm5m4OWdEY/qBGrjO4mK0TOr1+2MN3j5LydEVCAtLk4FogAcN9MFyQu/BYAQ+JsPpY8woGVAwydvFPSTdLnobP8Mb+5wN++7bRWeAINbuvMMMfdb2F+Rxt1qQl3an/e73HQ8QBO5uZO7EbsFbCW5KQGPcb2S2XmhLtJ6qeCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzYsf/t0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1790FC4CEF7
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 12:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757680591;
	bh=S7nGlqBZTcmh2o/8iaemYurAfkatnbXKR99WlWs4xps=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AzYsf/t07mQ0ji6ruXrwqGGNfAV1XTirHI9CA+/hAMWLpJbEkjp25KtaYLjOX+shn
	 A5T39A68FB1YcsN/KVWjKozeXaAvB+fRpQwI810bUfdH+/I5elpzsHRAJiyiy/5EXR
	 QQ842nj5hEnFmJykZ8z+Gpy+U6eoEnosNUM1K01b0twbnZjUNVC7PeLgdCBsitVXbp
	 YJ2bkmWXsvy7FBcPE5pj5IynazwkUcQ3woaGKFUeeVjpWOOnnaEtpA0+/IXjZWHJpP
	 Ac1sXfZRi23PkZ8VnnNs0DIdlLf7m40PHR2y+3ZIp99VRelsmkM93BdRbbKSMAMDmF
	 4QWlMFhFLBGWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0BADEC41614; Fri, 12 Sep 2025 12:36:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Fri, 12 Sep 2025 12:36:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zstaseg@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220069-208809-GQvGyt4OlW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

Stanislav Zaikin (zstaseg@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |zstaseg@gmail.com

--- Comment #63 from Stanislav Zaikin (zstaseg@gmail.com) ---
I'm experiencing exactly the same issue - also X670E chipset (Gigabyte Aorus
Master).

Any news on this issue, maybe potential workarounds, Claudio Wunder?

```
13769.621760] xhci_hcd 0000:0f:00.0: xHCI host controller not responding,
assume dead
[13769.621769] xhci_hcd 0000:0f:00.0: HC died; cleaning up
[13769.621801] usb 3-9: USB disconnect, device number 2
[13769.703541] amd_iommu_report_page_fault: 593 callbacks suppressed
[13769.703545] xhci_hcd 0000:0f:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=3D0x0015 address=3D0xfae4d544 flags=3D0x0000]
[13821.304263] igc 0000:0c:00.0 enp12s0: PCIe link lost, device now detached
[13863.687619] xhci_hcd 0000:0f:00.0: remove, state 4
[13863.687624] usb usb4: USB disconnect, device number 1
[13863.687824] xhci_hcd 0000:0f:00.0: USB bus 4 deregistered
[13863.687831] xhci_hcd 0000:0f:00.0: remove, state 1
[13863.687833] usb usb3: USB disconnect, device number 1
[13864.064774] xhci_hcd 0000:0f:00.0: USB bus 3 deregistered
[13864.321485] xhci_hcd 0000:0f:00.0: xHCI Host Controller
[13864.321492] xhci_hcd 0000:0f:00.0: new USB bus registered, assigned bus
number 3
[13864.494438] xhci_hcd 0000:0f:00.0: hcc params 0x0200ef81 hci version 0x1=
10
quirks 0x0000000200000010
[13864.650361] xhci_hcd 0000:0f:00.0: xHCI Host Controller
[13864.650364] xhci_hcd 0000:0f:00.0: new USB bus registered, assigned bus
number 4
[13864.650366] xhci_hcd 0000:0f:00.0: Host supports USB 3.2 Enhanced SuperS=
peed
[13864.650421] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002,
bcdDevice=3D 6.16
[13864.650423] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[13864.650424] usb usb3: Product: xHCI Host Controller
[13864.650425] usb usb3: Manufacturer: Linux 6.16.6-arch1-1 xhci-hcd
[13864.650426] usb usb3: SerialNumber: 0000:0f:00.0
[13864.650513] hub 3-0:1.0: USB hub found
[13864.650529] hub 3-0:1.0: 12 ports detected
[13864.650766] usb usb4: We don't know the algorithms for LPM for this host,
disabling LPM.
[13864.650785] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003,
bcdDevice=3D 6.16
[13864.650786] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[13864.650787] usb usb4: Product: xHCI Host Controller
[13864.650788] usb usb4: Manufacturer: Linux 6.16.6-arch1-1 xhci-hcd
[13864.650789] usb usb4: SerialNumber: 0000:0f:00.0
[13864.650942] hub 4-0:1.0: USB hub found
[13864.701188] hub 4-0:1.0: 5 ports detected
[13865.141830] usb 3-9: new full-speed USB device number 2 using xhci_hcd
[13866.346680] xhci_hcd 0000:0f:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=3D0x0015 address=3D0xfe1bd000 flags=3D0x0020]
[13866.346693] xhci_hcd 0000:0f:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=3D0x0015 address=3D0xfe1bd020 flags=3D0x0020]
[13866.346702] xhci_hcd 0000:0f:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=3D0x0015 address=3D0xfe1bd040 flags=3D0x0020]
[13866.346712] xhci_hcd 0000:0f:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=3D0x0015 address=3D0xfe1bd060 flags=3D0x0020]
[13866.346721] xhci_hcd 0000:0f:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=3D0x0015 address=3D0xfe1bd080 flags=3D0x0020]
[13866.346730] xhci_hcd 0000:0f:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=3D0x0015 address=3D0xfe1bd0a0 flags=3D0x0020]
[13866.346738] xhci_hcd 0000:0f:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=3D0x0015 address=3D0xfe1bd0c0 flags=3D0x0020]
[13866.346747] xhci_hcd 0000:0f:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=3D0x0015 address=3D0xfe1bd100 flags=3D0x0020]
[13866.346756] xhci_hcd 0000:0f:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=3D0x0015 address=3D0xfe1bd120 flags=3D0x0020]
[13866.346765] xhci_hcd 0000:0f:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=3D0x0015 address=3D0xfe1bd140 flags=3D0x0020]
[13866.485412] AMD-Vi: IOMMU Event log restarting
[13882.024157] watchdog: CPU4: Watchdog detected hard LOCKUP on cpu 4
[13882.024160] Modules linked in: btusb uinput snd_seq_dummy snd_hrtimer rf=
comm
snd_seq snd_seq_device tun cmac algif_hash algif_skcipher af_alg bnep
typec_displayport vfat fat amd_atl intel_rapl_msr intel_rapl_common iwlmvm
snd_hda_codec_realtek snd_hda_codec_generic snd_hda_scodec_component mac802=
11
snd_hda_codec_hdmi kvm_amd libarc4 snd_hda_intel snd_intel_dspcfg
snd_intel_sdw_acpi kvm snd_hda_codec iwlwifi btrtl nvidia_drm(OE) btintel
snd_hda_core irqbypass btbcm btmtk polyval_clmulni snd_hwdep nvidia_modeset=
(OE)
cfg80211 ucsi_ccg ghash_clmulni_intel ucsi_acpi bluetooth snd_pcm sha512_ss=
se3
typec_ucsi igc sp5100_tco sha1_ssse3 typec snd_timer aesni_intel i2c_piix4 =
ptp
rapl wmi_bmof gigabyte_wmi joydev mousedev pcspkr k10temp ccp i2c_smbus rfk=
ill
pps_core snd roles soundcore nvidia_uvm(OE) apple_mfi_fastcharge i2c_nvidia=
_gpu
thunderbolt gpio_amdpt gpio_generic mac_hid nvidia(OE) i2c_dev crypto_user =
loop
dm_mod nfnetlink ip_tables x_tables hid_logitech_hidpp hid_apple
hid_logitech_dj amdgpu amdxcp i2c_algo_bit
[13882.024200]  drm_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper n=
vme
drm_panel_backlight_quirks drm_buddy nvme_core drm_display_helper nvme_keyr=
ing
cec nvme_auth video wmi [last unloaded: btusb]
[13882.024208] CPU: 4 UID: 0 PID: 49632 Comm: kworker/4:0 Tainted: G       =
 W=20
OEL      6.16.6-arch1-1 #1 PREEMPT(full)=20
4a67af4a252a87f07f21d480c3d8b2609e933916
[13882.024212] Tainted: [W]=3DWARN, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE,
[L]=3DSOFTLOCKUP
[13882.024212] Hardware name: Gigabyte Technology Co., Ltd. X670E AORUS
MASTER/X670E AORUS MASTER, BIOS F37 07/31/2025
[13882.024214] Workqueue: events xhci_handle_command_timeout
[13882.024218] RIP: 0010:delay_halt_mwaitx+0x1f/0x40
[13882.024221] Code: 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 =
00
00 53 65 48 8b 05 46 ff fb 01 31 d2 89 d1 48 05 00 a0 4e 9c 0f 01 fa <b8> f=
f ff
ff ff b9 02 00 00 00 48 39 f0 0f 42 f0 b8 f0 00 00 00 89
[13882.024222] RSP: 0018:ffffd2c4a335fbb8 EFLAGS: 00000087
[13882.024224] RAX: ffff8a6bbe105000 RBX: 0000000000001194 RCX:
0000000000000000
[13882.024224] RDX: 0000000000000000 RSI: 0000000000001194 RDI:
000039119a3d8918
[13882.024225] RBP: 000039119a3d8918 R08: 8080808080808080 R09:
0000000000000001
[13882.024226] R10: ffff8a5cc0050cc0 R11: fefefefefefefeff R12:
00000000004c4b40
[13882.024226] R13: ffffd2c4a6e10038 R14: 0000000000000000 R15:
ffff8a5d55ee2201
[13882.024227] FS:  0000000000000000(0000) GS:ffff8a6c21c1b000(0000)
knlGS:0000000000000000
[13882.024228] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[13882.024228] CR2: 00007f0c017b9000 CR3: 000000013eb0b000 CR4:
0000000000f50ef0
[13882.024229] PKRU: 55555554
[13882.024230] Call Trace:
[13882.024231]  <TASK>
[13882.024232]  delay_halt+0x3c/0x70
[13882.024235]  xhci_handshake+0x67/0xc0
[13882.024238]  xhci_handle_command_timeout+0x3d7/0x520
[13882.024245]  process_one_work+0x190/0x350
[13882.024249]  worker_thread+0x2d7/0x410
[13882.024251]  ? __pfx_worker_thread+0x10/0x10
[13882.024253]  kthread+0xf9/0x240
[13882.024254]  ? __pfx_kthread+0x10/0x10
[13882.024256]  ? __pfx_kthread+0x10/0x10
[13882.024257]  ret_from_fork+0x197/0x1d0
[13882.024259]  ? __pfx_kthread+0x10/0x10
[13882.024260]  ret_from_fork_asm+0x1a/0x30
[13882.024264]  </TASK>
[13889.257466] xhci_hcd 0000:0f:00.0: Abort failed to stop command ring: -1=
10
[13889.257533] xhci_hcd 0000:0f:00.0: xHCI host controller not responding,
assume dead
[13889.257539] xhci_hcd 0000:0f:00.0: HC died; cleaning up
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

