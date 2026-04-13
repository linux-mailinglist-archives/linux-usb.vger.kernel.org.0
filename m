Return-Path: <linux-usb+bounces-36173-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML1SGqCR3Gl9TAkAu9opvQ
	(envelope-from <linux-usb+bounces-36173-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 08:48:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A673E7EA7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 08:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D26583011046
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 06:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70E4366057;
	Mon, 13 Apr 2026 06:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEXV4pSx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B3B1E7660
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 06:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776062875; cv=none; b=HxKF0O3P5xFeUuaMxqzsU4otOyrD/2EJi3EdPMHT+/KJYcx+9VBIQSZdcp+TcSXo4sADnXn+VfgAiEz8MRXxuVzAPYQGGGRK3/zLI6nJ2PYuq3Tg4Ygjyj+KH8wxRMcVuA/38kuA1C0upwAw4bk/eLfgRXcNS3No9GRo/98oAas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776062875; c=relaxed/simple;
	bh=cfhcvX8PsAQAEFHFF0eJXSbpO8B5G6KsIPiwIXnWEH4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nb1se0TLgtpa9Gp0q9Rb5dGtw93qn/oc0IMEDs4xrUvBWqRNkD0/ilPn8VoAsDzzSE8A9Zb6XYP2VQdQV9qF2nAN3rw5JxAMd2jQ9ke5JE/l/nNzSR06GJkF1r4sFgejFlxSqn2euFddSJxvz/LJ6scUNLWdbQZxVCZkJXwHzSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEXV4pSx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19684C116C6
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 06:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776062875;
	bh=cfhcvX8PsAQAEFHFF0eJXSbpO8B5G6KsIPiwIXnWEH4=;
	h=From:To:Subject:Date:From;
	b=BEXV4pSxTyXrAp06X0VTBb8R95WewvcLWls247jTybZ5VqHt1Cn/N69QYVuNYRg/J
	 kEGZCAQX40lxyTtnpeahZHkz81bIvj/SiObUQ7DhddBS/f3KmaoYKsZdsQTTwQa5ge
	 vcqJcYIAbIfhUIzrCdE3aptbZLoCTxFH4jCUo/8/nDKT42oIRay30i01SiZLwuz00w
	 4d7qL8Z+6GVNo0X9xxZXvxd1XUifULjwEip4UQvEiLY7XFKHkRXM8xL3Qc97EHcv0s
	 iX/ldhCrkBF+8C8ZkYnsEz4T2VskXu/ad6C64PjRuupSdnJzqsXFGdee5Itcz+ipPD
	 rYVH2pQdvWTgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0B8B2C4160E; Mon, 13 Apr 2026 06:47:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221359] New: Regression/Warning:
 typec_altmode_update_active+0x101 triggered by UCSI poll worker when
 negotiating Alt Mode on DisplayLink device
Date: Mon, 13 Apr 2026 06:47:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shalev.tomer@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221359-208809@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36173-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6A673E7EA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221359

            Bug ID: 221359
           Summary: Regression/Warning: typec_altmode_update_active+0x101
                    triggered by UCSI poll worker when negotiating Alt
                    Mode on DisplayLink device
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: shalev.tomer@gmail.com
        Regression: No

[14421.539671] usb 3-9: new high-speed USB device number 33 using xhci_hcd
[14421.553277] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 16 us=
ing
xhci_hcd
[14421.594162] usb 2-1: New USB device found, idVendor=3D2109, idProduct=3D=
0822,
bcdDevice=3D 3.14
[14421.594171] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[14421.594173] usb 2-1: Product: USB3.1 Hub=20=20=20=20=20=20=20=20=20=20=
=20=20=20
[14421.594175] usb 2-1: Manufacturer: VIA Labs, Inc.=20=20=20=20=20=20=20=
=20=20
[14421.595469] hub 2-1:1.0: USB hub found
[14421.595914] hub 2-1:1.0: 4 ports detected
[14421.712773] usb 3-9: New USB device found, idVendor=3D2109, idProduct=3D=
2822,
bcdDevice=3D 3.14
[14421.712810] usb 3-9: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[14421.712813] usb 3-9: Product: USB2.0 Hub=20=20=20=20=20=20=20=20=20=20=
=20=20=20
[14421.712816] usb 3-9: Manufacturer: VIA Labs, Inc.=20=20=20=20=20=20=20=
=20=20
[14421.714930] hub 3-9:1.0: USB hub found
[14421.715186] hub 3-9:1.0: 5 ports detected
[14422.321807] usb 2-1.3: new SuperSpeed USB device number 17 using xhci_hcd
[14422.335373] usb 2-1.3: New USB device found, idVendor=3D17e9, idProduct=
=3D6000,
bcdDevice=3D42.55
[14422.335380] usb 2-1.3: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[14422.335382] usb 2-1.3: Product: Cudy_Dl6950
[14422.335383] usb 2-1.3: Manufacturer: DisplayLink
[14422.335384] usb 2-1.3: SerialNumber: Cudy293CS700252700585
[14422.374667] usb 2-1.3: Warning! Unlikely big volume range (=3D767), cval=
->res
is probably wrong.
[14422.374674] usb 2-1.3: [4] FU [Mic Capture Volume] ch =3D 2, val =3D
-4592/7680/16
[14422.376086] usb 2-1.3: Warning! Unlikely big volume range (=3D672), cval=
->res
is probably wrong.
[14422.376088] usb 2-1.3: [7] FU [USB Audio 6950 Playback Volume] ch =3D 6,=
 val =3D
-10752/0/16
[14422.401644] cdc_ncm 2-1.3:1.5: MAC-Address: 80:af:ca:d0:85:7a
[14422.401653] cdc_ncm 2-1.3:1.5: setting rx_max =3D 16384
[14422.401996] cdc_ncm 2-1.3:1.5: setting tx_max =3D 16384
[14422.402367] cdc_ncm 2-1.3:1.5 eth0: register 'cdc_ncm' at
usb-0000:00:0d.0-1.3, CDC NCM (SEND ZLP), 80:af:ca:d0:85:7a
[14422.422855] cdc_ncm 2-1.3:1.5 enx80afcad0857a: renamed from eth0
[14422.470692] usb 2-1.4: new SuperSpeed Plus Gen 2x1 USB device number 18
using xhci_hcd
[14422.511637] usb 2-1.4: New USB device found, idVendor=3D2109, idProduct=
=3D0822,
bcdDevice=3D 3.14
[14422.511645] usb 2-1.4: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[14422.511646] usb 2-1.4: Product: USB3.1 Hub=20=20=20=20=20=20=20=20=20=20=
=20=20=20
[14422.511648] usb 2-1.4: Manufacturer: VIA Labs, Inc.=20=20=20=20=20=20=20=
=20=20
[14422.514052] hub 2-1.4:1.0: USB hub found
[14422.514672] hub 2-1.4:1.0: 4 ports detected
[14422.681505] usb 3-9.4: new high-speed USB device number 34 using xhci_hcd
[14422.772334] usb 3-9.4: New USB device found, idVendor=3D2109, idProduct=
=3D2822,
bcdDevice=3D 3.14
[14422.772341] usb 3-9.4: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[14422.772343] usb 3-9.4: Product: USB2.0 Hub=20=20=20=20=20=20=20=20=20=20=
=20=20=20
[14422.772345] usb 3-9.4: Manufacturer: VIA Labs, Inc.=20=20=20=20=20=20=20=
=20=20
[14422.774268] hub 3-9.4:1.0: USB hub found
[14422.774572] hub 3-9.4:1.0: 5 ports detected
[14423.011599] ------------[ cut here ]------------
[14423.011604] WARNING: CPU: 7 PID: 127023 at drivers/usb/typec/class.c:311
typec_altmode_update_active+0x101/0x110 [typec]
[14423.011629] Modules linked in: cdc_mbim cdc_wdm cdc_ncm nf_conntrack_net=
link
veth snd_seq_dummy snd_hrtimer xt_conntrack xt_MASQUERADE bridge stp llc
xfrm_user xfrm_algo xt_set ip_set nft_chain_nat nf_nat nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 xt_addrtype nft_compat nf_tables ccm overlay =
qrtr
rfcomm cmac algif_hash algif_skcipher af_alg bnep sch_fq_codel
hid_logitech_hidpp evdi(O) hid_logitech_dj binfmt_misc snd_hda_codec_intelh=
dmi
xe snd_ctl_led drm_gpusvm_helper drm_suballoc_helper snd_hda_codec_alc269
snd_hda_scodec_component snd_hda_codec_realtek_lib snd_hda_codec_generic
r8153_ecm cdc_ether usbnet nls_iso8859_1 snd_sof_pci_intel_mtl
snd_sof_intel_hda_generic soundwire_intel snd_sof_intel_hda_sdw_bpt
snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda_mlink
snd_sof_intel_hda soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof
snd_hda_codec_nvhdmi snd_sof_utils snd_hda_ext_core snd_hda_codec_hdmi
snd_soc_acpi_intel_match snd_soc_acpi_intel_sdca_quirks
soundwire_generic_allocation snd_hda_intel
[14423.011679]  snd_soc_acpi soundwire_bus snd_hda_codec snd_soc_sdca
snd_hda_core snd_soc_core snd_usb_audio snd_intel_dspcfg mt7925e snd_compre=
ss
intel_uncore_frequency processor_thermal_device_pci snd_usbmidi_lib
snd_intel_sdw_acpi ac97_bus mt7925_common intel_uncore_frequency_common
processor_thermal_device snd_hwdep snd_pcm_dmaengine snd_ump mt792x_lib
x86_pkg_temp_thermal processor_thermal_wt_hint intel_powerclamp
platform_temperature_control snd_seq_midi mt76_connac_lib btusb coretemp
processor_thermal_soc_slider dell_wmi snd_seq_midi_event uvcvideo nouveau m=
t76
btrtl processor_thermal_rfim videobuf2_vmalloc dell_smbios r8152 intel_rapl=
_msr
processor_thermal_rapl btintel snd_rawmidi snd_seq cmdlinepart dell_wmi_sys=
man
mac80211 uvc mii mxm_wmi dcdbas intel_rapl_common kvm_intel intel_pmc_core
btbcm snd_seq_device spi_nor videobuf2_memops typec_displayport snd_pcm kvm
videobuf2_v4l2 irqbypass rapl mei_gsc_proxy intel_cstate pmt_telemetry mtd
pmt_discovery alienware_wmi dell_smm_hwmon dell_wmi_ddv snd_timer
[14423.011731]  firmware_attributes_class videobuf2_common
processor_thermal_wt_req pmt_class btmtk gpu_sched dell_wmi_descriptor i2c_=
i801
cfg80211 wmi_bmof processor_thermal_power_floor snd r8169 videodev mei_me
intel_pmc_ssram_telemetry drm_gpuvm i2c_smbus spi_intel_pci int3400_thermal
processor_thermal_mbox intel_hid int3403_thermal bluetooth mc usbhid spi_in=
tel
i2c_mux realtek crc8 nvidia_wmi_ec_backlight libarc4 soundcore drm_exec mei
intel_vpu platform_profile int340x_thermal_zone acpi_tad acpi_thermal_rel
intel_vsec sparse_keymap joydev acpi_pad input_leds mac_hid i915 drm_buddy
drm_display_helper cec rc_core i2c_algo_bit drm_ttm_helper ttm efi_pstore
nfnetlink ip_tables x_tables hid_sensor_custom hid_sensor_hub intel_ishtp_h=
id
ucsi_acpi hid_multitouch typec_ucsi hid_generic typec nvme nvme_core
intel_lpss_pci i2c_hid_acpi polyval_clmulni nvme_keyring intel_ish_ipc
intel_lpss i2c_hid video ghash_clmulni_intel psmouse nvme_auth intel_ishtp
idma64 hid thunderbolt wmi pinctrl_meteorpoint pinctrl_meteorlake serio_raw
[14423.011792]  dm_mirror dm_region_hash dm_log msr parport_pc ppdev lp par=
port
dmi_sysfs autofs4 aesni_intel
[14423.011805] CPU: 7 UID: 0 PID: 127023 Comm: kworker/u96:0 Kdump: loaded
Tainted: G           O        6.17.0-20-generic #20-Ubuntu PREEMPT(voluntar=
y)=20
[14423.011810] Tainted: [O]=3DOOT_MODULE
[14423.011812] Hardware name: Alienware Alienware 16X Aurora AC16251/0TKKNM,
BIOS 2.1.2 03/06/2026
[14423.011814] Workqueue: USBC000:00-con2 ucsi_poll_worker [typec_ucsi]
[14423.011824] RIP: 0010:typec_altmode_update_active+0x101/0x110 [typec]
[14423.011832] Code: 2d 68 ea e6 75 2b 48 8b 5d f8 c9 31 c0 31 d2 31 c9 31 =
f6
31 ff c3 cc cc cc cc e8 4a 46 23 e4 8b 75 e4 84 c0 0f 85 6d ff ff ff <0f> 0=
b e9
66 ff ff ff e8 13 4d 33 e5 0f 1f 00 90 90 90 90 90 90 90
[14423.011834] RSP: 0018:ffffce2f8ebebd80 EFLAGS: 00010246
[14423.011837] RAX: 0000000000000000 RBX: ffff8ded66f87808 RCX:
0000000000000000
[14423.011839] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
0000000000000000
[14423.011840] RBP: ffffce2f8ebebda0 R08: 0000000000000000 R09:
0000000000000000
[14423.011841] R10: 0000000000000000 R11: 0000000000000000 R12:
ffff8ded20ca14d0
[14423.011842] R13: ffff8ded66f87808 R14: 0000000000000000 R15:
ffff8deec2060180
[14423.011844] FS:  0000000000000000(0000) GS:ffff8df4f7fff000(0000)
knlGS:0000000000000000
[14423.011845] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[14423.011847] CR2: 00005e39909ca4f0 CR3: 0000000204c40006 CR4:
0000000000f72ef0
[14423.011849] PKRU: 55555554
[14423.011850] Call Trace:
[14423.011852]  <TASK>
[14423.011857]  ucsi_altmode_update_active+0xac/0x190 [typec_ucsi]
[14423.011862]  ucsi_check_altmodes+0x79/0xc0 [typec_ucsi]
[14423.011865]  ? mutex_lock+0x12/0x50
[14423.011874]  ucsi_poll_worker+0x3e/0xc0 [typec_ucsi]
[14423.011877]  process_one_work+0x18b/0x370
[14423.011889]  worker_thread+0x317/0x450
[14423.011892]  ? _raw_spin_lock_irqsave+0xe/0x20
[14423.011899]  ? __pfx_worker_thread+0x10/0x10
[14423.011902]  kthread+0x108/0x220
[14423.011907]  ? __pfx_kthread+0x10/0x10
[14423.011909]  ret_from_fork+0x131/0x150
[14423.011913]  ? __pfx_kthread+0x10/0x10
[14423.011915]  ret_from_fork_asm+0x1a/0x30
[14423.011921]  </TASK>
[14423.011922] ---[ end trace 0000000000000000 ]---
[14423.087894] evdi: [I] (card2) Opened by Task 148861 (DisplayLinkMana) of
process 148825 (DisplayLinkMana)
[14423.093851] evdi: [I] (card2) Added i2c adapter bus number 14
[14423.093860] evdi: [I] (card2) Connected with Task 148867 (DisplayLinkMan=
a)
of process 148825 (DisplayLinkMana)
[14423.093866] evdi: [I] (card2) Connector state: connected

My hardware: Alienware 16X Aurora and the DisplayLink Cudy_Dl6950 device.

The crash happens during a ucsi_poll_worker task.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

