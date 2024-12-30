Return-Path: <linux-usb+bounces-18901-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA579FEB31
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2024 22:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C86F13A23E8
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2024 21:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8179019CC0C;
	Mon, 30 Dec 2024 21:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nW1c8Kzx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9FF1991A1
	for <linux-usb@vger.kernel.org>; Mon, 30 Dec 2024 21:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735595643; cv=none; b=abNAQQXlGSU639q/9sN//64NXfP0av7C+QJbHLp3rgxVCnMWpUPok0n96/ofyXcQQIowrloMLbDJiytdbfb7h8WpdOBkxLt/QTBh+YvbOeoAfc6mnrTFHAyH0gg8e4QMMJ650sPuZjuTTPB5vrfeL9W/babenNa01psvScC+pHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735595643; c=relaxed/simple;
	bh=IZevXrH4Uml0flC/5fjZo84S6DPAOQNJpbwFj/qxXgE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SURZRXqi0JdhBvE/x3KsLj8aktsuGjWa9kNEZDLy24Jd/+MaweRjfqT1Nxc7es+XeXrD6DwDc569PGtr3LU4XWm9ixNIJOW4AeB132VK5kOIzKpFoGa/ZileoA/4peq1PSbeBzHaRqtv89WO5XQ8ldekZagZcm1ZJ0OhZA3KjiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nW1c8Kzx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63C5BC4CED7
	for <linux-usb@vger.kernel.org>; Mon, 30 Dec 2024 21:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735595642;
	bh=IZevXrH4Uml0flC/5fjZo84S6DPAOQNJpbwFj/qxXgE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nW1c8KzxIFsjI8Z2Kg2Nu7Dl2H1gXTwotwb84iCIWkhQL/1Fl2sB+Tr6JLz3O9Q9U
	 zrUCZ85zwMwrADAjKye903x2ao0ZbDQJWZZVs2YWE7ZvfH+CjytEs71FWysRMBbKIo
	 P6LVr8oJ5660GMwSFxcn0kH+q9AFHKVOS4mNA8uBPSOAKfKJJyWm7Ff8mav2n60KmS
	 0tgvJhP6yXl7SULB4x4YLvfnapk6LqxJw3Zm8zBLXu52d+qtNsHrslw8Uz03ky3NSm
	 Rw1Nv+717ELgXND4tiEjIoDbUZ025Ut4cQx0yF96pl8kUoijDSHSTe4kJlWCF2xZHy
	 L5vCQlwwo/Yaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4AEBCC3279F; Mon, 30 Dec 2024 21:54:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error
Date: Mon, 30 Dec 2024 21:54:02 +0000
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
Message-ID: <bug-219590-208809-YMQGqZEM1b@https.bugzilla.kernel.org/>
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

--- Comment #1 from Guido (guido.iodice@gmail.com) ---
It seems that it is not the only problematic module...

30.12.2024 21:54:45:030 kernel  ------------[ cut here ]------------
30.12.2024 21:54:45:030 kernel  WARNING: CPU: 7 PID: 337 at
kernel/trace/trace_events.c:577 trace_event_raw_init+0x159/0x660
30.12.2024 21:54:45:030 kernel  Modules linked in: ee1004(+) intel_rapl_msr
iTCO_vendor_support intel_ishtp_hid xe(+) snd_hda_codec mei_hdcp dell_pc
aesni_intel mei_pxp ext4 platform_profile mac80211
processor_thermal_device_pci_legacy snd_hda_core gf128mul
processor_thermal_device crypto_simd processor_thermal_wt_hint
processor_thermal_rfim cryptd crc32c_generic snd_hwdep crc32c_intel rapl
libarc4 crc16 snd_pcm processor_thermal_rapl drm_gpuvm intel_cstate dell_la=
ptop
mbcache drm_exec dell_wmi jbd2 cfg80211 intel_rapl_common intel_uncore
dell_smbios snd_timer gpu_sched i2c_i801 processor_thermal_wt_req
intel_lpss_pci snd spi_nor i2c_smbus intel_lpss dcdbas
processor_thermal_power_floor drm_ttm_helper mousedev pcspkr psmouse
dell_wmi_ddv dell_smm_hwmon dell_wmi_sysman ucsi_acpi firmware_attributes_c=
lass
dell_wmi_descriptor wmi_bmof soundcore mtd rfkill i2c_mux mei_me intel_ish_=
ipc
typec_ucsi thunderbolt processor_thermal_mbox drm_suballoc_helper mei
intel_soc_dts_iosf typec idma64 intel_ishtp igen6_edac roles intel_pmc_core
intel_vsec
30.12.2024 21:54:45:030 kernel   intel_hid i2c_hid_acpi int3400_thermal
pmt_telemetry acpi_pad sparse_keymap acpi_tad acpi_thermal_rel int3403_ther=
mal
i2c_hid pmt_class pinctrl_tigerlake int340x_thermal_zone mac_hid tcp_bbr sc=
h_fq
uhid i2c_dev sg crypto_user dm_mod loop nfnetlink zram 842_decompress
842_compress ip_tables x_tables ums_realtek uas hid_generic usb_storage usb=
hid
f2fs crc32_generic lz4hc_compress lz4_compress intel_agp i915 nvme serio_raw
atkbd libps2 vivaldi_fmap nvme_core spi_intel_pci crc32_pclmul spi_intel
nvme_auth i8042 serio i2c_algo_bit drm_buddy video wmi ttm drm_display_help=
er
cec intel_gtt
30.12.2024 21:54:45:030 kernel  CPU: 7 UID: 0 PID: 337 Comm: (udev-worker)
Tainted: G     U             6.13.0-rc4-1-MANJARO #1
515edb1355c850f35d54202d85225258c9f8bcd2
30.12.2024 21:54:45:030 kernel  Tainted: [U]=3DUSER
30.12.2024 21:54:45:030 kernel  Hardware name: Dell Inc. Inspiron 5502/0WNV=
YK,
BIOS 1.33.1 11/15/2024
30.12.2024 21:54:45:030 kernel  RIP: 0010:trace_event_raw_init+0x159/0x660
30.12.2024 21:54:45:030 kernel  Code: 89 ea 0f 83 3b 04 00 00 e8 44 db ff f=
f 84
c0 74 10 8b 0c 24 48 c7 c0 fe ff ff ff 48 d3 c0 49 21 c6 4d 85 f6 0f 84 d6 =
fe
ff ff <0f> 0b bb 01 00 00 00 41 f6 c6 01 0f 85 77 0c d5 ff 66 0f 1f 44 00
30.12.2024 21:54:45:031 kernel  RSP: 0018:ffffa9c2c072fa80 EFLAGS: 00010206
30.12.2024 21:54:45:031 kernel  RAX: ffffffffffffffdf RBX: ffffffffc18eabd1
RCX: 0000000000000005
30.12.2024 21:54:45:031 kernel  RDX: 0000000000000002 RSI: 0000000000000001
RDI: ffffffffc18eabc7
30.12.2024 21:54:45:031 kernel  RBP: ffffffffc18eaae0 R08: 0000000000000039
R09: 0000000000000000
30.12.2024 21:54:45:031 kernel  R10: 0000000000000076 R11: 000000000000004e
R12: 00000000000000f2
30.12.2024 21:54:45:031 kernel  R13: ffffffffc18ebc00 R14: 0000000000000018
R15: 0000000000000000
30.12.2024 21:54:45:031 kernel  FS:  000075edb2cda880(0000)
GS:ffff9608ff780000(0000) knlGS:0000000000000000
30.12.2024 21:54:45:031 kernel  CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
30.12.2024 21:54:45:031 kernel  CR2: 00005cdbf6268648 CR3: 0000000160ec8004
CR4: 0000000000f70ef0
30.12.2024 21:54:45:031 kernel  PKRU: 55555554
30.12.2024 21:54:45:031 kernel  Call Trace:
30.12.2024 21:54:45:031 kernel   <TASK>
30.12.2024 21:54:45:031 kernel   ? trace_event_raw_init+0x159/0x660
30.12.2024 21:54:45:031 kernel   ? __warn.cold+0x93/0xf6
30.12.2024 21:54:45:031 kernel   ? trace_event_raw_init+0x159/0x660
30.12.2024 21:54:45:031 kernel   ? report_bug+0xff/0x140
30.12.2024 21:54:45:031 kernel   ? handle_bug+0x58/0x90
30.12.2024 21:54:45:031 kernel   ? exc_invalid_op+0x17/0x70
30.12.2024 21:54:45:031 kernel   ? asm_exc_invalid_op+0x1a/0x20
30.12.2024 21:54:45:031 kernel   ? trace_event_raw_init+0x159/0x660
30.12.2024 21:54:45:031 kernel   event_init+0x28/0x70
30.12.2024 21:54:45:031 kernel   trace_module_notify+0x1a4/0x250
30.12.2024 21:54:45:031 kernel   notifier_call_chain+0x5a/0xd0
30.12.2024 21:54:45:031 kernel   blocking_notifier_call_chain_robust+0x65/0=
xc0
30.12.2024 21:54:45:031 kernel   load_module+0x19e4/0x1e30
30.12.2024 21:54:45:031 kernel   ? __slab_free+0xdf/0x2f0
30.12.2024 21:54:45:031 kernel   ? init_module_from_file+0x89/0xe0
30.12.2024 21:54:45:031 kernel   init_module_from_file+0x89/0xe0
30.12.2024 21:54:45:031 kernel   idempotent_init_module+0x115/0x310
30.12.2024 21:54:45:031 kernel   __x64_sys_finit_module+0x65/0xc0
30.12.2024 21:54:45:031 kernel   do_syscall_64+0x82/0x190
30.12.2024 21:54:45:031 kernel   ? f2fs_llseek+0x3c/0x5f0 [f2fs
701ad704d498108fbe86dd92c040b46ed718418e]
30.12.2024 21:54:45:031 kernel   ? syscall_exit_to_user_mode+0x37/0x1c0
30.12.2024 21:54:45:031 kernel   ? clear_bhb_loop+0x25/0x80
30.12.2024 21:54:45:031 kernel   ? clear_bhb_loop+0x25/0x80
30.12.2024 21:54:45:031 kernel   ? clear_bhb_loop+0x25/0x80
30.12.2024 21:54:45:031 kernel   entry_SYSCALL_64_after_hwframe+0x76/0x7e
30.12.2024 21:54:45:031 kernel  RIP: 0033:0x75edb34d11fd
30.12.2024 21:54:45:031 kernel  Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 9=
0 f3
0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 =
08
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e3 fa 0c 00 f7 d8 64 89 01 48
30.12.2024 21:54:45:031 kernel  RSP: 002b:00007ffccf7c1618 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
30.12.2024 21:54:45:031 kernel  RAX: ffffffffffffffda RBX: 00005cdbf623fb40
RCX: 000075edb34d11fd
30.12.2024 21:54:45:031 kernel  RDX: 0000000000000004 RSI: 00005cdbf623c040
RDI: 000000000000001e
30.12.2024 21:54:45:031 kernel  RBP: 00007ffccf7c16d0 R08: 0000000000000001
R09: 00007ffccf7c1660
30.12.2024 21:54:45:031 kernel  R10: 0000000000000040 R11: 0000000000000246
R12: 00005cdbf623c040
30.12.2024 21:54:45:031 kernel  R13: 0000000000020000 R14: 00005cdbf6240510
R15: 00005cdbf6242ef0
30.12.2024 21:54:45:031 kernel   </TASK>
30.12.2024 21:54:45:031 kernel  ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

