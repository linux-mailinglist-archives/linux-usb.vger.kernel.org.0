Return-Path: <linux-usb+bounces-37081-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAKOIk6K/GleRAAAu9opvQ
	(envelope-from <linux-usb+bounces-37081-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 14:49:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1234E872B
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 14:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C056F301C887
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 12:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874CE3F0A9F;
	Thu,  7 May 2026 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ehe+sRDn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EE03A783C
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 12:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158018; cv=none; b=VDqBSqihUOg49Lvqf9oTDvdV5Zg1Vw/wuaHsw45x4wRu2+Yd9fIeHe7A70eUttnX+aoKa+ap/HMgljr0ggfS26aTctmuFMii+t+kkot11PGFD0vVAMfjk2uQIYhjvRicG8GzutGNcBchayP15uFyKnQTfAzDyPxL4oz7zzHkSaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158018; c=relaxed/simple;
	bh=WSLyGmSi2DdonpdW0HLZxxXKvRc5qYsSCDSBFJ36gzw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VnxcJ7lWyUFNMyW8M8gYBhZRZHRzF5FdbaACarluh98A3+Fs4x70OvOSsWhW8vm6Eju0jov7Ib4Tutj04Kn+O7HTZfAnynZ6LST9+kLXEnxAPtczJj8YkYrqEO00PYTYathkANlKL/ljjLF3B4R0wLbYm0/5o6hnGS5sInacPdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ehe+sRDn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A21C3C2BCC4
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 12:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778158017;
	bh=WSLyGmSi2DdonpdW0HLZxxXKvRc5qYsSCDSBFJ36gzw=;
	h=From:To:Subject:Date:From;
	b=Ehe+sRDnVW0MDT6zD/fUBv6s0C5hHToq52HM1BikLWAFdzLhpLkIhji2LQlDeBMHG
	 jubaWcblqghyJZiULG/ai26O2Pj8x6LPvRUDIhODDHuG3VRWP6L7vHJIznaQHTCbQ3
	 Wn9CrB9oKnYbdho6i0frW81n1JYUwrCDrSKV2PDKEXK4pzrPs3gxu+Io1LUs66BAmx
	 jVVumqrbsQRIo1/VGWpdoJehXyAJJbXx/ADu3YOQjdi6W3Xjr/12jabf9r//KgQmMq
	 VBalJ6Svaytr3hDmmO7SBV2K2lLe3kyNF1RH+7OnFWvUgoBl8uzaw1+Zp5c7LQMQPe
	 eNmk/i9tpcU0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 90086C4160E; Thu,  7 May 2026 12:46:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221478] New: thunderbolt: tb_cfg_read warnings on ASUS TUF
 Gaming A16 FA608WV, kernel 6.12.86
Date: Thu, 07 May 2026 12:46:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: info@maketopsite.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221478-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: BB1234E872B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37081-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221478

            Bug ID: 221478
           Summary: thunderbolt: tb_cfg_read warnings on ASUS TUF Gaming
                    A16 FA608WV, kernel 6.12.86
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: info@maketopsite.com
        Regression: No

Kernel: 6.12.86 (vanilla), compiled on Fedora 43
Hardware: ASUS TUF Gaming A16 FA608WV
GPU: NVIDIA proprietary driver

Happens during first boot of this kernel. I didn't find this problem with o=
lder
6.12.x kernels (from COPR repo) in journalctl. I didn't try reboot or
sleep/suspend yet. No USB4/TB devices attached. System otherwise continues
booting normally.


May 07 13:40:29 maketopsite abrt-server[6999]: Can't find kernel package
corresponding to '6.12.86'
May 07 13:40:29 maketopsite abrt-dump-journal-oops[1790]:
abrt-dump-journal-oops: Creating problem directories
May 07 13:40:29 maketopsite abrt-dump-journal-oops[1790]:
abrt-dump-journal-oops: Found oopses: 2
May 07 13:40:28 maketopsite kernel: ---[ end trace 0000000000000000 ]---
May 07 13:40:28 maketopsite kernel:  </TASK>
May 07 13:40:28 maketopsite kernel: R13: 0000000000000030 R14: 00007fff7fea=
8d50
R15: 00005629584f42d7
May 07 13:40:28 maketopsite kernel: R10: 0000000000000000 R11: 000000000000=
0202
R12: 0000000000000030
May 07 13:40:28 maketopsite kernel: RBP: 00007fff7fea8720 R08: 000000000000=
0000
R09: 0000000000000000
May 07 13:40:28 maketopsite kernel: RDX: 0000000000000030 RSI: 00007fff7fea=
8d50
RDI: 0000000000000004
May 07 13:40:28 maketopsite kernel: RAX: ffffffffffffffda RBX: 000000000000=
0004
RCX: 00007f0ade2e8bbe
May 07 13:40:28 maketopsite kernel: RSP: 002b:00007fff7fea8710 EFLAGS: 0000=
0202
ORIG_RAX: 0000000000000000
May 07 13:40:28 maketopsite kernel: Code: 4d 89 d8 e8 34 bd 00 00 4c 8b 5d =
f8
41 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 11 c9 c3 0f 1f 8>
May 07 13:40:28 maketopsite kernel: RIP: 0033:0x7f0ade2e8bbe
May 07 13:40:28 maketopsite kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x=
7e
May 07 13:40:28 maketopsite kernel:  ? irqentry_exit_to_user_mode+0x2c/0x1c0
May 07 13:40:28 maketopsite kernel:  ? do_syscall_64+0x89/0x170
May 07 13:40:28 maketopsite kernel:  ? do_syscall_64+0x89/0x170
May 07 13:40:28 maketopsite kernel:  ? syscall_exit_to_user_mode+0x37/0x1c0
May 07 13:40:28 maketopsite kernel:  ? do_sys_openat2+0x96/0xe0
May 07 13:40:28 maketopsite kernel:  ? __pfx_kfree_link+0x10/0x10
May 07 13:40:28 maketopsite kernel:  ? do_filp_open+0xc5/0x160
May 07 13:40:28 maketopsite kernel:  ? __memcg_slab_free_hook+0x119/0x170
May 07 13:40:28 maketopsite kernel:  ? path_openat+0x47e/0x12f0
May 07 13:40:28 maketopsite kernel:  do_syscall_64+0x7d/0x170
May 07 13:40:28 maketopsite kernel:  ksys_read+0x75/0xf0
May 07 13:40:28 maketopsite kernel:  vfs_read+0x24c/0x380
May 07 13:40:28 maketopsite kernel:  kernfs_fop_read_iter+0xb7/0x1c0
May 07 13:40:28 maketopsite kernel:  pci_read_config+0x91/0x2a0
May 07 13:40:28 maketopsite kernel:  __pm_runtime_resume+0x52/0x90
May 07 13:40:28 maketopsite kernel:  rpm_resume+0x4b1/0x6d0
May 07 13:40:28 maketopsite kernel:  rpm_callback+0x63/0x70
May 07 13:40:28 maketopsite kernel:  ? __pfx_pci_pm_runtime_resume+0x10/0x10
May 07 13:40:28 maketopsite kernel:  __rpm_callback+0x41/0x160
May 07 13:40:28 maketopsite kernel:  ? __pfx_pci_pm_runtime_resume+0x10/0x10
May 07 13:40:28 maketopsite kernel:  ? __pfx_pci_pm_runtime_resume+0x10/0x10
May 07 13:40:28 maketopsite kernel:  tb_runtime_resume+0x32/0x120 [thunderb=
olt]
May 07 13:40:28 maketopsite kernel:  ? __pfx_pci_pm_runtime_resume+0x10/0x10
May 07 13:40:28 maketopsite kernel:  tb_switch_resume+0xe0/0x380 [thunderbo=
lt]
May 07 13:40:28 maketopsite kernel:  ? __pfx_pci_pm_runtime_resume+0x10/0x10
May 07 13:40:28 maketopsite kernel:  tb_switch_tmu_init+0xa6/0x4c0
[thunderbolt]

May 07 13:40:28 maketopsite kernel:  tb_port_find_cap+0xbd/0x210 [thunderbo=
lt]
May 07 13:40:28 maketopsite kernel:  <TASK>
May 07 13:40:28 maketopsite kernel: Call Trace:
May 07 13:40:28 maketopsite kernel: PKRU: 55555554
May 07 13:40:28 maketopsite kernel: CR2: 0000559b6bd0e4e0 CR3: 0000000124fa=
c000
CR4: 0000000000f50ef0
May 07 13:40:28 maketopsite kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
May 07 13:40:28 maketopsite kernel: FS:  00007f0ade277740(0000)
GS:ffff8b437e480000(0000) knlGS:0000000000000000
May 07 13:40:28 maketopsite kernel: R13: 0000000000000000 R14: 000000000000=
0000
R15: 0000000000000000
May 07 13:40:28 maketopsite kernel: R10: ffffffff91737c48 R11: 00000000ffff=
dfff
R12: 0000000000000001
May 07 13:40:28 maketopsite kernel: RBP: ffff8b3c46702480 R08: 000000000000=
0000
R09: ffffcd9ac82cf7d8
May 07 13:40:28 maketopsite kernel: RDX: ffff8b437e4a1948 RSI: 000000000000=
0001
RDI: ffff8b437e4a1940
May 07 13:40:28 maketopsite kernel: RAX: 0000000000000000 RBX: 000000000000=
0040
RCX: 0000000000000027
May 07 13:40:28 maketopsite kernel: RSP: 0018:ffffcd9ac82cf938 EFLAGS: 0001=
0246
May 07 13:40:28 maketopsite kernel: Code: 2b 14 25 28 00 00 00 75 61 48 83 =
c4
28 5b 5d 41 5c 41 5d c3 cc cc cc cc 89 c6 48 c7 c7 f7 6b a>
May 07 13:40:28 maketopsite kernel: RIP: 0010:tb_cfg_read+0xa1/0xf0
[thunderbolt]
May 07 13:40:28 maketopsite kernel: Hardware name: ASUSTeK COMPUTER INC. AS=
US
TUF Gaming A16 FA608WV_FA608WV/FA608WV, BIOS FA608WV.304 1>
May 07 13:40:28 maketopsite kernel: Tainted: [W]=3DWARN
May 07 13:40:28 maketopsite kernel: CPU: 13 UID: 0 PID: 6944 Comm:
nvidia-modprobe Tainted: G        W          6.12.86 #2
May 07 13:40:28 maketopsite kernel:  snd_pci_acp6x snd_pci_acp5x
snd_hda_codec_generic snd_rn_pci_acp3x snd_hda_scodec_component snd_acp>
May 07 13:40:28 maketopsite kernel: Modules linked in: overlay uinput rfcomm
snd_seq_dummy snd_hrtimer nf_conntrack_netbios_ns nf_conntr>
May 07 13:40:28 maketopsite kernel: WARNING: CPU: 13 PID: 6944 at
drivers/thunderbolt/ctl.c:1110 tb_cfg_read+0xa1/0xf0 [thunderbolt]
May 07 13:40:28 maketopsite kernel: tb_cfg_read: -5
May 07 13:40:28 maketopsite kernel: ------------[ cut here ]------------
May 07 13:40:28 maketopsite kernel: ---[ end trace 0000000000000000 ]---
May 07 13:40:28 maketopsite kernel:  </TASK>
May 07 13:40:28 maketopsite kernel: R13: 0000000000000030 R14: 00007fff7fea=
8d50
R15: 00005629584f42d7
May 07 13:40:28 maketopsite kernel: R10: 0000000000000000 R11: 000000000000=
0202
R12: 0000000000000030
May 07 13:40:28 maketopsite kernel: RBP: 00007fff7fea8720 R08: 000000000000=
0000
R09: 0000000000000000
May 07 13:40:28 maketopsite kernel: RDX: 0000000000000030 RSI: 00007fff7fea=
8d50
RDI: 0000000000000004
May 07 13:40:28 maketopsite kernel: RAX: ffffffffffffffda RBX: 000000000000=
0004
RCX: 00007f0ade2e8bbe
May 07 13:40:28 maketopsite kernel: RSP: 002b:00007fff7fea8710 EFLAGS: 0000=
0202
ORIG_RAX: 0000000000000000
May 07 13:40:28 maketopsite kernel: Code: 4d 89 d8 e8 34 bd 00 00 4c 8b 5d =
f8
41 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 11 c9 c3 0f 1f 8>
May 07 13:40:28 maketopsite kernel: RIP: 0033:0x7f0ade2e8bbe
May 07 13:40:28 maketopsite kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x=
7e
May 07 13:40:28 maketopsite kernel:  ? irqentry_exit_to_user_mode+0x2c/0x1c0
May 07 13:40:28 maketopsite kernel:  ? do_syscall_64+0x89/0x170
May 07 13:40:28 maketopsite kernel:  ? do_syscall_64+0x89/0x170
May 07 13:40:28 maketopsite kernel:  ? syscall_exit_to_user_mode+0x37/0x1c0
May 07 13:40:28 maketopsite kernel:  ? do_sys_openat2+0x96/0xe0
May 07 13:40:28 maketopsite kernel:  ? __pfx_kfree_link+0x10/0x10
May 07 13:40:28 maketopsite kernel:  ? do_filp_open+0xc5/0x160
May 07 13:40:28 maketopsite kernel:  ? __memcg_slab_free_hook+0x119/0x170
May 07 13:40:28 maketopsite kernel:  ? path_openat+0x47e/0x12f0
May 07 13:40:28 maketopsite kernel:  do_syscall_64+0x7d/0x170

May 07 13:40:28 maketopsite kernel:  ksys_read+0x75/0xf0
May 07 13:40:28 maketopsite kernel:  vfs_read+0x24c/0x380
May 07 13:40:28 maketopsite kernel:  kernfs_fop_read_iter+0xb7/0x1c0
May 07 13:40:28 maketopsite kernel:  pci_read_config+0x91/0x2a0
May 07 13:40:28 maketopsite kernel:  __pm_runtime_resume+0x52/0x90
May 07 13:40:28 maketopsite kernel:  rpm_resume+0x4b1/0x6d0
May 07 13:40:28 maketopsite kernel:  rpm_callback+0x63/0x70
May 07 13:40:28 maketopsite kernel:  ? __pfx_pci_pm_runtime_resume+0x10/0x10
May 07 13:40:28 maketopsite kernel:  __rpm_callback+0x41/0x160
May 07 13:40:28 maketopsite kernel:  ? __pfx_pci_pm_runtime_resume+0x10/0x10
May 07 13:40:28 maketopsite kernel:  ? __pfx_pci_pm_runtime_resume+0x10/0x10
May 07 13:40:28 maketopsite kernel:  tb_runtime_resume+0x32/0x120 [thunderb=
olt]
May 07 13:40:28 maketopsite kernel:  ? __pfx_pci_pm_runtime_resume+0x10/0x10
May 07 13:40:28 maketopsite kernel:  tb_switch_resume+0xe0/0x380 [thunderbo=
lt]
May 07 13:40:28 maketopsite kernel:  ? __pfx_pci_pm_runtime_resume+0x10/0x10
May 07 13:40:28 maketopsite kernel:  tb_switch_tmu_init+0xa6/0x4c0
[thunderbolt]
May 07 13:40:28 maketopsite kernel:  tb_port_find_cap+0xbd/0x210 [thunderbo=
lt]
May 07 13:40:28 maketopsite kernel:  tb_cfg_read+0x54/0xf0 [thunderbolt]
May 07 13:40:28 maketopsite kernel:  tb_cfg_read_raw+0x267/0x2c0 [thunderbo=
lt]
May 07 13:40:28 maketopsite kernel:  <TASK>
May 07 13:40:28 maketopsite kernel: Call Trace:
May 07 13:40:28 maketopsite kernel: PKRU: 55555554
May 07 13:40:28 maketopsite kernel: CR2: 0000559b6bd0e4e0 CR3: 0000000124fa=
c000
CR4: 0000000000f50ef0
May 07 13:40:28 maketopsite kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
May 07 13:40:28 maketopsite kernel: FS:  00007f0ade277740(0000)
GS:ffff8b437e480000(0000) knlGS:0000000000000000
May 07 13:40:28 maketopsite kernel: R13: 0000000000000000 R14: ffff8b3cca21=
7680
R15: ffffcd9ac82cf940
May 07 13:40:28 maketopsite kernel: R10: ffffffff91737c48 R11: 00000000ffff=
dfff
R12: 0000000000000001
May 07 13:40:28 maketopsite kernel: RBP: ffffcd9ac82cf7d4 R08: 000000000000=
0000
R09: ffffcd9ac82cf648
May 07 13:40:28 maketopsite kernel: RDX: ffff8b437e4a1948 RSI: 000000000000=
0001
RDI: ffff8b437e4a1940
May 07 13:40:28 maketopsite kernel: RAX: 0000000000000000 RBX: 000000000000=
0344
RCX: 0000000000000027
May 07 13:40:28 maketopsite kernel: RSP: 0018:ffffcd9ac82cf7a8 EFLAGS: 0001=
0246
May 07 13:40:28 maketopsite kernel: Code: 0b b8 fb ff ff ff c3 cc cc cc cc =
48
c7 c7 78 88 ad c1 e8 ac dd 68 cd 0f 0b eb e6 44 89 c6 48 c>
May 07 13:40:28 maketopsite kernel: RIP: 0010:check_config_address+0x77/0x90
[thunderbolt]
May 07 13:40:28 maketopsite kernel: Hardware name: ASUSTeK COMPUTER INC. AS=
US
TUF Gaming A16 FA608WV_FA608WV/FA608WV, BIOS FA608WV.304 1>
May 07 13:40:28 maketopsite kernel: CPU: 13 UID: 0 PID: 6944 Comm:
nvidia-modprobe Not tainted 6.12.86 #2
May 07 13:40:28 maketopsite kernel:  snd_pci_acp6x snd_pci_acp5x
snd_hda_codec_generic snd_rn_pci_acp3x snd_hda_scodec_component snd_acp>
May 07 13:40:28 maketopsite kernel: Modules linked in: overlay uinput rfcomm
snd_seq_dummy snd_hrtimer nf_conntrack_netbios_ns nf_conntr>
May 07 13:40:28 maketopsite kernel: WARNING: CPU: 13 PID: 6944 at
drivers/thunderbolt/ctl.c:227 check_config_address+0x77/0x90 [thunderb>
May 07 13:40:28 maketopsite kernel: wrong offset (expected 40, got 0
                            )
May 07 13:40:28 maketopsite kernel: ------------[ cut here ]------------
May 07 13:40:28 maketopsite kernel: thunderbolt 0000:67:00.5: 0: timeout
reading config space 1 from 0x0
May 07 13:40:26 maketopsite systemd[4740]: Started gvfs-metadata.service -
Virtual filesystem metadata service

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

