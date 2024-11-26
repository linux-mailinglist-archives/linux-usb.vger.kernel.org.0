Return-Path: <linux-usb+bounces-17848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9369D902A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 02:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 368B91692F3
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 01:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D625DF60;
	Tue, 26 Nov 2024 01:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUHS+2a2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B3217BA0
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732585984; cv=none; b=VY4iBVFu04eftjje5dky0wE1fpFXTOjE4jdMh2ElvJpAOs2QT787Zb5FUu1fXO/XZMGxX+ZPZbkPPduUErd9ULeMHUBoNCotB0o621NRIULjXVKUESz8jS7CJ/y9QKgNjCukm5TKES3AeZQq+Hp/1+sYPaDCfq6vNSvEQxyVVk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732585984; c=relaxed/simple;
	bh=9xll1Amb2DktZ3j5+ewIZZAQPJSeQ7KqnSpPMf1MfMA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HUirR7N3VNC2nSmh1yDKegiSaza1v0ysgSbvqwpyEXxAFrpYeW+Jz0VFieJsptc+J4a5uPltsFtJGQOVocalPTWpdxBVqJw/MJlo+w6XcHdZunZNq5zNTK8gnG7hqCZjyTEDsML8AsqvyFWEVB2fwCe1J5Dx+/QVpFB3+toHOjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uUHS+2a2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A064AC4CECE
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732585983;
	bh=9xll1Amb2DktZ3j5+ewIZZAQPJSeQ7KqnSpPMf1MfMA=;
	h=From:To:Subject:Date:From;
	b=uUHS+2a2PxrBmOBdc51p5WVBqU1ZoccbAz1+bWGRET+eRPS1YlT9poErJf95uHSMk
	 J+xTUkgzYkY3Jr/D81FxxF+q2zkmepBofquof1zfaxYAde7XBP8ua/kbaFDDAyke8Y
	 gHTYXr4r62en7TNPEM8MY+tPdB1B3gsIxWwWfeOY+ty3pqVv2PCIYquSDe+36yvlyx
	 1qsWXLl2BcsqWEpj+sKjggCvG0maVHcAKNjeEu76ZFV0sYDT7/alPrepTd9rm5g7pF
	 TLZzDHxk4mtNO4Fn3onE9GESBvMQpE/CuvyUciaGeJx03gCMmkb59Ltr1RSjZZnEJD
	 k+qMJqGY+NV1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 88B2AC53BC2; Tue, 26 Nov 2024 01:53:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219532] New: Crash in RIP: 0010:xhci_handle_stopped_cmd_ring
Date: Tue, 26 Nov 2024 01:53:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: James.Dutton@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219532-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219532

            Bug ID: 219532
           Summary: Crash in RIP: 0010:xhci_handle_stopped_cmd_ring
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: James.Dutton@gmail.com
        Regression: No

Created attachment 307279
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307279&action=3Dedit
The log output

I am not sure how to reproduce this, but it halted the system.
kernel is 6.12.1  mainline.


The system halted and this was written to the log:
<4>1 2024-11-26T00:31:54+00:00 nvme3 kernel - - -  xhci_hcd 0000:c1:00.3:
Timeout while waiting for setup device command
<1>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  BUG: kernel NULL pointer
dereference, address: 0000000000000030
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  xhci_hcd 0000:c1:00.3:
Timeout while waiting for setup device command
<1>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  #PF: supervisor read acc=
ess
in kernel mode
<1>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  #PF: error_code(0x0000) -
not-present page
<6>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  PGD 0 P4D 0=20
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  Oops: Oops: 0000 [#1]
PREEMPT SMP NOPTI
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  CPU: 6 UID: 0 PID: 30684
Comm: kworker/6:1 Not tainted 6.12.1 #126
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  Hardware name: Framework
Laptop 16 (AMD Ryzen 7040 Series)/FRANMZCP07, BIOS 03.05 11/13/2024
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  Workqueue: events
xhci_handle_command_timeout
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  RIP:
0010:xhci_handle_stopped_cmd_ring+0xf3/0x150
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  Code: 49 8b 45 00 48 8b =
4b
18 48 c7 c2 d0 af 6b a6 48 c7 c7 88 26 81 a7 48 8b 30 e8 b9 cd bc ff e9 76 =
ff
ff ff 4d 89 a5 28 01 00 00 <41> 8b 7c 24 30 e8 d3 7c 4a ff 48 8b 35 6c e4 d=
a 00
bf 00 20 00 00
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  RSP: 0018:ffff9d8c8e39fb=
e0
EFLAGS: 00010046
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  RAX: ffff928904c35500 RB=
X:
ffff9289057e82e8 RCX: 0000000000000000
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  RDX: 0000000000000000 RS=
I:
0000000000000000 RDI: ffff9d8c8089dff0
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  RBP: ffff9d8c8e39fc00 R0=
8:
0000000000000000 R09: 0000000000000000
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  R10: 0000000000000000 R1=
1:
0000000000000000 R12: 0000000000000000
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  R13: ffff9289057e8250 R1=
4:
ffff9289057e82e8 R15: 00000000000001f4
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  FS:  0000000000000000(00=
00)
GS:ffff9297dfd00000(0000) knlGS:0000000000000000
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  CS:  0010 DS: 0000 ES: 0=
000
CR0: 0000000080050033
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  CR2: 0000000000000030 CR=
3:
0000000e16852000 CR4: 0000000000f50ef0
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  PKRU: 55555554
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  Call Trace:
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   <TASK>
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ? show_regs+0x6c/0x80
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ? __die+0x24/0x80
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ?
page_fault_oops+0x175/0x5c0
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ?
finish_task_switch.isra.0+0x92/0x2d0
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ?
do_user_addr_fault+0x4b2/0x870
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ?
srso_alias_return_thunk+0x5/0xfbef5
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ? lock_timer_base+0x30/=
0xf0
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ? exc_page_fault+0x85/0=
x1c0
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ?
asm_exc_page_fault+0x27/0x30
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ?
xhci_handle_stopped_cmd_ring+0xf3/0x150
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -=20=20
xhci_handle_command_timeout+0x544/0x5a0
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -=20=20
process_one_work+0x178/0x3d0
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   worker_thread+0x2de/0x4=
10
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ?
__pfx_worker_thread+0x10/0x10
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   kthread+0xe1/0x110
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ? __pfx_kthread+0x10/0x=
10
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ret_from_fork+0x44/0x70
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ? __pfx_kthread+0x10/0x=
10
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   ret_from_fork_asm+0x1a/=
0x30
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   </TASK>
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  Modules linked in:
typec_displayport cdc_acm ftdi_sio usbserial ccm rfcomm snd_seq_dummy
snd_hrtimer xt_CHECKSUM xt_MASQUERADE nft_chain_nat nf_nat bridge stp llc c=
mac
algif_hash algif_skcipher af_alg qrtr ip6t_REJECT nf_reject_ipv6 xt_hl ip6t=
_rt
ipt_REJECT nf_reject_ipv4 xt_LOG bnep nf_log_syslog nft_limit xt_limit
xt_addrtype xt_tcpudp xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4
nft_compat nf_tables binfmt_misc intel_rapl_msr amd_atl intel_rapl_common
nls_iso8859_1 amdgpu snd_sof_amd_rembrandt snd_sof_amd_renoir
snd_hda_codec_realtek snd_sof_amd_acp snd_sof_pci snd_hda_codec_generic
snd_sof_xtensa_dsp snd_hda_scodec_component snd_sof snd_hda_codec_hdmi
snd_sof_utils snd_pci_ps snd_amd_sdw_acpi soundwire_amd
soundwire_generic_allocation snd_hda_intel soundwire_bus snd_intel_dspcfg
leds_cros_ec cros_usbpd_charger cros_ec_sysfs cros_ec_debugfs
led_class_multicolor cros_ec_chardev snd_intel_sdw_acpi cros_usbpd_logger
cros_ec_hwmon cros_charge_control gpio_cros_ec cros_usbpd_notify snd_soc_co=
re
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   snd_hda_codec btusb
edac_mce_amd mt7921e btrtl snd_compress snd_hda_core cros_ec_dev ac97_bus
mt7921_common btintel snd_pcm_dmaengine mt792x_lib snd_hwdep snd_rpl_pci_ac=
p6x
amdxcp mt76_connac_lib btbcm drm_exec snd_acp_pci snd_seq_midi btmtk kvm_amd
sch_fq_codel snd_seq_midi_event mt76 gpu_sched cros_ec_lpcs
snd_acp_legacy_common spd5118 drm_buddy snd_pci_acp6x bluetooth cros_ec
hid_sensor_als snd_rawmidi kvm hid_sensor_trigger snd_pcm drm_suballoc_help=
er
mac80211 snd_seq drm_ttm_helper snd_pci_acp5x industrialio_triggered_buffer=
 ttm
kfifo_buf amd_pmf snd_seq_device hid_sensor_iio_common rapl wmi_bmof
drm_display_helper industrialio snd_rn_pci_acp3x snd_timer amdtee
snd_acp_config cfg80211 input_leds snd_soc_acpi snd i2c_piix4 drm_kms_helper
libarc4 soundcore i2c_smbus snd_pci_acp3x ccp k10temp i2c_algo_bit amd_sfh =
tee
amd_pmc platform_profile joydev mac_hid msr parport_pc ppdev lp parport
nvme_fabrics efi_pstore nfnetlink dmi_sysfs ip_tables x_tables autofs4 btrfs
blake2b_generic xor raid6_pq libcrc32c
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -   dm_crypt hid_multitouch
hid_sensor_hub crct10dif_pclmul crc32_pclmul hid_generic polyval_clmulni
polyval_generic ucsi_acpi ghash_clmulni_intel i2c_hid_acpi nvme sha256_ssse3
usbhid i2c_hid typec_ucsi hid sha1_ssse3 thunderbolt nvme_core typec video =
drm
wmi aesni_intel crypto_simd cryptd
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  CR2: 0000000000000030
<4>1 2024-11-26T00:32:00+00:00 nvme3 kernel - - -  ---[ end trace
0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

