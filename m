Return-Path: <linux-usb+bounces-31536-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD8ECC75E0
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 12:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7788A301764B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 11:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E224D33E360;
	Wed, 17 Dec 2025 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l+2tNbaE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q052NttM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1UTWEZdA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nyAtA4NV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A23B327C01
	for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 11:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765971521; cv=none; b=NIffbJJZvHveqaHCVBDt4eD+TMd+BmgPDyb0N4CTvH8D9ye4vII0acgU2XTmkWigEPoXfacqHMfBZCCSAQF4StET6xiMtMBl5cfuA6S5ZEbXyR2MugXIZFKuC0BGnlfC/yid90GbsPS2zVnD3vGvJKvwpdS+G25qAMTU3ZI0FVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765971521; c=relaxed/simple;
	bh=PDVuIdLpZIR4+23nA026w+rylMPpwAnwhuBUuvrIQ7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D7Tb1VNbG5yo0tTS4yD4FJThXV3r6Gpe8Cc28RBBsECLlEW3JpRYs7JNbnMywC5eTvSO6fsuppUflMCwlhPaStW5OJ03DJ4Y/jrAjJqdPHyITBJbGlsKxY5PVvg16M151bHnoki/BHu6VoAxIDP2ih4ZWsm+TZspzn7yvioW+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l+2tNbaE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q052NttM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1UTWEZdA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nyAtA4NV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 224885BD00;
	Wed, 17 Dec 2025 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765971509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Fv/6JkB9O5KLC5UUtabDh284M8MpKXZoC3xQZ5K3TYQ=;
	b=l+2tNbaEVD/lewfgjmbBvkokCzEuFIJibjZm1HPNwAWPZeqQ2XwEF8YbPswiiCh4T1dilW
	QR6sIXXni8OKwgnUq+AOhs/II/Y+gZteL1BAcimNWUETLdl6XSTF1heyfD4GYFL3PL4JzU
	V7OP2XbzKPOGRsb5R4lLuhPVKSR8mFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765971509;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Fv/6JkB9O5KLC5UUtabDh284M8MpKXZoC3xQZ5K3TYQ=;
	b=Q052NttMuYEmyiKl7AtWONYi8EY9cqYLuBbDHNcmn/qvOgI/H+46GEryWJhWwHSUpP31q1
	uXtdIzH09IAp32DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1UTWEZdA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nyAtA4NV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765971508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Fv/6JkB9O5KLC5UUtabDh284M8MpKXZoC3xQZ5K3TYQ=;
	b=1UTWEZdAwm0i3OIXtrySrjCEaKA9uzDAbc6Cn4qKizidbU931smQrt/5CAYsc9cgvURZCc
	MpyUlmRnfAi3Vi/wTlxz9GiPZjL8LPCEk1rEMX+WdxlTjp/FBQN9ggO6rZnk682RQKEFxI
	IvlgxxqOT8RIGgy/fYOekfZXi2CGvdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765971508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Fv/6JkB9O5KLC5UUtabDh284M8MpKXZoC3xQZ5K3TYQ=;
	b=nyAtA4NVJRMmXAJiilCn5w5potgWje7ryumKxIGaUItevZy16j1tOTFiLJefLaZL0FvlBP
	shAMLYDEk7/X7CBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FD223EA63;
	Wed, 17 Dec 2025 11:38:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2VQKGDOWQmlcaQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 17 Dec 2025 11:38:27 +0000
Date: Wed, 17 Dec 2025 11:38:25 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-usb@vger.kernel.org
Subject: ucsi oops on system resume (6.19-rc1)
Message-ID: <ac4m5qtjpnmx336r5astuxkvtqfjhlt6674odmtecsn2e6sqja@hndb7jdcqsp3>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ai25nyuffhvsi3e6"
Content-Disposition: inline
X-Spam-Flag: NO
X-Spam-Score: -2.31
X-Rspamd-Queue-Id: 224885BD00
X-Spamd-Result: default: False [-2.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MIME_BAD_ATTACHMENT(1.60)[config:application/x-config];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/x-config];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 


--ai25nyuffhvsi3e6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

as usual I'm running the -rc1 for this cycle. Found a nice fun oops in ucsi
code that brought the laptop to its knees:

Dec 17 11:01:13 pedro-suse kernel: PM: suspend exit
Dec 17 11:01:14 pedro-suse kernel: usb 1-5: reset full-speed USB device number 5 using xhci_hcd
Dec 17 11:01:17 pedro-suse kernel: ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)
Dec 17 11:01:17 pedro-suse kernel: BUG: kernel NULL pointer dereference, address: 0000000000000000
Dec 17 11:01:17 pedro-suse kernel: #PF: supervisor read access in kernel mode
Dec 17 11:01:17 pedro-suse kernel: #PF: error_code(0x0000) - not-present page
Dec 17 11:01:17 pedro-suse kernel: PGD 0 P4D 0
Dec 17 11:01:17 pedro-suse kernel: Oops: Oops: 0000 [#1] SMP NOPTI
Dec 17 11:01:17 pedro-suse kernel: CPU: 6 UID: 0 PID: 127156 Comm: kworker/6:15 Not tainted 6.19.0-rc1-1.g274aff5-default #1 PREEMPT(voluntary) openSUSE Tumbleweed (unreleased)  404a89cf98df507eb666b481fd923e4c0524c52b
Dec 17 11:01:17 pedro-suse kernel: Hardware name: LENOVO 21K6S0A00C/21K6S0A00C, BIOS R2FET65W (1.45 ) 07/31/2025
Dec 17 11:01:17 pedro-suse kernel: Workqueue: events_long ucsi_resume_work [typec_ucsi]
Dec 17 11:01:17 pedro-suse kernel: RIP: 0010:ucsi_sync_control_common+0x111/0x1d0 [typec_ucsi]
Dec 17 11:01:17 pedro-suse kernel: Code: ed 74 1b 48 8b 43 18 4c 89 ee 48 89 df 48 8b 40 08 2e 2e 2e ff d0 85 c0 0f 85 c4 00 00 00 48 8b 93 18 02 00 00 48 85 d2 74 9b <41> 8b 45 00 85 c0 79 93 48 8b 43 18 48 8d b3 18 01 00 00 48 89 df
Dec 17 11:01:17 pedro-suse kernel: RSP: 0018:ffffcacf6386fda8 EFLAGS: 00010202
Dec 17 11:01:17 pedro-suse kernel: RAX: 000000000000136b RBX: ffff8aca414aac00 RCX: ffffcacf6386fd08
Dec 17 11:01:17 pedro-suse kernel: RDX: 0000000000000010 RSI: ffffcacf6386fd50 RDI: ffff8aca414aacf8
Dec 17 11:01:17 pedro-suse kernel: RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
Dec 17 11:01:17 pedro-suse kernel: R10: 00002906b8fb0080 R11: 0000000000000000 R12: 0000000000000004
Dec 17 11:01:17 pedro-suse kernel: R13: 0000000000000000 R14: 0000000000000000 R15: ffff8aca414aac40
Dec 17 11:01:17 pedro-suse kernel: FS:  0000000000000000(0000) GS:ffff8ad8948a4000(0000) knlGS:0000000000000000
Dec 17 11:01:17 pedro-suse kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Dec 17 11:01:17 pedro-suse kernel: CR2: 0000000000000000 CR3: 00000008b3e38000 CR4: 0000000000f50ef0
Dec 17 11:01:17 pedro-suse kernel: PKRU: 55555554
Dec 17 11:01:17 pedro-suse kernel: Call Trace:
Dec 17 11:01:17 pedro-suse kernel:  <TASK>
Dec 17 11:01:17 pedro-suse kernel:  ucsi_run_command+0xea/0x160 [typec_ucsi 7cea3ba3027ec3f117ebc8d974a2455746436aa1]
Dec 17 11:01:17 pedro-suse kernel:  ucsi_send_command_common+0x6a/0x170 [typec_ucsi 7cea3ba3027ec3f117ebc8d974a2455746436aa1]
Dec 17 11:01:17 pedro-suse kernel:  ucsi_resume_work+0x2f/0x90 [typec_ucsi 7cea3ba3027ec3f117ebc8d974a2455746436aa1]
Dec 17 11:01:17 pedro-suse kernel:  process_one_work+0x193/0x350
Dec 17 11:01:17 pedro-suse kernel:  worker_thread+0x2d7/0x410
Dec 17 11:01:17 pedro-suse kernel:  ? __pfx_worker_thread+0x10/0x10
Dec 17 11:01:17 pedro-suse kernel:  kthread+0xfc/0x230
Dec 17 11:01:17 pedro-suse kernel:  ? __pfx_kthread+0x10/0x10
Dec 17 11:01:17 pedro-suse kernel:  ? __pfx_kthread+0x10/0x10
Dec 17 11:01:17 pedro-suse kernel:  ret_from_fork+0x243/0x280
Dec 17 11:01:17 pedro-suse kernel:  ? __pfx_kthread+0x10/0x10
Dec 17 11:01:17 pedro-suse kernel:  ret_from_fork_asm+0x1a/0x30
Dec 17 11:01:17 pedro-suse kernel:  </TASK>


I have only reproduced it once (now), but it may be reproducible. I had a USB-C
device plugged in before suspend, then on resume it wasn't there anymore.
Perhaps that was it?

Anyway, attaching more of the logs, and the config. Keep in mind the kernel
is very lightly patched, but at the moment it has nothing that relates to
USB.

Thanks!
Pedro

--ai25nyuffhvsi3e6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=logs
Content-Transfer-Encoding: quoted-printable

Dec 15 10:33:54 pedro-suse kernel: mhi mhi0: Requested to power ON
Dec 15 10:33:54 pedro-suse kernel: mhi mhi0: Power on setup success
Dec 15 10:33:54 pedro-suse kernel: r8152 8-1.4.4.3:1.0 eth0: v1.12.13
Dec 15 10:33:54 pedro-suse kernel: usbcore: registered new interface driver=
 r8152
Dec 15 10:33:54 pedro-suse kernel: usbcore: registered new interface driver=
 cdc_ether
Dec 15 10:33:54 pedro-suse kernel: usbcore: registered new interface driver=
 r8153_ecm
Dec 15 10:33:55 pedro-suse systemd-journald[889]: Received client request t=
o flush runtime journal.
Dec 15 10:33:55 pedro-suse kernel: usbcore: registered new interface driver=
 snd-usb-audio
Dec 15 10:33:55 pedro-suse kernel: audit: type=3D1400 audit(1765794835.284:=
3): avc:  denied  { read } for  pid=3D1204 comm=3D"alsactl" name=3D"asound.=
state" dev=3D"dm-0" ino=3D8532844 scontext=3Dsystem_u:system_r:alsa_t:s0-s0=
:c0.c1023 tcontext=3Dsystem_u:object_r:unlabeled_t:s0 tclass=3Dfile permiss=
ive=3D0
Dec 15 10:33:55 pedro-suse kernel: mhi mhi0: Wait for device to enter SBL o=
r Mission mode
Dec 15 10:33:56 pedro-suse kernel: ath11k_pci 0000:02:00.0: chip_id 0x12 ch=
ip_family 0xb board_id 0xff soc_id 0x400c1211
Dec 15 10:33:56 pedro-suse kernel: ath11k_pci 0000:02:00.0: fw_version 0x11=
088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-Q=
CAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
Dec 15 10:33:56 pedro-suse kernel: ath11k_pci 0000:02:00.0 wlp2s0: renamed =
=66rom wlan0
Dec 15 10:33:56 pedro-suse kernel: ath11k_pci 0000:02:00.0: Failed to set t=
he requested Country regulatory setting
Dec 15 10:33:56 pedro-suse kernel: ath11k_pci 0000:02:00.0: failed to proce=
ss regulatory info -22
Dec 15 10:33:56 pedro-suse kernel: ath11k_pci 0000:02:00.0: Failed to set t=
he requested Country regulatory setting
Dec 15 10:33:56 pedro-suse kernel: ath11k_pci 0000:02:00.0: failed to proce=
ss regulatory info -22
Dec 15 10:33:56 pedro-suse kernel: nvme nvme0: using unchecked data buffer
Dec 15 10:33:56 pedro-suse kernel: Bluetooth: BNEP (Ethernet Emulation) ver=
 1.3
Dec 15 10:33:56 pedro-suse kernel: Bluetooth: BNEP filters: protocol multic=
ast
Dec 15 10:33:56 pedro-suse kernel: Bluetooth: BNEP socket layer initialized
Dec 15 10:33:56 pedro-suse kernel: Bluetooth: MGMT ver 1.23
Dec 15 10:33:56 pedro-suse kernel: NET: Registered PF_ALG protocol family
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1: pciehp: Slot(0): =
Card present
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1: pciehp: Slot(0): =
Link Up
Dec 15 10:33:56 pedro-suse kernel: NOTICE: Automounting of tracing to debug=
fs is deprecated and will be removed in 2030
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: [8086:0b26] type 01 cl=
ass 0x060400 PCIe Switch Upstream Port
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: PCI bridge to [bus 00]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0:   bridge window [io  0=
x0000-0x0fff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0:   bridge window [mem 0=
x00000000-0x000fffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0:   bridge window [mem 0=
x00000000-0x000fffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: enabling Extended Tags
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: supports D1 D2
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: PME# supported from D0=
 D1 D2 D3hot D3cold
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: 2.000 Gb/s available P=
CIe bandwidth, limited by 2.5 GT/s PCIe x1 link at 0000:00:04.1 (capable of=
 8.000 Gb/s with 2.5 GT/s PCIe x4 link)
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: Adding to iommu group 6
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1: ASPM: current com=
mon clock configuration is inconsistent, reconfiguring
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: bridge configuration i=
nvalid ([bus 00-00]), reconfiguring
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: [8086:0b26] type 01 cl=
ass 0x060400 PCIe Switch Downstream Port
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: PCI bridge to [bus 00]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0:   bridge window [io  0=
x0000-0x0fff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0:   bridge window [mem 0=
x00000000-0x000fffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0:   bridge window [mem 0=
x00000000-0x000fffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: enabling Extended Tags
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: supports D1 D2
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: PME# supported from D0=
 D1 D2 D3hot D3cold
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: Adding to iommu group 6
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: [8086:0b26] type 01 cl=
ass 0x060400 PCIe Switch Downstream Port
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: PCI bridge to [bus 00]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0:   bridge window [io  0=
x0000-0x0fff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0:   bridge window [mem 0=
x00000000-0x000fffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0:   bridge window [mem 0=
x00000000-0x000fffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: enabling Extended Tags
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: supports D1 D2
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: PME# supported from D0=
 D1 D2 D3hot D3cold
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: Adding to iommu group 6
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: [8086:0b26] type 01 cl=
ass 0x060400 PCIe Switch Downstream Port
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: PCI bridge to [bus 00]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0:   bridge window [io  0=
x0000-0x0fff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0:   bridge window [mem 0=
x00000000-0x000fffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0:   bridge window [mem 0=
x00000000-0x000fffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: enabling Extended Tags
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: supports D1 D2
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: PME# supported from D0=
 D1 D2 D3hot D3cold
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: Adding to iommu group 6
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: [8086:0b26] type 01 cl=
ass 0x060400 PCIe Switch Downstream Port
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: PCI bridge to [bus 00]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0:   bridge window [io  0=
x0000-0x0fff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0:   bridge window [mem 0=
x00000000-0x000fffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0:   bridge window [mem 0=
x00000000-0x000fffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: enabling Extended Tags
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: supports D1 D2
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: PME# supported from D0=
 D1 D2 D3hot D3cold
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: Adding to iommu group 6
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: [8086:0b26] type 01 cl=
ass 0x060400 PCIe Switch Downstream Port
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: PCI bridge to [bus 00]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0:   bridge window [io  0=
x0000-0x0fff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0:   bridge window [mem 0=
x00000000-0x000fffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0:   bridge window [mem 0=
x00000000-0x000fffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: enabling Extended Tags
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: supports D1 D2
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: PME# supported from D0=
 D1 D2 D3hot D3cold
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: Adding to iommu group 6
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: PCI bridge to [bus 05-=
63]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: bridge configuration i=
nvalid ([bus 00-00]), reconfiguring
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: bridge configuration i=
nvalid ([bus 00-00]), reconfiguring
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: bridge configuration i=
nvalid ([bus 00-00]), reconfiguring
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: bridge configuration i=
nvalid ([bus 00-00]), reconfiguring
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: bridge configuration i=
nvalid ([bus 00-00]), reconfiguring
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: PCI bridge to [bus 06-=
63]
Dec 15 10:33:56 pedro-suse kernel: pci_bus 0000:06: busn_res: [bus 06-63] e=
nd is updated to 06
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: PCI bridge to [bus 07-=
63]
Dec 15 10:33:56 pedro-suse kernel: pci_bus 0000:07: busn_res: [bus 07-63] e=
nd is updated to 25
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: PCI bridge to [bus 26-=
63]
Dec 15 10:33:56 pedro-suse kernel: pci_bus 0000:26: busn_res: [bus 26-63] e=
nd is updated to 44
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: PCI bridge to [bus 45-=
63]
Dec 15 10:33:56 pedro-suse kernel: pci_bus 0000:45: busn_res: [bus 45-63] e=
nd is updated to 62
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: PCI bridge to [bus 63]
Dec 15 10:33:56 pedro-suse kernel: pci_bus 0000:63: busn_res: [bus 63] end =
is updated to 63
Dec 15 10:33:56 pedro-suse kernel: pci_bus 0000:05: busn_res: [bus 05-63] e=
nd is updated to 63
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: bridge window [mem 0x0=
0100000-0x001fffff 64bit pref] to [bus 07-25] add_size 100000 add_align 100=
000
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: bridge window [mem 0x0=
0100000-0x001fffff] to [bus 07-25] add_size 100000 add_align 100000
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: bridge window [mem 0x0=
0100000-0x001fffff 64bit pref] to [bus 26-44] add_size 100000 add_align 100=
000
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: bridge window [mem 0x0=
0100000-0x001fffff] to [bus 26-44] add_size 100000 add_align 100000
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: bridge window [mem 0x0=
0100000-0x001fffff 64bit pref] to [bus 45-62] add_size 100000 add_align 100=
000
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: bridge window [mem 0x0=
0100000-0x001fffff] to [bus 45-62] add_size 100000 add_align 100000
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: bridge window [mem 0x0=
0100000-0x005fffff 64bit pref] to [bus 05-63] add_size 300000 add_align 100=
000
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: bridge window [mem 0x0=
0100000-0x005fffff] to [bus 05-63] add_size 300000 add_align 100000
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: bridge window [mem 0x6=
0000000-0x77ffffff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: bridge window [mem 0x1=
400000000-0x23ffffffff 64bit pref]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: bridge window [io  siz=
e 0x5000]: can't assign; no space
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: bridge window [io  siz=
e 0x5000]: failed to assign
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: bridge window [io  siz=
e 0x5000]: can't assign; no space
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: bridge window [io  siz=
e 0x5000]: failed to assign
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: bridge window [mem 0x6=
0000000-0x600fffff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: bridge window [mem 0x1=
400000000-0x14000fffff 64bit pref]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: bridge window [mem 0x6=
0100000-0x67ffffff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: bridge window [mem 0x1=
400100000-0x19554fffff 64bit pref]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: bridge window [mem 0x6=
8000000-0x6fefffff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: bridge window [mem 0x1=
955500000-0x1eaa8fffff 64bit pref]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: bridge window [mem 0x6=
ff00000-0x77dfffff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: bridge window [mem 0x1=
eaa900000-0x23ffcfffff 64bit pref]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: bridge window [mem 0x7=
7e00000-0x77efffff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: bridge window [mem 0x2=
3ffd00000-0x23ffdfffff 64bit pref]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: bridge window [io  siz=
e 0x1000]: can't assign; no space
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: bridge window [io  siz=
e 0x1000]: failed to assign
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: bridge window [io  siz=
e 0x1000]: can't assign; no space
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: bridge window [io  siz=
e 0x1000]: failed to assign
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: bridge window [io  siz=
e 0x1000]: can't assign; no space
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: bridge window [io  siz=
e 0x1000]: failed to assign
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: bridge window [io  siz=
e 0x1000]: can't assign; no space
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: bridge window [io  siz=
e 0x1000]: failed to assign
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: bridge window [io  siz=
e 0x1000]: can't assign; no space
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: bridge window [io  siz=
e 0x1000]: failed to assign
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: bridge window [io  siz=
e 0x1000]: can't assign; no space
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: bridge window [io  siz=
e 0x1000]: failed to assign
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: bridge window [io  siz=
e 0x1000]: can't assign; no space
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: bridge window [io  siz=
e 0x1000]: failed to assign
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: bridge window [io  siz=
e 0x1000]: can't assign; no space
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: bridge window [io  siz=
e 0x1000]: failed to assign
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: bridge window [io  siz=
e 0x1000]: can't assign; no space
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: bridge window [io  siz=
e 0x1000]: failed to assign
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: bridge window [io  siz=
e 0x1000]: can't assign; no space
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: bridge window [io  siz=
e 0x1000]: failed to assign
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: PCI bridge to [bus 06]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0:   bridge window [mem 0=
x60000000-0x600fffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0:   bridge window [mem 0=
x1400000000-0x14000fffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: PCI bridge to [bus 07-=
25]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0:   bridge window [mem 0=
x60100000-0x67ffffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0:   bridge window [mem 0=
x1400100000-0x19554fffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: PCI bridge to [bus 26-=
44]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0:   bridge window [mem 0=
x68000000-0x6fefffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0:   bridge window [mem 0=
x1955500000-0x1eaa8fffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: PCI bridge to [bus 45-=
62]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0:   bridge window [mem 0=
x6ff00000-0x77dfffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0:   bridge window [mem 0=
x1eaa900000-0x23ffcfffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: PCI bridge to [bus 63]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0:   bridge window [mem 0=
x77e00000-0x77efffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0:   bridge window [mem 0=
x23ffd00000-0x23ffdfffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: PCI bridge to [bus 05-=
63]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0:   bridge window [mem 0=
x60000000-0x77ffffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0:   bridge window [mem 0=
x1400000000-0x23ffffffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1: PCI bridge to [bu=
s 04-63]
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1:   bridge window [=
io  0x2000-0x5fff]
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1:   bridge window [=
mem 0x60000000-0x77ffffff]
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1:   bridge window [=
mem 0x1400000000-0x23ffffffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: PCI: No. 2 try to assign unassigned res
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1: bridge window [io=
  0x2000-0x5fff]: releasing
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1: bridge window [io=
  0x7000-0xbfff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: bridge window [io  0x7=
000-0xbfff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: bridge window [io  0x7=
000-0x7fff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: bridge window [io  0x8=
000-0x8fff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: bridge window [io  0x9=
000-0x9fff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: bridge window [io  0xa=
000-0xafff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: bridge window [io  0xb=
000-0xbfff]: assigned
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0: PCI bridge to [bus 06]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0:   bridge window [io  0=
x7000-0x7fff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0:   bridge window [mem 0=
x60000000-0x600fffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:00.0:   bridge window [mem 0=
x1400000000-0x14000fffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0: PCI bridge to [bus 07-=
25]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0:   bridge window [io  0=
x8000-0x8fff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0:   bridge window [mem 0=
x60100000-0x67ffffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:01.0:   bridge window [mem 0=
x1400100000-0x19554fffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0: PCI bridge to [bus 26-=
44]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0:   bridge window [io  0=
x9000-0x9fff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0:   bridge window [mem 0=
x68000000-0x6fefffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:02.0:   bridge window [mem 0=
x1955500000-0x1eaa8fffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0: PCI bridge to [bus 45-=
62]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0:   bridge window [io  0=
xa000-0xafff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0:   bridge window [mem 0=
x6ff00000-0x77dfffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:03.0:   bridge window [mem 0=
x1eaa900000-0x23ffcfffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0: PCI bridge to [bus 63]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0:   bridge window [io  0=
xb000-0xbfff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0:   bridge window [mem 0=
x77e00000-0x77efffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:05:04.0:   bridge window [mem 0=
x23ffd00000-0x23ffdfffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0: PCI bridge to [bus 05-=
63]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0:   bridge window [io  0=
x7000-0xbfff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0:   bridge window [mem 0=
x60000000-0x77ffffff]
Dec 15 10:33:56 pedro-suse kernel: pci 0000:04:00.0:   bridge window [mem 0=
x1400000000-0x23ffffffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1: PCI bridge to [bu=
s 04-63]
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1:   bridge window [=
io  0x7000-0xbfff]
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1:   bridge window [=
mem 0x60000000-0x77ffffff]
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:00:04.1:   bridge window [=
mem 0x1400000000-0x23ffffffff 64bit pref]
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:04:00.0: enabling device (=
0000 -> 0003)
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:05:00.0: enabling device (=
0000 -> 0003)
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:05:01.0: enabling device (=
0000 -> 0003)
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:05:01.0: pciehp: Slot #1 A=
ttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoComp=
l+ IbPresDis- LLActRep+
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:05:02.0: enabling device (=
0000 -> 0003)
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:05:02.0: pciehp: Slot #2 A=
ttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoComp=
l+ IbPresDis- LLActRep+
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:05:03.0: enabling device (=
0000 -> 0003)
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:05:03.0: pciehp: Slot #3 A=
ttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoComp=
l+ IbPresDis- LLActRep+
Dec 15 10:33:56 pedro-suse kernel: pcieport 0000:05:04.0: enabling device (=
0000 -> 0003)
Dec 15 10:33:56 pedro-suse kernel: Generic FE-GE Realtek PHY r8169-0-100:00=
: attached PHY driver (mii_bus:phy_addr=3Dr8169-0-100:00, irq=3DMAC)
Dec 15 10:33:57 pedro-suse kernel: r8169 0000:01:00.0 enp1s0f0: Link is Down
Dec 15 10:33:57 pedro-suse kernel: NET: Registered PF_PACKET protocol family
Dec 15 10:33:58 pedro-suse kernel: tun: Universal TUN/TAP device driver, 1.6
Dec 15 10:34:08 pedro-suse kernel: wlp2s0: authenticate with c0:06:c3:5a:f8=
:d8 (local address=3D8c:3b:4a:4c:a2:20)
Dec 15 10:34:08 pedro-suse kernel: wlp2s0: send auth to c0:06:c3:5a:f8:d8 (=
try 1/3)
Dec 15 10:34:08 pedro-suse kernel: wlp2s0: authenticated
Dec 15 10:34:08 pedro-suse kernel: wlp2s0: associating to AP c0:06:c3:5a:f8=
:d8 with corrupt probe response
Dec 15 10:34:08 pedro-suse kernel: wlp2s0: associate with c0:06:c3:5a:f8:d8=
 (try 1/3)
Dec 15 10:34:08 pedro-suse kernel: wlp2s0: RX AssocResp from c0:06:c3:5a:f8=
:d8 (capab=3D0x411 status=3D0 aid=3D2)
Dec 15 10:34:08 pedro-suse kernel: wlp2s0: associated
Dec 15 10:34:09 pedro-suse kernel: rfkill: input handler disabled
Dec 15 10:34:09 pedro-suse kernel: [drm] pre_validate_dsc:1747 MST_DSC no m=
ode changed for stream 0x00000000a97444fc
Dec 15 10:34:09 pedro-suse kernel: HDR SB:01 1a 02 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 15 10:34:09 pedro-suse kernel: HDR SB:00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 15 10:34:10 pedro-suse kernel: Bluetooth: RFCOMM TTY layer initialized
Dec 15 10:34:10 pedro-suse kernel: Bluetooth: RFCOMM socket layer initializ=
ed
Dec 15 10:34:10 pedro-suse kernel: Bluetooth: RFCOMM ver 1.11
Dec 15 10:34:10 pedro-suse kernel: SCSI subsystem initialized
Dec 15 10:34:10 pedro-suse kernel: alua: device handler registered
Dec 15 10:34:10 pedro-suse kernel: rdac: device handler registered
Dec 15 10:34:10 pedro-suse kernel: emc: device handler registered
Dec 15 10:34:10 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 10:34:10 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 10:34:10 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 10:34:11 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 10:34:11 pedro-suse kernel: hid-generic 0003:17EF:30B4.000C: hiddev9=
9,hidraw9: USB HID v1.11 Device [Lenovo     ThinkPad Thunderbolt 4 Dock MCU=
 Controller2] on usb-0000:66:00.4-1.1/input0
Dec 15 10:34:15 pedro-suse kernel: HDR SB:01 1a 02 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 15 10:34:15 pedro-suse kernel: HDR SB:00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 15 10:34:15 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 10:34:15 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 10:34:15 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 10:34:21 pedro-suse kernel: warning: `ThreadPoolForeg' uses wireless=
 extensions which will stop working for Wi-Fi 7 hardware; use nl80211
Dec 15 10:46:26 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 15 11:01:26 pedro-suse kernel: usb 1-2: USB disconnect, device number 3
Dec 15 11:01:26 pedro-suse kernel: usb 1-2: new full-speed USB device numbe=
r 7 using xhci_hcd
Dec 15 11:01:26 pedro-suse kernel: usb 1-2: New USB device found, idVendor=
=3D1038, idProduct=3D161a, bcdDevice=3D 0.28
Dec 15 11:01:26 pedro-suse kernel: usb 1-2: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 15 11:01:26 pedro-suse kernel: usb 1-2: Product: SteelSeries Apex 3
Dec 15 11:01:26 pedro-suse kernel: usb 1-2: Manufacturer: SteelSeries
Dec 15 11:01:26 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.0/0003:1038:1=
61A.000D/input/input27
Dec 15 11:01:26 pedro-suse kernel: hid-generic 0003:1038:161A.000D: input,h=
idraw5: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input0
Dec 15 11:01:26 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.1/0003:1038:1=
61A.000E/input/input28
Dec 15 11:01:26 pedro-suse kernel: hid-generic 0003:1038:161A.000E: input,h=
idraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input1
Dec 15 11:01:26 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Co=
nsumer Control as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-=
2:1.2/0003:1038:161A.000F/input/input29
Dec 15 11:01:26 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Mo=
use as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.2/0003:=
1038:161A.000F/input/input30
Dec 15 11:01:26 pedro-suse kernel: hid-generic 0003:1038:161A.000F: input,h=
idraw7: USB HID v1.11 Mouse [SteelSeries SteelSeries Apex 3] on usb-0000:64=
:00.3-2/input2
Dec 15 11:01:26 pedro-suse kernel: hid-generic 0003:1038:161A.0010: hiddev9=
8,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Apex 3] on usb-000=
0:64:00.3-2/input3
Dec 15 11:44:54 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 15 12:45:08 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 15 13:45:47 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 15 14:46:09 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 15 14:48:07 pedro-suse kernel: usb 1-2: USB disconnect, device number 7
Dec 15 14:48:07 pedro-suse kernel: usb 1-2: new full-speed USB device numbe=
r 8 using xhci_hcd
Dec 15 14:48:07 pedro-suse kernel: usb 1-2: New USB device found, idVendor=
=3D1038, idProduct=3D161a, bcdDevice=3D 0.28
Dec 15 14:48:07 pedro-suse kernel: usb 1-2: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 15 14:48:07 pedro-suse kernel: usb 1-2: Product: SteelSeries Apex 3
Dec 15 14:48:07 pedro-suse kernel: usb 1-2: Manufacturer: SteelSeries
Dec 15 14:48:07 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.0/0003:1038:1=
61A.0011/input/input31
Dec 15 14:48:07 pedro-suse kernel: hid-generic 0003:1038:161A.0011: input,h=
idraw5: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input0
Dec 15 14:48:07 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.1/0003:1038:1=
61A.0012/input/input32
Dec 15 14:48:07 pedro-suse kernel: hid-generic 0003:1038:161A.0012: input,h=
idraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input1
Dec 15 14:48:07 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Co=
nsumer Control as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-=
2:1.2/0003:1038:161A.0013/input/input33
Dec 15 14:48:07 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Mo=
use as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.2/0003:=
1038:161A.0013/input/input34
Dec 15 14:48:07 pedro-suse kernel: hid-generic 0003:1038:161A.0013: input,h=
idraw7: USB HID v1.11 Mouse [SteelSeries SteelSeries Apex 3] on usb-0000:64=
:00.3-2/input2
Dec 15 14:48:07 pedro-suse kernel: hid-generic 0003:1038:161A.0014: hiddev9=
8,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Apex 3] on usb-000=
0:64:00.3-2/input3
Dec 15 15:00:39 pedro-suse kernel: BTRFS warning (device dm-0): qgroup mark=
ed inconsistent, qgroup inherit needs a rescan
Dec 15 15:01:18 pedro-suse kernel: usb 1-2: USB disconnect, device number 8
Dec 15 15:01:18 pedro-suse kernel: usb 1-2: new full-speed USB device numbe=
r 9 using xhci_hcd
Dec 15 15:01:18 pedro-suse kernel: usb 1-2: New USB device found, idVendor=
=3D1038, idProduct=3D161a, bcdDevice=3D 0.28
Dec 15 15:01:18 pedro-suse kernel: usb 1-2: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 15 15:01:18 pedro-suse kernel: usb 1-2: Product: SteelSeries Apex 3
Dec 15 15:01:18 pedro-suse kernel: usb 1-2: Manufacturer: SteelSeries
Dec 15 15:01:18 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.0/0003:1038:1=
61A.0015/input/input35
Dec 15 15:01:19 pedro-suse kernel: hid-generic 0003:1038:161A.0015: input,h=
idraw5: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input0
Dec 15 15:01:19 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.1/0003:1038:1=
61A.0016/input/input36
Dec 15 15:01:19 pedro-suse kernel: hid-generic 0003:1038:161A.0016: input,h=
idraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input1
Dec 15 15:01:19 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Co=
nsumer Control as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-=
2:1.2/0003:1038:161A.0017/input/input37
Dec 15 15:01:19 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Mo=
use as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.2/0003:=
1038:161A.0017/input/input38
Dec 15 15:01:19 pedro-suse kernel: hid-generic 0003:1038:161A.0017: input,h=
idraw7: USB HID v1.11 Mouse [SteelSeries SteelSeries Apex 3] on usb-0000:64=
:00.3-2/input2
Dec 15 15:01:19 pedro-suse kernel: hid-generic 0003:1038:161A.0018: hiddev9=
8,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Apex 3] on usb-000=
0:64:00.3-2/input3
Dec 15 15:04:03 pedro-suse kernel: usb 1-2: USB disconnect, device number 9
Dec 15 15:04:04 pedro-suse kernel: usb 1-2: new full-speed USB device numbe=
r 10 using xhci_hcd
Dec 15 15:04:04 pedro-suse kernel: usb 1-2: New USB device found, idVendor=
=3D1038, idProduct=3D161a, bcdDevice=3D 0.28
Dec 15 15:04:04 pedro-suse kernel: usb 1-2: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 15 15:04:04 pedro-suse kernel: usb 1-2: Product: SteelSeries Apex 3
Dec 15 15:04:04 pedro-suse kernel: usb 1-2: Manufacturer: SteelSeries
Dec 15 15:04:04 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.0/0003:1038:1=
61A.0019/input/input39
Dec 15 15:04:04 pedro-suse kernel: hid-generic 0003:1038:161A.0019: input,h=
idraw5: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input0
Dec 15 15:04:04 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.1/0003:1038:1=
61A.001A/input/input40
Dec 15 15:04:04 pedro-suse kernel: hid-generic 0003:1038:161A.001A: input,h=
idraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input1
Dec 15 15:04:04 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Co=
nsumer Control as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-=
2:1.2/0003:1038:161A.001B/input/input41
Dec 15 15:04:04 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Mo=
use as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.2/0003:=
1038:161A.001B/input/input42
Dec 15 15:04:04 pedro-suse kernel: hid-generic 0003:1038:161A.001B: input,h=
idraw7: USB HID v1.11 Mouse [SteelSeries SteelSeries Apex 3] on usb-0000:64=
:00.3-2/input2
Dec 15 15:04:04 pedro-suse kernel: hid-generic 0003:1038:161A.001C: hiddev9=
8,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Apex 3] on usb-000=
0:64:00.3-2/input3
Dec 15 15:37:57 pedro-suse kernel: usb 1-2: USB disconnect, device number 10
Dec 15 15:37:57 pedro-suse kernel: usb 1-2: new full-speed USB device numbe=
r 11 using xhci_hcd
Dec 15 15:37:57 pedro-suse kernel: usb 1-2: New USB device found, idVendor=
=3D1038, idProduct=3D161a, bcdDevice=3D 0.28
Dec 15 15:37:57 pedro-suse kernel: usb 1-2: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 15 15:37:57 pedro-suse kernel: usb 1-2: Product: SteelSeries Apex 3
Dec 15 15:37:57 pedro-suse kernel: usb 1-2: Manufacturer: SteelSeries
Dec 15 15:37:57 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.0/0003:1038:1=
61A.001D/input/input43
Dec 15 15:37:57 pedro-suse kernel: hid-generic 0003:1038:161A.001D: input,h=
idraw5: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input0
Dec 15 15:37:57 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.1/0003:1038:1=
61A.001E/input/input44
Dec 15 15:37:57 pedro-suse kernel: hid-generic 0003:1038:161A.001E: input,h=
idraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input1
Dec 15 15:37:57 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Co=
nsumer Control as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-=
2:1.2/0003:1038:161A.001F/input/input45
Dec 15 15:37:57 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Mo=
use as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.2/0003:=
1038:161A.001F/input/input46
Dec 15 15:37:57 pedro-suse kernel: hid-generic 0003:1038:161A.001F: input,h=
idraw7: USB HID v1.11 Mouse [SteelSeries SteelSeries Apex 3] on usb-0000:64=
:00.3-2/input2
Dec 15 15:37:57 pedro-suse kernel: hid-generic 0003:1038:161A.0020: hiddev9=
8,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Apex 3] on usb-000=
0:64:00.3-2/input3
Dec 15 15:43:57 pedro-suse kernel: usb 1-2: USB disconnect, device number 11
Dec 15 15:43:58 pedro-suse kernel: usb 1-2: new full-speed USB device numbe=
r 12 using xhci_hcd
Dec 15 15:43:58 pedro-suse kernel: usb 1-2: New USB device found, idVendor=
=3D1038, idProduct=3D161a, bcdDevice=3D 0.28
Dec 15 15:43:58 pedro-suse kernel: usb 1-2: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 15 15:43:58 pedro-suse kernel: usb 1-2: Product: SteelSeries Apex 3
Dec 15 15:43:58 pedro-suse kernel: usb 1-2: Manufacturer: SteelSeries
Dec 15 15:43:58 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.0/0003:1038:1=
61A.0021/input/input47
Dec 15 15:43:58 pedro-suse kernel: hid-generic 0003:1038:161A.0021: input,h=
idraw5: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input0
Dec 15 15:43:58 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.1/0003:1038:1=
61A.0022/input/input48
Dec 15 15:43:58 pedro-suse kernel: hid-generic 0003:1038:161A.0022: input,h=
idraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input1
Dec 15 15:43:58 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Co=
nsumer Control as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-=
2:1.2/0003:1038:161A.0023/input/input49
Dec 15 15:43:58 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Mo=
use as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.2/0003:=
1038:161A.0023/input/input50
Dec 15 15:43:58 pedro-suse kernel: hid-generic 0003:1038:161A.0023: input,h=
idraw7: USB HID v1.11 Mouse [SteelSeries SteelSeries Apex 3] on usb-0000:64=
:00.3-2/input2
Dec 15 15:43:58 pedro-suse kernel: hid-generic 0003:1038:161A.0024: hiddev9=
8,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Apex 3] on usb-000=
0:64:00.3-2/input3
Dec 15 15:46:46 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 15 16:46:26 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 15 17:07:28 pedro-suse kernel: wlp2s0: deauthenticating from c0:06:c3:5=
a:f8:d8 by local choice (Reason: 3=3DDEAUTH_LEAVING)
Dec 15 17:07:28 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 17:07:29 pedro-suse kernel: PM: suspend entry (s2idle)
Dec 15 17:07:29 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 17:07:29 pedro-suse kernel: Filesystems sync: 0.099 seconds
Dec 15 23:53:04 pedro-suse kernel: Freezing user space processes
Dec 15 23:53:04 pedro-suse kernel: Freezing user space processes completed =
(elapsed 0.002 seconds)
Dec 15 23:53:04 pedro-suse kernel: OOM killer disabled.
Dec 15 23:53:04 pedro-suse kernel: Freezing remaining freezable tasks
Dec 15 23:53:04 pedro-suse kernel: Freezing remaining freezable tasks compl=
eted (elapsed 0.007 seconds)
Dec 15 23:53:04 pedro-suse kernel: printk: Suspending console(s) (use no_co=
nsole_suspend to debug)
Dec 15 23:53:04 pedro-suse kernel: pcieport 0000:00:08.3: quirk: disabling =
D3cold for suspend
Dec 15 23:53:04 pedro-suse kernel: ACPI: EC: interrupt blocked
Dec 15 23:53:04 pedro-suse kernel: ACPI: EC: interrupt unblocked
Dec 15 23:53:04 pedro-suse kernel: [drm] PCIE GART of 512M enabled (table a=
t 0x00000080FFD00000).
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: SMU is resu=
ming...
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: SMU is resu=
med successfully!
Dec 15 23:53:04 pedro-suse kernel: nvme nvme0: 16/0/0 default/read/poll que=
ues
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] Skip =
DMUB HPD IRQ callback in suspend/resume
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] Skip =
DMUB HPD IRQ callback in suspend/resume
Dec 15 23:53:04 pedro-suse kernel: [drm] DM_MST: Differing MST start on aco=
nnector: 00000000928883d9 [id: 417]
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring gfx_0.=
0.0 uses VM inv eng 0 on hub 0
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E0.0 uses VM inv eng 1 on hub 0
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E1.0 uses VM inv eng 4 on hub 0
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E2.0 uses VM inv eng 6 on hub 0
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E3.0 uses VM inv eng 7 on hub 0
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E0.1 uses VM inv eng 8 on hub 0
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E1.1 uses VM inv eng 9 on hub 0
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E2.1 uses VM inv eng 10 on hub 0
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E3.1 uses VM inv eng 11 on hub 0
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring sdma0 =
uses VM inv eng 12 on hub 0
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring vcn_un=
ified_0 uses VM inv eng 0 on hub 8
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring jpeg_d=
ec uses VM inv eng 1 on hub 8
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring mes_ki=
q_3.1.0 uses VM inv eng 13 on hub 0
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 23:53:04 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 23:53:04 pedro-suse kernel: OOM killer enabled.
Dec 15 23:53:04 pedro-suse kernel: Restarting tasks: Starting
Dec 15 23:53:04 pedro-suse kernel: usb 1-1: USB disconnect, device number 2
Dec 15 23:53:04 pedro-suse kernel: Restarting tasks: Done
Dec 15 23:53:04 pedro-suse kernel: efivarfs: resyncing variable state
Dec 15 23:53:04 pedro-suse kernel: usb 1-2: USB disconnect, device number 12
Dec 15 23:53:04 pedro-suse kernel: efivarfs: finished resyncing variable st=
ate
Dec 15 23:53:04 pedro-suse kernel: random: crng reseeded on system resumpti=
on
Dec 15 23:53:05 pedro-suse kernel: PM: suspend exit
Dec 15 23:53:05 pedro-suse kernel: Generic FE-GE Realtek PHY r8169-0-100:00=
: attached PHY driver (mii_bus:phy_addr=3Dr8169-0-100:00, irq=3DMAC)
Dec 15 23:53:05 pedro-suse kernel: r8169 0000:01:00.0 enp1s0f0: Link is Down
Dec 15 23:53:05 pedro-suse kernel: HDR SB:01 1a 02 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 15 23:53:05 pedro-suse kernel: HDR SB:00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 15 23:53:05 pedro-suse kernel: usb 1-5: reset full-speed USB device num=
ber 5 using xhci_hcd
Dec 15 23:53:05 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 23:53:10 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 23:53:10 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 23:53:10 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 23:53:14 pedro-suse kernel: wlp2s0: authenticate with c0:06:c3:5a:f8=
:d8 (local address=3D8c:3b:4a:4c:a2:20)
Dec 15 23:53:14 pedro-suse kernel: wlp2s0: send auth to c0:06:c3:5a:f8:d8 (=
try 1/3)
Dec 15 23:53:14 pedro-suse kernel: wlp2s0: authenticated
Dec 15 23:53:14 pedro-suse kernel: wlp2s0: associating to AP c0:06:c3:5a:f8=
:d8 with corrupt probe response
Dec 15 23:53:14 pedro-suse kernel: wlp2s0: associate with c0:06:c3:5a:f8:d8=
 (try 1/3)
Dec 15 23:53:14 pedro-suse kernel: wlp2s0: RX AssocResp from c0:06:c3:5a:f8=
:d8 (capab=3D0x411 status=3D0 aid=3D3)
Dec 15 23:53:14 pedro-suse kernel: wlp2s0: associated
Dec 15 23:55:07 pedro-suse kernel: wlp2s0: deauthenticating from c0:06:c3:5=
a:f8:d8 by local choice (Reason: 3=3DDEAUTH_LEAVING)
Dec 15 23:55:07 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 23:55:07 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 15 23:55:08 pedro-suse kernel: PM: suspend entry (s2idle)
Dec 15 23:55:08 pedro-suse kernel: Filesystems sync: 0.160 seconds
Dec 16 11:58:49 pedro-suse kernel: Freezing user space processes
Dec 16 11:58:49 pedro-suse kernel: Freezing user space processes completed =
(elapsed 0.002 seconds)
Dec 16 11:58:49 pedro-suse kernel: OOM killer disabled.
Dec 16 11:58:49 pedro-suse kernel: Freezing remaining freezable tasks
Dec 16 11:58:49 pedro-suse kernel: Freezing remaining freezable tasks compl=
eted (elapsed 0.014 seconds)
Dec 16 11:58:49 pedro-suse kernel: printk: Suspending console(s) (use no_co=
nsole_suspend to debug)
Dec 16 11:58:49 pedro-suse kernel: ACPI: EC: interrupt blocked
Dec 16 11:58:49 pedro-suse kernel: ACPI: EC: interrupt unblocked
Dec 16 11:58:49 pedro-suse kernel: [drm] PCIE GART of 512M enabled (table a=
t 0x00000080FFD00000).
Dec 16 11:58:49 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: SMU is resu=
ming...
Dec 16 11:58:49 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: SMU is resu=
med successfully!
Dec 16 11:58:49 pedro-suse kernel: nvme nvme0: 16/0/0 default/read/poll que=
ues
Dec 16 11:58:49 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] Skip =
DMUB HPD IRQ callback in suspend/resume
Dec 16 11:58:49 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] Skip =
DMUB HPD IRQ callback in suspend/resume
Dec 16 11:58:49 pedro-suse kernel: [drm] DM_MST: Differing MST start on aco=
nnector: 00000000928883d9 [id: 417]
Dec 16 11:58:49 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring gfx_0.=
0.0 uses VM inv eng 0 on hub 0
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E0.0 uses VM inv eng 1 on hub 0
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E1.0 uses VM inv eng 4 on hub 0
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E2.0 uses VM inv eng 6 on hub 0
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E3.0 uses VM inv eng 7 on hub 0
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E0.1 uses VM inv eng 8 on hub 0
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E1.1 uses VM inv eng 9 on hub 0
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E2.1 uses VM inv eng 10 on hub 0
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E3.1 uses VM inv eng 11 on hub 0
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring sdma0 =
uses VM inv eng 12 on hub 0
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring vcn_un=
ified_0 uses VM inv eng 0 on hub 8
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring jpeg_d=
ec uses VM inv eng 1 on hub 8
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring mes_ki=
q_3.1.0 uses VM inv eng 13 on hub 0
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 16 11:58:50 pedro-suse kernel: OOM killer enabled.
Dec 16 11:58:50 pedro-suse kernel: Restarting tasks: Starting
Dec 16 11:58:50 pedro-suse kernel: Restarting tasks: Done
Dec 16 11:58:50 pedro-suse kernel: efivarfs: resyncing variable state
Dec 16 11:58:50 pedro-suse kernel: efivarfs: finished resyncing variable st=
ate
Dec 16 11:58:50 pedro-suse kernel: random: crng reseeded on system resumpti=
on
Dec 16 11:58:50 pedro-suse kernel: PM: suspend exit
Dec 16 11:58:50 pedro-suse kernel: usb 1-1: new full-speed USB device numbe=
r 13 using xhci_hcd
Dec 16 11:58:50 pedro-suse kernel: Generic FE-GE Realtek PHY r8169-0-100:00=
: attached PHY driver (mii_bus:phy_addr=3Dr8169-0-100:00, irq=3DMAC)
Dec 16 11:58:50 pedro-suse kernel: HDR SB:01 1a 02 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 16 11:58:50 pedro-suse kernel: HDR SB:00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 16 11:58:50 pedro-suse kernel: r8169 0000:01:00.0 enp1s0f0: Link is Down
Dec 16 11:58:50 pedro-suse kernel: usb 1-1: New USB device found, idVendor=
=3D1038, idProduct=3D1836, bcdDevice=3D 1.00
Dec 16 11:58:50 pedro-suse kernel: usb 1-1: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 16 11:58:50 pedro-suse kernel: usb 1-1: Product: SteelSeries Aerox 3
Dec 16 11:58:50 pedro-suse kernel: usb 1-1: Manufacturer: SteelSeries
Dec 16 11:58:50 pedro-suse kernel: input: SteelSeries SteelSeries Aerox 3 a=
s /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-1/1-1:1.0/0003:1038:=
1836.0025/input/input51
Dec 16 11:58:50 pedro-suse kernel: hid-generic 0003:1038:1836.0025: input,h=
idraw1: USB HID v1.11 Mouse [SteelSeries SteelSeries Aerox 3] on usb-0000:6=
4:00.3-1/input0
Dec 16 11:58:50 pedro-suse kernel: input: SteelSeries SteelSeries Aerox 3 K=
eyboard as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-1/1-1:1.1/0=
003:1038:1836.0026/input/input52
Dec 16 11:58:50 pedro-suse kernel: hid-generic 0003:1038:1836.0026: input,h=
idraw2: USB HID v1.11 Keyboard [SteelSeries SteelSeries Aerox 3] on usb-000=
0:64:00.3-1/input1
Dec 16 11:58:50 pedro-suse kernel: hid-generic 0003:1038:1836.0027: hiddev9=
6,hidraw3: USB HID v1.11 Device [SteelSeries SteelSeries Aerox 3] on usb-00=
00:64:00.3-1/input2
Dec 16 11:58:50 pedro-suse kernel: hid-generic 0003:1038:1836.0028: hiddev9=
7,hidraw4: USB HID v1.11 Device [SteelSeries SteelSeries Aerox 3] on usb-00=
00:64:00.3-1/input3
Dec 16 11:58:50 pedro-suse kernel: usb 1-2: new full-speed USB device numbe=
r 14 using xhci_hcd
Dec 16 11:58:50 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 16 11:58:50 pedro-suse kernel: usb 1-2: New USB device found, idVendor=
=3D1038, idProduct=3D161a, bcdDevice=3D 0.28
Dec 16 11:58:50 pedro-suse kernel: usb 1-2: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 16 11:58:50 pedro-suse kernel: usb 1-2: Product: SteelSeries Apex 3
Dec 16 11:58:50 pedro-suse kernel: usb 1-2: Manufacturer: SteelSeries
Dec 16 11:58:50 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.0/0003:1038:1=
61A.0029/input/input53
Dec 16 11:58:50 pedro-suse kernel: hid-generic 0003:1038:161A.0029: input,h=
idraw5: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input0
Dec 16 11:58:50 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.1/0003:1038:1=
61A.002A/input/input54
Dec 16 11:58:50 pedro-suse kernel: hid-generic 0003:1038:161A.002A: input,h=
idraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input1
Dec 16 11:58:50 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Co=
nsumer Control as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-=
2:1.2/0003:1038:161A.002B/input/input55
Dec 16 11:58:50 pedro-suse kernel: usb 1-5: reset full-speed USB device num=
ber 5 using xhci_hcd
Dec 16 11:58:50 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Mo=
use as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.2/0003:=
1038:161A.002B/input/input56
Dec 16 11:58:50 pedro-suse kernel: hid-generic 0003:1038:161A.002B: input,h=
idraw7: USB HID v1.11 Mouse [SteelSeries SteelSeries Apex 3] on usb-0000:64=
:00.3-2/input2
Dec 16 11:58:50 pedro-suse kernel: hid-generic 0003:1038:161A.002C: hiddev9=
8,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Apex 3] on usb-000=
0:64:00.3-2/input3
Dec 16 11:58:55 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 16 11:58:55 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 16 11:58:55 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 16 11:58:59 pedro-suse kernel: wlp2s0: authenticate with c0:06:c3:5a:f8=
:d8 (local address=3D8c:3b:4a:4c:a2:20)
Dec 16 11:58:59 pedro-suse kernel: wlp2s0: send auth to c0:06:c3:5a:f8:d8 (=
try 1/3)
Dec 16 11:58:59 pedro-suse kernel: wlp2s0: authenticated
Dec 16 11:58:59 pedro-suse kernel: wlp2s0: associating to AP c0:06:c3:5a:f8=
:d8 with corrupt probe response
Dec 16 11:58:59 pedro-suse kernel: wlp2s0: associate with c0:06:c3:5a:f8:d8=
 (try 1/3)
Dec 16 11:58:59 pedro-suse kernel: wlp2s0: RX AssocResp from c0:06:c3:5a:f8=
:d8 (capab=3D0x411 status=3D0 aid=3D2)
Dec 16 11:58:59 pedro-suse kernel: wlp2s0: associated
Dec 16 11:59:14 pedro-suse kernel: HDR SB:01 1a 02 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 16 11:59:14 pedro-suse kernel: HDR SB:00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 16 12:35:52 pedro-suse kernel: perf: interrupt took too long (2645 > 25=
00), lowering kernel.perf_event_max_sample_rate to 75000
Dec 16 12:36:11 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 16 12:47:08 pedro-suse kernel: usb 1-2: USB disconnect, device number 14
Dec 16 12:47:08 pedro-suse kernel: usb 1-2: new full-speed USB device numbe=
r 15 using xhci_hcd
Dec 16 12:47:08 pedro-suse kernel: usb 1-2: New USB device found, idVendor=
=3D1038, idProduct=3D161a, bcdDevice=3D 0.28
Dec 16 12:47:08 pedro-suse kernel: usb 1-2: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 16 12:47:08 pedro-suse kernel: usb 1-2: Product: SteelSeries Apex 3
Dec 16 12:47:08 pedro-suse kernel: usb 1-2: Manufacturer: SteelSeries
Dec 16 12:47:08 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.0/0003:1038:1=
61A.002D/input/input57
Dec 16 12:47:08 pedro-suse kernel: hid-generic 0003:1038:161A.002D: input,h=
idraw5: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input0
Dec 16 12:47:08 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.1/0003:1038:1=
61A.002E/input/input58
Dec 16 12:47:08 pedro-suse kernel: hid-generic 0003:1038:161A.002E: input,h=
idraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input1
Dec 16 12:47:08 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Co=
nsumer Control as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-=
2:1.2/0003:1038:161A.002F/input/input59
Dec 16 12:47:08 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Mo=
use as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.2/0003:=
1038:161A.002F/input/input60
Dec 16 12:47:08 pedro-suse kernel: hid-generic 0003:1038:161A.002F: input,h=
idraw7: USB HID v1.11 Mouse [SteelSeries SteelSeries Apex 3] on usb-0000:64=
:00.3-2/input2
Dec 16 12:47:08 pedro-suse kernel: hid-generic 0003:1038:161A.0030: hiddev9=
8,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Apex 3] on usb-000=
0:64:00.3-2/input3
Dec 16 12:54:10 pedro-suse kernel: usb 1-2: USB disconnect, device number 15
Dec 16 12:54:10 pedro-suse kernel: usb 1-2: new full-speed USB device numbe=
r 16 using xhci_hcd
Dec 16 12:54:10 pedro-suse kernel: usb 1-2: New USB device found, idVendor=
=3D1038, idProduct=3D161a, bcdDevice=3D 0.28
Dec 16 12:54:10 pedro-suse kernel: usb 1-2: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 16 12:54:10 pedro-suse kernel: usb 1-2: Product: SteelSeries Apex 3
Dec 16 12:54:10 pedro-suse kernel: usb 1-2: Manufacturer: SteelSeries
Dec 16 12:54:10 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.0/0003:1038:1=
61A.0031/input/input61
Dec 16 12:54:10 pedro-suse kernel: hid-generic 0003:1038:161A.0031: input,h=
idraw5: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input0
Dec 16 12:54:10 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.1/0003:1038:1=
61A.0032/input/input62
Dec 16 12:54:10 pedro-suse kernel: hid-generic 0003:1038:161A.0032: input,h=
idraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input1
Dec 16 12:54:10 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Co=
nsumer Control as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-=
2:1.2/0003:1038:161A.0033/input/input63
Dec 16 12:54:10 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Mo=
use as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.2/0003:=
1038:161A.0033/input/input64
Dec 16 12:54:10 pedro-suse kernel: hid-generic 0003:1038:161A.0033: input,h=
idraw7: USB HID v1.11 Mouse [SteelSeries SteelSeries Apex 3] on usb-0000:64=
:00.3-2/input2
Dec 16 12:54:10 pedro-suse kernel: hid-generic 0003:1038:161A.0034: hiddev9=
8,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Apex 3] on usb-000=
0:64:00.3-2/input3
Dec 16 13:36:19 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 16 14:37:03 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 16 15:09:15 pedro-suse kernel: usb 1-2: USB disconnect, device number 16
Dec 16 15:09:16 pedro-suse kernel: usb 1-2: new full-speed USB device numbe=
r 17 using xhci_hcd
Dec 16 15:09:16 pedro-suse kernel: usb 1-2: New USB device found, idVendor=
=3D1038, idProduct=3D161a, bcdDevice=3D 0.28
Dec 16 15:09:16 pedro-suse kernel: usb 1-2: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 16 15:09:16 pedro-suse kernel: usb 1-2: Product: SteelSeries Apex 3
Dec 16 15:09:16 pedro-suse kernel: usb 1-2: Manufacturer: SteelSeries
Dec 16 15:09:16 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.0/0003:1038:1=
61A.0035/input/input65
Dec 16 15:09:16 pedro-suse kernel: hid-generic 0003:1038:161A.0035: input,h=
idraw5: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input0
Dec 16 15:09:16 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.1/0003:1038:1=
61A.0036/input/input66
Dec 16 15:09:16 pedro-suse kernel: hid-generic 0003:1038:161A.0036: input,h=
idraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input1
Dec 16 15:09:16 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Co=
nsumer Control as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-=
2:1.2/0003:1038:161A.0037/input/input67
Dec 16 15:09:16 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Mo=
use as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.2/0003:=
1038:161A.0037/input/input68
Dec 16 15:09:16 pedro-suse kernel: hid-generic 0003:1038:161A.0037: input,h=
idraw7: USB HID v1.11 Mouse [SteelSeries SteelSeries Apex 3] on usb-0000:64=
:00.3-2/input2
Dec 16 15:09:16 pedro-suse kernel: hid-generic 0003:1038:161A.0038: hiddev9=
8,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Apex 3] on usb-000=
0:64:00.3-2/input3
Dec 16 15:37:06 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 16 15:55:57 pedro-suse kernel: BTRFS warning (device dm-0): qgroup mark=
ed inconsistent, qgroup inherit needs a rescan
Dec 16 16:32:34 pedro-suse kernel: traps: polkitd[1268] trap int3 ip:7f3171=
af15ab sp:7fff64c0dbf0 error:0 in libglib-2.0.so.0.8600.3[6b5ab,7f3171aa900=
0+a0000]
Dec 16 16:37:21 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 16 16:56:43 pedro-suse kernel: usb 5-1: new full-speed USB device numbe=
r 2 using xhci_hcd
Dec 16 16:56:44 pedro-suse kernel: usb 5-1: New USB device found, idVendor=
=3D1038, idProduct=3D12ec, bcdDevice=3D 0.60
Dec 16 16:56:44 pedro-suse kernel: usb 5-1: New USB device strings: Mfr=3D3=
, Product=3D1, SerialNumber=3D0
Dec 16 16:56:44 pedro-suse kernel: usb 5-1: Product: Arctis Nova 3
Dec 16 16:56:44 pedro-suse kernel: usb 5-1: Manufacturer: SteelSeries
Dec 16 16:56:45 pedro-suse kernel: input: SteelSeries Arctis Nova 3 as /dev=
ices/pci0000:00/0000:00:08.3/0000:66:00.3/usb5/5-1/5-1:1.3/0003:1038:12EC.0=
039/input/input69
Dec 16 16:56:45 pedro-suse kernel: hid-generic 0003:1038:12EC.0039: input,h=
idraw11: USB HID v1.11 Device [SteelSeries Arctis Nova 3] on usb-0000:66:00=
=2E3-1/input3
Dec 16 16:56:45 pedro-suse kernel: hid-generic 0003:1038:12EC.003A: hiddev1=
01,hidraw12: USB HID v1.11 Device [SteelSeries Arctis Nova 3] on usb-0000:6=
6:00.3-1/input4
Dec 16 16:56:45 pedro-suse kernel: usb 5-1: USB disconnect, device number 2
Dec 16 16:56:47 pedro-suse kernel: usb 5-1: new full-speed USB device numbe=
r 3 using xhci_hcd
Dec 16 16:56:47 pedro-suse kernel: usb 5-1: New USB device found, idVendor=
=3D1038, idProduct=3D12ec, bcdDevice=3D 0.60
Dec 16 16:56:47 pedro-suse kernel: usb 5-1: New USB device strings: Mfr=3D3=
, Product=3D1, SerialNumber=3D0
Dec 16 16:56:47 pedro-suse kernel: usb 5-1: Product: Arctis Nova 3
Dec 16 16:56:47 pedro-suse kernel: usb 5-1: Manufacturer: SteelSeries
Dec 16 16:56:48 pedro-suse kernel: input: SteelSeries Arctis Nova 3 as /dev=
ices/pci0000:00/0000:00:08.3/0000:66:00.3/usb5/5-1/5-1:1.3/0003:1038:12EC.0=
03B/input/input70
Dec 16 16:56:48 pedro-suse kernel: hid-generic 0003:1038:12EC.003B: input,h=
idraw11: USB HID v1.11 Device [SteelSeries Arctis Nova 3] on usb-0000:66:00=
=2E3-1/input3
Dec 16 16:56:48 pedro-suse kernel: hid-generic 0003:1038:12EC.003C: hiddev1=
01,hidraw12: USB HID v1.11 Device [SteelSeries Arctis Nova 3] on usb-0000:6=
6:00.3-1/input4
Dec 16 16:59:15 pedro-suse kernel: HDR SB:01 1a 02 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 16 16:59:15 pedro-suse kernel: HDR SB:00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 16 16:59:50 pedro-suse kernel: usb 1-2: USB disconnect, device number 17
Dec 16 16:59:51 pedro-suse kernel: usb 1-2: new full-speed USB device numbe=
r 18 using xhci_hcd
Dec 16 16:59:51 pedro-suse kernel: usb 1-2: New USB device found, idVendor=
=3D1038, idProduct=3D161a, bcdDevice=3D 0.28
Dec 16 16:59:51 pedro-suse kernel: usb 1-2: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 16 16:59:51 pedro-suse kernel: usb 1-2: Product: SteelSeries Apex 3
Dec 16 16:59:51 pedro-suse kernel: usb 1-2: Manufacturer: SteelSeries
Dec 16 16:59:51 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.0/0003:1038:1=
61A.003D/input/input71
Dec 16 16:59:51 pedro-suse kernel: hid-generic 0003:1038:161A.003D: input,h=
idraw5: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input0
Dec 16 16:59:51 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.1/0003:1038:1=
61A.003E/input/input72
Dec 16 16:59:51 pedro-suse kernel: hid-generic 0003:1038:161A.003E: input,h=
idraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input1
Dec 16 16:59:51 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Co=
nsumer Control as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-=
2:1.2/0003:1038:161A.003F/input/input73
Dec 16 16:59:51 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Mo=
use as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.2/0003:=
1038:161A.003F/input/input74
Dec 16 16:59:51 pedro-suse kernel: hid-generic 0003:1038:161A.003F: input,h=
idraw7: USB HID v1.11 Mouse [SteelSeries SteelSeries Apex 3] on usb-0000:64=
:00.3-2/input2
Dec 16 16:59:51 pedro-suse kernel: usbhid 1-2:1.3: can't add hid device: -71
Dec 16 16:59:51 pedro-suse kernel: usbhid 1-2:1.3: probe with driver usbhid=
 failed with error -71
Dec 16 16:59:51 pedro-suse kernel: usb 1-2: USB disconnect, device number 18
Dec 16 16:59:52 pedro-suse kernel: usb 1-2: new full-speed USB device numbe=
r 19 using xhci_hcd
Dec 16 16:59:52 pedro-suse kernel: usb 1-2: New USB device found, idVendor=
=3D1038, idProduct=3D161a, bcdDevice=3D 0.28
Dec 16 16:59:52 pedro-suse kernel: usb 1-2: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D0
Dec 16 16:59:52 pedro-suse kernel: usb 1-2: Product: SteelSeries Apex 3
Dec 16 16:59:52 pedro-suse kernel: usb 1-2: Manufacturer: SteelSeries
Dec 16 16:59:52 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.0/0003:1038:1=
61A.0040/input/input75
Dec 16 16:59:52 pedro-suse kernel: hid-generic 0003:1038:161A.0040: input,h=
idraw5: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input0
Dec 16 16:59:52 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 as=
 /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.1/0003:1038:1=
61A.0041/input/input76
Dec 16 16:59:52 pedro-suse kernel: hid-generic 0003:1038:161A.0041: input,h=
idraw6: USB HID v1.11 Keyboard [SteelSeries SteelSeries Apex 3] on usb-0000=
:64:00.3-2/input1
Dec 16 16:59:52 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Co=
nsumer Control as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-=
2:1.2/0003:1038:161A.0042/input/input77
Dec 16 16:59:52 pedro-suse kernel: input: SteelSeries SteelSeries Apex 3 Mo=
use as /devices/pci0000:00/0000:00:08.1/0000:64:00.3/usb1/1-2/1-2:1.2/0003:=
1038:161A.0042/input/input78
Dec 16 16:59:52 pedro-suse kernel: hid-generic 0003:1038:161A.0042: input,h=
idraw7: USB HID v1.11 Mouse [SteelSeries SteelSeries Apex 3] on usb-0000:64=
:00.3-2/input2
Dec 16 16:59:52 pedro-suse kernel: hid-generic 0003:1038:161A.0043: hiddev9=
8,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Apex 3] on usb-000=
0:64:00.3-2/input3
Dec 16 17:25:07 pedro-suse kernel: perf: interrupt took too long (3447 > 33=
06), lowering kernel.perf_event_max_sample_rate to 58000
Dec 16 17:33:58 pedro-suse kernel: wlp2s0: deauthenticated from c0:06:c3:5a=
:f8:d8 (Reason: 8=3DDISASSOC_STA_HAS_LEFT)
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: authenticate with c0:06:c3:5a:f8=
:d8 (local address=3D8c:3b:4a:4c:a2:20)
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: send auth to c0:06:c3:5a:f8:d8 (=
try 1/3)
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: authenticated
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: associating to AP c0:06:c3:5a:f8=
:d8 with corrupt probe response
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: associate with c0:06:c3:5a:f8:d8=
 (try 1/3)
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: RX AssocResp from c0:06:c3:5a:f8=
:d8 (capab=3D0x411 status=3D0 aid=3D2)
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: associated
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: deauthenticated from c0:06:c3:5a=
:f8:d8 (Reason: 6=3DCLASS2_FRAME_FROM_NONAUTH_STA)
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: authenticate with c0:06:c3:5a:f8=
:d8 (local address=3D8c:3b:4a:4c:a2:20)
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: send auth to c0:06:c3:5a:f8:d8 (=
try 1/3)
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: authenticated
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: associating to AP c0:06:c3:5a:f8=
:d8 with corrupt probe response
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: associate with c0:06:c3:5a:f8:d8=
 (try 1/3)
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: RX AssocResp from c0:06:c3:5a:f8=
:d8 (capab=3D0x411 status=3D0 aid=3D1)
Dec 16 17:34:02 pedro-suse kernel: wlp2s0: associated
Dec 16 17:38:22 pedro-suse kernel: BTRFS info (device dm-0): qgroup scan co=
mpleted (inconsistency flag cleared)
Dec 16 17:46:34 pedro-suse kernel: HDR SB:01 1a 02 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 16 17:46:34 pedro-suse kernel: HDR SB:00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 16 17:54:37 pedro-suse kernel: wlp2s0: deauthenticating from c0:06:c3:5=
a:f8:d8 by local choice (Reason: 3=3DDEAUTH_LEAVING)
Dec 16 17:54:37 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 16 17:54:37 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 16 17:54:38 pedro-suse kernel: PM: suspend entry (s2idle)
Dec 16 17:54:38 pedro-suse kernel: Filesystems sync: 0.059 seconds
Dec 17 11:01:13 pedro-suse kernel: Freezing user space processes
Dec 17 11:01:13 pedro-suse kernel: Freezing user space processes completed =
(elapsed 0.001 seconds)
Dec 17 11:01:13 pedro-suse kernel: OOM killer disabled.
Dec 17 11:01:13 pedro-suse kernel: Freezing remaining freezable tasks
Dec 17 11:01:13 pedro-suse kernel: Freezing remaining freezable tasks compl=
eted (elapsed 0.001 seconds)
Dec 17 11:01:13 pedro-suse kernel: printk: Suspending console(s) (use no_co=
nsole_suspend to debug)
Dec 17 11:01:13 pedro-suse kernel: ACPI: EC: interrupt blocked
Dec 17 11:01:13 pedro-suse kernel: ACPI: EC: interrupt unblocked
Dec 17 11:01:13 pedro-suse kernel: [drm] PCIE GART of 512M enabled (table a=
t 0x00000080FFD00000).
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: SMU is resu=
ming...
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: SMU is resu=
med successfully!
Dec 17 11:01:13 pedro-suse kernel: nvme nvme0: 16/0/0 default/read/poll que=
ues
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] Skip =
DMUB HPD IRQ callback in suspend/resume
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] Skip =
DMUB HPD IRQ callback in suspend/resume
Dec 17 11:01:13 pedro-suse kernel: [drm] DM_MST: Differing MST start on aco=
nnector: 00000000928883d9 [id: 417]
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring gfx_0.=
0.0 uses VM inv eng 0 on hub 0
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E0.0 uses VM inv eng 1 on hub 0
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E1.0 uses VM inv eng 4 on hub 0
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E2.0 uses VM inv eng 6 on hub 0
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E3.0 uses VM inv eng 7 on hub 0
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E0.1 uses VM inv eng 8 on hub 0
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E1.1 uses VM inv eng 9 on hub 0
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E2.1 uses VM inv eng 10 on hub 0
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring comp_1=
=2E3.1 uses VM inv eng 11 on hub 0
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring sdma0 =
uses VM inv eng 12 on hub 0
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring vcn_un=
ified_0 uses VM inv eng 0 on hub 8
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring jpeg_d=
ec uses VM inv eng 1 on hub 8
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: ring mes_ki=
q_3.1.0 uses VM inv eng 13 on hub 0
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 17 11:01:13 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 17 11:01:13 pedro-suse kernel: usb 1-2: reset full-speed USB device num=
ber 19 using xhci_hcd
Dec 17 11:01:13 pedro-suse kernel: usb 1-1: reset full-speed USB device num=
ber 13 using xhci_hcd
Dec 17 11:01:13 pedro-suse kernel: OOM killer enabled.
Dec 17 11:01:13 pedro-suse kernel: Restarting tasks: Starting
Dec 17 11:01:13 pedro-suse kernel: usb 5-1: USB disconnect, device number 3
Dec 17 11:01:13 pedro-suse kernel: Restarting tasks: Done
Dec 17 11:01:13 pedro-suse kernel: efivarfs: resyncing variable state
Dec 17 11:01:13 pedro-suse kernel: efivarfs: finished resyncing variable st=
ate
Dec 17 11:01:13 pedro-suse kernel: random: crng reseeded on system resumpti=
on
Dec 17 11:01:13 pedro-suse kernel: PM: suspend exit
Dec 17 11:01:14 pedro-suse kernel: Generic FE-GE Realtek PHY r8169-0-100:00=
: attached PHY driver (mii_bus:phy_addr=3Dr8169-0-100:00, irq=3DMAC)
Dec 17 11:01:14 pedro-suse kernel: HDR SB:01 1a 02 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 17 11:01:14 pedro-suse kernel: HDR SB:00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00
Dec 17 11:01:14 pedro-suse kernel: r8169 0000:01:00.0 enp1s0f0: Link is Down
Dec 17 11:01:14 pedro-suse kernel: usb 1-5: reset full-speed USB device num=
ber 5 using xhci_hcd
Dec 17 11:01:14 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 17 11:01:17 pedro-suse kernel: ucsi_acpi USBC000:00: ucsi_handle_connec=
tor_change: GET_CONNECTOR_STATUS failed (-110)
Dec 17 11:01:17 pedro-suse kernel: BUG: kernel NULL pointer dereference, ad=
dress: 0000000000000000
Dec 17 11:01:17 pedro-suse kernel: #PF: supervisor read access in kernel mo=
de
Dec 17 11:01:17 pedro-suse kernel: #PF: error_code(0x0000) - not-present pa=
ge
Dec 17 11:01:17 pedro-suse kernel: PGD 0 P4D 0=20
Dec 17 11:01:17 pedro-suse kernel: Oops: Oops: 0000 [#1] SMP NOPTI
Dec 17 11:01:17 pedro-suse kernel: CPU: 6 UID: 0 PID: 127156 Comm: kworker/=
6:15 Not tainted 6.19.0-rc1-1.g274aff5-default #1 PREEMPT(voluntary) openSU=
SE Tumbleweed (unreleased)  404a89cf98df507eb666b481fd923e4c0524c52b
Dec 17 11:01:17 pedro-suse kernel: Hardware name: LENOVO 21K6S0A00C/21K6S0A=
00C, BIOS R2FET65W (1.45 ) 07/31/2025
Dec 17 11:01:17 pedro-suse kernel: Workqueue: events_long ucsi_resume_work =
[typec_ucsi]
Dec 17 11:01:17 pedro-suse kernel: RIP: 0010:ucsi_sync_control_common+0x111=
/0x1d0 [typec_ucsi]
Dec 17 11:01:17 pedro-suse kernel: Code: ed 74 1b 48 8b 43 18 4c 89 ee 48 8=
9 df 48 8b 40 08 2e 2e 2e ff d0 85 c0 0f 85 c4 00 00 00 48 8b 93 18 02 00 0=
0 48 85 d2 74 9b <41> 8b 45 00 85 c0 79 93 48 8b 43 18 48 8d b3 18 01 00 00=
 48 89 df
Dec 17 11:01:17 pedro-suse kernel: RSP: 0018:ffffcacf6386fda8 EFLAGS: 00010=
202
Dec 17 11:01:17 pedro-suse kernel: RAX: 000000000000136b RBX: ffff8aca414aa=
c00 RCX: ffffcacf6386fd08
Dec 17 11:01:17 pedro-suse kernel: RDX: 0000000000000010 RSI: ffffcacf6386f=
d50 RDI: ffff8aca414aacf8
Dec 17 11:01:17 pedro-suse kernel: RBP: 0000000000000000 R08: 0000000000000=
001 R09: 0000000000000000
Dec 17 11:01:17 pedro-suse kernel: R10: 00002906b8fb0080 R11: 0000000000000=
000 R12: 0000000000000004
Dec 17 11:01:17 pedro-suse kernel: R13: 0000000000000000 R14: 0000000000000=
000 R15: ffff8aca414aac40
Dec 17 11:01:17 pedro-suse kernel: FS:  0000000000000000(0000) GS:ffff8ad89=
48a4000(0000) knlGS:0000000000000000
Dec 17 11:01:17 pedro-suse kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
Dec 17 11:01:17 pedro-suse kernel: CR2: 0000000000000000 CR3: 00000008b3e38=
000 CR4: 0000000000f50ef0
Dec 17 11:01:17 pedro-suse kernel: PKRU: 55555554
Dec 17 11:01:17 pedro-suse kernel: Call Trace:
Dec 17 11:01:17 pedro-suse kernel:  <TASK>
Dec 17 11:01:17 pedro-suse kernel:  ucsi_run_command+0xea/0x160 [typec_ucsi=
 7cea3ba3027ec3f117ebc8d974a2455746436aa1]
Dec 17 11:01:17 pedro-suse kernel:  ucsi_send_command_common+0x6a/0x170 [ty=
pec_ucsi 7cea3ba3027ec3f117ebc8d974a2455746436aa1]
Dec 17 11:01:17 pedro-suse kernel:  ucsi_resume_work+0x2f/0x90 [typec_ucsi =
7cea3ba3027ec3f117ebc8d974a2455746436aa1]
Dec 17 11:01:17 pedro-suse kernel:  process_one_work+0x193/0x350
Dec 17 11:01:17 pedro-suse kernel:  worker_thread+0x2d7/0x410
Dec 17 11:01:17 pedro-suse kernel:  ? __pfx_worker_thread+0x10/0x10
Dec 17 11:01:17 pedro-suse kernel:  kthread+0xfc/0x230
Dec 17 11:01:17 pedro-suse kernel:  ? __pfx_kthread+0x10/0x10
Dec 17 11:01:17 pedro-suse kernel:  ? __pfx_kthread+0x10/0x10
Dec 17 11:01:17 pedro-suse kernel:  ret_from_fork+0x243/0x280
Dec 17 11:01:17 pedro-suse kernel:  ? __pfx_kthread+0x10/0x10
Dec 17 11:01:17 pedro-suse kernel:  ret_from_fork_asm+0x1a/0x30
Dec 17 11:01:17 pedro-suse kernel:  </TASK>
Dec 17 11:01:17 pedro-suse kernel: Modules linked in: sd_mod scsi_dh_emc sc=
si_dh_rdac scsi_dh_alua sg scsi_mod scsi_common snd_seq_dummy rfcomm snd_hr=
timer snd_seq xt_MASQUERADE xt_tcpudp xt_mark ccm michael_mic tun af_packet=
 nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_i=
pv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat ebtable_nat ebtable_brou=
te ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat =
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_ra=
w iptable_security ebtable_filter ebtables ip6table_filter ip6_tables cmac =
algif_hash algif_skcipher af_alg bnep nf_tables nfnetlink iptable_filter qr=
tr_mhi binfmt_misc nls_iso8859_1 nls_cp437 vfat fat snd_usb_audio snd_usbmi=
di_lib snd_ump snd_rawmidi snd_seq_device r8153_ecm cdc_ether usbnet snd_so=
c_dmic snd_soc_ps_mach snd_ps_pdm_dma snd_sof_amd_acp70 snd_sof_amd_acp63 i=
ntel_rapl_msr snd_sof_amd_vangogh amd_atl snd_sof_amd_rembrandt intel_rapl_=
common snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci snd_sof_xtensa_dsp sp=
d5118
Dec 17 11:01:17 pedro-suse kernel:  qrtr snd_sof ath11k_pci snd_sof_utils u=
vcvideo ath11k snd_pci_ps videobuf2_vmalloc snd_soc_acpi_amd_match edac_mce=
_amd qmi_helpers uvc snd_amd_sdw_acpi mac80211 soundwire_amd videobuf2_memo=
ps soundwire_generic_allocation videobuf2_v4l2 soundwire_bus kvm_amd snd_hd=
a_codec_alc269 btusb videobuf2_common snd_soc_sdca snd_hda_scodec_component=
 kvm btmtk snd_soc_core snd_hda_codec_realtek_lib btrtl snd_hda_codec_atihd=
mi snd_compress btbcm irqbypass videodev snd_hda_codec_hdmi snd_hda_codec_g=
eneric snd_pcm_dmaengine pcspkr think_lmi btintel snd_ctl_led snd_rpl_pci_a=
cp6x firmware_attributes_class snd_hda_intel mc wmi_bmof snd_acp_pci snd_am=
d_acpi_mach snd_acp_legacy_common bluetooth snd_hda_codec snd_pci_acp6x snd=
_pci_acp5x snd_hda_core snd_rn_pci_acp3x i2c_piix4 snd_acp_config snd_intel=
_dspcfg snd_soc_acpi thinkpad_acpi k10temp i2c_smbus snd_intel_sdw_acpi snd=
_pci_acp3x snd_hwdep cfg80211 platform_profile snd_pcm r8169 sparse_keymap =
mhi snd_timer realtek rfkill libarc4 thermal mdio_devres snd soundcore
Dec 17 11:01:17 pedro-suse kernel:  tiny_power_button ac button fan r8152 m=
ii amd_pmc joydev libphy mdio_bus nvme_fabrics loop fuse efi_pstore ip_tabl=
es x_tables dm_crypt essiv authenc trusted ucsi_acpi asn1_encoder tee usbhi=
d typec_ucsi roles typec amdgpu crc16 amdxcp i2c_algo_bit drm_ttm_helper tt=
m hid_multitouch drm_exec drm_panel_backlight_quirks hid_generic drm_suball=
oc_helper nvme drm_buddy xhci_pci drm_display_helper nvme_core nvme_keyring=
 xhci_hcd amdxdna cec video nvme_auth ghash_clmulni_intel aesni_intel usbco=
re sp5100_tco ccp rc_core gpu_sched thunderbolt hkdf battery wmi i2c_hid_ac=
pi i2c_hid serio_raw btrfs blake2b libblake2b xor raid6_pq dm_mod msr i2c_d=
ev efivarfs dmi_sysfs
Dec 17 11:01:17 pedro-suse kernel: CR2: 0000000000000000
Dec 17 11:01:17 pedro-suse kernel: ---[ end trace 0000000000000000 ]---
Dec 17 11:01:17 pedro-suse kernel: RIP: 0010:ucsi_sync_control_common+0x111=
/0x1d0 [typec_ucsi]
Dec 17 11:01:17 pedro-suse kernel: Code: ed 74 1b 48 8b 43 18 4c 89 ee 48 8=
9 df 48 8b 40 08 2e 2e 2e ff d0 85 c0 0f 85 c4 00 00 00 48 8b 93 18 02 00 0=
0 48 85 d2 74 9b <41> 8b 45 00 85 c0 79 93 48 8b 43 18 48 8d b3 18 01 00 00=
 48 89 df
Dec 17 11:01:17 pedro-suse kernel: RSP: 0018:ffffcacf6386fda8 EFLAGS: 00010=
202
Dec 17 11:01:17 pedro-suse kernel: RAX: 000000000000136b RBX: ffff8aca414aa=
c00 RCX: ffffcacf6386fd08
Dec 17 11:01:17 pedro-suse kernel: RDX: 0000000000000010 RSI: ffffcacf6386f=
d50 RDI: ffff8aca414aacf8
Dec 17 11:01:17 pedro-suse kernel: RBP: 0000000000000000 R08: 0000000000000=
001 R09: 0000000000000000
Dec 17 11:01:17 pedro-suse kernel: R10: 00002906b8fb0080 R11: 0000000000000=
000 R12: 0000000000000004
Dec 17 11:01:17 pedro-suse kernel: R13: 0000000000000000 R14: 0000000000000=
000 R15: ffff8aca414aac40
Dec 17 11:01:17 pedro-suse kernel: FS:  0000000000000000(0000) GS:ffff8ad89=
48a4000(0000) knlGS:0000000000000000
Dec 17 11:01:17 pedro-suse kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
Dec 17 11:01:17 pedro-suse kernel: CR2: 0000000000000000 CR3: 00000008b3e38=
000 CR4: 0000000000f50ef0
Dec 17 11:01:17 pedro-suse kernel: PKRU: 55555554
Dec 17 11:01:17 pedro-suse kernel: note: kworker/6:15[127156] exited with i=
rqs disabled
Dec 17 11:01:19 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 17 11:01:19 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 17 11:01:19 pedro-suse kernel: amdgpu 0000:64:00.0: amdgpu: [drm] DMUB =
HPD RX IRQ callback: link_index=3D6
Dec 17 11:01:23 pedro-suse kernel: wlp2s0: authenticate with c0:06:c3:5a:f8=
:d8 (local address=3D8c:3b:4a:4c:a2:20)
Dec 17 11:01:23 pedro-suse kernel: wlp2s0: send auth to c0:06:c3:5a:f8:d8 (=
try 1/3)
Dec 17 11:01:23 pedro-suse kernel: wlp2s0: authenticated
Dec 17 11:01:23 pedro-suse kernel: wlp2s0: associating to AP c0:06:c3:5a:f8=
:d8 with corrupt probe response
Dec 17 11:01:23 pedro-suse kernel: wlp2s0: associate with c0:06:c3:5a:f8:d8=
 (try 1/3)
Dec 17 11:01:23 pedro-suse kernel: wlp2s0: RX AssocResp from c0:06:c3:5a:f8=
:d8 (capab=3D0x411 status=3D0 aid=3D1)
Dec 17 11:01:23 pedro-suse kernel: wlp2s0: associated
Dec 17 11:02:14 pedro-suse kernel: BUG: workqueue lockup - pool cpus=3D6 no=
de=3D0 flags=3D0x0 nice=3D0 stuck for 57s!
Dec 17 11:02:14 pedro-suse kernel: Showing busy workqueues and worker pools:
Dec 17 11:02:14 pedro-suse kernel: workqueue events: flags=3D0x100
Dec 17 11:02:14 pedro-suse kernel:   pwq 10: cpus=3D2 node=3D0 flags=3D0x0 =
nice=3D0 active=3D2 refcnt=3D3
Dec 17 11:02:14 pedro-suse kernel:     in-flight: 124095:amdgpu_tlb_fence_w=
ork [amdgpu] ,127251:amdgpu_tlb_fence_work [amdgpu]
Dec 17 11:02:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D157 refcnt=3D158
Dec 17 11:02:14 pedro-suse kernel:     pending: delayed_vfree_work, 4*acpi_=
os_map_remove, kernfs_notify_workfn, key_garbage_collector, 2*acpi_os_map_r=
emove, 20*amdgpu_tlb_fence_work [amdgpu], acpi_os_map_remove, netstamp_clea=
r, 5*acpi_os_map_remove, amdgpu_tlb_fence_work [amdgpu], 4*acpi_os_map_remo=
ve, 3*amdgpu_tlb_fence_work [amdgpu], 45*acpi_os_map_remove, free_ipc, 5*de=
stroy_super_work, destroy_pid_namespace_work, 10*acpi_os_map_remove, yama_r=
elation_cleanup, 37*acpi_os_map_remove, 12*bpf_prog_free_deferred, acpi_os_=
map_remove
Dec 17 11:02:14 pedro-suse kernel:   pwq 30: cpus=3D7 node=3D0 flags=3D0x0 =
nice=3D0 active=3D85 refcnt=3D86
Dec 17 11:02:14 pedro-suse kernel:     in-flight: 128067:amdgpu_tlb_fence_w=
ork [amdgpu] ,127991:amdgpu_tlb_fence_work [amdgpu] ,128025:amdgpu_tlb_fenc=
e_work [amdgpu] ,128045:amdgpu_tlb_fence_work [amdgpu] ,128007:amdgpu_tlb_f=
ence_work [amdgpu] ,128012:amdgpu_tlb_fence_work [amdgpu] ,125493:amdgpu_tl=
b_fence_work [amdgpu] ,128031:amdgpu_tlb_fence_work [amdgpu] ,128061:amdgpu=
_tlb_fence_work [amdgpu] ,128053:amdgpu_tlb_fence_work [amdgpu] ,128037:amd=
gpu_tlb_fence_work [amdgpu] ,128010:amdgpu_tlb_fence_work [amdgpu] ,128021:=
amdgpu_tlb_fence_work [amdgpu] ,128057:amdgpu_tlb_fence_work [amdgpu] ,1279=
92:amdgpu_tlb_fence_work [amdgpu] ,128035:amdgpu_tlb_fence_work [amdgpu] ,1=
28001:amdgpu_tlb_fence_work [amdgpu] ,128032:amdgpu_tlb_fence_work [amdgpu]=
 ,128052:amdgpu_tlb_fence_work [amdgpu] ,128079:amdgpu_tlb_fence_work [amdg=
pu] ,127438:amdgpu_tlb_fence_work [amdgpu] ,128027:amdgpu_tlb_fence_work [a=
mdgpu] ,128043:amdgpu_tlb_fence_work [amdgpu] ,128009:amdgpu_tlb_fence_work=
 [amdgpu] ,128036:amdgpu_tlb_fence_work [amdgpu] ,128030
Dec 17 11:02:14 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128085:=
amdgpu_tlb_fence_work [amdgpu] ,128075:amdgpu_tlb_fence_work [amdgpu] ,1280=
11:amdgpu_tlb_fence_work [amdgpu] ,128073:amdgpu_tlb_fence_work [amdgpu] ,1=
27297:amdgpu_tlb_fence_work [amdgpu] ,128029:amdgpu_tlb_fence_work [amdgpu]=
 ,127993:amdgpu_tlb_fence_work [amdgpu] ,128024:amdgpu_tlb_fence_work [amdg=
pu] ,128003:amdgpu_tlb_fence_work [amdgpu] ,128044:amdgpu_tlb_fence_work [a=
mdgpu] ,127996:amdgpu_tlb_fence_work [amdgpu] ,128015:amdgpu_tlb_fence_work=
 [amdgpu] ,128047:amdgpu_tlb_fence_work [amdgpu] ,128050:amdgpu_tlb_fence_w=
ork [amdgpu] ,128041:amdgpu_tlb_fence_work [amdgpu] ,127999:amdgpu_tlb_fenc=
e_work [amdgpu] ,128026:amdgpu_tlb_fence_work [amdgpu] ,128087:amdgpu_tlb_f=
ence_work [amdgpu] ,127998:amdgpu_tlb_fence_work [amdgpu] ,128042:amdgpu_tl=
b_fence_work [amdgpu] ,128008:amdgpu_tlb_fence_work [amdgpu] ,128013:amdgpu=
_tlb_fence_work [amdgpu] ,127995:amdgpu_tlb_fence_work [amdgpu] ,128055:amd=
gpu_tlb_fence_work [amdgpu] ,128006:amdgpu_tlb_fence_work [amdgpu] ,128016
Dec 17 11:02:14 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128046:=
amdgpu_tlb_fence_work [amdgpu] ,128071:amdgpu_tlb_fence_work [amdgpu] ,1280=
04:amdgpu_tlb_fence_work [amdgpu] ,128023:amdgpu_tlb_fence_work [amdgpu] ,1=
27298:amdgpu_tlb_fence_work [amdgpu] ,128034:amdgpu_tlb_fence_work [amdgpu]=
 ,128049:amdgpu_tlb_fence_work [amdgpu] ,128028:amdgpu_tlb_fence_work [amdg=
pu] ,128000:amdgpu_tlb_fence_work [amdgpu] ,128065:amdgpu_tlb_fence_work [a=
mdgpu] ,128019:amdgpu_tlb_fence_work [amdgpu] ,128063:amdgpu_tlb_fence_work=
 [amdgpu] ,127994:amdgpu_tlb_fence_work [amdgpu] ,128040:amdgpu_tlb_fence_w=
ork [amdgpu] ,128059:amdgpu_tlb_fence_work [amdgpu] ,128020:amdgpu_tlb_fenc=
e_work [amdgpu] ,128077:amdgpu_tlb_fence_work [amdgpu] ,128005:amdgpu_tlb_f=
ence_work [amdgpu] ,128018:amdgpu_tlb_fence_work [amdgpu] ,127283:amdgpu_tl=
b_fence_work [amdgpu] ,128051:amdgpu_tlb_fence_work [amdgpu] ,128039:amdgpu=
_tlb_fence_work [amdgpu] ,128083:amdgpu_tlb_fence_work [amdgpu] ,128081:amd=
gpu_tlb_fence_work [amdgpu] ,128038:amdgpu_tlb_fence_work [amdgpu] ,125961
Dec 17 11:02:14 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128022:=
amdgpu_tlb_fence_work [amdgpu] ,128069:amdgpu_tlb_fence_work [amdgpu] ,1280=
02:amdgpu_tlb_fence_work [amdgpu] ,128033:amdgpu_tlb_fence_work [amdgpu] ,1=
27997:amdgpu_tlb_fence_work [amdgpu] ,128014:amdgpu_tlb_fence_work [amdgpu]=
 ,128048:amdgpu_tlb_fence_work [amdgpu]
Dec 17 11:02:14 pedro-suse kernel:   pwq 46: cpus=3D11 node=3D0 flags=3D0x0=
 nice=3D0 active=3D77 refcnt=3D78
Dec 17 11:02:14 pedro-suse kernel:     in-flight: 128129:amdgpu_tlb_fence_w=
ork [amdgpu] ,128115:amdgpu_tlb_fence_work [amdgpu] ,128093:amdgpu_tlb_fenc=
e_work [amdgpu] ,127243:amdgpu_tlb_fence_work [amdgpu] ,128099:amdgpu_tlb_f=
ence_work [amdgpu] ,128125:amdgpu_tlb_fence_work [amdgpu] ,128088:amdgpu_tl=
b_fence_work [amdgpu] ,125614:amdgpu_tlb_fence_work [amdgpu] ,128110:amdgpu=
_tlb_fence_work [amdgpu] ,128107:amdgpu_tlb_fence_work [amdgpu] ,128086:amd=
gpu_tlb_fence_work [amdgpu] ,127246:amdgpu_tlb_fence_work [amdgpu] ,127244:=
amdgpu_tlb_fence_work [amdgpu] ,128098:amdgpu_tlb_fence_work [amdgpu] ,1281=
22:amdgpu_tlb_fence_work [amdgpu] ,128082:amdgpu_tlb_fence_work [amdgpu] ,1=
28118:amdgpu_tlb_fence_work [amdgpu] ,128105:amdgpu_tlb_fence_work [amdgpu]=
 ,127031:amdgpu_tlb_fence_work [amdgpu] ,128096:amdgpu_tlb_fence_work [amdg=
pu] ,128102:amdgpu_tlb_fence_work [amdgpu] ,126930:amdgpu_tlb_fence_work [a=
mdgpu] ,128097:amdgpu_tlb_fence_work [amdgpu] ,126690:amdgpu_tlb_fence_work=
 [amdgpu] ,127245:amdgpu_tlb_fence_work [amdgpu] ,128123
Dec 17 11:02:14 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128127:=
amdgpu_tlb_fence_work [amdgpu] ,127144:amdgpu_tlb_fence_work [amdgpu] ,1280=
62:amdgpu_tlb_fence_work [amdgpu] ,128116:amdgpu_tlb_fence_work [amdgpu] ,1=
28074:amdgpu_tlb_fence_work [amdgpu] ,127147:amdgpu_tlb_fence_work [amdgpu]=
 ,128058:amdgpu_tlb_fence_work [amdgpu] ,128017:amdgpu_tlb_fence_work [amdg=
pu] ,128128:amdgpu_tlb_fence_work [amdgpu] ,127143:amdgpu_tlb_fence_work [a=
mdgpu] ,128092:amdgpu_tlb_fence_work [amdgpu] ,128104:amdgpu_tlb_fence_work=
 [amdgpu] ,128064:amdgpu_tlb_fence_work [amdgpu] ,128114:amdgpu_tlb_fence_w=
ork [amdgpu] ,128095:amdgpu_tlb_fence_work [amdgpu] ,125205:amdgpu_tlb_fenc=
e_work [amdgpu] ,128103:amdgpu_tlb_fence_work [amdgpu] ,128070:amdgpu_tlb_f=
ence_work [amdgpu] ,128119:amdgpu_tlb_fence_work [amdgpu] ,127146:amdgpu_tl=
b_fence_work [amdgpu] ,128111:amdgpu_tlb_fence_work [amdgpu] ,128108:amdgpu=
_tlb_fence_work [amdgpu] ,128094:amdgpu_tlb_fence_work [amdgpu] ,128112:amd=
gpu_tlb_fence_work [amdgpu] ,128068:amdgpu_tlb_fence_work [amdgpu] ,127242
Dec 17 11:02:14 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128120:=
amdgpu_tlb_fence_work [amdgpu] ,128091:amdgpu_tlb_fence_work [amdgpu] ,1281=
21:amdgpu_tlb_fence_work [amdgpu] ,128066:amdgpu_tlb_fence_work [amdgpu] ,1=
26931:amdgpu_tlb_fence_work [amdgpu] ,128106:amdgpu_tlb_fence_work [amdgpu]=
 ,128076:amdgpu_tlb_fence_work [amdgpu] ,128113:amdgpu_tlb_fence_work [amdg=
pu] ,128084:amdgpu_tlb_fence_work [amdgpu] ,128090:amdgpu_tlb_fence_work [a=
mdgpu] ,128117:amdgpu_tlb_fence_work [amdgpu] ,128100:amdgpu_tlb_fence_work=
 [amdgpu] ,127145:amdgpu_tlb_fence_work [amdgpu] ,128126:amdgpu_tlb_fence_w=
ork [amdgpu] ,128101:amdgpu_tlb_fence_work [amdgpu] ,125613:amdgpu_tlb_fenc=
e_work [amdgpu] ,128078:amdgpu_tlb_fence_work [amdgpu] ,128124:amdgpu_tlb_f=
ence_work [amdgpu] ,128060:amdgpu_tlb_fence_work [amdgpu] ,127030:amdgpu_tl=
b_fence_work [amdgpu] ,128056:amdgpu_tlb_fence_work [amdgpu] ,128072:amdgpu=
_tlb_fence_work [amdgpu] ,128109:amdgpu_tlb_fence_work [amdgpu] ,128080:amd=
gpu_tlb_fence_work [amdgpu] ,128054:amdgpu_tlb_fence_work [amdgpu]
Dec 17 11:02:14 pedro-suse kernel:   pwq 50: cpus=3D12 node=3D0 flags=3D0x0=
 nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:14 pedro-suse kernel:     in-flight: 127843:amdgpu_tlb_fence_w=
ork [amdgpu]
Dec 17 11:02:14 pedro-suse kernel:   pwq 58: cpus=3D14 node=3D0 flags=3D0x0=
 nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:14 pedro-suse kernel:     in-flight: 127168:ucsi_handle_connec=
tor_change [typec_ucsi]
Dec 17 11:02:14 pedro-suse kernel: workqueue events_long: flags=3D0x100
Dec 17 11:02:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:14 pedro-suse kernel:     in-flight: 128068:ucsi_resume_work [=
typec_ucsi]
Dec 17 11:02:14 pedro-suse kernel: workqueue events_unbound: flags=3D0x2
Dec 17 11:02:14 pedro-suse kernel:   pwq 64: cpus=3D0-15 flags=3D0x4 nice=
=3D0 active=3D2 refcnt=3D3
Dec 17 11:02:14 pedro-suse kernel:     in-flight: 127358:fsnotify_connector=
_destroy_workfn ,127371:fsnotify_mark_destroy_workfn
Dec 17 11:02:14 pedro-suse kernel: workqueue events_freezable: flags=3D0x104
Dec 17 11:02:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:14 pedro-suse kernel:     pending: pci_pme_list_scan
Dec 17 11:02:14 pedro-suse kernel: workqueue events_power_efficient: flags=
=3D0x180
Dec 17 11:02:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D2 refcnt=3D3
Dec 17 11:02:14 pedro-suse kernel:     pending: check_lifetime, gc_worker [=
nf_conntrack]
Dec 17 11:02:14 pedro-suse kernel: workqueue rcu_gp: flags=3D0x108
Dec 17 11:02:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:14 pedro-suse kernel:     pending: process_srcu
Dec 17 11:02:14 pedro-suse kernel: workqueue mm_percpu_wq: flags=3D0x8
Dec 17 11:02:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D2 refcnt=3D4
Dec 17 11:02:14 pedro-suse kernel:     pending: vmstat_update, lru_add_drai=
n_per_cpu BAR(138)
Dec 17 11:02:14 pedro-suse kernel: workqueue cgroup_release: flags=3D0x100
Dec 17 11:02:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D5
Dec 17 11:02:14 pedro-suse kernel:     pending: css_release_work_fn
Dec 17 11:02:14 pedro-suse kernel:     inactive: 3*css_release_work_fn
Dec 17 11:02:14 pedro-suse kernel: workqueue cgroup_bpf_destroy: flags=3D0x=
100
Dec 17 11:02:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:14 pedro-suse kernel:     pending: cgroup_bpf_release
Dec 17 11:02:14 pedro-suse kernel: workqueue kacpid: flags=3D0x100
Dec 17 11:02:14 pedro-suse kernel:   pwq 2: cpus=3D0 node=3D0 flags=3D0x0 n=
ice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:14 pedro-suse kernel:     pending: acpi_os_execute_deferred
Dec 17 11:02:14 pedro-suse kernel: workqueue ttm: flags=3D0x1a
Dec 17 11:02:14 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D12 refcnt=3D13
Dec 17 11:02:14 pedro-suse kernel:     in-flight: 121658:ttm_bo_delayed_del=
ete [ttm] ,124717:ttm_bo_delayed_delete [ttm] ,125486:ttm_bo_delayed_delete=
 [ttm] ,123928:ttm_bo_delayed_delete [ttm] ,124715:ttm_bo_delayed_delete [t=
tm] ,124714:ttm_bo_delayed_delete [ttm] ,125747:ttm_bo_delayed_delete [ttm]=
 ,124716:ttm_bo_delayed_delete [ttm] ,125238:ttm_bo_delayed_delete [ttm] ,1=
24685:ttm_bo_delayed_delete [ttm] ,125454:ttm_bo_delayed_delete [ttm] ,1232=
01:ttm_bo_delayed_delete [ttm]
Dec 17 11:02:14 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D3 refcnt=3D84
Dec 17 11:02:14 pedro-suse kernel:     in-flight: 125489:ttm_bo_delayed_del=
ete [ttm] ,125487:ttm_bo_delayed_delete [ttm] ,125452:ttm_bo_delayed_delete=
 [ttm]
Dec 17 11:02:14 pedro-suse kernel:     inactive: 80*ttm_bo_delayed_delete [=
ttm]
Dec 17 11:02:14 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D0 refcnt=3D74
Dec 17 11:02:14 pedro-suse kernel:     inactive: 73*ttm_bo_delayed_delete [=
ttm]
Dec 17 11:02:14 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D1 refcnt=3D2
Dec 17 11:02:14 pedro-suse kernel:     in-flight: 125746:ttm_bo_delayed_del=
ete [ttm]
Dec 17 11:02:14 pedro-suse kernel: pool 10: cpus=3D2 node=3D0 flags=3D0x0 n=
ice=3D0 hung=3D0s workers=3D9 idle: 126807 125733 127249 127250 127247 1272=
48 127252
Dec 17 11:02:14 pedro-suse kernel: pool 26: cpus=3D6 node=3D0 flags=3D0x0 n=
ice=3D0 hung=3D57s workers=3D18 idle: 127154 127148 127151 127152 127149 12=
5657 127155 125462 127157 127153 123834 125335 125919 125916 125917 125918 =
127158
Dec 17 11:02:14 pedro-suse kernel: pool 30: cpus=3D7 node=3D0 flags=3D0x0 n=
ice=3D0 hung=3D0s workers=3D87 idle: 128089 128132
Dec 17 11:02:14 pedro-suse kernel: pool 46: cpus=3D11 node=3D0 flags=3D0x0 =
nice=3D0 hung=3D0s workers=3D79 idle: 128130 128131
Dec 17 11:02:14 pedro-suse kernel: pool 50: cpus=3D12 node=3D0 flags=3D0x0 =
nice=3D0 hung=3D0s workers=3D14 idle: 127842 127841 127295 126294 127130 12=
6297 124712 125279 123918 126295 126091 125357 127844
Dec 17 11:02:14 pedro-suse kernel: pool 58: cpus=3D14 node=3D0 flags=3D0x0 =
nice=3D0 hung=3D0s workers=3D9 idle: 125453 127169 125455 126324 125456 126=
325 125458 127284
Dec 17 11:02:14 pedro-suse kernel: pool 64: cpus=3D0-15 flags=3D0x4 nice=3D=
0 hung=3D0s workers=3D50 idle: 127380 78856 122468 127360 126017 127359 127=
357 127369 89228 126527 127373 127382 127370 122973 127368 89229 126808 127=
366 127379 87378 127364 127376 96449 127365 127375 123703 64265 125204 1254=
82 127372 123900 127378 127356 127254 127363 121565 84204 122560 127362 127=
361 126540 88952 127381 127377 127374 127367 127384 127383
Dec 17 11:02:14 pedro-suse kernel: pool 65: cpus=3D0-15 node=3D0 flags=3D0x=
4 nice=3D-20 hung=3D0s workers=3D17 idle: 127150
Dec 17 11:02:14 pedro-suse kernel: Showing backtraces of running workers in=
 stalled CPU-bound worker pools:
Dec 17 11:02:44 pedro-suse kernel: BUG: workqueue lockup - pool cpus=3D6 no=
de=3D0 flags=3D0x0 nice=3D0 stuck for 87s!
Dec 17 11:02:44 pedro-suse kernel: Showing busy workqueues and worker pools:
Dec 17 11:02:44 pedro-suse kernel: workqueue events: flags=3D0x100
Dec 17 11:02:44 pedro-suse kernel:   pwq 10: cpus=3D2 node=3D0 flags=3D0x0 =
nice=3D0 active=3D2 refcnt=3D3
Dec 17 11:02:44 pedro-suse kernel:     in-flight: 124095:amdgpu_tlb_fence_w=
ork [amdgpu] ,127251:amdgpu_tlb_fence_work [amdgpu]
Dec 17 11:02:44 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D210 refcnt=3D211
Dec 17 11:02:44 pedro-suse kernel:     pending: delayed_vfree_work, 4*acpi_=
os_map_remove, kernfs_notify_workfn, key_garbage_collector, 2*acpi_os_map_r=
emove, 20*amdgpu_tlb_fence_work [amdgpu], acpi_os_map_remove, netstamp_clea=
r, 5*acpi_os_map_remove, amdgpu_tlb_fence_work [amdgpu], 4*acpi_os_map_remo=
ve, 3*amdgpu_tlb_fence_work [amdgpu], 45*acpi_os_map_remove, free_ipc, 5*de=
stroy_super_work, destroy_pid_namespace_work, 10*acpi_os_map_remove, yama_r=
elation_cleanup, 37*acpi_os_map_remove, 12*bpf_prog_free_deferred, 54*acpi_=
os_map_remove
Dec 17 11:02:44 pedro-suse kernel:   pwq 30: cpus=3D7 node=3D0 flags=3D0x0 =
nice=3D0 active=3D85 refcnt=3D86
Dec 17 11:02:44 pedro-suse kernel:     in-flight: 128067:amdgpu_tlb_fence_w=
ork [amdgpu] ,127991:amdgpu_tlb_fence_work [amdgpu] ,128025:amdgpu_tlb_fenc=
e_work [amdgpu] ,128045:amdgpu_tlb_fence_work [amdgpu] ,128007:amdgpu_tlb_f=
ence_work [amdgpu] ,128012:amdgpu_tlb_fence_work [amdgpu] ,125493:amdgpu_tl=
b_fence_work [amdgpu] ,128031:amdgpu_tlb_fence_work [amdgpu] ,128061:amdgpu=
_tlb_fence_work [amdgpu] ,128053:amdgpu_tlb_fence_work [amdgpu] ,128037:amd=
gpu_tlb_fence_work [amdgpu] ,128010:amdgpu_tlb_fence_work [amdgpu] ,128021:=
amdgpu_tlb_fence_work [amdgpu] ,128057:amdgpu_tlb_fence_work [amdgpu] ,1279=
92:amdgpu_tlb_fence_work [amdgpu] ,128035:amdgpu_tlb_fence_work [amdgpu] ,1=
28001:amdgpu_tlb_fence_work [amdgpu] ,128032:amdgpu_tlb_fence_work [amdgpu]=
 ,128052:amdgpu_tlb_fence_work [amdgpu] ,128079:amdgpu_tlb_fence_work [amdg=
pu] ,127438:amdgpu_tlb_fence_work [amdgpu] ,128027:amdgpu_tlb_fence_work [a=
mdgpu] ,128043:amdgpu_tlb_fence_work [amdgpu] ,128009:amdgpu_tlb_fence_work=
 [amdgpu] ,128036:amdgpu_tlb_fence_work [amdgpu] ,128030
Dec 17 11:02:44 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128085:=
amdgpu_tlb_fence_work [amdgpu] ,128075:amdgpu_tlb_fence_work [amdgpu] ,1280=
11:amdgpu_tlb_fence_work [amdgpu] ,128073:amdgpu_tlb_fence_work [amdgpu] ,1=
27297:amdgpu_tlb_fence_work [amdgpu] ,128029:amdgpu_tlb_fence_work [amdgpu]=
 ,127993:amdgpu_tlb_fence_work [amdgpu] ,128024:amdgpu_tlb_fence_work [amdg=
pu] ,128003:amdgpu_tlb_fence_work [amdgpu] ,128044:amdgpu_tlb_fence_work [a=
mdgpu] ,127996:amdgpu_tlb_fence_work [amdgpu] ,128015:amdgpu_tlb_fence_work=
 [amdgpu] ,128047:amdgpu_tlb_fence_work [amdgpu] ,128050:amdgpu_tlb_fence_w=
ork [amdgpu] ,128041:amdgpu_tlb_fence_work [amdgpu] ,127999:amdgpu_tlb_fenc=
e_work [amdgpu] ,128026:amdgpu_tlb_fence_work [amdgpu] ,128087:amdgpu_tlb_f=
ence_work [amdgpu] ,127998:amdgpu_tlb_fence_work [amdgpu] ,128042:amdgpu_tl=
b_fence_work [amdgpu] ,128008:amdgpu_tlb_fence_work [amdgpu] ,128013:amdgpu=
_tlb_fence_work [amdgpu] ,127995:amdgpu_tlb_fence_work [amdgpu] ,128055:amd=
gpu_tlb_fence_work [amdgpu] ,128006:amdgpu_tlb_fence_work [amdgpu] ,128016
Dec 17 11:02:44 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128046:=
amdgpu_tlb_fence_work [amdgpu] ,128071:amdgpu_tlb_fence_work [amdgpu] ,1280=
04:amdgpu_tlb_fence_work [amdgpu] ,128023:amdgpu_tlb_fence_work [amdgpu] ,1=
27298:amdgpu_tlb_fence_work [amdgpu] ,128034:amdgpu_tlb_fence_work [amdgpu]=
 ,128049:amdgpu_tlb_fence_work [amdgpu] ,128028:amdgpu_tlb_fence_work [amdg=
pu] ,128000:amdgpu_tlb_fence_work [amdgpu] ,128065:amdgpu_tlb_fence_work [a=
mdgpu] ,128019:amdgpu_tlb_fence_work [amdgpu] ,128063:amdgpu_tlb_fence_work=
 [amdgpu] ,127994:amdgpu_tlb_fence_work [amdgpu] ,128040:amdgpu_tlb_fence_w=
ork [amdgpu] ,128059:amdgpu_tlb_fence_work [amdgpu] ,128020:amdgpu_tlb_fenc=
e_work [amdgpu] ,128077:amdgpu_tlb_fence_work [amdgpu] ,128005:amdgpu_tlb_f=
ence_work [amdgpu] ,128018:amdgpu_tlb_fence_work [amdgpu] ,127283:amdgpu_tl=
b_fence_work [amdgpu] ,128051:amdgpu_tlb_fence_work [amdgpu] ,128039:amdgpu=
_tlb_fence_work [amdgpu] ,128083:amdgpu_tlb_fence_work [amdgpu] ,128081:amd=
gpu_tlb_fence_work [amdgpu] ,128038:amdgpu_tlb_fence_work [amdgpu] ,125961
Dec 17 11:02:44 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128022:=
amdgpu_tlb_fence_work [amdgpu] ,128069:amdgpu_tlb_fence_work [amdgpu] ,1280=
02:amdgpu_tlb_fence_work [amdgpu] ,128033:amdgpu_tlb_fence_work [amdgpu] ,1=
27997:amdgpu_tlb_fence_work [amdgpu] ,128014:amdgpu_tlb_fence_work [amdgpu]=
 ,128048:amdgpu_tlb_fence_work [amdgpu]
Dec 17 11:02:44 pedro-suse kernel:   pwq 46: cpus=3D11 node=3D0 flags=3D0x0=
 nice=3D0 active=3D77 refcnt=3D78
Dec 17 11:02:44 pedro-suse kernel:     in-flight: 128129:amdgpu_tlb_fence_w=
ork [amdgpu] ,128115:amdgpu_tlb_fence_work [amdgpu] ,128093:amdgpu_tlb_fenc=
e_work [amdgpu] ,127243:amdgpu_tlb_fence_work [amdgpu] ,128099:amdgpu_tlb_f=
ence_work [amdgpu] ,128125:amdgpu_tlb_fence_work [amdgpu] ,128088:amdgpu_tl=
b_fence_work [amdgpu] ,125614:amdgpu_tlb_fence_work [amdgpu] ,128110:amdgpu=
_tlb_fence_work [amdgpu] ,128107:amdgpu_tlb_fence_work [amdgpu] ,128086:amd=
gpu_tlb_fence_work [amdgpu] ,127246:amdgpu_tlb_fence_work [amdgpu] ,127244:=
amdgpu_tlb_fence_work [amdgpu] ,128098:amdgpu_tlb_fence_work [amdgpu] ,1281=
22:amdgpu_tlb_fence_work [amdgpu] ,128082:amdgpu_tlb_fence_work [amdgpu] ,1=
28118:amdgpu_tlb_fence_work [amdgpu] ,128105:amdgpu_tlb_fence_work [amdgpu]=
 ,127031:amdgpu_tlb_fence_work [amdgpu] ,128096:amdgpu_tlb_fence_work [amdg=
pu] ,128102:amdgpu_tlb_fence_work [amdgpu] ,126930:amdgpu_tlb_fence_work [a=
mdgpu] ,128097:amdgpu_tlb_fence_work [amdgpu] ,126690:amdgpu_tlb_fence_work=
 [amdgpu] ,127245:amdgpu_tlb_fence_work [amdgpu] ,128123
Dec 17 11:02:44 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128127:=
amdgpu_tlb_fence_work [amdgpu] ,127144:amdgpu_tlb_fence_work [amdgpu] ,1280=
62:amdgpu_tlb_fence_work [amdgpu] ,128116:amdgpu_tlb_fence_work [amdgpu] ,1=
28074:amdgpu_tlb_fence_work [amdgpu] ,127147:amdgpu_tlb_fence_work [amdgpu]=
 ,128058:amdgpu_tlb_fence_work [amdgpu] ,128017:amdgpu_tlb_fence_work [amdg=
pu] ,128128:amdgpu_tlb_fence_work [amdgpu] ,127143:amdgpu_tlb_fence_work [a=
mdgpu] ,128092:amdgpu_tlb_fence_work [amdgpu] ,128104:amdgpu_tlb_fence_work=
 [amdgpu] ,128064:amdgpu_tlb_fence_work [amdgpu] ,128114:amdgpu_tlb_fence_w=
ork [amdgpu] ,128095:amdgpu_tlb_fence_work [amdgpu] ,125205:amdgpu_tlb_fenc=
e_work [amdgpu] ,128103:amdgpu_tlb_fence_work [amdgpu] ,128070:amdgpu_tlb_f=
ence_work [amdgpu] ,128119:amdgpu_tlb_fence_work [amdgpu] ,127146:amdgpu_tl=
b_fence_work [amdgpu] ,128111:amdgpu_tlb_fence_work [amdgpu] ,128108:amdgpu=
_tlb_fence_work [amdgpu] ,128094:amdgpu_tlb_fence_work [amdgpu] ,128112:amd=
gpu_tlb_fence_work [amdgpu] ,128068:amdgpu_tlb_fence_work [amdgpu] ,127242
Dec 17 11:02:44 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128120:=
amdgpu_tlb_fence_work [amdgpu] ,128091:amdgpu_tlb_fence_work [amdgpu] ,1281=
21:amdgpu_tlb_fence_work [amdgpu] ,128066:amdgpu_tlb_fence_work [amdgpu] ,1=
26931:amdgpu_tlb_fence_work [amdgpu] ,128106:amdgpu_tlb_fence_work [amdgpu]=
 ,128076:amdgpu_tlb_fence_work [amdgpu] ,128113:amdgpu_tlb_fence_work [amdg=
pu] ,128084:amdgpu_tlb_fence_work [amdgpu] ,128090:amdgpu_tlb_fence_work [a=
mdgpu] ,128117:amdgpu_tlb_fence_work [amdgpu] ,128100:amdgpu_tlb_fence_work=
 [amdgpu] ,127145:amdgpu_tlb_fence_work [amdgpu] ,128126:amdgpu_tlb_fence_w=
ork [amdgpu] ,128101:amdgpu_tlb_fence_work [amdgpu] ,125613:amdgpu_tlb_fenc=
e_work [amdgpu] ,128078:amdgpu_tlb_fence_work [amdgpu] ,128124:amdgpu_tlb_f=
ence_work [amdgpu] ,128060:amdgpu_tlb_fence_work [amdgpu] ,127030:amdgpu_tl=
b_fence_work [amdgpu] ,128056:amdgpu_tlb_fence_work [amdgpu] ,128072:amdgpu=
_tlb_fence_work [amdgpu] ,128109:amdgpu_tlb_fence_work [amdgpu] ,128080:amd=
gpu_tlb_fence_work [amdgpu] ,128054:amdgpu_tlb_fence_work [amdgpu]
Dec 17 11:02:44 pedro-suse kernel:   pwq 50: cpus=3D12 node=3D0 flags=3D0x0=
 nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:44 pedro-suse kernel:     in-flight: 127843:amdgpu_tlb_fence_w=
ork [amdgpu]
Dec 17 11:02:44 pedro-suse kernel:   pwq 58: cpus=3D14 node=3D0 flags=3D0x0=
 nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:44 pedro-suse kernel:     in-flight: 127168:ucsi_handle_connec=
tor_change [typec_ucsi]
Dec 17 11:02:44 pedro-suse kernel: workqueue events_long: flags=3D0x100
Dec 17 11:02:44 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:44 pedro-suse kernel:     in-flight: 128068:ucsi_resume_work [=
typec_ucsi]
Dec 17 11:02:44 pedro-suse kernel: workqueue events_unbound: flags=3D0x2
Dec 17 11:02:44 pedro-suse kernel:   pwq 64: cpus=3D0-15 flags=3D0x4 nice=
=3D0 active=3D2 refcnt=3D3
Dec 17 11:02:44 pedro-suse kernel:     in-flight: 127358:fsnotify_connector=
_destroy_workfn ,127371:fsnotify_mark_destroy_workfn
Dec 17 11:02:44 pedro-suse kernel: workqueue events_freezable: flags=3D0x104
Dec 17 11:02:44 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:44 pedro-suse kernel:     pending: pci_pme_list_scan
Dec 17 11:02:44 pedro-suse kernel: workqueue events_power_efficient: flags=
=3D0x180
Dec 17 11:02:44 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D2 refcnt=3D3
Dec 17 11:02:44 pedro-suse kernel:     pending: check_lifetime, gc_worker [=
nf_conntrack]
Dec 17 11:02:44 pedro-suse kernel: workqueue rcu_gp: flags=3D0x108
Dec 17 11:02:44 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:44 pedro-suse kernel:     pending: process_srcu
Dec 17 11:02:44 pedro-suse kernel: workqueue kvfree_rcu_reclaim: flags=3D0xa
Dec 17 11:02:44 pedro-suse kernel:   pwq 64: cpus=3D0-15 flags=3D0x4 nice=
=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:44 pedro-suse kernel:     pending: kfree_rcu_monitor
Dec 17 11:02:44 pedro-suse kernel: workqueue mm_percpu_wq: flags=3D0x8
Dec 17 11:02:44 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D2 refcnt=3D4
Dec 17 11:02:44 pedro-suse kernel:     pending: vmstat_update, lru_add_drai=
n_per_cpu BAR(138)
Dec 17 11:02:44 pedro-suse kernel: workqueue pm: flags=3D0x6
Dec 17 11:02:44 pedro-suse kernel:   pwq 64: cpus=3D0-15 flags=3D0x4 nice=
=3D0 active=3D11 refcnt=3D12
Dec 17 11:02:44 pedro-suse kernel:     in-flight: 89228:pm_runtime_work pm_=
runtime_work ,127360:pm_runtime_work pm_runtime_work ,127370:pm_runtime_wor=
k pm_runtime_work ,78856:pm_runtime_work pm_runtime_work ,89229:pm_runtime_=
work pm_runtime_work ,126017:pm_runtime_work
Dec 17 11:02:44 pedro-suse kernel:   pwq 64: cpus=3D0-15 flags=3D0x4 nice=
=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:44 pedro-suse kernel:     in-flight: 122973:pm_runtime_work
Dec 17 11:02:44 pedro-suse kernel: workqueue cgroup_release: flags=3D0x100
Dec 17 11:02:44 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D5
Dec 17 11:02:44 pedro-suse kernel:     pending: css_release_work_fn
Dec 17 11:02:44 pedro-suse kernel:     inactive: 3*css_release_work_fn
Dec 17 11:02:44 pedro-suse kernel: workqueue cgroup_bpf_destroy: flags=3D0x=
100
Dec 17 11:02:44 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:02:44 pedro-suse kernel:     pending: cgroup_bpf_release
Dec 17 11:02:44 pedro-suse kernel: workqueue kcryptd-254:0-1: flags=3D0x4a
Dec 17 11:02:44 pedro-suse kernel:   pwq 64: cpus=3D0-15 flags=3D0x4 nice=
=3D0 active=3D11 refcnt=3D29
Dec 17 11:02:44 pedro-suse kernel:     pending: 11*kcryptd_crypt [dm_crypt]
Dec 17 11:02:44 pedro-suse kernel:     inactive: 17*kcryptd_crypt [dm_crypt]
Dec 17 11:02:44 pedro-suse kernel:   pwq 64: cpus=3D0-15 flags=3D0x4 nice=
=3D0 active=3D5 refcnt=3D77
Dec 17 11:02:44 pedro-suse kernel:     pending: 5*kcryptd_crypt [dm_crypt]
Dec 17 11:02:44 pedro-suse kernel:     inactive: 71*kcryptd_crypt [dm_crypt]
Dec 17 11:02:44 pedro-suse kernel: workqueue ttm: flags=3D0x1a
Dec 17 11:02:44 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D12 refcnt=3D13
Dec 17 11:02:44 pedro-suse kernel:     in-flight: 121658:ttm_bo_delayed_del=
ete [ttm] ,124717:ttm_bo_delayed_delete [ttm] ,125486:ttm_bo_delayed_delete=
 [ttm] ,123928:ttm_bo_delayed_delete [ttm] ,124715:ttm_bo_delayed_delete [t=
tm] ,124714:ttm_bo_delayed_delete [ttm] ,125747:ttm_bo_delayed_delete [ttm]=
 ,124716:ttm_bo_delayed_delete [ttm] ,125238:ttm_bo_delayed_delete [ttm] ,1=
24685:ttm_bo_delayed_delete [ttm] ,125454:ttm_bo_delayed_delete [ttm] ,1232=
01:ttm_bo_delayed_delete [ttm]
Dec 17 11:02:44 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D3 refcnt=3D84
Dec 17 11:02:44 pedro-suse kernel:     in-flight: 125489:ttm_bo_delayed_del=
ete [ttm] ,125487:ttm_bo_delayed_delete [ttm] ,125452:ttm_bo_delayed_delete=
 [ttm]
Dec 17 11:02:44 pedro-suse kernel:     inactive: 80*ttm_bo_delayed_delete [=
ttm]
Dec 17 11:02:44 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D0 refcnt=3D74
Dec 17 11:02:44 pedro-suse kernel:     inactive: 73*ttm_bo_delayed_delete [=
ttm]
Dec 17 11:02:44 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D1 refcnt=3D2
Dec 17 11:02:44 pedro-suse kernel:     in-flight: 125746:ttm_bo_delayed_del=
ete [ttm]
Dec 17 11:02:44 pedro-suse kernel: pool 10: cpus=3D2 node=3D0 flags=3D0x0 n=
ice=3D0 hung=3D0s workers=3D9 idle: 126807 125733 127249 127250 127247 1272=
48 127252
Dec 17 11:02:44 pedro-suse kernel: pool 26: cpus=3D6 node=3D0 flags=3D0x0 n=
ice=3D0 hung=3D87s workers=3D18 idle: 127154 127148 127151 127152 127149 12=
5657 127155 125462 127157 127153 123834 125335 125919 125916 125917 125918 =
127158
Dec 17 11:02:44 pedro-suse kernel: pool 30: cpus=3D7 node=3D0 flags=3D0x0 n=
ice=3D0 hung=3D0s workers=3D87 idle: 128089 128132
Dec 17 11:02:44 pedro-suse kernel: pool 46: cpus=3D11 node=3D0 flags=3D0x0 =
nice=3D0 hung=3D0s workers=3D79 idle: 128130 128131
Dec 17 11:02:44 pedro-suse kernel: pool 50: cpus=3D12 node=3D0 flags=3D0x0 =
nice=3D0 hung=3D0s workers=3D14 idle: 127842 127841 127295 126294 127130 12=
6297 124712 125279 123918 126295 126091 125357 127844
Dec 17 11:02:44 pedro-suse kernel: pool 58: cpus=3D14 node=3D0 flags=3D0x0 =
nice=3D0 hung=3D0s workers=3D9 idle: 125453 127169 125455 126324 125456 126=
325 125458 127284
Dec 17 11:02:44 pedro-suse kernel: pool 64: cpus=3D0-15 flags=3D0x4 nice=3D=
0 hung=3D0s workers=3D50 idle: 127359 127380 127369 126527 127357 127368 12=
7373 127382 122468 126808 127366 127379 87378 127364 127376 96449 127365 12=
7375 123703 64265 125204 125482 127372 123900 127378 127356 127254 127363 1=
21565 84204 122560 127362 127361 126540 88952 127381 127377 127374 127367 1=
27384 127383
Dec 17 11:02:44 pedro-suse kernel: pool 65: cpus=3D0-15 node=3D0 flags=3D0x=
4 nice=3D-20 hung=3D0s workers=3D17 idle: 127150
Dec 17 11:02:44 pedro-suse kernel: Showing backtraces of running workers in=
 stalled CPU-bound worker pools:
Dec 17 11:03:14 pedro-suse kernel: BUG: workqueue lockup - pool cpus=3D6 no=
de=3D0 flags=3D0x0 nice=3D0 stuck for 117s!
Dec 17 11:03:14 pedro-suse kernel: Showing busy workqueues and worker pools:
Dec 17 11:03:14 pedro-suse kernel: workqueue events: flags=3D0x100
Dec 17 11:03:14 pedro-suse kernel:   pwq 10: cpus=3D2 node=3D0 flags=3D0x0 =
nice=3D0 active=3D2 refcnt=3D3
Dec 17 11:03:14 pedro-suse kernel:     in-flight: 124095:amdgpu_tlb_fence_w=
ork [amdgpu] ,127251:amdgpu_tlb_fence_work [amdgpu]
Dec 17 11:03:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D272 refcnt=3D273
Dec 17 11:03:14 pedro-suse kernel:     pending: delayed_vfree_work, 4*acpi_=
os_map_remove, kernfs_notify_workfn, key_garbage_collector, 2*acpi_os_map_r=
emove, 20*amdgpu_tlb_fence_work [amdgpu], acpi_os_map_remove, netstamp_clea=
r, 5*acpi_os_map_remove, amdgpu_tlb_fence_work [amdgpu], 4*acpi_os_map_remo=
ve, 3*amdgpu_tlb_fence_work [amdgpu], 45*acpi_os_map_remove, free_ipc, 5*de=
stroy_super_work, destroy_pid_namespace_work, 10*acpi_os_map_remove, yama_r=
elation_cleanup, 37*acpi_os_map_remove, 12*bpf_prog_free_deferred, 97*acpi_=
os_map_remove, bpf_prog_free_deferred, 18*acpi_os_map_remove
Dec 17 11:03:14 pedro-suse kernel:   pwq 30: cpus=3D7 node=3D0 flags=3D0x0 =
nice=3D0 active=3D85 refcnt=3D86
Dec 17 11:03:14 pedro-suse kernel:     in-flight: 128067:amdgpu_tlb_fence_w=
ork [amdgpu] ,127991:amdgpu_tlb_fence_work [amdgpu] ,128025:amdgpu_tlb_fenc=
e_work [amdgpu] ,128045:amdgpu_tlb_fence_work [amdgpu] ,128007:amdgpu_tlb_f=
ence_work [amdgpu] ,128012:amdgpu_tlb_fence_work [amdgpu] ,125493:amdgpu_tl=
b_fence_work [amdgpu] ,128031:amdgpu_tlb_fence_work [amdgpu] ,128061:amdgpu=
_tlb_fence_work [amdgpu] ,128053:amdgpu_tlb_fence_work [amdgpu] ,128037:amd=
gpu_tlb_fence_work [amdgpu] ,128010:amdgpu_tlb_fence_work [amdgpu] ,128021:=
amdgpu_tlb_fence_work [amdgpu] ,128057:amdgpu_tlb_fence_work [amdgpu] ,1279=
92:amdgpu_tlb_fence_work [amdgpu] ,128035:amdgpu_tlb_fence_work [amdgpu] ,1=
28001:amdgpu_tlb_fence_work [amdgpu] ,128032:amdgpu_tlb_fence_work [amdgpu]=
 ,128052:amdgpu_tlb_fence_work [amdgpu] ,128079:amdgpu_tlb_fence_work [amdg=
pu] ,127438:amdgpu_tlb_fence_work [amdgpu] ,128027:amdgpu_tlb_fence_work [a=
mdgpu] ,128043:amdgpu_tlb_fence_work [amdgpu] ,128009:amdgpu_tlb_fence_work=
 [amdgpu] ,128036:amdgpu_tlb_fence_work [amdgpu] ,128030
Dec 17 11:03:14 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128085:=
amdgpu_tlb_fence_work [amdgpu] ,128075:amdgpu_tlb_fence_work [amdgpu] ,1280=
11:amdgpu_tlb_fence_work [amdgpu] ,128073:amdgpu_tlb_fence_work [amdgpu] ,1=
27297:amdgpu_tlb_fence_work [amdgpu] ,128029:amdgpu_tlb_fence_work [amdgpu]=
 ,127993:amdgpu_tlb_fence_work [amdgpu] ,128024:amdgpu_tlb_fence_work [amdg=
pu] ,128003:amdgpu_tlb_fence_work [amdgpu] ,128044:amdgpu_tlb_fence_work [a=
mdgpu] ,127996:amdgpu_tlb_fence_work [amdgpu] ,128015:amdgpu_tlb_fence_work=
 [amdgpu] ,128047:amdgpu_tlb_fence_work [amdgpu] ,128050:amdgpu_tlb_fence_w=
ork [amdgpu] ,128041:amdgpu_tlb_fence_work [amdgpu] ,127999:amdgpu_tlb_fenc=
e_work [amdgpu] ,128026:amdgpu_tlb_fence_work [amdgpu] ,128087:amdgpu_tlb_f=
ence_work [amdgpu] ,127998:amdgpu_tlb_fence_work [amdgpu] ,128042:amdgpu_tl=
b_fence_work [amdgpu] ,128008:amdgpu_tlb_fence_work [amdgpu] ,128013:amdgpu=
_tlb_fence_work [amdgpu] ,127995:amdgpu_tlb_fence_work [amdgpu] ,128055:amd=
gpu_tlb_fence_work [amdgpu] ,128006:amdgpu_tlb_fence_work [amdgpu] ,128016
Dec 17 11:03:14 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128046:=
amdgpu_tlb_fence_work [amdgpu] ,128071:amdgpu_tlb_fence_work [amdgpu] ,1280=
04:amdgpu_tlb_fence_work [amdgpu] ,128023:amdgpu_tlb_fence_work [amdgpu] ,1=
27298:amdgpu_tlb_fence_work [amdgpu] ,128034:amdgpu_tlb_fence_work [amdgpu]=
 ,128049:amdgpu_tlb_fence_work [amdgpu] ,128028:amdgpu_tlb_fence_work [amdg=
pu] ,128000:amdgpu_tlb_fence_work [amdgpu] ,128065:amdgpu_tlb_fence_work [a=
mdgpu] ,128019:amdgpu_tlb_fence_work [amdgpu] ,128063:amdgpu_tlb_fence_work=
 [amdgpu] ,127994:amdgpu_tlb_fence_work [amdgpu] ,128040:amdgpu_tlb_fence_w=
ork [amdgpu] ,128059:amdgpu_tlb_fence_work [amdgpu] ,128020:amdgpu_tlb_fenc=
e_work [amdgpu] ,128077:amdgpu_tlb_fence_work [amdgpu] ,128005:amdgpu_tlb_f=
ence_work [amdgpu] ,128018:amdgpu_tlb_fence_work [amdgpu] ,127283:amdgpu_tl=
b_fence_work [amdgpu] ,128051:amdgpu_tlb_fence_work [amdgpu] ,128039:amdgpu=
_tlb_fence_work [amdgpu] ,128083:amdgpu_tlb_fence_work [amdgpu] ,128081:amd=
gpu_tlb_fence_work [amdgpu] ,128038:amdgpu_tlb_fence_work [amdgpu] ,125961
Dec 17 11:03:14 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128022:=
amdgpu_tlb_fence_work [amdgpu] ,128069:amdgpu_tlb_fence_work [amdgpu] ,1280=
02:amdgpu_tlb_fence_work [amdgpu] ,128033:amdgpu_tlb_fence_work [amdgpu] ,1=
27997:amdgpu_tlb_fence_work [amdgpu] ,128014:amdgpu_tlb_fence_work [amdgpu]=
 ,128048:amdgpu_tlb_fence_work [amdgpu]
Dec 17 11:03:14 pedro-suse kernel:   pwq 46: cpus=3D11 node=3D0 flags=3D0x0=
 nice=3D0 active=3D77 refcnt=3D78
Dec 17 11:03:14 pedro-suse kernel:     in-flight: 128129:amdgpu_tlb_fence_w=
ork [amdgpu] ,128115:amdgpu_tlb_fence_work [amdgpu] ,128093:amdgpu_tlb_fenc=
e_work [amdgpu] ,127243:amdgpu_tlb_fence_work [amdgpu] ,128099:amdgpu_tlb_f=
ence_work [amdgpu] ,128125:amdgpu_tlb_fence_work [amdgpu] ,128088:amdgpu_tl=
b_fence_work [amdgpu] ,125614:amdgpu_tlb_fence_work [amdgpu] ,128110:amdgpu=
_tlb_fence_work [amdgpu] ,128107:amdgpu_tlb_fence_work [amdgpu] ,128086:amd=
gpu_tlb_fence_work [amdgpu] ,127246:amdgpu_tlb_fence_work [amdgpu] ,127244:=
amdgpu_tlb_fence_work [amdgpu] ,128098:amdgpu_tlb_fence_work [amdgpu] ,1281=
22:amdgpu_tlb_fence_work [amdgpu] ,128082:amdgpu_tlb_fence_work [amdgpu] ,1=
28118:amdgpu_tlb_fence_work [amdgpu] ,128105:amdgpu_tlb_fence_work [amdgpu]=
 ,127031:amdgpu_tlb_fence_work [amdgpu] ,128096:amdgpu_tlb_fence_work [amdg=
pu] ,128102:amdgpu_tlb_fence_work [amdgpu] ,126930:amdgpu_tlb_fence_work [a=
mdgpu] ,128097:amdgpu_tlb_fence_work [amdgpu] ,126690:amdgpu_tlb_fence_work=
 [amdgpu] ,127245:amdgpu_tlb_fence_work [amdgpu] ,128123
Dec 17 11:03:14 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128127:=
amdgpu_tlb_fence_work [amdgpu] ,127144:amdgpu_tlb_fence_work [amdgpu] ,1280=
62:amdgpu_tlb_fence_work [amdgpu] ,128116:amdgpu_tlb_fence_work [amdgpu] ,1=
28074:amdgpu_tlb_fence_work [amdgpu] ,127147:amdgpu_tlb_fence_work [amdgpu]=
 ,128058:amdgpu_tlb_fence_work [amdgpu] ,128017:amdgpu_tlb_fence_work [amdg=
pu] ,128128:amdgpu_tlb_fence_work [amdgpu] ,127143:amdgpu_tlb_fence_work [a=
mdgpu] ,128092:amdgpu_tlb_fence_work [amdgpu] ,128104:amdgpu_tlb_fence_work=
 [amdgpu] ,128064:amdgpu_tlb_fence_work [amdgpu] ,128114:amdgpu_tlb_fence_w=
ork [amdgpu] ,128095:amdgpu_tlb_fence_work [amdgpu] ,125205:amdgpu_tlb_fenc=
e_work [amdgpu] ,128103:amdgpu_tlb_fence_work [amdgpu] ,128070:amdgpu_tlb_f=
ence_work [amdgpu] ,128119:amdgpu_tlb_fence_work [amdgpu] ,127146:amdgpu_tl=
b_fence_work [amdgpu] ,128111:amdgpu_tlb_fence_work [amdgpu] ,128108:amdgpu=
_tlb_fence_work [amdgpu] ,128094:amdgpu_tlb_fence_work [amdgpu] ,128112:amd=
gpu_tlb_fence_work [amdgpu] ,128068:amdgpu_tlb_fence_work [amdgpu] ,127242
Dec 17 11:03:14 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128120:=
amdgpu_tlb_fence_work [amdgpu] ,128091:amdgpu_tlb_fence_work [amdgpu] ,1281=
21:amdgpu_tlb_fence_work [amdgpu] ,128066:amdgpu_tlb_fence_work [amdgpu] ,1=
26931:amdgpu_tlb_fence_work [amdgpu] ,128106:amdgpu_tlb_fence_work [amdgpu]=
 ,128076:amdgpu_tlb_fence_work [amdgpu] ,128113:amdgpu_tlb_fence_work [amdg=
pu] ,128084:amdgpu_tlb_fence_work [amdgpu] ,128090:amdgpu_tlb_fence_work [a=
mdgpu] ,128117:amdgpu_tlb_fence_work [amdgpu] ,128100:amdgpu_tlb_fence_work=
 [amdgpu] ,127145:amdgpu_tlb_fence_work [amdgpu] ,128126:amdgpu_tlb_fence_w=
ork [amdgpu] ,128101:amdgpu_tlb_fence_work [amdgpu] ,125613:amdgpu_tlb_fenc=
e_work [amdgpu] ,128078:amdgpu_tlb_fence_work [amdgpu] ,128124:amdgpu_tlb_f=
ence_work [amdgpu] ,128060:amdgpu_tlb_fence_work [amdgpu] ,127030:amdgpu_tl=
b_fence_work [amdgpu] ,128056:amdgpu_tlb_fence_work [amdgpu] ,128072:amdgpu=
_tlb_fence_work [amdgpu] ,128109:amdgpu_tlb_fence_work [amdgpu] ,128080:amd=
gpu_tlb_fence_work [amdgpu] ,128054:amdgpu_tlb_fence_work [amdgpu]
Dec 17 11:03:14 pedro-suse kernel:   pwq 50: cpus=3D12 node=3D0 flags=3D0x0=
 nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:14 pedro-suse kernel:     in-flight: 127843:amdgpu_tlb_fence_w=
ork [amdgpu]
Dec 17 11:03:14 pedro-suse kernel:   pwq 58: cpus=3D14 node=3D0 flags=3D0x0=
 nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:14 pedro-suse kernel:     in-flight: 127168:ucsi_handle_connec=
tor_change [typec_ucsi]
Dec 17 11:03:14 pedro-suse kernel: workqueue events_long: flags=3D0x100
Dec 17 11:03:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:14 pedro-suse kernel:     in-flight: 128068:ucsi_resume_work [=
typec_ucsi]
Dec 17 11:03:14 pedro-suse kernel: workqueue events_unbound: flags=3D0x2
Dec 17 11:03:14 pedro-suse kernel:   pwq 64: cpus=3D0-15 flags=3D0x4 nice=
=3D0 active=3D2 refcnt=3D3
Dec 17 11:03:14 pedro-suse kernel:     in-flight: 127358:fsnotify_connector=
_destroy_workfn ,127371:fsnotify_mark_destroy_workfn
Dec 17 11:03:14 pedro-suse kernel: workqueue events_freezable: flags=3D0x104
Dec 17 11:03:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:14 pedro-suse kernel:     pending: pci_pme_list_scan
Dec 17 11:03:14 pedro-suse kernel: workqueue events_power_efficient: flags=
=3D0x180
Dec 17 11:03:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D2 refcnt=3D3
Dec 17 11:03:14 pedro-suse kernel:     pending: check_lifetime, gc_worker [=
nf_conntrack]
Dec 17 11:03:14 pedro-suse kernel: workqueue rcu_gp: flags=3D0x108
Dec 17 11:03:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:14 pedro-suse kernel:     pending: process_srcu
Dec 17 11:03:14 pedro-suse kernel: workqueue mm_percpu_wq: flags=3D0x8
Dec 17 11:03:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D2 refcnt=3D4
Dec 17 11:03:14 pedro-suse kernel:     pending: vmstat_update, lru_add_drai=
n_per_cpu BAR(138)
Dec 17 11:03:14 pedro-suse kernel: workqueue pm: flags=3D0x6
Dec 17 11:03:14 pedro-suse kernel:   pwq 64: cpus=3D0-15 flags=3D0x4 nice=
=3D0 active=3D6 refcnt=3D7
Dec 17 11:03:14 pedro-suse kernel:     in-flight: 126017:pm_runtime_work ,1=
27360:pm_runtime_work ,89229:pm_runtime_work ,78856:pm_runtime_work ,127380=
:pm_runtime_work ,127369:pm_runtime_work
Dec 17 11:03:14 pedro-suse kernel:   pwq 64: cpus=3D0-15 flags=3D0x4 nice=
=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:14 pedro-suse kernel:     in-flight: 127368:pm_runtime_work
Dec 17 11:03:14 pedro-suse kernel: workqueue cgroup_release: flags=3D0x100
Dec 17 11:03:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D5
Dec 17 11:03:14 pedro-suse kernel:     pending: css_release_work_fn
Dec 17 11:03:14 pedro-suse kernel:     inactive: 3*css_release_work_fn
Dec 17 11:03:14 pedro-suse kernel: workqueue cgroup_bpf_destroy: flags=3D0x=
100
Dec 17 11:03:14 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:14 pedro-suse kernel:     pending: cgroup_bpf_release
Dec 17 11:03:14 pedro-suse kernel: workqueue ttm: flags=3D0x1a
Dec 17 11:03:14 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D12 refcnt=3D13
Dec 17 11:03:14 pedro-suse kernel:     in-flight: 121658:ttm_bo_delayed_del=
ete [ttm] ,124717:ttm_bo_delayed_delete [ttm] ,125486:ttm_bo_delayed_delete=
 [ttm] ,123928:ttm_bo_delayed_delete [ttm] ,124715:ttm_bo_delayed_delete [t=
tm] ,124714:ttm_bo_delayed_delete [ttm] ,125747:ttm_bo_delayed_delete [ttm]=
 ,124716:ttm_bo_delayed_delete [ttm] ,125238:ttm_bo_delayed_delete [ttm] ,1=
24685:ttm_bo_delayed_delete [ttm] ,125454:ttm_bo_delayed_delete [ttm] ,1232=
01:ttm_bo_delayed_delete [ttm]
Dec 17 11:03:14 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D3 refcnt=3D84
Dec 17 11:03:14 pedro-suse kernel:     in-flight: 125489:ttm_bo_delayed_del=
ete [ttm] ,125487:ttm_bo_delayed_delete [ttm] ,125452:ttm_bo_delayed_delete=
 [ttm]
Dec 17 11:03:14 pedro-suse kernel:     inactive: 80*ttm_bo_delayed_delete [=
ttm]
Dec 17 11:03:14 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D0 refcnt=3D74
Dec 17 11:03:14 pedro-suse kernel:     inactive: 73*ttm_bo_delayed_delete [=
ttm]
Dec 17 11:03:14 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D1 refcnt=3D2
Dec 17 11:03:14 pedro-suse kernel:     in-flight: 125746:ttm_bo_delayed_del=
ete [ttm]
Dec 17 11:03:14 pedro-suse kernel: pool 10: cpus=3D2 node=3D0 flags=3D0x0 n=
ice=3D0 hung=3D0s workers=3D9 idle: 126807 125733 127249 127250 127247 1272=
48 127252
Dec 17 11:03:14 pedro-suse kernel: pool 26: cpus=3D6 node=3D0 flags=3D0x0 n=
ice=3D0 hung=3D117s workers=3D18 idle: 127154 127148 127151 127152 127149 1=
25657 127155 125462 127157 127153 123834 125335 125919 125916 125917 125918=
 127158
Dec 17 11:03:14 pedro-suse kernel: pool 30: cpus=3D7 node=3D0 flags=3D0x0 n=
ice=3D0 hung=3D0s workers=3D87 idle: 128089 128132
Dec 17 11:03:14 pedro-suse kernel: pool 46: cpus=3D11 node=3D0 flags=3D0x0 =
nice=3D0 hung=3D0s workers=3D79 idle: 128130 128131
Dec 17 11:03:14 pedro-suse kernel: pool 50: cpus=3D12 node=3D0 flags=3D0x0 =
nice=3D0 hung=3D0s workers=3D14 idle: 127842 127841 127295 126294 127130 12=
6297 124712 125279 123918 126295 126091 125357 127844
Dec 17 11:03:14 pedro-suse kernel: pool 58: cpus=3D14 node=3D0 flags=3D0x0 =
nice=3D0 hung=3D0s workers=3D9 idle: 125453 127169 125455 126324 125456 126=
325 125458 127284
Dec 17 11:03:14 pedro-suse kernel: pool 64: cpus=3D0-15 flags=3D0x4 nice=3D=
0 hung=3D0s workers=3D50 idle: 127370 127366 127373 89228 122468 122973 127=
359 127357 127382 126808 126527 127379 87378 127364 127376 96449 127365 127=
375 123703 64265 125204 125482 127372 123900 127378 127356 127254 127363 12=
1565 84204 122560 127362 127361 126540 88952 127381 127377 127374 127367 12=
7384 127383
Dec 17 11:03:14 pedro-suse kernel: pool 65: cpus=3D0-15 node=3D0 flags=3D0x=
4 nice=3D-20 hung=3D0s workers=3D17 idle: 127150
Dec 17 11:03:14 pedro-suse kernel: Showing backtraces of running workers in=
 stalled CPU-bound worker pools:
Dec 17 11:03:45 pedro-suse kernel: BUG: workqueue lockup - pool cpus=3D6 no=
de=3D0 flags=3D0x0 nice=3D0 stuck for 147s!
Dec 17 11:03:45 pedro-suse kernel: Showing busy workqueues and worker pools:
Dec 17 11:03:45 pedro-suse kernel: workqueue events: flags=3D0x100
Dec 17 11:03:45 pedro-suse kernel:   pwq 10: cpus=3D2 node=3D0 flags=3D0x0 =
nice=3D0 active=3D2 refcnt=3D3
Dec 17 11:03:45 pedro-suse kernel:     in-flight: 124095:amdgpu_tlb_fence_w=
ork [amdgpu] ,127251:amdgpu_tlb_fence_work [amdgpu]
Dec 17 11:03:45 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D320 refcnt=3D321
Dec 17 11:03:45 pedro-suse kernel:     pending: delayed_vfree_work, 4*acpi_=
os_map_remove, kernfs_notify_workfn, key_garbage_collector, 2*acpi_os_map_r=
emove, 20*amdgpu_tlb_fence_work [amdgpu], acpi_os_map_remove, netstamp_clea=
r, 5*acpi_os_map_remove, amdgpu_tlb_fence_work [amdgpu], 4*acpi_os_map_remo=
ve, 3*amdgpu_tlb_fence_work [amdgpu], 45*acpi_os_map_remove, free_ipc, 5*de=
stroy_super_work, destroy_pid_namespace_work, 10*acpi_os_map_remove, yama_r=
elation_cleanup, 37*acpi_os_map_remove, 12*bpf_prog_free_deferred, 97*acpi_=
os_map_remove, bpf_prog_free_deferred, 66*acpi_os_map_remove
Dec 17 11:03:45 pedro-suse kernel:   pwq 30: cpus=3D7 node=3D0 flags=3D0x0 =
nice=3D0 active=3D85 refcnt=3D86
Dec 17 11:03:45 pedro-suse kernel:     in-flight: 128067:amdgpu_tlb_fence_w=
ork [amdgpu] ,127991:amdgpu_tlb_fence_work [amdgpu] ,128025:amdgpu_tlb_fenc=
e_work [amdgpu] ,128045:amdgpu_tlb_fence_work [amdgpu] ,128007:amdgpu_tlb_f=
ence_work [amdgpu] ,128012:amdgpu_tlb_fence_work [amdgpu] ,125493:amdgpu_tl=
b_fence_work [amdgpu] ,128031:amdgpu_tlb_fence_work [amdgpu] ,128061:amdgpu=
_tlb_fence_work [amdgpu] ,128053:amdgpu_tlb_fence_work [amdgpu] ,128037:amd=
gpu_tlb_fence_work [amdgpu] ,128010:amdgpu_tlb_fence_work [amdgpu] ,128021:=
amdgpu_tlb_fence_work [amdgpu] ,128057:amdgpu_tlb_fence_work [amdgpu] ,1279=
92:amdgpu_tlb_fence_work [amdgpu] ,128035:amdgpu_tlb_fence_work [amdgpu] ,1=
28001:amdgpu_tlb_fence_work [amdgpu] ,128032:amdgpu_tlb_fence_work [amdgpu]=
 ,128052:amdgpu_tlb_fence_work [amdgpu] ,128079:amdgpu_tlb_fence_work [amdg=
pu] ,127438:amdgpu_tlb_fence_work [amdgpu] ,128027:amdgpu_tlb_fence_work [a=
mdgpu] ,128043:amdgpu_tlb_fence_work [amdgpu] ,128009:amdgpu_tlb_fence_work=
 [amdgpu] ,128036:amdgpu_tlb_fence_work [amdgpu] ,128030
Dec 17 11:03:45 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128085:=
amdgpu_tlb_fence_work [amdgpu] ,128075:amdgpu_tlb_fence_work [amdgpu] ,1280=
11:amdgpu_tlb_fence_work [amdgpu] ,128073:amdgpu_tlb_fence_work [amdgpu] ,1=
27297:amdgpu_tlb_fence_work [amdgpu] ,128029:amdgpu_tlb_fence_work [amdgpu]=
 ,127993:amdgpu_tlb_fence_work [amdgpu] ,128024:amdgpu_tlb_fence_work [amdg=
pu] ,128003:amdgpu_tlb_fence_work [amdgpu] ,128044:amdgpu_tlb_fence_work [a=
mdgpu] ,127996:amdgpu_tlb_fence_work [amdgpu] ,128015:amdgpu_tlb_fence_work=
 [amdgpu] ,128047:amdgpu_tlb_fence_work [amdgpu] ,128050:amdgpu_tlb_fence_w=
ork [amdgpu] ,128041:amdgpu_tlb_fence_work [amdgpu] ,127999:amdgpu_tlb_fenc=
e_work [amdgpu] ,128026:amdgpu_tlb_fence_work [amdgpu] ,128087:amdgpu_tlb_f=
ence_work [amdgpu] ,127998:amdgpu_tlb_fence_work [amdgpu] ,128042:amdgpu_tl=
b_fence_work [amdgpu] ,128008:amdgpu_tlb_fence_work [amdgpu] ,128013:amdgpu=
_tlb_fence_work [amdgpu] ,127995:amdgpu_tlb_fence_work [amdgpu] ,128055:amd=
gpu_tlb_fence_work [amdgpu] ,128006:amdgpu_tlb_fence_work [amdgpu] ,128016
Dec 17 11:03:45 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128046:=
amdgpu_tlb_fence_work [amdgpu] ,128071:amdgpu_tlb_fence_work [amdgpu] ,1280=
04:amdgpu_tlb_fence_work [amdgpu] ,128023:amdgpu_tlb_fence_work [amdgpu] ,1=
27298:amdgpu_tlb_fence_work [amdgpu] ,128034:amdgpu_tlb_fence_work [amdgpu]=
 ,128049:amdgpu_tlb_fence_work [amdgpu] ,128028:amdgpu_tlb_fence_work [amdg=
pu] ,128000:amdgpu_tlb_fence_work [amdgpu] ,128065:amdgpu_tlb_fence_work [a=
mdgpu] ,128019:amdgpu_tlb_fence_work [amdgpu] ,128063:amdgpu_tlb_fence_work=
 [amdgpu] ,127994:amdgpu_tlb_fence_work [amdgpu] ,128040:amdgpu_tlb_fence_w=
ork [amdgpu] ,128059:amdgpu_tlb_fence_work [amdgpu] ,128020:amdgpu_tlb_fenc=
e_work [amdgpu] ,128077:amdgpu_tlb_fence_work [amdgpu] ,128005:amdgpu_tlb_f=
ence_work [amdgpu] ,128018:amdgpu_tlb_fence_work [amdgpu] ,127283:amdgpu_tl=
b_fence_work [amdgpu] ,128051:amdgpu_tlb_fence_work [amdgpu] ,128039:amdgpu=
_tlb_fence_work [amdgpu] ,128083:amdgpu_tlb_fence_work [amdgpu] ,128081:amd=
gpu_tlb_fence_work [amdgpu] ,128038:amdgpu_tlb_fence_work [amdgpu] ,125961
Dec 17 11:03:45 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128022:=
amdgpu_tlb_fence_work [amdgpu] ,128069:amdgpu_tlb_fence_work [amdgpu] ,1280=
02:amdgpu_tlb_fence_work [amdgpu] ,128033:amdgpu_tlb_fence_work [amdgpu] ,1=
27997:amdgpu_tlb_fence_work [amdgpu] ,128014:amdgpu_tlb_fence_work [amdgpu]=
 ,128048:amdgpu_tlb_fence_work [amdgpu]
Dec 17 11:03:45 pedro-suse kernel:   pwq 46: cpus=3D11 node=3D0 flags=3D0x0=
 nice=3D0 active=3D77 refcnt=3D78
Dec 17 11:03:45 pedro-suse kernel:     in-flight: 128129:amdgpu_tlb_fence_w=
ork [amdgpu] ,128115:amdgpu_tlb_fence_work [amdgpu] ,128093:amdgpu_tlb_fenc=
e_work [amdgpu] ,127243:amdgpu_tlb_fence_work [amdgpu] ,128099:amdgpu_tlb_f=
ence_work [amdgpu] ,128125:amdgpu_tlb_fence_work [amdgpu] ,128088:amdgpu_tl=
b_fence_work [amdgpu] ,125614:amdgpu_tlb_fence_work [amdgpu] ,128110:amdgpu=
_tlb_fence_work [amdgpu] ,128107:amdgpu_tlb_fence_work [amdgpu] ,128086:amd=
gpu_tlb_fence_work [amdgpu] ,127246:amdgpu_tlb_fence_work [amdgpu] ,127244:=
amdgpu_tlb_fence_work [amdgpu] ,128098:amdgpu_tlb_fence_work [amdgpu] ,1281=
22:amdgpu_tlb_fence_work [amdgpu] ,128082:amdgpu_tlb_fence_work [amdgpu] ,1=
28118:amdgpu_tlb_fence_work [amdgpu] ,128105:amdgpu_tlb_fence_work [amdgpu]=
 ,127031:amdgpu_tlb_fence_work [amdgpu] ,128096:amdgpu_tlb_fence_work [amdg=
pu] ,128102:amdgpu_tlb_fence_work [amdgpu] ,126930:amdgpu_tlb_fence_work [a=
mdgpu] ,128097:amdgpu_tlb_fence_work [amdgpu] ,126690:amdgpu_tlb_fence_work=
 [amdgpu] ,127245:amdgpu_tlb_fence_work [amdgpu] ,128123
Dec 17 11:03:45 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128127:=
amdgpu_tlb_fence_work [amdgpu] ,127144:amdgpu_tlb_fence_work [amdgpu] ,1280=
62:amdgpu_tlb_fence_work [amdgpu] ,128116:amdgpu_tlb_fence_work [amdgpu] ,1=
28074:amdgpu_tlb_fence_work [amdgpu] ,127147:amdgpu_tlb_fence_work [amdgpu]=
 ,128058:amdgpu_tlb_fence_work [amdgpu] ,128017:amdgpu_tlb_fence_work [amdg=
pu] ,128128:amdgpu_tlb_fence_work [amdgpu] ,127143:amdgpu_tlb_fence_work [a=
mdgpu] ,128092:amdgpu_tlb_fence_work [amdgpu] ,128104:amdgpu_tlb_fence_work=
 [amdgpu] ,128064:amdgpu_tlb_fence_work [amdgpu] ,128114:amdgpu_tlb_fence_w=
ork [amdgpu] ,128095:amdgpu_tlb_fence_work [amdgpu] ,125205:amdgpu_tlb_fenc=
e_work [amdgpu] ,128103:amdgpu_tlb_fence_work [amdgpu] ,128070:amdgpu_tlb_f=
ence_work [amdgpu] ,128119:amdgpu_tlb_fence_work [amdgpu] ,127146:amdgpu_tl=
b_fence_work [amdgpu] ,128111:amdgpu_tlb_fence_work [amdgpu] ,128108:amdgpu=
_tlb_fence_work [amdgpu] ,128094:amdgpu_tlb_fence_work [amdgpu] ,128112:amd=
gpu_tlb_fence_work [amdgpu] ,128068:amdgpu_tlb_fence_work [amdgpu] ,127242
Dec 17 11:03:45 pedro-suse kernel: :amdgpu_tlb_fence_work [amdgpu] ,128120:=
amdgpu_tlb_fence_work [amdgpu] ,128091:amdgpu_tlb_fence_work [amdgpu] ,1281=
21:amdgpu_tlb_fence_work [amdgpu] ,128066:amdgpu_tlb_fence_work [amdgpu] ,1=
26931:amdgpu_tlb_fence_work [amdgpu] ,128106:amdgpu_tlb_fence_work [amdgpu]=
 ,128076:amdgpu_tlb_fence_work [amdgpu] ,128113:amdgpu_tlb_fence_work [amdg=
pu] ,128084:amdgpu_tlb_fence_work [amdgpu] ,128090:amdgpu_tlb_fence_work [a=
mdgpu] ,128117:amdgpu_tlb_fence_work [amdgpu] ,128100:amdgpu_tlb_fence_work=
 [amdgpu] ,127145:amdgpu_tlb_fence_work [amdgpu] ,128126:amdgpu_tlb_fence_w=
ork [amdgpu] ,128101:amdgpu_tlb_fence_work [amdgpu] ,125613:amdgpu_tlb_fenc=
e_work [amdgpu] ,128078:amdgpu_tlb_fence_work [amdgpu] ,128124:amdgpu_tlb_f=
ence_work [amdgpu] ,128060:amdgpu_tlb_fence_work [amdgpu] ,127030:amdgpu_tl=
b_fence_work [amdgpu] ,128056:amdgpu_tlb_fence_work [amdgpu] ,128072:amdgpu=
_tlb_fence_work [amdgpu] ,128109:amdgpu_tlb_fence_work [amdgpu] ,128080:amd=
gpu_tlb_fence_work [amdgpu] ,128054:amdgpu_tlb_fence_work [amdgpu]
Dec 17 11:03:45 pedro-suse kernel:   pwq 50: cpus=3D12 node=3D0 flags=3D0x0=
 nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:45 pedro-suse kernel:     in-flight: 127843:amdgpu_tlb_fence_w=
ork [amdgpu]
Dec 17 11:03:45 pedro-suse kernel:   pwq 58: cpus=3D14 node=3D0 flags=3D0x0=
 nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:45 pedro-suse kernel:     in-flight: 127168:ucsi_handle_connec=
tor_change [typec_ucsi]
Dec 17 11:03:45 pedro-suse kernel: workqueue events_long: flags=3D0x100
Dec 17 11:03:45 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:45 pedro-suse kernel:     in-flight: 128068:ucsi_resume_work [=
typec_ucsi]
Dec 17 11:03:45 pedro-suse kernel: workqueue events_unbound: flags=3D0x2
Dec 17 11:03:45 pedro-suse kernel:   pwq 64: cpus=3D0-15 flags=3D0x4 nice=
=3D0 active=3D2 refcnt=3D3
Dec 17 11:03:45 pedro-suse kernel:     in-flight: 127358:fsnotify_connector=
_destroy_workfn ,127371:fsnotify_mark_destroy_workfn
Dec 17 11:03:45 pedro-suse kernel: workqueue events_freezable: flags=3D0x104
Dec 17 11:03:45 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:45 pedro-suse kernel:     pending: pci_pme_list_scan
Dec 17 11:03:45 pedro-suse kernel: workqueue events_power_efficient: flags=
=3D0x180
Dec 17 11:03:45 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D2 refcnt=3D3
Dec 17 11:03:45 pedro-suse kernel:     pending: check_lifetime, gc_worker [=
nf_conntrack]
Dec 17 11:03:45 pedro-suse kernel: workqueue rcu_gp: flags=3D0x108
Dec 17 11:03:45 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:45 pedro-suse kernel:     pending: process_srcu
Dec 17 11:03:45 pedro-suse kernel: workqueue mm_percpu_wq: flags=3D0x8
Dec 17 11:03:45 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D2 refcnt=3D4
Dec 17 11:03:45 pedro-suse kernel:     pending: vmstat_update, lru_add_drai=
n_per_cpu BAR(138)
Dec 17 11:03:45 pedro-suse kernel: workqueue pm: flags=3D0x6
Dec 17 11:03:45 pedro-suse kernel:   pwq 64: cpus=3D0-15 flags=3D0x4 nice=
=3D0 active=3D2 refcnt=3D3
Dec 17 11:03:45 pedro-suse kernel:     in-flight: 126017:pm_runtime_work pm=
_runtime_work
Dec 17 11:03:45 pedro-suse kernel: workqueue cgroup_release: flags=3D0x100
Dec 17 11:03:45 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D5
Dec 17 11:03:45 pedro-suse kernel:     pending: css_release_work_fn
Dec 17 11:03:45 pedro-suse kernel:     inactive: 3*css_release_work_fn
Dec 17 11:03:45 pedro-suse kernel: workqueue cgroup_bpf_destroy: flags=3D0x=
100
Dec 17 11:03:45 pedro-suse kernel:   pwq 26: cpus=3D6 node=3D0 flags=3D0x0 =
nice=3D0 active=3D1 refcnt=3D2
Dec 17 11:03:45 pedro-suse kernel:     pending: cgroup_bpf_release
Dec 17 11:03:45 pedro-suse kernel: workqueue ttm: flags=3D0x1a
Dec 17 11:03:45 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D12 refcnt=3D13
Dec 17 11:03:45 pedro-suse kernel:     in-flight: 121658:ttm_bo_delayed_del=
ete [ttm] ,124717:ttm_bo_delayed_delete [ttm] ,125486:ttm_bo_delayed_delete=
 [ttm] ,123928:ttm_bo_delayed_delete [ttm] ,124715:ttm_bo_delayed_delete [t=
tm] ,124714:ttm_bo_delayed_delete [ttm] ,125747:ttm_bo_delayed_delete [ttm]=
 ,124716:ttm_bo_delayed_delete [ttm] ,125238:ttm_bo_delayed_delete [ttm] ,1=
24685:ttm_bo_delayed_delete [ttm] ,125454:ttm_bo_delayed_delete [ttm] ,1232=
01:ttm_bo_delayed_delete [ttm]
Dec 17 11:03:45 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D3 refcnt=3D84
Dec 17 11:03:45 pedro-suse kernel:     in-flight: 125489:ttm_bo_delayed_del=
ete [ttm] ,125487:ttm_bo_delayed_delete [ttm] ,125452:ttm_bo_delayed_delete=
 [ttm]
Dec 17 11:03:45 pedro-suse kernel:     inactive: 80*ttm_bo_delayed_delete [=
ttm]
Dec 17 11:03:45 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D0 refcnt=3D74
Dec 17 11:03:45 pedro-suse kernel:     inactive: 73*ttm_bo_delayed_delete [=
ttm]
Dec 17 11:03:45 pedro-suse kernel:   pwq 65: cpus=3D0-15 node=3D0 flags=3D0=
x4 nice=3D-20 active=3D1 refcnt=3D2
Dec 17 11:03:45 pedro-suse kernel:     in-flight: 125746:ttm_bo_delayed_del=
ete [ttm]
Dec 17 11:03:45 pedro-suse kernel: pool 10: cpus=3D2 node=3D0 flags=3D0x0 n=
ice=3D0 hung=3D0s workers=3D9 idle: 126807 125733 127249 127250 127247 1272=
48 127252
Dec 17 11:03:45 pedro-suse kernel: pool 26: cpus=3D6 node=3D0 flags=3D0x0 n=
ice=3D0 hung=3D147s workers=3D12 idle: 127154 127148 127151 127152 127149 1=
25657 127155 125462 127157 127153 123834
Dec 17 11:03:45 pedro-suse kernel: pool 30: cpus=3D7 node=3D0 flags=3D0x0 n=
ice=3D0 hung=3D0s workers=3D87 idle: 128089 128132
Dec 17 11:03:45 pedro-suse kernel: pool 46: cpus=3D11 node=3D0 flags=3D0x0 =
nice=3D0 hung=3D0s workers=3D79 idle: 128130 128131
Dec 17 11:03:45 pedro-suse kernel: pool 50: cpus=3D12 node=3D0 flags=3D0x0 =
nice=3D0 hung=3D0s workers=3D14 idle: 127842 127841 127295 126294 127130 12=
6297 124712 125279 123918 126295 126091 125357 127844
Dec 17 11:03:45 pedro-suse kernel: pool 58: cpus=3D14 node=3D0 flags=3D0x0 =
nice=3D0 hung=3D0s workers=3D9 idle: 125453 127169 125455 126324 125456 126=
325 125458 127284
Dec 17 11:03:45 pedro-suse kernel: pool 64: cpus=3D0-15 flags=3D0x4 nice=3D=
0 hung=3D0s workers=3D50 idle: 89229 127380 78856 127357 126808 127366 1273=
73 122973 127369 127359 127360 122468 127370 126527 127382 127368 89228 127=
379 87378 127364 127376 96449 127365 127375 123703 64265 125204 125482 1273=
72 123900 127378 127356 127254 127363 121565 84204 122560 127362 127361 126=
540 88952 127381 127377 127374 127367 127384 127383
Dec 17 11:03:45 pedro-suse kernel: pool 65: cpus=3D0-15 node=3D0 flags=3D0x=
4 nice=3D-20 hung=3D0s workers=3D17 idle: 127150
Dec 17 11:03:45 pedro-suse kernel: Showing backtraces of running workers in=
 stalled CPU-bound worker pools:

--ai25nyuffhvsi3e6
Content-Type: application/x-config
Content-Disposition: attachment; filename=".config"
Content-Transfer-Encoding: quoted-printable

#=0A# Automatically generated file; DO NOT EDIT.=0A# Linux/x86 6.19.0-rc1 K=
ernel Configuration=0A#=0ACONFIG_CC_VERSION_TEXT=3D"gcc (SUSE Linux) 15.2.1=
 20251006"=0ACONFIG_CC_IS_GCC=3Dy=0ACONFIG_GCC_VERSION=3D150201=0A# CONFIG_=
CC_IS_CLANG is not set=0ACONFIG_CLANG_VERSION=3D0=0ACONFIG_AS_IS_GNU=3Dy=0A=
# CONFIG_AS_IS_LLVM is not set=0ACONFIG_AS_VERSION=3D24500=0ACONFIG_LD_IS_B=
FD=3Dy=0ACONFIG_LD_VERSION=3D24500=0A# CONFIG_LD_IS_LLD is not set=0ACONFIG=
_LLD_VERSION=3D0=0ACONFIG_RUSTC_VERSION=3D0=0A# CONFIG_RUST_IS_AVAILABLE is=
 not set=0ACONFIG_RUSTC_LLVM_VERSION=3D0=0ACONFIG_CC_CAN_LINK=3Dy=0ACONFIG_=
CC_HAS_ASM_GOTO_OUTPUT=3Dy=0ACONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=3Dy=0ACONFI=
G_TOOLS_SUPPORT_RELR=3Dy=0ACONFIG_CC_HAS_ASM_INLINE=3Dy=0ACONFIG_CC_HAS_ASS=
UME=3Dy=0ACONFIG_CC_HAS_NO_PROFILE_FN_ATTR=3Dy=0ACONFIG_CC_HAS_COUNTED_BY=
=3Dy=0ACONFIG_CC_HAS_MULTIDIMENSIONAL_NONSTRING=3Dy=0ACONFIG_LD_CAN_USE_KEE=
P_IN_OVERLAY=3Dy=0A# CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED is not set=0A# CON=
FIG_RUSTC_HAS_COERCE_POINTEE is not set=0A# CONFIG_RUSTC_HAS_SPAN_FILE is n=
ot set=0A# CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES is not set=0A# CONFIG_RU=
STC_HAS_FILE_WITH_NUL is not set=0A# CONFIG_RUSTC_HAS_FILE_AS_C_STR is not =
set=0ACONFIG_PAHOLE_VERSION=3D131=0ACONFIG_IRQ_WORK=3Dy=0ACONFIG_BUILDTIME_=
TABLE_SORT=3Dy=0ACONFIG_THREAD_INFO_IN_TASK=3Dy=0A=0A#=0A# General setup=0A=
#=0ACONFIG_INIT_ENV_ARG_LIMIT=3D32=0A# CONFIG_COMPILE_TEST is not set=0A# C=
ONFIG_WERROR is not set=0ACONFIG_LOCALVERSION=3D"-default"=0A# CONFIG_LOCAL=
VERSION_AUTO is not set=0ACONFIG_BUILD_SALT=3D""=0ACONFIG_HAVE_KERNEL_GZIP=
=3Dy=0ACONFIG_HAVE_KERNEL_BZIP2=3Dy=0ACONFIG_HAVE_KERNEL_LZMA=3Dy=0ACONFIG_=
HAVE_KERNEL_XZ=3Dy=0ACONFIG_HAVE_KERNEL_LZO=3Dy=0ACONFIG_HAVE_KERNEL_LZ4=3D=
y=0ACONFIG_HAVE_KERNEL_ZSTD=3Dy=0ACONFIG_KERNEL_GZIP=3Dy=0A# CONFIG_KERNEL_=
BZIP2 is not set=0A# CONFIG_KERNEL_LZMA is not set=0A# CONFIG_KERNEL_XZ is =
not set=0A# CONFIG_KERNEL_LZO is not set=0A# CONFIG_KERNEL_LZ4 is not set=
=0A# CONFIG_KERNEL_ZSTD is not set=0ACONFIG_DEFAULT_INIT=3D""=0ACONFIG_DEFA=
ULT_HOSTNAME=3D"(none)"=0ACONFIG_SYSVIPC=3Dy=0ACONFIG_SYSVIPC_SYSCTL=3Dy=0A=
CONFIG_SYSVIPC_COMPAT=3Dy=0ACONFIG_POSIX_MQUEUE=3Dy=0ACONFIG_POSIX_MQUEUE_S=
YSCTL=3Dy=0ACONFIG_WATCH_QUEUE=3Dy=0ACONFIG_CROSS_MEMORY_ATTACH=3Dy=0ACONFI=
G_AUDIT=3Dy=0ACONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy=0ACONFIG_AUDITSYSCALL=3Dy=
=0A=0A#=0A# IRQ subsystem=0A#=0ACONFIG_GENERIC_IRQ_PROBE=3Dy=0ACONFIG_GENER=
IC_IRQ_SHOW=3Dy=0ACONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy=0ACONFIG_GENERI=
C_PENDING_IRQ=3Dy=0ACONFIG_GENERIC_IRQ_MIGRATION=3Dy=0ACONFIG_GENERIC_IRQ_I=
NJECTION=3Dy=0ACONFIG_HARDIRQS_SW_RESEND=3Dy=0ACONFIG_GENERIC_IRQ_CHIP=3Dy=
=0ACONFIG_IRQ_DOMAIN=3Dy=0ACONFIG_IRQ_SIM=3Dy=0ACONFIG_IRQ_DOMAIN_HIERARCHY=
=3Dy=0ACONFIG_GENERIC_MSI_IRQ=3Dy=0ACONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy=
=0ACONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy=0ACONFIG_IRQ_FORCED_THREADING=3D=
y=0ACONFIG_SPARSE_IRQ=3Dy=0ACONFIG_GENERIC_IRQ_DEBUGFS=3Dy=0A# end of IRQ s=
ubsystem=0A=0ACONFIG_CLOCKSOURCE_WATCHDOG=3Dy=0ACONFIG_ARCH_CLOCKSOURCE_INI=
T=3Dy=0ACONFIG_GENERIC_TIME_VSYSCALL=3Dy=0ACONFIG_GENERIC_CLOCKEVENTS=3Dy=
=0ACONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy=0ACONFIG_GENERIC_CLOCKEVENTS_BR=
OADCAST_IDLE=3Dy=0ACONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy=0ACONFIG_GENER=
IC_CMOS_UPDATE=3Dy=0ACONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy=0ACONFIG_PO=
SIX_CPU_TIMERS_TASK_WORK=3Dy=0ACONFIG_CONTEXT_TRACKING=3Dy=0ACONFIG_CONTEXT=
_TRACKING_IDLE=3Dy=0A=0A#=0A# Timers subsystem=0A#=0ACONFIG_TICK_ONESHOT=3D=
y=0ACONFIG_NO_HZ_COMMON=3Dy=0A# CONFIG_HZ_PERIODIC is not set=0A# CONFIG_NO=
_HZ_IDLE is not set=0ACONFIG_NO_HZ_FULL=3Dy=0ACONFIG_CONTEXT_TRACKING_USER=
=3Dy=0A# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set=0ACONFIG_NO_HZ=3Dy=
=0ACONFIG_HIGH_RES_TIMERS=3Dy=0ACONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=3D1=
25=0ACONFIG_POSIX_AUX_CLOCKS=3Dy=0A# end of Timers subsystem=0A=0ACONFIG_BP=
F=3Dy=0ACONFIG_HAVE_EBPF_JIT=3Dy=0ACONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy=0A=
=0A#=0A# BPF subsystem=0A#=0ACONFIG_BPF_SYSCALL=3Dy=0ACONFIG_BPF_JIT=3Dy=0A=
CONFIG_BPF_JIT_ALWAYS_ON=3Dy=0ACONFIG_BPF_JIT_DEFAULT_ON=3Dy=0ACONFIG_BPF_U=
NPRIV_DEFAULT_OFF=3Dy=0A# CONFIG_BPF_PRELOAD is not set=0ACONFIG_BPF_LSM=3D=
y=0A# end of BPF subsystem=0A=0ACONFIG_PREEMPT_BUILD=3Dy=0ACONFIG_ARCH_HAS_=
PREEMPT_LAZY=3Dy=0A# CONFIG_PREEMPT_NONE is not set=0ACONFIG_PREEMPT_VOLUNT=
ARY=3Dy=0A# CONFIG_PREEMPT is not set=0A# CONFIG_PREEMPT_LAZY is not set=0A=
# CONFIG_PREEMPT_RT is not set=0ACONFIG_PREEMPT_COUNT=3Dy=0ACONFIG_PREEMPTI=
ON=3Dy=0ACONFIG_PREEMPT_DYNAMIC=3Dy=0ACONFIG_SCHED_CORE=3Dy=0ACONFIG_SCHED_=
CLASS_EXT=3Dy=0A=0A#=0A# CPU/Task time and stats accounting=0A#=0ACONFIG_VI=
RT_CPU_ACCOUNTING=3Dy=0ACONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy=0A# CONFIG_IRQ_T=
IME_ACCOUNTING is not set=0ACONFIG_BSD_PROCESS_ACCT=3Dy=0ACONFIG_BSD_PROCES=
S_ACCT_V3=3Dy=0ACONFIG_TASKSTATS=3Dy=0ACONFIG_TASK_DELAY_ACCT=3Dy=0ACONFIG_=
TASK_XACCT=3Dy=0ACONFIG_TASK_IO_ACCOUNTING=3Dy=0ACONFIG_PSI=3Dy=0ACONFIG_PS=
I_DEFAULT_DISABLED=3Dy=0A# end of CPU/Task time and stats accounting=0A=0AC=
ONFIG_CPU_ISOLATION=3Dy=0A=0A#=0A# RCU Subsystem=0A#=0ACONFIG_TREE_RCU=3Dy=
=0ACONFIG_PREEMPT_RCU=3Dy=0A# CONFIG_RCU_EXPERT is not set=0ACONFIG_TREE_SR=
CU=3Dy=0A# CONFIG_NEED_SRCU_NMI_SAFE is not set=0ACONFIG_TASKS_RCU_GENERIC=
=3Dy=0ACONFIG_NEED_TASKS_RCU=3Dy=0ACONFIG_TASKS_RCU=3Dy=0ACONFIG_TASKS_RUDE=
_RCU=3Dy=0ACONFIG_TASKS_TRACE_RCU=3Dy=0ACONFIG_RCU_STALL_COMMON=3Dy=0ACONFI=
G_RCU_NEED_SEGCBLIST=3Dy=0ACONFIG_RCU_NOCB_CPU=3Dy=0A# CONFIG_RCU_NOCB_CPU_=
DEFAULT_ALL is not set=0A# CONFIG_RCU_LAZY is not set=0A# end of RCU Subsys=
tem=0A=0ACONFIG_IKCONFIG=3Dy=0ACONFIG_IKCONFIG_PROC=3Dy=0A# CONFIG_IKHEADER=
S is not set=0ACONFIG_LOG_BUF_SHIFT=3D18=0ACONFIG_LOG_CPU_MAX_BUF_SHIFT=3D1=
5=0ACONFIG_PRINTK_INDEX=3Dy=0ACONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy=0A=0A#=
=0A# Scheduler features=0A#=0A# CONFIG_UCLAMP_TASK is not set=0A# end of Sc=
heduler features=0A=0ACONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy=0ACONFIG_ARCH=
_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy=0ACONFIG_CC_HAS_INT128=3Dy=0ACONFIG_CC_IM=
PLICIT_FALLTHROUGH=3D"-Wimplicit-fallthrough=3D5"=0ACONFIG_GCC10_NO_ARRAY_B=
OUNDS=3Dy=0ACONFIG_CC_NO_ARRAY_BOUNDS=3Dy=0ACONFIG_GCC_NO_STRINGOP_OVERFLOW=
=3Dy=0ACONFIG_CC_NO_STRINGOP_OVERFLOW=3Dy=0ACONFIG_ARCH_SUPPORTS_INT128=3Dy=
=0ACONFIG_NUMA_BALANCING=3Dy=0ACONFIG_NUMA_BALANCING_DEFAULT_ENABLED=3Dy=0A=
CONFIG_SLAB_OBJ_EXT=3Dy=0ACONFIG_CGROUPS=3Dy=0ACONFIG_PAGE_COUNTER=3Dy=0A# =
CONFIG_CGROUP_FAVOR_DYNMODS is not set=0ACONFIG_MEMCG=3Dy=0A# CONFIG_MEMCG_=
V1 is not set=0ACONFIG_BLK_CGROUP=3Dy=0ACONFIG_CGROUP_WRITEBACK=3Dy=0ACONFI=
G_CGROUP_SCHED=3Dy=0ACONFIG_GROUP_SCHED_WEIGHT=3Dy=0ACONFIG_GROUP_SCHED_BAN=
DWIDTH=3Dy=0ACONFIG_FAIR_GROUP_SCHED=3Dy=0ACONFIG_CFS_BANDWIDTH=3Dy=0A# CON=
FIG_RT_GROUP_SCHED is not set=0ACONFIG_EXT_GROUP_SCHED=3Dy=0ACONFIG_SCHED_M=
M_CID=3Dy=0ACONFIG_CGROUP_PIDS=3Dy=0ACONFIG_CGROUP_RDMA=3Dy=0ACONFIG_CGROUP=
_DMEM=3Dy=0A# CONFIG_CGROUP_FREEZER is not set=0ACONFIG_CGROUP_HUGETLB=3Dy=
=0ACONFIG_CPUSETS=3Dy=0A# CONFIG_CPUSETS_V1 is not set=0A# CONFIG_CGROUP_DE=
VICE is not set=0A# CONFIG_CGROUP_CPUACCT is not set=0ACONFIG_CGROUP_PERF=
=3Dy=0ACONFIG_CGROUP_BPF=3Dy=0ACONFIG_CGROUP_MISC=3Dy=0A# CONFIG_CGROUP_DEB=
UG is not set=0ACONFIG_SOCK_CGROUP_DATA=3Dy=0ACONFIG_NAMESPACES=3Dy=0ACONFI=
G_UTS_NS=3Dy=0ACONFIG_TIME_NS=3Dy=0ACONFIG_IPC_NS=3Dy=0ACONFIG_USER_NS=3Dy=
=0ACONFIG_PID_NS=3Dy=0ACONFIG_NET_NS=3Dy=0ACONFIG_CHECKPOINT_RESTORE=3Dy=0A=
# CONFIG_SCHED_AUTOGROUP is not set=0ACONFIG_RELAY=3Dy=0ACONFIG_BLK_DEV_INI=
TRD=3Dy=0ACONFIG_INITRAMFS_SOURCE=3D""=0ACONFIG_RD_GZIP=3Dy=0ACONFIG_RD_BZI=
P2=3Dy=0ACONFIG_RD_LZMA=3Dy=0ACONFIG_RD_XZ=3Dy=0ACONFIG_RD_LZO=3Dy=0ACONFIG=
_RD_LZ4=3Dy=0ACONFIG_RD_ZSTD=3Dy=0ACONFIG_BOOT_CONFIG=3Dy=0A# CONFIG_BOOT_C=
ONFIG_FORCE is not set=0A# CONFIG_BOOT_CONFIG_EMBED is not set=0ACONFIG_CMD=
LINE_LOG_WRAP_IDEAL_LEN=3D1021=0ACONFIG_INITRAMFS_PRESERVE_MTIME=3Dy=0ACONF=
IG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy=0A# CONFIG_CC_OPTIMIZE_FOR_SIZE is not s=
et=0ACONFIG_LD_ORPHAN_WARN=3Dy=0ACONFIG_LD_ORPHAN_WARN_LEVEL=3D"warn"=0ACON=
FIG_SYSCTL=3Dy=0ACONFIG_HAVE_UID16=3Dy=0ACONFIG_SYSCTL_EXCEPTION_TRACE=3Dy=
=0A# CONFIG_SYSFS_SYSCALL is not set=0ACONFIG_HAVE_PCSPKR_PLATFORM=3Dy=0ACO=
NFIG_EXPERT=3Dy=0ACONFIG_UID16=3Dy=0ACONFIG_MULTIUSER=3Dy=0ACONFIG_SGETMASK=
_SYSCALL=3Dy=0ACONFIG_FHANDLE=3Dy=0ACONFIG_POSIX_TIMERS=3Dy=0ACONFIG_PRINTK=
=3Dy=0ACONFIG_BUG=3Dy=0ACONFIG_ELF_CORE=3Dy=0ACONFIG_PCSPKR_PLATFORM=3Dy=0A=
# CONFIG_BASE_SMALL is not set=0ACONFIG_FUTEX=3Dy=0ACONFIG_FUTEX_PI=3Dy=0AC=
ONFIG_FUTEX_PRIVATE_HASH=3Dy=0ACONFIG_FUTEX_MPOL=3Dy=0ACONFIG_EPOLL=3Dy=0AC=
ONFIG_SIGNALFD=3Dy=0ACONFIG_TIMERFD=3Dy=0ACONFIG_EVENTFD=3Dy=0ACONFIG_SHMEM=
=3Dy=0ACONFIG_AIO=3Dy=0ACONFIG_IO_URING=3Dy=0A# CONFIG_IO_URING_MOCK_FILE i=
s not set=0ACONFIG_ADVISE_SYSCALLS=3Dy=0ACONFIG_MEMBARRIER=3Dy=0ACONFIG_KCM=
P=3Dy=0ACONFIG_RSEQ=3Dy=0A# CONFIG_RSEQ_STATS is not set=0A# CONFIG_RSEQ_DE=
BUG_DEFAULT_ENABLE is not set=0ACONFIG_CACHESTAT_SYSCALL=3Dy=0ACONFIG_KALLS=
YMS=3Dy=0A# CONFIG_KALLSYMS_SELFTEST is not set=0ACONFIG_KALLSYMS_ALL=3Dy=
=0ACONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy=0ACONFIG_ARCH_SUPPORTS_MSEAL_SY=
STEM_MAPPINGS=3Dy=0ACONFIG_HAVE_PERF_EVENTS=3Dy=0ACONFIG_GUEST_PERF_EVENTS=
=3Dy=0A=0A#=0A# Kernel Performance Events And Counters=0A#=0ACONFIG_PERF_EV=
ENTS=3Dy=0A# CONFIG_DEBUG_PERF_USE_VMALLOC is not set=0A# end of Kernel Per=
formance Events And Counters=0A=0ACONFIG_SYSTEM_DATA_VERIFICATION=3Dy=0ACON=
FIG_PROFILING=3Dy=0ACONFIG_TRACEPOINTS=3Dy=0A=0A#=0A# Kexec and crash featu=
res=0A#=0ACONFIG_CRASH_RESERVE=3Dy=0ACONFIG_VMCORE_INFO=3Dy=0ACONFIG_KEXEC_=
CORE=3Dy=0ACONFIG_HAVE_IMA_KEXEC=3Dy=0ACONFIG_KEXEC=3Dy=0ACONFIG_KEXEC_FILE=
=3Dy=0ACONFIG_KEXEC_SIG=3Dy=0A# CONFIG_KEXEC_SIG_FORCE is not set=0ACONFIG_=
KEXEC_BZIMAGE_VERIFY_SIG=3Dy=0A# CONFIG_KEXEC_JUMP is not set=0ACONFIG_CRAS=
H_DUMP=3Dy=0ACONFIG_CRASH_DM_CRYPT=3Dy=0ACONFIG_CRASH_DM_CRYPT_CONFIGS=3Dy=
=0ACONFIG_CRASH_HOTPLUG=3Dy=0ACONFIG_CRASH_MAX_MEMORY_RANGES=3D8192=0A# end=
 of Kexec and crash features=0A# end of General setup=0A=0ACONFIG_64BIT=3Dy=
=0ACONFIG_X86_64=3Dy=0ACONFIG_X86=3Dy=0ACONFIG_INSTRUCTION_DECODER=3Dy=0ACO=
NFIG_OUTPUT_FORMAT=3D"elf64-x86-64"=0ACONFIG_LOCKDEP_SUPPORT=3Dy=0ACONFIG_S=
TACKTRACE_SUPPORT=3Dy=0ACONFIG_MMU=3Dy=0ACONFIG_ARCH_MMAP_RND_BITS_MIN=3D28=
=0ACONFIG_ARCH_MMAP_RND_BITS_MAX=3D32=0ACONFIG_ARCH_MMAP_RND_COMPAT_BITS_MI=
N=3D8=0ACONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16=0ACONFIG_GENERIC_ISA_DMA=
=3Dy=0ACONFIG_GENERIC_BUG=3Dy=0ACONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy=0A=
CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy=0ACONFIG_GENERIC_CALIBRATE_DELAY=3Dy=0ACONF=
IG_ARCH_HAS_CPU_RELAX=3Dy=0ACONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy=0ACONFIG_A=
RCH_SUSPEND_POSSIBLE=3Dy=0ACONFIG_AUDIT_ARCH=3Dy=0ACONFIG_HAVE_INTEL_TXT=3D=
y=0ACONFIG_ARCH_SUPPORTS_UPROBES=3Dy=0ACONFIG_FIX_EARLYCON_MEM=3Dy=0ACONFIG=
_DYNAMIC_PHYSICAL_MASK=3Dy=0ACONFIG_PGTABLE_LEVELS=3D5=0A=0A#=0A# Processor=
 type and features=0A#=0ACONFIG_SMP=3Dy=0ACONFIG_X86_X2APIC=3Dy=0ACONFIG_AM=
D_SECURE_AVIC=3Dy=0A# CONFIG_X86_POSTED_MSI is not set=0ACONFIG_X86_MPPARSE=
=3Dy=0ACONFIG_X86_CPU_RESCTRL=3Dy=0ACONFIG_X86_FRED=3Dy=0ACONFIG_X86_EXTEND=
ED_PLATFORM=3Dy=0A# CONFIG_X86_NUMACHIP is not set=0A# CONFIG_X86_VSMP is n=
ot set=0ACONFIG_X86_UV=3Dy=0A# CONFIG_X86_INTEL_MID is not set=0A# CONFIG_X=
86_GOLDFISH is not set=0ACONFIG_X86_INTEL_LPSS=3Dy=0ACONFIG_X86_AMD_PLATFOR=
M_DEVICE=3Dy=0ACONFIG_IOSF_MBI=3Dy=0A# CONFIG_IOSF_MBI_DEBUG is not set=0AC=
ONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy=0ACONFIG_SCHED_OMIT_FRAME_POINTER=3Dy=
=0ACONFIG_HYPERVISOR_GUEST=3Dy=0ACONFIG_PARAVIRT=3Dy=0ACONFIG_PARAVIRT_XXL=
=3Dy=0A# CONFIG_PARAVIRT_DEBUG is not set=0ACONFIG_PARAVIRT_SPINLOCKS=3Dy=
=0ACONFIG_X86_HV_CALLBACK_VECTOR=3Dy=0ACONFIG_XEN=3Dy=0ACONFIG_XEN_PV=3Dy=
=0A# CONFIG_XEN_512GB is not set=0ACONFIG_XEN_PV_SMP=3Dy=0ACONFIG_XEN_PV_DO=
M0=3Dy=0ACONFIG_XEN_PVHVM=3Dy=0ACONFIG_XEN_PVHVM_SMP=3Dy=0ACONFIG_XEN_PVHVM=
_GUEST=3Dy=0ACONFIG_XEN_DEBUG_FS=3Dy=0ACONFIG_XEN_PVH=3Dy=0ACONFIG_XEN_DOM0=
=3Dy=0ACONFIG_XEN_PV_MSR_SAFE=3Dy=0ACONFIG_KVM_GUEST=3Dy=0ACONFIG_ARCH_CPUI=
DLE_HALTPOLL=3Dy=0ACONFIG_PVH=3Dy=0A# CONFIG_PARAVIRT_TIME_ACCOUNTING is no=
t set=0ACONFIG_PARAVIRT_CLOCK=3Dy=0ACONFIG_JAILHOUSE_GUEST=3Dy=0ACONFIG_ACR=
N_GUEST=3Dy=0ACONFIG_BHYVE_GUEST=3Dy=0ACONFIG_INTEL_TDX_GUEST=3Dy=0ACONFIG_=
CC_HAS_MARCH_NATIVE=3Dy=0A# CONFIG_X86_NATIVE_CPU is not set=0ACONFIG_X86_I=
NTERNODE_CACHE_SHIFT=3D6=0ACONFIG_X86_L1_CACHE_SHIFT=3D6=0ACONFIG_X86_TSC=
=3Dy=0ACONFIG_X86_HAVE_PAE=3Dy=0ACONFIG_X86_CX8=3Dy=0ACONFIG_X86_CMOV=3Dy=
=0ACONFIG_X86_MINIMUM_CPU_FAMILY=3D64=0ACONFIG_X86_DEBUGCTLMSR=3Dy=0ACONFIG=
_IA32_FEAT_CTL=3Dy=0ACONFIG_X86_VMX_FEATURE_NAMES=3Dy=0A# CONFIG_PROCESSOR_=
SELECT is not set=0ACONFIG_BROADCAST_TLB_FLUSH=3Dy=0ACONFIG_CPU_SUP_INTEL=
=3Dy=0ACONFIG_CPU_SUP_AMD=3Dy=0ACONFIG_CPU_SUP_HYGON=3Dy=0ACONFIG_CPU_SUP_C=
ENTAUR=3Dy=0ACONFIG_CPU_SUP_ZHAOXIN=3Dy=0ACONFIG_HPET_TIMER=3Dy=0ACONFIG_HP=
ET_EMULATE_RTC=3Dy=0ACONFIG_DMI=3Dy=0ACONFIG_GART_IOMMU=3Dy=0ACONFIG_BOOT_V=
ESA_SUPPORT=3Dy=0ACONFIG_MAXSMP=3Dy=0ACONFIG_NR_CPUS_RANGE_BEGIN=3D8192=0AC=
ONFIG_NR_CPUS_RANGE_END=3D8192=0ACONFIG_NR_CPUS_DEFAULT=3D8192=0ACONFIG_NR_=
CPUS=3D8192=0ACONFIG_SCHED_MC_PRIO=3Dy=0ACONFIG_X86_LOCAL_APIC=3Dy=0ACONFIG=
_ACPI_MADT_WAKEUP=3Dy=0ACONFIG_X86_IO_APIC=3Dy=0ACONFIG_X86_REROUTE_FOR_BRO=
KEN_BOOT_IRQS=3Dy=0ACONFIG_X86_MCE=3Dy=0ACONFIG_X86_MCELOG_LEGACY=3Dy=0ACON=
FIG_X86_MCE_INTEL=3Dy=0ACONFIG_X86_MCE_AMD=3Dy=0ACONFIG_X86_MCE_THRESHOLD=
=3Dy=0ACONFIG_X86_MCE_INJECT=3Dm=0A=0A#=0A# Performance monitoring=0A#=0ACO=
NFIG_PERF_EVENTS_INTEL_UNCORE=3Dy=0ACONFIG_PERF_EVENTS_INTEL_RAPL=3Dy=0ACON=
FIG_PERF_EVENTS_INTEL_CSTATE=3Dy=0ACONFIG_PERF_EVENTS_AMD_POWER=3Dm=0ACONFI=
G_PERF_EVENTS_AMD_UNCORE=3Dm=0ACONFIG_PERF_EVENTS_AMD_BRS=3Dy=0A# end of Pe=
rformance monitoring=0A=0A# CONFIG_VM86 is not set=0ACONFIG_X86_16BIT=3Dy=
=0ACONFIG_X86_ESPFIX64=3Dy=0ACONFIG_X86_VSYSCALL_EMULATION=3Dy=0ACONFIG_X86=
_IOPL_IOPERM=3Dy=0ACONFIG_MICROCODE=3Dy=0A# CONFIG_MICROCODE_LATE_LOADING i=
s not set=0A# CONFIG_MICROCODE_DBG is not set=0ACONFIG_X86_MSR=3Dm=0ACONFIG=
_X86_CPUID=3Dm=0A# CONFIG_HIGHMEM is not set=0ACONFIG_X86_DIRECT_GBPAGES=3D=
y=0A# CONFIG_X86_CPA_STATISTICS is not set=0ACONFIG_X86_MEM_ENCRYPT=3Dy=0AC=
ONFIG_AMD_MEM_ENCRYPT=3Dy=0ACONFIG_NUMA=3Dy=0ACONFIG_AMD_NUMA=3Dy=0ACONFIG_=
X86_64_ACPI_NUMA=3Dy=0ACONFIG_NODES_SHIFT=3D10=0ACONFIG_ARCH_SPARSEMEM_ENAB=
LE=3Dy=0ACONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy=0ACONFIG_ARCH_MEMORY_PROBE=3Dy=
=0ACONFIG_ARCH_PROC_KCORE_TEXT=3Dy=0ACONFIG_ILLEGAL_POINTER_VALUE=3D0xdead0=
00000000000=0ACONFIG_X86_PMEM_LEGACY_DEVICE=3Dy=0ACONFIG_X86_PMEM_LEGACY=3D=
m=0ACONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy=0ACONFIG_X86_BOOTPARAM_MEMORY_CORR=
UPTION_CHECK=3Dy=0ACONFIG_MTRR=3Dy=0ACONFIG_MTRR_SANITIZER=3Dy=0ACONFIG_MTR=
R_SANITIZER_ENABLE_DEFAULT=3D0=0ACONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=
=3D1=0ACONFIG_X86_PAT=3Dy=0ACONFIG_X86_UMIP=3Dy=0ACONFIG_CC_HAS_IBT=3Dy=0AC=
ONFIG_X86_CET=3Dy=0ACONFIG_X86_KERNEL_IBT=3Dy=0ACONFIG_X86_INTEL_MEMORY_PRO=
TECTION_KEYS=3Dy=0ACONFIG_ARCH_PKEY_BITS=3D4=0ACONFIG_X86_INTEL_TSX_MODE_OF=
F=3Dy=0A# CONFIG_X86_INTEL_TSX_MODE_ON is not set=0A# CONFIG_X86_INTEL_TSX_=
MODE_AUTO is not set=0ACONFIG_X86_SGX=3Dy=0ACONFIG_X86_USER_SHADOW_STACK=3D=
y=0ACONFIG_INTEL_TDX_HOST=3Dy=0ACONFIG_EFI=3Dy=0ACONFIG_EFI_STUB=3Dy=0ACONF=
IG_EFI_HANDOVER_PROTOCOL=3Dy=0ACONFIG_EFI_MIXED=3Dy=0ACONFIG_EFI_RUNTIME_MA=
P=3Dy=0A# CONFIG_HZ_100 is not set=0A# CONFIG_HZ_250 is not set=0A# CONFIG_=
HZ_300 is not set=0ACONFIG_HZ_1000=3Dy=0ACONFIG_HZ=3D1000=0ACONFIG_SCHED_HR=
TICK=3Dy=0ACONFIG_ARCH_SUPPORTS_KEXEC=3Dy=0ACONFIG_ARCH_SUPPORTS_KEXEC_FILE=
=3Dy=0ACONFIG_ARCH_SELECTS_KEXEC_FILE=3Dy=0ACONFIG_ARCH_SUPPORTS_KEXEC_PURG=
ATORY=3Dy=0ACONFIG_ARCH_SUPPORTS_KEXEC_SIG=3Dy=0ACONFIG_ARCH_SUPPORTS_KEXEC=
_SIG_FORCE=3Dy=0ACONFIG_ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG=3Dy=0ACONFIG=
_ARCH_SUPPORTS_KEXEC_JUMP=3Dy=0ACONFIG_ARCH_SUPPORTS_KEXEC_HANDOVER=3Dy=0AC=
ONFIG_ARCH_SUPPORTS_CRASH_DUMP=3Dy=0ACONFIG_ARCH_DEFAULT_CRASH_DUMP=3Dy=0AC=
ONFIG_ARCH_SUPPORTS_CRASH_HOTPLUG=3Dy=0ACONFIG_ARCH_HAS_GENERIC_CRASHKERNEL=
_RESERVATION=3Dy=0ACONFIG_PHYSICAL_START=3D0x1000000=0ACONFIG_RELOCATABLE=
=3Dy=0ACONFIG_RANDOMIZE_BASE=3Dy=0ACONFIG_X86_NEED_RELOCS=3Dy=0ACONFIG_PHYS=
ICAL_ALIGN=3D0x200000=0ACONFIG_RANDOMIZE_MEMORY=3Dy=0ACONFIG_RANDOMIZE_MEMO=
RY_PHYSICAL_PADDING=3D0xa=0ACONFIG_HOTPLUG_CPU=3Dy=0A# CONFIG_COMPAT_VDSO i=
s not set=0ACONFIG_LEGACY_VSYSCALL_XONLY=3Dy=0A# CONFIG_LEGACY_VSYSCALL_NON=
E is not set=0A# CONFIG_CMDLINE_BOOL is not set=0ACONFIG_MODIFY_LDT_SYSCALL=
=3Dy=0A# CONFIG_STRICT_SIGALTSTACK_SIZE is not set=0ACONFIG_HAVE_LIVEPATCH=
=3Dy=0ACONFIG_LIVEPATCH=3Dy=0ACONFIG_HAVE_KLP_BUILD=3Dy=0ACONFIG_KLP_BUILD=
=3Dy=0ACONFIG_LIVEPATCH_IPA_CLONES=3Dy=0ACONFIG_X86_BUS_LOCK_DETECT=3Dy=0A#=
 end of Processor type and features=0A=0ACONFIG_CC_HAS_NAMED_AS=3Dy=0ACONFI=
G_CC_HAS_NAMED_AS_FIXED_SANITIZERS=3Dy=0ACONFIG_USE_X86_SEG_SUPPORT=3Dy=0AC=
ONFIG_CC_HAS_SLS=3Dy=0ACONFIG_CC_HAS_RETURN_THUNK=3Dy=0ACONFIG_CC_HAS_ENTRY=
_PADDING=3Dy=0ACONFIG_FUNCTION_PADDING_CFI=3D11=0ACONFIG_FUNCTION_PADDING_B=
YTES=3D16=0ACONFIG_CALL_PADDING=3Dy=0ACONFIG_HAVE_CALL_THUNKS=3Dy=0ACONFIG_=
CALL_THUNKS=3Dy=0ACONFIG_PREFIX_SYMBOLS=3Dy=0ACONFIG_CPU_MITIGATIONS=3Dy=0A=
CONFIG_MITIGATION_PAGE_TABLE_ISOLATION=3Dy=0ACONFIG_MITIGATION_RETPOLINE=3D=
y=0ACONFIG_MITIGATION_RETHUNK=3Dy=0ACONFIG_MITIGATION_UNRET_ENTRY=3Dy=0ACON=
FIG_MITIGATION_CALL_DEPTH_TRACKING=3Dy=0A# CONFIG_CALL_THUNKS_DEBUG is not =
set=0ACONFIG_MITIGATION_IBPB_ENTRY=3Dy=0ACONFIG_MITIGATION_IBRS_ENTRY=3Dy=
=0ACONFIG_MITIGATION_SRSO=3Dy=0ACONFIG_MITIGATION_SLS=3Dy=0ACONFIG_MITIGATI=
ON_GDS=3Dy=0ACONFIG_MITIGATION_RFDS=3Dy=0ACONFIG_MITIGATION_SPECTRE_BHI=3Dy=
=0ACONFIG_MITIGATION_MDS=3Dy=0ACONFIG_MITIGATION_TAA=3Dy=0ACONFIG_MITIGATIO=
N_MMIO_STALE_DATA=3Dy=0ACONFIG_MITIGATION_L1TF=3Dy=0ACONFIG_MITIGATION_RETB=
LEED=3Dy=0ACONFIG_MITIGATION_SPECTRE_V1=3Dy=0ACONFIG_MITIGATION_SPECTRE_V2=
=3Dy=0ACONFIG_MITIGATION_SRBDS=3Dy=0ACONFIG_MITIGATION_SSB=3Dy=0ACONFIG_MIT=
IGATION_ITS=3Dy=0ACONFIG_MITIGATION_TSA=3Dy=0ACONFIG_MITIGATION_VMSCAPE=3Dy=
=0ACONFIG_ARCH_HAS_ADD_PAGES=3Dy=0A=0A#=0A# Power management and ACPI optio=
ns=0A#=0ACONFIG_ARCH_HIBERNATION_HEADER=3Dy=0ACONFIG_SUSPEND=3Dy=0ACONFIG_S=
USPEND_FREEZER=3Dy=0A# CONFIG_SUSPEND_SKIP_SYNC is not set=0ACONFIG_HIBERNA=
TE_CALLBACKS=3Dy=0ACONFIG_HIBERNATION=3Dy=0ACONFIG_HIBERNATION_SNAPSHOT_DEV=
=3Dy=0ACONFIG_HIBERNATION_COMP_LZO=3Dy=0A# CONFIG_HIBERNATION_COMP_LZ4 is n=
ot set=0ACONFIG_HIBERNATION_DEF_COMP=3D"lzo"=0ACONFIG_PM_STD_PARTITION=3D""=
=0ACONFIG_PM_SLEEP=3Dy=0ACONFIG_PM_SLEEP_SMP=3Dy=0A# CONFIG_PM_AUTOSLEEP is=
 not set=0A# CONFIG_PM_USERSPACE_AUTOSLEEP is not set=0A# CONFIG_PM_WAKELOC=
KS is not set=0ACONFIG_PM_QOS_CPU_SYSTEM_WAKEUP=3Dy=0ACONFIG_PM=3Dy=0ACONFI=
G_PM_DEBUG=3Dy=0ACONFIG_PM_ADVANCED_DEBUG=3Dy=0A# CONFIG_PM_TEST_SUSPEND is=
 not set=0ACONFIG_PM_SLEEP_DEBUG=3Dy=0ACONFIG_DPM_WATCHDOG=3Dy=0ACONFIG_DPM=
_WATCHDOG_TIMEOUT=3D60=0ACONFIG_DPM_WATCHDOG_WARNING_TIMEOUT=3D60=0ACONFIG_=
PM_TRACE=3Dy=0ACONFIG_PM_TRACE_RTC=3Dy=0ACONFIG_PM_CLK=3Dy=0ACONFIG_PM_GENE=
RIC_DOMAINS=3Dy=0A# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set=0ACONFIG_P=
M_GENERIC_DOMAINS_SLEEP=3Dy=0ACONFIG_ENERGY_MODEL=3Dy=0ACONFIG_ARCH_SUPPORT=
S_ACPI=3Dy=0ACONFIG_ACPI=3Dy=0ACONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy=0ACONFI=
G_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy=0ACONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3D=
y=0ACONFIG_ACPI_TABLE_LIB=3Dy=0ACONFIG_ACPI_THERMAL_LIB=3Dy=0A# CONFIG_ACPI=
_DEBUGGER is not set=0ACONFIG_ACPI_SPCR_TABLE=3Dy=0ACONFIG_ACPI_FPDT=3Dy=0A=
CONFIG_ACPI_LPIT=3Dy=0ACONFIG_ACPI_SLEEP=3Dy=0ACONFIG_ACPI_REV_OVERRIDE_POS=
SIBLE=3Dy=0ACONFIG_ACPI_EC=3Dy=0ACONFIG_ACPI_EC_DEBUGFS=3Dm=0ACONFIG_ACPI_A=
C=3Dm=0ACONFIG_ACPI_BATTERY=3Dm=0ACONFIG_ACPI_BUTTON=3Dm=0ACONFIG_ACPI_TINY=
_POWER_BUTTON=3Dm=0ACONFIG_ACPI_TINY_POWER_BUTTON_SIGNAL=3D38=0ACONFIG_ACPI=
_VIDEO=3Dm=0ACONFIG_ACPI_FAN=3Dm=0ACONFIG_ACPI_TAD=3Dm=0ACONFIG_ACPI_DOCK=
=3Dy=0ACONFIG_ACPI_CPU_FREQ_PSS=3Dy=0ACONFIG_ACPI_PROCESSOR_CSTATE=3Dy=0ACO=
NFIG_ACPI_PROCESSOR_IDLE=3Dy=0ACONFIG_ACPI_CPPC_LIB=3Dy=0ACONFIG_ACPI_PROCE=
SSOR=3Dy=0ACONFIG_ACPI_IPMI=3Dm=0ACONFIG_ACPI_HOTPLUG_CPU=3Dy=0ACONFIG_ACPI=
_PROCESSOR_AGGREGATOR=3Dm=0ACONFIG_ACPI_THERMAL=3Dm=0ACONFIG_ACPI_PLATFORM_=
PROFILE=3Dm=0ACONFIG_ACPI_CUSTOM_DSDT_FILE=3D""=0A# CONFIG_ACPI_CUSTOM_DSDT=
 is not set=0ACONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy=0ACONFIG_ACPI_TABLE_UP=
GRADE=3Dy=0ACONFIG_ACPI_DEBUG=3Dy=0ACONFIG_ACPI_PCI_SLOT=3Dy=0ACONFIG_ACPI_=
CONTAINER=3Dy=0ACONFIG_ACPI_HOTPLUG_MEMORY=3Dy=0ACONFIG_ACPI_HOTPLUG_IOAPIC=
=3Dy=0ACONFIG_ACPI_SBS=3Dm=0ACONFIG_ACPI_HED=3Dy=0ACONFIG_ACPI_BGRT=3Dy=0A#=
 CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set=0ACONFIG_ACPI_NHLT=3Dy=0ACONF=
IG_ACPI_NFIT=3Dm=0A# CONFIG_NFIT_SECURITY_DEBUG is not set=0ACONFIG_ACPI_NU=
MA=3Dy=0ACONFIG_ACPI_HMAT=3Dy=0ACONFIG_HAVE_ACPI_APEI=3Dy=0ACONFIG_HAVE_ACP=
I_APEI_NMI=3Dy=0ACONFIG_ACPI_APEI=3Dy=0ACONFIG_ACPI_APEI_GHES=3Dy=0ACONFIG_=
ACPI_APEI_PCIEAER=3Dy=0ACONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy=0A# CONFIG_ACPI=
_APEI_EINJ is not set=0A# CONFIG_ACPI_APEI_ERST_DEBUG is not set=0ACONFIG_A=
CPI_DPTF=3Dy=0ACONFIG_DPTF_POWER=3Dm=0ACONFIG_DPTF_PCH_FIVR=3Dm=0ACONFIG_AC=
PI_WATCHDOG=3Dy=0ACONFIG_ACPI_EXTLOG=3Dm=0ACONFIG_ACPI_ADXL=3Dy=0ACONFIG_AC=
PI_CONFIGFS=3Dm=0ACONFIG_ACPI_PFRUT=3Dm=0ACONFIG_ACPI_PCC=3Dy=0ACONFIG_ACPI=
_FFH=3Dy=0ACONFIG_ACPI_MRRM=3Dy=0ACONFIG_PMIC_OPREGION=3Dy=0ACONFIG_BYTCRC_=
PMIC_OPREGION=3Dy=0ACONFIG_CHTCRC_PMIC_OPREGION=3Dy=0ACONFIG_XPOWER_PMIC_OP=
REGION=3Dy=0ACONFIG_BXT_WC_PMIC_OPREGION=3Dy=0ACONFIG_CHT_WC_PMIC_OPREGION=
=3Dy=0ACONFIG_CHT_DC_TI_PMIC_OPREGION=3Dy=0ACONFIG_TPS68470_PMIC_OPREGION=
=3Dy=0ACONFIG_ACPI_VIOT=3Dy=0ACONFIG_ACPI_PRMT=3Dy=0ACONFIG_X86_PM_TIMER=3D=
y=0A=0A#=0A# CPU Frequency scaling=0A#=0ACONFIG_CPU_FREQ=3Dy=0ACONFIG_CPU_F=
REQ_GOV_ATTR_SET=3Dy=0ACONFIG_CPU_FREQ_GOV_COMMON=3Dy=0A# CONFIG_CPU_FREQ_S=
TAT is not set=0A# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set=0A# C=
ONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set=0A# CONFIG_CPU_FREQ_DEFAULT=
_GOV_USERSPACE is not set=0ACONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=3Dy=0ACON=
FIG_CPU_FREQ_GOV_PERFORMANCE=3Dy=0ACONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm=0ACONF=
IG_CPU_FREQ_GOV_USERSPACE=3Dm=0ACONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy=0ACONFIG_C=
PU_FREQ_GOV_CONSERVATIVE=3Dm=0ACONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy=0A=0A#=0A#=
 CPU frequency scaling drivers=0A#=0ACONFIG_X86_INTEL_PSTATE=3Dy=0ACONFIG_X=
86_PCC_CPUFREQ=3Dm=0ACONFIG_X86_AMD_PSTATE=3Dy=0ACONFIG_X86_AMD_PSTATE_DEFA=
ULT_MODE=3D3=0A# CONFIG_X86_AMD_PSTATE_UT is not set=0ACONFIG_X86_ACPI_CPUF=
REQ=3Dm=0ACONFIG_X86_ACPI_CPUFREQ_CPB=3Dy=0ACONFIG_X86_POWERNOW_K8=3Dm=0ACO=
NFIG_X86_AMD_FREQ_SENSITIVITY=3Dm=0A# CONFIG_X86_SPEEDSTEP_CENTRINO is not =
set=0A# CONFIG_X86_P4_CLOCKMOD is not set=0A=0A#=0A# shared options=0A#=0A#=
 CONFIG_X86_SPEEDSTEP_LIB is not set=0ACONFIG_CPUFREQ_ARCH_CUR_FREQ=3Dy=0A#=
 CONFIG_ARM_KIRKWOOD_CPUFREQ is not set=0A# end of CPU Frequency scaling=0A=
=0A#=0A# CPU Idle=0A#=0ACONFIG_CPU_IDLE=3Dy=0ACONFIG_CPU_IDLE_GOV_LADDER=3D=
y=0ACONFIG_CPU_IDLE_GOV_MENU=3Dy=0ACONFIG_CPU_IDLE_GOV_TEO=3Dy=0ACONFIG_CPU=
_IDLE_GOV_HALTPOLL=3Dy=0ACONFIG_HALTPOLL_CPUIDLE=3Dm=0A# CONFIG_ARCH_NEEDS_=
CPU_IDLE_COUPLED is not set=0A# end of CPU Idle=0A=0ACONFIG_INTEL_IDLE=3Dy=
=0A# end of Power management and ACPI options=0A=0A#=0A# Bus options (PCI e=
tc.)=0A#=0ACONFIG_PCI_DIRECT=3Dy=0ACONFIG_PCI_MMCONFIG=3Dy=0ACONFIG_PCI_XEN=
=3Dy=0ACONFIG_MMCONF_FAM10H=3Dy=0A# CONFIG_ISA_BUS is not set=0ACONFIG_ISA_=
DMA_API=3Dy=0ACONFIG_AMD_NB=3Dy=0ACONFIG_AMD_NODE=3Dy=0A# end of Bus option=
s (PCI etc.)=0A=0A#=0A# Binary Emulations=0A#=0ACONFIG_IA32_EMULATION=3Dy=
=0A# CONFIG_IA32_EMULATION_DEFAULT_DISABLED is not set=0A# CONFIG_X86_X32_A=
BI is not set=0ACONFIG_COMPAT_32=3Dy=0ACONFIG_COMPAT=3Dy=0ACONFIG_COMPAT_FO=
R_U64_ALIGNMENT=3Dy=0A# end of Binary Emulations=0A=0ACONFIG_KVM_COMMON=3Dy=
=0ACONFIG_HAVE_KVM_PFNCACHE=3Dy=0ACONFIG_HAVE_KVM_IRQCHIP=3Dy=0ACONFIG_HAVE=
_KVM_IRQ_ROUTING=3Dy=0ACONFIG_HAVE_KVM_DIRTY_RING=3Dy=0ACONFIG_HAVE_KVM_DIR=
TY_RING_TSO=3Dy=0ACONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL=3Dy=0ACONFIG_KVM_MMIO=
=3Dy=0ACONFIG_KVM_ASYNC_PF=3Dy=0ACONFIG_HAVE_KVM_MSI=3Dy=0ACONFIG_HAVE_KVM_=
READONLY_MEM=3Dy=0ACONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy=0ACONFIG_KVM_VFI=
O=3Dy=0ACONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy=0ACONFIG_KVM_GENERIC_P=
RE_FAULT_MEMORY=3Dy=0ACONFIG_KVM_COMPAT=3Dy=0ACONFIG_HAVE_KVM_IRQ_BYPASS=3D=
m=0ACONFIG_HAVE_KVM_NO_POLL=3Dy=0ACONFIG_VIRT_XFER_TO_GUEST_WORK=3Dy=0ACONF=
IG_HAVE_KVM_PM_NOTIFIER=3Dy=0ACONFIG_KVM_GENERIC_HARDWARE_ENABLING=3Dy=0ACO=
NFIG_KVM_GENERIC_MMU_NOTIFIER=3Dy=0ACONFIG_KVM_ELIDE_TLB_FLUSH_IF_YOUNG=3Dy=
=0ACONFIG_KVM_MMU_LOCKLESS_AGING=3Dy=0ACONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES=
=3Dy=0ACONFIG_KVM_GUEST_MEMFD=3Dy=0ACONFIG_HAVE_KVM_ARCH_GMEM_PREPARE=3Dy=
=0ACONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE=3Dy=0ACONFIG_HAVE_KVM_ARCH_GMEM_POP=
ULATE=3Dy=0ACONFIG_VIRTUALIZATION=3Dy=0ACONFIG_KVM_X86=3Dm=0ACONFIG_KVM=3Dm=
=0A# CONFIG_KVM_WERROR is not set=0ACONFIG_KVM_SW_PROTECTED_VM=3Dy=0ACONFIG=
_KVM_INTEL=3Dm=0A# CONFIG_KVM_INTEL_PROVE_VE is not set=0ACONFIG_X86_SGX_KV=
M=3Dy=0ACONFIG_KVM_INTEL_TDX=3Dy=0ACONFIG_KVM_AMD=3Dm=0ACONFIG_KVM_AMD_SEV=
=3Dy=0ACONFIG_KVM_IOAPIC=3Dy=0ACONFIG_KVM_SMM=3Dy=0ACONFIG_KVM_HYPERV=3Dy=
=0A# CONFIG_KVM_XEN is not set=0A# CONFIG_KVM_PROVE_MMU is not set=0ACONFIG=
_KVM_EXTERNAL_WRITE_TRACKING=3Dy=0ACONFIG_KVM_MAX_NR_VCPUS=3D4096=0ACONFIG_=
X86_REQUIRED_FEATURE_ALWAYS=3Dy=0ACONFIG_X86_REQUIRED_FEATURE_NOPL=3Dy=0ACO=
NFIG_X86_REQUIRED_FEATURE_CX8=3Dy=0ACONFIG_X86_REQUIRED_FEATURE_CMOV=3Dy=0A=
CONFIG_X86_REQUIRED_FEATURE_CPUID=3Dy=0ACONFIG_X86_REQUIRED_FEATURE_FPU=3Dy=
=0ACONFIG_X86_REQUIRED_FEATURE_PAE=3Dy=0ACONFIG_X86_REQUIRED_FEATURE_MSR=3D=
y=0ACONFIG_X86_REQUIRED_FEATURE_FXSR=3Dy=0ACONFIG_X86_REQUIRED_FEATURE_XMM=
=3Dy=0ACONFIG_X86_REQUIRED_FEATURE_XMM2=3Dy=0ACONFIG_X86_REQUIRED_FEATURE_L=
M=3Dy=0ACONFIG_X86_DISABLED_FEATURE_VME=3Dy=0ACONFIG_X86_DISABLED_FEATURE_K=
6_MTRR=3Dy=0ACONFIG_X86_DISABLED_FEATURE_CYRIX_ARR=3Dy=0ACONFIG_X86_DISABLE=
D_FEATURE_CENTAUR_MCR=3Dy=0ACONFIG_X86_DISABLED_FEATURE_LAM=3Dy=0ACONFIG_AS=
_WRUSS=3Dy=0ACONFIG_ARCH_CONFIGURES_CPU_MITIGATIONS=3Dy=0ACONFIG_ARCH_HAS_D=
MA_OPS=3Dy=0A=0A#=0A# General architecture-dependent options=0A#=0ACONFIG_H=
OTPLUG_SMT=3Dy=0ACONFIG_ARCH_SUPPORTS_SCHED_SMT=3Dy=0ACONFIG_ARCH_SUPPORTS_=
SCHED_CLUSTER=3Dy=0ACONFIG_ARCH_SUPPORTS_SCHED_MC=3Dy=0ACONFIG_SCHED_SMT=3D=
y=0ACONFIG_SCHED_CLUSTER=3Dy=0ACONFIG_SCHED_MC=3Dy=0ACONFIG_HOTPLUG_CORE_SY=
NC=3Dy=0ACONFIG_HOTPLUG_CORE_SYNC_DEAD=3Dy=0ACONFIG_HOTPLUG_CORE_SYNC_FULL=
=3Dy=0ACONFIG_HOTPLUG_SPLIT_STARTUP=3Dy=0ACONFIG_HOTPLUG_PARALLEL=3Dy=0ACON=
FIG_GENERIC_IRQ_ENTRY=3Dy=0ACONFIG_GENERIC_SYSCALL=3Dy=0ACONFIG_GENERIC_ENT=
RY=3Dy=0ACONFIG_KPROBES=3Dy=0ACONFIG_JUMP_LABEL=3Dy=0A# CONFIG_STATIC_KEYS_=
SELFTEST is not set=0A# CONFIG_STATIC_CALL_SELFTEST is not set=0ACONFIG_OPT=
PROBES=3Dy=0ACONFIG_KPROBES_ON_FTRACE=3Dy=0ACONFIG_UPROBES=3Dy=0A# CONFIG_H=
AVE_64BIT_ALIGNED_ACCESS is not set=0ACONFIG_HAVE_EFFICIENT_UNALIGNED_ACCES=
S=3Dy=0ACONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy=0ACONFIG_KRETPROBES=3Dy=0ACONFIG_=
KRETPROBE_ON_RETHOOK=3Dy=0ACONFIG_USER_RETURN_NOTIFIER=3Dy=0ACONFIG_HAVE_IO=
REMAP_PROT=3Dy=0ACONFIG_HAVE_KPROBES=3Dy=0ACONFIG_HAVE_KRETPROBES=3Dy=0ACON=
FIG_HAVE_OPTPROBES=3Dy=0ACONFIG_HAVE_KPROBES_ON_FTRACE=3Dy=0ACONFIG_ARCH_CO=
RRECT_STACKTRACE_ON_KRETPROBE=3Dy=0ACONFIG_HAVE_FUNCTION_ERROR_INJECTION=3D=
y=0ACONFIG_HAVE_NMI=3Dy=0ACONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy=0ACONFIG_TRACE_=
IRQFLAGS_NMI_SUPPORT=3Dy=0ACONFIG_HAVE_ARCH_TRACEHOOK=3Dy=0ACONFIG_HAVE_DMA=
_CONTIGUOUS=3Dy=0ACONFIG_GENERIC_SMP_IDLE_THREAD=3Dy=0ACONFIG_ARCH_HAS_FORT=
IFY_SOURCE=3Dy=0ACONFIG_ARCH_HAS_SET_MEMORY=3Dy=0ACONFIG_ARCH_HAS_SET_DIREC=
T_MAP=3Dy=0ACONFIG_ARCH_HAS_CPU_FINALIZE_INIT=3Dy=0ACONFIG_ARCH_HAS_CPU_PAS=
ID=3Dy=0ACONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy=0ACONFIG_ARCH_WANTS_D=
YNAMIC_TASK_STRUCT=3Dy=0ACONFIG_ARCH_WANTS_NO_INSTR=3Dy=0ACONFIG_HAVE_ASM_M=
ODVERSIONS=3Dy=0ACONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy=0ACONFIG_HAVE_RS=
EQ=3Dy=0ACONFIG_HAVE_RUST=3Dy=0ACONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy=0AC=
ONFIG_HAVE_HW_BREAKPOINT=3Dy=0ACONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy=0ACON=
FIG_HAVE_USER_RETURN_NOTIFIER=3Dy=0ACONFIG_HAVE_PERF_EVENTS_NMI=3Dy=0ACONFI=
G_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy=0ACONFIG_UNWIND_USER=3Dy=0ACONFIG_HAVE_=
UNWIND_USER_FP=3Dy=0ACONFIG_HAVE_PERF_REGS=3Dy=0ACONFIG_HAVE_PERF_USER_STAC=
K_DUMP=3Dy=0ACONFIG_HAVE_ARCH_JUMP_LABEL=3Dy=0ACONFIG_HAVE_ARCH_JUMP_LABEL_=
RELATIVE=3Dy=0ACONFIG_MMU_GATHER_TABLE_FREE=3Dy=0ACONFIG_MMU_GATHER_RCU_TAB=
LE_FREE=3Dy=0ACONFIG_MMU_GATHER_MERGE_VMAS=3Dy=0ACONFIG_ARCH_WANT_IRQS_OFF_=
ACTIVATE_MM=3Dy=0ACONFIG_MMU_LAZY_TLB_REFCOUNT=3Dy=0ACONFIG_ARCH_HAVE_NMI_S=
AFE_CMPXCHG=3Dy=0ACONFIG_ARCH_HAVE_EXTRA_ELF_NOTES=3Dy=0ACONFIG_ARCH_HAS_NM=
I_SAFE_THIS_CPU_OPS=3Dy=0ACONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy=0ACONFIG_HAVE=
_CMPXCHG_LOCAL=3Dy=0ACONFIG_HAVE_CMPXCHG_DOUBLE=3Dy=0ACONFIG_ARCH_WANT_COMP=
AT_IPC_PARSE_VERSION=3Dy=0ACONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy=0ACONFIG_HAV=
E_ARCH_SECCOMP=3Dy=0ACONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy=0ACONFIG_SECCOMP=
=3Dy=0ACONFIG_SECCOMP_FILTER=3Dy=0A# CONFIG_SECCOMP_CACHE_DEBUG is not set=
=0ACONFIG_HAVE_ARCH_KSTACK_ERASE=3Dy=0ACONFIG_HAVE_STACKPROTECTOR=3Dy=0ACON=
FIG_STACKPROTECTOR=3Dy=0ACONFIG_STACKPROTECTOR_STRONG=3Dy=0ACONFIG_ARCH_SUP=
PORTS_LTO_CLANG=3Dy=0ACONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy=0ACONFIG_LTO_=
NONE=3Dy=0ACONFIG_ARCH_SUPPORTS_AUTOFDO_CLANG=3Dy=0ACONFIG_ARCH_SUPPORTS_PR=
OPELLER_CLANG=3Dy=0ACONFIG_ARCH_SUPPORTS_CFI=3Dy=0ACONFIG_HAVE_ARCH_WITHIN_=
STACK_FRAMES=3Dy=0ACONFIG_HAVE_CONTEXT_TRACKING_USER=3Dy=0ACONFIG_HAVE_CONT=
EXT_TRACKING_USER_OFFSTACK=3Dy=0ACONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy=0A=
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy=0ACONFIG_HAVE_MOVE_PUD=3Dy=0ACONFIG_HAV=
E_MOVE_PMD=3Dy=0ACONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy=0ACONFIG_HAVE_AR=
CH_TRANSPARENT_HUGEPAGE_PUD=3Dy=0ACONFIG_HAVE_ARCH_HUGE_VMAP=3Dy=0ACONFIG_H=
AVE_ARCH_HUGE_VMALLOC=3Dy=0ACONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy=0ACONFIG_AR=
CH_WANT_PMD_MKWRITE=3Dy=0ACONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy=0ACONFIG_HAVE_MOD=
_ARCH_SPECIFIC=3Dy=0ACONFIG_MODULES_USE_ELF_RELA=3Dy=0ACONFIG_ARCH_HAS_EXEC=
MEM_ROX=3Dy=0ACONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy=0ACONFIG_HAVE_SOFTIRQ_O=
N_OWN_STACK=3Dy=0ACONFIG_SOFTIRQ_ON_OWN_STACK=3Dy=0ACONFIG_ARCH_HAS_ELF_RAN=
DOMIZE=3Dy=0ACONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy=0ACONFIG_HAVE_EXIT_THREAD=
=3Dy=0ACONFIG_ARCH_MMAP_RND_BITS=3D28=0ACONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BI=
TS=3Dy=0ACONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8=0ACONFIG_HAVE_ARCH_COMPAT_MMA=
P_BASES=3Dy=0ACONFIG_HAVE_PAGE_SIZE_4KB=3Dy=0ACONFIG_PAGE_SIZE_4KB=3Dy=0ACO=
NFIG_PAGE_SIZE_LESS_THAN_64KB=3Dy=0ACONFIG_PAGE_SIZE_LESS_THAN_256KB=3Dy=0A=
CONFIG_PAGE_SHIFT=3D12=0ACONFIG_HAVE_OBJTOOL=3Dy=0ACONFIG_HAVE_JUMP_LABEL_H=
ACK=3Dy=0ACONFIG_HAVE_NOINSTR_HACK=3Dy=0ACONFIG_HAVE_NOINSTR_VALIDATION=3Dy=
=0ACONFIG_HAVE_UACCESS_VALIDATION=3Dy=0ACONFIG_HAVE_STACK_VALIDATION=3Dy=0A=
CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy=0A# CONFIG_HAVE_ARCH_HASH is not set=0A=
CONFIG_ISA_BUS_API=3Dy=0ACONFIG_OLD_SIGSUSPEND3=3Dy=0ACONFIG_COMPAT_OLD_SIG=
ACTION=3Dy=0ACONFIG_COMPAT_32BIT_TIME=3Dy=0ACONFIG_ARCH_SUPPORTS_RT=3Dy=0A#=
 CONFIG_CPU_NO_EFFICIENT_FFS is not set=0ACONFIG_HAVE_ARCH_VMAP_STACK=3Dy=
=0ACONFIG_VMAP_STACK=3Dy=0ACONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy=0AC=
ONFIG_RANDOMIZE_KSTACK_OFFSET=3Dy=0ACONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=
=3Dy=0A# CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set=0A# CONFIG_ARCH_OPTIONA=
L_KERNEL_RWX_DEFAULT is not set=0ACONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy=0AC=
ONFIG_STRICT_KERNEL_RWX=3Dy=0ACONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy=0ACONFI=
G_STRICT_MODULE_RWX=3Dy=0ACONFIG_ARCH_HAS_CPU_RESCTRL=3Dy=0ACONFIG_HAVE_ARC=
H_PREL32_RELOCATIONS=3Dy=0ACONFIG_ARCH_USE_MEMREMAP_PROT=3Dy=0A# CONFIG_LOC=
K_EVENT_COUNTS is not set=0ACONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy=0ACONFIG_ARCH_H=
AS_CC_PLATFORM=3Dy=0ACONFIG_HAVE_STATIC_CALL=3Dy=0ACONFIG_HAVE_STATIC_CALL_=
INLINE=3Dy=0ACONFIG_HAVE_PREEMPT_DYNAMIC=3Dy=0ACONFIG_HAVE_PREEMPT_DYNAMIC_=
CALL=3Dy=0ACONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy=0ACONFIG_ARCH_SUPPORTS_DEBUG=
_PAGEALLOC=3Dy=0ACONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=3Dy=0ACONFIG_ARCH_HA=
S_ELFCORE_COMPAT=3Dy=0ACONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=3Dy=0ACONFIG_DYNA=
MIC_SIGFRAME=3Dy=0ACONFIG_HAVE_ARCH_NODE_DEV_GROUP=3Dy=0ACONFIG_ARCH_HAS_HW=
_PTE_YOUNG=3Dy=0ACONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=3Dy=0ACONFIG_ARCH_HAS_KE=
RNEL_FPU_SUPPORT=3Dy=0ACONFIG_ARCH_VMLINUX_NEEDS_RELOCS=3Dy=0ACONFIG_HAVE_G=
ENERIC_TIF_BITS=3Dy=0A=0A#=0A# GCOV-based kernel profiling=0A#=0A# CONFIG_G=
COV_KERNEL is not set=0ACONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy=0A# end of GCO=
V-based kernel profiling=0A=0ACONFIG_HAVE_GCC_PLUGINS=3Dy=0ACONFIG_FUNCTION=
_ALIGNMENT_4B=3Dy=0ACONFIG_FUNCTION_ALIGNMENT_16B=3Dy=0ACONFIG_FUNCTION_ALI=
GNMENT=3D16=0ACONFIG_CC_HAS_MIN_FUNCTION_ALIGNMENT=3Dy=0ACONFIG_CC_HAS_SANE=
_FUNCTION_ALIGNMENT=3Dy=0ACONFIG_ARCH_HAS_CPU_ATTACK_VECTORS=3Dy=0A# end of=
 General architecture-dependent options=0A=0ACONFIG_RT_MUTEXES=3Dy=0ACONFIG=
_MODULE_SIG_FORMAT=3Dy=0ACONFIG_MODULES=3Dy=0ACONFIG_MODULE_DEBUGFS=3Dy=0A#=
 CONFIG_MODULE_DEBUG is not set=0ACONFIG_MODULE_FORCE_LOAD=3Dy=0ACONFIG_MOD=
ULE_UNLOAD=3Dy=0A# CONFIG_MODULE_FORCE_UNLOAD is not set=0ACONFIG_MODULE_UN=
LOAD_TAINT_TRACKING=3Dy=0ACONFIG_MODVERSIONS=3Dy=0A# CONFIG_GENKSYMS is not=
 set=0ACONFIG_GENDWARFKSYMS=3Dy=0ACONFIG_ASM_MODVERSIONS=3Dy=0A# CONFIG_EXT=
ENDED_MODVERSIONS is not set=0ACONFIG_BASIC_MODVERSIONS=3Dy=0ACONFIG_MODULE=
_SRCVERSION_ALL=3Dy=0ACONFIG_MODULE_SIG=3Dy=0A# CONFIG_MODULE_SIG_FORCE is =
not set=0A# CONFIG_MODULE_SIG_ALL is not set=0A# CONFIG_MODULE_SIG_SHA1 is =
not set=0ACONFIG_MODULE_SIG_SHA256=3Dy=0A# CONFIG_MODULE_SIG_SHA384 is not =
set=0A# CONFIG_MODULE_SIG_SHA512 is not set=0A# CONFIG_MODULE_SIG_SHA3_256 =
is not set=0A# CONFIG_MODULE_SIG_SHA3_384 is not set=0A# CONFIG_MODULE_SIG_=
SHA3_512 is not set=0ACONFIG_MODULE_SIG_HASH=3D"sha256"=0ACONFIG_MODULE_COM=
PRESS=3Dy=0A# CONFIG_MODULE_COMPRESS_GZIP is not set=0A# CONFIG_MODULE_COMP=
RESS_XZ is not set=0ACONFIG_MODULE_COMPRESS_ZSTD=3Dy=0A# CONFIG_MODULE_COMP=
RESS_ALL is not set=0ACONFIG_MODULE_DECOMPRESS=3Dy=0A# CONFIG_MODULE_ALLOW_=
MISSING_NAMESPACE_IMPORTS is not set=0ACONFIG_MODPROBE_PATH=3D"/usr/sbin/mo=
dprobe"=0A# CONFIG_TRIM_UNUSED_KSYMS is not set=0ACONFIG_MODULES_TREE_LOOKU=
P=3Dy=0ACONFIG_BLOCK=3Dy=0ACONFIG_BLOCK_LEGACY_AUTOLOAD=3Dy=0ACONFIG_BLK_RQ=
_ALLOC_TIME=3Dy=0ACONFIG_BLK_CGROUP_RWSTAT=3Dy=0ACONFIG_BLK_CGROUP_PUNT_BIO=
=3Dy=0ACONFIG_BLK_DEV_BSG_COMMON=3Dy=0ACONFIG_BLK_ICQ=3Dy=0ACONFIG_BLK_DEV_=
BSGLIB=3Dy=0ACONFIG_BLK_DEV_INTEGRITY=3Dy=0ACONFIG_BLK_DEV_WRITE_MOUNTED=3D=
y=0ACONFIG_BLK_DEV_ZONED=3Dy=0ACONFIG_BLK_DEV_THROTTLING=3Dy=0ACONFIG_BLK_W=
BT=3Dy=0ACONFIG_BLK_WBT_MQ=3Dy=0ACONFIG_BLK_CGROUP_IOLATENCY=3Dy=0ACONFIG_B=
LK_CGROUP_FC_APPID=3Dy=0ACONFIG_BLK_CGROUP_IOCOST=3Dy=0A# CONFIG_BLK_CGROUP=
_IOPRIO is not set=0ACONFIG_BLK_DEBUG_FS=3Dy=0ACONFIG_BLK_SED_OPAL=3Dy=0ACO=
NFIG_BLK_INLINE_ENCRYPTION=3Dy=0ACONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=3Dy=
=0A=0A#=0A# Partition Types=0A#=0ACONFIG_PARTITION_ADVANCED=3Dy=0A# CONFIG_=
ACORN_PARTITION is not set=0A# CONFIG_AIX_PARTITION is not set=0ACONFIG_OSF=
_PARTITION=3Dy=0ACONFIG_AMIGA_PARTITION=3Dy=0ACONFIG_ATARI_PARTITION=3Dy=0A=
CONFIG_MAC_PARTITION=3Dy=0ACONFIG_MSDOS_PARTITION=3Dy=0ACONFIG_BSD_DISKLABE=
L=3Dy=0A# CONFIG_MINIX_SUBPARTITION is not set=0ACONFIG_SOLARIS_X86_PARTITI=
ON=3Dy=0ACONFIG_UNIXWARE_DISKLABEL=3Dy=0ACONFIG_LDM_PARTITION=3Dy=0A# CONFI=
G_LDM_DEBUG is not set=0ACONFIG_SGI_PARTITION=3Dy=0ACONFIG_ULTRIX_PARTITION=
=3Dy=0ACONFIG_SUN_PARTITION=3Dy=0ACONFIG_KARMA_PARTITION=3Dy=0ACONFIG_EFI_P=
ARTITION=3Dy=0ACONFIG_SYSV68_PARTITION=3Dy=0A# CONFIG_CMDLINE_PARTITION is =
not set=0A# end of Partition Types=0A=0ACONFIG_BLK_PM=3Dy=0ACONFIG_BLOCK_HO=
LDER_DEPRECATED=3Dy=0ACONFIG_BLK_MQ_STACKING=3Dy=0A=0A#=0A# IO Schedulers=
=0A#=0ACONFIG_MQ_IOSCHED_DEADLINE=3Dy=0ACONFIG_MQ_IOSCHED_KYBER=3Dy=0ACONFI=
G_IOSCHED_BFQ=3Dy=0ACONFIG_BFQ_GROUP_IOSCHED=3Dy=0A# CONFIG_BFQ_CGROUP_DEBU=
G is not set=0A# end of IO Schedulers=0A=0ACONFIG_PREEMPT_NOTIFIERS=3Dy=0AC=
ONFIG_PADATA=3Dy=0ACONFIG_ASN1=3Dy=0ACONFIG_UNINLINE_SPIN_UNLOCK=3Dy=0ACONF=
IG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy=0ACONFIG_MUTEX_SPIN_ON_OWNER=3Dy=0ACONFIG_R=
WSEM_SPIN_ON_OWNER=3Dy=0ACONFIG_LOCK_SPIN_ON_OWNER=3Dy=0ACONFIG_ARCH_USE_QU=
EUED_SPINLOCKS=3Dy=0ACONFIG_QUEUED_SPINLOCKS=3Dy=0ACONFIG_ARCH_USE_QUEUED_R=
WLOCKS=3Dy=0ACONFIG_QUEUED_RWLOCKS=3Dy=0ACONFIG_ARCH_HAS_NON_OVERLAPPING_AD=
DRESS_SPACE=3Dy=0ACONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy=0ACONFIG_AR=
CH_HAS_SYSCALL_WRAPPER=3Dy=0ACONFIG_FREEZER=3Dy=0A=0A#=0A# Executable file =
formats=0A#=0ACONFIG_BINFMT_ELF=3Dy=0ACONFIG_COMPAT_BINFMT_ELF=3Dy=0ACONFIG=
_ELFCORE=3Dy=0ACONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy=0ACONFIG_BINFMT_SCR=
IPT=3Dy=0ACONFIG_BINFMT_MISC=3Dm=0ACONFIG_COREDUMP=3Dy=0A# CONFIG_ARCH_HAS_=
ELF_CORE_EFLAGS is not set=0A# end of Executable file formats=0A=0A#=0A# Me=
mory Management options=0A#=0ACONFIG_SWAP=3Dy=0ACONFIG_ZSWAP=3Dy=0A# CONFIG=
_ZSWAP_DEFAULT_ON is not set=0A# CONFIG_ZSWAP_SHRINKER_DEFAULT_ON is not se=
t=0A# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set=0ACONFIG_ZSWAP_COM=
PRESSOR_DEFAULT_LZO=3Dy=0A# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set=
=0A# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set=0A# CONFIG_ZSWAP_COMPRE=
SSOR_DEFAULT_LZ4HC is not set=0A# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is n=
ot set=0ACONFIG_ZSWAP_COMPRESSOR_DEFAULT=3D"lzo"=0ACONFIG_ZSMALLOC=3Dy=0A=
=0A#=0A# Zsmalloc allocator options=0A#=0A=0A#=0A# Zsmalloc is a common bac=
kend allocator for zswap & zram=0A#=0A# CONFIG_ZSMALLOC_STAT is not set=0AC=
ONFIG_ZSMALLOC_CHAIN_SIZE=3D8=0A# end of Zsmalloc allocator options=0A=0A#=
=0A# Slab allocator options=0A#=0ACONFIG_SLUB=3Dy=0ACONFIG_KVFREE_RCU_BATCH=
ED=3Dy=0A# CONFIG_SLUB_TINY is not set=0ACONFIG_SLAB_MERGE_DEFAULT=3Dy=0ACO=
NFIG_SLAB_FREELIST_RANDOM=3Dy=0ACONFIG_SLAB_FREELIST_HARDENED=3Dy=0ACONFIG_=
SLAB_BUCKETS=3Dy=0A# CONFIG_SLUB_STATS is not set=0ACONFIG_SLUB_CPU_PARTIAL=
=3Dy=0ACONFIG_RANDOM_KMALLOC_CACHES=3Dy=0A# end of Slab allocator options=
=0A=0ACONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy=0A# CONFIG_COMPAT_BRK is not set=0A=
CONFIG_SPARSEMEM=3Dy=0ACONFIG_SPARSEMEM_EXTREME=3Dy=0ACONFIG_SPARSEMEM_VMEM=
MAP_ENABLE=3Dy=0ACONFIG_SPARSEMEM_VMEMMAP=3Dy=0ACONFIG_SPARSEMEM_VMEMMAP_PR=
EINIT=3Dy=0ACONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=3Dy=0ACONFIG_ARCH_WANT_OP=
TIMIZE_HUGETLB_VMEMMAP=3Dy=0ACONFIG_ARCH_WANT_HUGETLB_VMEMMAP_PREINIT=3Dy=
=0ACONFIG_HAVE_GUP_FAST=3Dy=0ACONFIG_ARCH_KEEP_MEMBLOCK=3Dy=0ACONFIG_NUMA_K=
EEP_MEMINFO=3Dy=0ACONFIG_MEMORY_ISOLATION=3Dy=0ACONFIG_EXCLUSIVE_SYSTEM_RAM=
=3Dy=0ACONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy=0ACONFIG_ARCH_ENABLE_MEMORY_HOTPLU=
G=3Dy=0ACONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy=0ACONFIG_MEMORY_HOTPLUG=3Dy=
=0ACONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE=3Dy=0A# CONFIG_MHP_DEFAULT_ONLINE=
_TYPE_ONLINE_AUTO is not set=0A# CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERN=
EL is not set=0A# CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE is not set=
=0ACONFIG_MEMORY_HOTREMOVE=3Dy=0ACONFIG_MHP_MEMMAP_ON_MEMORY=3Dy=0ACONFIG_A=
RCH_MHP_MEMMAP_ON_MEMORY_ENABLE=3Dy=0ACONFIG_SPLIT_PTE_PTLOCKS=3Dy=0ACONFIG=
_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy=0ACONFIG_SPLIT_PMD_PTLOCKS=3Dy=0ACONFIG_M=
EMORY_BALLOON=3Dy=0ACONFIG_BALLOON_COMPACTION=3Dy=0ACONFIG_COMPACTION=3Dy=
=0ACONFIG_COMPACT_UNEVICTABLE_DEFAULT=3D1=0ACONFIG_PAGE_REPORTING=3Dy=0ACON=
FIG_MIGRATION=3Dy=0ACONFIG_DEVICE_MIGRATION=3Dy=0ACONFIG_ARCH_ENABLE_HUGEPA=
GE_MIGRATION=3Dy=0ACONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy=0A# CONFIG_HUGETLB_=
PAGE_SIZE_VARIABLE is not set=0ACONFIG_CONTIG_ALLOC=3Dy=0ACONFIG_PCP_BATCH_=
SCALE_MAX=3D5=0ACONFIG_PHYS_ADDR_T_64BIT=3Dy=0ACONFIG_MMU_NOTIFIER=3Dy=0ACO=
NFIG_KSM=3Dy=0ACONFIG_DEFAULT_MMAP_MIN_ADDR=3D65536=0ACONFIG_ARCH_SUPPORTS_=
MEMORY_FAILURE=3Dy=0ACONFIG_MEMORY_FAILURE=3Dy=0ACONFIG_HWPOISON_INJECT=3Dm=
=0ACONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy=0ACONFIG_ARCH_WANTS_THP_SWAP=3Dy=0A=
CONFIG_PERSISTENT_HUGE_ZERO_FOLIO=3Dy=0ACONFIG_MM_ID=3Dy=0ACONFIG_TRANSPARE=
NT_HUGEPAGE=3Dy=0ACONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy=0A# CONFIG_TRANSPA=
RENT_HUGEPAGE_MADVISE is not set=0A# CONFIG_TRANSPARENT_HUGEPAGE_NEVER is n=
ot set=0ACONFIG_TRANSPARENT_HUGEPAGE_SHMEM_HUGE_NEVER=3Dy=0A# CONFIG_TRANSP=
ARENT_HUGEPAGE_SHMEM_HUGE_ALWAYS is not set=0A# CONFIG_TRANSPARENT_HUGEPAGE=
_SHMEM_HUGE_WITHIN_SIZE is not set=0A# CONFIG_TRANSPARENT_HUGEPAGE_SHMEM_HU=
GE_ADVISE is not set=0ACONFIG_TRANSPARENT_HUGEPAGE_TMPFS_HUGE_NEVER=3Dy=0A#=
 CONFIG_TRANSPARENT_HUGEPAGE_TMPFS_HUGE_ALWAYS is not set=0A# CONFIG_TRANSP=
ARENT_HUGEPAGE_TMPFS_HUGE_WITHIN_SIZE is not set=0A# CONFIG_TRANSPARENT_HUG=
EPAGE_TMPFS_HUGE_ADVISE is not set=0ACONFIG_THP_SWAP=3Dy=0ACONFIG_READ_ONLY=
_THP_FOR_FS=3Dy=0A# CONFIG_NO_PAGE_MAPCOUNT is not set=0ACONFIG_PAGE_MAPCOU=
NT=3Dy=0ACONFIG_PGTABLE_HAS_HUGE_LEAVES=3Dy=0ACONFIG_HAVE_GIGANTIC_FOLIOS=
=3Dy=0ACONFIG_ASYNC_KERNEL_PGTABLE_FREE=3Dy=0ACONFIG_ARCH_SUPPORTS_HUGE_PFN=
MAP=3Dy=0ACONFIG_ARCH_SUPPORTS_PMD_PFNMAP=3Dy=0ACONFIG_ARCH_SUPPORTS_PUD_PF=
NMAP=3Dy=0ACONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy=0ACONFIG_NEED_PER_CPU_=
PAGE_FIRST_CHUNK=3Dy=0ACONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy=0ACONFIG_HAVE_SET=
UP_PER_CPU_AREA=3Dy=0ACONFIG_CMA=3Dy=0A# CONFIG_CMA_DEBUGFS is not set=0ACO=
NFIG_CMA_SYSFS=3Dy=0ACONFIG_CMA_AREAS=3D20=0ACONFIG_PAGE_BLOCK_MAX_ORDER=3D=
10=0ACONFIG_MEM_SOFT_DIRTY=3Dy=0ACONFIG_GENERIC_EARLY_IOREMAP=3Dy=0ACONFIG_=
DEFERRED_STRUCT_PAGE_INIT=3Dy=0ACONFIG_PAGE_IDLE_FLAG=3Dy=0A# CONFIG_IDLE_P=
AGE_TRACKING is not set=0ACONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy=0ACONFIG_ARCH=
_HAS_CURRENT_STACK_POINTER=3Dy=0ACONFIG_ARCH_HAS_ZONE_DMA_SET=3Dy=0ACONFIG_=
ZONE_DMA=3Dy=0ACONFIG_ZONE_DMA32=3Dy=0ACONFIG_ZONE_DEVICE=3Dy=0ACONFIG_HMM_=
MIRROR=3Dy=0ACONFIG_GET_FREE_REGION=3Dy=0ACONFIG_DEVICE_PRIVATE=3Dy=0ACONFI=
G_VMAP_PFN=3Dy=0ACONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy=0ACONFIG_ARCH_HAS_PKEY=
S=3Dy=0ACONFIG_ARCH_USES_PG_ARCH_2=3Dy=0ACONFIG_VM_EVENT_COUNTERS=3Dy=0A# C=
ONFIG_PERCPU_STATS is not set=0A# CONFIG_GUP_TEST is not set=0A# CONFIG_DMA=
POOL_TEST is not set=0ACONFIG_ARCH_HAS_PTE_SPECIAL=3Dy=0ACONFIG_MAPPING_DIR=
TY_HELPERS=3Dy=0ACONFIG_MEMFD_CREATE=3Dy=0ACONFIG_SECRETMEM=3Dy=0ACONFIG_AN=
ON_VMA_NAME=3Dy=0ACONFIG_HAVE_ARCH_USERFAULTFD_WP=3Dy=0ACONFIG_HAVE_ARCH_US=
ERFAULTFD_MINOR=3Dy=0ACONFIG_USERFAULTFD=3Dy=0ACONFIG_PTE_MARKER_UFFD_WP=3D=
y=0ACONFIG_LRU_GEN=3Dy=0A# CONFIG_LRU_GEN_ENABLED is not set=0A# CONFIG_LRU=
_GEN_STATS is not set=0ACONFIG_LRU_GEN_WALKS_MMU=3Dy=0ACONFIG_ARCH_SUPPORTS=
_PER_VMA_LOCK=3Dy=0ACONFIG_PER_VMA_LOCK=3Dy=0ACONFIG_LOCK_MM_AND_FIND_VMA=
=3Dy=0ACONFIG_IOMMU_MM_DATA=3Dy=0ACONFIG_EXECMEM=3Dy=0ACONFIG_NUMA_MEMBLKS=
=3Dy=0ACONFIG_NUMA_EMU=3Dy=0ACONFIG_ARCH_HAS_USER_SHADOW_STACK=3Dy=0ACONFIG=
_ARCH_SUPPORTS_PT_RECLAIM=3Dy=0ACONFIG_PT_RECLAIM=3Dy=0ACONFIG_FIND_NORMAL_=
PAGE=3Dy=0A=0A#=0A# Data Access Monitoring=0A#=0ACONFIG_DAMON=3Dy=0ACONFIG_=
DAMON_VADDR=3Dy=0ACONFIG_DAMON_PADDR=3Dy=0ACONFIG_DAMON_SYSFS=3Dy=0A# CONFI=
G_DAMON_RECLAIM is not set=0A# CONFIG_DAMON_LRU_SORT is not set=0A# CONFIG_=
DAMON_STAT is not set=0A# end of Data Access Monitoring=0A# end of Memory M=
anagement options=0A=0ACONFIG_NET=3Dy=0ACONFIG_WANT_COMPAT_NETLINK_MESSAGES=
=3Dy=0ACONFIG_COMPAT_NETLINK_MESSAGES=3Dy=0ACONFIG_NET_INGRESS=3Dy=0ACONFIG=
_NET_EGRESS=3Dy=0ACONFIG_NET_XGRESS=3Dy=0ACONFIG_NET_REDIRECT=3Dy=0ACONFIG_=
SKB_DECRYPTED=3Dy=0ACONFIG_SKB_EXTENSIONS=3Dy=0ACONFIG_NET_DEVMEM=3Dy=0ACON=
FIG_NET_SHAPER=3Dy=0ACONFIG_NET_CRC32C=3Dy=0A=0A#=0A# Networking options=0A=
#=0ACONFIG_PACKET=3Dm=0ACONFIG_PACKET_DIAG=3Dm=0ACONFIG_INET_PSP=3Dy=0ACONF=
IG_UNIX=3Dy=0ACONFIG_AF_UNIX_OOB=3Dy=0ACONFIG_UNIX_DIAG=3Dm=0ACONFIG_TLS=3D=
m=0ACONFIG_TLS_DEVICE=3Dy=0A# CONFIG_TLS_TOE is not set=0ACONFIG_XFRM=3Dy=
=0ACONFIG_XFRM_OFFLOAD=3Dy=0ACONFIG_XFRM_ALGO=3Dm=0ACONFIG_XFRM_USER=3Dm=0A=
CONFIG_XFRM_USER_COMPAT=3Dm=0ACONFIG_XFRM_INTERFACE=3Dm=0ACONFIG_XFRM_SUB_P=
OLICY=3Dy=0ACONFIG_XFRM_MIGRATE=3Dy=0A# CONFIG_XFRM_STATISTICS is not set=
=0ACONFIG_XFRM_AH=3Dm=0ACONFIG_XFRM_ESP=3Dm=0ACONFIG_XFRM_IPCOMP=3Dm=0ACONF=
IG_NET_KEY=3Dm=0ACONFIG_NET_KEY_MIGRATE=3Dy=0ACONFIG_XFRM_IPTFS=3Dm=0ACONFI=
G_XFRM_ESPINTCP=3Dy=0ACONFIG_SMC=3Dm=0ACONFIG_SMC_DIAG=3Dm=0ACONFIG_SMC_HS_=
CTRL_BPF=3Dy=0ACONFIG_DIBS=3Dm=0A# CONFIG_DIBS_LO is not set=0ACONFIG_XDP_S=
OCKETS=3Dy=0ACONFIG_XDP_SOCKETS_DIAG=3Dm=0ACONFIG_NET_HANDSHAKE=3Dy=0ACONFI=
G_INET=3Dy=0ACONFIG_IP_MULTICAST=3Dy=0ACONFIG_IP_ADVANCED_ROUTER=3Dy=0A# CO=
NFIG_IP_FIB_TRIE_STATS is not set=0ACONFIG_IP_MULTIPLE_TABLES=3Dy=0ACONFIG_=
IP_ROUTE_MULTIPATH=3Dy=0ACONFIG_IP_ROUTE_VERBOSE=3Dy=0ACONFIG_IP_ROUTE_CLAS=
SID=3Dy=0A# CONFIG_IP_PNP is not set=0ACONFIG_NET_IPIP=3Dm=0ACONFIG_NET_IPG=
RE_DEMUX=3Dm=0ACONFIG_NET_IP_TUNNEL=3Dm=0ACONFIG_NET_IPGRE=3Dm=0ACONFIG_NET=
_IPGRE_BROADCAST=3Dy=0ACONFIG_IP_MROUTE_COMMON=3Dy=0ACONFIG_IP_MROUTE=3Dy=
=0ACONFIG_IP_MROUTE_MULTIPLE_TABLES=3Dy=0ACONFIG_IP_PIMSM_V1=3Dy=0ACONFIG_I=
P_PIMSM_V2=3Dy=0ACONFIG_SYN_COOKIES=3Dy=0ACONFIG_NET_IPVTI=3Dm=0ACONFIG_NET=
_UDP_TUNNEL=3Dm=0ACONFIG_NET_FOU=3Dm=0ACONFIG_NET_FOU_IP_TUNNELS=3Dy=0ACONF=
IG_INET_AH=3Dm=0ACONFIG_INET_ESP=3Dm=0ACONFIG_INET_ESP_OFFLOAD=3Dm=0ACONFIG=
_INET_ESPINTCP=3Dy=0ACONFIG_INET_IPCOMP=3Dm=0ACONFIG_INET_TABLE_PERTURB_ORD=
ER=3D16=0ACONFIG_INET_XFRM_TUNNEL=3Dm=0ACONFIG_INET_TUNNEL=3Dm=0ACONFIG_INE=
T_DIAG=3Dm=0ACONFIG_INET_TCP_DIAG=3Dm=0ACONFIG_INET_UDP_DIAG=3Dm=0ACONFIG_I=
NET_RAW_DIAG=3Dm=0ACONFIG_INET_DIAG_DESTROY=3Dy=0ACONFIG_TCP_CONG_ADVANCED=
=3Dy=0ACONFIG_TCP_CONG_BIC=3Dm=0ACONFIG_TCP_CONG_CUBIC=3Dy=0ACONFIG_TCP_CON=
G_WESTWOOD=3Dm=0ACONFIG_TCP_CONG_HTCP=3Dm=0ACONFIG_TCP_CONG_HSTCP=3Dm=0ACON=
FIG_TCP_CONG_HYBLA=3Dm=0ACONFIG_TCP_CONG_VEGAS=3Dm=0ACONFIG_TCP_CONG_NV=3Dm=
=0ACONFIG_TCP_CONG_SCALABLE=3Dm=0ACONFIG_TCP_CONG_LP=3Dm=0ACONFIG_TCP_CONG_=
VENO=3Dm=0ACONFIG_TCP_CONG_YEAH=3Dm=0ACONFIG_TCP_CONG_ILLINOIS=3Dm=0ACONFIG=
_TCP_CONG_DCTCP=3Dm=0ACONFIG_TCP_CONG_CDG=3Dm=0ACONFIG_TCP_CONG_BBR=3Dm=0AC=
ONFIG_DEFAULT_CUBIC=3Dy=0A# CONFIG_DEFAULT_RENO is not set=0ACONFIG_DEFAULT=
_TCP_CONG=3D"cubic"=0ACONFIG_TCP_SIGPOOL=3Dy=0ACONFIG_TCP_AO=3Dy=0ACONFIG_T=
CP_MD5SIG=3Dy=0ACONFIG_IPV6=3Dy=0ACONFIG_IPV6_ROUTER_PREF=3Dy=0ACONFIG_IPV6=
_ROUTE_INFO=3Dy=0A# CONFIG_IPV6_OPTIMISTIC_DAD is not set=0ACONFIG_INET6_AH=
=3Dm=0ACONFIG_INET6_ESP=3Dm=0ACONFIG_INET6_ESP_OFFLOAD=3Dm=0ACONFIG_INET6_E=
SPINTCP=3Dy=0ACONFIG_INET6_IPCOMP=3Dm=0ACONFIG_IPV6_MIP6=3Dm=0ACONFIG_IPV6_=
ILA=3Dm=0ACONFIG_INET6_XFRM_TUNNEL=3Dm=0ACONFIG_INET6_TUNNEL=3Dm=0ACONFIG_I=
PV6_VTI=3Dm=0ACONFIG_IPV6_SIT=3Dm=0ACONFIG_IPV6_SIT_6RD=3Dy=0ACONFIG_IPV6_N=
DISC_NODETYPE=3Dy=0ACONFIG_IPV6_TUNNEL=3Dm=0ACONFIG_IPV6_GRE=3Dm=0ACONFIG_I=
PV6_FOU=3Dm=0ACONFIG_IPV6_FOU_TUNNEL=3Dm=0ACONFIG_IPV6_MULTIPLE_TABLES=3Dy=
=0ACONFIG_IPV6_SUBTREES=3Dy=0ACONFIG_IPV6_MROUTE=3Dy=0ACONFIG_IPV6_MROUTE_M=
ULTIPLE_TABLES=3Dy=0ACONFIG_IPV6_PIMSM_V2=3Dy=0ACONFIG_IPV6_SEG6_LWTUNNEL=
=3Dy=0ACONFIG_IPV6_SEG6_HMAC=3Dy=0ACONFIG_IPV6_SEG6_BPF=3Dy=0ACONFIG_IPV6_R=
PL_LWTUNNEL=3Dy=0A# CONFIG_IPV6_IOAM6_LWTUNNEL is not set=0ACONFIG_NETLABEL=
=3Dy=0ACONFIG_MPTCP=3Dy=0ACONFIG_INET_MPTCP_DIAG=3Dm=0ACONFIG_MPTCP_IPV6=3D=
y=0ACONFIG_NETWORK_SECMARK=3Dy=0ACONFIG_NET_PTP_CLASSIFY=3Dy=0A# CONFIG_NET=
WORK_PHY_TIMESTAMPING is not set=0ACONFIG_NETFILTER=3Dy=0ACONFIG_NETFILTER_=
ADVANCED=3Dy=0ACONFIG_BRIDGE_NETFILTER=3Dm=0A=0A#=0A# Core Netfilter Config=
uration=0A#=0ACONFIG_NETFILTER_INGRESS=3Dy=0ACONFIG_NETFILTER_EGRESS=3Dy=0A=
CONFIG_NETFILTER_SKIP_EGRESS=3Dy=0ACONFIG_NETFILTER_NETLINK=3Dm=0ACONFIG_NE=
TFILTER_FAMILY_BRIDGE=3Dy=0ACONFIG_NETFILTER_FAMILY_ARP=3Dy=0ACONFIG_NETFIL=
TER_BPF_LINK=3Dy=0ACONFIG_NETFILTER_NETLINK_HOOK=3Dm=0ACONFIG_NETFILTER_NET=
LINK_ACCT=3Dm=0ACONFIG_NETFILTER_NETLINK_QUEUE=3Dm=0ACONFIG_NETFILTER_NETLI=
NK_LOG=3Dm=0ACONFIG_NETFILTER_NETLINK_OSF=3Dm=0ACONFIG_NF_CONNTRACK=3Dm=0AC=
ONFIG_NF_LOG_SYSLOG=3Dm=0ACONFIG_NETFILTER_CONNCOUNT=3Dm=0ACONFIG_NF_CONNTR=
ACK_MARK=3Dy=0ACONFIG_NF_CONNTRACK_SECMARK=3Dy=0ACONFIG_NF_CONNTRACK_ZONES=
=3Dy=0ACONFIG_NF_CONNTRACK_PROCFS=3Dy=0ACONFIG_NF_CONNTRACK_EVENTS=3Dy=0ACO=
NFIG_NF_CONNTRACK_TIMEOUT=3Dy=0ACONFIG_NF_CONNTRACK_TIMESTAMP=3Dy=0ACONFIG_=
NF_CONNTRACK_LABELS=3Dy=0ACONFIG_NF_CONNTRACK_OVS=3Dy=0ACONFIG_NF_CT_PROTO_=
GRE=3Dy=0ACONFIG_NF_CT_PROTO_SCTP=3Dy=0ACONFIG_NF_CT_PROTO_UDPLITE=3Dy=0ACO=
NFIG_NF_CONNTRACK_AMANDA=3Dm=0ACONFIG_NF_CONNTRACK_FTP=3Dm=0ACONFIG_NF_CONN=
TRACK_H323=3Dm=0ACONFIG_NF_CONNTRACK_IRC=3Dm=0ACONFIG_NF_CONNTRACK_BROADCAS=
T=3Dm=0ACONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm=0ACONFIG_NF_CONNTRACK_SNMP=3Dm=
=0ACONFIG_NF_CONNTRACK_PPTP=3Dm=0ACONFIG_NF_CONNTRACK_SANE=3Dm=0ACONFIG_NF_=
CONNTRACK_SIP=3Dm=0ACONFIG_NF_CONNTRACK_TFTP=3Dm=0ACONFIG_NF_CT_NETLINK=3Dm=
=0ACONFIG_NF_CT_NETLINK_TIMEOUT=3Dm=0ACONFIG_NF_CT_NETLINK_HELPER=3Dm=0ACON=
FIG_NETFILTER_NETLINK_GLUE_CT=3Dy=0ACONFIG_NF_NAT=3Dm=0ACONFIG_NF_NAT_AMAND=
A=3Dm=0ACONFIG_NF_NAT_FTP=3Dm=0ACONFIG_NF_NAT_IRC=3Dm=0ACONFIG_NF_NAT_SIP=
=3Dm=0ACONFIG_NF_NAT_TFTP=3Dm=0ACONFIG_NF_NAT_REDIRECT=3Dy=0ACONFIG_NF_NAT_=
MASQUERADE=3Dy=0ACONFIG_NF_NAT_OVS=3Dy=0ACONFIG_NETFILTER_SYNPROXY=3Dm=0ACO=
NFIG_NF_TABLES=3Dm=0ACONFIG_NF_TABLES_INET=3Dy=0ACONFIG_NF_TABLES_NETDEV=3D=
y=0ACONFIG_NFT_NUMGEN=3Dm=0ACONFIG_NFT_CT=3Dm=0A# CONFIG_NFT_EXTHDR_DCCP is=
 not set=0ACONFIG_NFT_FLOW_OFFLOAD=3Dm=0ACONFIG_NFT_CONNLIMIT=3Dm=0ACONFIG_=
NFT_LOG=3Dm=0ACONFIG_NFT_LIMIT=3Dm=0ACONFIG_NFT_MASQ=3Dm=0ACONFIG_NFT_REDIR=
=3Dm=0ACONFIG_NFT_NAT=3Dm=0ACONFIG_NFT_TUNNEL=3Dm=0ACONFIG_NFT_QUEUE=3Dm=0A=
CONFIG_NFT_QUOTA=3Dm=0ACONFIG_NFT_REJECT=3Dm=0ACONFIG_NFT_REJECT_INET=3Dm=
=0ACONFIG_NFT_COMPAT=3Dm=0ACONFIG_NFT_HASH=3Dm=0ACONFIG_NFT_FIB=3Dm=0ACONFI=
G_NFT_FIB_INET=3Dm=0ACONFIG_NFT_XFRM=3Dm=0ACONFIG_NFT_SOCKET=3Dm=0ACONFIG_N=
FT_OSF=3Dm=0ACONFIG_NFT_TPROXY=3Dm=0ACONFIG_NFT_SYNPROXY=3Dm=0ACONFIG_NF_DU=
P_NETDEV=3Dm=0ACONFIG_NFT_DUP_NETDEV=3Dm=0ACONFIG_NFT_FWD_NETDEV=3Dm=0ACONF=
IG_NFT_FIB_NETDEV=3Dm=0ACONFIG_NFT_REJECT_NETDEV=3Dm=0ACONFIG_NF_FLOW_TABLE=
_INET=3Dm=0ACONFIG_NF_FLOW_TABLE=3Dm=0ACONFIG_NF_FLOW_TABLE_PROCFS=3Dy=0ACO=
NFIG_NETFILTER_XTABLES=3Dm=0ACONFIG_NETFILTER_XTABLES_COMPAT=3Dy=0ACONFIG_N=
ETFILTER_XTABLES_LEGACY=3Dy=0A=0A#=0A# Xtables combined modules=0A#=0ACONFI=
G_NETFILTER_XT_MARK=3Dm=0ACONFIG_NETFILTER_XT_CONNMARK=3Dm=0ACONFIG_NETFILT=
ER_XT_SET=3Dm=0A=0A#=0A# Xtables targets=0A#=0ACONFIG_NETFILTER_XT_TARGET_A=
UDIT=3Dm=0ACONFIG_NETFILTER_XT_TARGET_CHECKSUM=3Dm=0ACONFIG_NETFILTER_XT_TA=
RGET_CLASSIFY=3Dm=0ACONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dm=0ACONFIG_NETFIL=
TER_XT_TARGET_CONNSECMARK=3Dm=0ACONFIG_NETFILTER_XT_TARGET_CT=3Dm=0ACONFIG_=
NETFILTER_XT_TARGET_DSCP=3Dm=0ACONFIG_NETFILTER_XT_TARGET_HL=3Dm=0ACONFIG_N=
ETFILTER_XT_TARGET_HMARK=3Dm=0ACONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dm=0AC=
ONFIG_NETFILTER_XT_TARGET_LED=3Dm=0ACONFIG_NETFILTER_XT_TARGET_LOG=3Dm=0ACO=
NFIG_NETFILTER_XT_TARGET_MARK=3Dm=0ACONFIG_NETFILTER_XT_NAT=3Dm=0ACONFIG_NE=
TFILTER_XT_TARGET_NETMAP=3Dm=0ACONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm=0ACONFI=
G_NETFILTER_XT_TARGET_NFQUEUE=3Dm=0ACONFIG_NETFILTER_XT_TARGET_NOTRACK=3Dm=
=0ACONFIG_NETFILTER_XT_TARGET_RATEEST=3Dm=0ACONFIG_NETFILTER_XT_TARGET_REDI=
RECT=3Dm=0ACONFIG_NETFILTER_XT_TARGET_MASQUERADE=3Dm=0ACONFIG_NETFILTER_XT_=
TARGET_TEE=3Dm=0ACONFIG_NETFILTER_XT_TARGET_TPROXY=3Dm=0ACONFIG_NETFILTER_X=
T_TARGET_TRACE=3Dm=0ACONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm=0ACONFIG_NETFIL=
TER_XT_TARGET_TCPMSS=3Dm=0ACONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=3Dm=0A=0A=
#=0A# Xtables matches=0A#=0ACONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm=0ACONFIG=
_NETFILTER_XT_MATCH_BPF=3Dm=0ACONFIG_NETFILTER_XT_MATCH_CGROUP=3Dm=0ACONFIG=
_NETFILTER_XT_MATCH_CLUSTER=3Dm=0ACONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm=0AC=
ONFIG_NETFILTER_XT_MATCH_CONNBYTES=3Dm=0ACONFIG_NETFILTER_XT_MATCH_CONNLABE=
L=3Dm=0ACONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dm=0ACONFIG_NETFILTER_XT_MATCH=
_CONNMARK=3Dm=0ACONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm=0ACONFIG_NETFILTER_=
XT_MATCH_CPU=3Dm=0ACONFIG_NETFILTER_XT_MATCH_DCCP=3Dm=0ACONFIG_NETFILTER_XT=
_MATCH_DEVGROUP=3Dm=0ACONFIG_NETFILTER_XT_MATCH_DSCP=3Dm=0ACONFIG_NETFILTER=
_XT_MATCH_ECN=3Dm=0ACONFIG_NETFILTER_XT_MATCH_ESP=3Dm=0ACONFIG_NETFILTER_XT=
_MATCH_HASHLIMIT=3Dm=0ACONFIG_NETFILTER_XT_MATCH_HELPER=3Dm=0ACONFIG_NETFIL=
TER_XT_MATCH_HL=3Dm=0ACONFIG_NETFILTER_XT_MATCH_IPCOMP=3Dm=0ACONFIG_NETFILT=
ER_XT_MATCH_IPRANGE=3Dm=0ACONFIG_NETFILTER_XT_MATCH_IPVS=3Dm=0ACONFIG_NETFI=
LTER_XT_MATCH_L2TP=3Dm=0ACONFIG_NETFILTER_XT_MATCH_LENGTH=3Dm=0ACONFIG_NETF=
ILTER_XT_MATCH_LIMIT=3Dm=0ACONFIG_NETFILTER_XT_MATCH_MAC=3Dm=0ACONFIG_NETFI=
LTER_XT_MATCH_MARK=3Dm=0ACONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm=0ACONFIG_N=
ETFILTER_XT_MATCH_NFACCT=3Dm=0ACONFIG_NETFILTER_XT_MATCH_OSF=3Dm=0ACONFIG_N=
ETFILTER_XT_MATCH_OWNER=3Dm=0ACONFIG_NETFILTER_XT_MATCH_POLICY=3Dm=0ACONFIG=
_NETFILTER_XT_MATCH_PHYSDEV=3Dm=0ACONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dm=0AC=
ONFIG_NETFILTER_XT_MATCH_QUOTA=3Dm=0ACONFIG_NETFILTER_XT_MATCH_RATEEST=3Dm=
=0ACONFIG_NETFILTER_XT_MATCH_REALM=3Dm=0ACONFIG_NETFILTER_XT_MATCH_RECENT=
=3Dm=0ACONFIG_NETFILTER_XT_MATCH_SCTP=3Dm=0ACONFIG_NETFILTER_XT_MATCH_SOCKE=
T=3Dm=0ACONFIG_NETFILTER_XT_MATCH_STATE=3Dm=0ACONFIG_NETFILTER_XT_MATCH_STA=
TISTIC=3Dm=0ACONFIG_NETFILTER_XT_MATCH_STRING=3Dm=0ACONFIG_NETFILTER_XT_MAT=
CH_TCPMSS=3Dm=0ACONFIG_NETFILTER_XT_MATCH_TIME=3Dm=0ACONFIG_NETFILTER_XT_MA=
TCH_U32=3Dm=0A# end of Core Netfilter Configuration=0A=0ACONFIG_IP_SET=3Dm=
=0ACONFIG_IP_SET_MAX=3D256=0ACONFIG_IP_SET_BITMAP_IP=3Dm=0ACONFIG_IP_SET_BI=
TMAP_IPMAC=3Dm=0ACONFIG_IP_SET_BITMAP_PORT=3Dm=0ACONFIG_IP_SET_HASH_IP=3Dm=
=0ACONFIG_IP_SET_HASH_IPMARK=3Dm=0ACONFIG_IP_SET_HASH_IPPORT=3Dm=0ACONFIG_I=
P_SET_HASH_IPPORTIP=3Dm=0ACONFIG_IP_SET_HASH_IPPORTNET=3Dm=0ACONFIG_IP_SET_=
HASH_IPMAC=3Dm=0ACONFIG_IP_SET_HASH_MAC=3Dm=0ACONFIG_IP_SET_HASH_NETPORTNET=
=3Dm=0ACONFIG_IP_SET_HASH_NET=3Dm=0ACONFIG_IP_SET_HASH_NETNET=3Dm=0ACONFIG_=
IP_SET_HASH_NETPORT=3Dm=0ACONFIG_IP_SET_HASH_NETIFACE=3Dm=0ACONFIG_IP_SET_L=
IST_SET=3Dm=0ACONFIG_IP_VS=3Dm=0ACONFIG_IP_VS_IPV6=3Dy=0A# CONFIG_IP_VS_DEB=
UG is not set=0ACONFIG_IP_VS_TAB_BITS=3D12=0A=0A#=0A# IPVS transport protoc=
ol load balancing support=0A#=0ACONFIG_IP_VS_PROTO_TCP=3Dy=0ACONFIG_IP_VS_P=
ROTO_UDP=3Dy=0ACONFIG_IP_VS_PROTO_AH_ESP=3Dy=0ACONFIG_IP_VS_PROTO_ESP=3Dy=
=0ACONFIG_IP_VS_PROTO_AH=3Dy=0ACONFIG_IP_VS_PROTO_SCTP=3Dy=0A=0A#=0A# IPVS =
scheduler=0A#=0ACONFIG_IP_VS_RR=3Dm=0ACONFIG_IP_VS_WRR=3Dm=0ACONFIG_IP_VS_L=
C=3Dm=0ACONFIG_IP_VS_WLC=3Dm=0ACONFIG_IP_VS_FO=3Dm=0ACONFIG_IP_VS_OVF=3Dm=
=0ACONFIG_IP_VS_LBLC=3Dm=0ACONFIG_IP_VS_LBLCR=3Dm=0ACONFIG_IP_VS_DH=3Dm=0AC=
ONFIG_IP_VS_SH=3Dm=0ACONFIG_IP_VS_MH=3Dm=0ACONFIG_IP_VS_SED=3Dm=0ACONFIG_IP=
_VS_NQ=3Dm=0ACONFIG_IP_VS_TWOS=3Dm=0A=0A#=0A# IPVS SH scheduler=0A#=0ACONFI=
G_IP_VS_SH_TAB_BITS=3D8=0A=0A#=0A# IPVS MH scheduler=0A#=0ACONFIG_IP_VS_MH_=
TAB_INDEX=3D12=0A=0A#=0A# IPVS application helper=0A#=0ACONFIG_IP_VS_FTP=3D=
m=0ACONFIG_IP_VS_NFCT=3Dy=0ACONFIG_IP_VS_PE_SIP=3Dm=0A=0A#=0A# IP: Netfilte=
r Configuration=0A#=0ACONFIG_NF_DEFRAG_IPV4=3Dm=0ACONFIG_IP_NF_IPTABLES_LEG=
ACY=3Dm=0ACONFIG_NF_SOCKET_IPV4=3Dm=0ACONFIG_NF_TPROXY_IPV4=3Dm=0ACONFIG_NF=
_TABLES_IPV4=3Dy=0ACONFIG_NFT_REJECT_IPV4=3Dm=0ACONFIG_NFT_DUP_IPV4=3Dm=0AC=
ONFIG_NFT_FIB_IPV4=3Dm=0ACONFIG_NF_TABLES_ARP=3Dy=0ACONFIG_NF_DUP_IPV4=3Dm=
=0ACONFIG_NF_LOG_ARP=3Dm=0ACONFIG_NF_LOG_IPV4=3Dm=0ACONFIG_NF_REJECT_IPV4=
=3Dm=0ACONFIG_NF_NAT_SNMP_BASIC=3Dm=0ACONFIG_NF_NAT_PPTP=3Dm=0ACONFIG_NF_NA=
T_H323=3Dm=0ACONFIG_IP_NF_IPTABLES=3Dm=0ACONFIG_IP_NF_MATCH_AH=3Dm=0ACONFIG=
_IP_NF_MATCH_ECN=3Dm=0ACONFIG_IP_NF_MATCH_RPFILTER=3Dm=0ACONFIG_IP_NF_MATCH=
_TTL=3Dm=0ACONFIG_IP_NF_FILTER=3Dm=0ACONFIG_IP_NF_TARGET_REJECT=3Dm=0ACONFI=
G_IP_NF_TARGET_SYNPROXY=3Dm=0ACONFIG_IP_NF_NAT=3Dm=0ACONFIG_IP_NF_TARGET_MA=
SQUERADE=3Dm=0ACONFIG_IP_NF_TARGET_NETMAP=3Dm=0ACONFIG_IP_NF_TARGET_REDIREC=
T=3Dm=0ACONFIG_IP_NF_MANGLE=3Dm=0ACONFIG_IP_NF_TARGET_ECN=3Dm=0ACONFIG_IP_N=
F_TARGET_TTL=3Dm=0ACONFIG_IP_NF_RAW=3Dm=0ACONFIG_IP_NF_SECURITY=3Dm=0ACONFI=
G_IP_NF_ARPTABLES=3Dm=0ACONFIG_NFT_COMPAT_ARP=3Dm=0ACONFIG_IP_NF_ARPFILTER=
=3Dm=0ACONFIG_IP_NF_ARP_MANGLE=3Dm=0A# end of IP: Netfilter Configuration=
=0A=0A#=0A# IPv6: Netfilter Configuration=0A#=0ACONFIG_IP6_NF_IPTABLES_LEGA=
CY=3Dm=0ACONFIG_NF_SOCKET_IPV6=3Dm=0ACONFIG_NF_TPROXY_IPV6=3Dm=0ACONFIG_NF_=
TABLES_IPV6=3Dy=0ACONFIG_NFT_REJECT_IPV6=3Dm=0ACONFIG_NFT_DUP_IPV6=3Dm=0ACO=
NFIG_NFT_FIB_IPV6=3Dm=0ACONFIG_NF_DUP_IPV6=3Dm=0ACONFIG_NF_REJECT_IPV6=3Dm=
=0ACONFIG_NF_LOG_IPV6=3Dm=0ACONFIG_IP6_NF_IPTABLES=3Dm=0ACONFIG_IP6_NF_MATC=
H_AH=3Dm=0ACONFIG_IP6_NF_MATCH_EUI64=3Dm=0ACONFIG_IP6_NF_MATCH_FRAG=3Dm=0AC=
ONFIG_IP6_NF_MATCH_OPTS=3Dm=0ACONFIG_IP6_NF_MATCH_HL=3Dm=0ACONFIG_IP6_NF_MA=
TCH_IPV6HEADER=3Dm=0ACONFIG_IP6_NF_MATCH_MH=3Dm=0ACONFIG_IP6_NF_MATCH_RPFIL=
TER=3Dm=0ACONFIG_IP6_NF_MATCH_RT=3Dm=0ACONFIG_IP6_NF_MATCH_SRH=3Dm=0ACONFIG=
_IP6_NF_TARGET_HL=3Dm=0ACONFIG_IP6_NF_FILTER=3Dm=0ACONFIG_IP6_NF_TARGET_REJ=
ECT=3Dm=0ACONFIG_IP6_NF_TARGET_SYNPROXY=3Dm=0ACONFIG_IP6_NF_MANGLE=3Dm=0ACO=
NFIG_IP6_NF_RAW=3Dm=0ACONFIG_IP6_NF_SECURITY=3Dm=0ACONFIG_IP6_NF_NAT=3Dm=0A=
CONFIG_IP6_NF_TARGET_MASQUERADE=3Dm=0ACONFIG_IP6_NF_TARGET_NPT=3Dm=0A# end =
of IPv6: Netfilter Configuration=0A=0ACONFIG_NF_DEFRAG_IPV6=3Dm=0ACONFIG_NF=
_TABLES_BRIDGE=3Dm=0ACONFIG_NFT_BRIDGE_META=3Dm=0ACONFIG_NFT_BRIDGE_REJECT=
=3Dm=0ACONFIG_NF_CONNTRACK_BRIDGE=3Dm=0ACONFIG_BRIDGE_NF_EBTABLES_LEGACY=3D=
m=0ACONFIG_BRIDGE_NF_EBTABLES=3Dm=0ACONFIG_BRIDGE_EBT_BROUTE=3Dm=0ACONFIG_B=
RIDGE_EBT_T_FILTER=3Dm=0ACONFIG_BRIDGE_EBT_T_NAT=3Dm=0ACONFIG_BRIDGE_EBT_80=
2_3=3Dm=0ACONFIG_BRIDGE_EBT_AMONG=3Dm=0ACONFIG_BRIDGE_EBT_ARP=3Dm=0ACONFIG_=
BRIDGE_EBT_IP=3Dm=0ACONFIG_BRIDGE_EBT_IP6=3Dm=0ACONFIG_BRIDGE_EBT_LIMIT=3Dm=
=0ACONFIG_BRIDGE_EBT_MARK=3Dm=0ACONFIG_BRIDGE_EBT_PKTTYPE=3Dm=0ACONFIG_BRID=
GE_EBT_STP=3Dm=0ACONFIG_BRIDGE_EBT_VLAN=3Dm=0ACONFIG_BRIDGE_EBT_ARPREPLY=3D=
m=0ACONFIG_BRIDGE_EBT_DNAT=3Dm=0ACONFIG_BRIDGE_EBT_MARK_T=3Dm=0ACONFIG_BRID=
GE_EBT_REDIRECT=3Dm=0ACONFIG_BRIDGE_EBT_SNAT=3Dm=0ACONFIG_BRIDGE_EBT_LOG=3D=
m=0ACONFIG_BRIDGE_EBT_NFLOG=3Dm=0ACONFIG_IP_SCTP=3Dm=0A# CONFIG_SCTP_DBG_OB=
JCNT is not set=0ACONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA256=3Dy=0A# CONFIG_SCT=
P_DEFAULT_COOKIE_HMAC_NONE is not set=0ACONFIG_INET_SCTP_DIAG=3Dm=0ACONFIG_=
RDS=3Dm=0ACONFIG_RDS_RDMA=3Dm=0ACONFIG_RDS_TCP=3Dm=0A# CONFIG_RDS_DEBUG is =
not set=0ACONFIG_TIPC=3Dm=0A# CONFIG_TIPC_MEDIA_IB is not set=0ACONFIG_TIPC=
_MEDIA_UDP=3Dy=0ACONFIG_TIPC_CRYPTO=3Dy=0ACONFIG_TIPC_DIAG=3Dm=0ACONFIG_ATM=
=3Dm=0ACONFIG_ATM_CLIP=3Dm=0A# CONFIG_ATM_CLIP_NO_ICMP is not set=0ACONFIG_=
ATM_LANE=3Dm=0ACONFIG_ATM_MPOA=3Dm=0ACONFIG_ATM_BR2684=3Dm=0A# CONFIG_ATM_B=
R2684_IPFILTER is not set=0ACONFIG_L2TP=3Dm=0ACONFIG_L2TP_DEBUGFS=3Dm=0ACON=
FIG_L2TP_V3=3Dy=0ACONFIG_L2TP_IP=3Dm=0ACONFIG_L2TP_ETH=3Dm=0ACONFIG_STP=3Dm=
=0ACONFIG_GARP=3Dm=0ACONFIG_MRP=3Dm=0ACONFIG_BRIDGE=3Dm=0ACONFIG_BRIDGE_IGM=
P_SNOOPING=3Dy=0ACONFIG_BRIDGE_VLAN_FILTERING=3Dy=0ACONFIG_BRIDGE_MRP=3Dy=
=0ACONFIG_BRIDGE_CFM=3Dy=0ACONFIG_NET_DSA=3Dm=0ACONFIG_NET_DSA_TAG_NONE=3Dm=
=0ACONFIG_NET_DSA_TAG_AR9331=3Dm=0ACONFIG_NET_DSA_TAG_BRCM_COMMON=3Dm=0ACON=
FIG_NET_DSA_TAG_BRCM=3Dm=0ACONFIG_NET_DSA_TAG_BRCM_LEGACY=3Dm=0ACONFIG_NET_=
DSA_TAG_BRCM_LEGACY_FCS=3Dm=0ACONFIG_NET_DSA_TAG_BRCM_PREPEND=3Dm=0ACONFIG_=
NET_DSA_TAG_HELLCREEK=3Dm=0ACONFIG_NET_DSA_TAG_GSWIP=3Dm=0ACONFIG_NET_DSA_T=
AG_DSA_COMMON=3Dm=0ACONFIG_NET_DSA_TAG_DSA=3Dm=0ACONFIG_NET_DSA_TAG_EDSA=3D=
m=0ACONFIG_NET_DSA_TAG_MTK=3Dm=0ACONFIG_NET_DSA_TAG_MXL_GSW1XX=3Dm=0ACONFIG=
_NET_DSA_TAG_KSZ=3Dm=0ACONFIG_NET_DSA_TAG_OCELOT=3Dm=0ACONFIG_NET_DSA_TAG_O=
CELOT_8021Q=3Dm=0ACONFIG_NET_DSA_TAG_QCA=3Dm=0ACONFIG_NET_DSA_TAG_RTL4_A=3D=
m=0ACONFIG_NET_DSA_TAG_RTL8_4=3Dm=0ACONFIG_NET_DSA_TAG_RZN1_A5PSW=3Dm=0ACON=
FIG_NET_DSA_TAG_LAN9303=3Dm=0ACONFIG_NET_DSA_TAG_SJA1105=3Dm=0ACONFIG_NET_D=
SA_TAG_TRAILER=3Dm=0ACONFIG_NET_DSA_TAG_VSC73XX_8021Q=3Dm=0ACONFIG_NET_DSA_=
TAG_XRS700X=3Dm=0ACONFIG_NET_DSA_TAG_YT921X=3Dm=0ACONFIG_VLAN_8021Q=3Dm=0AC=
ONFIG_VLAN_8021Q_GVRP=3Dy=0ACONFIG_VLAN_8021Q_MVRP=3Dy=0ACONFIG_LLC=3Dm=0AC=
ONFIG_LLC2=3Dm=0A# CONFIG_ATALK is not set=0ACONFIG_X25=3Dm=0ACONFIG_LAPB=
=3Dm=0ACONFIG_PHONET=3Dm=0ACONFIG_6LOWPAN=3Dm=0A# CONFIG_6LOWPAN_DEBUGFS is=
 not set=0ACONFIG_6LOWPAN_NHC=3Dm=0ACONFIG_6LOWPAN_NHC_DEST=3Dm=0ACONFIG_6L=
OWPAN_NHC_FRAGMENT=3Dm=0ACONFIG_6LOWPAN_NHC_HOP=3Dm=0ACONFIG_6LOWPAN_NHC_IP=
V6=3Dm=0ACONFIG_6LOWPAN_NHC_MOBILITY=3Dm=0ACONFIG_6LOWPAN_NHC_ROUTING=3Dm=
=0ACONFIG_6LOWPAN_NHC_UDP=3Dm=0ACONFIG_6LOWPAN_GHC_EXT_HDR_HOP=3Dm=0ACONFIG=
_6LOWPAN_GHC_UDP=3Dm=0ACONFIG_6LOWPAN_GHC_ICMPV6=3Dm=0ACONFIG_6LOWPAN_GHC_E=
XT_HDR_DEST=3Dm=0ACONFIG_6LOWPAN_GHC_EXT_HDR_FRAG=3Dm=0ACONFIG_6LOWPAN_GHC_=
EXT_HDR_ROUTE=3Dm=0ACONFIG_IEEE802154=3Dm=0A# CONFIG_IEEE802154_NL802154_EX=
PERIMENTAL is not set=0ACONFIG_IEEE802154_SOCKET=3Dm=0ACONFIG_IEEE802154_6L=
OWPAN=3Dm=0ACONFIG_MAC802154=3Dm=0ACONFIG_NET_SCHED=3Dy=0A=0A#=0A# Queueing=
/Scheduling=0A#=0ACONFIG_NET_SCH_HTB=3Dm=0ACONFIG_NET_SCH_HFSC=3Dm=0ACONFIG=
_NET_SCH_PRIO=3Dm=0ACONFIG_NET_SCH_MULTIQ=3Dm=0ACONFIG_NET_SCH_RED=3Dm=0ACO=
NFIG_NET_SCH_SFB=3Dm=0ACONFIG_NET_SCH_SFQ=3Dm=0ACONFIG_NET_SCH_TEQL=3Dm=0AC=
ONFIG_NET_SCH_TBF=3Dm=0ACONFIG_NET_SCH_CBS=3Dm=0ACONFIG_NET_SCH_ETF=3Dm=0AC=
ONFIG_NET_SCH_MQPRIO_LIB=3Dm=0ACONFIG_NET_SCH_TAPRIO=3Dm=0ACONFIG_NET_SCH_G=
RED=3Dm=0ACONFIG_NET_SCH_NETEM=3Dm=0ACONFIG_NET_SCH_DRR=3Dm=0ACONFIG_NET_SC=
H_MQPRIO=3Dm=0ACONFIG_NET_SCH_SKBPRIO=3Dm=0ACONFIG_NET_SCH_CHOKE=3Dm=0ACONF=
IG_NET_SCH_QFQ=3Dm=0ACONFIG_NET_SCH_CODEL=3Dm=0ACONFIG_NET_SCH_FQ_CODEL=3Dm=
=0ACONFIG_NET_SCH_CAKE=3Dm=0ACONFIG_NET_SCH_FQ=3Dm=0ACONFIG_NET_SCH_HHF=3Dm=
=0ACONFIG_NET_SCH_PIE=3Dm=0ACONFIG_NET_SCH_FQ_PIE=3Dm=0ACONFIG_NET_SCH_INGR=
ESS=3Dm=0ACONFIG_NET_SCH_PLUG=3Dm=0ACONFIG_NET_SCH_ETS=3Dm=0ACONFIG_NET_SCH=
_BPF=3Dy=0ACONFIG_NET_SCH_DUALPI2=3Dm=0A# CONFIG_NET_SCH_DEFAULT is not set=
=0A=0A#=0A# Classification=0A#=0ACONFIG_NET_CLS=3Dy=0ACONFIG_NET_CLS_BASIC=
=3Dm=0ACONFIG_NET_CLS_ROUTE4=3Dm=0ACONFIG_NET_CLS_FW=3Dm=0ACONFIG_NET_CLS_U=
32=3Dm=0ACONFIG_CLS_U32_PERF=3Dy=0ACONFIG_CLS_U32_MARK=3Dy=0ACONFIG_NET_CLS=
_FLOW=3Dm=0ACONFIG_NET_CLS_CGROUP=3Dm=0ACONFIG_NET_CLS_BPF=3Dm=0ACONFIG_NET=
_CLS_FLOWER=3Dm=0ACONFIG_NET_CLS_MATCHALL=3Dm=0ACONFIG_NET_EMATCH=3Dy=0ACON=
FIG_NET_EMATCH_STACK=3D32=0ACONFIG_NET_EMATCH_CMP=3Dm=0ACONFIG_NET_EMATCH_N=
BYTE=3Dm=0ACONFIG_NET_EMATCH_U32=3Dm=0ACONFIG_NET_EMATCH_META=3Dm=0ACONFIG_=
NET_EMATCH_TEXT=3Dm=0ACONFIG_NET_EMATCH_CANID=3Dm=0ACONFIG_NET_EMATCH_IPSET=
=3Dm=0ACONFIG_NET_EMATCH_IPT=3Dm=0ACONFIG_NET_CLS_ACT=3Dy=0ACONFIG_NET_ACT_=
POLICE=3Dm=0ACONFIG_NET_ACT_GACT=3Dm=0ACONFIG_GACT_PROB=3Dy=0ACONFIG_NET_AC=
T_MIRRED=3Dm=0ACONFIG_NET_ACT_SAMPLE=3Dm=0ACONFIG_NET_ACT_NAT=3Dm=0ACONFIG_=
NET_ACT_PEDIT=3Dm=0ACONFIG_NET_ACT_SIMP=3Dm=0ACONFIG_NET_ACT_SKBEDIT=3Dm=0A=
CONFIG_NET_ACT_CSUM=3Dm=0ACONFIG_NET_ACT_MPLS=3Dm=0ACONFIG_NET_ACT_VLAN=3Dm=
=0ACONFIG_NET_ACT_BPF=3Dm=0ACONFIG_NET_ACT_CONNMARK=3Dm=0ACONFIG_NET_ACT_CT=
INFO=3Dm=0ACONFIG_NET_ACT_SKBMOD=3Dm=0ACONFIG_NET_ACT_IFE=3Dm=0ACONFIG_NET_=
ACT_TUNNEL_KEY=3Dm=0ACONFIG_NET_ACT_CT=3Dm=0ACONFIG_NET_ACT_GATE=3Dm=0ACONF=
IG_NET_IFE_SKBMARK=3Dm=0ACONFIG_NET_IFE_SKBPRIO=3Dm=0ACONFIG_NET_IFE_SKBTCI=
NDEX=3Dm=0ACONFIG_NET_TC_SKB_EXT=3Dy=0ACONFIG_NET_SCH_FIFO=3Dy=0ACONFIG_DCB=
=3Dy=0ACONFIG_DNS_RESOLVER=3Dm=0ACONFIG_BATMAN_ADV=3Dm=0ACONFIG_BATMAN_ADV_=
BATMAN_V=3Dy=0ACONFIG_BATMAN_ADV_BLA=3Dy=0ACONFIG_BATMAN_ADV_DAT=3Dy=0ACONF=
IG_BATMAN_ADV_MCAST=3Dy=0ACONFIG_BATMAN_ADV_DEBUG=3Dy=0A# CONFIG_BATMAN_ADV=
_TRACING is not set=0ACONFIG_OPENVSWITCH=3Dm=0ACONFIG_OPENVSWITCH_GRE=3Dm=
=0ACONFIG_OPENVSWITCH_VXLAN=3Dm=0ACONFIG_OPENVSWITCH_GENEVE=3Dm=0ACONFIG_VS=
OCKETS=3Dm=0ACONFIG_VSOCKETS_DIAG=3Dm=0ACONFIG_VSOCKETS_LOOPBACK=3Dm=0ACONF=
IG_VMWARE_VMCI_VSOCKETS=3Dm=0ACONFIG_VIRTIO_VSOCKETS=3Dm=0ACONFIG_VIRTIO_VS=
OCKETS_COMMON=3Dm=0ACONFIG_HYPERV_VSOCKETS=3Dm=0ACONFIG_NETLINK_DIAG=3Dm=0A=
CONFIG_MPLS=3Dy=0ACONFIG_NET_MPLS_GSO=3Dm=0ACONFIG_MPLS_ROUTING=3Dm=0ACONFI=
G_MPLS_IPTUNNEL=3Dm=0ACONFIG_NET_NSH=3Dm=0ACONFIG_HSR=3Dm=0ACONFIG_NET_SWIT=
CHDEV=3Dy=0ACONFIG_NET_L3_MASTER_DEV=3Dy=0ACONFIG_QRTR=3Dm=0ACONFIG_QRTR_SM=
D=3Dm=0ACONFIG_QRTR_TUN=3Dm=0ACONFIG_QRTR_MHI=3Dm=0ACONFIG_NET_NCSI=3Dy=0AC=
ONFIG_NCSI_OEM_CMD_GET_MAC=3Dy=0ACONFIG_NCSI_OEM_CMD_KEEP_PHY=3Dy=0ACONFIG_=
PCPU_DEV_REFCNT=3Dy=0ACONFIG_MAX_SKB_FRAGS=3D17=0ACONFIG_RPS=3Dy=0ACONFIG_R=
FS_ACCEL=3Dy=0ACONFIG_SOCK_RX_QUEUE_MAPPING=3Dy=0ACONFIG_XPS=3Dy=0A# CONFIG=
_CGROUP_NET_PRIO is not set=0ACONFIG_CGROUP_NET_CLASSID=3Dy=0ACONFIG_NET_RX=
_BUSY_POLL=3Dy=0ACONFIG_BQL=3Dy=0ACONFIG_BPF_STREAM_PARSER=3Dy=0ACONFIG_NET=
_FLOW_LIMIT=3Dy=0A=0A#=0A# Network testing=0A#=0ACONFIG_NET_PKTGEN=3Dm=0ACO=
NFIG_NET_DROP_MONITOR=3Dy=0A# end of Network testing=0A# end of Networking =
options=0A=0ACONFIG_HAMRADIO=3Dy=0A=0A#=0A# Packet Radio protocols=0A#=0ACO=
NFIG_AX25=3Dm=0ACONFIG_AX25_DAMA_SLAVE=3Dy=0ACONFIG_NETROM=3Dm=0ACONFIG_ROS=
E=3Dm=0A=0A#=0A# AX.25 network device drivers=0A#=0ACONFIG_MKISS=3Dm=0ACONF=
IG_6PACK=3Dm=0ACONFIG_BPQETHER=3Dm=0ACONFIG_BAYCOM_SER_FDX=3Dm=0ACONFIG_BAY=
COM_SER_HDX=3Dm=0ACONFIG_BAYCOM_PAR=3Dm=0ACONFIG_YAM=3Dm=0A# end of AX.25 n=
etwork device drivers=0A=0ACONFIG_CAN=3Dm=0ACONFIG_CAN_RAW=3Dm=0ACONFIG_CAN=
_BCM=3Dm=0ACONFIG_CAN_GW=3Dm=0ACONFIG_CAN_J1939=3Dm=0ACONFIG_CAN_ISOTP=3Dm=
=0ACONFIG_BT=3Dm=0ACONFIG_BT_BREDR=3Dy=0ACONFIG_BT_RFCOMM=3Dm=0ACONFIG_BT_R=
FCOMM_TTY=3Dy=0ACONFIG_BT_BNEP=3Dm=0ACONFIG_BT_BNEP_MC_FILTER=3Dy=0ACONFIG_=
BT_BNEP_PROTO_FILTER=3Dy=0ACONFIG_BT_HIDP=3Dm=0ACONFIG_BT_LE=3Dy=0ACONFIG_B=
T_LE_L2CAP_ECRED=3Dy=0ACONFIG_BT_6LOWPAN=3Dm=0ACONFIG_BT_LEDS=3Dy=0ACONFIG_=
BT_MSFTEXT=3Dy=0ACONFIG_BT_AOSPEXT=3Dy=0A# CONFIG_BT_DEBUGFS is not set=0A#=
 CONFIG_BT_SELFTEST is not set=0A=0A#=0A# Bluetooth device drivers=0A#=0ACO=
NFIG_BT_INTEL=3Dm=0ACONFIG_BT_BCM=3Dm=0ACONFIG_BT_RTL=3Dm=0ACONFIG_BT_QCA=
=3Dm=0ACONFIG_BT_MTK=3Dm=0ACONFIG_BT_HCIBTUSB=3Dm=0ACONFIG_BT_HCIBTUSB_AUTO=
SUSPEND=3Dy=0ACONFIG_BT_HCIBTUSB_POLL_SYNC=3Dy=0ACONFIG_BT_HCIBTUSB_BCM=3Dy=
=0ACONFIG_BT_HCIBTUSB_MTK=3Dy=0ACONFIG_BT_HCIBTUSB_RTL=3Dy=0ACONFIG_BT_HCIB=
TSDIO=3Dm=0ACONFIG_BT_HCIUART=3Dm=0ACONFIG_BT_HCIUART_SERDEV=3Dy=0ACONFIG_B=
T_HCIUART_H4=3Dy=0ACONFIG_BT_HCIUART_NOKIA=3Dm=0ACONFIG_BT_HCIUART_BCSP=3Dy=
=0ACONFIG_BT_HCIUART_ATH3K=3Dy=0ACONFIG_BT_HCIUART_LL=3Dy=0ACONFIG_BT_HCIUA=
RT_3WIRE=3Dy=0ACONFIG_BT_HCIUART_INTEL=3Dy=0ACONFIG_BT_HCIUART_BCM=3Dy=0ACO=
NFIG_BT_HCIUART_RTL=3Dy=0ACONFIG_BT_HCIUART_QCA=3Dy=0ACONFIG_BT_HCIUART_AG6=
XX=3Dy=0ACONFIG_BT_HCIUART_MRVL=3Dy=0ACONFIG_BT_HCIUART_AML=3Dy=0ACONFIG_BT=
_HCIBCM203X=3Dm=0ACONFIG_BT_HCIBCM4377=3Dm=0ACONFIG_BT_HCIBPA10X=3Dm=0ACONF=
IG_BT_HCIBFUSB=3Dm=0A# CONFIG_BT_HCIDTL1 is not set=0A# CONFIG_BT_HCIBT3C i=
s not set=0ACONFIG_BT_HCIBLUECARD=3Dm=0ACONFIG_BT_HCIVHCI=3Dm=0ACONFIG_BT_M=
RVL=3Dm=0ACONFIG_BT_MRVL_SDIO=3Dm=0ACONFIG_BT_ATH3K=3Dm=0ACONFIG_BT_MTKSDIO=
=3Dm=0ACONFIG_BT_MTKUART=3Dm=0ACONFIG_BT_HCIRSI=3Dm=0ACONFIG_BT_VIRTIO=3Dm=
=0ACONFIG_BT_NXPUART=3Dm=0ACONFIG_BT_INTEL_PCIE=3Dm=0A# end of Bluetooth de=
vice drivers=0A=0ACONFIG_AF_RXRPC=3Dm=0ACONFIG_AF_RXRPC_IPV6=3Dy=0A# CONFIG=
_AF_RXRPC_INJECT_LOSS is not set=0A# CONFIG_AF_RXRPC_INJECT_RX_DELAY is not=
 set=0A# CONFIG_AF_RXRPC_DEBUG is not set=0ACONFIG_RXKAD=3Dy=0ACONFIG_RXGK=
=3Dy=0ACONFIG_RXPERF=3Dm=0ACONFIG_AF_KCM=3Dm=0ACONFIG_STREAM_PARSER=3Dy=0AC=
ONFIG_MCTP=3Dy=0ACONFIG_MCTP_FLOWS=3Dy=0ACONFIG_FIB_RULES=3Dy=0ACONFIG_WIRE=
LESS=3Dy=0ACONFIG_WIRELESS_EXT=3Dy=0ACONFIG_WEXT_CORE=3Dy=0ACONFIG_WEXT_PRO=
C=3Dy=0ACONFIG_WEXT_PRIV=3Dy=0ACONFIG_CFG80211=3Dm=0A# CONFIG_NL80211_TESTM=
ODE is not set=0A# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set=0A# CONFIG=
_CFG80211_CERTIFICATION_ONUS is not set=0ACONFIG_CFG80211_REQUIRE_SIGNED_RE=
GDB=3Dy=0ACONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy=0ACONFIG_CFG80211_DEFAU=
LT_PS=3Dy=0A# CONFIG_CFG80211_DEBUGFS is not set=0ACONFIG_CFG80211_CRDA_SUP=
PORT=3Dy=0ACONFIG_CFG80211_WEXT=3Dy=0ACONFIG_MAC80211=3Dm=0ACONFIG_MAC80211=
_HAS_RC=3Dy=0ACONFIG_MAC80211_RC_MINSTREL=3Dy=0ACONFIG_MAC80211_RC_DEFAULT_=
MINSTREL=3Dy=0ACONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"=0ACONFIG_MAC80211=
_MESH=3Dy=0ACONFIG_MAC80211_LEDS=3Dy=0A# CONFIG_MAC80211_MESSAGE_TRACING is=
 not set=0A# CONFIG_MAC80211_DEBUG_MENU is not set=0ACONFIG_MAC80211_STA_HA=
SH_MAX_SIZE=3D0=0ACONFIG_RFKILL=3Dm=0ACONFIG_RFKILL_LEDS=3Dy=0ACONFIG_RFKIL=
L_INPUT=3Dy=0ACONFIG_RFKILL_GPIO=3Dm=0ACONFIG_NET_9P=3Dm=0ACONFIG_NET_9P_FD=
=3Dm=0ACONFIG_NET_9P_VIRTIO=3Dm=0ACONFIG_NET_9P_XEN=3Dm=0A# CONFIG_NET_9P_U=
SBG is not set=0ACONFIG_NET_9P_RDMA=3Dm=0A# CONFIG_NET_9P_DEBUG is not set=
=0ACONFIG_CAIF=3Dm=0A# CONFIG_CAIF_DEBUG is not set=0ACONFIG_CAIF_NETDEV=3D=
m=0ACONFIG_CAIF_USB=3Dm=0ACONFIG_CEPH_LIB=3Dm=0ACONFIG_CEPH_LIB_PRETTYDEBUG=
=3Dy=0A# CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set=0ACONFIG_NFC=3Dm=0ACON=
FIG_NFC_DIGITAL=3Dm=0ACONFIG_NFC_NCI=3Dm=0A# CONFIG_NFC_NCI_SPI is not set=
=0ACONFIG_NFC_NCI_UART=3Dm=0ACONFIG_NFC_HCI=3Dm=0ACONFIG_NFC_SHDLC=3Dy=0A=
=0A#=0A# Near Field Communication (NFC) devices=0A#=0A# CONFIG_NFC_TRF7970A=
 is not set=0ACONFIG_NFC_MEI_PHY=3Dm=0ACONFIG_NFC_SIM=3Dm=0ACONFIG_NFC_PORT=
100=3Dm=0ACONFIG_NFC_VIRTUAL_NCI=3Dm=0ACONFIG_NFC_FDP=3Dm=0ACONFIG_NFC_FDP_=
I2C=3Dm=0ACONFIG_NFC_PN544=3Dm=0ACONFIG_NFC_PN544_I2C=3Dm=0ACONFIG_NFC_PN54=
4_MEI=3Dm=0ACONFIG_NFC_PN533=3Dm=0ACONFIG_NFC_PN533_USB=3Dm=0ACONFIG_NFC_PN=
533_I2C=3Dm=0ACONFIG_NFC_PN532_UART=3Dm=0ACONFIG_NFC_MICROREAD=3Dm=0ACONFIG=
_NFC_MICROREAD_I2C=3Dm=0ACONFIG_NFC_MICROREAD_MEI=3Dm=0ACONFIG_NFC_MRVL=3Dm=
=0ACONFIG_NFC_MRVL_USB=3Dm=0ACONFIG_NFC_MRVL_UART=3Dm=0ACONFIG_NFC_MRVL_I2C=
=3Dm=0ACONFIG_NFC_ST21NFCA=3Dm=0ACONFIG_NFC_ST21NFCA_I2C=3Dm=0ACONFIG_NFC_S=
T_NCI=3Dm=0ACONFIG_NFC_ST_NCI_I2C=3Dm=0ACONFIG_NFC_ST_NCI_SPI=3Dm=0ACONFIG_=
NFC_NXP_NCI=3Dm=0ACONFIG_NFC_NXP_NCI_I2C=3Dm=0ACONFIG_NFC_S3FWRN5=3Dm=0ACON=
FIG_NFC_S3FWRN5_I2C=3Dm=0ACONFIG_NFC_S3FWRN82_UART=3Dm=0ACONFIG_NFC_ST95HF=
=3Dm=0A# end of Near Field Communication (NFC) devices=0A=0ACONFIG_PSAMPLE=
=3Dm=0ACONFIG_NET_IFE=3Dm=0ACONFIG_LWTUNNEL=3Dy=0ACONFIG_LWTUNNEL_BPF=3Dy=
=0ACONFIG_DST_CACHE=3Dy=0ACONFIG_GRO_CELLS=3Dy=0ACONFIG_SOCK_VALIDATE_XMIT=
=3Dy=0ACONFIG_NET_IEEE8021Q_HELPERS=3Dy=0ACONFIG_NET_SELFTESTS=3Dm=0ACONFIG=
_NET_SOCK_MSG=3Dy=0ACONFIG_NET_DEVLINK=3Dy=0ACONFIG_PAGE_POOL=3Dy=0ACONFIG_=
PAGE_POOL_STATS=3Dy=0ACONFIG_FAILOVER=3Dm=0ACONFIG_ETHTOOL_NETLINK=3Dy=0A=
=0A#=0A# Device Drivers=0A#=0ACONFIG_HAVE_PCI=3Dy=0ACONFIG_GENERIC_PCI_IOMA=
P=3Dy=0ACONFIG_PCI=3Dy=0ACONFIG_PCI_DOMAINS=3Dy=0ACONFIG_PCIEPORTBUS=3Dy=0A=
CONFIG_HOTPLUG_PCI_PCIE=3Dy=0ACONFIG_PCIEAER=3Dy=0ACONFIG_PCIEAER_INJECT=3D=
m=0ACONFIG_PCIEAER_CXL=3Dy=0A# CONFIG_PCIE_ECRC is not set=0ACONFIG_PCIEASP=
M=3Dy=0ACONFIG_PCIEASPM_DEFAULT=3Dy=0A# CONFIG_PCIEASPM_POWERSAVE is not se=
t=0A# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set=0A# CONFIG_PCIEASPM_PERFOR=
MANCE is not set=0ACONFIG_PCIE_PME=3Dy=0ACONFIG_PCIE_DPC=3Dy=0ACONFIG_PCIE_=
PTM=3Dy=0ACONFIG_PCIE_EDR=3Dy=0ACONFIG_PCI_MSI=3Dy=0ACONFIG_PCI_QUIRKS=3Dy=
=0A# CONFIG_PCI_DEBUG is not set=0A# CONFIG_PCI_REALLOC_ENABLE_AUTO is not =
set=0ACONFIG_PCI_STUB=3Dy=0ACONFIG_PCI_PF_STUB=3Dm=0ACONFIG_XEN_PCIDEV_FRON=
TEND=3Dm=0ACONFIG_PCI_ATS=3Dy=0ACONFIG_PCI_IDE=3Dy=0ACONFIG_PCI_TSM=3Dy=0AC=
ONFIG_PCI_DOE=3Dy=0ACONFIG_PCI_LOCKLESS_CONFIG=3Dy=0ACONFIG_PCI_IOV=3Dy=0AC=
ONFIG_PCI_NPEM=3Dy=0ACONFIG_PCI_PRI=3Dy=0ACONFIG_PCI_PASID=3Dy=0ACONFIG_PCI=
E_TPH=3Dy=0ACONFIG_PCI_P2PDMA=3Dy=0ACONFIG_PCI_LABEL=3Dy=0ACONFIG_PCI_HYPER=
V=3Dm=0A# CONFIG_PCIE_BUS_TUNE_OFF is not set=0ACONFIG_PCIE_BUS_DEFAULT=3Dy=
=0A# CONFIG_PCIE_BUS_SAFE is not set=0A# CONFIG_PCIE_BUS_PERFORMANCE is not=
 set=0A# CONFIG_PCIE_BUS_PEER2PEER is not set=0ACONFIG_VGA_ARB=3Dy=0ACONFIG=
_VGA_ARB_MAX_GPUS=3D16=0ACONFIG_HOTPLUG_PCI=3Dy=0ACONFIG_HOTPLUG_PCI_ACPI=
=3Dy=0ACONFIG_HOTPLUG_PCI_ACPI_IBM=3Dm=0ACONFIG_HOTPLUG_PCI_CPCI=3Dy=0ACONF=
IG_HOTPLUG_PCI_CPCI_ZT5550=3Dm=0ACONFIG_HOTPLUG_PCI_CPCI_GENERIC=3Dm=0ACONF=
IG_HOTPLUG_PCI_OCTEONEP=3Dy=0ACONFIG_HOTPLUG_PCI_SHPC=3Dy=0A=0A#=0A# PCI co=
ntroller drivers=0A#=0ACONFIG_VMD=3Dm=0ACONFIG_PCI_HYPERV_INTERFACE=3Dm=0A=
=0A#=0A# Cadence-based PCIe controllers=0A#=0A# end of Cadence-based PCIe c=
ontrollers=0A=0A#=0A# DesignWare-based PCIe controllers=0A#=0A# CONFIG_PCI_=
MESON is not set=0A# CONFIG_PCIE_DW_PLAT_HOST is not set=0A# CONFIG_PCIE_DW=
_PLAT_EP is not set=0A# end of DesignWare-based PCIe controllers=0A=0A#=0A#=
 Mobiveil-based PCIe controllers=0A#=0A# end of Mobiveil-based PCIe control=
lers=0A=0A#=0A# PLDA-based PCIe controllers=0A#=0A# end of PLDA-based PCIe =
controllers=0A# end of PCI controller drivers=0A=0A#=0A# PCI Endpoint=0A#=
=0ACONFIG_PCI_ENDPOINT=3Dy=0A# CONFIG_PCI_ENDPOINT_CONFIGFS is not set=0ACO=
NFIG_PCI_ENDPOINT_MSI_DOORBELL=3Dy=0ACONFIG_PCI_EPF_TEST=3Dm=0ACONFIG_PCI_E=
PF_NTB=3Dm=0ACONFIG_PCI_EPF_VNTB=3Dm=0ACONFIG_PCI_EPF_MHI=3Dm=0A# end of PC=
I Endpoint=0A=0A#=0A# PCI switch controller drivers=0A#=0ACONFIG_PCI_SW_SWI=
TCHTEC=3Dm=0A# end of PCI switch controller drivers=0A=0ACONFIG_PCI_PWRCTRL=
=3Dm=0ACONFIG_PCI_PWRCTRL_SLOT=3Dm=0ACONFIG_PCI_PWRCTRL_TC9563=3Dm=0ACONFIG=
_CXL_BUS=3Dm=0ACONFIG_CXL_PCI=3Dm=0A# CONFIG_CXL_MEM_RAW_COMMANDS is not se=
t=0ACONFIG_CXL_ACPI=3Dm=0ACONFIG_CXL_PMEM=3Dm=0ACONFIG_CXL_MEM=3Dm=0ACONFIG=
_CXL_FEATURES=3Dy=0ACONFIG_CXL_EDAC_MEM_FEATURES=3Dy=0A# CONFIG_CXL_EDAC_SC=
RUB is not set=0A# CONFIG_CXL_EDAC_ECS is not set=0A# CONFIG_CXL_EDAC_MEM_R=
EPAIR is not set=0ACONFIG_CXL_PORT=3Dm=0ACONFIG_CXL_SUSPEND=3Dy=0ACONFIG_CX=
L_REGION=3Dy=0A# CONFIG_CXL_REGION_INVALIDATION_TEST is not set=0ACONFIG_CX=
L_MCE=3Dy=0ACONFIG_PCCARD=3Dm=0ACONFIG_PCMCIA=3Dm=0ACONFIG_PCMCIA_LOAD_CIS=
=3Dy=0ACONFIG_CARDBUS=3Dy=0A=0A#=0A# PC-card bridges=0A#=0ACONFIG_YENTA=3Dm=
=0ACONFIG_YENTA_O2=3Dy=0ACONFIG_YENTA_RICOH=3Dy=0ACONFIG_YENTA_TI=3Dy=0ACON=
FIG_YENTA_ENE_TUNE=3Dy=0ACONFIG_YENTA_TOSHIBA=3Dy=0A# CONFIG_PD6729 is not =
set=0A# CONFIG_I82092 is not set=0ACONFIG_PCCARD_NONSTATIC=3Dy=0ACONFIG_RAP=
IDIO=3Dm=0ACONFIG_RAPIDIO_TSI721=3Dm=0ACONFIG_RAPIDIO_DISC_TIMEOUT=3D30=0AC=
ONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=3Dy=0ACONFIG_RAPIDIO_DMA_ENGINE=3Dy=0ACONF=
IG_RAPIDIO_DEBUG=3Dy=0ACONFIG_RAPIDIO_ENUM_BASIC=3Dm=0ACONFIG_RAPIDIO_CHMAN=
=3Dm=0ACONFIG_RAPIDIO_MPORT_CDEV=3Dm=0A=0A#=0A# RapidIO Switch drivers=0A#=
=0ACONFIG_RAPIDIO_CPS_XX=3Dm=0ACONFIG_RAPIDIO_CPS_GEN2=3Dm=0ACONFIG_RAPIDIO=
_RXS_GEN3=3Dm=0A# end of RapidIO Switch drivers=0A=0ACONFIG_PC104=3Dy=0A=0A=
#=0A# Generic Driver Options=0A#=0ACONFIG_AUXILIARY_BUS=3Dy=0ACONFIG_UEVENT=
_HELPER=3Dy=0ACONFIG_UEVENT_HELPER_PATH=3D""=0ACONFIG_DEVTMPFS=3Dy=0ACONFIG=
_DEVTMPFS_MOUNT=3Dy=0A# CONFIG_DEVTMPFS_SAFE is not set=0A# CONFIG_STANDALO=
NE is not set=0ACONFIG_PREVENT_FIRMWARE_BUILD=3Dy=0A=0A#=0A# Firmware loade=
r=0A#=0ACONFIG_FW_LOADER=3Dy=0ACONFIG_FW_LOADER_DEBUG=3Dy=0ACONFIG_FW_LOADE=
R_PAGED_BUF=3Dy=0ACONFIG_FW_LOADER_SYSFS=3Dy=0ACONFIG_EXTRA_FIRMWARE=3D""=
=0ACONFIG_FW_LOADER_USER_HELPER=3Dy=0A# CONFIG_FW_LOADER_USER_HELPER_FALLBA=
CK is not set=0ACONFIG_FW_LOADER_COMPRESS=3Dy=0ACONFIG_FW_LOADER_COMPRESS_X=
Z=3Dy=0ACONFIG_FW_LOADER_COMPRESS_ZSTD=3Dy=0ACONFIG_FW_CACHE=3Dy=0ACONFIG_F=
W_UPLOAD=3Dy=0A# end of Firmware loader=0A=0ACONFIG_WANT_DEV_COREDUMP=3Dy=
=0ACONFIG_ALLOW_DEV_COREDUMP=3Dy=0ACONFIG_DEV_COREDUMP=3Dy=0A# CONFIG_DEBUG=
_DRIVER is not set=0A# CONFIG_DEBUG_DEVRES is not set=0A# CONFIG_DEBUG_TEST=
_DRIVER_REMOVE is not set=0ACONFIG_HMEM_REPORTING=3Dy=0A# CONFIG_TEST_ASYNC=
_DRIVER_PROBE is not set=0ACONFIG_SYS_HYPERVISOR=3Dy=0ACONFIG_GENERIC_CPU_D=
EVICES=3Dy=0ACONFIG_GENERIC_CPU_AUTOPROBE=3Dy=0ACONFIG_GENERIC_CPU_VULNERAB=
ILITIES=3Dy=0ACONFIG_SOC_BUS=3Dy=0ACONFIG_REGMAP=3Dy=0ACONFIG_REGMAP_I2C=3D=
y=0ACONFIG_REGMAP_SPI=3Dm=0ACONFIG_REGMAP_SPMI=3Dm=0ACONFIG_REGMAP_W1=3Dm=
=0ACONFIG_REGMAP_MMIO=3Dm=0ACONFIG_REGMAP_IRQ=3Dy=0ACONFIG_REGMAP_SOUNDWIRE=
=3Dm=0ACONFIG_REGMAP_SOUNDWIRE_MBQ=3Dm=0ACONFIG_REGMAP_SCCB=3Dm=0ACONFIG_RE=
GMAP_I3C=3Dm=0ACONFIG_DMA_SHARED_BUFFER=3Dy=0A# CONFIG_DMA_FENCE_TRACE is n=
ot set=0A# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set=0A# end of Gener=
ic Driver Options=0A=0A#=0A# Bus devices=0A#=0ACONFIG_MHI_BUS=3Dm=0ACONFIG_=
MHI_BUS_DEBUG=3Dy=0ACONFIG_MHI_BUS_PCI_GENERIC=3Dm=0ACONFIG_MHI_BUS_EP=3Dm=
=0A# end of Bus devices=0A=0ACONFIG_CONNECTOR=3Dy=0ACONFIG_PROC_EVENTS=3Dy=
=0A=0A#=0A# Firmware Drivers=0A#=0A=0A#=0A# ARM System Control and Manageme=
nt Interface Protocol=0A#=0A# end of ARM System Control and Management Inte=
rface Protocol=0A=0ACONFIG_EDD=3Dm=0A# CONFIG_EDD_OFF is not set=0ACONFIG_F=
IRMWARE_MEMMAP=3Dy=0ACONFIG_DMIID=3Dy=0ACONFIG_DMI_SYSFS=3Dm=0ACONFIG_DMI_S=
CAN_MACHINE_NON_EFI_FALLBACK=3Dy=0ACONFIG_ISCSI_IBFT_FIND=3Dy=0ACONFIG_ISCS=
I_IBFT=3Dm=0ACONFIG_FW_CFG_SYSFS=3Dm=0ACONFIG_FW_CFG_SYSFS_CMDLINE=3Dy=0ACO=
NFIG_SYSFB=3Dy=0A# CONFIG_SYSFB_SIMPLEFB is not set=0ACONFIG_FW_CS_DSP=3Dm=
=0A# CONFIG_GOOGLE_FIRMWARE is not set=0A=0A#=0A# EFI (Extensible Firmware =
Interface) Support=0A#=0ACONFIG_EFI_ESRT=3Dy=0ACONFIG_EFI_VARS_PSTORE=3Dm=
=0ACONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=3Dy=0ACONFIG_EFI_SOFT_RESERVE=3Dy=
=0ACONFIG_EFI_DXE_MEM_ATTRIBUTES=3Dy=0ACONFIG_EFI_RUNTIME_WRAPPERS=3Dy=0ACO=
NFIG_EFI_BOOTLOADER_CONTROL=3Dm=0ACONFIG_EFI_CAPSULE_LOADER=3Dm=0A# CONFIG_=
EFI_TEST is not set=0ACONFIG_EFI_DEV_PATH_PARSER=3Dy=0ACONFIG_APPLE_PROPERT=
IES=3Dy=0A# CONFIG_RESET_ATTACK_MITIGATION is not set=0ACONFIG_EFI_RCI2_TAB=
LE=3Dy=0A# CONFIG_EFI_DISABLE_PCI_DMA is not set=0ACONFIG_EFI_EARLYCON=3Dy=
=0ACONFIG_EFI_CUSTOM_SSDT_OVERLAYS=3Dy=0A# CONFIG_EFI_DISABLE_RUNTIME is no=
t set=0ACONFIG_EFI_COCO_SECRET=3Dy=0ACONFIG_OVMF_DEBUG_LOG=3Dy=0ACONFIG_UNA=
CCEPTED_MEMORY=3Dy=0ACONFIG_EFI_EMBEDDED_FIRMWARE=3Dy=0ACONFIG_EFI_SBAT_FIL=
E=3D""=0A# end of EFI (Extensible Firmware Interface) Support=0A=0ACONFIG_U=
EFI_CPER=3Dy=0ACONFIG_UEFI_CPER_X86=3Dy=0A=0A#=0A# Qualcomm firmware driver=
s=0A#=0A# end of Qualcomm firmware drivers=0A=0A#=0A# Tegra firmware driver=
=0A#=0A# end of Tegra firmware driver=0A# end of Firmware Drivers=0A=0ACONF=
IG_FWCTL=3Dm=0ACONFIG_FWCTL_MLX5=3Dm=0ACONFIG_FWCTL_PDS=3Dm=0ACONFIG_GNSS=
=3Dm=0ACONFIG_GNSS_SERIAL=3Dm=0ACONFIG_GNSS_MTK_SERIAL=3Dm=0ACONFIG_GNSS_SI=
RF_SERIAL=3Dm=0ACONFIG_GNSS_UBX_SERIAL=3Dm=0ACONFIG_GNSS_USB=3Dm=0ACONFIG_M=
TD=3Dm=0ACONFIG_MTD_TESTS=3Dm=0A=0A#=0A# Partition parsers=0A#=0A# CONFIG_M=
TD_CMDLINE_PARTS is not set=0ACONFIG_MTD_REDBOOT_PARTS=3Dm=0ACONFIG_MTD_RED=
BOOT_DIRECTORY_BLOCK=3D-1=0A# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not s=
et=0A# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set=0A# end of Partition pa=
rsers=0A=0A#=0A# User Modules And Translation Layers=0A#=0ACONFIG_MTD_BLKDE=
VS=3Dm=0ACONFIG_MTD_BLOCK=3Dm=0ACONFIG_MTD_BLOCK_RO=3Dm=0A=0A#=0A# Note tha=
t in some cases UBI block is preferred. See MTD_UBI_BLOCK.=0A#=0ACONFIG_FTL=
=3Dm=0ACONFIG_NFTL=3Dm=0ACONFIG_NFTL_RW=3Dy=0ACONFIG_INFTL=3Dm=0ACONFIG_RFD=
_FTL=3Dm=0ACONFIG_SSFDC=3Dm=0A# CONFIG_SM_FTL is not set=0ACONFIG_MTD_OOPS=
=3Dm=0ACONFIG_MTD_PSTORE=3Dm=0ACONFIG_MTD_SWAP=3Dm=0ACONFIG_MTD_PARTITIONED=
_MASTER=3Dy=0A=0A#=0A# RAM/ROM/Flash chip drivers=0A#=0ACONFIG_MTD_CFI=3Dm=
=0ACONFIG_MTD_JEDECPROBE=3Dm=0ACONFIG_MTD_GEN_PROBE=3Dm=0ACONFIG_MTD_CFI_AD=
V_OPTIONS=3Dy=0ACONFIG_MTD_CFI_NOSWAP=3Dy=0A# CONFIG_MTD_CFI_BE_BYTE_SWAP i=
s not set=0A# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set=0ACONFIG_MTD_CFI_GEOME=
TRY=3Dy=0ACONFIG_MTD_MAP_BANK_WIDTH_1=3Dy=0ACONFIG_MTD_MAP_BANK_WIDTH_2=3Dy=
=0ACONFIG_MTD_MAP_BANK_WIDTH_4=3Dy=0ACONFIG_MTD_MAP_BANK_WIDTH_8=3Dy=0ACONF=
IG_MTD_MAP_BANK_WIDTH_16=3Dy=0ACONFIG_MTD_MAP_BANK_WIDTH_32=3Dy=0ACONFIG_MT=
D_CFI_I1=3Dy=0ACONFIG_MTD_CFI_I2=3Dy=0ACONFIG_MTD_CFI_I4=3Dy=0ACONFIG_MTD_C=
FI_I8=3Dy=0ACONFIG_MTD_OTP=3Dy=0ACONFIG_MTD_CFI_INTELEXT=3Dm=0ACONFIG_MTD_C=
FI_AMDSTD=3Dm=0ACONFIG_MTD_CFI_STAA=3Dm=0ACONFIG_MTD_CFI_UTIL=3Dm=0ACONFIG_=
MTD_RAM=3Dm=0ACONFIG_MTD_ROM=3Dm=0ACONFIG_MTD_ABSENT=3Dm=0A# end of RAM/ROM=
/Flash chip drivers=0A=0A#=0A# Mapping drivers for chip access=0A#=0ACONFIG=
_MTD_COMPLEX_MAPPINGS=3Dy=0ACONFIG_MTD_PHYSMAP=3Dm=0ACONFIG_MTD_PHYSMAP_COM=
PAT=3Dy=0ACONFIG_MTD_PHYSMAP_START=3D0x8000000=0ACONFIG_MTD_PHYSMAP_LEN=3D0=
=0ACONFIG_MTD_PHYSMAP_BANKWIDTH=3D2=0ACONFIG_MTD_PHYSMAP_GPIO_ADDR=3Dy=0ACO=
NFIG_MTD_SBC_GXX=3Dm=0ACONFIG_MTD_AMD76XROM=3Dm=0ACONFIG_MTD_ICHXROM=3Dm=0A=
CONFIG_MTD_ESB2ROM=3Dm=0ACONFIG_MTD_CK804XROM=3Dm=0ACONFIG_MTD_SCB2_FLASH=
=3Dm=0ACONFIG_MTD_NETtel=3Dm=0ACONFIG_MTD_L440GX=3Dm=0ACONFIG_MTD_PCI=3Dm=
=0ACONFIG_MTD_PCMCIA=3Dm=0A# CONFIG_MTD_PCMCIA_ANONYMOUS is not set=0ACONFI=
G_MTD_PLATRAM=3Dm=0A# end of Mapping drivers for chip access=0A=0A#=0A# Sel=
f-contained MTD device drivers=0A#=0ACONFIG_MTD_PMC551=3Dm=0ACONFIG_MTD_PMC=
551_BUGFIX=3Dy=0A# CONFIG_MTD_PMC551_DEBUG is not set=0A# CONFIG_MTD_DATAFL=
ASH is not set=0A# CONFIG_MTD_MCHP23K256 is not set=0A# CONFIG_MTD_MCHP48L6=
40 is not set=0A# CONFIG_MTD_SST25L is not set=0ACONFIG_MTD_SLRAM=3Dm=0ACON=
FIG_MTD_PHRAM=3Dm=0ACONFIG_MTD_MTDRAM=3Dm=0ACONFIG_MTDRAM_TOTAL_SIZE=3D4096=
=0ACONFIG_MTDRAM_ERASE_SIZE=3D128=0ACONFIG_MTD_BLOCK2MTD=3Dm=0ACONFIG_MTD_I=
NTEL_DG=3Dm=0A=0A#=0A# Disk-On-Chip Device Drivers=0A#=0ACONFIG_MTD_DOCG3=
=3Dm=0ACONFIG_BCH_CONST_M=3D14=0ACONFIG_BCH_CONST_T=3D4=0A# end of Self-con=
tained MTD device drivers=0A=0A#=0A# NAND=0A#=0ACONFIG_MTD_NAND_CORE=3Dm=0A=
CONFIG_MTD_ONENAND=3Dm=0ACONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy=0ACONFIG_MTD_O=
NENAND_GENERIC=3Dm=0ACONFIG_MTD_ONENAND_OTP=3Dy=0ACONFIG_MTD_ONENAND_2X_PRO=
GRAM=3Dy=0ACONFIG_MTD_RAW_NAND=3Dm=0A=0A#=0A# Raw/parallel NAND flash contr=
ollers=0A#=0A# CONFIG_MTD_NAND_DENALI_PCI is not set=0A# CONFIG_MTD_NAND_OM=
AP_BCH_BUILD is not set=0ACONFIG_MTD_NAND_CAFE=3Dm=0ACONFIG_MTD_NAND_MXIC=
=3Dm=0ACONFIG_MTD_NAND_GPIO=3Dm=0ACONFIG_MTD_NAND_PLATFORM=3Dm=0ACONFIG_MTD=
_NAND_ARASAN=3Dm=0A=0A#=0A# Misc=0A#=0ACONFIG_MTD_SM_COMMON=3Dm=0ACONFIG_MT=
D_NAND_NANDSIM=3Dm=0ACONFIG_MTD_NAND_RICOH=3Dm=0ACONFIG_MTD_NAND_DISKONCHIP=
=3Dm=0ACONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=3Dy=0ACONFIG_MTD_NAND_DISK=
ONCHIP_PROBE_ADDRESS=3D0=0ACONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=3Dy=0ACONF=
IG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy=0ACONFIG_MTD_SPI_NAND=3Dm=0A=0A#=0A# EC=
C engine support=0A#=0ACONFIG_MTD_NAND_ECC=3Dy=0ACONFIG_MTD_NAND_ECC_SW_HAM=
MING=3Dy=0A# CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set=0ACONFIG_MTD_NAN=
D_ECC_SW_BCH=3Dy=0A# CONFIG_MTD_NAND_ECC_MXIC is not set=0A# end of ECC eng=
ine support=0A# end of NAND=0A=0A#=0A# LPDDR & LPDDR2 PCM memory drivers=0A=
#=0ACONFIG_MTD_LPDDR=3Dm=0ACONFIG_MTD_QINFO_PROBE=3Dm=0A# end of LPDDR & LP=
DDR2 PCM memory drivers=0A=0ACONFIG_MTD_SPI_NOR=3Dm=0ACONFIG_MTD_SPI_NOR_US=
E_4K_SECTORS=3Dy=0A# CONFIG_MTD_SPI_NOR_SWP_DISABLE is not set=0ACONFIG_MTD=
_SPI_NOR_SWP_DISABLE_ON_VOLATILE=3Dy=0A# CONFIG_MTD_SPI_NOR_SWP_KEEP is not=
 set=0ACONFIG_MTD_UBI=3Dm=0ACONFIG_MTD_UBI_WL_THRESHOLD=3D4096=0ACONFIG_MTD=
_UBI_BEB_LIMIT=3D20=0A# CONFIG_MTD_UBI_FASTMAP is not set=0ACONFIG_MTD_UBI_=
GLUEBI=3Dm=0A# CONFIG_MTD_UBI_BLOCK is not set=0A# CONFIG_MTD_UBI_FAULT_INJ=
ECTION is not set=0ACONFIG_MTD_UBI_NVMEM=3Dm=0ACONFIG_MTD_HYPERBUS=3Dm=0A# =
CONFIG_OF is not set=0ACONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy=0ACONFIG_PARPO=
RT=3Dm=0ACONFIG_PARPORT_PC=3Dm=0ACONFIG_PARPORT_SERIAL=3Dm=0ACONFIG_PARPORT=
_PC_FIFO=3Dy=0ACONFIG_PARPORT_PC_SUPERIO=3Dy=0A# CONFIG_PARPORT_PC_PCMCIA i=
s not set=0A# CONFIG_PARPORT_GSC is not set=0ACONFIG_PARPORT_1284=3Dy=0ACON=
FIG_PARPORT_NOT_PC=3Dy=0ACONFIG_PNP=3Dy=0A# CONFIG_PNP_DEBUG_MESSAGES is no=
t set=0A=0A#=0A# Protocols=0A#=0ACONFIG_PNPACPI=3Dy=0ACONFIG_BLK_DEV=3Dy=0A=
CONFIG_BLK_DEV_NULL_BLK=3Dm=0ACONFIG_BLK_DEV_FD=3Dm=0A# CONFIG_BLK_DEV_FD_R=
AWCMD is not set=0ACONFIG_CDROM=3Dm=0ACONFIG_BLK_DEV_PCIESSD_MTIP32XX=3Dm=
=0ACONFIG_ZRAM=3Dm=0ACONFIG_ZRAM_BACKEND_LZ4=3Dy=0ACONFIG_ZRAM_BACKEND_LZ4H=
C=3Dy=0ACONFIG_ZRAM_BACKEND_ZSTD=3Dy=0ACONFIG_ZRAM_BACKEND_DEFLATE=3Dy=0ACO=
NFIG_ZRAM_BACKEND_842=3Dy=0A# CONFIG_ZRAM_BACKEND_FORCE_LZO is not set=0ACO=
NFIG_ZRAM_BACKEND_LZO=3Dy=0ACONFIG_ZRAM_DEF_COMP_LZORLE=3Dy=0A# CONFIG_ZRAM=
_DEF_COMP_LZO is not set=0A# CONFIG_ZRAM_DEF_COMP_LZ4 is not set=0A# CONFIG=
_ZRAM_DEF_COMP_LZ4HC is not set=0A# CONFIG_ZRAM_DEF_COMP_ZSTD is not set=0A=
# CONFIG_ZRAM_DEF_COMP_DEFLATE is not set=0A# CONFIG_ZRAM_DEF_COMP_842 is n=
ot set=0ACONFIG_ZRAM_DEF_COMP=3D"lzo-rle"=0ACONFIG_ZRAM_WRITEBACK=3Dy=0A# C=
ONFIG_ZRAM_TRACK_ENTRY_ACTIME is not set=0A# CONFIG_ZRAM_MEMORY_TRACKING is=
 not set=0ACONFIG_ZRAM_MULTI_COMP=3Dy=0A# CONFIG_BLK_DEV_COW_COMMON is not =
set=0ACONFIG_BLK_DEV_LOOP=3Dm=0ACONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8=0ACONFIG_=
BLK_DEV_DRBD=3Dm=0A# CONFIG_DRBD_FAULT_INJECTION is not set=0ACONFIG_BLK_DE=
V_NBD=3Dm=0ACONFIG_BLK_DEV_RAM=3Dm=0ACONFIG_BLK_DEV_RAM_COUNT=3D16=0ACONFIG=
_BLK_DEV_RAM_SIZE=3D131072=0ACONFIG_ATA_OVER_ETH=3Dm=0ACONFIG_XEN_BLKDEV_FR=
ONTEND=3Dm=0ACONFIG_XEN_BLKDEV_BACKEND=3Dm=0ACONFIG_VIRTIO_BLK=3Dm=0ACONFIG=
_BLK_DEV_RBD=3Dm=0ACONFIG_BLK_DEV_UBLK=3Dm=0ACONFIG_BLKDEV_UBLK_LEGACY_OPCO=
DES=3Dy=0ACONFIG_BLK_DEV_RNBD=3Dy=0ACONFIG_BLK_DEV_RNBD_CLIENT=3Dm=0ACONFIG=
_BLK_DEV_RNBD_SERVER=3Dm=0ACONFIG_BLK_DEV_ZONED_LOOP=3Dm=0A=0A#=0A# NVME Su=
pport=0A#=0ACONFIG_NVME_KEYRING=3Dm=0ACONFIG_NVME_AUTH=3Dm=0ACONFIG_NVME_CO=
RE=3Dm=0ACONFIG_BLK_DEV_NVME=3Dm=0ACONFIG_NVME_MULTIPATH=3Dy=0A# CONFIG_NVM=
E_VERBOSE_ERRORS is not set=0ACONFIG_NVME_HWMON=3Dy=0ACONFIG_NVME_FABRICS=
=3Dm=0ACONFIG_NVME_RDMA=3Dm=0ACONFIG_NVME_FC=3Dm=0ACONFIG_NVME_TCP=3Dm=0ACO=
NFIG_NVME_TCP_TLS=3Dy=0ACONFIG_NVME_HOST_AUTH=3Dy=0ACONFIG_NVME_TARGET=3Dm=
=0A# CONFIG_NVME_TARGET_DEBUGFS is not set=0ACONFIG_NVME_TARGET_PASSTHRU=3D=
y=0ACONFIG_NVME_TARGET_LOOP=3Dm=0ACONFIG_NVME_TARGET_RDMA=3Dm=0ACONFIG_NVME=
_TARGET_FC=3Dm=0ACONFIG_NVME_TARGET_FCLOOP=3Dm=0ACONFIG_NVME_TARGET_TCP=3Dm=
=0ACONFIG_NVME_TARGET_TCP_TLS=3Dy=0ACONFIG_NVME_TARGET_AUTH=3Dy=0ACONFIG_NV=
ME_TARGET_PCI_EPF=3Dm=0A# end of NVME Support=0A=0A#=0A# Misc devices=0A#=
=0ACONFIG_SENSORS_LIS3LV02D=3Dm=0ACONFIG_AD525X_DPOT=3Dm=0ACONFIG_AD525X_DP=
OT_I2C=3Dm=0A# CONFIG_AD525X_DPOT_SPI is not set=0ACONFIG_DUMMY_IRQ=3Dm=0AC=
ONFIG_IBM_ASM=3Dm=0ACONFIG_PHANTOM=3Dm=0ACONFIG_RPMB=3Dm=0ACONFIG_TI_FPC202=
=3Dm=0ACONFIG_TIFM_CORE=3Dm=0ACONFIG_TIFM_7XX1=3Dm=0ACONFIG_ICS932S401=3Dm=
=0ACONFIG_ENCLOSURE_SERVICES=3Dm=0ACONFIG_SGI_XP=3Dm=0ACONFIG_HP_ILO=3Dm=0A=
CONFIG_SGI_GRU=3Dm=0A# CONFIG_SGI_GRU_DEBUG is not set=0A# CONFIG_APDS9802A=
LS is not set=0A# CONFIG_ISL29003 is not set=0ACONFIG_ISL29020=3Dm=0ACONFIG=
_SENSORS_TSL2550=3Dm=0ACONFIG_SENSORS_BH1770=3Dm=0ACONFIG_SENSORS_APDS990X=
=3Dm=0ACONFIG_HMC6352=3Dm=0ACONFIG_DS1682=3Dm=0ACONFIG_VMWARE_BALLOON=3Dm=
=0A# CONFIG_LATTICE_ECP3_CONFIG is not set=0A# CONFIG_SRAM is not set=0ACON=
FIG_DW_XDATA_PCIE=3Dm=0ACONFIG_PCI_ENDPOINT_TEST=3Dm=0A# CONFIG_XILINX_SDFE=
C is not set=0ACONFIG_MISC_RTSX=3Dm=0ACONFIG_NTSYNC=3Dm=0ACONFIG_TPS6594_ES=
M=3Dm=0ACONFIG_TPS6594_PFSM=3Dm=0ACONFIG_NSM=3Dm=0ACONFIG_C2PORT=3Dm=0ACONF=
IG_C2PORT_DURAMAR_2150=3Dm=0A=0A#=0A# EEPROM support=0A#=0ACONFIG_EEPROM_AT=
24=3Dm=0A# CONFIG_EEPROM_AT25 is not set=0ACONFIG_EEPROM_MAX6875=3Dm=0ACONF=
IG_EEPROM_93CX6=3Dy=0A# CONFIG_EEPROM_93XX46 is not set=0ACONFIG_EEPROM_IDT=
_89HPESX=3Dm=0ACONFIG_EEPROM_EE1004=3Dm=0ACONFIG_EEPROM_M24LR=3Dm=0A# end o=
f EEPROM support=0A=0ACONFIG_CB710_CORE=3Dm=0A# CONFIG_CB710_DEBUG is not s=
et=0ACONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy=0ACONFIG_SENSORS_LIS3_I2C=3Dm=0ACON=
FIG_ALTERA_STAPL=3Dm=0ACONFIG_INTEL_MEI=3Dm=0ACONFIG_INTEL_MEI_ME=3Dm=0ACON=
FIG_INTEL_MEI_TXE=3Dm=0ACONFIG_INTEL_MEI_GSC=3Dm=0ACONFIG_INTEL_MEI_VSC_HW=
=3Dm=0ACONFIG_INTEL_MEI_VSC=3Dm=0ACONFIG_INTEL_MEI_LB=3Dm=0ACONFIG_INTEL_ME=
I_HDCP=3Dm=0ACONFIG_INTEL_MEI_PXP=3Dm=0ACONFIG_INTEL_MEI_GSC_PROXY=3Dm=0ACO=
NFIG_VMWARE_VMCI=3Dm=0ACONFIG_GENWQE=3Dm=0ACONFIG_GENWQE_PLATFORM_ERROR_REC=
OVERY=3D0=0ACONFIG_BCM_VK=3Dm=0ACONFIG_BCM_VK_TTY=3Dy=0ACONFIG_MISC_ALCOR_P=
CI=3Dm=0ACONFIG_MISC_RTSX_PCI=3Dm=0ACONFIG_MISC_RTSX_USB=3Dm=0ACONFIG_UACCE=
=3Dm=0ACONFIG_PVPANIC=3Dy=0ACONFIG_PVPANIC_MMIO=3Dm=0ACONFIG_PVPANIC_PCI=3D=
m=0ACONFIG_GP_PCI1XXXX=3Dm=0ACONFIG_KEBA_CP500=3Dm=0ACONFIG_KEBA_LAN9252=3D=
m=0A# end of Misc devices=0A=0A#=0A# SCSI device support=0A#=0ACONFIG_SCSI_=
MOD=3Dm=0ACONFIG_RAID_ATTRS=3Dm=0ACONFIG_SCSI_COMMON=3Dm=0ACONFIG_SCSI=3Dm=
=0ACONFIG_SCSI_DMA=3Dy=0ACONFIG_SCSI_NETLINK=3Dy=0ACONFIG_SCSI_PROC_FS=3Dy=
=0A=0A#=0A# SCSI support type (disk, tape, CD-ROM)=0A#=0ACONFIG_BLK_DEV_SD=
=3Dm=0ACONFIG_CHR_DEV_ST=3Dm=0ACONFIG_BLK_DEV_SR=3Dm=0ACONFIG_CHR_DEV_SG=3D=
m=0ACONFIG_BLK_DEV_BSG=3Dy=0ACONFIG_CHR_DEV_SCH=3Dm=0ACONFIG_SCSI_ENCLOSURE=
=3Dm=0ACONFIG_SCSI_CONSTANTS=3Dy=0ACONFIG_SCSI_LOGGING=3Dy=0ACONFIG_SCSI_SC=
AN_ASYNC=3Dy=0A=0A#=0A# SCSI Transports=0A#=0ACONFIG_SCSI_SPI_ATTRS=3Dm=0AC=
ONFIG_SCSI_FC_ATTRS=3Dm=0ACONFIG_SCSI_ISCSI_ATTRS=3Dm=0ACONFIG_SCSI_SAS_ATT=
RS=3Dm=0ACONFIG_SCSI_SAS_LIBSAS=3Dm=0ACONFIG_SCSI_SAS_ATA=3Dy=0ACONFIG_SCSI=
_SAS_HOST_SMP=3Dy=0ACONFIG_SCSI_SRP_ATTRS=3Dm=0A# end of SCSI Transports=0A=
=0ACONFIG_SCSI_LOWLEVEL=3Dy=0ACONFIG_ISCSI_TCP=3Dm=0ACONFIG_ISCSI_BOOT_SYSF=
S=3Dm=0ACONFIG_SCSI_CXGB3_ISCSI=3Dm=0ACONFIG_SCSI_CXGB4_ISCSI=3Dm=0ACONFIG_=
SCSI_BNX2_ISCSI=3Dm=0ACONFIG_SCSI_BNX2X_FCOE=3Dm=0ACONFIG_BE2ISCSI=3Dm=0ACO=
NFIG_BLK_DEV_3W_XXXX_RAID=3Dm=0ACONFIG_SCSI_HPSA=3Dm=0ACONFIG_SCSI_3W_9XXX=
=3Dm=0ACONFIG_SCSI_3W_SAS=3Dm=0ACONFIG_SCSI_ACARD=3Dm=0ACONFIG_SCSI_AACRAID=
=3Dm=0ACONFIG_SCSI_AIC7XXX=3Dm=0ACONFIG_AIC7XXX_CMDS_PER_DEVICE=3D32=0ACONF=
IG_AIC7XXX_RESET_DELAY_MS=3D15000=0A# CONFIG_AIC7XXX_DEBUG_ENABLE is not se=
t=0ACONFIG_AIC7XXX_DEBUG_MASK=3D0=0ACONFIG_AIC7XXX_REG_PRETTY_PRINT=3Dy=0AC=
ONFIG_SCSI_AIC79XX=3Dm=0ACONFIG_AIC79XX_CMDS_PER_DEVICE=3D32=0ACONFIG_AIC79=
XX_RESET_DELAY_MS=3D5000=0A# CONFIG_AIC79XX_DEBUG_ENABLE is not set=0ACONFI=
G_AIC79XX_DEBUG_MASK=3D0=0ACONFIG_AIC79XX_REG_PRETTY_PRINT=3Dy=0ACONFIG_SCS=
I_AIC94XX=3Dm=0A# CONFIG_AIC94XX_DEBUG is not set=0ACONFIG_SCSI_MVSAS=3Dm=
=0A# CONFIG_SCSI_MVSAS_DEBUG is not set=0ACONFIG_SCSI_MVSAS_TASKLET=3Dy=0AC=
ONFIG_SCSI_MVUMI=3Dm=0ACONFIG_SCSI_ADVANSYS=3Dm=0ACONFIG_SCSI_ARCMSR=3Dm=0A=
CONFIG_SCSI_ESAS2R=3Dm=0ACONFIG_MEGARAID_NEWGEN=3Dy=0ACONFIG_MEGARAID_MM=3D=
m=0ACONFIG_MEGARAID_MAILBOX=3Dm=0ACONFIG_MEGARAID_LEGACY=3Dm=0ACONFIG_MEGAR=
AID_SAS=3Dm=0ACONFIG_SCSI_MPT3SAS=3Dm=0ACONFIG_SCSI_MPT2SAS_MAX_SGE=3D128=
=0ACONFIG_SCSI_MPT3SAS_MAX_SGE=3D128=0ACONFIG_SCSI_MPT2SAS=3Dm=0ACONFIG_SCS=
I_MPI3MR=3Dm=0ACONFIG_SCSI_SMARTPQI=3Dm=0ACONFIG_SCSI_HPTIOP=3Dm=0ACONFIG_S=
CSI_BUSLOGIC=3Dm=0A# CONFIG_SCSI_FLASHPOINT is not set=0ACONFIG_SCSI_MYRB=
=3Dm=0ACONFIG_SCSI_MYRS=3Dm=0ACONFIG_VMWARE_PVSCSI=3Dm=0ACONFIG_XEN_SCSI_FR=
ONTEND=3Dm=0ACONFIG_HYPERV_STORAGE=3Dm=0ACONFIG_LIBFC=3Dm=0ACONFIG_LIBFCOE=
=3Dm=0ACONFIG_FCOE=3Dm=0ACONFIG_FCOE_FNIC=3Dm=0ACONFIG_SCSI_SNIC=3Dm=0ACONF=
IG_SCSI_SNIC_DEBUG_FS=3Dy=0ACONFIG_SCSI_DMX3191D=3Dm=0ACONFIG_SCSI_FDOMAIN=
=3Dm=0ACONFIG_SCSI_FDOMAIN_PCI=3Dm=0ACONFIG_SCSI_ISCI=3Dm=0ACONFIG_SCSI_IPS=
=3Dm=0ACONFIG_SCSI_INITIO=3Dm=0ACONFIG_SCSI_INIA100=3Dm=0ACONFIG_SCSI_PPA=
=3Dm=0ACONFIG_SCSI_IMM=3Dm=0A# CONFIG_SCSI_IZIP_SLOW_CTR is not set=0ACONFI=
G_SCSI_STEX=3Dm=0ACONFIG_SCSI_SYM53C8XX_2=3Dm=0ACONFIG_SCSI_SYM53C8XX_DMA_A=
DDRESSING_MODE=3D1=0ACONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=3D16=0ACONFIG_SCSI_=
SYM53C8XX_MAX_TAGS=3D64=0ACONFIG_SCSI_SYM53C8XX_MMIO=3Dy=0A# CONFIG_SCSI_IP=
R is not set=0ACONFIG_SCSI_QLOGIC_1280=3Dm=0ACONFIG_SCSI_QLA_FC=3Dm=0ACONFI=
G_TCM_QLA2XXX=3Dm=0A# CONFIG_TCM_QLA2XXX_DEBUG is not set=0ACONFIG_SCSI_QLA=
_ISCSI=3Dm=0ACONFIG_QEDI=3Dm=0ACONFIG_QEDF=3Dm=0ACONFIG_SCSI_LPFC=3Dm=0A# C=
ONFIG_SCSI_LPFC_DEBUG_FS is not set=0ACONFIG_SCSI_EFCT=3Dm=0ACONFIG_SCSI_DC=
395x=3Dm=0ACONFIG_SCSI_AM53C974=3Dm=0ACONFIG_SCSI_WD719X=3Dm=0ACONFIG_SCSI_=
DEBUG=3Dm=0ACONFIG_SCSI_PMCRAID=3Dm=0ACONFIG_SCSI_PM8001=3Dm=0ACONFIG_SCSI_=
BFA_FC=3Dm=0ACONFIG_SCSI_VIRTIO=3Dm=0ACONFIG_SCSI_CHELSIO_FCOE=3Dm=0ACONFIG=
_SCSI_LOWLEVEL_PCMCIA=3Dy=0A# CONFIG_PCMCIA_AHA152X is not set=0A# CONFIG_P=
CMCIA_FDOMAIN is not set=0A# CONFIG_PCMCIA_QLOGIC is not set=0ACONFIG_PCMCI=
A_SYM53C500=3Dm=0ACONFIG_SCSI_DH=3Dy=0ACONFIG_SCSI_DH_RDAC=3Dm=0ACONFIG_SCS=
I_DH_HP_SW=3Dm=0ACONFIG_SCSI_DH_EMC=3Dm=0ACONFIG_SCSI_DH_ALUA=3Dm=0A# end o=
f SCSI device support=0A=0ACONFIG_ATA=3Dm=0ACONFIG_SATA_HOST=3Dy=0ACONFIG_P=
ATA_TIMINGS=3Dy=0ACONFIG_ATA_VERBOSE_ERROR=3Dy=0ACONFIG_ATA_FORCE=3Dy=0ACON=
FIG_ATA_ACPI=3Dy=0ACONFIG_SATA_ZPODD=3Dy=0ACONFIG_SATA_PMP=3Dy=0A=0A#=0A# C=
ontrollers with non-SFF native interface=0A#=0ACONFIG_SATA_AHCI=3Dm=0ACONFI=
G_SATA_MOBILE_LPM_POLICY=3D0=0ACONFIG_SATA_AHCI_PLATFORM=3Dm=0ACONFIG_AHCI_=
DWC=3Dm=0ACONFIG_SATA_INIC162X=3Dm=0ACONFIG_SATA_ACARD_AHCI=3Dm=0ACONFIG_SA=
TA_SIL24=3Dm=0ACONFIG_ATA_SFF=3Dy=0A=0A#=0A# SFF controllers with custom DM=
A interface=0A#=0ACONFIG_PDC_ADMA=3Dm=0ACONFIG_SATA_QSTOR=3Dm=0ACONFIG_SATA=
_SX4=3Dm=0ACONFIG_ATA_BMDMA=3Dy=0A=0A#=0A# SATA SFF controllers with BMDMA=
=0A#=0ACONFIG_ATA_PIIX=3Dm=0A# CONFIG_SATA_DWC is not set=0ACONFIG_SATA_MV=
=3Dm=0ACONFIG_SATA_NV=3Dm=0ACONFIG_SATA_PROMISE=3Dm=0ACONFIG_SATA_SIL=3Dm=
=0ACONFIG_SATA_SIS=3Dm=0ACONFIG_SATA_SVW=3Dm=0ACONFIG_SATA_ULI=3Dm=0ACONFIG=
_SATA_VIA=3Dm=0ACONFIG_SATA_VITESSE=3Dm=0A=0A#=0A# PATA SFF controllers wit=
h BMDMA=0A#=0ACONFIG_PATA_ALI=3Dm=0ACONFIG_PATA_AMD=3Dm=0ACONFIG_PATA_ARTOP=
=3Dm=0ACONFIG_PATA_ATIIXP=3Dm=0ACONFIG_PATA_ATP867X=3Dm=0ACONFIG_PATA_CMD64=
X=3Dm=0ACONFIG_PATA_CYPRESS=3Dm=0ACONFIG_PATA_EFAR=3Dm=0ACONFIG_PATA_HPT366=
=3Dm=0ACONFIG_PATA_HPT37X=3Dm=0ACONFIG_PATA_HPT3X2N=3Dm=0ACONFIG_PATA_HPT3X=
3=3Dm=0A# CONFIG_PATA_HPT3X3_DMA is not set=0ACONFIG_PATA_IT8213=3Dm=0ACONF=
IG_PATA_IT821X=3Dm=0ACONFIG_PATA_JMICRON=3Dm=0ACONFIG_PATA_MARVELL=3Dm=0ACO=
NFIG_PATA_NETCELL=3Dm=0ACONFIG_PATA_NINJA32=3Dm=0ACONFIG_PATA_NS87415=3Dm=
=0ACONFIG_PATA_OLDPIIX=3Dm=0ACONFIG_PATA_OPTIDMA=3Dm=0ACONFIG_PATA_PDC2027X=
=3Dm=0ACONFIG_PATA_PDC_OLD=3Dm=0ACONFIG_PATA_RADISYS=3Dm=0ACONFIG_PATA_RDC=
=3Dm=0ACONFIG_PATA_SCH=3Dm=0ACONFIG_PATA_SERVERWORKS=3Dm=0ACONFIG_PATA_SIL6=
80=3Dm=0ACONFIG_PATA_SIS=3Dm=0ACONFIG_PATA_TOSHIBA=3Dm=0ACONFIG_PATA_TRIFLE=
X=3Dm=0ACONFIG_PATA_VIA=3Dm=0ACONFIG_PATA_WINBOND=3Dm=0A=0A#=0A# PIO-only S=
FF controllers=0A#=0ACONFIG_PATA_CMD640_PCI=3Dm=0ACONFIG_PATA_MPIIX=3Dm=0AC=
ONFIG_PATA_NS87410=3Dm=0ACONFIG_PATA_OPTI=3Dm=0ACONFIG_PATA_PCMCIA=3Dm=0ACO=
NFIG_PATA_RZ1000=3Dm=0ACONFIG_PATA_PARPORT=3Dm=0A=0A#=0A# Parallel IDE prot=
ocol modules=0A#=0ACONFIG_PATA_PARPORT_ATEN=3Dm=0ACONFIG_PATA_PARPORT_BPCK=
=3Dm=0ACONFIG_PATA_PARPORT_BPCK6=3Dm=0ACONFIG_PATA_PARPORT_COMM=3Dm=0ACONFI=
G_PATA_PARPORT_DSTR=3Dm=0ACONFIG_PATA_PARPORT_FIT2=3Dm=0ACONFIG_PATA_PARPOR=
T_FIT3=3Dm=0ACONFIG_PATA_PARPORT_EPAT=3Dm=0ACONFIG_PATA_PARPORT_EPATC8=3Dy=
=0ACONFIG_PATA_PARPORT_EPIA=3Dm=0ACONFIG_PATA_PARPORT_FRIQ=3Dm=0ACONFIG_PAT=
A_PARPORT_FRPW=3Dm=0ACONFIG_PATA_PARPORT_KBIC=3Dm=0ACONFIG_PATA_PARPORT_KTT=
I=3Dm=0ACONFIG_PATA_PARPORT_ON20=3Dm=0ACONFIG_PATA_PARPORT_ON26=3Dm=0A=0A#=
=0A# Generic fallback / legacy drivers=0A#=0ACONFIG_PATA_ACPI=3Dm=0ACONFIG_=
ATA_GENERIC=3Dm=0A# CONFIG_PATA_LEGACY is not set=0ACONFIG_MD=3Dy=0ACONFIG_=
BLK_DEV_MD=3Dm=0ACONFIG_MD_BITMAP=3Dy=0A# CONFIG_MD_LLBITMAP is not set=0AC=
ONFIG_MD_BITMAP_FILE=3Dy=0ACONFIG_MD_LINEAR=3Dm=0ACONFIG_MD_RAID0=3Dm=0ACON=
FIG_MD_RAID1=3Dm=0ACONFIG_MD_RAID10=3Dm=0ACONFIG_MD_RAID456=3Dm=0ACONFIG_MD=
_CLUSTER=3Dm=0ACONFIG_BCACHE=3Dm=0A# CONFIG_BCACHE_DEBUG is not set=0ACONFI=
G_BCACHE_ASYNC_REGISTRATION=3Dy=0ACONFIG_BLK_DEV_DM_BUILTIN=3Dy=0ACONFIG_BL=
K_DEV_DM=3Dm=0A# CONFIG_DM_DEBUG is not set=0ACONFIG_DM_BUFIO=3Dm=0A# CONFI=
G_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set=0ACONFIG_DM_BIO_PRISON=3Dm=0ACO=
NFIG_DM_PERSISTENT_DATA=3Dm=0ACONFIG_DM_UNSTRIPED=3Dm=0ACONFIG_DM_CRYPT=3Dm=
=0ACONFIG_DM_SNAPSHOT=3Dm=0ACONFIG_DM_THIN_PROVISIONING=3Dm=0ACONFIG_DM_CAC=
HE=3Dm=0ACONFIG_DM_CACHE_SMQ=3Dm=0ACONFIG_DM_WRITECACHE=3Dm=0ACONFIG_DM_EBS=
=3Dm=0ACONFIG_DM_ERA=3Dm=0ACONFIG_DM_CLONE=3Dm=0ACONFIG_DM_MIRROR=3Dm=0ACON=
FIG_DM_LOG_USERSPACE=3Dm=0ACONFIG_DM_RAID=3Dm=0ACONFIG_DM_ZERO=3Dm=0ACONFIG=
_DM_MULTIPATH=3Dm=0ACONFIG_DM_MULTIPATH_QL=3Dm=0ACONFIG_DM_MULTIPATH_ST=3Dm=
=0ACONFIG_DM_MULTIPATH_HST=3Dm=0ACONFIG_DM_MULTIPATH_IOA=3Dm=0ACONFIG_DM_DE=
LAY=3Dm=0ACONFIG_DM_DUST=3Dm=0ACONFIG_DM_UEVENT=3Dy=0ACONFIG_DM_FLAKEY=3Dm=
=0ACONFIG_DM_VERITY=3Dm=0ACONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG=3Dy=0ACONFIG=
_DM_VERITY_VERIFY_ROOTHASH_SIG_SECONDARY_KEYRING=3Dy=0ACONFIG_DM_VERITY_VER=
IFY_ROOTHASH_SIG_PLATFORM_KEYRING=3Dy=0ACONFIG_DM_VERITY_FEC=3Dy=0ACONFIG_D=
M_SWITCH=3Dm=0ACONFIG_DM_LOG_WRITES=3Dm=0ACONFIG_DM_INTEGRITY=3Dm=0ACONFIG_=
DM_ZONED=3Dm=0ACONFIG_DM_AUDIT=3Dy=0ACONFIG_DM_VDO=3Dm=0A# CONFIG_DM_PCACHE=
 is not set=0ACONFIG_TARGET_CORE=3Dm=0ACONFIG_TCM_IBLOCK=3Dm=0ACONFIG_TCM_F=
ILEIO=3Dm=0ACONFIG_TCM_PSCSI=3Dm=0ACONFIG_TCM_USER2=3Dm=0ACONFIG_LOOPBACK_T=
ARGET=3Dm=0ACONFIG_TCM_FC=3Dm=0ACONFIG_ISCSI_TARGET=3Dm=0ACONFIG_ISCSI_TARG=
ET_CXGB4=3Dm=0ACONFIG_SBP_TARGET=3Dm=0ACONFIG_REMOTE_TARGET=3Dm=0ACONFIG_FU=
SION=3Dy=0ACONFIG_FUSION_SPI=3Dm=0ACONFIG_FUSION_FC=3Dm=0ACONFIG_FUSION_SAS=
=3Dm=0ACONFIG_FUSION_MAX_SGE=3D128=0ACONFIG_FUSION_CTL=3Dm=0ACONFIG_FUSION_=
LAN=3Dm=0A# CONFIG_FUSION_LOGGING is not set=0A=0A#=0A# IEEE 1394 (FireWire=
) support=0A#=0ACONFIG_FIREWIRE=3Dm=0ACONFIG_FIREWIRE_OHCI=3Dm=0ACONFIG_FIR=
EWIRE_SBP2=3Dm=0ACONFIG_FIREWIRE_NET=3Dm=0ACONFIG_FIREWIRE_NOSY=3Dm=0A# end=
 of IEEE 1394 (FireWire) support=0A=0A# CONFIG_MACINTOSH_DRIVERS is not set=
=0ACONFIG_NETDEVICES=3Dy=0ACONFIG_MII=3Dm=0ACONFIG_NET_CORE=3Dy=0ACONFIG_BO=
NDING=3Dm=0ACONFIG_DUMMY=3Dm=0ACONFIG_WIREGUARD=3Dm=0A# CONFIG_WIREGUARD_DE=
BUG is not set=0ACONFIG_OVPN=3Dm=0ACONFIG_EQUALIZER=3Dm=0ACONFIG_NET_FC=3Dy=
=0ACONFIG_IFB=3Dm=0ACONFIG_NET_TEAM=3Dm=0ACONFIG_NET_TEAM_MODE_BROADCAST=3D=
m=0ACONFIG_NET_TEAM_MODE_ROUNDROBIN=3Dm=0ACONFIG_NET_TEAM_MODE_RANDOM=3Dm=
=0ACONFIG_NET_TEAM_MODE_ACTIVEBACKUP=3Dm=0ACONFIG_NET_TEAM_MODE_LOADBALANCE=
=3Dm=0ACONFIG_MACVLAN=3Dm=0ACONFIG_MACVTAP=3Dm=0ACONFIG_IPVLAN_L3S=3Dy=0ACO=
NFIG_IPVLAN=3Dm=0ACONFIG_IPVTAP=3Dm=0ACONFIG_VXLAN=3Dm=0ACONFIG_GENEVE=3Dm=
=0ACONFIG_BAREUDP=3Dm=0ACONFIG_GTP=3Dm=0ACONFIG_PFCP=3Dm=0ACONFIG_AMT=3Dm=
=0ACONFIG_MACSEC=3Dm=0ACONFIG_NETCONSOLE=3Dm=0ACONFIG_NETCONSOLE_DYNAMIC=3D=
y=0A# CONFIG_NETCONSOLE_EXTENDED_LOG is not set=0ACONFIG_NETPOLL=3Dy=0ACONF=
IG_NET_POLL_CONTROLLER=3Dy=0ACONFIG_NTB_NETDEV=3Dm=0ACONFIG_RIONET=3Dm=0ACO=
NFIG_RIONET_TX_SIZE=3D128=0ACONFIG_RIONET_RX_SIZE=3D128=0ACONFIG_TUN=3Dm=0A=
CONFIG_TAP=3Dm=0A# CONFIG_TUN_VNET_CROSS_LE is not set=0ACONFIG_VETH=3Dm=0A=
CONFIG_VIRTIO_NET=3Dm=0ACONFIG_NLMON=3Dm=0ACONFIG_NETKIT=3Dy=0ACONFIG_NET_V=
RF=3Dm=0ACONFIG_VSOCKMON=3Dm=0ACONFIG_MHI_NET=3Dm=0ACONFIG_SUNGEM_PHY=3Dm=
=0A# CONFIG_ARCNET is not set=0ACONFIG_ATM_DRIVERS=3Dy=0ACONFIG_ATM_DUMMY=
=3Dm=0ACONFIG_ATM_TCP=3Dm=0ACONFIG_ATM_LANAI=3Dm=0ACONFIG_ATM_ENI=3Dm=0A# C=
ONFIG_ATM_ENI_DEBUG is not set=0ACONFIG_ATM_ENI_TUNE_BURST=3Dy=0ACONFIG_ATM=
_ENI_BURST_TX_16W=3Dy=0ACONFIG_ATM_ENI_BURST_TX_8W=3Dy=0ACONFIG_ATM_ENI_BUR=
ST_TX_4W=3Dy=0ACONFIG_ATM_ENI_BURST_TX_2W=3Dy=0ACONFIG_ATM_ENI_BURST_RX_16W=
=3Dy=0ACONFIG_ATM_ENI_BURST_RX_8W=3Dy=0ACONFIG_ATM_ENI_BURST_RX_4W=3Dy=0ACO=
NFIG_ATM_ENI_BURST_RX_2W=3Dy=0ACONFIG_ATM_NICSTAR=3Dm=0ACONFIG_ATM_NICSTAR_=
USE_SUNI=3Dy=0ACONFIG_ATM_NICSTAR_USE_IDT77105=3Dy=0ACONFIG_ATM_IDT77252=3D=
m=0A# CONFIG_ATM_IDT77252_DEBUG is not set=0A# CONFIG_ATM_IDT77252_RCV_ALL =
is not set=0ACONFIG_ATM_IDT77252_USE_SUNI=3Dy=0ACONFIG_ATM_IA=3Dm=0A# CONFI=
G_ATM_IA_DEBUG is not set=0ACONFIG_ATM_FORE200E=3Dm=0ACONFIG_ATM_FORE200E_U=
SE_TASKLET=3Dy=0ACONFIG_ATM_FORE200E_TX_RETRY=3D16=0ACONFIG_ATM_FORE200E_DE=
BUG=3D0=0ACONFIG_ATM_HE=3Dm=0ACONFIG_ATM_HE_USE_SUNI=3Dy=0ACONFIG_ATM_SOLOS=
=3Dm=0ACONFIG_CAIF_DRIVERS=3Dy=0ACONFIG_CAIF_TTY=3Dm=0ACONFIG_CAIF_VIRTIO=
=3Dm=0A=0A#=0A# Distributed Switch Architecture drivers=0A#=0ACONFIG_B53=3D=
m=0A# CONFIG_B53_SPI_DRIVER is not set=0A# CONFIG_B53_MDIO_DRIVER is not se=
t=0A# CONFIG_B53_MMAP_DRIVER is not set=0A# CONFIG_B53_SRAB_DRIVER is not s=
et=0A# CONFIG_B53_SERDES is not set=0ACONFIG_NET_DSA_BCM_SF2=3Dm=0ACONFIG_N=
ET_DSA_LOOP=3Dm=0ACONFIG_NET_DSA_HIRSCHMANN_HELLCREEK=3Dm=0ACONFIG_NET_DSA_=
LANTIQ_COMMON=3Dm=0ACONFIG_NET_DSA_LANTIQ_GSWIP=3Dm=0ACONFIG_NET_DSA_MXL_GS=
W1XX=3Dm=0ACONFIG_NET_DSA_MT7530=3Dm=0ACONFIG_NET_DSA_MT7530_MDIO=3Dm=0ACON=
FIG_NET_DSA_MT7530_MMIO=3Dm=0ACONFIG_NET_DSA_MV88E6060=3Dm=0ACONFIG_NET_DSA=
_MICROCHIP_KSZ_COMMON=3Dm=0ACONFIG_NET_DSA_MICROCHIP_KSZ9477_I2C=3Dm=0ACONF=
IG_NET_DSA_MICROCHIP_KSZ_SPI=3Dm=0ACONFIG_NET_DSA_MICROCHIP_KSZ_PTP=3Dy=0AC=
ONFIG_NET_DSA_MICROCHIP_KSZ8863_SMI=3Dm=0ACONFIG_NET_DSA_MV88E6XXX=3Dm=0ACO=
NFIG_NET_DSA_MV88E6XXX_PTP=3Dy=0ACONFIG_NET_DSA_MV88E6XXX_LEDS=3Dy=0ACONFIG=
_NET_DSA_MSCC_FELIX_DSA_LIB=3Dm=0ACONFIG_NET_DSA_MSCC_OCELOT_EXT=3Dm=0ACONF=
IG_NET_DSA_MSCC_SEVILLE=3Dm=0ACONFIG_NET_DSA_AR9331=3Dm=0ACONFIG_NET_DSA_QC=
A8K=3Dm=0ACONFIG_NET_DSA_QCA8K_LEDS_SUPPORT=3Dy=0ACONFIG_NET_DSA_SJA1105=3D=
m=0ACONFIG_NET_DSA_SJA1105_PTP=3Dy=0ACONFIG_NET_DSA_SJA1105_TAS=3Dy=0ACONFI=
G_NET_DSA_SJA1105_VL=3Dy=0ACONFIG_NET_DSA_XRS700X=3Dm=0ACONFIG_NET_DSA_XRS7=
00X_I2C=3Dm=0ACONFIG_NET_DSA_XRS700X_MDIO=3Dm=0ACONFIG_NET_DSA_REALTEK=3Dm=
=0ACONFIG_NET_DSA_KS8995=3Dm=0ACONFIG_NET_DSA_SMSC_LAN9303=3Dm=0ACONFIG_NET=
_DSA_SMSC_LAN9303_I2C=3Dm=0ACONFIG_NET_DSA_SMSC_LAN9303_MDIO=3Dm=0ACONFIG_N=
ET_DSA_VITESSE_VSC73XX=3Dm=0ACONFIG_NET_DSA_VITESSE_VSC73XX_SPI=3Dm=0ACONFI=
G_NET_DSA_VITESSE_VSC73XX_PLATFORM=3Dm=0ACONFIG_NET_DSA_YT921X=3Dm=0A# end =
of Distributed Switch Architecture drivers=0A=0ACONFIG_ETHERNET=3Dy=0ACONFI=
G_MDIO=3Dm=0ACONFIG_NET_VENDOR_3COM=3Dy=0ACONFIG_PCMCIA_3C574=3Dm=0A# CONFI=
G_PCMCIA_3C589 is not set=0ACONFIG_VORTEX=3Dm=0ACONFIG_TYPHOON=3Dm=0ACONFIG=
_NET_VENDOR_ADAPTEC=3Dy=0ACONFIG_ADAPTEC_STARFIRE=3Dm=0ACONFIG_NET_VENDOR_A=
GERE=3Dy=0ACONFIG_ET131X=3Dm=0ACONFIG_NET_VENDOR_ALACRITECH=3Dy=0ACONFIG_SL=
ICOSS=3Dm=0ACONFIG_NET_VENDOR_ALTEON=3Dy=0ACONFIG_ACENIC=3Dm=0A# CONFIG_ACE=
NIC_OMIT_TIGON_I is not set=0A# CONFIG_ALTERA_TSE is not set=0ACONFIG_NET_V=
ENDOR_AMAZON=3Dy=0ACONFIG_ENA_ETHERNET=3Dm=0ACONFIG_NET_VENDOR_AMD=3Dy=0ACO=
NFIG_AMD8111_ETH=3Dm=0ACONFIG_PCNET32=3Dm=0ACONFIG_PCMCIA_NMCLAN=3Dm=0ACONF=
IG_AMD_XGBE=3Dm=0ACONFIG_AMD_XGBE_DCB=3Dy=0ACONFIG_AMD_XGBE_HAVE_ECC=3Dy=0A=
CONFIG_PDS_CORE=3Dm=0ACONFIG_NET_VENDOR_AQUANTIA=3Dy=0ACONFIG_AQTION=3Dm=0A=
CONFIG_NET_VENDOR_ARC=3Dy=0ACONFIG_NET_VENDOR_ASIX=3Dy=0ACONFIG_SPI_AX88796=
C=3Dm=0ACONFIG_SPI_AX88796C_COMPRESSION=3Dy=0ACONFIG_NET_VENDOR_ATHEROS=3Dy=
=0ACONFIG_ATL2=3Dm=0ACONFIG_ATL1=3Dm=0ACONFIG_ATL1E=3Dm=0ACONFIG_ATL1C=3Dm=
=0ACONFIG_ALX=3Dm=0ACONFIG_CX_ECAT=3Dm=0ACONFIG_NET_VENDOR_BROADCOM=3Dy=0AC=
ONFIG_B44=3Dm=0ACONFIG_B44_PCI_AUTOSELECT=3Dy=0ACONFIG_B44_PCICORE_AUTOSELE=
CT=3Dy=0ACONFIG_B44_PCI=3Dy=0ACONFIG_BCMGENET=3Dm=0ACONFIG_BNX2=3Dm=0ACONFI=
G_CNIC=3Dm=0ACONFIG_TIGON3=3Dm=0ACONFIG_TIGON3_HWMON=3Dy=0ACONFIG_BNX2X=3Dm=
=0ACONFIG_BNX2X_SRIOV=3Dy=0ACONFIG_SYSTEMPORT=3Dm=0ACONFIG_BNXT=3Dm=0ACONFI=
G_BNXT_SRIOV=3Dy=0ACONFIG_BNXT_FLOWER_OFFLOAD=3Dy=0ACONFIG_BNXT_DCB=3Dy=0AC=
ONFIG_BNXT_HWMON=3Dy=0ACONFIG_BNGE=3Dm=0ACONFIG_NET_VENDOR_CADENCE=3Dy=0A# =
CONFIG_MACB is not set=0ACONFIG_NET_VENDOR_CAVIUM=3Dy=0A# CONFIG_THUNDER_NI=
C_PF is not set=0A# CONFIG_THUNDER_NIC_VF is not set=0A# CONFIG_THUNDER_NIC=
_BGX is not set=0A# CONFIG_THUNDER_NIC_RGX is not set=0ACONFIG_CAVIUM_PTP=
=3Dm=0ACONFIG_LIQUIDIO_CORE=3Dm=0ACONFIG_LIQUIDIO=3Dm=0ACONFIG_LIQUIDIO_VF=
=3Dm=0ACONFIG_NET_VENDOR_CHELSIO=3Dy=0ACONFIG_CHELSIO_T1=3Dm=0ACONFIG_CHELS=
IO_T1_1G=3Dy=0ACONFIG_CHELSIO_T3=3Dm=0ACONFIG_CHELSIO_T4=3Dm=0ACONFIG_CHELS=
IO_T4_DCB=3Dy=0ACONFIG_CHELSIO_T4_FCOE=3Dy=0ACONFIG_CHELSIO_T4VF=3Dm=0ACONF=
IG_CHELSIO_LIB=3Dm=0ACONFIG_CHELSIO_INLINE_CRYPTO=3Dy=0ACONFIG_CHELSIO_IPSE=
C_INLINE=3Dm=0ACONFIG_CHELSIO_TLS_DEVICE=3Dm=0ACONFIG_NET_VENDOR_CISCO=3Dy=
=0ACONFIG_ENIC=3Dm=0ACONFIG_NET_VENDOR_CORTINA=3Dy=0ACONFIG_NET_VENDOR_DAVI=
COM=3Dy=0ACONFIG_DM9051=3Dm=0ACONFIG_DNET=3Dm=0ACONFIG_NET_VENDOR_DEC=3Dy=
=0ACONFIG_NET_TULIP=3Dy=0ACONFIG_DE2104X=3Dm=0ACONFIG_DE2104X_DSL=3D0=0ACON=
FIG_TULIP=3Dm=0A# CONFIG_TULIP_MWI is not set=0A# CONFIG_TULIP_MMIO is not =
set=0ACONFIG_TULIP_NAPI=3Dy=0ACONFIG_TULIP_NAPI_HW_MITIGATION=3Dy=0ACONFIG_=
WINBOND_840=3Dm=0ACONFIG_DM9102=3Dm=0ACONFIG_ULI526X=3Dm=0ACONFIG_PCMCIA_XI=
RCOM=3Dm=0ACONFIG_NET_VENDOR_DLINK=3Dy=0ACONFIG_DL2K=3Dm=0ACONFIG_SUNDANCE=
=3Dm=0A# CONFIG_SUNDANCE_MMIO is not set=0ACONFIG_NET_VENDOR_EMULEX=3Dy=0AC=
ONFIG_BE2NET=3Dm=0ACONFIG_BE2NET_HWMON=3Dy=0ACONFIG_BE2NET_BE2=3Dy=0ACONFIG=
_BE2NET_BE3=3Dy=0ACONFIG_BE2NET_LANCER=3Dy=0ACONFIG_BE2NET_SKYHAWK=3Dy=0ACO=
NFIG_NET_VENDOR_ENGLEDER=3Dy=0ACONFIG_TSNEP=3Dm=0A# CONFIG_TSNEP_SELFTESTS =
is not set=0ACONFIG_NET_VENDOR_EZCHIP=3Dy=0ACONFIG_NET_VENDOR_FUJITSU=3Dy=
=0A# CONFIG_PCMCIA_FMVJ18X is not set=0ACONFIG_NET_VENDOR_FUNGIBLE=3Dy=0ACO=
NFIG_FUN_CORE=3Dm=0ACONFIG_FUN_ETH=3Dm=0ACONFIG_NET_VENDOR_GOOGLE=3Dy=0ACON=
FIG_GVE=3Dm=0ACONFIG_NET_VENDOR_HISILICON=3Dy=0ACONFIG_HIBMCGE=3Dm=0ACONFIG=
_NET_VENDOR_HUAWEI=3Dy=0ACONFIG_HINIC=3Dm=0ACONFIG_HINIC3=3Dm=0ACONFIG_NET_=
VENDOR_I825XX=3Dy=0ACONFIG_NET_VENDOR_INTEL=3Dy=0ACONFIG_LIBETH=3Dm=0ACONFI=
G_LIBETH_XDP=3Dm=0ACONFIG_LIBIE=3Dm=0ACONFIG_LIBIE_ADMINQ=3Dm=0ACONFIG_LIBI=
E_FWLOG=3Dm=0ACONFIG_E100=3Dm=0ACONFIG_E1000=3Dm=0ACONFIG_E1000E=3Dm=0ACONF=
IG_E1000E_HWTS=3Dy=0ACONFIG_IGB=3Dm=0ACONFIG_IGB_HWMON=3Dy=0ACONFIG_IGB_DCA=
=3Dy=0ACONFIG_IGBVF=3Dm=0ACONFIG_IXGBE=3Dm=0ACONFIG_IXGBE_HWMON=3Dy=0ACONFI=
G_IXGBE_DCA=3Dy=0ACONFIG_IXGBE_DCB=3Dy=0ACONFIG_IXGBE_IPSEC=3Dy=0ACONFIG_IX=
GBEVF=3Dm=0ACONFIG_IXGBEVF_IPSEC=3Dy=0ACONFIG_I40E=3Dm=0ACONFIG_I40E_DCB=3D=
y=0ACONFIG_IAVF=3Dm=0ACONFIG_I40EVF=3Dm=0ACONFIG_ICE=3Dm=0ACONFIG_ICE_HWMON=
=3Dy=0ACONFIG_ICE_SWITCHDEV=3Dy=0ACONFIG_ICE_HWTS=3Dy=0ACONFIG_FM10K=3Dm=0A=
CONFIG_IGC=3Dm=0ACONFIG_IGC_LEDS=3Dy=0ACONFIG_IDPF=3Dm=0A# CONFIG_IDPF_SING=
LEQ is not set=0ACONFIG_JME=3Dm=0ACONFIG_NET_VENDOR_ADI=3Dy=0ACONFIG_ADIN11=
10=3Dm=0ACONFIG_NET_VENDOR_LITEX=3Dy=0ACONFIG_NET_VENDOR_MARVELL=3Dy=0A# CO=
NFIG_MVMDIO is not set=0ACONFIG_SKGE=3Dm=0A# CONFIG_SKGE_DEBUG is not set=
=0ACONFIG_SKGE_GENESIS=3Dy=0ACONFIG_SKY2=3Dm=0A# CONFIG_SKY2_DEBUG is not s=
et=0ACONFIG_OCTEON_EP=3Dm=0ACONFIG_OCTEON_EP_VF=3Dm=0ACONFIG_PRESTERA=3Dm=
=0ACONFIG_PRESTERA_PCI=3Dm=0ACONFIG_NET_VENDOR_MELLANOX=3Dy=0ACONFIG_MLX4_E=
N=3Dm=0ACONFIG_MLX4_EN_DCB=3Dy=0ACONFIG_MLX4_CORE=3Dm=0ACONFIG_MLX4_DEBUG=
=3Dy=0ACONFIG_MLX4_CORE_GEN2=3Dy=0ACONFIG_MLX5_CORE=3Dm=0ACONFIG_MLX5_FPGA=
=3Dy=0ACONFIG_MLX5_CORE_EN=3Dy=0ACONFIG_MLX5_EN_ARFS=3Dy=0ACONFIG_MLX5_EN_R=
XNFC=3Dy=0ACONFIG_MLX5_MPFS=3Dy=0ACONFIG_MLX5_ESWITCH=3Dy=0ACONFIG_MLX5_BRI=
DGE=3Dy=0ACONFIG_MLX5_CLS_ACT=3Dy=0ACONFIG_MLX5_TC_CT=3Dy=0ACONFIG_MLX5_TC_=
SAMPLE=3Dy=0ACONFIG_MLX5_CORE_EN_DCB=3Dy=0ACONFIG_MLX5_CORE_IPOIB=3Dy=0ACON=
FIG_MLX5_MACSEC=3Dy=0ACONFIG_MLX5_EN_IPSEC=3Dy=0ACONFIG_MLX5_EN_TLS=3Dy=0AC=
ONFIG_MLX5_SW_STEERING=3Dy=0ACONFIG_MLX5_HW_STEERING=3Dy=0ACONFIG_MLX5_SF=
=3Dy=0ACONFIG_MLX5_SF_MANAGER=3Dy=0ACONFIG_MLX5_DPLL=3Dm=0ACONFIG_MLX5_EN_P=
SP=3Dy=0ACONFIG_MLXSW_CORE=3Dm=0ACONFIG_MLXSW_CORE_HWMON=3Dy=0ACONFIG_MLXSW=
_CORE_THERMAL=3Dy=0ACONFIG_MLXSW_PCI=3Dm=0ACONFIG_MLXSW_I2C=3Dm=0ACONFIG_ML=
XSW_SPECTRUM=3Dm=0ACONFIG_MLXSW_SPECTRUM_DCB=3Dy=0ACONFIG_MLXSW_MINIMAL=3Dm=
=0ACONFIG_MLXFW=3Dm=0ACONFIG_NET_VENDOR_META=3Dy=0ACONFIG_FBNIC=3Dm=0ACONFI=
G_NET_VENDOR_MICREL=3Dy=0ACONFIG_KS8842=3Dm=0A# CONFIG_KS8851 is not set=0A=
CONFIG_KS8851_MLL=3Dm=0ACONFIG_KSZ884X_PCI=3Dm=0A# CONFIG_NET_VENDOR_MICROC=
HIP is not set=0ACONFIG_NET_VENDOR_MICROSEMI=3Dy=0ACONFIG_MSCC_OCELOT_SWITC=
H_LIB=3Dm=0ACONFIG_NET_VENDOR_MICROSOFT=3Dy=0ACONFIG_MICROSOFT_MANA=3Dm=0AC=
ONFIG_NET_VENDOR_MUCSE=3Dy=0ACONFIG_MGBE=3Dm=0ACONFIG_NET_VENDOR_MYRI=3Dy=
=0ACONFIG_MYRI10GE=3Dm=0ACONFIG_MYRI10GE_DCA=3Dy=0ACONFIG_FEALNX=3Dm=0ACONF=
IG_NET_VENDOR_NI=3Dy=0ACONFIG_NI_XGE_MANAGEMENT_ENET=3Dm=0ACONFIG_NET_VENDO=
R_NATSEMI=3Dy=0ACONFIG_NATSEMI=3Dm=0ACONFIG_NS83820=3Dm=0ACONFIG_NET_VENDOR=
_NETERION=3Dy=0ACONFIG_S2IO=3Dm=0ACONFIG_NET_VENDOR_NETRONOME=3Dy=0ACONFIG_=
NFP=3Dm=0ACONFIG_NFP_APP_FLOWER=3Dy=0ACONFIG_NFP_APP_ABM_NIC=3Dy=0ACONFIG_N=
FP_NET_IPSEC=3Dy=0A# CONFIG_NFP_DEBUG is not set=0ACONFIG_NET_VENDOR_8390=
=3Dy=0A# CONFIG_PCMCIA_AXNET is not set=0ACONFIG_NE2K_PCI=3Dm=0ACONFIG_PCMC=
IA_PCNET=3Dm=0ACONFIG_NET_VENDOR_NVIDIA=3Dy=0ACONFIG_FORCEDETH=3Dm=0ACONFIG=
_NET_VENDOR_OKI=3Dy=0ACONFIG_ETHOC=3Dm=0ACONFIG_NET_VENDOR_PACKET_ENGINES=
=3Dy=0ACONFIG_HAMACHI=3Dm=0ACONFIG_YELLOWFIN=3Dm=0ACONFIG_NET_VENDOR_PENSAN=
DO=3Dy=0ACONFIG_IONIC=3Dm=0ACONFIG_NET_VENDOR_QLOGIC=3Dy=0ACONFIG_QLA3XXX=
=3Dm=0ACONFIG_QLCNIC=3Dm=0ACONFIG_QLCNIC_SRIOV=3Dy=0ACONFIG_QLCNIC_DCB=3Dy=
=0ACONFIG_QLCNIC_HWMON=3Dy=0ACONFIG_NETXEN_NIC=3Dm=0ACONFIG_QED=3Dm=0ACONFI=
G_QED_LL2=3Dy=0ACONFIG_QED_SRIOV=3Dy=0ACONFIG_QEDE=3Dm=0ACONFIG_QED_RDMA=3D=
y=0ACONFIG_QED_ISCSI=3Dy=0ACONFIG_QED_FCOE=3Dy=0ACONFIG_QED_OOO=3Dy=0ACONFI=
G_NET_VENDOR_BROCADE=3Dy=0ACONFIG_BNA=3Dm=0ACONFIG_NET_VENDOR_QUALCOMM=3Dy=
=0A# CONFIG_QCOM_EMAC is not set=0A# CONFIG_RMNET is not set=0ACONFIG_NET_V=
ENDOR_RDC=3Dy=0ACONFIG_R6040=3Dm=0ACONFIG_NET_VENDOR_REALTEK=3Dy=0ACONFIG_A=
TP=3Dm=0ACONFIG_8139CP=3Dm=0ACONFIG_8139TOO=3Dm=0A# CONFIG_8139TOO_PIO is n=
ot set=0A# CONFIG_8139TOO_TUNE_TWISTER is not set=0ACONFIG_8139TOO_8129=3Dy=
=0A# CONFIG_8139_OLD_RX_RESET is not set=0ACONFIG_R8169=3Dm=0ACONFIG_R8169_=
LEDS=3Dy=0ACONFIG_RTASE=3Dm=0ACONFIG_NET_VENDOR_RENESAS=3Dy=0ACONFIG_NET_VE=
NDOR_ROCKER=3Dy=0ACONFIG_ROCKER=3Dm=0ACONFIG_NET_VENDOR_SAMSUNG=3Dy=0A# CON=
FIG_SXGBE_ETH is not set=0ACONFIG_NET_VENDOR_SEEQ=3Dy=0ACONFIG_NET_VENDOR_S=
ILAN=3Dy=0ACONFIG_SC92031=3Dm=0ACONFIG_NET_VENDOR_SIS=3Dy=0ACONFIG_SIS900=
=3Dm=0ACONFIG_SIS190=3Dm=0ACONFIG_NET_VENDOR_SOLARFLARE=3Dy=0ACONFIG_SFC=3D=
m=0ACONFIG_SFC_MTD=3Dy=0ACONFIG_SFC_MCDI_MON=3Dy=0ACONFIG_SFC_SRIOV=3Dy=0AC=
ONFIG_SFC_MCDI_LOGGING=3Dy=0ACONFIG_SFC_FALCON=3Dm=0ACONFIG_SFC_FALCON_MTD=
=3Dy=0ACONFIG_SFC_SIENA=3Dm=0ACONFIG_SFC_SIENA_MTD=3Dy=0ACONFIG_SFC_SIENA_M=
CDI_MON=3Dy=0ACONFIG_SFC_SIENA_SRIOV=3Dy=0ACONFIG_SFC_SIENA_MCDI_LOGGING=3D=
y=0ACONFIG_NET_VENDOR_SMSC=3Dy=0A# CONFIG_PCMCIA_SMC91C92 is not set=0ACONF=
IG_EPIC100=3Dm=0ACONFIG_SMSC911X=3Dm=0A# CONFIG_SMSC911X_ARCH_HOOKS is not =
set=0ACONFIG_SMSC9420=3Dm=0ACONFIG_NET_VENDOR_SOCIONEXT=3Dy=0ACONFIG_NET_VE=
NDOR_STMICRO=3Dy=0ACONFIG_STMMAC_ETH=3Dm=0A# CONFIG_STMMAC_SELFTESTS is not=
 set=0A# CONFIG_STMMAC_PLATFORM is not set=0ACONFIG_STMMAC_LIBPCI=3Dm=0ACON=
FIG_DWMAC_INTEL=3Dm=0ACONFIG_STMMAC_PCI=3Dm=0ACONFIG_NET_VENDOR_SUN=3Dy=0AC=
ONFIG_HAPPYMEAL=3Dm=0ACONFIG_SUNGEM=3Dm=0ACONFIG_CASSINI=3Dm=0ACONFIG_NIU=
=3Dm=0ACONFIG_NET_VENDOR_SYNOPSYS=3Dy=0ACONFIG_DWC_XLGMAC=3Dm=0ACONFIG_DWC_=
XLGMAC_PCI=3Dm=0ACONFIG_NET_VENDOR_TEHUTI=3Dy=0ACONFIG_TEHUTI=3Dm=0ACONFIG_=
TEHUTI_TN40=3Dm=0ACONFIG_NET_VENDOR_TI=3Dy=0A# CONFIG_TI_CPSW_PHY_SEL is no=
t set=0ACONFIG_TLAN=3Dm=0ACONFIG_NET_VENDOR_VERTEXCOM=3Dy=0ACONFIG_MSE102X=
=3Dm=0ACONFIG_NET_VENDOR_VIA=3Dy=0ACONFIG_VIA_RHINE=3Dm=0ACONFIG_VIA_RHINE_=
MMIO=3Dy=0ACONFIG_VIA_VELOCITY=3Dm=0ACONFIG_NET_VENDOR_WANGXUN=3Dy=0ACONFIG=
_LIBWX=3Dm=0ACONFIG_NGBE=3Dm=0ACONFIG_TXGBE=3Dm=0ACONFIG_TXGBEVF=3Dm=0ACONF=
IG_NGBEVF=3Dm=0ACONFIG_NET_VENDOR_WIZNET=3Dy=0ACONFIG_WIZNET_W5100=3Dm=0ACO=
NFIG_WIZNET_W5300=3Dm=0A# CONFIG_WIZNET_BUS_DIRECT is not set=0A# CONFIG_WI=
ZNET_BUS_INDIRECT is not set=0ACONFIG_WIZNET_BUS_ANY=3Dy=0ACONFIG_WIZNET_W5=
100_SPI=3Dm=0ACONFIG_NET_VENDOR_XILINX=3Dy=0A# CONFIG_XILINX_EMACLITE is no=
t set=0ACONFIG_XILINX_AXI_EMAC=3Dm=0ACONFIG_XILINX_LL_TEMAC=3Dm=0ACONFIG_NE=
T_VENDOR_XIRCOM=3Dy=0A# CONFIG_PCMCIA_XIRC2PS is not set=0ACONFIG_FDDI=3Dm=
=0ACONFIG_DEFXX=3Dm=0ACONFIG_SKFP=3Dm=0ACONFIG_HIPPI=3Dy=0ACONFIG_ROADRUNNE=
R=3Dm=0A# CONFIG_ROADRUNNER_LARGE_RINGS is not set=0ACONFIG_MDIO_BUS=3Dm=0A=
CONFIG_PHYLINK=3Dm=0ACONFIG_PHYLIB=3Dm=0ACONFIG_SWPHY=3Dy=0ACONFIG_PHY_PACK=
AGE=3Dm=0ACONFIG_LED_TRIGGER_PHY=3Dy=0ACONFIG_OPEN_ALLIANCE_HELPERS=3Dy=0A#=
 CONFIG_PHYLIB_LEDS is not set=0ACONFIG_FIXED_PHY=3Dm=0ACONFIG_SFP=3Dm=0A=
=0A#=0A# MII PHY device drivers=0A#=0ACONFIG_AS21XXX_PHY=3Dm=0ACONFIG_AIR_E=
N8811H_PHY=3Dm=0ACONFIG_AMD_PHY=3Dm=0ACONFIG_ADIN_PHY=3Dm=0ACONFIG_ADIN1100=
_PHY=3Dm=0ACONFIG_AQUANTIA_PHY=3Dm=0ACONFIG_AX88796B_PHY=3Dm=0ACONFIG_BROAD=
COM_PHY=3Dm=0ACONFIG_BCM54140_PHY=3Dm=0ACONFIG_BCM7XXX_PHY=3Dm=0ACONFIG_BCM=
84881_PHY=3Dm=0ACONFIG_BCM87XX_PHY=3Dm=0ACONFIG_BCM_NET_PHYLIB=3Dm=0ACONFIG=
_CICADA_PHY=3Dm=0A# CONFIG_CORTINA_PHY is not set=0ACONFIG_DAVICOM_PHY=3Dm=
=0ACONFIG_ICPLUS_PHY=3Dm=0ACONFIG_LXT_PHY=3Dm=0ACONFIG_INTEL_XWAY_PHY=3Dm=
=0ACONFIG_LSI_ET1011C_PHY=3Dm=0ACONFIG_MARVELL_PHY=3Dm=0ACONFIG_MARVELL_10G=
_PHY=3Dm=0ACONFIG_MARVELL_88Q2XXX_PHY=3Dm=0ACONFIG_MARVELL_88X2222_PHY=3Dm=
=0ACONFIG_MAXLINEAR_GPHY=3Dm=0ACONFIG_MAXLINEAR_86110_PHY=3Dm=0ACONFIG_MEDI=
ATEK_GE_PHY=3Dm=0A# CONFIG_MEDIATEK_GE_SOC_PHY is not set=0ACONFIG_MTK_NET_=
PHYLIB=3Dm=0ACONFIG_MICREL_PHY=3Dm=0ACONFIG_MICROCHIP_T1S_PHY=3Dm=0ACONFIG_=
MICROCHIP_PHY=3Dm=0ACONFIG_MICROCHIP_T1_PHY=3Dm=0ACONFIG_MICROSEMI_PHY=3Dm=
=0ACONFIG_MOTORCOMM_PHY=3Dm=0ACONFIG_NATIONAL_PHY=3Dm=0ACONFIG_NXP_CBTX_PHY=
=3Dm=0ACONFIG_NXP_C45_TJA11XX_PHY=3Dm=0ACONFIG_NXP_TJA11XX_PHY=3Dm=0ACONFIG=
_NCN26000_PHY=3Dm=0ACONFIG_QCOM_NET_PHYLIB=3Dm=0ACONFIG_AT803X_PHY=3Dm=0ACO=
NFIG_QCA83XX_PHY=3Dm=0ACONFIG_QCA808X_PHY=3Dm=0ACONFIG_QSEMI_PHY=3Dm=0ACONF=
IG_REALTEK_PHY=3Dm=0ACONFIG_REALTEK_PHY_HWMON=3Dy=0ACONFIG_RENESAS_PHY=3Dm=
=0ACONFIG_ROCKCHIP_PHY=3Dm=0ACONFIG_SMSC_PHY=3Dm=0ACONFIG_STE10XP=3Dm=0ACON=
FIG_TERANETICS_PHY=3Dm=0ACONFIG_DP83822_PHY=3Dm=0ACONFIG_DP83TC811_PHY=3Dm=
=0ACONFIG_DP83848_PHY=3Dm=0ACONFIG_DP83867_PHY=3Dm=0ACONFIG_DP83869_PHY=3Dm=
=0ACONFIG_DP83TD510_PHY=3Dm=0ACONFIG_DP83TG720_PHY=3Dm=0ACONFIG_VITESSE_PHY=
=3Dm=0A# CONFIG_XILINX_GMII2RGMII is not set=0ACONFIG_PSE_CONTROLLER=3Dy=0A=
CONFIG_PSE_REGULATOR=3Dm=0ACONFIG_PSE_PD692X0=3Dm=0ACONFIG_PSE_SI3474=3Dm=
=0ACONFIG_PSE_TPS23881=3Dm=0ACONFIG_CAN_DEV=3Dm=0ACONFIG_CAN_VCAN=3Dm=0ACON=
FIG_CAN_VXCAN=3Dm=0ACONFIG_CAN_NETLINK=3Dy=0ACONFIG_CAN_CALC_BITTIMING=3Dy=
=0ACONFIG_CAN_RX_OFFLOAD=3Dy=0ACONFIG_CAN_CAN327=3Dm=0A# CONFIG_CAN_DUMMY i=
s not set=0ACONFIG_CAN_KVASER_PCIEFD=3Dm=0ACONFIG_CAN_SLCAN=3Dm=0ACONFIG_CA=
N_C_CAN=3Dm=0A# CONFIG_CAN_C_CAN_PLATFORM is not set=0ACONFIG_CAN_C_CAN_PCI=
=3Dm=0A# CONFIG_CAN_CC770 is not set=0ACONFIG_CAN_CTUCANFD=3Dm=0ACONFIG_CAN=
_CTUCANFD_PCI=3Dm=0ACONFIG_CAN_ESD_402_PCI=3Dm=0ACONFIG_CAN_IFI_CANFD=3Dm=
=0ACONFIG_CAN_M_CAN=3Dm=0ACONFIG_CAN_M_CAN_PCI=3Dm=0ACONFIG_CAN_M_CAN_PLATF=
ORM=3Dm=0ACONFIG_CAN_M_CAN_TCAN4X5X=3Dm=0ACONFIG_CAN_PEAK_PCIEFD=3Dm=0ACONF=
IG_CAN_SJA1000=3Dm=0ACONFIG_CAN_EMS_PCI=3Dm=0ACONFIG_CAN_EMS_PCMCIA=3Dm=0AC=
ONFIG_CAN_F81601=3Dm=0ACONFIG_CAN_KVASER_PCI=3Dm=0ACONFIG_CAN_PEAK_PCI=3Dm=
=0ACONFIG_CAN_PEAK_PCIEC=3Dy=0ACONFIG_CAN_PEAK_PCMCIA=3Dm=0ACONFIG_CAN_PLX_=
PCI=3Dm=0A# CONFIG_CAN_SJA1000_ISA is not set=0A# CONFIG_CAN_SJA1000_PLATFO=
RM is not set=0ACONFIG_CAN_SOFTING=3Dm=0ACONFIG_CAN_SOFTING_CS=3Dm=0A=0A#=
=0A# CAN SPI interfaces=0A#=0ACONFIG_CAN_HI311X=3Dm=0A# CONFIG_CAN_MCP251X =
is not set=0ACONFIG_CAN_MCP251XFD=3Dm=0A# CONFIG_CAN_MCP251XFD_SANITY is no=
t set=0A# end of CAN SPI interfaces=0A=0A#=0A# CAN USB interfaces=0A#=0ACON=
FIG_CAN_8DEV_USB=3Dm=0ACONFIG_CAN_EMS_USB=3Dm=0ACONFIG_CAN_ESD_USB=3Dm=0ACO=
NFIG_CAN_ETAS_ES58X=3Dm=0ACONFIG_CAN_F81604=3Dm=0ACONFIG_CAN_GS_USB=3Dm=0AC=
ONFIG_CAN_KVASER_USB=3Dm=0ACONFIG_CAN_MCBA_USB=3Dm=0ACONFIG_CAN_PEAK_USB=3D=
m=0ACONFIG_CAN_UCAN=3Dm=0A# end of CAN USB interfaces=0A=0A# CONFIG_CAN_DEB=
UG_DEVICES is not set=0A=0A#=0A# MCTP Device Drivers=0A#=0ACONFIG_MCTP_SERI=
AL=3Dm=0ACONFIG_MCTP_TRANSPORT_I2C=3Dm=0ACONFIG_MCTP_TRANSPORT_I3C=3Dm=0ACO=
NFIG_MCTP_TRANSPORT_USB=3Dm=0A# end of MCTP Device Drivers=0A=0ACONFIG_FWNO=
DE_MDIO=3Dm=0A# CONFIG_OF_MDIO is not set=0ACONFIG_ACPI_MDIO=3Dm=0ACONFIG_M=
DIO_BITBANG=3Dm=0ACONFIG_MDIO_BCM_UNIMAC=3Dm=0ACONFIG_MDIO_GPIO=3Dm=0ACONFI=
G_MDIO_I2C=3Dm=0ACONFIG_MDIO_MVUSB=3Dm=0ACONFIG_MDIO_MSCC_MIIM=3Dm=0A# CONF=
IG_MDIO_THUNDER is not set=0A=0A#=0A# MDIO Multiplexers=0A#=0A=0A#=0A# PCS =
device drivers=0A#=0ACONFIG_PCS_XPCS=3Dm=0ACONFIG_PCS_LYNX=3Dm=0ACONFIG_PCS=
_MTK_LYNXI=3Dm=0A# end of PCS device drivers=0A=0ACONFIG_PLIP=3Dm=0ACONFIG_=
PPP=3Dm=0ACONFIG_PPP_BSDCOMP=3Dm=0ACONFIG_PPP_DEFLATE=3Dm=0ACONFIG_PPP_FILT=
ER=3Dy=0ACONFIG_PPP_MPPE=3Dm=0ACONFIG_PPP_MULTILINK=3Dy=0ACONFIG_PPPOATM=3D=
m=0ACONFIG_PPPOE=3Dm=0A# CONFIG_PPPOE_HASH_BITS_1 is not set=0A# CONFIG_PPP=
OE_HASH_BITS_2 is not set=0ACONFIG_PPPOE_HASH_BITS_4=3Dy=0A# CONFIG_PPPOE_H=
ASH_BITS_8 is not set=0ACONFIG_PPPOE_HASH_BITS=3D4=0ACONFIG_PPTP=3Dm=0ACONF=
IG_PPPOL2TP=3Dm=0ACONFIG_PPP_ASYNC=3Dm=0ACONFIG_PPP_SYNC_TTY=3Dm=0ACONFIG_S=
LIP=3Dm=0ACONFIG_SLHC=3Dm=0ACONFIG_SLIP_COMPRESSED=3Dy=0ACONFIG_SLIP_SMART=
=3Dy=0ACONFIG_SLIP_MODE_SLIP6=3Dy=0A=0A#=0A# Host-side USB support is neede=
d for USB Network Adapter support=0A#=0ACONFIG_USB_NET_DRIVERS=3Dm=0ACONFIG=
_USB_CATC=3Dm=0ACONFIG_USB_KAWETH=3Dm=0ACONFIG_USB_PEGASUS=3Dm=0ACONFIG_USB=
_RTL8150=3Dm=0ACONFIG_USB_RTL8152=3Dm=0ACONFIG_USB_LAN78XX=3Dm=0ACONFIG_USB=
_USBNET=3Dm=0ACONFIG_USB_NET_AX8817X=3Dm=0ACONFIG_USB_NET_AX88179_178A=3Dm=
=0ACONFIG_USB_NET_CDCETHER=3Dm=0ACONFIG_USB_NET_CDC_EEM=3Dm=0ACONFIG_USB_NE=
T_CDC_NCM=3Dm=0ACONFIG_USB_NET_HUAWEI_CDC_NCM=3Dm=0ACONFIG_USB_NET_CDC_MBIM=
=3Dm=0ACONFIG_USB_NET_DM9601=3Dm=0ACONFIG_USB_NET_SR9700=3Dm=0ACONFIG_USB_N=
ET_SR9800=3Dm=0ACONFIG_USB_NET_SMSC75XX=3Dm=0ACONFIG_USB_NET_SMSC95XX=3Dm=
=0ACONFIG_USB_NET_GL620A=3Dm=0ACONFIG_USB_NET_NET1080=3Dm=0ACONFIG_USB_NET_=
PLUSB=3Dm=0ACONFIG_USB_NET_MCS7830=3Dm=0ACONFIG_USB_NET_RNDIS_HOST=3Dm=0ACO=
NFIG_USB_NET_CDC_SUBSET_ENABLE=3Dm=0ACONFIG_USB_NET_CDC_SUBSET=3Dm=0ACONFIG=
_USB_ALI_M5632=3Dy=0ACONFIG_USB_AN2720=3Dy=0ACONFIG_USB_BELKIN=3Dy=0ACONFIG=
_USB_ARMLINUX=3Dy=0ACONFIG_USB_EPSON2888=3Dy=0ACONFIG_USB_KC2190=3Dy=0ACONF=
IG_USB_NET_ZAURUS=3Dm=0ACONFIG_USB_NET_CX82310_ETH=3Dm=0ACONFIG_USB_NET_KAL=
MIA=3Dm=0ACONFIG_USB_NET_QMI_WWAN=3Dm=0ACONFIG_USB_HSO=3Dm=0ACONFIG_USB_NET=
_INT51X1=3Dm=0ACONFIG_USB_CDC_PHONET=3Dm=0ACONFIG_USB_IPHETH=3Dm=0ACONFIG_U=
SB_SIERRA_NET=3Dm=0ACONFIG_USB_VL600=3Dm=0ACONFIG_USB_NET_CH9200=3Dm=0ACONF=
IG_USB_NET_AQC111=3Dm=0ACONFIG_USB_RTL8153_ECM=3Dm=0ACONFIG_WLAN=3Dy=0ACONF=
IG_WLAN_VENDOR_ADMTEK=3Dy=0ACONFIG_ADM8211=3Dm=0ACONFIG_ATH_COMMON=3Dm=0ACO=
NFIG_WLAN_VENDOR_ATH=3Dy=0A# CONFIG_ATH_DEBUG is not set=0ACONFIG_ATH5K=3Dm=
=0A# CONFIG_ATH5K_DEBUG is not set=0A# CONFIG_ATH5K_TRACER is not set=0ACON=
FIG_ATH5K_PCI=3Dy=0ACONFIG_ATH9K_HW=3Dm=0ACONFIG_ATH9K_COMMON=3Dm=0ACONFIG_=
ATH9K_BTCOEX_SUPPORT=3Dy=0ACONFIG_ATH9K=3Dm=0ACONFIG_ATH9K_PCI=3Dy=0A# CONF=
IG_ATH9K_AHB is not set=0A# CONFIG_ATH9K_DYNACK is not set=0ACONFIG_ATH9K_W=
OW=3Dy=0ACONFIG_ATH9K_RFKILL=3Dy=0ACONFIG_ATH9K_CHANNEL_CONTEXT=3Dy=0ACONFI=
G_ATH9K_PCOEM=3Dy=0ACONFIG_ATH9K_PCI_NO_EEPROM=3Dm=0ACONFIG_ATH9K_HTC=3Dm=
=0A# CONFIG_ATH9K_HTC_DEBUGFS is not set=0ACONFIG_ATH9K_HWRNG=3Dy=0ACONFIG_=
CARL9170=3Dm=0ACONFIG_CARL9170_LEDS=3Dy=0ACONFIG_CARL9170_WPC=3Dy=0ACONFIG_=
CARL9170_HWRNG=3Dy=0ACONFIG_ATH6KL=3Dm=0ACONFIG_ATH6KL_SDIO=3Dm=0ACONFIG_AT=
H6KL_USB=3Dm=0A# CONFIG_ATH6KL_DEBUG is not set=0A# CONFIG_ATH6KL_TRACING i=
s not set=0ACONFIG_AR5523=3Dm=0ACONFIG_WIL6210=3Dm=0ACONFIG_WIL6210_ISR_COR=
=3Dy=0ACONFIG_WIL6210_TRACING=3Dy=0A# CONFIG_WIL6210_DEBUGFS is not set=0AC=
ONFIG_ATH10K=3Dm=0ACONFIG_ATH10K_CE=3Dy=0ACONFIG_ATH10K_PCI=3Dm=0ACONFIG_AT=
H10K_SDIO=3Dm=0ACONFIG_ATH10K_USB=3Dm=0A# CONFIG_ATH10K_DEBUG is not set=0A=
# CONFIG_ATH10K_DEBUGFS is not set=0ACONFIG_ATH10K_LEDS=3Dy=0A# CONFIG_ATH1=
0K_TRACING is not set=0ACONFIG_WCN36XX=3Dm=0A# CONFIG_WCN36XX_DEBUGFS is no=
t set=0ACONFIG_ATH11K=3Dm=0ACONFIG_ATH11K_PCI=3Dm=0A# CONFIG_ATH11K_DEBUG i=
s not set=0A# CONFIG_ATH11K_TRACING is not set=0ACONFIG_ATH12K=3Dm=0A# CONF=
IG_ATH12K_DEBUG is not set=0A# CONFIG_ATH12K_TRACING is not set=0A# CONFIG_=
ATH12K_COREDUMP is not set=0ACONFIG_WLAN_VENDOR_ATMEL=3Dy=0ACONFIG_AT76C50X=
_USB=3Dm=0ACONFIG_WLAN_VENDOR_BROADCOM=3Dy=0ACONFIG_B43=3Dm=0ACONFIG_B43_BC=
MA=3Dy=0ACONFIG_B43_SSB=3Dy=0ACONFIG_B43_BUSES_BCMA_AND_SSB=3Dy=0A# CONFIG_=
B43_BUSES_BCMA is not set=0A# CONFIG_B43_BUSES_SSB is not set=0ACONFIG_B43_=
PCI_AUTOSELECT=3Dy=0ACONFIG_B43_PCICORE_AUTOSELECT=3Dy=0ACONFIG_B43_SDIO=3D=
y=0ACONFIG_B43_BCMA_PIO=3Dy=0ACONFIG_B43_PIO=3Dy=0ACONFIG_B43_PHY_G=3Dy=0AC=
ONFIG_B43_PHY_N=3Dy=0ACONFIG_B43_PHY_LP=3Dy=0ACONFIG_B43_PHY_HT=3Dy=0ACONFI=
G_B43_LEDS=3Dy=0ACONFIG_B43_HWRNG=3Dy=0A# CONFIG_B43_DEBUG is not set=0ACON=
FIG_B43LEGACY=3Dm=0ACONFIG_B43LEGACY_PCI_AUTOSELECT=3Dy=0ACONFIG_B43LEGACY_=
PCICORE_AUTOSELECT=3Dy=0ACONFIG_B43LEGACY_LEDS=3Dy=0ACONFIG_B43LEGACY_HWRNG=
=3Dy=0A# CONFIG_B43LEGACY_DEBUG is not set=0ACONFIG_B43LEGACY_DMA=3Dy=0ACON=
FIG_B43LEGACY_PIO=3Dy=0ACONFIG_B43LEGACY_DMA_AND_PIO_MODE=3Dy=0A# CONFIG_B4=
3LEGACY_DMA_MODE is not set=0A# CONFIG_B43LEGACY_PIO_MODE is not set=0ACONF=
IG_BRCMUTIL=3Dm=0ACONFIG_BRCMSMAC=3Dm=0ACONFIG_BRCMSMAC_LEDS=3Dy=0ACONFIG_B=
RCMFMAC=3Dm=0ACONFIG_BRCMFMAC_PROTO_BCDC=3Dy=0ACONFIG_BRCMFMAC_PROTO_MSGBUF=
=3Dy=0ACONFIG_BRCMFMAC_SDIO=3Dy=0ACONFIG_BRCMFMAC_USB=3Dy=0ACONFIG_BRCMFMAC=
_PCIE=3Dy=0A# CONFIG_BRCM_TRACING is not set=0A# CONFIG_BRCMDBG is not set=
=0ACONFIG_WLAN_VENDOR_INTEL=3Dy=0ACONFIG_IPW2100=3Dm=0ACONFIG_IPW2100_MONIT=
OR=3Dy=0ACONFIG_IPW2100_DEBUG=3Dy=0ACONFIG_IPW2200=3Dm=0ACONFIG_IPW2200_MON=
ITOR=3Dy=0ACONFIG_IPW2200_RADIOTAP=3Dy=0ACONFIG_IPW2200_PROMISCUOUS=3Dy=0AC=
ONFIG_IPW2200_QOS=3Dy=0ACONFIG_IPW2200_DEBUG=3Dy=0ACONFIG_LIBIPW=3Dm=0ACONF=
IG_LIBIPW_DEBUG=3Dy=0ACONFIG_IWLEGACY=3Dm=0ACONFIG_IWL4965=3Dm=0ACONFIG_IWL=
3945=3Dm=0A=0A#=0A# iwl3945 / iwl4965 Debugging Options=0A#=0A# CONFIG_IWLE=
GACY_DEBUG is not set=0A# end of iwl3945 / iwl4965 Debugging Options=0A=0AC=
ONFIG_IWLWIFI=3Dm=0ACONFIG_IWLWIFI_LEDS=3Dy=0ACONFIG_IWLDVM=3Dm=0ACONFIG_IW=
LMVM=3Dm=0ACONFIG_IWLMLD=3Dm=0ACONFIG_IWLWIFI_OPMODE_MODULAR=3Dy=0A=0A#=0A#=
 Debugging Options=0A#=0ACONFIG_IWLWIFI_DEBUG=3Dy=0A# CONFIG_IWLWIFI_DEVICE=
_TRACING is not set=0A# end of Debugging Options=0A=0ACONFIG_WLAN_VENDOR_IN=
TERSIL=3Dy=0ACONFIG_P54_COMMON=3Dm=0ACONFIG_P54_USB=3Dm=0ACONFIG_P54_PCI=3D=
m=0A# CONFIG_P54_SPI is not set=0ACONFIG_P54_LEDS=3Dy=0ACONFIG_WLAN_VENDOR_=
MARVELL=3Dy=0ACONFIG_LIBERTAS=3Dm=0ACONFIG_LIBERTAS_USB=3Dm=0ACONFIG_LIBERT=
AS_SDIO=3Dm=0A# CONFIG_LIBERTAS_SPI is not set=0A# CONFIG_LIBERTAS_DEBUG is=
 not set=0ACONFIG_LIBERTAS_MESH=3Dy=0ACONFIG_LIBERTAS_THINFIRM=3Dm=0A# CONF=
IG_LIBERTAS_THINFIRM_DEBUG is not set=0ACONFIG_LIBERTAS_THINFIRM_USB=3Dm=0A=
CONFIG_MWIFIEX=3Dm=0ACONFIG_MWIFIEX_SDIO=3Dm=0ACONFIG_MWIFIEX_PCIE=3Dm=0ACO=
NFIG_MWIFIEX_USB=3Dm=0ACONFIG_MWL8K=3Dm=0ACONFIG_WLAN_VENDOR_MEDIATEK=3Dy=
=0ACONFIG_MT7601U=3Dm=0ACONFIG_MT76_CORE=3Dm=0ACONFIG_MT76_LEDS=3Dy=0ACONFI=
G_MT76_USB=3Dm=0ACONFIG_MT76_SDIO=3Dm=0ACONFIG_MT76x02_LIB=3Dm=0ACONFIG_MT7=
6x02_USB=3Dm=0ACONFIG_MT76_CONNAC_LIB=3Dm=0ACONFIG_MT792x_LIB=3Dm=0ACONFIG_=
MT792x_USB=3Dm=0ACONFIG_MT76x0_COMMON=3Dm=0ACONFIG_MT76x0U=3Dm=0ACONFIG_MT7=
6x0E=3Dm=0ACONFIG_MT76x2_COMMON=3Dm=0ACONFIG_MT76x2E=3Dm=0ACONFIG_MT76x2U=
=3Dm=0ACONFIG_MT7603E=3Dm=0ACONFIG_MT7615_COMMON=3Dm=0ACONFIG_MT7615E=3Dm=
=0ACONFIG_MT7663_USB_SDIO_COMMON=3Dm=0ACONFIG_MT7663U=3Dm=0ACONFIG_MT7663S=
=3Dm=0ACONFIG_MT7915E=3Dm=0ACONFIG_MT7921_COMMON=3Dm=0ACONFIG_MT7921E=3Dm=
=0ACONFIG_MT7921S=3Dm=0ACONFIG_MT7921U=3Dm=0ACONFIG_MT7996E=3Dm=0ACONFIG_MT=
7925_COMMON=3Dm=0ACONFIG_MT7925E=3Dm=0ACONFIG_MT7925U=3Dm=0ACONFIG_WLAN_VEN=
DOR_MICROCHIP=3Dy=0A# CONFIG_WILC1000_SDIO is not set=0A# CONFIG_WILC1000_S=
PI is not set=0ACONFIG_WLAN_VENDOR_PURELIFI=3Dy=0ACONFIG_PLFXLC=3Dm=0ACONFI=
G_WLAN_VENDOR_RALINK=3Dy=0ACONFIG_RT2X00=3Dm=0ACONFIG_RT2400PCI=3Dm=0ACONFI=
G_RT2500PCI=3Dm=0ACONFIG_RT61PCI=3Dm=0ACONFIG_RT2800PCI=3Dm=0ACONFIG_RT2800=
PCI_RT33XX=3Dy=0ACONFIG_RT2800PCI_RT35XX=3Dy=0ACONFIG_RT2800PCI_RT53XX=3Dy=
=0ACONFIG_RT2800PCI_RT3290=3Dy=0ACONFIG_RT2500USB=3Dm=0ACONFIG_RT73USB=3Dm=
=0ACONFIG_RT2800USB=3Dm=0ACONFIG_RT2800USB_RT33XX=3Dy=0ACONFIG_RT2800USB_RT=
35XX=3Dy=0ACONFIG_RT2800USB_RT3573=3Dy=0ACONFIG_RT2800USB_RT53XX=3Dy=0ACONF=
IG_RT2800USB_RT55XX=3Dy=0ACONFIG_RT2800USB_UNKNOWN=3Dy=0ACONFIG_RT2800_LIB=
=3Dm=0ACONFIG_RT2800_LIB_MMIO=3Dm=0ACONFIG_RT2X00_LIB_MMIO=3Dm=0ACONFIG_RT2=
X00_LIB_PCI=3Dm=0ACONFIG_RT2X00_LIB_USB=3Dm=0ACONFIG_RT2X00_LIB=3Dm=0ACONFI=
G_RT2X00_LIB_FIRMWARE=3Dy=0ACONFIG_RT2X00_LIB_CRYPTO=3Dy=0ACONFIG_RT2X00_LI=
B_LEDS=3Dy=0A# CONFIG_RT2X00_DEBUG is not set=0ACONFIG_WLAN_VENDOR_REALTEK=
=3Dy=0ACONFIG_RTL8180=3Dm=0ACONFIG_RTL8187=3Dm=0ACONFIG_RTL8187_LEDS=3Dy=0A=
CONFIG_RTL_CARDS=3Dm=0ACONFIG_RTL8192CE=3Dm=0ACONFIG_RTL8192SE=3Dm=0ACONFIG=
_RTL8192DE=3Dm=0ACONFIG_RTL8723AE=3Dm=0ACONFIG_RTL8723BE=3Dm=0ACONFIG_RTL81=
88EE=3Dm=0ACONFIG_RTL8192EE=3Dm=0ACONFIG_RTL8821AE=3Dm=0ACONFIG_RTL8192CU=
=3Dm=0ACONFIG_RTL8192DU=3Dm=0ACONFIG_RTLWIFI=3Dm=0ACONFIG_RTLWIFI_PCI=3Dm=
=0ACONFIG_RTLWIFI_USB=3Dm=0ACONFIG_RTLWIFI_DEBUG=3Dy=0ACONFIG_RTL8192C_COMM=
ON=3Dm=0ACONFIG_RTL8192D_COMMON=3Dm=0ACONFIG_RTL8723_COMMON=3Dm=0ACONFIG_RT=
LBTCOEXIST=3Dm=0ACONFIG_RTL8XXXU=3Dm=0ACONFIG_RTL8XXXU_UNTESTED=3Dy=0ACONFI=
G_RTW88=3Dm=0ACONFIG_RTW88_CORE=3Dm=0ACONFIG_RTW88_PCI=3Dm=0ACONFIG_RTW88_S=
DIO=3Dm=0ACONFIG_RTW88_USB=3Dm=0ACONFIG_RTW88_8822B=3Dm=0ACONFIG_RTW88_8822=
C=3Dm=0ACONFIG_RTW88_8723X=3Dm=0ACONFIG_RTW88_8703B=3Dm=0ACONFIG_RTW88_8723=
D=3Dm=0ACONFIG_RTW88_8821C=3Dm=0ACONFIG_RTW88_88XXA=3Dm=0ACONFIG_RTW88_8821=
A=3Dm=0ACONFIG_RTW88_8812A=3Dm=0ACONFIG_RTW88_8814A=3Dm=0ACONFIG_RTW88_8822=
BE=3Dm=0ACONFIG_RTW88_8822BS=3Dm=0ACONFIG_RTW88_8822BU=3Dm=0ACONFIG_RTW88_8=
822CE=3Dm=0ACONFIG_RTW88_8822CS=3Dm=0ACONFIG_RTW88_8822CU=3Dm=0ACONFIG_RTW8=
8_8723DE=3Dm=0ACONFIG_RTW88_8723DS=3Dm=0ACONFIG_RTW88_8723CS=3Dm=0ACONFIG_R=
TW88_8723DU=3Dm=0ACONFIG_RTW88_8821CE=3Dm=0ACONFIG_RTW88_8821CS=3Dm=0ACONFI=
G_RTW88_8821CU=3Dm=0ACONFIG_RTW88_8821AU=3Dm=0ACONFIG_RTW88_8812AU=3Dm=0ACO=
NFIG_RTW88_8814AE=3Dm=0ACONFIG_RTW88_8814AU=3Dm=0A# CONFIG_RTW88_DEBUG is n=
ot set=0A# CONFIG_RTW88_DEBUGFS is not set=0ACONFIG_RTW88_LEDS=3Dy=0ACONFIG=
_RTW89=3Dm=0ACONFIG_RTW89_CORE=3Dm=0ACONFIG_RTW89_PCI=3Dm=0ACONFIG_RTW89_US=
B=3Dm=0ACONFIG_RTW89_8851B=3Dm=0ACONFIG_RTW89_8852A=3Dm=0ACONFIG_RTW89_8852=
B_COMMON=3Dm=0ACONFIG_RTW89_8852B=3Dm=0ACONFIG_RTW89_8852BT=3Dm=0ACONFIG_RT=
W89_8852C=3Dm=0ACONFIG_RTW89_8922A=3Dm=0ACONFIG_RTW89_8851BE=3Dm=0ACONFIG_R=
TW89_8851BU=3Dm=0ACONFIG_RTW89_8852AE=3Dm=0ACONFIG_RTW89_8852AU=3Dm=0ACONFI=
G_RTW89_8852BE=3Dm=0ACONFIG_RTW89_8852BU=3Dm=0ACONFIG_RTW89_8852BTE=3Dm=0AC=
ONFIG_RTW89_8852CE=3Dm=0ACONFIG_RTW89_8852CU=3Dm=0ACONFIG_RTW89_8922AE=3Dm=
=0A# CONFIG_RTW89_DEBUGMSG is not set=0ACONFIG_WLAN_VENDOR_RSI=3Dy=0ACONFIG=
_RSI_91X=3Dm=0A# CONFIG_RSI_DEBUGFS is not set=0ACONFIG_RSI_SDIO=3Dm=0ACONF=
IG_RSI_USB=3Dm=0ACONFIG_RSI_COEX=3Dy=0ACONFIG_WLAN_VENDOR_SILABS=3Dy=0ACONF=
IG_WFX=3Dm=0ACONFIG_WLAN_VENDOR_ST=3Dy=0ACONFIG_CW1200=3Dm=0ACONFIG_CW1200_=
WLAN_SDIO=3Dm=0A# CONFIG_CW1200_WLAN_SPI is not set=0ACONFIG_WLAN_VENDOR_TI=
=3Dy=0ACONFIG_WL1251=3Dm=0A# CONFIG_WL1251_SPI is not set=0ACONFIG_WL1251_S=
DIO=3Dm=0ACONFIG_WL12XX=3Dm=0ACONFIG_WL18XX=3Dm=0ACONFIG_WLCORE=3Dm=0ACONFI=
G_WLCORE_SDIO=3Dm=0ACONFIG_WLAN_VENDOR_ZYDAS=3Dy=0ACONFIG_ZD1211RW=3Dm=0A# =
CONFIG_ZD1211RW_DEBUG is not set=0ACONFIG_WLAN_VENDOR_QUANTENNA=3Dy=0ACONFI=
G_QTNFMAC=3Dm=0ACONFIG_QTNFMAC_PCIE=3Dm=0ACONFIG_MAC80211_HWSIM=3Dm=0ACONFI=
G_VIRT_WIFI=3Dm=0ACONFIG_WAN=3Dy=0ACONFIG_HDLC=3Dm=0ACONFIG_HDLC_RAW=3Dm=0A=
CONFIG_HDLC_RAW_ETH=3Dm=0ACONFIG_HDLC_CISCO=3Dm=0ACONFIG_HDLC_FR=3Dm=0ACONF=
IG_HDLC_PPP=3Dm=0ACONFIG_HDLC_X25=3Dm=0ACONFIG_FRAMER=3Dm=0ACONFIG_PCI200SY=
N=3Dm=0ACONFIG_WANXL=3Dm=0ACONFIG_PC300TOO=3Dm=0ACONFIG_FARSYNC=3Dm=0ACONFI=
G_LAPBETHER=3Dm=0ACONFIG_IEEE802154_DRIVERS=3Dm=0ACONFIG_IEEE802154_FAKELB=
=3Dm=0A# CONFIG_IEEE802154_AT86RF230 is not set=0A# CONFIG_IEEE802154_MRF24=
J40 is not set=0A# CONFIG_IEEE802154_CC2520 is not set=0A# CONFIG_IEEE80215=
4_ATUSB is not set=0ACONFIG_IEEE802154_ADF7242=3Dm=0ACONFIG_IEEE802154_CA82=
10=3Dm=0A# CONFIG_IEEE802154_CA8210_DEBUGFS is not set=0ACONFIG_IEEE802154_=
MCR20A=3Dm=0ACONFIG_IEEE802154_HWSIM=3Dm=0A=0A#=0A# Wireless WAN=0A#=0ACONF=
IG_WWAN=3Dy=0A# CONFIG_WWAN_DEBUGFS is not set=0ACONFIG_WWAN_HWSIM=3Dm=0ACO=
NFIG_MHI_WWAN_CTRL=3Dm=0ACONFIG_MHI_WWAN_MBIM=3Dm=0ACONFIG_RPMSG_WWAN_CTRL=
=3Dm=0ACONFIG_IOSM=3Dm=0ACONFIG_MTK_T7XX=3Dm=0A# end of Wireless WAN=0A=0AC=
ONFIG_XEN_NETDEV_FRONTEND=3Dm=0ACONFIG_XEN_NETDEV_BACKEND=3Dm=0ACONFIG_VMXN=
ET3=3Dm=0ACONFIG_FUJITSU_ES=3Dm=0ACONFIG_USB4_NET=3Dm=0ACONFIG_HYPERV_NET=
=3Dm=0ACONFIG_NETDEVSIM=3Dm=0ACONFIG_NET_FAILOVER=3Dm=0A# CONFIG_ISDN is no=
t set=0A=0A#=0A# Input device support=0A#=0ACONFIG_INPUT=3Dy=0ACONFIG_INPUT=
_LEDS=3Dy=0ACONFIG_INPUT_FF_MEMLESS=3Dm=0ACONFIG_INPUT_SPARSEKMAP=3Dm=0ACON=
FIG_INPUT_MATRIXKMAP=3Dm=0ACONFIG_INPUT_VIVALDIFMAP=3Dy=0A=0A#=0A# Userland=
 interfaces=0A#=0ACONFIG_INPUT_MOUSEDEV=3Dy=0ACONFIG_INPUT_MOUSEDEV_PSAUX=
=3Dy=0ACONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024=0ACONFIG_INPUT_MOUSEDEV_SCREEN=
_Y=3D768=0ACONFIG_INPUT_JOYDEV=3Dm=0ACONFIG_INPUT_EVDEV=3Dy=0A=0A#=0A# Inpu=
t Device Drivers=0A#=0ACONFIG_INPUT_KEYBOARD=3Dy=0A# CONFIG_KEYBOARD_ADC is=
 not set=0ACONFIG_KEYBOARD_ADP5588=3Dm=0ACONFIG_KEYBOARD_APPLESPI=3Dm=0ACON=
FIG_KEYBOARD_ATKBD=3Dy=0ACONFIG_KEYBOARD_QT1050=3Dm=0ACONFIG_KEYBOARD_QT107=
0=3Dm=0ACONFIG_KEYBOARD_QT2160=3Dm=0A# CONFIG_KEYBOARD_DLINK_DIR685 is not =
set=0A# CONFIG_KEYBOARD_LKKBD is not set=0ACONFIG_KEYBOARD_GPIO=3Dm=0ACONFI=
G_KEYBOARD_GPIO_POLLED=3Dm=0ACONFIG_KEYBOARD_TCA8418=3Dm=0ACONFIG_KEYBOARD_=
MATRIX=3Dm=0ACONFIG_KEYBOARD_LM8323=3Dm=0ACONFIG_KEYBOARD_LM8333=3Dm=0ACONF=
IG_KEYBOARD_MAX7359=3Dm=0ACONFIG_KEYBOARD_MPR121=3Dm=0ACONFIG_KEYBOARD_NEWT=
ON=3Dm=0ACONFIG_KEYBOARD_OPENCORES=3Dm=0ACONFIG_KEYBOARD_PINEPHONE=3Dm=0A# =
CONFIG_KEYBOARD_SAMSUNG is not set=0A# CONFIG_KEYBOARD_STOWAWAY is not set=
=0ACONFIG_KEYBOARD_SUNKBD=3Dm=0ACONFIG_KEYBOARD_IQS62X=3Dm=0A# CONFIG_KEYBO=
ARD_TM2_TOUCHKEY is not set=0ACONFIG_KEYBOARD_XTKBD=3Dm=0ACONFIG_KEYBOARD_C=
ROS_EC=3Dm=0ACONFIG_KEYBOARD_CYPRESS_SF=3Dm=0ACONFIG_INPUT_MOUSE=3Dy=0ACONF=
IG_MOUSE_PS2=3Dy=0ACONFIG_MOUSE_PS2_ALPS=3Dy=0ACONFIG_MOUSE_PS2_BYD=3Dy=0AC=
ONFIG_MOUSE_PS2_LOGIPS2PP=3Dy=0ACONFIG_MOUSE_PS2_SYNAPTICS=3Dy=0ACONFIG_MOU=
SE_PS2_SYNAPTICS_SMBUS=3Dy=0ACONFIG_MOUSE_PS2_CYPRESS=3Dy=0ACONFIG_MOUSE_PS=
2_LIFEBOOK=3Dy=0ACONFIG_MOUSE_PS2_TRACKPOINT=3Dy=0ACONFIG_MOUSE_PS2_ELANTEC=
H=3Dy=0ACONFIG_MOUSE_PS2_ELANTECH_SMBUS=3Dy=0ACONFIG_MOUSE_PS2_SENTELIC=3Dy=
=0ACONFIG_MOUSE_PS2_TOUCHKIT=3Dy=0ACONFIG_MOUSE_PS2_FOCALTECH=3Dy=0ACONFIG_=
MOUSE_PS2_VMMOUSE=3Dy=0ACONFIG_MOUSE_PS2_SMBUS=3Dy=0ACONFIG_MOUSE_SERIAL=3D=
m=0ACONFIG_MOUSE_APPLETOUCH=3Dm=0ACONFIG_MOUSE_BCM5974=3Dm=0ACONFIG_MOUSE_C=
YAPA=3Dm=0ACONFIG_MOUSE_ELAN_I2C=3Dm=0ACONFIG_MOUSE_ELAN_I2C_I2C=3Dy=0ACONF=
IG_MOUSE_ELAN_I2C_SMBUS=3Dy=0ACONFIG_MOUSE_VSXXXAA=3Dm=0ACONFIG_MOUSE_GPIO=
=3Dm=0ACONFIG_MOUSE_SYNAPTICS_I2C=3Dm=0ACONFIG_MOUSE_SYNAPTICS_USB=3Dm=0ACO=
NFIG_INPUT_JOYSTICK=3Dy=0A# CONFIG_JOYSTICK_ANALOG is not set=0A# CONFIG_JO=
YSTICK_A3D is not set=0ACONFIG_JOYSTICK_ADC=3Dm=0A# CONFIG_JOYSTICK_ADI is =
not set=0A# CONFIG_JOYSTICK_COBRA is not set=0A# CONFIG_JOYSTICK_GF2K is no=
t set=0A# CONFIG_JOYSTICK_GRIP is not set=0A# CONFIG_JOYSTICK_GRIP_MP is no=
t set=0A# CONFIG_JOYSTICK_GUILLEMOT is not set=0A# CONFIG_JOYSTICK_INTERACT=
 is not set=0A# CONFIG_JOYSTICK_SIDEWINDER is not set=0A# CONFIG_JOYSTICK_T=
MDC is not set=0ACONFIG_JOYSTICK_IFORCE=3Dm=0ACONFIG_JOYSTICK_IFORCE_USB=3D=
m=0ACONFIG_JOYSTICK_IFORCE_232=3Dm=0ACONFIG_JOYSTICK_WARRIOR=3Dm=0ACONFIG_J=
OYSTICK_MAGELLAN=3Dm=0ACONFIG_JOYSTICK_SPACEORB=3Dm=0ACONFIG_JOYSTICK_SPACE=
BALL=3Dm=0ACONFIG_JOYSTICK_STINGER=3Dm=0ACONFIG_JOYSTICK_TWIDJOY=3Dm=0ACONF=
IG_JOYSTICK_ZHENHUA=3Dm=0ACONFIG_JOYSTICK_DB9=3Dm=0ACONFIG_JOYSTICK_GAMECON=
=3Dm=0ACONFIG_JOYSTICK_TURBOGRAFX=3Dm=0ACONFIG_JOYSTICK_AS5011=3Dm=0A# CONF=
IG_JOYSTICK_JOYDUMP is not set=0ACONFIG_JOYSTICK_XPAD=3Dm=0ACONFIG_JOYSTICK=
_XPAD_FF=3Dy=0ACONFIG_JOYSTICK_XPAD_LEDS=3Dy=0ACONFIG_JOYSTICK_WALKERA0701=
=3Dm=0ACONFIG_JOYSTICK_PSXPAD_SPI=3Dm=0ACONFIG_JOYSTICK_PSXPAD_SPI_FF=3Dy=
=0ACONFIG_JOYSTICK_PXRC=3Dm=0ACONFIG_JOYSTICK_QWIIC=3Dm=0ACONFIG_JOYSTICK_F=
SIA6B=3Dm=0ACONFIG_JOYSTICK_SENSEHAT=3Dm=0ACONFIG_JOYSTICK_SEESAW=3Dm=0ACON=
FIG_INPUT_TABLET=3Dy=0ACONFIG_TABLET_USB_ACECAD=3Dm=0ACONFIG_TABLET_USB_AIP=
TEK=3Dm=0ACONFIG_TABLET_USB_HANWANG=3Dm=0ACONFIG_TABLET_USB_KBTAB=3Dm=0ACON=
FIG_TABLET_USB_PEGASUS=3Dm=0ACONFIG_TABLET_SERIAL_WACOM4=3Dm=0ACONFIG_INPUT=
_TOUCHSCREEN=3Dy=0A# CONFIG_TOUCHSCREEN_ADS7846 is not set=0A# CONFIG_TOUCH=
SCREEN_AD7877 is not set=0ACONFIG_TOUCHSCREEN_AD7879=3Dm=0ACONFIG_TOUCHSCRE=
EN_AD7879_I2C=3Dm=0A# CONFIG_TOUCHSCREEN_AD7879_SPI is not set=0ACONFIG_TOU=
CHSCREEN_ADC=3Dm=0ACONFIG_TOUCHSCREEN_ATMEL_MXT=3Dm=0A# CONFIG_TOUCHSCREEN_=
ATMEL_MXT_T37 is not set=0ACONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dm=0ACONFIG_TOUCH=
SCREEN_BU21013=3Dm=0ACONFIG_TOUCHSCREEN_BU21029=3Dm=0ACONFIG_TOUCHSCREEN_CH=
IPONE_ICN8505=3Dm=0ACONFIG_TOUCHSCREEN_CY8CTMA140=3Dm=0ACONFIG_TOUCHSCREEN_=
CY8CTMG110=3Dm=0ACONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dm=0ACONFIG_TOUCHSCREEN_CY=
TTSP_I2C=3Dm=0A# CONFIG_TOUCHSCREEN_CYTTSP_SPI is not set=0ACONFIG_TOUCHSCR=
EEN_CYTTSP5=3Dm=0ACONFIG_TOUCHSCREEN_DYNAPRO=3Dm=0ACONFIG_TOUCHSCREEN_HAMPS=
HIRE=3Dm=0ACONFIG_TOUCHSCREEN_EETI=3Dm=0ACONFIG_TOUCHSCREEN_EGALAX_SERIAL=
=3Dm=0ACONFIG_TOUCHSCREEN_EXC3000=3Dm=0ACONFIG_TOUCHSCREEN_FUJITSU=3Dm=0ACO=
NFIG_TOUCHSCREEN_GOODIX=3Dm=0ACONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE=3Dm=0AC=
ONFIG_TOUCHSCREEN_GOODIX_BERLIN_I2C=3Dm=0ACONFIG_TOUCHSCREEN_GOODIX_BERLIN_=
SPI=3Dm=0ACONFIG_TOUCHSCREEN_HIDEEP=3Dm=0ACONFIG_TOUCHSCREEN_HIMAX_HX852X=
=3Dm=0ACONFIG_TOUCHSCREEN_HYCON_HY46XX=3Dm=0ACONFIG_TOUCHSCREEN_HYNITRON_CS=
TXXX=3Dm=0ACONFIG_TOUCHSCREEN_HYNITRON_CST816X=3Dm=0ACONFIG_TOUCHSCREEN_ILI=
210X=3Dm=0ACONFIG_TOUCHSCREEN_ILITEK=3Dm=0ACONFIG_TOUCHSCREEN_S6SY761=3Dm=
=0ACONFIG_TOUCHSCREEN_GUNZE=3Dm=0ACONFIG_TOUCHSCREEN_EKTF2127=3Dm=0ACONFIG_=
TOUCHSCREEN_ELAN=3Dm=0ACONFIG_TOUCHSCREEN_ELO=3Dm=0ACONFIG_TOUCHSCREEN_WACO=
M_W8001=3Dm=0ACONFIG_TOUCHSCREEN_WACOM_I2C=3Dm=0ACONFIG_TOUCHSCREEN_MAX1180=
1=3Dm=0ACONFIG_TOUCHSCREEN_MMS114=3Dm=0ACONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dm=
=0ACONFIG_TOUCHSCREEN_MSG2638=3Dm=0ACONFIG_TOUCHSCREEN_MTOUCH=3Dm=0ACONFIG_=
TOUCHSCREEN_NOVATEK_NVT_TS=3Dm=0ACONFIG_TOUCHSCREEN_IMAGIS=3Dm=0ACONFIG_TOU=
CHSCREEN_INEXIO=3Dm=0ACONFIG_TOUCHSCREEN_PENMOUNT=3Dm=0ACONFIG_TOUCHSCREEN_=
EDT_FT5X06=3Dm=0ACONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dm=0ACONFIG_TOUCHSCREEN_TOU=
CHWIN=3Dm=0ACONFIG_TOUCHSCREEN_PIXCIR=3Dm=0ACONFIG_TOUCHSCREEN_WDT87XX_I2C=
=3Dm=0ACONFIG_TOUCHSCREEN_WM97XX=3Dm=0ACONFIG_TOUCHSCREEN_WM9705=3Dy=0ACONF=
IG_TOUCHSCREEN_WM9712=3Dy=0ACONFIG_TOUCHSCREEN_WM9713=3Dy=0ACONFIG_TOUCHSCR=
EEN_USB_COMPOSITE=3Dm=0ACONFIG_TOUCHSCREEN_USB_EGALAX=3Dy=0ACONFIG_TOUCHSCR=
EEN_USB_PANJIT=3Dy=0ACONFIG_TOUCHSCREEN_USB_3M=3Dy=0ACONFIG_TOUCHSCREEN_USB=
_ITM=3Dy=0ACONFIG_TOUCHSCREEN_USB_ETURBO=3Dy=0ACONFIG_TOUCHSCREEN_USB_GUNZE=
=3Dy=0ACONFIG_TOUCHSCREEN_USB_DMC_TSC10=3Dy=0ACONFIG_TOUCHSCREEN_USB_IRTOUC=
H=3Dy=0ACONFIG_TOUCHSCREEN_USB_IDEALTEK=3Dy=0ACONFIG_TOUCHSCREEN_USB_GENERA=
L_TOUCH=3Dy=0ACONFIG_TOUCHSCREEN_USB_GOTOP=3Dy=0ACONFIG_TOUCHSCREEN_USB_JAS=
TEC=3Dy=0ACONFIG_TOUCHSCREEN_USB_ELO=3Dy=0ACONFIG_TOUCHSCREEN_USB_E2I=3Dy=
=0ACONFIG_TOUCHSCREEN_USB_ZYTRONIC=3Dy=0ACONFIG_TOUCHSCREEN_USB_ETT_TC45USB=
=3Dy=0ACONFIG_TOUCHSCREEN_USB_NEXIO=3Dy=0ACONFIG_TOUCHSCREEN_USB_EASYTOUCH=
=3Dy=0ACONFIG_TOUCHSCREEN_TOUCHIT213=3Dm=0ACONFIG_TOUCHSCREEN_TSC_SERIO=3Dm=
=0ACONFIG_TOUCHSCREEN_TSC200X_CORE=3Dm=0ACONFIG_TOUCHSCREEN_TSC2004=3Dm=0A#=
 CONFIG_TOUCHSCREEN_TSC2005 is not set=0ACONFIG_TOUCHSCREEN_TSC2007=3Dm=0AC=
ONFIG_TOUCHSCREEN_TSC2007_IIO=3Dy=0ACONFIG_TOUCHSCREEN_RM_TS=3Dm=0ACONFIG_T=
OUCHSCREEN_SILEAD=3Dm=0ACONFIG_TOUCHSCREEN_SIS_I2C=3Dm=0ACONFIG_TOUCHSCREEN=
_ST1232=3Dm=0A# CONFIG_TOUCHSCREEN_STMFTS is not set=0ACONFIG_TOUCHSCREEN_S=
UR40=3Dm=0ACONFIG_TOUCHSCREEN_SURFACE3_SPI=3Dm=0ACONFIG_TOUCHSCREEN_SX8654=
=3Dm=0ACONFIG_TOUCHSCREEN_TPS6507X=3Dm=0ACONFIG_TOUCHSCREEN_ZET6223=3Dm=0AC=
ONFIG_TOUCHSCREEN_ZFORCE=3Dm=0ACONFIG_TOUCHSCREEN_COLIBRI_VF50=3Dm=0ACONFIG=
_TOUCHSCREEN_ROHM_BU21023=3Dm=0ACONFIG_TOUCHSCREEN_IQS5XX=3Dm=0ACONFIG_TOUC=
HSCREEN_IQS7211=3Dm=0ACONFIG_TOUCHSCREEN_ZINITIX=3Dm=0ACONFIG_TOUCHSCREEN_H=
IMAX_HX83112B=3Dm=0ACONFIG_INPUT_MISC=3Dy=0ACONFIG_INPUT_AD714X=3Dm=0ACONFI=
G_INPUT_AD714X_I2C=3Dm=0A# CONFIG_INPUT_AD714X_SPI is not set=0ACONFIG_INPU=
T_AW86927=3Dm=0ACONFIG_INPUT_BMA150=3Dm=0A# CONFIG_INPUT_E3X0_BUTTON is not=
 set=0ACONFIG_INPUT_PCSPKR=3Dm=0ACONFIG_INPUT_MMA8450=3Dm=0ACONFIG_INPUT_AP=
ANEL=3Dm=0A# CONFIG_INPUT_GPIO_BEEPER is not set=0ACONFIG_INPUT_GPIO_DECODE=
R=3Dm=0A# CONFIG_INPUT_GPIO_VIBRA is not set=0ACONFIG_INPUT_ATLAS_BTNS=3Dm=
=0ACONFIG_INPUT_ATI_REMOTE2=3Dm=0ACONFIG_INPUT_KEYSPAN_REMOTE=3Dm=0ACONFIG_=
INPUT_KXTJ9=3Dm=0ACONFIG_INPUT_POWERMATE=3Dm=0ACONFIG_INPUT_YEALINK=3Dm=0AC=
ONFIG_INPUT_CM109=3Dm=0ACONFIG_INPUT_REGULATOR_HAPTIC=3Dm=0ACONFIG_INPUT_TP=
S6594_PWRBUTTON=3Dm=0ACONFIG_INPUT_AXP20X_PEK=3Dm=0ACONFIG_INPUT_UINPUT=3Dm=
=0ACONFIG_INPUT_PCF8574=3Dm=0ACONFIG_INPUT_PWM_BEEPER=3Dm=0ACONFIG_INPUT_PW=
M_VIBRA=3Dm=0ACONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dm=0ACONFIG_INPUT_DA7280_HA=
PTICS=3Dm=0ACONFIG_INPUT_DA9063_ONKEY=3Dm=0ACONFIG_INPUT_ADXL34X=3Dm=0ACONF=
IG_INPUT_ADXL34X_I2C=3Dm=0A# CONFIG_INPUT_ADXL34X_SPI is not set=0ACONFIG_I=
NPUT_IBM_PANEL=3Dm=0ACONFIG_INPUT_IMS_PCU=3Dm=0ACONFIG_INPUT_IQS269A=3Dm=0A=
CONFIG_INPUT_IQS626A=3Dm=0ACONFIG_INPUT_IQS7222=3Dm=0ACONFIG_INPUT_CMA3000=
=3Dm=0ACONFIG_INPUT_CMA3000_I2C=3Dm=0ACONFIG_INPUT_XEN_KBDDEV_FRONTEND=3Dm=
=0ACONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dm=0ACONFIG_INPUT_SOC_BUTTON_ARRAY=3Dm=0A=
CONFIG_INPUT_DRV260X_HAPTICS=3Dm=0ACONFIG_INPUT_DRV2665_HAPTICS=3Dm=0ACONFI=
G_INPUT_DRV2667_HAPTICS=3Dm=0ACONFIG_RMI4_CORE=3Dm=0ACONFIG_RMI4_I2C=3Dm=0A=
CONFIG_RMI4_SPI=3Dm=0ACONFIG_RMI4_SMB=3Dm=0ACONFIG_RMI4_F03=3Dy=0ACONFIG_RM=
I4_F03_SERIO=3Dm=0ACONFIG_RMI4_2D_SENSOR=3Dy=0ACONFIG_RMI4_F11=3Dy=0ACONFIG=
_RMI4_F12=3Dy=0ACONFIG_RMI4_F1A=3Dy=0ACONFIG_RMI4_F21=3Dy=0ACONFIG_RMI4_F30=
=3Dy=0ACONFIG_RMI4_F34=3Dy=0ACONFIG_RMI4_F3A=3Dy=0ACONFIG_RMI4_F54=3Dy=0ACO=
NFIG_RMI4_F55=3Dy=0A=0A#=0A# Hardware I/O ports=0A#=0ACONFIG_SERIO=3Dy=0ACO=
NFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy=0ACONFIG_SERIO_I8042=3Dy=0ACONFIG_SERIO_S=
ERPORT=3Dm=0ACONFIG_SERIO_CT82C710=3Dm=0ACONFIG_SERIO_PARKBD=3Dm=0ACONFIG_S=
ERIO_PCIPS2=3Dm=0ACONFIG_SERIO_LIBPS2=3Dy=0ACONFIG_SERIO_RAW=3Dm=0ACONFIG_S=
ERIO_ALTERA_PS2=3Dm=0ACONFIG_SERIO_PS2MULT=3Dm=0A# CONFIG_SERIO_ARC_PS2 is =
not set=0ACONFIG_HYPERV_KEYBOARD=3Dm=0ACONFIG_SERIO_GPIO_PS2=3Dm=0ACONFIG_U=
SERIO=3Dm=0A# CONFIG_GAMEPORT is not set=0A# end of Hardware I/O ports=0A# =
end of Input device support=0A=0A#=0A# Character devices=0A#=0ACONFIG_TTY=
=3Dy=0ACONFIG_VT=3Dy=0ACONFIG_CONSOLE_TRANSLATIONS=3Dy=0ACONFIG_VT_CONSOLE=
=3Dy=0ACONFIG_VT_CONSOLE_SLEEP=3Dy=0ACONFIG_VT_HW_CONSOLE_BINDING=3Dy=0ACON=
FIG_UNIX98_PTYS=3Dy=0A# CONFIG_LEGACY_PTYS is not set=0A# CONFIG_LEGACY_TIO=
CSTI is not set=0ACONFIG_LDISC_AUTOLOAD=3Dy=0A=0A#=0A# Serial drivers=0A#=
=0ACONFIG_SERIAL_EARLYCON=3Dy=0ACONFIG_SERIAL_8250=3Dy=0ACONFIG_SERIAL_8250=
_PNP=3Dy=0A# CONFIG_SERIAL_8250_16550A_VARIANTS is not set=0ACONFIG_SERIAL_=
8250_FINTEK=3Dy=0ACONFIG_SERIAL_8250_CONSOLE=3Dy=0ACONFIG_SERIAL_8250_DMA=
=3Dy=0ACONFIG_SERIAL_8250_PCILIB=3Dy=0ACONFIG_SERIAL_8250_PCI=3Dy=0ACONFIG_=
SERIAL_8250_EXAR=3Dy=0ACONFIG_SERIAL_8250_CS=3Dm=0ACONFIG_SERIAL_8250_NR_UA=
RTS=3D32=0ACONFIG_SERIAL_8250_RUNTIME_UARTS=3D32=0ACONFIG_SERIAL_8250_EXTEN=
DED=3Dy=0ACONFIG_SERIAL_8250_MANY_PORTS=3Dy=0ACONFIG_SERIAL_8250_PCI1XXXX=
=3Dy=0ACONFIG_SERIAL_8250_SHARE_IRQ=3Dy=0A# CONFIG_SERIAL_8250_DETECT_IRQ i=
s not set=0ACONFIG_SERIAL_8250_RSA=3Dy=0ACONFIG_SERIAL_8250_DWLIB=3Dy=0ACON=
FIG_SERIAL_8250_DFL=3Dm=0ACONFIG_SERIAL_8250_DW=3Dy=0ACONFIG_SERIAL_8250_KE=
BA=3Dm=0ACONFIG_SERIAL_8250_RT288X=3Dy=0ACONFIG_SERIAL_8250_LPSS=3Dy=0ACONF=
IG_SERIAL_8250_MID=3Dy=0ACONFIG_SERIAL_8250_PERICOM=3Dy=0ACONFIG_SERIAL_825=
0_NI=3Dy=0A=0A#=0A# Non-8250 serial port support=0A#=0A# CONFIG_SERIAL_MAX3=
100 is not set=0A# CONFIG_SERIAL_MAX310X is not set=0A# CONFIG_SERIAL_UARTL=
ITE is not set=0ACONFIG_SERIAL_CORE=3Dy=0ACONFIG_SERIAL_CORE_CONSOLE=3Dy=0A=
CONFIG_CONSOLE_POLL=3Dy=0ACONFIG_SERIAL_JSM=3Dm=0ACONFIG_SERIAL_LANTIQ=3Dm=
=0A# CONFIG_SERIAL_SCCNXP is not set=0ACONFIG_SERIAL_SC16IS7XX=3Dm=0ACONFIG=
_SERIAL_SC16IS7XX_I2C=3Dm=0ACONFIG_SERIAL_SC16IS7XX_SPI=3Dm=0ACONFIG_SERIAL=
_ALTERA_JTAGUART=3Dm=0ACONFIG_SERIAL_ALTERA_UART=3Dm=0ACONFIG_SERIAL_ALTERA=
_UART_MAXPORTS=3D4=0ACONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200=0A# CONFIG=
_SERIAL_ARC is not set=0ACONFIG_SERIAL_RP2=3Dm=0ACONFIG_SERIAL_RP2_NR_UARTS=
=3D32=0ACONFIG_SERIAL_FSL_LPUART=3Dm=0ACONFIG_SERIAL_FSL_LINFLEXUART=3Dm=0A=
CONFIG_SERIAL_SPRD=3Dm=0A# end of Serial drivers=0A=0ACONFIG_SERIAL_MCTRL_G=
PIO=3Dy=0ACONFIG_SERIAL_NONSTANDARD=3Dy=0A# CONFIG_MOXA_INTELLIO is not set=
=0ACONFIG_MOXA_SMARTIO=3Dm=0ACONFIG_N_HDLC=3Dm=0ACONFIG_IPWIRELESS=3Dm=0A# =
CONFIG_N_GSM is not set=0ACONFIG_NOZOMI=3Dm=0ACONFIG_NULL_TTY=3Dm=0ACONFIG_=
HVC_DRIVER=3Dy=0ACONFIG_HVC_IRQ=3Dy=0ACONFIG_HVC_XEN=3Dy=0ACONFIG_HVC_XEN_F=
RONTEND=3Dy=0ACONFIG_RPMSG_TTY=3Dm=0ACONFIG_SERIAL_DEV_BUS=3Dy=0ACONFIG_SER=
IAL_DEV_CTRL_TTYPORT=3Dy=0A# CONFIG_TTY_PRINTK is not set=0ACONFIG_PRINTER=
=3Dm=0A# CONFIG_LP_CONSOLE is not set=0ACONFIG_PPDEV=3Dm=0ACONFIG_VIRTIO_CO=
NSOLE=3Dy=0ACONFIG_IPMI_HANDLER=3Dm=0ACONFIG_IPMI_DMI_DECODE=3Dy=0ACONFIG_I=
PMI_PLAT_DATA=3Dy=0ACONFIG_IPMI_PANIC_EVENT=3Dy=0A# CONFIG_IPMI_PANIC_STRIN=
G is not set=0ACONFIG_IPMI_DEVICE_INTERFACE=3Dm=0ACONFIG_IPMI_SI=3Dm=0ACONF=
IG_IPMI_SSIF=3Dm=0ACONFIG_IPMI_IPMB=3Dm=0ACONFIG_IPMI_WATCHDOG=3Dm=0ACONFIG=
_IPMI_POWEROFF=3Dm=0ACONFIG_SSIF_IPMI_BMC=3Dm=0ACONFIG_IPMB_DEVICE_INTERFAC=
E=3Dm=0ACONFIG_HW_RANDOM=3Dy=0A# CONFIG_HW_RANDOM_TIMERIOMEM is not set=0AC=
ONFIG_HW_RANDOM_INTEL=3Dm=0ACONFIG_HW_RANDOM_AMD=3Dm=0ACONFIG_HW_RANDOM_BA4=
31=3Dm=0ACONFIG_HW_RANDOM_VIA=3Dm=0ACONFIG_HW_RANDOM_VIRTIO=3Dm=0ACONFIG_HW=
_RANDOM_XIPHERA=3Dm=0ACONFIG_APPLICOM=3Dm=0ACONFIG_MWAVE=3Dm=0ACONFIG_DEVME=
M=3Dy=0ACONFIG_NVRAM=3Dy=0ACONFIG_DEVPORT=3Dy=0ACONFIG_HPET=3Dy=0ACONFIG_HP=
ET_MMAP=3Dy=0ACONFIG_HPET_MMAP_DEFAULT=3Dy=0ACONFIG_HANGCHECK_TIMER=3Dm=0AC=
ONFIG_UV_MMTIMER=3Dm=0ACONFIG_TCG_TPM=3Dy=0ACONFIG_TCG_TPM2_HMAC=3Dy=0ACONF=
IG_HW_RANDOM_TPM=3Dy=0ACONFIG_TCG_TIS_CORE=3Dy=0ACONFIG_TCG_TIS=3Dy=0ACONFI=
G_TCG_TIS_SPI=3Dm=0ACONFIG_TCG_TIS_SPI_CR50=3Dy=0ACONFIG_TCG_TIS_I2C=3Dm=0A=
CONFIG_TCG_TIS_I2C_CR50=3Dm=0ACONFIG_TCG_TIS_I2C_ATMEL=3Dm=0ACONFIG_TCG_TIS=
_I2C_INFINEON=3Dm=0ACONFIG_TCG_TIS_I2C_NUVOTON=3Dm=0ACONFIG_TCG_NSC=3Dm=0AC=
ONFIG_TCG_ATMEL=3Dm=0ACONFIG_TCG_INFINEON=3Dm=0ACONFIG_TCG_XEN=3Dm=0ACONFIG=
_TCG_CRB=3Dy=0ACONFIG_TCG_VTPM_PROXY=3Dm=0ACONFIG_TCG_SVSM=3Dm=0ACONFIG_TCG=
_TIS_ST33ZP24=3Dm=0ACONFIG_TCG_TIS_ST33ZP24_I2C=3Dm=0ACONFIG_TCG_TIS_ST33ZP=
24_SPI=3Dm=0ACONFIG_TELCLOCK=3Dm=0ACONFIG_CRASHER=3Dm=0ACONFIG_XILLYBUS_CLA=
SS=3Dm=0ACONFIG_XILLYBUS=3Dm=0ACONFIG_XILLYBUS_PCIE=3Dm=0ACONFIG_XILLYUSB=
=3Dm=0A# end of Character devices=0A=0A#=0A# I2C support=0A#=0ACONFIG_I2C=
=3Dy=0ACONFIG_ACPI_I2C_OPREGION=3Dy=0ACONFIG_I2C_BOARDINFO=3Dy=0ACONFIG_I2C=
_CHARDEV=3Dm=0ACONFIG_I2C_MUX=3Dm=0A=0A#=0A# Multiplexer I2C Chip support=
=0A#=0ACONFIG_I2C_MUX_GPIO=3Dm=0ACONFIG_I2C_MUX_LTC4306=3Dm=0ACONFIG_I2C_MU=
X_PCA9541=3Dm=0ACONFIG_I2C_MUX_PCA954x=3Dm=0ACONFIG_I2C_MUX_REG=3Dm=0ACONFI=
G_I2C_MUX_MLXCPLD=3Dm=0A# end of Multiplexer I2C Chip support=0A=0ACONFIG_I=
2C_ATR=3Dm=0ACONFIG_I2C_HELPER_AUTO=3Dy=0ACONFIG_I2C_SMBUS=3Dm=0ACONFIG_I2C=
_ALGOBIT=3Dm=0ACONFIG_I2C_ALGOPCA=3Dm=0A=0A#=0A# I2C Hardware Bus support=
=0A#=0A=0A#=0A# PC SMBus host controller drivers=0A#=0ACONFIG_I2C_CCGX_UCSI=
=3Dm=0ACONFIG_I2C_ALI1535=3Dm=0ACONFIG_I2C_ALI1563=3Dm=0ACONFIG_I2C_ALI15X3=
=3Dm=0ACONFIG_I2C_AMD756=3Dm=0ACONFIG_I2C_AMD8111=3Dm=0ACONFIG_I2C_AMD_MP2=
=3Dm=0ACONFIG_I2C_AMD_ASF=3Dm=0ACONFIG_I2C_I801=3Dm=0ACONFIG_I2C_I801_MUX=
=3Dy=0ACONFIG_I2C_ISCH=3Dm=0ACONFIG_I2C_ISMT=3Dm=0ACONFIG_I2C_PIIX4=3Dm=0AC=
ONFIG_I2C_CHT_WC=3Dm=0ACONFIG_I2C_NFORCE2=3Dm=0ACONFIG_I2C_NVIDIA_GPU=3Dm=
=0ACONFIG_I2C_SIS5595=3Dm=0ACONFIG_I2C_SIS630=3Dm=0ACONFIG_I2C_SIS96X=3Dm=
=0A# CONFIG_I2C_VIA is not set=0ACONFIG_I2C_VIAPRO=3Dm=0ACONFIG_I2C_ZHAOXIN=
=3Dm=0A=0A#=0A# ACPI drivers=0A#=0ACONFIG_I2C_SCMI=3Dm=0A=0A#=0A# I2C syste=
m bus drivers (mostly embedded / system-on-chip)=0A#=0ACONFIG_I2C_CBUS_GPIO=
=3Dm=0ACONFIG_I2C_DESIGNWARE_CORE=3Dy=0A# CONFIG_I2C_DESIGNWARE_SLAVE is no=
t set=0ACONFIG_I2C_DESIGNWARE_PLATFORM=3Dy=0ACONFIG_I2C_DESIGNWARE_AMDISP=
=3Dm=0ACONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy=0ACONFIG_I2C_DESIGNWARE_PCI=3Dm=
=0A# CONFIG_I2C_EMEV2 is not set=0ACONFIG_I2C_GPIO=3Dm=0A# CONFIG_I2C_GPIO_=
FAULT_INJECTOR is not set=0ACONFIG_I2C_KEBA=3Dm=0ACONFIG_I2C_KEMPLD=3Dm=0AC=
ONFIG_I2C_OCORES=3Dm=0ACONFIG_I2C_PCA_PLATFORM=3Dm=0A# CONFIG_I2C_PXA_PCI i=
s not set=0A# CONFIG_I2C_SIMTEC is not set=0ACONFIG_I2C_XILINX=3Dm=0A=0A#=
=0A# External I2C/SMBus adapter drivers=0A#=0ACONFIG_I2C_DIOLAN_U2C=3Dm=0AC=
ONFIG_I2C_DLN2=3Dm=0ACONFIG_I2C_LJCA=3Dm=0ACONFIG_I2C_USBIO=3Dm=0ACONFIG_I2=
C_CP2615=3Dm=0ACONFIG_I2C_PARPORT=3Dm=0ACONFIG_I2C_PCI1XXXX=3Dm=0ACONFIG_I2=
C_ROBOTFUZZ_OSIF=3Dm=0ACONFIG_I2C_TAOS_EVM=3Dm=0ACONFIG_I2C_TINY_USB=3Dm=0A=
CONFIG_I2C_VIPERBOARD=3Dm=0A=0A#=0A# Other I2C/SMBus bus drivers=0A#=0ACONF=
IG_I2C_MLXCPLD=3Dm=0ACONFIG_I2C_CROS_EC_TUNNEL=3Dm=0ACONFIG_I2C_VIRTIO=3Dm=
=0A# end of I2C Hardware Bus support=0A=0ACONFIG_I2C_STUB=3Dm=0ACONFIG_I2C_=
SLAVE=3Dy=0ACONFIG_I2C_SLAVE_EEPROM=3Dm=0A# CONFIG_I2C_SLAVE_TESTUNIT is no=
t set=0A# CONFIG_I2C_DEBUG_CORE is not set=0A# CONFIG_I2C_DEBUG_ALGO is not=
 set=0A# CONFIG_I2C_DEBUG_BUS is not set=0A# end of I2C support=0A=0ACONFIG=
_I3C=3Dm=0ACONFIG_ADI_I3C_MASTER=3Dm=0ACONFIG_CDNS_I3C_MASTER=3Dm=0ACONFIG_=
DW_I3C_MASTER=3Dm=0ACONFIG_SVC_I3C_MASTER=3Dm=0ACONFIG_MIPI_I3C_HCI=3Dm=0AC=
ONFIG_MIPI_I3C_HCI_PCI=3Dm=0ACONFIG_SPI=3Dy=0A# CONFIG_SPI_DEBUG is not set=
=0ACONFIG_SPI_MASTER=3Dy=0ACONFIG_SPI_MEM=3Dy=0A=0A#=0A# SPI Master Control=
ler Drivers=0A#=0A# CONFIG_SPI_ALTERA is not set=0ACONFIG_SPI_ALTERA_CORE=
=3Dm=0ACONFIG_SPI_ALTERA_DFL=3Dm=0A# CONFIG_SPI_AXI_SPI_ENGINE is not set=
=0ACONFIG_SPI_BITBANG=3Dm=0A# CONFIG_SPI_BUTTERFLY is not set=0A# CONFIG_SP=
I_CADENCE is not set=0A# CONFIG_SPI_CH341 is not set=0ACONFIG_SPI_CS42L43=
=3Dm=0A# CONFIG_SPI_DESIGNWARE is not set=0ACONFIG_SPI_DLN2=3Dm=0A# CONFIG_=
SPI_GPIO is not set=0ACONFIG_SPI_INTEL=3Dm=0ACONFIG_SPI_INTEL_PCI=3Dm=0ACON=
FIG_SPI_INTEL_PLATFORM=3Dm=0ACONFIG_SPI_KSPI2=3Dm=0A# CONFIG_SPI_LM70_LLP i=
s not set=0ACONFIG_SPI_LJCA=3Dm=0ACONFIG_SPI_MICROCHIP_CORE_QSPI=3Dm=0ACONF=
IG_SPI_MICROCHIP_CORE_SPI=3Dm=0A# CONFIG_SPI_LANTIQ_SSC is not set=0A# CONF=
IG_SPI_OC_TINY is not set=0A# CONFIG_SPI_PCI1XXXX is not set=0ACONFIG_SPI_P=
XA2XX=3Dm=0ACONFIG_SPI_PXA2XX_PCI=3Dm=0A# CONFIG_SPI_SC18IS602 is not set=
=0A# CONFIG_SPI_SIFIVE is not set=0A# CONFIG_SPI_MXIC is not set=0ACONFIG_S=
PI_VIRTIO=3Dm=0A# CONFIG_SPI_XCOMM is not set=0ACONFIG_SPI_XILINX=3Dm=0A# C=
ONFIG_SPI_ZYNQMP_GQSPI is not set=0ACONFIG_SPI_AMD=3Dm=0A=0A#=0A# SPI Multi=
plexer support=0A#=0ACONFIG_SPI_MUX=3Dm=0A=0A#=0A# SPI Protocol Masters=0A#=
=0A# CONFIG_SPI_SPIDEV is not set=0ACONFIG_SPI_LOOPBACK_TEST=3Dm=0A# CONFIG=
_SPI_TLE62X0 is not set=0A# CONFIG_SPI_SLAVE is not set=0ACONFIG_SPI_DYNAMI=
C=3Dy=0ACONFIG_SPMI=3Dm=0ACONFIG_HSI=3Dm=0ACONFIG_HSI_BOARDINFO=3Dy=0A=0A#=
=0A# HSI controllers=0A#=0A=0A#=0A# HSI clients=0A#=0ACONFIG_HSI_CHAR=3Dm=
=0ACONFIG_PPS=3Dy=0A# CONFIG_PPS_DEBUG is not set=0A=0A#=0A# PPS clients su=
pport=0A#=0A# CONFIG_PPS_CLIENT_KTIMER is not set=0ACONFIG_PPS_CLIENT_LDISC=
=3Dm=0ACONFIG_PPS_CLIENT_PARPORT=3Dm=0ACONFIG_PPS_CLIENT_GPIO=3Dm=0ACONFIG_=
PPS_GENERATOR=3Dm=0ACONFIG_PPS_GENERATOR_DUMMY=3Dm=0ACONFIG_PPS_GENERATOR_T=
IO=3Dm=0A=0A#=0A# PTP clock support=0A#=0ACONFIG_PTP_1588_CLOCK=3Dy=0ACONFI=
G_PTP_1588_CLOCK_OPTIONAL=3Dy=0A=0A#=0A# Enable PHYLIB and NETWORK_PHY_TIME=
STAMPING to see the additional clocks.=0A#=0ACONFIG_PTP_1588_CLOCK_KVM=3Dm=
=0ACONFIG_PTP_1588_CLOCK_VMCLOCK=3Dm=0ACONFIG_PTP_1588_CLOCK_IDT82P33=3Dm=
=0ACONFIG_PTP_1588_CLOCK_IDTCM=3Dm=0ACONFIG_PTP_1588_CLOCK_FC3W=3Dm=0ACONFI=
G_PTP_1588_CLOCK_MOCK=3Dm=0ACONFIG_PTP_1588_CLOCK_VMW=3Dm=0ACONFIG_PTP_1588=
_CLOCK_OCP=3Dm=0ACONFIG_PTP_DFL_TOD=3Dm=0ACONFIG_PTP_NETC_V4_TIMER=3Dm=0A# =
end of PTP clock support=0A=0A#=0A# DPLL device support=0A#=0ACONFIG_DPLL=
=3Dy=0ACONFIG_ZL3073X=3Dm=0ACONFIG_ZL3073X_I2C=3Dm=0ACONFIG_ZL3073X_SPI=3Dm=
=0A# end of DPLL device support=0A=0ACONFIG_PINCTRL=3Dy=0ACONFIG_PINMUX=3Dy=
=0ACONFIG_PINCONF=3Dy=0ACONFIG_GENERIC_PINCONF=3Dy=0A# CONFIG_DEBUG_PINCTRL=
 is not set=0ACONFIG_PINCTRL_AMD=3Dy=0ACONFIG_PINCTRL_AMDISP=3Dm=0ACONFIG_P=
INCTRL_CY8C95X0=3Dm=0ACONFIG_PINCTRL_DA9062=3Dm=0A# CONFIG_PINCTRL_MCP23S08=
 is not set=0A# CONFIG_PINCTRL_SX150X is not set=0ACONFIG_PINCTRL_CS42L43=
=3Dm=0ACONFIG_PINCTRL_MADERA=3Dm=0ACONFIG_PINCTRL_CS47L15=3Dy=0ACONFIG_PINC=
TRL_CS47L35=3Dy=0ACONFIG_PINCTRL_CS47L85=3Dy=0ACONFIG_PINCTRL_CS47L90=3Dy=
=0ACONFIG_PINCTRL_CS47L92=3Dy=0A=0A#=0A# Intel pinctrl drivers=0A#=0ACONFIG=
_PINCTRL_BAYTRAIL=3Dy=0ACONFIG_PINCTRL_CHERRYVIEW=3Dy=0ACONFIG_PINCTRL_LYNX=
POINT=3Dm=0ACONFIG_PINCTRL_INTEL=3Dy=0ACONFIG_PINCTRL_INTEL_PLATFORM=3Dm=0A=
CONFIG_PINCTRL_ALDERLAKE=3Dm=0ACONFIG_PINCTRL_BROXTON=3Dm=0ACONFIG_PINCTRL_=
CANNONLAKE=3Dm=0ACONFIG_PINCTRL_CEDARFORK=3Dm=0ACONFIG_PINCTRL_DENVERTON=3D=
m=0ACONFIG_PINCTRL_ELKHARTLAKE=3Dm=0ACONFIG_PINCTRL_EMMITSBURG=3Dm=0ACONFIG=
_PINCTRL_GEMINILAKE=3Dm=0ACONFIG_PINCTRL_ICELAKE=3Dm=0ACONFIG_PINCTRL_JASPE=
RLAKE=3Dm=0ACONFIG_PINCTRL_LAKEFIELD=3Dm=0ACONFIG_PINCTRL_LEWISBURG=3Dm=0AC=
ONFIG_PINCTRL_METEORLAKE=3Dm=0ACONFIG_PINCTRL_METEORPOINT=3Dm=0ACONFIG_PINC=
TRL_SUNRISEPOINT=3Dm=0ACONFIG_PINCTRL_TIGERLAKE=3Dm=0A# end of Intel pinctr=
l drivers=0A=0A#=0A# Renesas pinctrl drivers=0A#=0A# end of Renesas pinctrl=
 drivers=0A=0ACONFIG_GPIOLIB_LEGACY=3Dy=0ACONFIG_GPIOLIB=3Dy=0ACONFIG_GPIOL=
IB_FASTPATH_LIMIT=3D512=0ACONFIG_GPIO_ACPI=3Dy=0ACONFIG_GPIOLIB_IRQCHIP=3Dy=
=0A# CONFIG_DEBUG_GPIO is not set=0ACONFIG_GPIO_SYSFS=3Dy=0ACONFIG_GPIO_SYS=
FS_LEGACY=3Dy=0ACONFIG_GPIO_CDEV=3Dy=0ACONFIG_GPIO_CDEV_V1=3Dy=0ACONFIG_GPI=
O_GENERIC=3Dm=0ACONFIG_GPIO_REGMAP=3Dm=0ACONFIG_GPIO_SWNODE_UNDEFINED=3Dy=
=0ACONFIG_GPIO_MAX730X=3Dm=0ACONFIG_GPIO_IDIO_16=3Dm=0A=0A#=0A# Memory mapp=
ed GPIO drivers=0A#=0ACONFIG_GPIO_ALTERA=3Dm=0ACONFIG_GPIO_AMDPT=3Dm=0A# CO=
NFIG_GPIO_DWAPB is not set=0ACONFIG_GPIO_EXAR=3Dm=0ACONFIG_GPIO_GENERIC_PLA=
TFORM=3Dm=0ACONFIG_GPIO_GRANITERAPIDS=3Dm=0ACONFIG_GPIO_ICH=3Dm=0A# CONFIG_=
GPIO_MB86S7X is not set=0A# CONFIG_GPIO_POLARFIRE_SOC is not set=0ACONFIG_G=
PIO_TANGIER=3Dm=0ACONFIG_GPIO_XILINX=3Dm=0ACONFIG_GPIO_AMD_FCH=3Dm=0A# end =
of Memory mapped GPIO drivers=0A=0A#=0A# Port-mapped I/O GPIO drivers=0A#=
=0ACONFIG_GPIO_VX855=3Dm=0ACONFIG_GPIO_I8255=3Dm=0ACONFIG_GPIO_104_DIO_48E=
=3Dm=0ACONFIG_GPIO_104_IDIO_16=3Dm=0ACONFIG_GPIO_104_IDI_48=3Dm=0ACONFIG_GP=
IO_F7188X=3Dm=0ACONFIG_GPIO_GPIO_MM=3Dm=0ACONFIG_GPIO_IT87=3Dm=0ACONFIG_GPI=
O_SCH=3Dm=0ACONFIG_GPIO_SCH311X=3Dm=0ACONFIG_GPIO_WINBOND=3Dm=0ACONFIG_GPIO=
_WS16C48=3Dm=0A# end of Port-mapped I/O GPIO drivers=0A=0A#=0A# I2C GPIO ex=
panders=0A#=0ACONFIG_GPIO_FXL6408=3Dm=0ACONFIG_GPIO_DS4520=3Dm=0ACONFIG_GPI=
O_MAX7300=3Dm=0ACONFIG_GPIO_MAX732X=3Dm=0ACONFIG_GPIO_PCA953X=3Dm=0ACONFIG_=
GPIO_PCA953X_IRQ=3Dy=0ACONFIG_GPIO_PCA9570=3Dm=0ACONFIG_GPIO_PCF857X=3Dm=0A=
CONFIG_GPIO_TPIC2810=3Dm=0A# end of I2C GPIO expanders=0A=0A#=0A# MFD GPIO =
expanders=0A#=0ACONFIG_GPIO_CROS_EC=3Dm=0ACONFIG_GPIO_CRYSTAL_COVE=3Dm=0ACO=
NFIG_GPIO_DLN2=3Dm=0ACONFIG_GPIO_ELKHARTLAKE=3Dm=0ACONFIG_GPIO_KEMPLD=3Dm=
=0ACONFIG_GPIO_LJCA=3Dm=0ACONFIG_GPIO_LP3943=3Dm=0ACONFIG_GPIO_MADERA=3Dm=
=0ACONFIG_GPIO_QIXIS_FPGA=3Dm=0A# CONFIG_GPIO_TPS68470 is not set=0ACONFIG_=
GPIO_TQMX86=3Dm=0ACONFIG_GPIO_WHISKEY_COVE=3Dm=0A# end of MFD GPIO expander=
s=0A=0A#=0A# PCI GPIO expanders=0A#=0ACONFIG_GPIO_AMD8111=3Dm=0ACONFIG_GPIO=
_ML_IOH=3Dm=0ACONFIG_GPIO_PCI_IDIO_16=3Dm=0ACONFIG_GPIO_PCIE_IDIO_24=3Dm=0A=
# CONFIG_GPIO_RDC321X is not set=0A# end of PCI GPIO expanders=0A=0A#=0A# S=
PI GPIO expanders=0A#=0ACONFIG_GPIO_74X164=3Dm=0ACONFIG_GPIO_MAX3191X=3Dm=
=0A# CONFIG_GPIO_MAX7301 is not set=0A# CONFIG_GPIO_MC33880 is not set=0ACO=
NFIG_GPIO_PISOSR=3Dm=0A# CONFIG_GPIO_XRA1403 is not set=0A# end of SPI GPIO=
 expanders=0A=0A#=0A# USB GPIO expanders=0A#=0ACONFIG_GPIO_VIPERBOARD=3Dm=
=0ACONFIG_GPIO_MPSSE=3Dm=0ACONFIG_GPIO_USBIO=3Dm=0A# end of USB GPIO expand=
ers=0A=0A#=0A# Virtual GPIO drivers=0A#=0ACONFIG_GPIO_AGGREGATOR=3Dm=0ACONF=
IG_GPIO_LATCH=3Dm=0ACONFIG_GPIO_MOCKUP=3Dm=0ACONFIG_GPIO_VIRTIO=3Dm=0ACONFI=
G_GPIO_SIM=3Dm=0A# end of Virtual GPIO drivers=0A=0A#=0A# GPIO Debugging ut=
ilities=0A#=0A# CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER is not set=0ACONFIG_GPIO_=
VIRTUSER=3Dm=0A# end of GPIO Debugging utilities=0A=0ACONFIG_DEV_SYNC_PROBE=
=3Dm=0ACONFIG_W1=3Dm=0ACONFIG_W1_CON=3Dy=0A=0A#=0A# 1-wire Bus Masters=0A#=
=0ACONFIG_W1_MASTER_AMD_AXI=3Dm=0ACONFIG_W1_MASTER_MATROX=3Dm=0ACONFIG_W1_M=
ASTER_DS2490=3Dm=0ACONFIG_W1_MASTER_DS2482=3Dm=0A# CONFIG_W1_MASTER_GPIO is=
 not set=0ACONFIG_W1_MASTER_SGI=3Dm=0ACONFIG_W1_MASTER_UART=3Dm=0A# end of =
1-wire Bus Masters=0A=0A#=0A# 1-wire Slaves=0A#=0ACONFIG_W1_SLAVE_THERM=3Dm=
=0ACONFIG_W1_SLAVE_SMEM=3Dm=0ACONFIG_W1_SLAVE_DS2405=3Dm=0ACONFIG_W1_SLAVE_=
DS2408=3Dm=0ACONFIG_W1_SLAVE_DS2408_READBACK=3Dy=0ACONFIG_W1_SLAVE_DS2413=
=3Dm=0ACONFIG_W1_SLAVE_DS2406=3Dm=0ACONFIG_W1_SLAVE_DS2423=3Dm=0ACONFIG_W1_=
SLAVE_DS2805=3Dm=0ACONFIG_W1_SLAVE_DS2430=3Dm=0ACONFIG_W1_SLAVE_DS2431=3Dm=
=0ACONFIG_W1_SLAVE_DS2433=3Dm=0ACONFIG_W1_SLAVE_DS2433_CRC=3Dy=0ACONFIG_W1_=
SLAVE_DS2438=3Dm=0ACONFIG_W1_SLAVE_DS250X=3Dm=0ACONFIG_W1_SLAVE_DS2780=3Dm=
=0ACONFIG_W1_SLAVE_DS2781=3Dm=0ACONFIG_W1_SLAVE_DS28E04=3Dm=0ACONFIG_W1_SLA=
VE_DS28E17=3Dm=0A# end of 1-wire Slaves=0A=0A# CONFIG_POWER_RESET is not se=
t=0ACONFIG_POWER_SEQUENCING=3Dm=0ACONFIG_POWER_SUPPLY=3Dy=0A# CONFIG_POWER_=
SUPPLY_DEBUG is not set=0ACONFIG_POWER_SUPPLY_HWMON=3Dy=0ACONFIG_ADC_BATTER=
Y_HELPER=3Dm=0A# CONFIG_GENERIC_ADC_BATTERY is not set=0ACONFIG_IP5XXX_POWE=
R=3Dm=0A# CONFIG_TEST_POWER is not set=0ACONFIG_CHARGER_ADP5061=3Dm=0ACONFI=
G_BATTERY_CHAGALL=3Dm=0ACONFIG_BATTERY_CW2015=3Dm=0ACONFIG_BATTERY_DS2760=
=3Dm=0ACONFIG_BATTERY_DS2780=3Dm=0ACONFIG_BATTERY_DS2781=3Dm=0ACONFIG_BATTE=
RY_DS2782=3Dm=0A# CONFIG_BATTERY_SAMSUNG_SDI is not set=0ACONFIG_BATTERY_IN=
TEL_DC_TI=3Dm=0ACONFIG_BATTERY_SBS=3Dm=0ACONFIG_CHARGER_SBS=3Dm=0ACONFIG_MA=
NAGER_SBS=3Dm=0ACONFIG_BATTERY_BQ27XXX=3Dm=0ACONFIG_BATTERY_BQ27XXX_I2C=3Dm=
=0ACONFIG_BATTERY_BQ27XXX_HDQ=3Dm=0A# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=
 is not set=0ACONFIG_CHARGER_AXP20X=3Dm=0ACONFIG_BATTERY_AXP20X=3Dm=0ACONFI=
G_AXP20X_POWER=3Dm=0ACONFIG_AXP288_CHARGER=3Dm=0ACONFIG_AXP288_FUEL_GAUGE=
=3Dm=0ACONFIG_BATTERY_MAX17040=3Dm=0ACONFIG_BATTERY_MAX17042=3Dm=0ACONFIG_B=
ATTERY_MAX1720X=3Dm=0ACONFIG_BATTERY_MAX1721X=3Dm=0ACONFIG_CHARGER_ISP1704=
=3Dm=0ACONFIG_CHARGER_MAX8903=3Dm=0ACONFIG_CHARGER_LP8727=3Dm=0ACONFIG_CHAR=
GER_GPIO=3Dm=0ACONFIG_CHARGER_MANAGER=3Dy=0ACONFIG_CHARGER_LT3651=3Dm=0ACON=
FIG_CHARGER_LTC4162L=3Dm=0ACONFIG_CHARGER_MAX77976=3Dm=0ACONFIG_CHARGER_MAX=
8971=3Dm=0A# CONFIG_CHARGER_BQ2415X is not set=0ACONFIG_CHARGER_BQ24190=3Dm=
=0ACONFIG_CHARGER_BQ24257=3Dm=0ACONFIG_CHARGER_BQ24735=3Dm=0ACONFIG_CHARGER=
_BQ2515X=3Dm=0ACONFIG_CHARGER_BQ257XX=3Dm=0ACONFIG_CHARGER_BQ25890=3Dm=0ACO=
NFIG_CHARGER_BQ25980=3Dm=0ACONFIG_CHARGER_BQ256XX=3Dm=0ACONFIG_CHARGER_SMB3=
47=3Dm=0A# CONFIG_BATTERY_GAUGE_LTC2941 is not set=0ACONFIG_BATTERY_GOLDFIS=
H=3Dm=0ACONFIG_BATTERY_RT5033=3Dm=0ACONFIG_CHARGER_RT9455=3Dm=0ACONFIG_CHAR=
GER_RT9467=3Dm=0ACONFIG_CHARGER_RT9471=3Dm=0ACONFIG_CHARGER_RT9756=3Dm=0ACO=
NFIG_CHARGER_CROS_USBPD=3Dm=0ACONFIG_CHARGER_CROS_PCHG=3Dm=0ACONFIG_CHARGER=
_CROS_CONTROL=3Dm=0ACONFIG_FUEL_GAUGE_STC3117=3Dm=0ACONFIG_CHARGER_BD99954=
=3Dm=0ACONFIG_CHARGER_WILCO=3Dm=0ACONFIG_BATTERY_SURFACE=3Dm=0ACONFIG_CHARG=
ER_SURFACE=3Dm=0ACONFIG_BATTERY_UG3105=3Dm=0ACONFIG_FUEL_GAUGE_MM8013=3Dm=
=0ACONFIG_HWMON=3Dy=0ACONFIG_HWMON_VID=3Dm=0A# CONFIG_HWMON_DEBUG_CHIP is n=
ot set=0A=0A#=0A# Native drivers=0A#=0ACONFIG_SENSORS_ABITUGURU=3Dm=0ACONFI=
G_SENSORS_ABITUGURU3=3Dm=0A# CONFIG_SENSORS_AD7314 is not set=0ACONFIG_SENS=
ORS_AD7414=3Dm=0ACONFIG_SENSORS_AD7418=3Dm=0ACONFIG_SENSORS_ADM1025=3Dm=0AC=
ONFIG_SENSORS_ADM1026=3Dm=0ACONFIG_SENSORS_ADM1029=3Dm=0ACONFIG_SENSORS_ADM=
1031=3Dm=0ACONFIG_SENSORS_ADM1177=3Dm=0ACONFIG_SENSORS_ADM9240=3Dm=0ACONFIG=
_SENSORS_ADT7X10=3Dm=0A# CONFIG_SENSORS_ADT7310 is not set=0ACONFIG_SENSORS=
_ADT7410=3Dm=0ACONFIG_SENSORS_ADT7411=3Dm=0ACONFIG_SENSORS_ADT7462=3Dm=0ACO=
NFIG_SENSORS_ADT7470=3Dm=0ACONFIG_SENSORS_ADT7475=3Dm=0ACONFIG_SENSORS_AHT1=
0=3Dm=0ACONFIG_SENSORS_AQUACOMPUTER_D5NEXT=3Dm=0ACONFIG_SENSORS_AS370=3Dm=
=0ACONFIG_SENSORS_ASC7621=3Dm=0ACONFIG_SENSORS_ASUS_ROG_RYUJIN=3Dm=0ACONFIG=
_SENSORS_AXI_FAN_CONTROL=3Dm=0ACONFIG_SENSORS_K8TEMP=3Dm=0ACONFIG_SENSORS_K=
10TEMP=3Dm=0ACONFIG_SENSORS_KBATT=3Dm=0ACONFIG_SENSORS_KFAN=3Dm=0ACONFIG_SE=
NSORS_FAM15H_POWER=3Dm=0ACONFIG_SENSORS_APPLESMC=3Dm=0ACONFIG_SENSORS_ASB10=
0=3Dm=0ACONFIG_SENSORS_ATXP1=3Dm=0ACONFIG_SENSORS_CHIPCAP2=3Dm=0ACONFIG_SEN=
SORS_CORSAIR_CPRO=3Dm=0ACONFIG_SENSORS_CORSAIR_PSU=3Dm=0ACONFIG_SENSORS_CRO=
S_EC=3Dm=0ACONFIG_SENSORS_DRIVETEMP=3Dm=0ACONFIG_SENSORS_DS620=3Dm=0ACONFIG=
_SENSORS_DS1621=3Dm=0ACONFIG_SENSORS_DELL_SMM=3Dm=0ACONFIG_I8K=3Dy=0ACONFIG=
_SENSORS_I5K_AMB=3Dm=0ACONFIG_SENSORS_F71805F=3Dm=0ACONFIG_SENSORS_F71882FG=
=3Dm=0ACONFIG_SENSORS_F75375S=3Dm=0ACONFIG_SENSORS_FSCHMD=3Dm=0ACONFIG_SENS=
ORS_FTSTEUTATES=3Dm=0ACONFIG_SENSORS_GIGABYTE_WATERFORCE=3Dm=0ACONFIG_SENSO=
RS_GL518SM=3Dm=0ACONFIG_SENSORS_GL520SM=3Dm=0ACONFIG_SENSORS_GPD=3Dm=0ACONF=
IG_SENSORS_G760A=3Dm=0ACONFIG_SENSORS_G762=3Dm=0ACONFIG_SENSORS_HIH6130=3Dm=
=0ACONFIG_SENSORS_HS3001=3Dm=0ACONFIG_SENSORS_HTU31=3Dm=0ACONFIG_SENSORS_IB=
MAEM=3Dm=0ACONFIG_SENSORS_IBMPEX=3Dm=0A# CONFIG_SENSORS_IIO_HWMON is not se=
t=0ACONFIG_SENSORS_I5500=3Dm=0ACONFIG_SENSORS_CORETEMP=3Dm=0ACONFIG_SENSORS=
_ISL28022=3Dm=0ACONFIG_SENSORS_IT87=3Dm=0ACONFIG_SENSORS_JC42=3Dm=0ACONFIG_=
SENSORS_POWERZ=3Dm=0ACONFIG_SENSORS_POWR1220=3Dm=0ACONFIG_SENSORS_LENOVO_EC=
=3Dm=0ACONFIG_SENSORS_LINEAGE=3Dm=0ACONFIG_SENSORS_LTC2945=3Dm=0ACONFIG_SEN=
SORS_LTC2947=3Dm=0ACONFIG_SENSORS_LTC2947_I2C=3Dm=0ACONFIG_SENSORS_LTC2947_=
SPI=3Dm=0ACONFIG_SENSORS_LTC2990=3Dm=0ACONFIG_SENSORS_LTC2991=3Dm=0ACONFIG_=
SENSORS_LTC2992=3Dm=0ACONFIG_SENSORS_LTC4151=3Dm=0ACONFIG_SENSORS_LTC4215=
=3Dm=0ACONFIG_SENSORS_LTC4222=3Dm=0ACONFIG_SENSORS_LTC4245=3Dm=0ACONFIG_SEN=
SORS_LTC4260=3Dm=0ACONFIG_SENSORS_LTC4261=3Dm=0ACONFIG_SENSORS_LTC4282=3Dm=
=0A# CONFIG_SENSORS_MAX1111 is not set=0ACONFIG_SENSORS_MAX127=3Dm=0ACONFIG=
_SENSORS_MAX16065=3Dm=0ACONFIG_SENSORS_MAX1619=3Dm=0ACONFIG_SENSORS_MAX1668=
=3Dm=0A# CONFIG_SENSORS_MAX197 is not set=0ACONFIG_SENSORS_MAX31722=3Dm=0AC=
ONFIG_SENSORS_MAX31730=3Dm=0ACONFIG_SENSORS_MAX31760=3Dm=0ACONFIG_MAX31827=
=3Dm=0ACONFIG_SENSORS_MAX6620=3Dm=0ACONFIG_SENSORS_MAX6621=3Dm=0ACONFIG_SEN=
SORS_MAX6639=3Dm=0ACONFIG_SENSORS_MAX6650=3Dm=0ACONFIG_SENSORS_MAX6697=3Dm=
=0ACONFIG_SENSORS_MAX31790=3Dm=0ACONFIG_SENSORS_MC34VR500=3Dm=0ACONFIG_SENS=
ORS_MCP3021=3Dm=0ACONFIG_SENSORS_MLXREG_FAN=3Dm=0ACONFIG_SENSORS_TC654=3Dm=
=0ACONFIG_SENSORS_TPS23861=3Dm=0ACONFIG_SENSORS_MR75203=3Dm=0A# CONFIG_SENS=
ORS_ADCXX is not set=0ACONFIG_SENSORS_LM63=3Dm=0A# CONFIG_SENSORS_LM70 is n=
ot set=0ACONFIG_SENSORS_LM73=3Dm=0ACONFIG_SENSORS_LM75=3Dm=0ACONFIG_SENSORS=
_LM77=3Dm=0ACONFIG_SENSORS_LM78=3Dm=0ACONFIG_SENSORS_LM80=3Dm=0ACONFIG_SENS=
ORS_LM83=3Dm=0ACONFIG_SENSORS_LM85=3Dm=0ACONFIG_SENSORS_LM87=3Dm=0ACONFIG_S=
ENSORS_LM90=3Dm=0ACONFIG_SENSORS_LM92=3Dm=0ACONFIG_SENSORS_LM93=3Dm=0ACONFI=
G_SENSORS_LM95234=3Dm=0ACONFIG_SENSORS_LM95241=3Dm=0ACONFIG_SENSORS_LM95245=
=3Dm=0ACONFIG_SENSORS_PC87360=3Dm=0ACONFIG_SENSORS_PC87427=3Dm=0A# CONFIG_S=
ENSORS_NTC_THERMISTOR is not set=0ACONFIG_SENSORS_NCT6683=3Dm=0ACONFIG_SENS=
ORS_NCT6775_CORE=3Dm=0ACONFIG_SENSORS_NCT6775=3Dm=0ACONFIG_SENSORS_NCT6775_=
I2C=3Dm=0ACONFIG_SENSORS_NCT7363=3Dm=0ACONFIG_SENSORS_NCT7802=3Dm=0ACONFIG_=
SENSORS_NCT7904=3Dm=0ACONFIG_SENSORS_NPCM7XX=3Dm=0ACONFIG_SENSORS_NZXT_KRAK=
EN2=3Dm=0ACONFIG_SENSORS_NZXT_KRAKEN3=3Dm=0ACONFIG_SENSORS_NZXT_SMART2=3Dm=
=0A# CONFIG_SENSORS_OCC_P8_I2C is not set=0ACONFIG_SENSORS_PCF8591=3Dm=0ACO=
NFIG_PMBUS=3Dm=0ACONFIG_SENSORS_PMBUS=3Dm=0ACONFIG_SENSORS_ACBEL_FSG032=3Dm=
=0ACONFIG_SENSORS_ADM1266=3Dm=0ACONFIG_SENSORS_ADM1275=3Dm=0ACONFIG_SENSORS=
_ADP1050=3Dm=0ACONFIG_SENSORS_ADP1050_REGULATOR=3Dy=0ACONFIG_SENSORS_BEL_PF=
E=3Dm=0ACONFIG_SENSORS_BPA_RS600=3Dm=0ACONFIG_SENSORS_CRPS=3Dm=0ACONFIG_SEN=
SORS_DELTA_AHE50DC_FAN=3Dm=0ACONFIG_SENSORS_FSP_3Y=3Dm=0ACONFIG_SENSORS_IBM=
_CFFPS=3Dm=0ACONFIG_SENSORS_DPS920AB=3Dm=0ACONFIG_SENSORS_INA233=3Dm=0ACONF=
IG_SENSORS_INSPUR_IPSPS=3Dm=0A# CONFIG_SENSORS_IR35221 is not set=0ACONFIG_=
SENSORS_IR36021=3Dm=0ACONFIG_SENSORS_IR38064=3Dm=0ACONFIG_SENSORS_IR38064_R=
EGULATOR=3Dy=0ACONFIG_SENSORS_IRPS5401=3Dm=0ACONFIG_SENSORS_ISL68137=3Dm=0A=
CONFIG_SENSORS_LM25066=3Dm=0ACONFIG_SENSORS_LM25066_REGULATOR=3Dy=0ACONFIG_=
SENSORS_LT3074=3Dm=0ACONFIG_SENSORS_LT3074_REGULATOR=3Dm=0ACONFIG_SENSORS_L=
T7182S=3Dm=0ACONFIG_SENSORS_LTC2978=3Dm=0ACONFIG_SENSORS_LTC2978_REGULATOR=
=3Dy=0ACONFIG_SENSORS_LTC3815=3Dm=0A# CONFIG_SENSORS_LTC4286 is not set=0AC=
ONFIG_SENSORS_MAX15301=3Dm=0ACONFIG_SENSORS_MAX16064=3Dm=0ACONFIG_SENSORS_M=
AX16601=3Dm=0ACONFIG_SENSORS_MAX17616=3Dm=0ACONFIG_SENSORS_MAX20730=3Dm=0AC=
ONFIG_SENSORS_MAX20751=3Dm=0ACONFIG_SENSORS_MAX31785=3Dm=0ACONFIG_SENSORS_M=
AX34440=3Dm=0ACONFIG_SENSORS_MAX8688=3Dm=0ACONFIG_SENSORS_MP2856=3Dm=0ACONF=
IG_SENSORS_MP2869=3Dm=0ACONFIG_SENSORS_MP2888=3Dm=0ACONFIG_SENSORS_MP2891=
=3Dm=0ACONFIG_SENSORS_MP2925=3Dm=0ACONFIG_SENSORS_MP29502=3Dm=0ACONFIG_SENS=
ORS_MP2975=3Dm=0ACONFIG_SENSORS_MP2993=3Dm=0ACONFIG_SENSORS_MP2975_REGULATO=
R=3Dy=0ACONFIG_SENSORS_MP5023=3Dm=0ACONFIG_SENSORS_MP5920=3Dm=0ACONFIG_SENS=
ORS_MP5990=3Dm=0ACONFIG_SENSORS_MP9941=3Dm=0ACONFIG_SENSORS_MP9945=3Dm=0ACO=
NFIG_SENSORS_MPQ7932_REGULATOR=3Dy=0ACONFIG_SENSORS_MPQ7932=3Dm=0ACONFIG_SE=
NSORS_MPQ8785=3Dm=0ACONFIG_SENSORS_PIM4328=3Dm=0ACONFIG_SENSORS_PLI1209BC=
=3Dm=0ACONFIG_SENSORS_PLI1209BC_REGULATOR=3Dy=0ACONFIG_SENSORS_PM6764TR=3Dm=
=0ACONFIG_SENSORS_PXE1610=3Dm=0ACONFIG_SENSORS_Q54SJ108A2=3Dm=0ACONFIG_SENS=
ORS_STPDDC60=3Dm=0ACONFIG_SENSORS_TDA38640=3Dm=0ACONFIG_SENSORS_TDA38640_RE=
GULATOR=3Dy=0ACONFIG_SENSORS_TPS25990=3Dm=0ACONFIG_SENSORS_TPS25990_REGULAT=
OR=3Dy=0ACONFIG_SENSORS_TPS40422=3Dm=0ACONFIG_SENSORS_TPS53679=3Dm=0ACONFIG=
_SENSORS_TPS546D24=3Dm=0ACONFIG_SENSORS_UCD9000=3Dm=0ACONFIG_SENSORS_UCD920=
0=3Dm=0ACONFIG_SENSORS_XDP710=3Dm=0ACONFIG_SENSORS_XDPE152=3Dm=0ACONFIG_SEN=
SORS_XDPE122=3Dm=0ACONFIG_SENSORS_XDPE122_REGULATOR=3Dy=0ACONFIG_SENSORS_ZL=
6100=3Dm=0ACONFIG_SENSORS_PT5161L=3Dm=0ACONFIG_SENSORS_PWM_FAN=3Dm=0ACONFIG=
_SENSORS_SBTSI=3Dm=0ACONFIG_SENSORS_SHT15=3Dm=0ACONFIG_SENSORS_SHT21=3Dm=0A=
CONFIG_SENSORS_SHT3x=3Dm=0ACONFIG_SENSORS_SHT4x=3Dm=0ACONFIG_SENSORS_SHTC1=
=3Dm=0ACONFIG_SENSORS_SIS5595=3Dm=0ACONFIG_SENSORS_DME1737=3Dm=0ACONFIG_SEN=
SORS_EMC1403=3Dm=0ACONFIG_SENSORS_EMC2103=3Dm=0ACONFIG_SENSORS_EMC2305=3Dm=
=0ACONFIG_SENSORS_EMC6W201=3Dm=0ACONFIG_SENSORS_SMSC47M1=3Dm=0ACONFIG_SENSO=
RS_SMSC47M192=3Dm=0ACONFIG_SENSORS_SMSC47B397=3Dm=0ACONFIG_SENSORS_SCH56XX_=
COMMON=3Dm=0ACONFIG_SENSORS_SCH5627=3Dm=0ACONFIG_SENSORS_SCH5636=3Dm=0ACONF=
IG_SENSORS_STTS751=3Dm=0ACONFIG_SENSORS_SURFACE_FAN=3Dm=0ACONFIG_SENSORS_SU=
RFACE_TEMP=3Dm=0ACONFIG_SENSORS_ADC128D818=3Dm=0ACONFIG_SENSORS_ADS7828=3Dm=
=0A# CONFIG_SENSORS_ADS7871 is not set=0ACONFIG_SENSORS_AMC6821=3Dm=0ACONFI=
G_SENSORS_INA209=3Dm=0ACONFIG_SENSORS_INA2XX=3Dm=0ACONFIG_SENSORS_INA238=3D=
m=0ACONFIG_SENSORS_INA3221=3Dm=0ACONFIG_SENSORS_SPD5118=3Dm=0ACONFIG_SENSOR=
S_SPD5118_DETECT=3Dy=0ACONFIG_SENSORS_TC74=3Dm=0ACONFIG_SENSORS_THMC50=3Dm=
=0ACONFIG_SENSORS_TMP102=3Dm=0ACONFIG_SENSORS_TMP103=3Dm=0ACONFIG_SENSORS_T=
MP108=3Dm=0ACONFIG_SENSORS_TMP401=3Dm=0ACONFIG_SENSORS_TMP421=3Dm=0ACONFIG_=
SENSORS_TMP464=3Dm=0ACONFIG_SENSORS_TMP513=3Dm=0ACONFIG_SENSORS_TSC1641=3Dm=
=0ACONFIG_SENSORS_VIA_CPUTEMP=3Dm=0ACONFIG_SENSORS_VIA686A=3Dm=0ACONFIG_SEN=
SORS_VT1211=3Dm=0ACONFIG_SENSORS_VT8231=3Dm=0ACONFIG_SENSORS_W83773G=3Dm=0A=
CONFIG_SENSORS_W83781D=3Dm=0ACONFIG_SENSORS_W83791D=3Dm=0ACONFIG_SENSORS_W8=
3792D=3Dm=0ACONFIG_SENSORS_W83793=3Dm=0ACONFIG_SENSORS_W83795=3Dm=0A# CONFI=
G_SENSORS_W83795_FANCTRL is not set=0ACONFIG_SENSORS_W83L785TS=3Dm=0ACONFIG=
_SENSORS_W83L786NG=3Dm=0ACONFIG_SENSORS_W83627HF=3Dm=0ACONFIG_SENSORS_W8362=
7EHF=3Dm=0A# CONFIG_SENSORS_XGENE is not set=0A=0A#=0A# ACPI drivers=0A#=0A=
CONFIG_SENSORS_ACPI_POWER=3Dm=0ACONFIG_SENSORS_ATK0110=3Dm=0ACONFIG_SENSORS=
_ASUS_WMI=3Dm=0ACONFIG_SENSORS_ASUS_EC=3Dm=0ACONFIG_SENSORS_HP_WMI=3Dm=0ACO=
NFIG_THERMAL=3Dy=0ACONFIG_THERMAL_NETLINK=3Dy=0ACONFIG_THERMAL_STATISTICS=
=3Dy=0A# CONFIG_THERMAL_DEBUGFS is not set=0A# CONFIG_THERMAL_CORE_TESTING =
is not set=0ACONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0=0ACONFIG_THERMA=
L_HWMON=3Dy=0ACONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy=0A# CONFIG_THERMAL_D=
EFAULT_GOV_FAIR_SHARE is not set=0A# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE =
is not set=0A# CONFIG_THERMAL_DEFAULT_GOV_BANG_BANG is not set=0ACONFIG_THE=
RMAL_GOV_FAIR_SHARE=3Dy=0ACONFIG_THERMAL_GOV_STEP_WISE=3Dy=0ACONFIG_THERMAL=
_GOV_BANG_BANG=3Dy=0ACONFIG_THERMAL_GOV_USER_SPACE=3Dy=0A# CONFIG_THERMAL_G=
OV_POWER_ALLOCATOR is not set=0ACONFIG_DEVFREQ_THERMAL=3Dy=0ACONFIG_PCIE_TH=
ERMAL=3Dy=0A# CONFIG_THERMAL_EMULATION is not set=0A=0A#=0A# Intel thermal =
drivers=0A#=0ACONFIG_INTEL_POWERCLAMP=3Dm=0ACONFIG_X86_THERMAL_VECTOR=3Dy=
=0ACONFIG_INTEL_TCC=3Dy=0ACONFIG_X86_PKG_TEMP_THERMAL=3Dm=0ACONFIG_INTEL_SO=
C_DTS_IOSF_CORE=3Dm=0ACONFIG_INTEL_SOC_DTS_THERMAL=3Dm=0A=0A#=0A# ACPI INT3=
40X thermal drivers=0A#=0ACONFIG_INT340X_THERMAL=3Dm=0ACONFIG_ACPI_THERMAL_=
REL=3Dm=0ACONFIG_INT3406_THERMAL=3Dm=0ACONFIG_PROC_THERMAL_MMIO_RAPL=3Dm=0A=
# end of ACPI INT340X thermal drivers=0A=0ACONFIG_INTEL_BXT_PMIC_THERMAL=3D=
m=0ACONFIG_INTEL_PCH_THERMAL=3Dm=0ACONFIG_INTEL_TCC_COOLING=3Dm=0ACONFIG_IN=
TEL_HFI_THERMAL=3Dy=0A# end of Intel thermal drivers=0A=0ACONFIG_GENERIC_AD=
C_THERMAL=3Dm=0ACONFIG_WATCHDOG=3Dy=0ACONFIG_WATCHDOG_CORE=3Dy=0A# CONFIG_W=
ATCHDOG_NOWAYOUT is not set=0ACONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy=0ACON=
FIG_WATCHDOG_OPEN_TIMEOUT=3D0=0ACONFIG_WATCHDOG_SYSFS=3Dy=0ACONFIG_WATCHDOG=
_HRTIMER_PRETIMEOUT=3Dy=0A=0A#=0A# Watchdog Pretimeout Governors=0A#=0ACONF=
IG_WATCHDOG_PRETIMEOUT_GOV=3Dy=0ACONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=3Dm=0AC=
ONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=3Dy=0ACONFIG_WATCHDOG_PRETIMEOUT_GOV_PAN=
IC=3Dm=0ACONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP=3Dy=0A# CONFIG_WATCHDO=
G_PRETIMEOUT_DEFAULT_GOV_PANIC is not set=0A=0A#=0A# Watchdog Device Driver=
s=0A#=0ACONFIG_SOFT_WATCHDOG=3Dm=0ACONFIG_SOFT_WATCHDOG_PRETIMEOUT=3Dy=0ACO=
NFIG_CROS_EC_WATCHDOG=3Dm=0ACONFIG_DA9062_WATCHDOG=3Dm=0ACONFIG_LENOVO_SE10=
_WDT=3Dm=0ACONFIG_LENOVO_SE30_WDT=3Dm=0ACONFIG_WDAT_WDT=3Dm=0A# CONFIG_XILI=
NX_WATCHDOG is not set=0ACONFIG_ZIIRAVE_WATCHDOG=3Dm=0ACONFIG_MLX_WDT=3Dm=
=0A# CONFIG_CADENCE_WATCHDOG is not set=0A# CONFIG_DW_WATCHDOG is not set=
=0A# CONFIG_MAX63XX_WATCHDOG is not set=0ACONFIG_ACQUIRE_WDT=3Dm=0ACONFIG_A=
DVANTECH_WDT=3Dm=0ACONFIG_ADVANTECH_EC_WDT=3Dm=0ACONFIG_ALIM1535_WDT=3Dm=0A=
CONFIG_ALIM7101_WDT=3Dm=0ACONFIG_EBC_C384_WDT=3Dm=0ACONFIG_EXAR_WDT=3Dm=0AC=
ONFIG_F71808E_WDT=3Dm=0ACONFIG_SP5100_TCO=3Dm=0ACONFIG_SBC_FITPC2_WATCHDOG=
=3Dm=0ACONFIG_EUROTECH_WDT=3Dm=0ACONFIG_IB700_WDT=3Dm=0ACONFIG_IBMASR=3Dm=
=0ACONFIG_WAFER_WDT=3Dm=0ACONFIG_I6300ESB_WDT=3Dm=0A# CONFIG_IE6XX_WDT is n=
ot set=0ACONFIG_INTEL_OC_WATCHDOG=3Dm=0ACONFIG_ITCO_WDT=3Dm=0ACONFIG_ITCO_V=
ENDOR_SUPPORT=3Dy=0ACONFIG_IT8712F_WDT=3Dm=0ACONFIG_IT87_WDT=3Dm=0ACONFIG_H=
P_WATCHDOG=3Dm=0ACONFIG_HPWDT_NMI_DECODING=3Dy=0ACONFIG_KEMPLD_WDT=3Dm=0ACO=
NFIG_SC1200_WDT=3Dm=0ACONFIG_PC87413_WDT=3Dm=0ACONFIG_NV_TCO=3Dm=0ACONFIG_6=
0XX_WDT=3Dm=0ACONFIG_SMSC_SCH311X_WDT=3Dm=0ACONFIG_SMSC37B787_WDT=3Dm=0ACON=
FIG_TQMX86_WDT=3Dm=0ACONFIG_VIA_WDT=3Dm=0ACONFIG_W83627HF_WDT=3Dm=0ACONFIG_=
W83877F_WDT=3Dm=0ACONFIG_W83977F_WDT=3Dm=0ACONFIG_MACHZ_WDT=3Dm=0ACONFIG_SB=
C_EPX_C3_WATCHDOG=3Dm=0ACONFIG_INTEL_MEI_WDT=3Dm=0ACONFIG_NI903X_WDT=3Dm=0A=
CONFIG_NIC7018_WDT=3Dm=0ACONFIG_SIEMENS_SIMATIC_IPC_WDT=3Dm=0ACONFIG_MEN_A2=
1_WDT=3Dm=0ACONFIG_XEN_WDT=3Dm=0A=0A#=0A# PCI-based Watchdog Cards=0A#=0ACO=
NFIG_PCIPCWATCHDOG=3Dm=0ACONFIG_WDTPCI=3Dm=0A=0A#=0A# USB-based Watchdog Ca=
rds=0A#=0ACONFIG_USBPCWATCHDOG=3Dm=0ACONFIG_SSB_POSSIBLE=3Dy=0ACONFIG_SSB=
=3Dm=0ACONFIG_SSB_SPROM=3Dy=0ACONFIG_SSB_BLOCKIO=3Dy=0ACONFIG_SSB_PCIHOST_P=
OSSIBLE=3Dy=0ACONFIG_SSB_PCIHOST=3Dy=0ACONFIG_SSB_B43_PCI_BRIDGE=3Dy=0ACONF=
IG_SSB_PCMCIAHOST_POSSIBLE=3Dy=0ACONFIG_SSB_PCMCIAHOST=3Dy=0ACONFIG_SSB_SDI=
OHOST_POSSIBLE=3Dy=0ACONFIG_SSB_SDIOHOST=3Dy=0ACONFIG_SSB_DRIVER_PCICORE_PO=
SSIBLE=3Dy=0ACONFIG_SSB_DRIVER_PCICORE=3Dy=0ACONFIG_SSB_DRIVER_GPIO=3Dy=0AC=
ONFIG_BCMA_POSSIBLE=3Dy=0ACONFIG_BCMA=3Dm=0ACONFIG_BCMA_BLOCKIO=3Dy=0ACONFI=
G_BCMA_HOST_PCI_POSSIBLE=3Dy=0ACONFIG_BCMA_HOST_PCI=3Dy=0A# CONFIG_BCMA_HOS=
T_SOC is not set=0ACONFIG_BCMA_DRIVER_PCI=3Dy=0ACONFIG_BCMA_DRIVER_GMAC_CMN=
=3Dy=0ACONFIG_BCMA_DRIVER_GPIO=3Dy=0A# CONFIG_BCMA_DEBUG is not set=0A=0A#=
=0A# Multifunction device drivers=0A#=0ACONFIG_MFD_CORE=3Dy=0A# CONFIG_MFD_=
AS3711 is not set=0A# CONFIG_MFD_SMPRO is not set=0A# CONFIG_PMIC_ADP5520 i=
s not set=0A# CONFIG_MFD_AAT2870_CORE is not set=0A# CONFIG_MFD_BCM590XX is=
 not set=0A# CONFIG_MFD_BD9571MWV is not set=0ACONFIG_MFD_AXP20X=3Dm=0ACONF=
IG_MFD_AXP20X_I2C=3Dm=0A# CONFIG_MFD_CGBC is not set=0ACONFIG_MFD_CROS_EC_D=
EV=3Dm=0A# CONFIG_MFD_CS40L50_I2C is not set=0A# CONFIG_MFD_CS40L50_SPI is =
not set=0ACONFIG_MFD_CS42L43=3Dm=0ACONFIG_MFD_CS42L43_I2C=3Dm=0ACONFIG_MFD_=
CS42L43_SDW=3Dm=0ACONFIG_MFD_MADERA=3Dm=0ACONFIG_MFD_MADERA_I2C=3Dm=0ACONFI=
G_MFD_MADERA_SPI=3Dm=0ACONFIG_MFD_CS47L15=3Dy=0ACONFIG_MFD_CS47L35=3Dy=0ACO=
NFIG_MFD_CS47L85=3Dy=0ACONFIG_MFD_CS47L90=3Dy=0ACONFIG_MFD_CS47L92=3Dy=0A# =
CONFIG_PMIC_DA903X is not set=0A# CONFIG_MFD_DA9052_SPI is not set=0A# CONF=
IG_MFD_DA9052_I2C is not set=0A# CONFIG_MFD_DA9055 is not set=0ACONFIG_MFD_=
DA9062=3Dm=0A# CONFIG_MFD_DA9063 is not set=0A# CONFIG_MFD_DA9150 is not se=
t=0ACONFIG_MFD_DLN2=3Dm=0A# CONFIG_MFD_MC13XXX_SPI is not set=0A# CONFIG_MF=
D_MC13XXX_I2C is not set=0A# CONFIG_MFD_MP2629 is not set=0ACONFIG_MFD_INTE=
L_QUARK_I2C_GPIO=3Dm=0ACONFIG_LPC_ICH=3Dm=0ACONFIG_LPC_SCH=3Dm=0ACONFIG_INT=
EL_SOC_PMIC=3Dy=0ACONFIG_INTEL_SOC_PMIC_BXTWC=3Dm=0ACONFIG_INTEL_SOC_PMIC_C=
HTWC=3Dy=0ACONFIG_INTEL_SOC_PMIC_CHTDC_TI=3Dm=0ACONFIG_INTEL_SOC_PMIC_MRFLD=
=3Dm=0ACONFIG_MFD_INTEL_LPSS=3Dm=0ACONFIG_MFD_INTEL_LPSS_ACPI=3Dm=0ACONFIG_=
MFD_INTEL_LPSS_PCI=3Dm=0ACONFIG_MFD_INTEL_PMC_BXT=3Dm=0ACONFIG_MFD_IQS62X=
=3Dm=0A# CONFIG_MFD_JANZ_CMODIO is not set=0ACONFIG_MFD_KEMPLD=3Dm=0A# CONF=
IG_MFD_88PM800 is not set=0A# CONFIG_MFD_88PM805 is not set=0A# CONFIG_MFD_=
88PM860X is not set=0A# CONFIG_MFD_MAX5970 is not set=0A# CONFIG_MFD_MAX145=
77 is not set=0A# CONFIG_MFD_MAX77541 is not set=0A# CONFIG_MFD_MAX77693 is=
 not set=0A# CONFIG_MFD_MAX77705 is not set=0A# CONFIG_MFD_MAX77843 is not =
set=0ACONFIG_MFD_MAX8907=3Dm=0A# CONFIG_MFD_MAX8925 is not set=0A# CONFIG_M=
FD_MAX8997 is not set=0A# CONFIG_MFD_MAX8998 is not set=0A# CONFIG_MFD_MT63=
60 is not set=0A# CONFIG_MFD_MT6370 is not set=0A# CONFIG_MFD_MT6397 is not=
 set=0A# CONFIG_MFD_MENF21BMC is not set=0A# CONFIG_MFD_NCT6694 is not set=
=0ACONFIG_MFD_OCELOT=3Dm=0A# CONFIG_EZX_PCAP is not set=0ACONFIG_MFD_VIPERB=
OARD=3Dm=0A# CONFIG_MFD_RETU is not set=0A# CONFIG_MFD_SY7636A is not set=
=0A# CONFIG_MFD_RDC321X is not set=0ACONFIG_MFD_RT4831=3Dm=0A# CONFIG_MFD_R=
T5033 is not set=0A# CONFIG_MFD_RT5120 is not set=0A# CONFIG_MFD_RC5T583 is=
 not set=0A# CONFIG_MFD_SI476X_CORE is not set=0ACONFIG_MFD_SIMPLE_MFD_I2C=
=3Dm=0A# CONFIG_MFD_SM501 is not set=0A# CONFIG_MFD_SKY81452 is not set=0A#=
 CONFIG_MFD_SYSCON is not set=0ACONFIG_MFD_LP3943=3Dm=0A# CONFIG_MFD_LP8788=
 is not set=0ACONFIG_MFD_TI_LMU=3Dm=0ACONFIG_MFD_BQ257XX=3Dm=0A# CONFIG_MFD=
_PALMAS is not set=0A# CONFIG_TPS6105X is not set=0ACONFIG_TPS65010=3Dm=0AC=
ONFIG_TPS6507X=3Dm=0A# CONFIG_MFD_TPS65086 is not set=0A# CONFIG_MFD_TPS650=
90 is not set=0A# CONFIG_MFD_TI_LP873X is not set=0A# CONFIG_MFD_TPS6586X i=
s not set=0A# CONFIG_MFD_TPS65910 is not set=0A# CONFIG_MFD_TPS65912_I2C is=
 not set=0A# CONFIG_MFD_TPS65912_SPI is not set=0ACONFIG_MFD_TPS6594=3Dm=0A=
CONFIG_MFD_TPS6594_I2C=3Dm=0ACONFIG_MFD_TPS6594_SPI=3Dm=0A# CONFIG_TWL4030_=
CORE is not set=0A# CONFIG_TWL6040_CORE is not set=0ACONFIG_MFD_LM3533=3Dm=
=0ACONFIG_MFD_TQMX86=3Dm=0ACONFIG_MFD_VX855=3Dm=0A# CONFIG_MFD_ARIZONA_I2C =
is not set=0A# CONFIG_MFD_ARIZONA_SPI is not set=0A# CONFIG_MFD_WM8400 is n=
ot set=0A# CONFIG_MFD_WM831X_I2C is not set=0A# CONFIG_MFD_WM831X_SPI is no=
t set=0A# CONFIG_MFD_WM8350_I2C is not set=0A# CONFIG_MFD_WM8994 is not set=
=0A# CONFIG_MFD_ATC260X_I2C is not set=0A# CONFIG_RAVE_SP_CORE is not set=
=0A# CONFIG_MFD_INTEL_M10_BMC_CORE is not set=0A# CONFIG_MFD_INTEL_M10_BMC_=
SPI is not set=0A# CONFIG_MFD_INTEL_M10_BMC_PMCI is not set=0A# CONFIG_MFD_=
QNAP_MCU is not set=0A# CONFIG_MFD_UPBOARD_FPGA is not set=0A# CONFIG_MFD_M=
AX7360 is not set=0A# end of Multifunction device drivers=0A=0ACONFIG_REGUL=
ATOR=3Dy=0A# CONFIG_REGULATOR_DEBUG is not set=0ACONFIG_REGULATOR_FIXED_VOL=
TAGE=3Dm=0ACONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dm=0ACONFIG_REGULATOR_USERSPA=
CE_CONSUMER=3Dm=0ACONFIG_REGULATOR_NETLINK_EVENTS=3Dy=0ACONFIG_REGULATOR_88=
PG86X=3Dm=0ACONFIG_REGULATOR_ACT8865=3Dm=0ACONFIG_REGULATOR_AD5398=3Dm=0ACO=
NFIG_REGULATOR_ADP5055=3Dm=0ACONFIG_REGULATOR_ARIZONA_LDO1=3Dm=0ACONFIG_REG=
ULATOR_ARIZONA_MICSUPP=3Dm=0ACONFIG_REGULATOR_AW37503=3Dm=0ACONFIG_REGULATO=
R_AXP20X=3Dm=0ACONFIG_REGULATOR_BQ257XX=3Dm=0ACONFIG_REGULATOR_DA9062=3Dm=
=0ACONFIG_REGULATOR_DA9210=3Dm=0ACONFIG_REGULATOR_DA9211=3Dm=0ACONFIG_REGUL=
ATOR_FAN53555=3Dm=0ACONFIG_REGULATOR_GPIO=3Dm=0ACONFIG_REGULATOR_ISL9305=3D=
m=0ACONFIG_REGULATOR_ISL6271A=3Dm=0ACONFIG_REGULATOR_FP9931=3Dm=0ACONFIG_RE=
GULATOR_LM363X=3Dm=0ACONFIG_REGULATOR_LP3971=3Dm=0ACONFIG_REGULATOR_LP3972=
=3Dm=0ACONFIG_REGULATOR_LP872X=3Dm=0ACONFIG_REGULATOR_LP8755=3Dm=0ACONFIG_R=
EGULATOR_LTC3589=3Dm=0ACONFIG_REGULATOR_LTC3676=3Dm=0ACONFIG_REGULATOR_MAX1=
586=3Dm=0ACONFIG_REGULATOR_MAX77503=3Dm=0ACONFIG_REGULATOR_MAX77857=3Dm=0AC=
ONFIG_REGULATOR_MAX8649=3Dm=0ACONFIG_REGULATOR_MAX8660=3Dm=0ACONFIG_REGULAT=
OR_MAX8893=3Dm=0ACONFIG_REGULATOR_MAX8907=3Dm=0ACONFIG_REGULATOR_MAX8952=3D=
m=0ACONFIG_REGULATOR_MAX20086=3Dm=0ACONFIG_REGULATOR_MAX20411=3Dm=0ACONFIG_=
REGULATOR_MAX77826=3Dm=0ACONFIG_REGULATOR_MAX77838=3Dm=0ACONFIG_REGULATOR_M=
P8859=3Dm=0ACONFIG_REGULATOR_MT6311=3Dm=0ACONFIG_REGULATOR_MT6315=3Dm=0ACON=
FIG_REGULATOR_MT6316=3Dm=0ACONFIG_REGULATOR_MT6363=3Dm=0ACONFIG_REGULATOR_P=
CA9450=3Dm=0ACONFIG_REGULATOR_PF9453=3Dm=0ACONFIG_REGULATOR_PF0900=3Dm=0ACO=
NFIG_REGULATOR_PV88060=3Dm=0ACONFIG_REGULATOR_PV88080=3Dm=0ACONFIG_REGULATO=
R_PV88090=3Dm=0ACONFIG_REGULATOR_PWM=3Dm=0ACONFIG_REGULATOR_QCOM_SPMI=3Dm=
=0ACONFIG_REGULATOR_QCOM_USB_VBUS=3Dm=0ACONFIG_REGULATOR_RAA215300=3Dm=0ACO=
NFIG_REGULATOR_RT4801=3Dm=0ACONFIG_REGULATOR_RT4803=3Dm=0ACONFIG_REGULATOR_=
RT4831=3Dm=0ACONFIG_REGULATOR_RT5190A=3Dm=0ACONFIG_REGULATOR_RT5739=3Dm=0AC=
ONFIG_REGULATOR_RT5759=3Dm=0ACONFIG_REGULATOR_RT6160=3Dm=0ACONFIG_REGULATOR=
_RT6190=3Dm=0ACONFIG_REGULATOR_RT6245=3Dm=0ACONFIG_REGULATOR_RTQ2134=3Dm=0A=
CONFIG_REGULATOR_RTMV20=3Dm=0ACONFIG_REGULATOR_RTQ6752=3Dm=0ACONFIG_REGULAT=
OR_RTQ2208=3Dm=0ACONFIG_REGULATOR_SLG51000=3Dm=0ACONFIG_REGULATOR_TPS51632=
=3Dm=0ACONFIG_REGULATOR_TPS62360=3Dm=0ACONFIG_REGULATOR_TPS65023=3Dm=0ACONF=
IG_REGULATOR_TPS6507X=3Dm=0ACONFIG_REGULATOR_TPS65132=3Dm=0ACONFIG_REGULATO=
R_TPS6524X=3Dm=0ACONFIG_REGULATOR_TPS68470=3Dm=0ACONFIG_REGULATOR_QCOM_LABI=
BB=3Dm=0ACONFIG_RC_CORE=3Dm=0ACONFIG_LIRC=3Dy=0ACONFIG_RC_MAP=3Dm=0ACONFIG_=
RC_DECODERS=3Dy=0ACONFIG_IR_IMON_DECODER=3Dm=0ACONFIG_IR_JVC_DECODER=3Dm=0A=
CONFIG_IR_MCE_KBD_DECODER=3Dm=0ACONFIG_IR_NEC_DECODER=3Dm=0ACONFIG_IR_RC5_D=
ECODER=3Dm=0ACONFIG_IR_RC6_DECODER=3Dm=0ACONFIG_IR_RCMM_DECODER=3Dm=0ACONFI=
G_IR_SANYO_DECODER=3Dm=0ACONFIG_IR_SHARP_DECODER=3Dm=0ACONFIG_IR_SONY_DECOD=
ER=3Dm=0ACONFIG_IR_XMP_DECODER=3Dm=0ACONFIG_RC_DEVICES=3Dy=0ACONFIG_IR_ENE=
=3Dm=0ACONFIG_IR_FINTEK=3Dm=0ACONFIG_IR_IGORPLUGUSB=3Dm=0ACONFIG_IR_IGUANA=
=3Dm=0ACONFIG_IR_IMON=3Dm=0ACONFIG_IR_IMON_RAW=3Dm=0ACONFIG_IR_ITE_CIR=3Dm=
=0ACONFIG_IR_MCEUSB=3Dm=0ACONFIG_IR_NUVOTON=3Dm=0ACONFIG_IR_REDRAT3=3Dm=0AC=
ONFIG_IR_SERIAL=3Dm=0ACONFIG_IR_SERIAL_TRANSMITTER=3Dy=0ACONFIG_IR_STREAMZA=
P=3Dm=0ACONFIG_IR_TOY=3Dm=0ACONFIG_IR_TTUSBIR=3Dm=0ACONFIG_IR_WINBOND_CIR=
=3Dm=0ACONFIG_RC_ATI_REMOTE=3Dm=0ACONFIG_RC_LOOPBACK=3Dm=0ACONFIG_RC_XBOX_D=
VD=3Dm=0ACONFIG_CEC_CORE=3Dm=0ACONFIG_CEC_NOTIFIER=3Dy=0ACONFIG_CEC_PIN=3Dy=
=0A=0A#=0A# CEC support=0A#=0ACONFIG_MEDIA_CEC_RC=3Dy=0A# CONFIG_CEC_PIN_ER=
ROR_INJ is not set=0ACONFIG_MEDIA_CEC_SUPPORT=3Dy=0ACONFIG_CEC_CH7322=3Dm=
=0ACONFIG_CEC_NXP_TDA9950=3Dm=0ACONFIG_CEC_CROS_EC=3Dm=0ACONFIG_CEC_GPIO=3D=
m=0ACONFIG_CEC_SECO=3Dm=0A# CONFIG_CEC_SECO_RC is not set=0ACONFIG_USB_EXTR=
ON_DA_HD_4K_PLUS_CEC=3Dm=0ACONFIG_USB_PULSE8_CEC=3Dm=0ACONFIG_USB_RAINSHADO=
W_CEC=3Dm=0A# end of CEC support=0A=0ACONFIG_MEDIA_SUPPORT=3Dm=0ACONFIG_MED=
IA_SUPPORT_FILTER=3Dy=0ACONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy=0A=0A#=0A# Media=
 device types=0A#=0ACONFIG_MEDIA_CAMERA_SUPPORT=3Dy=0ACONFIG_MEDIA_ANALOG_T=
V_SUPPORT=3Dy=0ACONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy=0ACONFIG_MEDIA_RADIO_SU=
PPORT=3Dy=0ACONFIG_MEDIA_SDR_SUPPORT=3Dy=0A# CONFIG_MEDIA_PLATFORM_SUPPORT =
is not set=0A# CONFIG_MEDIA_TEST_SUPPORT is not set=0A# end of Media device=
 types=0A=0ACONFIG_VIDEO_DEV=3Dm=0ACONFIG_MEDIA_CONTROLLER=3Dy=0ACONFIG_DVB=
_CORE=3Dm=0A=0A#=0A# Video4Linux options=0A#=0ACONFIG_VIDEO_V4L2_I2C=3Dy=0A=
CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy=0A# CONFIG_VIDEO_ADV_DEBUG is not set=0A# =
CONFIG_VIDEO_FIXED_MINOR_RANGES is not set=0ACONFIG_VIDEO_TUNER=3Dm=0ACONFI=
G_V4L2_FLASH_LED_CLASS=3Dm=0ACONFIG_V4L2_FWNODE=3Dm=0ACONFIG_V4L2_ASYNC=3Dm=
=0ACONFIG_V4L2_CCI=3Dm=0ACONFIG_V4L2_CCI_I2C=3Dm=0A# end of Video4Linux opt=
ions=0A=0A#=0A# Media controller options=0A#=0ACONFIG_MEDIA_CONTROLLER_DVB=
=3Dy=0A# end of Media controller options=0A=0A#=0A# Digital TV options=0A#=
=0A# CONFIG_DVB_MMAP is not set=0ACONFIG_DVB_NET=3Dy=0ACONFIG_DVB_MAX_ADAPT=
ERS=3D8=0ACONFIG_DVB_DYNAMIC_MINORS=3Dy=0A# CONFIG_DVB_DEMUX_SECTION_LOSS_L=
OG is not set=0A# CONFIG_DVB_ULE_DEBUG is not set=0A# end of Digital TV opt=
ions=0A=0A#=0A# Media drivers=0A#=0A=0A#=0A# Drivers filtered as selected a=
t 'Filter media drivers'=0A#=0A=0A#=0A# Media drivers=0A#=0ACONFIG_MEDIA_US=
B_SUPPORT=3Dy=0A=0A#=0A# Webcam devices=0A#=0ACONFIG_USB_GSPCA=3Dm=0ACONFIG=
_USB_GSPCA_BENQ=3Dm=0ACONFIG_USB_GSPCA_CONEX=3Dm=0ACONFIG_USB_GSPCA_CPIA1=
=3Dm=0ACONFIG_USB_GSPCA_DTCS033=3Dm=0ACONFIG_USB_GSPCA_ETOMS=3Dm=0ACONFIG_U=
SB_GSPCA_FINEPIX=3Dm=0ACONFIG_USB_GSPCA_JEILINJ=3Dm=0ACONFIG_USB_GSPCA_JL20=
05BCD=3Dm=0ACONFIG_USB_GSPCA_KINECT=3Dm=0ACONFIG_USB_GSPCA_KONICA=3Dm=0ACON=
FIG_USB_GSPCA_MARS=3Dm=0ACONFIG_USB_GSPCA_MR97310A=3Dm=0ACONFIG_USB_GSPCA_N=
W80X=3Dm=0ACONFIG_USB_GSPCA_OV519=3Dm=0ACONFIG_USB_GSPCA_OV534=3Dm=0ACONFIG=
_USB_GSPCA_OV534_9=3Dm=0ACONFIG_USB_GSPCA_PAC207=3Dm=0ACONFIG_USB_GSPCA_PAC=
7302=3Dm=0ACONFIG_USB_GSPCA_PAC7311=3Dm=0ACONFIG_USB_GSPCA_SE401=3Dm=0ACONF=
IG_USB_GSPCA_SN9C2028=3Dm=0ACONFIG_USB_GSPCA_SN9C20X=3Dm=0ACONFIG_USB_GSPCA=
_SONIXB=3Dm=0ACONFIG_USB_GSPCA_SONIXJ=3Dm=0ACONFIG_USB_GSPCA_SPCA1528=3Dm=
=0ACONFIG_USB_GSPCA_SPCA500=3Dm=0ACONFIG_USB_GSPCA_SPCA501=3Dm=0ACONFIG_USB=
_GSPCA_SPCA505=3Dm=0ACONFIG_USB_GSPCA_SPCA506=3Dm=0ACONFIG_USB_GSPCA_SPCA50=
8=3Dm=0ACONFIG_USB_GSPCA_SPCA561=3Dm=0ACONFIG_USB_GSPCA_SQ905=3Dm=0ACONFIG_=
USB_GSPCA_SQ905C=3Dm=0ACONFIG_USB_GSPCA_SQ930X=3Dm=0ACONFIG_USB_GSPCA_STK01=
4=3Dm=0ACONFIG_USB_GSPCA_STK1135=3Dm=0ACONFIG_USB_GSPCA_STV0680=3Dm=0ACONFI=
G_USB_GSPCA_SUNPLUS=3Dm=0ACONFIG_USB_GSPCA_T613=3Dm=0ACONFIG_USB_GSPCA_TOPR=
O=3Dm=0ACONFIG_USB_GSPCA_TOUPTEK=3Dm=0ACONFIG_USB_GSPCA_TV8532=3Dm=0ACONFIG=
_USB_GSPCA_VC032X=3Dm=0ACONFIG_USB_GSPCA_VICAM=3Dm=0ACONFIG_USB_GSPCA_XIRLI=
NK_CIT=3Dm=0ACONFIG_USB_GSPCA_ZC3XX=3Dm=0ACONFIG_USB_GL860=3Dm=0ACONFIG_USB=
_M5602=3Dm=0ACONFIG_USB_STV06XX=3Dm=0ACONFIG_USB_PWC=3Dm=0A# CONFIG_USB_PWC=
_DEBUG is not set=0ACONFIG_USB_PWC_INPUT_EVDEV=3Dy=0ACONFIG_USB_S2255=3Dm=
=0ACONFIG_VIDEO_USBTV=3Dm=0ACONFIG_USB_VIDEO_CLASS=3Dm=0ACONFIG_USB_VIDEO_C=
LASS_INPUT_EVDEV=3Dy=0A=0A#=0A# Analog TV USB devices=0A#=0ACONFIG_VIDEO_GO=
7007=3Dm=0ACONFIG_VIDEO_GO7007_USB=3Dm=0ACONFIG_VIDEO_GO7007_LOADER=3Dm=0AC=
ONFIG_VIDEO_GO7007_USB_S2250_BOARD=3Dm=0ACONFIG_VIDEO_HDPVR=3Dm=0ACONFIG_VI=
DEO_PVRUSB2=3Dm=0ACONFIG_VIDEO_PVRUSB2_SYSFS=3Dy=0ACONFIG_VIDEO_PVRUSB2_DVB=
=3Dy=0A# CONFIG_VIDEO_PVRUSB2_DEBUGIFC is not set=0ACONFIG_VIDEO_STK1160=3D=
m=0A=0A#=0A# Analog/digital TV USB devices=0A#=0ACONFIG_VIDEO_AU0828=3Dm=0A=
CONFIG_VIDEO_AU0828_V4L2=3Dy=0ACONFIG_VIDEO_AU0828_RC=3Dy=0ACONFIG_VIDEO_CX=
231XX=3Dm=0ACONFIG_VIDEO_CX231XX_RC=3Dy=0ACONFIG_VIDEO_CX231XX_ALSA=3Dm=0AC=
ONFIG_VIDEO_CX231XX_DVB=3Dm=0A=0A#=0A# Digital TV USB devices=0A#=0ACONFIG_=
DVB_AS102=3Dm=0ACONFIG_DVB_B2C2_FLEXCOP_USB=3Dm=0A# CONFIG_DVB_B2C2_FLEXCOP=
_USB_DEBUG is not set=0ACONFIG_DVB_USB_V2=3Dm=0ACONFIG_DVB_USB_AF9015=3Dm=
=0ACONFIG_DVB_USB_AF9035=3Dm=0ACONFIG_DVB_USB_ANYSEE=3Dm=0ACONFIG_DVB_USB_A=
U6610=3Dm=0ACONFIG_DVB_USB_AZ6007=3Dm=0ACONFIG_DVB_USB_CE6230=3Dm=0ACONFIG_=
DVB_USB_DVBSKY=3Dm=0ACONFIG_DVB_USB_EC168=3Dm=0ACONFIG_DVB_USB_GL861=3Dm=0A=
CONFIG_DVB_USB_LME2510=3Dm=0ACONFIG_DVB_USB_MXL111SF=3Dm=0ACONFIG_DVB_USB_R=
TL28XXU=3Dm=0ACONFIG_DVB_USB_ZD1301=3Dm=0ACONFIG_DVB_USB=3Dm=0A# CONFIG_DVB=
_USB_DEBUG is not set=0ACONFIG_DVB_USB_A800=3Dm=0ACONFIG_DVB_USB_AF9005=3Dm=
=0ACONFIG_DVB_USB_AF9005_REMOTE=3Dm=0ACONFIG_DVB_USB_AZ6027=3Dm=0ACONFIG_DV=
B_USB_CINERGY_T2=3Dm=0ACONFIG_DVB_USB_CXUSB=3Dm=0ACONFIG_DVB_USB_CXUSB_ANAL=
OG=3Dy=0ACONFIG_DVB_USB_DIB0700=3Dm=0ACONFIG_DVB_USB_DIB3000MC=3Dm=0ACONFIG=
_DVB_USB_DIBUSB_MB=3Dm=0A# CONFIG_DVB_USB_DIBUSB_MB_FAULTY is not set=0ACON=
FIG_DVB_USB_DIBUSB_MC=3Dm=0ACONFIG_DVB_USB_DIGITV=3Dm=0ACONFIG_DVB_USB_DTT2=
00U=3Dm=0ACONFIG_DVB_USB_DTV5100=3Dm=0ACONFIG_DVB_USB_DW2102=3Dm=0ACONFIG_D=
VB_USB_GP8PSK=3Dm=0ACONFIG_DVB_USB_M920X=3Dm=0ACONFIG_DVB_USB_NOVA_T_USB2=
=3Dm=0ACONFIG_DVB_USB_OPERA1=3Dm=0ACONFIG_DVB_USB_PCTV452E=3Dm=0ACONFIG_DVB=
_USB_TECHNISAT_USB2=3Dm=0ACONFIG_DVB_USB_TTUSB2=3Dm=0ACONFIG_DVB_USB_UMT_01=
0=3Dm=0ACONFIG_DVB_USB_VP702X=3Dm=0ACONFIG_DVB_USB_VP7045=3Dm=0ACONFIG_SMS_=
USB_DRV=3Dm=0ACONFIG_DVB_TTUSB_BUDGET=3Dm=0ACONFIG_DVB_TTUSB_DEC=3Dm=0A=0A#=
=0A# Webcam, TV (analog/digital) USB devices=0A#=0ACONFIG_VIDEO_EM28XX=3Dm=
=0ACONFIG_VIDEO_EM28XX_V4L2=3Dm=0ACONFIG_VIDEO_EM28XX_ALSA=3Dm=0ACONFIG_VID=
EO_EM28XX_DVB=3Dm=0ACONFIG_VIDEO_EM28XX_RC=3Dm=0A=0A#=0A# Software defined =
radio USB devices=0A#=0ACONFIG_USB_AIRSPY=3Dm=0ACONFIG_USB_HACKRF=3Dm=0ACON=
FIG_USB_MSI2500=3Dm=0ACONFIG_MEDIA_PCI_SUPPORT=3Dy=0A=0A#=0A# Media capture=
 support=0A#=0ACONFIG_VIDEO_MGB4=3Dm=0ACONFIG_VIDEO_SOLO6X10=3Dm=0ACONFIG_V=
IDEO_TW5864=3Dm=0ACONFIG_VIDEO_TW68=3Dm=0ACONFIG_VIDEO_TW686X=3Dm=0ACONFIG_=
VIDEO_ZORAN=3Dm=0ACONFIG_VIDEO_ZORAN_DC30=3Dy=0ACONFIG_VIDEO_ZORAN_ZR36060=
=3Dy=0ACONFIG_VIDEO_ZORAN_BUZ=3Dy=0ACONFIG_VIDEO_ZORAN_DC10=3Dy=0ACONFIG_VI=
DEO_ZORAN_LML33=3Dy=0ACONFIG_VIDEO_ZORAN_LML33R10=3Dy=0ACONFIG_VIDEO_ZORAN_=
AVS6EYES=3Dy=0A=0A#=0A# Media capture/analog TV support=0A#=0ACONFIG_VIDEO_=
DT3155=3Dm=0ACONFIG_VIDEO_IVTV=3Dm=0ACONFIG_VIDEO_IVTV_ALSA=3Dm=0ACONFIG_VI=
DEO_FB_IVTV=3Dm=0A# CONFIG_VIDEO_FB_IVTV_FORCE_PAT is not set=0A# CONFIG_VI=
DEO_HEXIUM_GEMINI is not set=0A# CONFIG_VIDEO_HEXIUM_ORION is not set=0A# C=
ONFIG_VIDEO_MXB is not set=0A=0A#=0A# Media capture/analog/hybrid TV suppor=
t=0A#=0ACONFIG_VIDEO_BT848=3Dm=0ACONFIG_DVB_BT8XX=3Dm=0A# CONFIG_VIDEO_COBA=
LT is not set=0ACONFIG_VIDEO_CX18=3Dm=0ACONFIG_VIDEO_CX18_ALSA=3Dm=0ACONFIG=
_VIDEO_CX23885=3Dm=0ACONFIG_MEDIA_ALTERA_CI=3Dm=0ACONFIG_VIDEO_CX25821=3Dm=
=0ACONFIG_VIDEO_CX25821_ALSA=3Dm=0ACONFIG_VIDEO_CX88=3Dm=0ACONFIG_VIDEO_CX8=
8_ALSA=3Dm=0ACONFIG_VIDEO_CX88_BLACKBIRD=3Dm=0ACONFIG_VIDEO_CX88_DVB=3Dm=0A=
CONFIG_VIDEO_CX88_ENABLE_VP3054=3Dy=0ACONFIG_VIDEO_CX88_VP3054=3Dm=0ACONFIG=
_VIDEO_CX88_MPEG=3Dm=0ACONFIG_VIDEO_SAA7134=3Dm=0ACONFIG_VIDEO_SAA7134_ALSA=
=3Dm=0ACONFIG_VIDEO_SAA7134_RC=3Dy=0ACONFIG_VIDEO_SAA7134_DVB=3Dm=0ACONFIG_=
VIDEO_SAA7134_GO7007=3Dm=0ACONFIG_VIDEO_SAA7164=3Dm=0A=0A#=0A# Media digita=
l TV PCI Adapters=0A#=0ACONFIG_DVB_B2C2_FLEXCOP_PCI=3Dm=0A# CONFIG_DVB_B2C2=
_FLEXCOP_PCI_DEBUG is not set=0ACONFIG_DVB_DDBRIDGE=3Dm=0A# CONFIG_DVB_DDBR=
IDGE_MSIENABLE is not set=0ACONFIG_DVB_DM1105=3Dm=0ACONFIG_MANTIS_CORE=3Dm=
=0ACONFIG_DVB_MANTIS=3Dm=0ACONFIG_DVB_HOPPER=3Dm=0ACONFIG_DVB_NETUP_UNIDVB=
=3Dm=0ACONFIG_DVB_NGENE=3Dm=0ACONFIG_DVB_PLUTO2=3Dm=0ACONFIG_DVB_PT1=3Dm=0A=
CONFIG_DVB_PT3=3Dm=0ACONFIG_DVB_SMIPCIE=3Dm=0ACONFIG_DVB_BUDGET_CORE=3Dm=0A=
CONFIG_DVB_BUDGET=3Dm=0ACONFIG_DVB_BUDGET_CI=3Dm=0A# CONFIG_DVB_BUDGET_AV i=
s not set=0ACONFIG_VIDEO_IPU3_CIO2=3Dm=0ACONFIG_VIDEO_INTEL_IPU6=3Dm=0ACONF=
IG_INTEL_VSC=3Dm=0ACONFIG_IPU_BRIDGE=3Dm=0ACONFIG_RADIO_ADAPTERS=3Dm=0ACONF=
IG_RADIO_MAXIRADIO=3Dm=0ACONFIG_RADIO_SAA7706H=3Dm=0ACONFIG_RADIO_SHARK=3Dm=
=0ACONFIG_RADIO_SHARK2=3Dm=0ACONFIG_RADIO_SI4713=3Dm=0ACONFIG_RADIO_TEA575X=
=3Dm=0ACONFIG_RADIO_TEA5764=3Dm=0ACONFIG_RADIO_TEF6862=3Dm=0ACONFIG_USB_DSB=
R=3Dm=0ACONFIG_USB_KEENE=3Dm=0ACONFIG_USB_MA901=3Dm=0ACONFIG_USB_MR800=3Dm=
=0ACONFIG_USB_RAREMONO=3Dm=0ACONFIG_RADIO_SI470X=3Dm=0ACONFIG_USB_SI470X=3D=
m=0A# CONFIG_I2C_SI470X is not set=0ACONFIG_USB_SI4713=3Dm=0ACONFIG_PLATFOR=
M_SI4713=3Dm=0ACONFIG_I2C_SI4713=3Dm=0A=0A#=0A# FireWire (IEEE 1394) Adapte=
rs=0A#=0ACONFIG_DVB_FIREDTV=3Dm=0ACONFIG_DVB_FIREDTV_INPUT=3Dy=0ACONFIG_MED=
IA_COMMON_OPTIONS=3Dy=0A=0A#=0A# common driver options=0A#=0ACONFIG_CYPRESS=
_FIRMWARE=3Dm=0ACONFIG_TTPCI_EEPROM=3Dm=0ACONFIG_UVC_COMMON=3Dm=0ACONFIG_VI=
DEO_CX2341X=3Dm=0ACONFIG_VIDEO_TVEEPROM=3Dm=0ACONFIG_DVB_B2C2_FLEXCOP=3Dm=
=0ACONFIG_VIDEO_SAA7146=3Dm=0ACONFIG_VIDEO_SAA7146_VV=3Dm=0ACONFIG_SMS_SIAN=
O_MDTV=3Dm=0ACONFIG_SMS_SIANO_RC=3Dy=0ACONFIG_VIDEOBUF2_CORE=3Dm=0ACONFIG_V=
IDEOBUF2_V4L2=3Dm=0ACONFIG_VIDEOBUF2_MEMOPS=3Dm=0ACONFIG_VIDEOBUF2_DMA_CONT=
IG=3Dm=0ACONFIG_VIDEOBUF2_VMALLOC=3Dm=0ACONFIG_VIDEOBUF2_DMA_SG=3Dm=0ACONFI=
G_VIDEOBUF2_DVB=3Dm=0A# end of Media drivers=0A=0A#=0A# Media ancillary dri=
vers=0A#=0ACONFIG_MEDIA_ATTACH=3Dy=0A=0A#=0A# IR I2C driver auto-selected b=
y 'Autoselect ancillary drivers'=0A#=0ACONFIG_VIDEO_IR_I2C=3Dm=0ACONFIG_VID=
EO_CAMERA_SENSOR=3Dy=0ACONFIG_VIDEO_APTINA_PLL=3Dm=0ACONFIG_VIDEO_CCS_PLL=
=3Dm=0ACONFIG_VIDEO_ALVIUM_CSI2=3Dm=0ACONFIG_VIDEO_AR0521=3Dm=0ACONFIG_VIDE=
O_GC0308=3Dm=0ACONFIG_VIDEO_GC0310=3Dm=0ACONFIG_VIDEO_GC05A2=3Dm=0ACONFIG_V=
IDEO_GC08A3=3Dm=0ACONFIG_VIDEO_GC2145=3Dm=0ACONFIG_VIDEO_HI556=3Dm=0ACONFIG=
_VIDEO_HI846=3Dm=0ACONFIG_VIDEO_HI847=3Dm=0ACONFIG_VIDEO_IMX111=3Dm=0ACONFI=
G_VIDEO_IMX208=3Dm=0ACONFIG_VIDEO_IMX214=3Dm=0ACONFIG_VIDEO_IMX219=3Dm=0ACO=
NFIG_VIDEO_IMX258=3Dm=0ACONFIG_VIDEO_IMX274=3Dm=0ACONFIG_VIDEO_IMX283=3Dm=
=0ACONFIG_VIDEO_IMX290=3Dm=0ACONFIG_VIDEO_IMX296=3Dm=0ACONFIG_VIDEO_IMX319=
=3Dm=0ACONFIG_VIDEO_IMX355=3Dm=0ACONFIG_VIDEO_MAX9271_LIB=3Dm=0ACONFIG_VIDE=
O_MT9M001=3Dm=0ACONFIG_VIDEO_MT9M111=3Dm=0ACONFIG_VIDEO_MT9M114=3Dm=0ACONFI=
G_VIDEO_MT9P031=3Dm=0ACONFIG_VIDEO_MT9T112=3Dm=0ACONFIG_VIDEO_MT9V011=3Dm=
=0ACONFIG_VIDEO_MT9V111=3Dm=0ACONFIG_VIDEO_OG01A1B=3Dm=0ACONFIG_VIDEO_OG0VE=
1B=3Dm=0ACONFIG_VIDEO_OV01A10=3Dm=0ACONFIG_VIDEO_OV02A10=3Dm=0ACONFIG_VIDEO=
_OV02E10=3Dm=0ACONFIG_VIDEO_OV02C10=3Dm=0ACONFIG_VIDEO_OV08D10=3Dm=0ACONFIG=
_VIDEO_OV08X40=3Dm=0ACONFIG_VIDEO_OV13858=3Dm=0ACONFIG_VIDEO_OV13B10=3Dm=0A=
CONFIG_VIDEO_OV2640=3Dm=0ACONFIG_VIDEO_OV2659=3Dm=0ACONFIG_VIDEO_OV2680=3Dm=
=0ACONFIG_VIDEO_OV2685=3Dm=0ACONFIG_VIDEO_OV2735=3Dm=0ACONFIG_VIDEO_OV2740=
=3Dm=0ACONFIG_VIDEO_OV4689=3Dm=0ACONFIG_VIDEO_OV5647=3Dm=0ACONFIG_VIDEO_OV5=
648=3Dm=0ACONFIG_VIDEO_OV5670=3Dm=0ACONFIG_VIDEO_OV5675=3Dm=0ACONFIG_VIDEO_=
OV5693=3Dm=0ACONFIG_VIDEO_OV5695=3Dm=0ACONFIG_VIDEO_OV6211=3Dm=0ACONFIG_VID=
EO_OV64A40=3Dm=0ACONFIG_VIDEO_OV7251=3Dm=0ACONFIG_VIDEO_OV7640=3Dm=0ACONFIG=
_VIDEO_OV7670=3Dm=0ACONFIG_VIDEO_OV772X=3Dm=0ACONFIG_VIDEO_OV7740=3Dm=0ACON=
FIG_VIDEO_OV8856=3Dm=0ACONFIG_VIDEO_OV8858=3Dm=0ACONFIG_VIDEO_OV8865=3Dm=0A=
CONFIG_VIDEO_OV9640=3Dm=0ACONFIG_VIDEO_OV9650=3Dm=0ACONFIG_VIDEO_OV9734=3Dm=
=0ACONFIG_VIDEO_RDACM20=3Dm=0ACONFIG_VIDEO_RDACM21=3Dm=0ACONFIG_VIDEO_RJ54N=
1=3Dm=0ACONFIG_VIDEO_S5C73M3=3Dm=0ACONFIG_VIDEO_S5K5BAF=3Dm=0ACONFIG_VIDEO_=
S5K6A3=3Dm=0ACONFIG_VIDEO_VD55G1=3Dm=0ACONFIG_VIDEO_VD56G3=3Dm=0ACONFIG_VID=
EO_CCS=3Dm=0ACONFIG_VIDEO_ET8EK8=3Dm=0A=0A#=0A# Camera ISPs=0A#=0ACONFIG_VI=
DEO_THP7312=3Dm=0A# end of Camera ISPs=0A=0ACONFIG_VIDEO_CAMERA_LENS=3Dy=0A=
CONFIG_VIDEO_AD5820=3Dm=0ACONFIG_VIDEO_AK7375=3Dm=0ACONFIG_VIDEO_DW9714=3Dm=
=0ACONFIG_VIDEO_DW9719=3Dm=0ACONFIG_VIDEO_DW9768=3Dm=0ACONFIG_VIDEO_DW9807_=
VCM=3Dm=0A=0A#=0A# Flash devices=0A#=0ACONFIG_VIDEO_ADP1653=3Dm=0ACONFIG_VI=
DEO_LM3560=3Dm=0ACONFIG_VIDEO_LM3646=3Dm=0A# end of Flash devices=0A=0A#=0A=
# Audio decoders, processors and mixers=0A#=0ACONFIG_VIDEO_CS3308=3Dm=0ACON=
FIG_VIDEO_CS5345=3Dm=0ACONFIG_VIDEO_CS53L32A=3Dm=0ACONFIG_VIDEO_MSP3400=3Dm=
=0ACONFIG_VIDEO_SONY_BTF_MPX=3Dm=0ACONFIG_VIDEO_TDA1997X=3Dm=0ACONFIG_VIDEO=
_TDA7432=3Dm=0ACONFIG_VIDEO_TDA9840=3Dm=0ACONFIG_VIDEO_TEA6415C=3Dm=0ACONFI=
G_VIDEO_TEA6420=3Dm=0ACONFIG_VIDEO_TLV320AIC23B=3Dm=0ACONFIG_VIDEO_TVAUDIO=
=3Dm=0ACONFIG_VIDEO_UDA1342=3Dm=0ACONFIG_VIDEO_VP27SMPX=3Dm=0ACONFIG_VIDEO_=
WM8739=3Dm=0ACONFIG_VIDEO_WM8775=3Dm=0A# end of Audio decoders, processors =
and mixers=0A=0A#=0A# RDS decoders=0A#=0ACONFIG_VIDEO_SAA6588=3Dm=0A# end o=
f RDS decoders=0A=0A#=0A# Video decoders=0A#=0ACONFIG_VIDEO_ADV7180=3Dm=0AC=
ONFIG_VIDEO_ADV7183=3Dm=0ACONFIG_VIDEO_ADV7604=3Dm=0ACONFIG_VIDEO_ADV7604_C=
EC=3Dy=0ACONFIG_VIDEO_ADV7842=3Dm=0ACONFIG_VIDEO_ADV7842_CEC=3Dy=0ACONFIG_V=
IDEO_BT819=3Dm=0ACONFIG_VIDEO_BT856=3Dm=0ACONFIG_VIDEO_BT866=3Dm=0ACONFIG_V=
IDEO_LT6911UXE=3Dm=0ACONFIG_VIDEO_KS0127=3Dm=0ACONFIG_VIDEO_ML86V7667=3Dm=
=0ACONFIG_VIDEO_SAA7110=3Dm=0ACONFIG_VIDEO_SAA711X=3Dm=0ACONFIG_VIDEO_TC358=
743=3Dm=0ACONFIG_VIDEO_TC358743_CEC=3Dy=0ACONFIG_VIDEO_TC358746=3Dm=0ACONFI=
G_VIDEO_TVP514X=3Dm=0ACONFIG_VIDEO_TVP5150=3Dm=0ACONFIG_VIDEO_TVP7002=3Dm=
=0ACONFIG_VIDEO_TW2804=3Dm=0ACONFIG_VIDEO_TW9900=3Dm=0ACONFIG_VIDEO_TW9903=
=3Dm=0ACONFIG_VIDEO_TW9906=3Dm=0ACONFIG_VIDEO_TW9910=3Dm=0ACONFIG_VIDEO_VPX=
3220=3Dm=0A=0A#=0A# Video and audio decoders=0A#=0ACONFIG_VIDEO_SAA717X=3Dm=
=0ACONFIG_VIDEO_CX25840=3Dm=0A# end of Video decoders=0A=0A#=0A# Video enco=
ders=0A#=0ACONFIG_VIDEO_ADV7170=3Dm=0ACONFIG_VIDEO_ADV7175=3Dm=0ACONFIG_VID=
EO_ADV7343=3Dm=0ACONFIG_VIDEO_ADV7393=3Dm=0ACONFIG_VIDEO_ADV7511=3Dm=0ACONF=
IG_VIDEO_ADV7511_CEC=3Dy=0ACONFIG_VIDEO_AK881X=3Dm=0ACONFIG_VIDEO_SAA7127=
=3Dm=0ACONFIG_VIDEO_SAA7185=3Dm=0ACONFIG_VIDEO_THS8200=3Dm=0A# end of Video=
 encoders=0A=0A#=0A# Video improvement chips=0A#=0ACONFIG_VIDEO_UPD64031A=
=3Dm=0ACONFIG_VIDEO_UPD64083=3Dm=0A# end of Video improvement chips=0A=0A#=
=0A# Audio/Video compression chips=0A#=0ACONFIG_VIDEO_SAA6752HS=3Dm=0A# end=
 of Audio/Video compression chips=0A=0A#=0A# SDR tuner chips=0A#=0ACONFIG_S=
DR_MAX2175=3Dm=0A# end of SDR tuner chips=0A=0A#=0A# Miscellaneous helper c=
hips=0A#=0ACONFIG_VIDEO_I2C=3Dm=0ACONFIG_VIDEO_M52790=3Dm=0A# CONFIG_VIDEO_=
ST_MIPID02 is not set=0ACONFIG_VIDEO_THS7303=3Dm=0A# end of Miscellaneous h=
elper chips=0A=0A#=0A# Video serializers and deserializers=0A#=0ACONFIG_VID=
EO_MAX96717=3Dm=0A# end of Video serializers and deserializers=0A=0A#=0A# M=
edia SPI Adapters=0A#=0ACONFIG_CXD2880_SPI_DRV=3Dm=0ACONFIG_VIDEO_GS1662=3D=
m=0A# end of Media SPI Adapters=0A=0ACONFIG_MEDIA_TUNER=3Dm=0A=0A#=0A# Cust=
omize TV tuners=0A#=0ACONFIG_MEDIA_TUNER_E4000=3Dm=0ACONFIG_MEDIA_TUNER_FC0=
011=3Dm=0ACONFIG_MEDIA_TUNER_FC0012=3Dm=0ACONFIG_MEDIA_TUNER_FC0013=3Dm=0AC=
ONFIG_MEDIA_TUNER_FC2580=3Dm=0ACONFIG_MEDIA_TUNER_IT913X=3Dm=0ACONFIG_MEDIA=
_TUNER_M88RS6000T=3Dm=0ACONFIG_MEDIA_TUNER_MAX2165=3Dm=0ACONFIG_MEDIA_TUNER=
_MC44S803=3Dm=0ACONFIG_MEDIA_TUNER_MSI001=3Dm=0ACONFIG_MEDIA_TUNER_MT2060=
=3Dm=0ACONFIG_MEDIA_TUNER_MT2063=3Dm=0ACONFIG_MEDIA_TUNER_MT20XX=3Dm=0ACONF=
IG_MEDIA_TUNER_MT2131=3Dm=0ACONFIG_MEDIA_TUNER_MT2266=3Dm=0ACONFIG_MEDIA_TU=
NER_MXL301RF=3Dm=0ACONFIG_MEDIA_TUNER_MXL5005S=3Dm=0ACONFIG_MEDIA_TUNER_MXL=
5007T=3Dm=0ACONFIG_MEDIA_TUNER_QM1D1B0004=3Dm=0ACONFIG_MEDIA_TUNER_QM1D1C00=
42=3Dm=0ACONFIG_MEDIA_TUNER_QT1010=3Dm=0ACONFIG_MEDIA_TUNER_R820T=3Dm=0ACON=
FIG_MEDIA_TUNER_SI2157=3Dm=0ACONFIG_MEDIA_TUNER_SIMPLE=3Dm=0ACONFIG_MEDIA_T=
UNER_TDA18212=3Dm=0ACONFIG_MEDIA_TUNER_TDA18218=3Dm=0ACONFIG_MEDIA_TUNER_TD=
A18250=3Dm=0ACONFIG_MEDIA_TUNER_TDA18271=3Dm=0ACONFIG_MEDIA_TUNER_TDA827X=
=3Dm=0ACONFIG_MEDIA_TUNER_TDA8290=3Dm=0ACONFIG_MEDIA_TUNER_TDA9887=3Dm=0ACO=
NFIG_MEDIA_TUNER_TEA5761=3Dm=0ACONFIG_MEDIA_TUNER_TEA5767=3Dm=0ACONFIG_MEDI=
A_TUNER_TUA9001=3Dm=0ACONFIG_MEDIA_TUNER_XC2028=3Dm=0ACONFIG_MEDIA_TUNER_XC=
4000=3Dm=0ACONFIG_MEDIA_TUNER_XC5000=3Dm=0A# end of Customize TV tuners=0A=
=0A#=0A# Customise DVB Frontends=0A#=0A=0A#=0A# Multistandard (satellite) f=
rontends=0A#=0ACONFIG_DVB_M88DS3103=3Dm=0ACONFIG_DVB_MXL5XX=3Dm=0ACONFIG_DV=
B_STB0899=3Dm=0ACONFIG_DVB_STB6100=3Dm=0ACONFIG_DVB_STV090x=3Dm=0ACONFIG_DV=
B_STV0910=3Dm=0ACONFIG_DVB_STV6110x=3Dm=0ACONFIG_DVB_STV6111=3Dm=0A=0A#=0A#=
 Multistandard (cable + terrestrial) frontends=0A#=0ACONFIG_DVB_DRXK=3Dm=0A=
CONFIG_DVB_MN88472=3Dm=0ACONFIG_DVB_MN88473=3Dm=0ACONFIG_DVB_SI2165=3Dm=0AC=
ONFIG_DVB_TDA18271C2DD=3Dm=0A=0A#=0A# DVB-S (satellite) frontends=0A#=0ACON=
FIG_DVB_CX24110=3Dm=0ACONFIG_DVB_CX24116=3Dm=0ACONFIG_DVB_CX24117=3Dm=0ACON=
FIG_DVB_CX24120=3Dm=0ACONFIG_DVB_CX24123=3Dm=0ACONFIG_DVB_DS3000=3Dm=0ACONF=
IG_DVB_MB86A16=3Dm=0ACONFIG_DVB_MT312=3Dm=0ACONFIG_DVB_S5H1420=3Dm=0ACONFIG=
_DVB_SI21XX=3Dm=0ACONFIG_DVB_STB6000=3Dm=0ACONFIG_DVB_STV0288=3Dm=0ACONFIG_=
DVB_STV0299=3Dm=0ACONFIG_DVB_STV0900=3Dm=0ACONFIG_DVB_STV6110=3Dm=0ACONFIG_=
DVB_TDA10071=3Dm=0ACONFIG_DVB_TDA10086=3Dm=0ACONFIG_DVB_TDA8083=3Dm=0ACONFI=
G_DVB_TDA8261=3Dm=0ACONFIG_DVB_TDA826X=3Dm=0ACONFIG_DVB_TS2020=3Dm=0ACONFIG=
_DVB_TUA6100=3Dm=0ACONFIG_DVB_TUNER_CX24113=3Dm=0ACONFIG_DVB_TUNER_ITD1000=
=3Dm=0ACONFIG_DVB_VES1X93=3Dm=0ACONFIG_DVB_ZL10036=3Dm=0ACONFIG_DVB_ZL10039=
=3Dm=0A=0A#=0A# DVB-T (terrestrial) frontends=0A#=0ACONFIG_DVB_AF9013=3Dm=
=0ACONFIG_DVB_AS102_FE=3Dm=0ACONFIG_DVB_CX22700=3Dm=0ACONFIG_DVB_CX22702=3D=
m=0ACONFIG_DVB_CXD2820R=3Dm=0ACONFIG_DVB_CXD2841ER=3Dm=0ACONFIG_DVB_DIB3000=
MB=3Dm=0ACONFIG_DVB_DIB3000MC=3Dm=0ACONFIG_DVB_DIB7000M=3Dm=0ACONFIG_DVB_DI=
B7000P=3Dm=0ACONFIG_DVB_DIB9000=3Dm=0ACONFIG_DVB_DRXD=3Dm=0ACONFIG_DVB_EC10=
0=3Dm=0ACONFIG_DVB_GP8PSK_FE=3Dm=0ACONFIG_DVB_L64781=3Dm=0ACONFIG_DVB_MT352=
=3Dm=0ACONFIG_DVB_NXT6000=3Dm=0ACONFIG_DVB_RTL2830=3Dm=0ACONFIG_DVB_RTL2832=
=3Dm=0ACONFIG_DVB_RTL2832_SDR=3Dm=0ACONFIG_DVB_S5H1432=3Dm=0ACONFIG_DVB_SI2=
168=3Dm=0ACONFIG_DVB_SP887X=3Dm=0ACONFIG_DVB_STV0367=3Dm=0ACONFIG_DVB_TDA10=
048=3Dm=0ACONFIG_DVB_TDA1004X=3Dm=0ACONFIG_DVB_ZD1301_DEMOD=3Dm=0ACONFIG_DV=
B_ZL10353=3Dm=0ACONFIG_DVB_CXD2880=3Dm=0A=0A#=0A# DVB-C (cable) frontends=
=0A#=0ACONFIG_DVB_STV0297=3Dm=0ACONFIG_DVB_TDA10021=3Dm=0ACONFIG_DVB_TDA100=
23=3Dm=0ACONFIG_DVB_VES1820=3Dm=0A=0A#=0A# ATSC (North American/Korean Terr=
estrial/Cable DTV) frontends=0A#=0ACONFIG_DVB_AU8522=3Dm=0ACONFIG_DVB_AU852=
2_DTV=3Dm=0ACONFIG_DVB_AU8522_V4L=3Dm=0ACONFIG_DVB_BCM3510=3Dm=0ACONFIG_DVB=
_LG2160=3Dm=0ACONFIG_DVB_LGDT3305=3Dm=0ACONFIG_DVB_LGDT3306A=3Dm=0ACONFIG_D=
VB_LGDT330X=3Dm=0ACONFIG_DVB_MXL692=3Dm=0ACONFIG_DVB_NXT200X=3Dm=0ACONFIG_D=
VB_OR51132=3Dm=0ACONFIG_DVB_OR51211=3Dm=0ACONFIG_DVB_S5H1409=3Dm=0ACONFIG_D=
VB_S5H1411=3Dm=0A=0A#=0A# ISDB-T (terrestrial) frontends=0A#=0ACONFIG_DVB_D=
IB8000=3Dm=0ACONFIG_DVB_MB86A20S=3Dm=0ACONFIG_DVB_S921=3Dm=0A=0A#=0A# ISDB-=
S (satellite) & ISDB-T (terrestrial) frontends=0A#=0ACONFIG_DVB_MN88443X=3D=
m=0ACONFIG_DVB_TC90522=3Dm=0A=0A#=0A# Digital terrestrial only tuners/PLL=
=0A#=0ACONFIG_DVB_PLL=3Dm=0ACONFIG_DVB_TUNER_DIB0070=3Dm=0ACONFIG_DVB_TUNER=
_DIB0090=3Dm=0A=0A#=0A# SEC control devices for DVB-S=0A#=0ACONFIG_DVB_A829=
3=3Dm=0ACONFIG_DVB_AF9033=3Dm=0ACONFIG_DVB_ASCOT2E=3Dm=0ACONFIG_DVB_ATBM883=
0=3Dm=0ACONFIG_DVB_HELENE=3Dm=0ACONFIG_DVB_HORUS3A=3Dm=0ACONFIG_DVB_ISL6405=
=3Dm=0ACONFIG_DVB_ISL6421=3Dm=0ACONFIG_DVB_ISL6423=3Dm=0ACONFIG_DVB_IX2505V=
=3Dm=0ACONFIG_DVB_LGS8GL5=3Dm=0ACONFIG_DVB_LGS8GXX=3Dm=0ACONFIG_DVB_LNBH25=
=3Dm=0ACONFIG_DVB_LNBH29=3Dm=0ACONFIG_DVB_LNBP21=3Dm=0ACONFIG_DVB_LNBP22=3D=
m=0ACONFIG_DVB_M88RS2000=3Dm=0ACONFIG_DVB_TDA665x=3Dm=0ACONFIG_DVB_DRX39XYJ=
=3Dm=0A=0A#=0A# Common Interface (EN50221) controller drivers=0A#=0ACONFIG_=
DVB_CXD2099=3Dm=0ACONFIG_DVB_SP2=3Dm=0A# end of Customise DVB Frontends=0A#=
 end of Media ancillary drivers=0A=0A#=0A# Graphics support=0A#=0ACONFIG_AP=
ERTURE_HELPERS=3Dy=0ACONFIG_SCREEN_INFO=3Dy=0ACONFIG_VIDEO=3Dy=0ACONFIG_AUX=
DISPLAY=3Dy=0ACONFIG_CHARLCD=3Dm=0ACONFIG_HD44780_COMMON=3Dm=0ACONFIG_HD447=
80=3Dm=0A# CONFIG_LCD2S is not set=0ACONFIG_PARPORT_PANEL=3Dm=0ACONFIG_PANE=
L_PARPORT=3D0=0ACONFIG_PANEL_PROFILE=3D5=0A# CONFIG_PANEL_CHANGE_MESSAGE is=
 not set=0A# CONFIG_CHARLCD_BL_OFF is not set=0A# CONFIG_CHARLCD_BL_ON is n=
ot set=0ACONFIG_CHARLCD_BL_FLASH=3Dy=0ACONFIG_KS0108=3Dm=0ACONFIG_KS0108_PO=
RT=3D0x378=0ACONFIG_KS0108_DELAY=3D2=0ACONFIG_CFAG12864B=3Dm=0ACONFIG_CFAG1=
2864B_RATE=3D20=0A# CONFIG_IMG_ASCII_LCD is not set=0A# CONFIG_HT16K33 is n=
ot set=0A# CONFIG_MAX6959 is not set=0A# CONFIG_SEG_LED_GPIO is not set=0AC=
ONFIG_PANEL=3Dm=0ACONFIG_AGP=3Dy=0ACONFIG_AGP_AMD64=3Dy=0ACONFIG_AGP_INTEL=
=3Dy=0ACONFIG_AGP_SIS=3Dy=0ACONFIG_AGP_VIA=3Dy=0ACONFIG_INTEL_GTT=3Dy=0ACON=
FIG_VGA_SWITCHEROO=3Dy=0ACONFIG_DRM=3Dy=0A=0A#=0A# DRM debugging options=0A=
#=0A# CONFIG_DRM_WERROR is not set=0A# CONFIG_DRM_DEBUG_MM is not set=0A# e=
nd of DRM debugging options=0A=0ACONFIG_DRM_MIPI_DBI=3Dm=0ACONFIG_DRM_MIPI_=
DSI=3Dy=0ACONFIG_DRM_KMS_HELPER=3Dy=0ACONFIG_DRM_DRAW=3Dy=0ACONFIG_DRM_PANI=
C=3Dy=0ACONFIG_DRM_PANIC_FOREGROUND_COLOR=3D0xffffff=0ACONFIG_DRM_PANIC_BAC=
KGROUND_COLOR=3D0x000000=0A# CONFIG_DRM_PANIC_DEBUG is not set=0ACONFIG_DRM=
_PANIC_SCREEN=3D"kmsg"=0A# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set=
=0A# CONFIG_DRM_DEBUG_MODESET_LOCK is not set=0ACONFIG_DRM_CLIENT=3Dy=0ACON=
FIG_DRM_CLIENT_LIB=3Dy=0ACONFIG_DRM_CLIENT_SELECTION=3Dy=0ACONFIG_DRM_CLIEN=
T_SETUP=3Dy=0A=0A#=0A# Supported DRM clients=0A#=0ACONFIG_DRM_FBDEV_EMULATI=
ON=3Dy=0ACONFIG_DRM_FBDEV_OVERALLOC=3D100=0A# CONFIG_DRM_FBDEV_LEAK_PHYS_SM=
EM is not set=0A# CONFIG_DRM_CLIENT_LOG is not set=0ACONFIG_DRM_CLIENT_DEFA=
ULT_FBDEV=3Dy=0ACONFIG_DRM_CLIENT_DEFAULT=3D"fbdev"=0A# end of Supported DR=
M clients=0A=0ACONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy=0ACONFIG_DRM_DISPLAY_HELPE=
R=3Dm=0ACONFIG_DRM_DISPLAY_DP_AUX_CEC=3Dy=0ACONFIG_DRM_DISPLAY_DP_AUX_CHARD=
EV=3Dy=0ACONFIG_DRM_DISPLAY_DP_HELPER=3Dy=0ACONFIG_DRM_DISPLAY_DP_TUNNEL=3D=
y=0ACONFIG_DRM_DISPLAY_DSC_HELPER=3Dy=0ACONFIG_DRM_DISPLAY_HDCP_HELPER=3Dy=
=0ACONFIG_DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER=3Dy=0ACONFIG_DRM_DISPLAY_HDM=
I_HELPER=3Dy=0ACONFIG_DRM_TTM=3Dm=0ACONFIG_DRM_EXEC=3Dm=0ACONFIG_DRM_GPUVM=
=3Dm=0ACONFIG_DRM_GPUSVM=3Dm=0ACONFIG_DRM_BUDDY=3Dm=0ACONFIG_DRM_VRAM_HELPE=
R=3Dm=0ACONFIG_DRM_TTM_HELPER=3Dm=0ACONFIG_DRM_GEM_DMA_HELPER=3Dm=0ACONFIG_=
DRM_GEM_SHMEM_HELPER=3Dy=0ACONFIG_DRM_SUBALLOC_HELPER=3Dm=0ACONFIG_DRM_SCHE=
D=3Dm=0A=0A#=0A# Drivers for system framebuffers=0A#=0ACONFIG_DRM_SYSFB_HEL=
PER=3Dy=0ACONFIG_DRM_EFIDRM=3Dy=0ACONFIG_DRM_SIMPLEDRM=3Dy=0ACONFIG_DRM_VES=
ADRM=3Dy=0A# end of Drivers for system framebuffers=0A=0A#=0A# ARM devices=
=0A#=0A# end of ARM devices=0A=0ACONFIG_DRM_RADEON=3Dm=0ACONFIG_DRM_RADEON_=
USERPTR=3Dy=0ACONFIG_DRM_AMDGPU=3Dm=0ACONFIG_DRM_AMDGPU_SI=3Dy=0ACONFIG_DRM=
_AMDGPU_CIK=3Dy=0ACONFIG_DRM_AMDGPU_USERPTR=3Dy=0ACONFIG_DRM_AMD_ISP=3Dy=0A=
# CONFIG_DRM_AMDGPU_WERROR is not set=0A=0A#=0A# ACP (Audio CoProcessor) Co=
nfiguration=0A#=0ACONFIG_DRM_AMD_ACP=3Dy=0A# end of ACP (Audio CoProcessor)=
 Configuration=0A=0A#=0A# Display Engine Configuration=0A#=0ACONFIG_DRM_AMD=
_DC=3Dy=0ACONFIG_DRM_AMD_DC_FP=3Dy=0ACONFIG_DRM_AMD_DC_SI=3Dy=0A# CONFIG_DE=
BUG_KERNEL_DC is not set=0ACONFIG_DRM_AMD_SECURE_DISPLAY=3Dy=0A# end of Dis=
play Engine Configuration=0A=0ACONFIG_HSA_AMD=3Dy=0ACONFIG_HSA_AMD_SVM=3Dy=
=0ACONFIG_HSA_AMD_P2P=3Dy=0ACONFIG_DRM_NOUVEAU=3Dm=0ACONFIG_NOUVEAU_DEBUG=
=3D5=0ACONFIG_NOUVEAU_DEBUG_DEFAULT=3D3=0A# CONFIG_NOUVEAU_DEBUG_MMU is not=
 set=0A# CONFIG_NOUVEAU_DEBUG_PUSH is not set=0ACONFIG_DRM_NOUVEAU_BACKLIGH=
T=3Dy=0ACONFIG_DRM_NOUVEAU_SVM=3Dy=0ACONFIG_DRM_NOUVEAU_CH7006=3Dm=0ACONFIG=
_DRM_NOUVEAU_SIL164=3Dm=0ACONFIG_DRM_I915=3Dm=0ACONFIG_DRM_I915_FORCE_PROBE=
=3D""=0ACONFIG_DRM_I915_CAPTURE_ERROR=3Dy=0ACONFIG_DRM_I915_COMPRESS_ERROR=
=3Dy=0ACONFIG_DRM_I915_USERPTR=3Dy=0ACONFIG_DRM_I915_GVT_KVMGT=3Dm=0ACONFIG=
_DRM_I915_PXP=3Dy=0ACONFIG_DRM_I915_DP_TUNNEL=3Dy=0A=0A#=0A# drm/i915 Debug=
ging=0A#=0A# CONFIG_DRM_I915_WERROR is not set=0A# CONFIG_DRM_I915_REPLAY_G=
PU_HANGS_API is not set=0A# CONFIG_DRM_I915_DEBUG is not set=0A# CONFIG_DRM=
_I915_DEBUG_MMIO is not set=0A# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is n=
ot set=0A# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set=0A# CONFIG_DRM_I91=
5_DEBUG_GUC is not set=0A# CONFIG_DRM_I915_SELFTEST is not set=0A# CONFIG_D=
RM_I915_LOW_LEVEL_TRACEPOINTS is not set=0A# CONFIG_DRM_I915_DEBUG_VBLANK_E=
VADE is not set=0A# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set=0A# CONFIG_=
DRM_I915_DEBUG_WAKEREF is not set=0A# end of drm/i915 Debugging=0A=0A#=0A# =
drm/i915 Profile Guided Optimisation=0A#=0ACONFIG_DRM_I915_REQUEST_TIMEOUT=
=3D20000=0ACONFIG_DRM_I915_FENCE_TIMEOUT=3D10000=0ACONFIG_DRM_I915_USERFAUL=
T_AUTOSUSPEND=3D250=0ACONFIG_DRM_I915_HEARTBEAT_INTERVAL=3D2500=0ACONFIG_DR=
M_I915_PREEMPT_TIMEOUT=3D640=0ACONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE=3D75=
00=0ACONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=3D8000=0ACONFIG_DRM_I915_STOP_TIM=
EOUT=3D100=0ACONFIG_DRM_I915_TIMESLICE_DURATION=3D1=0A# end of drm/i915 Pro=
file Guided Optimisation=0A=0ACONFIG_DRM_I915_GVT=3Dy=0ACONFIG_DRM_XE=3Dm=
=0ACONFIG_DRM_XE_DISPLAY=3Dy=0ACONFIG_DRM_XE_DP_TUNNEL=3Dy=0ACONFIG_DRM_XE_=
GPUSVM=3Dy=0ACONFIG_DRM_XE_PAGEMAP=3Dy=0ACONFIG_DRM_XE_FORCE_PROBE=3D""=0A=
=0A#=0A# drm/Xe Debugging=0A#=0A# CONFIG_DRM_XE_WERROR is not set=0A# CONFI=
G_DRM_XE_DEBUG is not set=0A# CONFIG_DRM_XE_DEBUG_VM is not set=0A# CONFIG_=
DRM_XE_DEBUG_SRIOV is not set=0A# CONFIG_DRM_XE_DEBUG_MEMIRQ is not set=0A#=
 CONFIG_DRM_XE_DEBUG_MEM is not set=0A# CONFIG_DRM_XE_USERPTR_INVAL_INJECT =
is not set=0A# end of drm/Xe Debugging=0A=0A#=0A# drm/xe Profile Guided Opt=
imisation=0A#=0ACONFIG_DRM_XE_JOB_TIMEOUT_MAX=3D10000=0ACONFIG_DRM_XE_JOB_T=
IMEOUT_MIN=3D1=0ACONFIG_DRM_XE_TIMESLICE_MAX=3D10000000=0ACONFIG_DRM_XE_TIM=
ESLICE_MIN=3D1=0ACONFIG_DRM_XE_PREEMPT_TIMEOUT=3D640000=0ACONFIG_DRM_XE_PRE=
EMPT_TIMEOUT_MAX=3D10000000=0ACONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN=3D1=0ACONFI=
G_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT=3Dy=0A# end of drm/xe Profile Guided Opt=
imisation=0A=0ACONFIG_DRM_VGEM=3Dm=0ACONFIG_DRM_VKMS=3Dm=0ACONFIG_DRM_VMWGF=
X=3Dm=0A# CONFIG_DRM_VMWGFX_MKSSTATS is not set=0ACONFIG_DRM_GMA500=3Dm=0AC=
ONFIG_DRM_UDL=3Dm=0ACONFIG_DRM_AST=3Dm=0ACONFIG_DRM_MGAG200=3Dm=0ACONFIG_DR=
M_QXL=3Dm=0ACONFIG_DRM_VIRTIO_GPU=3Dm=0ACONFIG_DRM_VIRTIO_GPU_KMS=3Dy=0ACON=
FIG_DRM_PANEL=3Dy=0A=0A#=0A# Display Panels=0A#=0ACONFIG_DRM_PANEL_AUO_A030=
JTN01=3Dm=0A# CONFIG_DRM_PANEL_ILITEK_ILI9341 is not set=0ACONFIG_DRM_PANEL=
_ORISETECH_OTA5601A=3Dm=0ACONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=3Dm=0ACO=
NFIG_DRM_PANEL_WIDECHIPS_WS2401=3Dm=0A# end of Display Panels=0A=0ACONFIG_D=
RM_BRIDGE=3Dy=0ACONFIG_DRM_PANEL_BRIDGE=3Dy=0A=0A#=0A# Display Interface Br=
idges=0A#=0A# CONFIG_DRM_I2C_NXP_TDA998X is not set=0ACONFIG_DRM_ANALOGIX_A=
NX78XX=3Dm=0ACONFIG_DRM_ANALOGIX_DP=3Dm=0A# end of Display Interface Bridge=
s=0A=0A# CONFIG_DRM_ETNAVIV is not set=0ACONFIG_DRM_HISI_HIBMC=3Dm=0ACONFIG=
_DRM_APPLETBDRM=3Dm=0ACONFIG_DRM_BOCHS=3Dm=0ACONFIG_DRM_CIRRUS_QEMU=3Dm=0AC=
ONFIG_DRM_GM12U320=3Dm=0ACONFIG_DRM_PANEL_MIPI_DBI=3Dm=0ACONFIG_DRM_PIXPAPE=
R=3Dm=0ACONFIG_TINYDRM_HX8357D=3Dm=0ACONFIG_TINYDRM_ILI9163=3Dm=0ACONFIG_TI=
NYDRM_ILI9225=3Dm=0ACONFIG_TINYDRM_ILI9341=3Dm=0ACONFIG_TINYDRM_ILI9486=3Dm=
=0ACONFIG_TINYDRM_MI0283QT=3Dm=0ACONFIG_TINYDRM_REPAPER=3Dm=0A# CONFIG_TINY=
DRM_SHARP_MEMORY is not set=0ACONFIG_DRM_XEN=3Dy=0ACONFIG_DRM_XEN_FRONTEND=
=3Dm=0ACONFIG_DRM_VBOXVIDEO=3Dm=0ACONFIG_DRM_GUD=3Dm=0ACONFIG_DRM_ST7571_I2=
C=3Dm=0ACONFIG_DRM_ST7586=3Dm=0ACONFIG_DRM_ST7735R=3Dm=0ACONFIG_DRM_SSD130X=
=3Dm=0ACONFIG_DRM_SSD130X_I2C=3Dm=0ACONFIG_DRM_SSD130X_SPI=3Dm=0ACONFIG_DRM=
_HYPERV=3Dm=0ACONFIG_DRM_PANEL_BACKLIGHT_QUIRKS=3Dm=0A# CONFIG_DRM_LIB_RAND=
OM is not set=0ACONFIG_DRM_PRIVACY_SCREEN=3Dy=0ACONFIG_DRM_PANEL_ORIENTATIO=
N_QUIRKS=3Dy=0A=0A#=0A# Frame buffer Devices=0A#=0ACONFIG_FB=3Dy=0A# CONFIG=
_FB_CIRRUS is not set=0A# CONFIG_FB_PM2 is not set=0A# CONFIG_FB_CYBER2000 =
is not set=0A# CONFIG_FB_ARC is not set=0A# CONFIG_FB_ASILIANT is not set=
=0A# CONFIG_FB_IMSTT is not set=0A# CONFIG_FB_VGA16 is not set=0A# CONFIG_F=
B_UVESA is not set=0A# CONFIG_FB_VESA is not set=0A# CONFIG_FB_EFI is not s=
et=0A# CONFIG_FB_N411 is not set=0A# CONFIG_FB_HGA is not set=0A# CONFIG_FB=
_OPENCORES is not set=0A# CONFIG_FB_S1D13XXX is not set=0A# CONFIG_FB_NVIDI=
A is not set=0A# CONFIG_FB_RIVA is not set=0A# CONFIG_FB_I740 is not set=0A=
# CONFIG_FB_MATROX is not set=0A# CONFIG_FB_RADEON is not set=0A# CONFIG_FB=
_ATY128 is not set=0A# CONFIG_FB_ATY is not set=0A# CONFIG_FB_S3 is not set=
=0A# CONFIG_FB_SAVAGE is not set=0A# CONFIG_FB_SIS is not set=0A# CONFIG_FB=
_VIA is not set=0A# CONFIG_FB_NEOMAGIC is not set=0A# CONFIG_FB_KYRO is not=
 set=0A# CONFIG_FB_3DFX is not set=0A# CONFIG_FB_VOODOO1 is not set=0A# CON=
FIG_FB_VT8623 is not set=0A# CONFIG_FB_TRIDENT is not set=0A# CONFIG_FB_ARK=
 is not set=0A# CONFIG_FB_PM3 is not set=0A# CONFIG_FB_CARMINE is not set=
=0A# CONFIG_FB_SMSCUFX is not set=0A# CONFIG_FB_IBM_GXT4500 is not set=0A# =
CONFIG_FB_VIRTUAL is not set=0ACONFIG_XEN_FBDEV_FRONTEND=3Dm=0A# CONFIG_FB_=
METRONOME is not set=0A# CONFIG_FB_MB862XX is not set=0A# CONFIG_FB_HYPERV =
is not set=0A# CONFIG_FB_SSD1307 is not set=0A# CONFIG_FB_SM712 is not set=
=0ACONFIG_FB_CORE=3Dy=0ACONFIG_FB_NOTIFY=3Dy=0A# CONFIG_FB_DEVICE is not se=
t=0ACONFIG_FB_CFB_FILLRECT=3Dy=0ACONFIG_FB_CFB_COPYAREA=3Dy=0ACONFIG_FB_CFB=
_IMAGEBLIT=3Dy=0ACONFIG_FB_SYS_FILLRECT=3Dy=0ACONFIG_FB_SYS_COPYAREA=3Dy=0A=
CONFIG_FB_SYS_IMAGEBLIT=3Dy=0A# CONFIG_FB_FOREIGN_ENDIAN is not set=0ACONFI=
G_FB_SYSMEM_FOPS=3Dy=0ACONFIG_FB_DEFERRED_IO=3Dy=0ACONFIG_FB_DMAMEM_HELPERS=
=3Dy=0ACONFIG_FB_DMAMEM_HELPERS_DEFERRED=3Dy=0ACONFIG_FB_IOMEM_FOPS=3Dy=0AC=
ONFIG_FB_IOMEM_HELPERS=3Dy=0ACONFIG_FB_SYSMEM_HELPERS=3Dy=0ACONFIG_FB_SYSME=
M_HELPERS_DEFERRED=3Dy=0ACONFIG_FB_TILEBLITTING=3Dy=0A# end of Frame buffer=
 Devices=0A=0A#=0A# Backlight & LCD device support=0A#=0ACONFIG_LCD_CLASS_D=
EVICE=3Dm=0A# CONFIG_LCD_L4F00242T03 is not set=0A# CONFIG_LCD_LMS283GF05 i=
s not set=0A# CONFIG_LCD_LTV350QV is not set=0A# CONFIG_LCD_ILI922X is not =
set=0A# CONFIG_LCD_ILI9320 is not set=0A# CONFIG_LCD_TDO24M is not set=0A# =
CONFIG_LCD_VGG2432A4 is not set=0ACONFIG_LCD_PLATFORM=3Dm=0A# CONFIG_LCD_AM=
S369FG06 is not set=0A# CONFIG_LCD_LMS501KF03 is not set=0A# CONFIG_LCD_HX8=
357 is not set=0A# CONFIG_LCD_OTM3225A is not set=0ACONFIG_BACKLIGHT_CLASS_=
DEVICE=3Dy=0ACONFIG_BACKLIGHT_AW99706=3Dm=0ACONFIG_BACKLIGHT_KTD253=3Dm=0AC=
ONFIG_BACKLIGHT_KTD2801=3Dm=0ACONFIG_BACKLIGHT_KTZ8866=3Dm=0ACONFIG_BACKLIG=
HT_LM3533=3Dm=0ACONFIG_BACKLIGHT_PWM=3Dm=0ACONFIG_BACKLIGHT_APPLE=3Dm=0ACON=
FIG_BACKLIGHT_QCOM_WLED=3Dm=0ACONFIG_BACKLIGHT_RT4831=3Dm=0ACONFIG_BACKLIGH=
T_SAHARA=3Dm=0ACONFIG_BACKLIGHT_ADP8860=3Dm=0ACONFIG_BACKLIGHT_ADP8870=3Dm=
=0ACONFIG_BACKLIGHT_LM3509=3Dm=0ACONFIG_BACKLIGHT_LM3630A=3Dm=0ACONFIG_BACK=
LIGHT_LM3639=3Dm=0ACONFIG_BACKLIGHT_LP855X=3Dm=0ACONFIG_BACKLIGHT_MP3309C=
=3Dm=0ACONFIG_BACKLIGHT_GPIO=3Dm=0ACONFIG_BACKLIGHT_LV5207LP=3Dm=0ACONFIG_B=
ACKLIGHT_BD6107=3Dm=0ACONFIG_BACKLIGHT_ARCXCNN=3Dm=0A# end of Backlight & L=
CD device support=0A=0A# CONFIG_VGASTATE is not set=0ACONFIG_VIDEOMODE_HELP=
ERS=3Dy=0ACONFIG_HDMI=3Dy=0ACONFIG_FIRMWARE_EDID=3Dy=0A=0A#=0A# Console dis=
play driver support=0A#=0ACONFIG_VGA_CONSOLE=3Dy=0ACONFIG_DUMMY_CONSOLE=3Dy=
=0ACONFIG_DUMMY_CONSOLE_COLUMNS=3D80=0ACONFIG_DUMMY_CONSOLE_ROWS=3D25=0ACON=
FIG_FRAMEBUFFER_CONSOLE=3Dy=0A# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERAT=
ION is not set=0ACONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy=0ACONFIG_FRA=
MEBUFFER_CONSOLE_ROTATION=3Dy=0ACONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVE=
R=3Dy=0A# end of Console display driver support=0A=0A# CONFIG_LOGO is not s=
et=0ACONFIG_TRACE_GPU_MEM=3Dy=0A# end of Graphics support=0A=0ACONFIG_DRM_A=
CCEL=3Dy=0ACONFIG_DRM_ACCEL_AMDXDNA=3Dm=0ACONFIG_DRM_ACCEL_ARM_ETHOSU=3Dm=
=0ACONFIG_DRM_ACCEL_HABANALABS=3Dm=0A# CONFIG_HL_HLDIO is not set=0ACONFIG_=
DRM_ACCEL_IVPU=3Dm=0A# CONFIG_DRM_ACCEL_IVPU_DEBUG is not set=0ACONFIG_DRM_=
ACCEL_QAIC=3Dm=0ACONFIG_SOUND=3Dm=0ACONFIG_SOUND_OSS_CORE=3Dy=0A# CONFIG_SO=
UND_OSS_CORE_PRECLAIM is not set=0ACONFIG_SND=3Dm=0ACONFIG_SND_TIMER=3Dm=0A=
CONFIG_SND_PCM=3Dm=0ACONFIG_SND_PCM_ELD=3Dy=0ACONFIG_SND_DMAENGINE_PCM=3Dm=
=0ACONFIG_SND_HWDEP=3Dm=0ACONFIG_SND_SEQ_DEVICE=3Dm=0ACONFIG_SND_RAWMIDI=3D=
m=0ACONFIG_SND_UMP=3Dm=0ACONFIG_SND_UMP_LEGACY_RAWMIDI=3Dy=0ACONFIG_SND_COM=
PRESS_OFFLOAD=3Dm=0ACONFIG_SND_JACK=3Dy=0ACONFIG_SND_JACK_INPUT_DEV=3Dy=0AC=
ONFIG_SND_OSSEMUL=3Dy=0ACONFIG_SND_MIXER_OSS=3Dm=0ACONFIG_SND_PCM_OSS=3Dm=
=0ACONFIG_SND_PCM_OSS_PLUGINS=3Dy=0ACONFIG_SND_PCM_TIMER=3Dy=0ACONFIG_SND_H=
RTIMER=3Dm=0ACONFIG_SND_DYNAMIC_MINORS=3Dy=0ACONFIG_SND_MAX_CARDS=3D32=0ACO=
NFIG_SND_SUPPORT_OLD_API=3Dy=0ACONFIG_SND_PROC_FS=3Dy=0ACONFIG_SND_VERBOSE_=
PROCFS=3Dy=0ACONFIG_SND_CTL_FAST_LOOKUP=3Dy=0ACONFIG_SND_DEBUG=3Dy=0A# CONF=
IG_SND_DEBUG_VERBOSE is not set=0ACONFIG_SND_PCM_XRUN_DEBUG=3Dy=0A# CONFIG_=
SND_CTL_INPUT_VALIDATION is not set=0A# CONFIG_SND_CTL_DEBUG is not set=0A#=
 CONFIG_SND_JACK_INJECTION_DEBUG is not set=0ACONFIG_SND_UTIMER=3Dy=0ACONFI=
G_SND_VMASTER=3Dy=0ACONFIG_SND_DMA_SGBUF=3Dy=0ACONFIG_SND_CTL_LED=3Dm=0ACON=
FIG_SND_SEQUENCER=3Dm=0ACONFIG_SND_SEQ_DUMMY=3Dm=0ACONFIG_SND_SEQUENCER_OSS=
=3Dm=0ACONFIG_SND_SEQ_HRTIMER_DEFAULT=3Dy=0ACONFIG_SND_SEQ_MIDI_EVENT=3Dm=
=0ACONFIG_SND_SEQ_MIDI=3Dm=0ACONFIG_SND_SEQ_MIDI_EMUL=3Dm=0ACONFIG_SND_SEQ_=
VIRMIDI=3Dm=0ACONFIG_SND_SEQ_UMP=3Dy=0ACONFIG_SND_SEQ_UMP_CLIENT=3Dm=0ACONF=
IG_SND_MPU401_UART=3Dm=0ACONFIG_SND_OPL3_LIB=3Dm=0ACONFIG_SND_OPL3_LIB_SEQ=
=3Dm=0A# CONFIG_SND_OPL4_LIB_SEQ is not set=0ACONFIG_SND_VX_LIB=3Dm=0ACONFI=
G_SND_AC97_CODEC=3Dm=0ACONFIG_SND_DRIVERS=3Dy=0A# CONFIG_SND_PCSP is not se=
t=0ACONFIG_SND_DUMMY=3Dm=0ACONFIG_SND_ALOOP=3Dm=0ACONFIG_SND_PCMTEST=3Dm=0A=
CONFIG_SND_VIRMIDI=3Dm=0ACONFIG_SND_MTPAV=3Dm=0ACONFIG_SND_MTS64=3Dm=0ACONF=
IG_SND_SERIAL_U16550=3Dm=0ACONFIG_SND_MPU401=3Dm=0ACONFIG_SND_PORTMAN2X4=3D=
m=0ACONFIG_SND_AC97_POWER_SAVE=3Dy=0ACONFIG_SND_AC97_POWER_SAVE_DEFAULT=3D0=
=0ACONFIG_SND_SB_COMMON=3Dm=0ACONFIG_SND_PCI=3Dy=0ACONFIG_SND_AD1889=3Dm=0A=
CONFIG_SND_ALS300=3Dm=0ACONFIG_SND_ALS4000=3Dm=0ACONFIG_SND_ALI5451=3Dm=0AC=
ONFIG_SND_ASIHPI=3Dm=0ACONFIG_SND_ATIIXP=3Dm=0ACONFIG_SND_ATIIXP_MODEM=3Dm=
=0ACONFIG_SND_AU8810=3Dm=0ACONFIG_SND_AU8820=3Dm=0ACONFIG_SND_AU8830=3Dm=0A=
CONFIG_SND_AW2=3Dm=0ACONFIG_SND_AZT3328=3Dm=0ACONFIG_SND_BT87X=3Dm=0A# CONF=
IG_SND_BT87X_OVERCLOCK is not set=0ACONFIG_SND_CA0106=3Dm=0ACONFIG_SND_CMIP=
CI=3Dm=0ACONFIG_SND_OXYGEN_LIB=3Dm=0ACONFIG_SND_OXYGEN=3Dm=0ACONFIG_SND_CS4=
281=3Dm=0ACONFIG_SND_CS46XX=3Dm=0ACONFIG_SND_CS46XX_NEW_DSP=3Dy=0ACONFIG_SN=
D_CTXFI=3Dm=0ACONFIG_SND_DARLA20=3Dm=0ACONFIG_SND_GINA20=3Dm=0ACONFIG_SND_L=
AYLA20=3Dm=0ACONFIG_SND_DARLA24=3Dm=0ACONFIG_SND_GINA24=3Dm=0ACONFIG_SND_LA=
YLA24=3Dm=0ACONFIG_SND_MONA=3Dm=0ACONFIG_SND_MIA=3Dm=0ACONFIG_SND_ECHO3G=3D=
m=0ACONFIG_SND_INDIGO=3Dm=0ACONFIG_SND_INDIGOIO=3Dm=0ACONFIG_SND_INDIGODJ=
=3Dm=0ACONFIG_SND_INDIGOIOX=3Dm=0ACONFIG_SND_INDIGODJX=3Dm=0ACONFIG_SND_EMU=
10K1=3Dm=0ACONFIG_SND_EMU10K1_SEQ=3Dm=0ACONFIG_SND_EMU10K1X=3Dm=0ACONFIG_SN=
D_ENS1370=3Dm=0ACONFIG_SND_ENS1371=3Dm=0ACONFIG_SND_ES1938=3Dm=0ACONFIG_SND=
_ES1968=3Dm=0ACONFIG_SND_ES1968_INPUT=3Dy=0ACONFIG_SND_ES1968_RADIO=3Dy=0AC=
ONFIG_SND_FM801=3Dm=0ACONFIG_SND_FM801_TEA575X_BOOL=3Dy=0ACONFIG_SND_HDSP=
=3Dm=0ACONFIG_SND_HDSPM=3Dm=0ACONFIG_SND_ICE1712=3Dm=0ACONFIG_SND_ICE1724=
=3Dm=0ACONFIG_SND_INTEL8X0=3Dm=0ACONFIG_SND_INTEL8X0M=3Dm=0ACONFIG_SND_KORG=
1212=3Dm=0ACONFIG_SND_LOLA=3Dm=0ACONFIG_SND_LX6464ES=3Dm=0ACONFIG_SND_MAEST=
RO3=3Dm=0ACONFIG_SND_MAESTRO3_INPUT=3Dy=0ACONFIG_SND_MIXART=3Dm=0ACONFIG_SN=
D_NM256=3Dm=0ACONFIG_SND_PCXHR=3Dm=0ACONFIG_SND_RIPTIDE=3Dm=0ACONFIG_SND_RM=
E32=3Dm=0ACONFIG_SND_RME96=3Dm=0ACONFIG_SND_RME9652=3Dm=0ACONFIG_SND_SONICV=
IBES=3Dm=0ACONFIG_SND_TRIDENT=3Dm=0ACONFIG_SND_VIA82XX=3Dm=0ACONFIG_SND_VIA=
82XX_MODEM=3Dm=0ACONFIG_SND_VIRTUOSO=3Dm=0ACONFIG_SND_VX222=3Dm=0ACONFIG_SN=
D_YMFPCI=3Dm=0A=0A#=0A# HD-Audio=0A#=0ACONFIG_SND_HDA=3Dm=0ACONFIG_SND_HDA_=
HWDEP=3Dy=0ACONFIG_SND_HDA_RECONFIG=3Dy=0ACONFIG_SND_HDA_INPUT_BEEP=3Dy=0AC=
ONFIG_SND_HDA_INPUT_BEEP_MODE=3D1=0ACONFIG_SND_HDA_PATCH_LOADER=3Dy=0ACONFI=
G_SND_HDA_POWER_SAVE_DEFAULT=3D1=0A# CONFIG_SND_HDA_CTL_DEV_ID is not set=
=0ACONFIG_SND_HDA_PREALLOC_SIZE=3D0=0ACONFIG_SND_HDA_INTEL=3Dm=0ACONFIG_SND=
_HDA_ACPI=3Dm=0ACONFIG_SND_HDA_GENERIC_LEDS=3Dy=0ACONFIG_SND_HDA_CODEC_ANAL=
OG=3Dm=0ACONFIG_SND_HDA_CODEC_SIGMATEL=3Dm=0ACONFIG_SND_HDA_CODEC_VIA=3Dm=
=0ACONFIG_SND_HDA_CODEC_CONEXANT=3Dm=0ACONFIG_SND_HDA_CODEC_SENARYTECH=3Dm=
=0ACONFIG_SND_HDA_CODEC_CA0110=3Dm=0ACONFIG_SND_HDA_CODEC_CA0132=3Dm=0ACONF=
IG_SND_HDA_CODEC_CA0132_DSP=3Dy=0ACONFIG_SND_HDA_CODEC_CMEDIA=3Dm=0ACONFIG_=
SND_HDA_CODEC_CM9825=3Dm=0ACONFIG_SND_HDA_CODEC_SI3054=3Dm=0ACONFIG_SND_HDA=
_GENERIC=3Dm=0ACONFIG_SND_HDA_CODEC_REALTEK=3Dm=0ACONFIG_SND_HDA_CODEC_REAL=
TEK_LIB=3Dm=0ACONFIG_SND_HDA_CODEC_ALC260=3Dm=0ACONFIG_SND_HDA_CODEC_ALC262=
=3Dm=0ACONFIG_SND_HDA_CODEC_ALC268=3Dm=0ACONFIG_SND_HDA_CODEC_ALC269=3Dm=0A=
CONFIG_SND_HDA_CODEC_ALC662=3Dm=0ACONFIG_SND_HDA_CODEC_ALC680=3Dm=0ACONFIG_=
SND_HDA_CODEC_ALC861=3Dm=0ACONFIG_SND_HDA_CODEC_ALC861VD=3Dm=0ACONFIG_SND_H=
DA_CODEC_ALC880=3Dm=0ACONFIG_SND_HDA_CODEC_ALC882=3Dm=0ACONFIG_SND_HDA_CODE=
C_CIRRUS=3Dm=0ACONFIG_SND_HDA_CODEC_CS420X=3Dm=0ACONFIG_SND_HDA_CODEC_CS421=
X=3Dm=0ACONFIG_SND_HDA_CODEC_CS8409=3Dm=0ACONFIG_SND_HDA_CODEC_HDMI=3Dm=0AC=
ONFIG_SND_HDA_CODEC_HDMI_GENERIC=3Dm=0ACONFIG_SND_HDA_CODEC_HDMI_SIMPLE=3Dm=
=0ACONFIG_SND_HDA_CODEC_HDMI_INTEL=3Dm=0A# CONFIG_SND_HDA_INTEL_HDMI_SILENT=
_STREAM is not set=0ACONFIG_SND_HDA_CODEC_HDMI_ATI=3Dm=0ACONFIG_SND_HDA_COD=
EC_HDMI_NVIDIA=3Dm=0ACONFIG_SND_HDA_CODEC_HDMI_NVIDIA_MCP=3Dm=0ACONFIG_SND_=
HDA_CODEC_HDMI_TEGRA=3Dm=0ACONFIG_SND_HDA_CIRRUS_SCODEC=3Dm=0ACONFIG_SND_HD=
A_SCODEC_CS35L41=3Dm=0ACONFIG_SND_HDA_SCODEC_COMPONENT=3Dm=0ACONFIG_SND_HDA=
_SCODEC_CS35L41_I2C=3Dm=0ACONFIG_SND_HDA_SCODEC_CS35L41_SPI=3Dm=0ACONFIG_SN=
D_HDA_SCODEC_CS35L56=3Dm=0ACONFIG_SND_HDA_SCODEC_CS35L56_I2C=3Dm=0ACONFIG_S=
ND_HDA_SCODEC_CS35L56_SPI=3Dm=0A=0A#=0A# CS35L56 driver options=0A#=0A# CON=
FIG_SND_HDA_SCODEC_CS35L56_CAL_DEBUGFS is not set=0A# end of CS35L56 driver=
 options=0A=0ACONFIG_SND_HDA_SCODEC_TAS2781=3Dm=0ACONFIG_SND_HDA_SCODEC_TAS=
2781_I2C=3Dm=0ACONFIG_SND_HDA_SCODEC_TAS2781_SPI=3Dm=0ACONFIG_SND_HDA_CORE=
=3Dm=0ACONFIG_SND_HDA_DSP_LOADER=3Dy=0ACONFIG_SND_HDA_COMPONENT=3Dy=0ACONFI=
G_SND_HDA_I915=3Dy=0ACONFIG_SND_HDA_EXT_CORE=3Dm=0ACONFIG_SND_INTEL_NHLT=3D=
y=0ACONFIG_SND_INTEL_DSP_CONFIG=3Dm=0ACONFIG_SND_INTEL_SOUNDWIRE_ACPI=3Dm=
=0ACONFIG_SND_INTEL_BYT_PREFER_SOF=3Dy=0A# end of HD-Audio=0A=0A# CONFIG_SN=
D_SPI is not set=0ACONFIG_SND_USB=3Dy=0ACONFIG_SND_USB_AUDIO=3Dm=0ACONFIG_S=
ND_USB_AUDIO_MIDI_V2=3Dy=0ACONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER=3Dy=0A=
CONFIG_SND_USB_UA101=3Dm=0ACONFIG_SND_USB_USX2Y=3Dm=0ACONFIG_SND_USB_CAIAQ=
=3Dm=0ACONFIG_SND_USB_CAIAQ_INPUT=3Dy=0ACONFIG_SND_USB_US122L=3Dm=0ACONFIG_=
SND_USB_US144MKII=3Dm=0ACONFIG_SND_USB_6FIRE=3Dm=0ACONFIG_SND_USB_HIFACE=3D=
m=0ACONFIG_SND_BCD2000=3Dm=0ACONFIG_SND_USB_AUDIO_QMI=3Dm=0ACONFIG_SND_USB_=
LINE6=3Dm=0ACONFIG_SND_USB_POD=3Dm=0ACONFIG_SND_USB_PODHD=3Dm=0ACONFIG_SND_=
USB_TONEPORT=3Dm=0ACONFIG_SND_USB_VARIAX=3Dm=0ACONFIG_SND_FIREWIRE=3Dy=0ACO=
NFIG_SND_FIREWIRE_LIB=3Dm=0ACONFIG_SND_DICE=3Dm=0ACONFIG_SND_OXFW=3Dm=0ACON=
FIG_SND_ISIGHT=3Dm=0ACONFIG_SND_FIREWORKS=3Dm=0ACONFIG_SND_BEBOB=3Dm=0ACONF=
IG_SND_FIREWIRE_DIGI00X=3Dm=0ACONFIG_SND_FIREWIRE_TASCAM=3Dm=0ACONFIG_SND_F=
IREWIRE_MOTU=3Dm=0ACONFIG_SND_FIREFACE=3Dm=0ACONFIG_SND_PCMCIA=3Dy=0A# CONF=
IG_SND_VXPOCKET is not set=0A# CONFIG_SND_PDAUDIOCF is not set=0ACONFIG_SND=
_SOC=3Dm=0ACONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy=0ACONFIG_SND_SOC_COMPRE=
SS=3Dy=0ACONFIG_SND_SOC_TOPOLOGY=3Dy=0ACONFIG_SND_SOC_ACPI=3Dm=0ACONFIG_SND=
_SOC_USB=3Dm=0A=0A#=0A# Analog Devices=0A#=0ACONFIG_SND_SOC_ADI_AXI_I2S=3Dm=
=0ACONFIG_SND_SOC_ADI_AXI_SPDIF=3Dm=0A# end of Analog Devices=0A=0A#=0A# AM=
D=0A#=0ACONFIG_SND_SOC_AMD_ACP=3Dm=0ACONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MA=
CH=3Dm=0ACONFIG_SND_SOC_AMD_CZ_RT5645_MACH=3Dm=0ACONFIG_SND_SOC_AMD_ST_ES83=
36_MACH=3Dm=0ACONFIG_SND_SOC_AMD_ACP3x=3Dm=0ACONFIG_SND_SOC_AMD_RV_RT5682_M=
ACH=3Dm=0ACONFIG_SND_SOC_AMD_RENOIR=3Dm=0ACONFIG_SND_SOC_AMD_RENOIR_MACH=3D=
m=0ACONFIG_SND_SOC_AMD_ACP5x=3Dm=0ACONFIG_SND_SOC_AMD_VANGOGH_MACH=3Dm=0ACO=
NFIG_SND_SOC_AMD_ACP6x=3Dm=0ACONFIG_SND_SOC_AMD_YC_MACH=3Dm=0ACONFIG_SND_AM=
D_ACP_CONFIG=3Dm=0ACONFIG_SND_SOC_AMD_ACP_COMMON=3Dm=0ACONFIG_SND_SOC_ACPI_=
AMD_MATCH=3Dm=0ACONFIG_SND_SOC_AMD_ACP_PDM=3Dm=0ACONFIG_SND_SOC_AMD_ACP_LEG=
ACY_COMMON=3Dm=0ACONFIG_SND_SOC_AMD_ACP_I2S=3Dm=0ACONFIG_SND_SOC_AMD_ACPI_M=
ACH=3Dm=0ACONFIG_SND_SOC_AMD_ACP_PCM=3Dm=0ACONFIG_SND_SOC_AMD_ACP_PCI=3Dm=
=0ACONFIG_SND_AMD_ASOC_RENOIR=3Dm=0ACONFIG_SND_AMD_ASOC_REMBRANDT=3Dm=0ACON=
FIG_SND_AMD_ASOC_ACP63=3Dm=0ACONFIG_SND_AMD_ASOC_ACP70=3Dm=0ACONFIG_SND_SOC=
_AMD_MACH_COMMON=3Dm=0ACONFIG_SND_SOC_AMD_LEGACY_MACH=3Dm=0ACONFIG_SND_SOC_=
AMD_SOF_MACH=3Dm=0ACONFIG_SND_SOC_AMD_SDW_MACH_COMMON=3Dm=0ACONFIG_SND_SOC_=
AMD_SOF_SDW_MACH=3Dm=0ACONFIG_SND_SOC_AMD_LEGACY_SDW_MACH=3Dm=0ACONFIG_SND_=
AMD_SOUNDWIRE_ACPI=3Dm=0ACONFIG_SND_SOC_AMD_RPL_ACP6x=3Dm=0ACONFIG_SND_SOC_=
AMD_ACP63_TOPLEVEL=3Dm=0ACONFIG_SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE=3Dm=0AC=
ONFIG_SND_SOC_AMD_SOUNDWIRE=3Dm=0ACONFIG_SND_SOC_AMD_PS=3Dm=0ACONFIG_SND_SO=
C_AMD_PS_MACH=3Dm=0A# end of AMD=0A=0A#=0A# Apple=0A#=0A# end of Apple=0A=
=0A#=0A# Atmel=0A#=0A# end of Atmel=0A=0A#=0A# Au1x=0A#=0A# end of Au1x=0A=
=0A#=0A# Broadcom=0A#=0A# CONFIG_SND_BCM63XX_I2S_WHISTLER is not set=0A# en=
d of Broadcom=0A=0A#=0A# Cirrus Logic=0A#=0A# end of Cirrus Logic=0A=0A#=0A=
# DesignWare=0A#=0ACONFIG_SND_DESIGNWARE_I2S=3Dm=0ACONFIG_SND_DESIGNWARE_PC=
M=3Dy=0A# end of DesignWare=0A=0A#=0A# Freescale=0A#=0A=0A#=0A# Common SoC =
Audio options for Freescale CPUs:=0A#=0A# CONFIG_SND_SOC_FSL_ASRC is not se=
t=0A# CONFIG_SND_SOC_FSL_SAI is not set=0A# CONFIG_SND_SOC_FSL_AUDMIX is no=
t set=0A# CONFIG_SND_SOC_FSL_SSI is not set=0A# CONFIG_SND_SOC_FSL_SPDIF is=
 not set=0A# CONFIG_SND_SOC_FSL_ESAI is not set=0A# CONFIG_SND_SOC_FSL_MICF=
IL is not set=0A# CONFIG_SND_SOC_FSL_XCVR is not set=0A# CONFIG_SND_SOC_IMX=
_AUDMUX is not set=0A# end of Freescale=0A=0A#=0A# Google=0A#=0ACONFIG_SND_=
SOC_CHV3_I2S=3Dm=0A# end of Google=0A=0A#=0A# Hisilicon=0A#=0ACONFIG_SND_I2=
S_HI6210_I2S=3Dm=0A# end of Hisilicon=0A=0A#=0A# JZ4740=0A#=0A# end of JZ47=
40=0A=0A#=0A# Kirkwood=0A#=0A# end of Kirkwood=0A=0A#=0A# Loongson=0A#=0A# =
end of Loongson=0A=0A#=0A# Intel=0A#=0ACONFIG_SND_SOC_INTEL_SST_TOPLEVEL=3D=
y=0ACONFIG_SND_SOC_INTEL_CATPT=3Dm=0ACONFIG_SND_SST_ATOM_HIFI2_PLATFORM=3Dm=
=0ACONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI=3Dm=0ACONFIG_SND_SST_ATOM_HIFI2_P=
LATFORM_ACPI=3Dm=0ACONFIG_SND_SOC_ACPI_INTEL_MATCH=3Dm=0ACONFIG_SND_SOC_ACP=
I_INTEL_SDCA_QUIRKS=3Dm=0ACONFIG_SND_SOC_INTEL_AVS=3Dm=0A=0A#=0A# Intel AVS=
 Machine drivers=0A#=0A=0A#=0A# Available DSP configurations=0A#=0A# CONFIG=
_SND_SOC_INTEL_AVS_CARDNAME_OBSOLETE is not set=0ACONFIG_SND_SOC_INTEL_AVS_=
MACH_DA7219=3Dm=0ACONFIG_SND_SOC_INTEL_AVS_MACH_DMIC=3Dm=0ACONFIG_SND_SOC_I=
NTEL_AVS_MACH_ES8336=3Dm=0ACONFIG_SND_SOC_INTEL_AVS_MACH_HDAUDIO=3Dm=0ACONF=
IG_SND_SOC_INTEL_AVS_MACH_I2S_TEST=3Dm=0ACONFIG_SND_SOC_INTEL_AVS_MACH_MAX9=
8927=3Dm=0ACONFIG_SND_SOC_INTEL_AVS_MACH_MAX98357A=3Dm=0ACONFIG_SND_SOC_INT=
EL_AVS_MACH_MAX98373=3Dm=0ACONFIG_SND_SOC_INTEL_AVS_MACH_NAU8825=3Dm=0ACONF=
IG_SND_SOC_INTEL_AVS_MACH_PCM3168A=3Dm=0ACONFIG_SND_SOC_INTEL_AVS_MACH_PROB=
E=3Dm=0ACONFIG_SND_SOC_INTEL_AVS_MACH_RT274=3Dm=0ACONFIG_SND_SOC_INTEL_AVS_=
MACH_RT286=3Dm=0ACONFIG_SND_SOC_INTEL_AVS_MACH_RT298=3Dm=0ACONFIG_SND_SOC_I=
NTEL_AVS_MACH_RT5514=3Dm=0ACONFIG_SND_SOC_INTEL_AVS_MACH_RT5640=3Dm=0ACONFI=
G_SND_SOC_INTEL_AVS_MACH_RT5663=3Dm=0ACONFIG_SND_SOC_INTEL_AVS_MACH_RT5682=
=3Dm=0ACONFIG_SND_SOC_INTEL_AVS_MACH_SSM4567=3Dm=0A# end of Intel AVS Machi=
ne drivers=0A=0ACONFIG_SND_SOC_INTEL_MACH=3Dy=0ACONFIG_SND_SOC_INTEL_USER_F=
RIENDLY_LONG_NAMES=3Dy=0ACONFIG_SND_SOC_INTEL_HDA_DSP_COMMON=3Dm=0ACONFIG_S=
ND_SOC_INTEL_SOF_MAXIM_COMMON=3Dm=0ACONFIG_SND_SOC_INTEL_SOF_REALTEK_COMMON=
=3Dm=0ACONFIG_SND_SOC_INTEL_SOF_CIRRUS_COMMON=3Dm=0ACONFIG_SND_SOC_INTEL_SO=
F_NUVOTON_COMMON=3Dm=0ACONFIG_SND_SOC_INTEL_SOF_BOARD_HELPERS=3Dm=0ACONFIG_=
SND_SOC_INTEL_HASWELL_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_BDW_RT5650_MACH=3Dm=
=0ACONFIG_SND_SOC_INTEL_BDW_RT5677_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_BROADWEL=
L_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH=3Dm=0ACONFIG_SND_SOC_IN=
TEL_BYTCR_RT5651_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_CHT_BSW_RT5672_MACH=3Dm=0A=
CONFIG_SND_SOC_INTEL_CHT_BSW_RT5645_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_CHT_BSW=
_MAX98090_TI_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_CHT_BSW_NAU8824_MACH=3Dm=0ACON=
FIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_BYT_CHT_D=
A7213_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH=3Dm=0A# CONFIG_SN=
D_SOC_INTEL_BYT_CHT_NOCODEC_MACH is not set=0ACONFIG_SND_SOC_INTEL_SOF_WM88=
04_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH=3Dm=0ACONFIG_S=
ND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_SKL_HDA_D=
SP_GENERIC_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_SOF_RT5682_MACH=3Dm=0ACONFIG_SND=
_SOC_INTEL_SOF_CS42L42_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_SOF_PCM512x_MACH=3Dm=
=0ACONFIG_SND_SOC_INTEL_SOF_ES8336_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_SOF_NAU8=
825_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH=3Dm=0ACONF=
IG_SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_SOF_=
DA7219_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_SOF_SSP_AMP_MACH=3Dm=0ACONFIG_SND_SO=
C_INTEL_EHL_RT5660_MACH=3Dm=0ACONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH=3Dm=
=0A# end of Intel=0A=0A#=0A# Mediatek=0A#=0ACONFIG_SND_SOC_MTK_BTCVSD=3Dm=
=0A# end of Mediatek=0A=0A#=0A# PXA=0A#=0A# end of PXA=0A=0A#=0A# SoundWire=
 (SDCA)=0A#=0ACONFIG_SND_SOC_SDCA=3Dm=0ACONFIG_SND_SOC_SDCA_HID=3Dy=0ACONFI=
G_SND_SOC_SDCA_IRQ=3Dy=0ACONFIG_SND_SOC_SDCA_FDL=3Dy=0ACONFIG_SND_SOC_SDCA_=
OPTIONAL=3Dm=0ACONFIG_SND_SOC_SDCA_CLASS=3Dm=0ACONFIG_SND_SOC_SDCA_CLASS_FU=
NCTION=3Dm=0A# end of SoundWire (SDCA)=0A=0A#=0A# ST SPEAr=0A#=0A# end of S=
T SPEAr=0A=0A#=0A# Spreadtrum=0A#=0A# end of Spreadtrum=0A=0A#=0A# STMicroe=
lectronics STM32=0A#=0A# end of STMicroelectronics STM32=0A=0A#=0A# Tegra=
=0A#=0A# end of Tegra=0A=0A#=0A# Xilinx=0A#=0A# CONFIG_SND_SOC_XILINX_I2S i=
s not set=0A# CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER is not set=0A# CONFIG_S=
ND_SOC_XILINX_SPDIF is not set=0A# end of Xilinx=0A=0A#=0A# Xtensa=0A#=0A# =
CONFIG_SND_SOC_XTFPGA_I2S is not set=0A# end of Xtensa=0A=0ACONFIG_SND_SOC_=
SOF_TOPLEVEL=3Dy=0ACONFIG_SND_SOC_SOF_PCI_DEV=3Dm=0ACONFIG_SND_SOC_SOF_PCI=
=3Dm=0ACONFIG_SND_SOC_SOF_ACPI=3Dm=0ACONFIG_SND_SOC_SOF_ACPI_DEV=3Dm=0ACONF=
IG_SND_SOC_SOF_DEBUG_PROBES=3Dm=0ACONFIG_SND_SOC_SOF_CLIENT=3Dm=0A# CONFIG_=
SND_SOC_SOF_DEVELOPER_SUPPORT is not set=0ACONFIG_SND_SOC_SOF=3Dm=0ACONFIG_=
SND_SOC_SOF_PROBE_WORK_QUEUE=3Dy=0ACONFIG_SND_SOC_SOF_IPC3=3Dy=0ACONFIG_SND=
_SOC_SOF_IPC4=3Dy=0ACONFIG_SND_SOC_SOF_AMD_TOPLEVEL=3Dm=0ACONFIG_SND_SOC_SO=
F_AMD_COMMON=3Dm=0ACONFIG_SND_SOC_SOF_AMD_RENOIR=3Dm=0ACONFIG_SND_SOC_SOF_A=
MD_VANGOGH=3Dm=0ACONFIG_SND_SOC_SOF_AMD_REMBRANDT=3Dm=0ACONFIG_SND_SOC_SOF_=
ACP_PROBES=3Dm=0ACONFIG_SND_SOC_SOF_AMD_SOUNDWIRE_LINK_BASELINE=3Dm=0ACONFI=
G_SND_SOC_SOF_AMD_SOUNDWIRE=3Dm=0ACONFIG_SND_SOC_SOF_AMD_ACP63=3Dm=0ACONFIG=
_SND_SOC_SOF_AMD_ACP70=3Dm=0ACONFIG_SND_SOC_SOF_INTEL_TOPLEVEL=3Dy=0ACONFIG=
_SND_SOC_SOF_INTEL_HIFI_EP_IPC=3Dm=0ACONFIG_SND_SOC_SOF_INTEL_ATOM_HIFI_EP=
=3Dm=0ACONFIG_SND_SOC_SOF_INTEL_COMMON=3Dm=0ACONFIG_SND_SOC_SOF_BAYTRAIL=3D=
m=0ACONFIG_SND_SOC_SOF_BROADWELL=3Dm=0ACONFIG_SND_SOC_SOF_MERRIFIELD=3Dm=0A=
CONFIG_SND_SOC_SOF_INTEL_SKL=3Dm=0ACONFIG_SND_SOC_SOF_SKYLAKE=3Dm=0ACONFIG_=
SND_SOC_SOF_KABYLAKE=3Dm=0ACONFIG_SND_SOC_SOF_INTEL_APL=3Dm=0ACONFIG_SND_SO=
C_SOF_APOLLOLAKE=3Dm=0ACONFIG_SND_SOC_SOF_GEMINILAKE=3Dm=0ACONFIG_SND_SOC_S=
OF_INTEL_CNL=3Dm=0ACONFIG_SND_SOC_SOF_CANNONLAKE=3Dm=0ACONFIG_SND_SOC_SOF_C=
OFFEELAKE=3Dm=0ACONFIG_SND_SOC_SOF_COMETLAKE=3Dm=0ACONFIG_SND_SOC_SOF_INTEL=
_ICL=3Dm=0ACONFIG_SND_SOC_SOF_ICELAKE=3Dm=0ACONFIG_SND_SOC_SOF_JASPERLAKE=
=3Dm=0ACONFIG_SND_SOC_SOF_INTEL_TGL=3Dm=0ACONFIG_SND_SOC_SOF_TIGERLAKE=3Dm=
=0ACONFIG_SND_SOC_SOF_ELKHARTLAKE=3Dm=0ACONFIG_SND_SOC_SOF_ALDERLAKE=3Dm=0A=
CONFIG_SND_SOC_SOF_INTEL_MTL=3Dm=0ACONFIG_SND_SOC_SOF_METEORLAKE=3Dm=0ACONF=
IG_SND_SOC_SOF_INTEL_LNL=3Dm=0ACONFIG_SND_SOC_SOF_LUNARLAKE=3Dm=0ACONFIG_SN=
D_SOC_SOF_INTEL_PTL=3Dm=0ACONFIG_SND_SOC_SOF_PANTHERLAKE=3Dm=0ACONFIG_SND_S=
OC_SOF_INTEL_NVL=3Dm=0ACONFIG_SND_SOC_SOF_NOVALAKE=3Dm=0ACONFIG_SND_SOC_SOF=
_HDA_COMMON=3Dm=0ACONFIG_SND_SOC_SOF_HDA_GENERIC=3Dm=0ACONFIG_SND_SOC_SOF_H=
DA_MLINK=3Dm=0ACONFIG_SND_SOC_SOF_HDA_LINK=3Dy=0ACONFIG_SND_SOC_SOF_HDA_AUD=
IO_CODEC=3Dy=0ACONFIG_SND_SOF_SOF_HDA_SDW_BPT=3Dm=0ACONFIG_SND_SOC_SOF_HDA_=
LINK_BASELINE=3Dm=0ACONFIG_SND_SOC_SOF_HDA=3Dm=0ACONFIG_SND_SOC_SOF_HDA_PRO=
BES=3Dm=0ACONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE=3Dm=0ACONFIG_SND=
_SOC_SOF_INTEL_SOUNDWIRE=3Dm=0ACONFIG_SND_SOC_SOF_XTENSA=3Dm=0ACONFIG_SND_S=
OC_I2C_AND_SPI=3Dm=0A=0A#=0A# CODEC drivers=0A#=0ACONFIG_SND_SOC_WM_ADSP=3D=
m=0A# CONFIG_SND_SOC_AC97_CODEC is not set=0A# CONFIG_SND_SOC_ADAU1372_I2C =
is not set=0A# CONFIG_SND_SOC_ADAU1372_SPI is not set=0A# CONFIG_SND_SOC_AD=
AU1373 is not set=0A# CONFIG_SND_SOC_ADAU1701 is not set=0A# CONFIG_SND_SOC=
_ADAU1761_I2C is not set=0A# CONFIG_SND_SOC_ADAU1761_SPI is not set=0ACONFI=
G_SND_SOC_ADAU7002=3Dm=0A# CONFIG_SND_SOC_ADAU7118_HW is not set=0A# CONFIG=
_SND_SOC_ADAU7118_I2C is not set=0A# CONFIG_SND_SOC_AK4104 is not set=0A# C=
ONFIG_SND_SOC_AK4118 is not set=0A# CONFIG_SND_SOC_AK4375 is not set=0A# CO=
NFIG_SND_SOC_AK4458 is not set=0A# CONFIG_SND_SOC_AK4554 is not set=0A# CON=
FIG_SND_SOC_AK4613 is not set=0A# CONFIG_SND_SOC_AK4619 is not set=0A# CONF=
IG_SND_SOC_AK4642 is not set=0A# CONFIG_SND_SOC_AK5386 is not set=0A# CONFI=
G_SND_SOC_AK5558 is not set=0A# CONFIG_SND_SOC_ALC5623 is not set=0A# CONFI=
G_SND_SOC_AUDIO_IIO_AUX is not set=0A# CONFIG_SND_SOC_AW8738 is not set=0A#=
 CONFIG_SND_SOC_AW88395 is not set=0A# CONFIG_SND_SOC_AW88166 is not set=0A=
# CONFIG_SND_SOC_AW88261 is not set=0A# CONFIG_SND_SOC_AW88081 is not set=
=0A# CONFIG_SND_SOC_AW87390 is not set=0A# CONFIG_SND_SOC_AW88399 is not se=
t=0A# CONFIG_SND_SOC_BD28623 is not set=0ACONFIG_SND_SOC_BT_SCO=3Dm=0ACONFI=
G_SND_SOC_CHV3_CODEC=3Dm=0ACONFIG_SND_SOC_CROS_EC_CODEC=3Dm=0ACONFIG_SND_SO=
C_CS_AMP_LIB=3Dm=0A# CONFIG_SND_SOC_CS35L32 is not set=0A# CONFIG_SND_SOC_C=
S35L33 is not set=0ACONFIG_SND_SOC_CS35L34=3Dm=0ACONFIG_SND_SOC_CS35L35=3Dm=
=0ACONFIG_SND_SOC_CS35L36=3Dm=0ACONFIG_SND_SOC_CS35L41_LIB=3Dm=0ACONFIG_SND=
_SOC_CS35L41=3Dm=0ACONFIG_SND_SOC_CS35L41_SPI=3Dm=0ACONFIG_SND_SOC_CS35L41_=
I2C=3Dm=0ACONFIG_SND_SOC_CS35L45=3Dm=0ACONFIG_SND_SOC_CS35L45_SPI=3Dm=0ACON=
FIG_SND_SOC_CS35L45_I2C=3Dm=0ACONFIG_SND_SOC_CS35L56=3Dm=0ACONFIG_SND_SOC_C=
S35L56_SHARED=3Dm=0ACONFIG_SND_SOC_CS35L56_I2C=3Dm=0ACONFIG_SND_SOC_CS35L56=
_SPI=3Dm=0ACONFIG_SND_SOC_CS35L56_SDW=3Dm=0ACONFIG_SND_SOC_CS35L56_CAL_DEBU=
GFS_COMMON=3Dy=0A=0A#=0A# CS35L56 driver options=0A#=0A# CONFIG_SND_SOC_CS3=
5L56_CAL_DEBUGFS is not set=0ACONFIG_SND_SOC_CS35L56_CAL_SET_CTRL=3Dy=0A# e=
nd of CS35L56 driver options=0A=0ACONFIG_SND_SOC_CS42L42_CORE=3Dm=0ACONFIG_=
SND_SOC_CS42L42=3Dm=0ACONFIG_SND_SOC_CS42L42_SDW=3Dm=0ACONFIG_SND_SOC_CS42L=
43=3Dm=0ACONFIG_SND_SOC_CS42L43_SDW=3Dm=0A# CONFIG_SND_SOC_CS42L51_I2C is n=
ot set=0A# CONFIG_SND_SOC_CS42L52 is not set=0A# CONFIG_SND_SOC_CS42L56 is =
not set=0A# CONFIG_SND_SOC_CS42L73 is not set=0A# CONFIG_SND_SOC_CS42L83 is=
 not set=0A# CONFIG_SND_SOC_CS42L84 is not set=0A# CONFIG_SND_SOC_CS4234 is=
 not set=0A# CONFIG_SND_SOC_CS4265 is not set=0A# CONFIG_SND_SOC_CS4270 is =
not set=0A# CONFIG_SND_SOC_CS4271_I2C is not set=0A# CONFIG_SND_SOC_CS4271_=
SPI is not set=0A# CONFIG_SND_SOC_CS42XX8_I2C is not set=0A# CONFIG_SND_SOC=
_CS43130 is not set=0ACONFIG_SND_SOC_CS4341=3Dm=0A# CONFIG_SND_SOC_CS4349 i=
s not set=0A# CONFIG_SND_SOC_CS48L32 is not set=0A# CONFIG_SND_SOC_CS53L30 =
is not set=0A# CONFIG_SND_SOC_CS530X_I2C is not set=0A# CONFIG_SND_SOC_CS53=
0X_SPI is not set=0ACONFIG_SND_SOC_CX2072X=3Dm=0ACONFIG_SND_SOC_DA7213=3Dm=
=0ACONFIG_SND_SOC_DA7219=3Dm=0ACONFIG_SND_SOC_DMIC=3Dm=0A# CONFIG_SND_SOC_E=
S7134 is not set=0A# CONFIG_SND_SOC_ES7241 is not set=0ACONFIG_SND_SOC_ES83=
XX_DSM_COMMON=3Dm=0A# CONFIG_SND_SOC_ES8311 is not set=0ACONFIG_SND_SOC_ES8=
316=3Dm=0A# CONFIG_SND_SOC_ES8323 is not set=0ACONFIG_SND_SOC_ES8326=3Dm=0A=
# CONFIG_SND_SOC_ES8328_I2C is not set=0A# CONFIG_SND_SOC_ES8328_SPI is not=
 set=0A# CONFIG_SND_SOC_ES8375 is not set=0A# CONFIG_SND_SOC_ES8389 is not =
set=0A# CONFIG_SND_SOC_FS210X is not set=0A# CONFIG_SND_SOC_GTM601 is not s=
et=0ACONFIG_SND_SOC_HDAC_HDA=3Dm=0ACONFIG_SND_SOC_HDA=3Dm=0A# CONFIG_SND_SO=
C_ICS43432 is not set=0A# CONFIG_SND_SOC_IDT821034 is not set=0A# CONFIG_SN=
D_SOC_MAX98088 is not set=0ACONFIG_SND_SOC_MAX98090=3Dm=0ACONFIG_SND_SOC_MA=
X98357A=3Dm=0A# CONFIG_SND_SOC_MAX98504 is not set=0A# CONFIG_SND_SOC_MAX98=
67 is not set=0ACONFIG_SND_SOC_MAX98927=3Dm=0ACONFIG_SND_SOC_MAX98520=3Dm=
=0ACONFIG_SND_SOC_MAX98363=3Dm=0ACONFIG_SND_SOC_MAX98373=3Dm=0ACONFIG_SND_S=
OC_MAX98373_I2C=3Dm=0ACONFIG_SND_SOC_MAX98373_SDW=3Dm=0ACONFIG_SND_SOC_MAX9=
8388=3Dm=0ACONFIG_SND_SOC_MAX98390=3Dm=0ACONFIG_SND_SOC_MAX98396=3Dm=0A# CO=
NFIG_SND_SOC_MAX9860 is not set=0A# CONFIG_SND_SOC_MSM8916_WCD_ANALOG is no=
t set=0A# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set=0A# CONFIG_SND_SOC_=
PCM1681 is not set=0A# CONFIG_SND_SOC_PCM1754 is not set=0A# CONFIG_SND_SOC=
_PCM1789_I2C is not set=0A# CONFIG_SND_SOC_PCM179X_I2C is not set=0A# CONFI=
G_SND_SOC_PCM179X_SPI is not set=0A# CONFIG_SND_SOC_PCM186X_I2C is not set=
=0A# CONFIG_SND_SOC_PCM186X_SPI is not set=0A# CONFIG_SND_SOC_PCM3060_I2C i=
s not set=0A# CONFIG_SND_SOC_PCM3060_SPI is not set=0ACONFIG_SND_SOC_PCM316=
8A=3Dm=0ACONFIG_SND_SOC_PCM3168A_I2C=3Dm=0A# CONFIG_SND_SOC_PCM3168A_SPI is=
 not set=0A# CONFIG_SND_SOC_PCM5102A is not set=0ACONFIG_SND_SOC_PCM512x=3D=
m=0ACONFIG_SND_SOC_PCM512x_I2C=3Dm=0A# CONFIG_SND_SOC_PCM512x_SPI is not se=
t=0A# CONFIG_SND_SOC_PCM6240 is not set=0A# CONFIG_SND_SOC_PEB2466 is not s=
et=0A# CONFIG_SND_SOC_PM4125_SDW is not set=0ACONFIG_SND_SOC_RL6231=3Dm=0AC=
ONFIG_SND_SOC_RT_SDW_COMMON=3Dm=0ACONFIG_SND_SOC_RL6347A=3Dm=0ACONFIG_SND_S=
OC_RT274=3Dm=0ACONFIG_SND_SOC_RT286=3Dm=0ACONFIG_SND_SOC_RT298=3Dm=0ACONFIG=
_SND_SOC_RT1011=3Dm=0ACONFIG_SND_SOC_RT1015=3Dm=0ACONFIG_SND_SOC_RT1015P=3D=
m=0ACONFIG_SND_SOC_RT1017_SDCA_SDW=3Dm=0ACONFIG_SND_SOC_RT1019=3Dm=0ACONFIG=
_SND_SOC_RT1308=3Dm=0ACONFIG_SND_SOC_RT1308_SDW=3Dm=0ACONFIG_SND_SOC_RT1316=
_SDW=3Dm=0ACONFIG_SND_SOC_RT1318_SDW=3Dm=0ACONFIG_SND_SOC_RT1320_SDW=3Dm=0A=
CONFIG_SND_SOC_RT5514=3Dm=0A# CONFIG_SND_SOC_RT5514_SPI_BUILTIN is not set=
=0A# CONFIG_SND_SOC_RT5616 is not set=0A# CONFIG_SND_SOC_RT5631 is not set=
=0ACONFIG_SND_SOC_RT5640=3Dm=0ACONFIG_SND_SOC_RT5645=3Dm=0ACONFIG_SND_SOC_R=
T5651=3Dm=0ACONFIG_SND_SOC_RT5659=3Dm=0ACONFIG_SND_SOC_RT5660=3Dm=0ACONFIG_=
SND_SOC_RT5663=3Dm=0ACONFIG_SND_SOC_RT5670=3Dm=0ACONFIG_SND_SOC_RT5677=3Dm=
=0ACONFIG_SND_SOC_RT5677_SPI=3Dm=0ACONFIG_SND_SOC_RT5682=3Dm=0ACONFIG_SND_S=
OC_RT5682_I2C=3Dm=0ACONFIG_SND_SOC_RT5682_SDW=3Dm=0ACONFIG_SND_SOC_RT5682S=
=3Dm=0ACONFIG_SND_SOC_RT700=3Dm=0ACONFIG_SND_SOC_RT700_SDW=3Dm=0ACONFIG_SND=
_SOC_RT711=3Dm=0ACONFIG_SND_SOC_RT711_SDW=3Dm=0ACONFIG_SND_SOC_RT711_SDCA_S=
DW=3Dm=0ACONFIG_SND_SOC_RT712_SDCA_SDW=3Dm=0ACONFIG_SND_SOC_RT712_SDCA_DMIC=
_SDW=3Dm=0ACONFIG_SND_SOC_RT721_SDCA_SDW=3Dm=0ACONFIG_SND_SOC_RT722_SDCA_SD=
W=3Dm=0ACONFIG_SND_SOC_RT715=3Dm=0ACONFIG_SND_SOC_RT715_SDW=3Dm=0ACONFIG_SN=
D_SOC_RT715_SDCA_SDW=3Dm=0ACONFIG_SND_SOC_RT9120=3Dm=0ACONFIG_SND_SOC_RT912=
3=3Dm=0ACONFIG_SND_SOC_RT9123P=3Dm=0ACONFIG_SND_SOC_RTQ9124=3Dm=0ACONFIG_SN=
D_SOC_RTQ9128=3Dm=0ACONFIG_SND_SOC_SDW_MOCKUP=3Dm=0A# CONFIG_SND_SOC_SGTL50=
00 is not set=0A# CONFIG_SND_SOC_SIMPLE_AMPLIFIER is not set=0A# CONFIG_SND=
_SOC_SIMPLE_MUX is not set=0A# CONFIG_SND_SOC_SMA1303 is not set=0A# CONFIG=
_SND_SOC_SMA1307 is not set=0A# CONFIG_SND_SOC_SPDIF is not set=0A# CONFIG_=
SND_SOC_SRC4XXX_I2C is not set=0A# CONFIG_SND_SOC_SSM2305 is not set=0A# CO=
NFIG_SND_SOC_SSM2518 is not set=0A# CONFIG_SND_SOC_SSM2602_SPI is not set=
=0A# CONFIG_SND_SOC_SSM2602_I2C is not set=0ACONFIG_SND_SOC_SSM4567=3Dm=0A#=
 CONFIG_SND_SOC_STA32X is not set=0A# CONFIG_SND_SOC_STA350 is not set=0A# =
CONFIG_SND_SOC_STI_SAS is not set=0A# CONFIG_SND_SOC_TAS2552 is not set=0A#=
 CONFIG_SND_SOC_TAS2562 is not set=0A# CONFIG_SND_SOC_TAS2764 is not set=0A=
# CONFIG_SND_SOC_TAS2770 is not set=0A# CONFIG_SND_SOC_TAS2780 is not set=
=0ACONFIG_SND_SOC_TAS2781_COMLIB=3Dm=0ACONFIG_SND_SOC_TAS2781_COMLIB_I2C=3D=
m=0ACONFIG_SND_SOC_TAS2781_FMWLIB=3Dm=0ACONFIG_SND_SOC_TAS2781_I2C=3Dm=0A# =
CONFIG_SND_SOC_TAS2783_SDW is not set=0A# CONFIG_SND_SOC_TAS5086 is not set=
=0A# CONFIG_SND_SOC_TAS571X is not set=0ACONFIG_SND_SOC_TAS5720=3Dm=0A# CON=
FIG_SND_SOC_TAS5805M is not set=0A# CONFIG_SND_SOC_TAS6424 is not set=0ACON=
FIG_SND_SOC_TDA7419=3Dm=0A# CONFIG_SND_SOC_TFA9879 is not set=0A# CONFIG_SN=
D_SOC_TFA989X is not set=0A# CONFIG_SND_SOC_TLV320ADC3XXX is not set=0A# CO=
NFIG_SND_SOC_TLV320AIC23_I2C is not set=0A# CONFIG_SND_SOC_TLV320AIC23_SPI =
is not set=0A# CONFIG_SND_SOC_TLV320AIC31XX is not set=0A# CONFIG_SND_SOC_T=
LV320AIC32X4_I2C is not set=0A# CONFIG_SND_SOC_TLV320AIC32X4_SPI is not set=
=0A# CONFIG_SND_SOC_TLV320AIC3X_I2C is not set=0A# CONFIG_SND_SOC_TLV320AIC=
3X_SPI is not set=0A# CONFIG_SND_SOC_TLV320ADCX140 is not set=0ACONFIG_SND_=
SOC_TS3A227E=3Dm=0A# CONFIG_SND_SOC_TSCS42XX is not set=0A# CONFIG_SND_SOC_=
TSCS454 is not set=0A# CONFIG_SND_SOC_UDA1334 is not set=0A# CONFIG_SND_SOC=
_UDA1342 is not set=0A# CONFIG_SND_SOC_WCD937X_SDW is not set=0A# CONFIG_SN=
D_SOC_WCD938X_SDW is not set=0A# CONFIG_SND_SOC_WCD939X_SDW is not set=0A# =
CONFIG_SND_SOC_WM8510 is not set=0A# CONFIG_SND_SOC_WM8523 is not set=0A# C=
ONFIG_SND_SOC_WM8524 is not set=0A# CONFIG_SND_SOC_WM8580 is not set=0A# CO=
NFIG_SND_SOC_WM8711 is not set=0A# CONFIG_SND_SOC_WM8728 is not set=0A# CON=
FIG_SND_SOC_WM8731_I2C is not set=0A# CONFIG_SND_SOC_WM8731_SPI is not set=
=0A# CONFIG_SND_SOC_WM8737 is not set=0A# CONFIG_SND_SOC_WM8741 is not set=
=0A# CONFIG_SND_SOC_WM8750 is not set=0A# CONFIG_SND_SOC_WM8753 is not set=
=0A# CONFIG_SND_SOC_WM8770 is not set=0A# CONFIG_SND_SOC_WM8776 is not set=
=0A# CONFIG_SND_SOC_WM8782 is not set=0ACONFIG_SND_SOC_WM8804=3Dm=0ACONFIG_=
SND_SOC_WM8804_I2C=3Dm=0A# CONFIG_SND_SOC_WM8804_SPI is not set=0A# CONFIG_=
SND_SOC_WM8903 is not set=0A# CONFIG_SND_SOC_WM8904 is not set=0A# CONFIG_S=
ND_SOC_WM8940 is not set=0A# CONFIG_SND_SOC_WM8960 is not set=0A# CONFIG_SN=
D_SOC_WM8961 is not set=0A# CONFIG_SND_SOC_WM8962 is not set=0A# CONFIG_SND=
_SOC_WM8974 is not set=0A# CONFIG_SND_SOC_WM8978 is not set=0A# CONFIG_SND_=
SOC_WM8985 is not set=0A# CONFIG_SND_SOC_WSA881X is not set=0A# CONFIG_SND_=
SOC_WSA883X is not set=0A# CONFIG_SND_SOC_WSA884X is not set=0A# CONFIG_SND=
_SOC_ZL38060 is not set=0A# CONFIG_SND_SOC_MAX9759 is not set=0A# CONFIG_SN=
D_SOC_MT6351 is not set=0A# CONFIG_SND_SOC_MT6357 is not set=0A# CONFIG_SND=
_SOC_MT6358 is not set=0A# CONFIG_SND_SOC_MT6660 is not set=0ACONFIG_SND_SO=
C_NAU8315=3Dm=0ACONFIG_SND_SOC_NAU8325=3Dm=0A# CONFIG_SND_SOC_NAU8540 is no=
t set=0ACONFIG_SND_SOC_NAU8810=3Dm=0ACONFIG_SND_SOC_NAU8821=3Dm=0A# CONFIG_=
SND_SOC_NAU8822 is not set=0ACONFIG_SND_SOC_NAU8824=3Dm=0ACONFIG_SND_SOC_NA=
U8825=3Dm=0A# CONFIG_SND_SOC_NTP8918 is not set=0A# CONFIG_SND_SOC_NTP8835 =
is not set=0A# CONFIG_SND_SOC_TPA6130A2 is not set=0A# CONFIG_SND_SOC_LPASS=
_WSA_MACRO is not set=0A# CONFIG_SND_SOC_LPASS_VA_MACRO is not set=0A# CONF=
IG_SND_SOC_LPASS_RX_MACRO is not set=0A# CONFIG_SND_SOC_LPASS_TX_MACRO is n=
ot set=0A# end of CODEC drivers=0A=0ACONFIG_SND_SOC_SDW_UTILS=3Dm=0A=0A#=0A=
# Generic drivers=0A#=0A# CONFIG_SND_SIMPLE_CARD is not set=0A# end of Gene=
ric drivers=0A=0ACONFIG_SND_X86=3Dy=0ACONFIG_HDMI_LPE_AUDIO=3Dm=0ACONFIG_SN=
D_SYNTH_EMUX=3Dm=0ACONFIG_SND_XEN_FRONTEND=3Dm=0ACONFIG_SND_VIRTIO=3Dm=0ACO=
NFIG_AC97_BUS=3Dm=0ACONFIG_HID_SUPPORT=3Dy=0ACONFIG_HID=3Dy=0ACONFIG_HID_BA=
TTERY_STRENGTH=3Dy=0ACONFIG_HIDRAW=3Dy=0ACONFIG_UHID=3Dm=0ACONFIG_HID_GENER=
IC=3Dm=0ACONFIG_HID_HAPTIC=3Dy=0A=0A#=0A# Special HID drivers=0A#=0ACONFIG_=
HID_A4TECH=3Dm=0ACONFIG_HID_ACCUTOUCH=3Dm=0ACONFIG_HID_ACRUX=3Dm=0ACONFIG_H=
ID_ACRUX_FF=3Dy=0ACONFIG_HID_APPLE=3Dm=0ACONFIG_HID_APPLEIR=3Dm=0ACONFIG_HI=
D_APPLETB_BL=3Dm=0ACONFIG_HID_APPLETB_KBD=3Dm=0ACONFIG_HID_ASUS=3Dm=0ACONFI=
G_HID_AUREAL=3Dm=0ACONFIG_HID_BELKIN=3Dm=0ACONFIG_HID_BETOP_FF=3Dm=0ACONFIG=
_HID_BIGBEN_FF=3Dm=0ACONFIG_HID_CHERRY=3Dm=0ACONFIG_HID_CHICONY=3Dm=0ACONFI=
G_HID_CORSAIR=3Dm=0ACONFIG_HID_COUGAR=3Dm=0ACONFIG_HID_MACALLY=3Dm=0ACONFIG=
_HID_PRODIKEYS=3Dm=0ACONFIG_HID_CMEDIA=3Dm=0ACONFIG_HID_CP2112=3Dm=0ACONFIG=
_HID_CREATIVE_SB0540=3Dm=0ACONFIG_HID_CYPRESS=3Dm=0ACONFIG_HID_DRAGONRISE=
=3Dm=0ACONFIG_DRAGONRISE_FF=3Dy=0ACONFIG_HID_EMS_FF=3Dm=0ACONFIG_HID_ELAN=
=3Dm=0ACONFIG_HID_ELECOM=3Dm=0ACONFIG_HID_ELO=3Dm=0ACONFIG_HID_EVISION=3Dm=
=0ACONFIG_HID_EZKEY=3Dm=0ACONFIG_HID_FT260=3Dm=0ACONFIG_HID_GEMBIRD=3Dm=0AC=
ONFIG_HID_GFRM=3Dm=0ACONFIG_HID_GLORIOUS=3Dm=0ACONFIG_HID_HOLTEK=3Dm=0ACONF=
IG_HOLTEK_FF=3Dy=0ACONFIG_HID_VIVALDI_COMMON=3Dm=0ACONFIG_HID_GOODIX_SPI=3D=
m=0ACONFIG_HID_GOOGLE_HAMMER=3Dm=0ACONFIG_HID_GOOGLE_STADIA_FF=3Dm=0ACONFIG=
_HID_VIVALDI=3Dm=0ACONFIG_HID_GT683R=3Dm=0ACONFIG_HID_KEYTOUCH=3Dm=0ACONFIG=
_HID_KYE=3Dm=0ACONFIG_HID_KYSONA=3Dm=0ACONFIG_HID_UCLOGIC=3Dm=0ACONFIG_HID_=
WALTOP=3Dm=0ACONFIG_HID_VIEWSONIC=3Dm=0ACONFIG_HID_VRC2=3Dm=0ACONFIG_HID_XI=
AOMI=3Dm=0ACONFIG_HID_GYRATION=3Dm=0ACONFIG_HID_ICADE=3Dm=0ACONFIG_HID_ITE=
=3Dm=0ACONFIG_HID_JABRA=3Dm=0ACONFIG_HID_TWINHAN=3Dm=0ACONFIG_HID_KENSINGTO=
N=3Dm=0ACONFIG_HID_LCPOWER=3Dm=0ACONFIG_HID_LED=3Dm=0ACONFIG_HID_LENOVO=3Dm=
=0ACONFIG_HID_LETSKETCH=3Dm=0ACONFIG_HID_LOGITECH=3Dm=0ACONFIG_HID_LOGITECH=
_DJ=3Dm=0ACONFIG_HID_LOGITECH_HIDPP=3Dm=0ACONFIG_LOGITECH_FF=3Dy=0ACONFIG_L=
OGIRUMBLEPAD2_FF=3Dy=0ACONFIG_LOGIG940_FF=3Dy=0ACONFIG_LOGIWHEELS_FF=3Dy=0A=
CONFIG_HID_MAGICMOUSE=3Dm=0ACONFIG_HID_MALTRON=3Dm=0ACONFIG_HID_MAYFLASH=3D=
m=0ACONFIG_HID_MEGAWORLD_FF=3Dm=0ACONFIG_HID_REDRAGON=3Dm=0ACONFIG_HID_MICR=
OSOFT=3Dm=0ACONFIG_HID_MONTEREY=3Dm=0ACONFIG_HID_MULTITOUCH=3Dm=0ACONFIG_HI=
D_NINTENDO=3Dm=0ACONFIG_NINTENDO_FF=3Dy=0ACONFIG_HID_NTI=3Dm=0ACONFIG_HID_N=
TRIG=3Dm=0ACONFIG_HID_NVIDIA_SHIELD=3Dm=0ACONFIG_NVIDIA_SHIELD_FF=3Dy=0ACON=
FIG_HID_ORTEK=3Dm=0ACONFIG_HID_PANTHERLORD=3Dm=0ACONFIG_PANTHERLORD_FF=3Dy=
=0ACONFIG_HID_PENMOUNT=3Dm=0ACONFIG_HID_PETALYNX=3Dm=0ACONFIG_HID_PICOLCD=
=3Dm=0ACONFIG_HID_PICOLCD_FB=3Dy=0ACONFIG_HID_PICOLCD_BACKLIGHT=3Dy=0ACONFI=
G_HID_PICOLCD_LCD=3Dy=0ACONFIG_HID_PICOLCD_LEDS=3Dy=0ACONFIG_HID_PICOLCD_CI=
R=3Dy=0ACONFIG_HID_PLANTRONICS=3Dm=0ACONFIG_HID_PLAYSTATION=3Dm=0ACONFIG_PL=
AYSTATION_FF=3Dy=0ACONFIG_HID_PXRC=3Dm=0ACONFIG_HID_RAZER=3Dm=0ACONFIG_HID_=
PRIMAX=3Dm=0ACONFIG_HID_RETRODE=3Dm=0ACONFIG_HID_ROCCAT=3Dm=0ACONFIG_HID_SA=
ITEK=3Dm=0ACONFIG_HID_SAMSUNG=3Dm=0ACONFIG_HID_SEMITEK=3Dm=0ACONFIG_HID_SIG=
MAMICRO=3Dm=0ACONFIG_HID_SONY=3Dm=0ACONFIG_SONY_FF=3Dy=0ACONFIG_HID_SPEEDLI=
NK=3Dm=0ACONFIG_HID_STEAM=3Dm=0ACONFIG_STEAM_FF=3Dy=0ACONFIG_HID_STEELSERIE=
S=3Dm=0ACONFIG_HID_SUNPLUS=3Dm=0ACONFIG_HID_RMI=3Dm=0ACONFIG_HID_GREENASIA=
=3Dm=0ACONFIG_GREENASIA_FF=3Dy=0ACONFIG_HID_HYPERV_MOUSE=3Dm=0ACONFIG_HID_S=
MARTJOYPLUS=3Dm=0ACONFIG_SMARTJOYPLUS_FF=3Dy=0ACONFIG_HID_TIVO=3Dm=0ACONFIG=
_HID_TOPSEED=3Dm=0ACONFIG_HID_TOPRE=3Dm=0ACONFIG_HID_THINGM=3Dm=0ACONFIG_HI=
D_THRUSTMASTER=3Dm=0ACONFIG_THRUSTMASTER_FF=3Dy=0ACONFIG_HID_UDRAW_PS3=3Dm=
=0ACONFIG_HID_U2FZERO=3Dm=0ACONFIG_HID_UNIVERSAL_PIDFF=3Dm=0ACONFIG_HID_WAC=
OM=3Dm=0ACONFIG_HID_WIIMOTE=3Dm=0ACONFIG_HID_WINWING=3Dm=0ACONFIG_HID_XINMO=
=3Dm=0ACONFIG_HID_ZEROPLUS=3Dm=0ACONFIG_ZEROPLUS_FF=3Dy=0ACONFIG_HID_ZYDACR=
ON=3Dm=0ACONFIG_HID_SENSOR_HUB=3Dm=0ACONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm=0A=
CONFIG_HID_ALPS=3Dm=0ACONFIG_HID_MCP2200=3Dm=0ACONFIG_HID_MCP2221=3Dm=0A# e=
nd of Special HID drivers=0A=0A#=0A# HID-BPF support=0A#=0ACONFIG_HID_BPF=
=3Dy=0A# end of HID-BPF support=0A=0ACONFIG_I2C_HID=3Dm=0ACONFIG_I2C_HID_AC=
PI=3Dm=0ACONFIG_I2C_HID_OF=3Dm=0ACONFIG_I2C_HID_CORE=3Dm=0A=0A#=0A# Intel I=
SH HID support=0A#=0ACONFIG_INTEL_ISH_HID=3Dm=0ACONFIG_INTEL_ISH_FIRMWARE_D=
OWNLOADER=3Dm=0A# end of Intel ISH HID support=0A=0A#=0A# AMD SFH HID Suppo=
rt=0A#=0ACONFIG_AMD_SFH_HID=3Dm=0A# end of AMD SFH HID Support=0A=0A#=0A# S=
urface System Aggregator Module HID support=0A#=0ACONFIG_SURFACE_HID=3Dm=0A=
CONFIG_SURFACE_KBD=3Dm=0A# end of Surface System Aggregator Module HID supp=
ort=0A=0ACONFIG_SURFACE_HID_CORE=3Dm=0A=0A#=0A# Intel THC HID Support=0A#=
=0ACONFIG_INTEL_THC_HID=3Dm=0ACONFIG_INTEL_QUICKSPI=3Dm=0ACONFIG_INTEL_QUIC=
KI2C=3Dm=0A# end of Intel THC HID Support=0A=0A#=0A# USB HID support=0A#=0A=
CONFIG_USB_HID=3Dm=0ACONFIG_HID_PID=3Dy=0ACONFIG_USB_HIDDEV=3Dy=0A=0A#=0A# =
USB HID Boot Protocol drivers=0A#=0A# CONFIG_USB_KBD is not set=0A# CONFIG_=
USB_MOUSE is not set=0A# end of USB HID Boot Protocol drivers=0A# end of US=
B HID support=0A=0ACONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy=0ACONFIG_USB_SUPPORT=
=3Dy=0ACONFIG_USB_COMMON=3Dy=0ACONFIG_USB_LED_TRIG=3Dy=0ACONFIG_USB_ULPI_BU=
S=3Dm=0ACONFIG_USB_CONN_GPIO=3Dm=0ACONFIG_USB_ARCH_HAS_HCD=3Dy=0ACONFIG_USB=
=3Dm=0ACONFIG_USB_PCI=3Dy=0ACONFIG_USB_PCI_AMD=3Dy=0ACONFIG_USB_ANNOUNCE_NE=
W_DEVICES=3Dy=0A=0A#=0A# Miscellaneous USB options=0A#=0ACONFIG_USB_DEFAULT=
_PERSIST=3Dy=0A# CONFIG_USB_FEW_INIT_RETRIES is not set=0A# CONFIG_USB_DYNA=
MIC_MINORS is not set=0ACONFIG_USB_OTG=3Dy=0A# CONFIG_USB_OTG_PRODUCTLIST i=
s not set=0A# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set=0ACONFIG_USB_O=
TG_FSM=3Dm=0ACONFIG_USB_LEDS_TRIGGER_USBPORT=3Dm=0ACONFIG_USB_AUTOSUSPEND_D=
ELAY=3D2=0ACONFIG_USB_DEFAULT_AUTHORIZATION_MODE=3D1=0ACONFIG_USB_MON=3Dm=
=0A=0A#=0A# USB Host Controller Drivers=0A#=0ACONFIG_USB_C67X00_HCD=3Dm=0AC=
ONFIG_USB_XHCI_HCD=3Dm=0A# CONFIG_USB_XHCI_DBGCAP is not set=0ACONFIG_USB_X=
HCI_PCI=3Dm=0ACONFIG_USB_XHCI_PCI_RENESAS=3Dm=0ACONFIG_USB_XHCI_PLATFORM=3D=
m=0ACONFIG_USB_XHCI_SIDEBAND=3Dy=0ACONFIG_USB_EHCI_HCD=3Dm=0ACONFIG_USB_EHC=
I_ROOT_HUB_TT=3Dy=0ACONFIG_USB_EHCI_TT_NEWSCHED=3Dy=0ACONFIG_USB_EHCI_PCI=
=3Dm=0ACONFIG_USB_EHCI_FSL=3Dm=0ACONFIG_USB_EHCI_HCD_PLATFORM=3Dm=0ACONFIG_=
USB_OXU210HP_HCD=3Dm=0ACONFIG_USB_ISP116X_HCD=3Dm=0A# CONFIG_USB_MAX3421_HC=
D is not set=0ACONFIG_USB_OHCI_HCD=3Dm=0ACONFIG_USB_OHCI_HCD_PCI=3Dm=0ACONF=
IG_USB_OHCI_HCD_SSB=3Dy=0ACONFIG_USB_OHCI_HCD_PLATFORM=3Dm=0ACONFIG_USB_UHC=
I_HCD=3Dm=0ACONFIG_USB_SL811_HCD=3Dm=0A# CONFIG_USB_SL811_HCD_ISO is not se=
t=0A# CONFIG_USB_SL811_CS is not set=0ACONFIG_USB_R8A66597_HCD=3Dm=0ACONFIG=
_USB_HCD_BCMA=3Dm=0ACONFIG_USB_HCD_SSB=3Dm=0A# CONFIG_USB_HCD_TEST_MODE is =
not set=0ACONFIG_USB_XEN_HCD=3Dm=0A=0A#=0A# USB Device Class drivers=0A#=0A=
CONFIG_USB_ACM=3Dm=0ACONFIG_USB_PRINTER=3Dm=0ACONFIG_USB_WDM=3Dm=0ACONFIG_U=
SB_TMC=3Dm=0A=0A#=0A# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may =
also be needed; see USB_STORAGE Help for more info=0A#=0ACONFIG_USB_STORAGE=
=3Dm=0A# CONFIG_USB_STORAGE_DEBUG is not set=0ACONFIG_USB_STORAGE_REALTEK=
=3Dm=0ACONFIG_REALTEK_AUTOPM=3Dy=0ACONFIG_USB_STORAGE_DATAFAB=3Dm=0ACONFIG_=
USB_STORAGE_FREECOM=3Dm=0ACONFIG_USB_STORAGE_ISD200=3Dm=0ACONFIG_USB_STORAG=
E_USBAT=3Dm=0ACONFIG_USB_STORAGE_SDDR09=3Dm=0ACONFIG_USB_STORAGE_SDDR55=3Dm=
=0ACONFIG_USB_STORAGE_JUMPSHOT=3Dm=0ACONFIG_USB_STORAGE_ALAUDA=3Dm=0ACONFIG=
_USB_STORAGE_ONETOUCH=3Dm=0ACONFIG_USB_STORAGE_KARMA=3Dm=0ACONFIG_USB_STORA=
GE_CYPRESS_ATACB=3Dm=0ACONFIG_USB_STORAGE_ENE_UB6250=3Dm=0ACONFIG_USB_UAS=
=3Dm=0A=0A#=0A# USB Imaging devices=0A#=0ACONFIG_USB_MDC800=3Dm=0ACONFIG_US=
B_MICROTEK=3Dm=0ACONFIG_USBIP_CORE=3Dm=0ACONFIG_USBIP_VHCI_HCD=3Dm=0ACONFIG=
_USBIP_VHCI_HC_PORTS=3D8=0ACONFIG_USBIP_VHCI_NR_HCS=3D1=0ACONFIG_USBIP_HOST=
=3Dm=0ACONFIG_USBIP_VUDC=3Dm=0A# CONFIG_USBIP_DEBUG is not set=0A=0A#=0A# U=
SB dual-mode controller drivers=0A#=0ACONFIG_USB_CDNS_SUPPORT=3Dm=0ACONFIG_=
USB_CDNS_HOST=3Dy=0ACONFIG_USB_CDNS3=3Dm=0A# CONFIG_USB_CDNS3_GADGET is not=
 set=0ACONFIG_USB_CDNS3_HOST=3Dy=0ACONFIG_USB_CDNS3_PCI_WRAP=3Dm=0ACONFIG_U=
SB_CDNSP_PCI=3Dm=0ACONFIG_USB_CDNSP_GADGET=3Dy=0ACONFIG_USB_CDNSP_HOST=3Dy=
=0ACONFIG_USB_MUSB_HDRC=3Dm=0ACONFIG_USB_MUSB_HOST=3Dy=0A# CONFIG_USB_MUSB_=
GADGET is not set=0A# CONFIG_USB_MUSB_DUAL_ROLE is not set=0A=0A#=0A# Platf=
orm Glue Layer=0A#=0A=0A#=0A# MUSB DMA mode=0A#=0ACONFIG_MUSB_PIO_ONLY=3Dy=
=0ACONFIG_USB_DWC3=3Dm=0ACONFIG_USB_DWC3_ULPI=3Dy=0A# CONFIG_USB_DWC3_HOST =
is not set=0A# CONFIG_USB_DWC3_GADGET is not set=0ACONFIG_USB_DWC3_DUAL_ROL=
E=3Dy=0A=0A#=0A# Platform Glue Driver Support=0A#=0ACONFIG_USB_DWC3_PCI=3Dm=
=0ACONFIG_USB_DWC3_HAPS=3Dm=0A# CONFIG_USB_DWC2 is not set=0A# CONFIG_USB_C=
HIPIDEA is not set=0ACONFIG_USB_ISP1760=3Dm=0ACONFIG_USB_ISP1760_HCD=3Dy=0A=
CONFIG_USB_ISP1760_HOST_ROLE=3Dy=0A# CONFIG_USB_ISP1760_GADGET_ROLE is not =
set=0A# CONFIG_USB_ISP1760_DUAL_ROLE is not set=0A=0A#=0A# USB port drivers=
=0A#=0ACONFIG_USB_SERIAL=3Dm=0ACONFIG_USB_SERIAL_GENERIC=3Dy=0ACONFIG_USB_S=
ERIAL_SIMPLE=3Dm=0ACONFIG_USB_SERIAL_AIRCABLE=3Dm=0ACONFIG_USB_SERIAL_ARK31=
16=3Dm=0ACONFIG_USB_SERIAL_BELKIN=3Dm=0ACONFIG_USB_SERIAL_CH341=3Dm=0ACONFI=
G_USB_SERIAL_WHITEHEAT=3Dm=0ACONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dm=0ACONFIG=
_USB_SERIAL_CP210X=3Dm=0ACONFIG_USB_SERIAL_CYPRESS_M8=3Dm=0ACONFIG_USB_SERI=
AL_EMPEG=3Dm=0ACONFIG_USB_SERIAL_FTDI_SIO=3Dm=0ACONFIG_USB_SERIAL_VISOR=3Dm=
=0ACONFIG_USB_SERIAL_IPAQ=3Dm=0ACONFIG_USB_SERIAL_IR=3Dm=0ACONFIG_USB_SERIA=
L_EDGEPORT=3Dm=0ACONFIG_USB_SERIAL_EDGEPORT_TI=3Dm=0ACONFIG_USB_SERIAL_F812=
32=3Dm=0ACONFIG_USB_SERIAL_F8153X=3Dm=0ACONFIG_USB_SERIAL_GARMIN=3Dm=0ACONF=
IG_USB_SERIAL_IPW=3Dm=0ACONFIG_USB_SERIAL_IUU=3Dm=0ACONFIG_USB_SERIAL_KEYSP=
AN_PDA=3Dm=0ACONFIG_USB_SERIAL_KEYSPAN=3Dm=0ACONFIG_USB_SERIAL_KLSI=3Dm=0AC=
ONFIG_USB_SERIAL_KOBIL_SCT=3Dm=0ACONFIG_USB_SERIAL_MCT_U232=3Dm=0ACONFIG_US=
B_SERIAL_METRO=3Dm=0ACONFIG_USB_SERIAL_MOS7720=3Dm=0ACONFIG_USB_SERIAL_MOS7=
715_PARPORT=3Dy=0ACONFIG_USB_SERIAL_MOS7840=3Dm=0ACONFIG_USB_SERIAL_MXUPORT=
=3Dm=0ACONFIG_USB_SERIAL_NAVMAN=3Dm=0ACONFIG_USB_SERIAL_PL2303=3Dm=0ACONFIG=
_USB_SERIAL_OTI6858=3Dm=0ACONFIG_USB_SERIAL_QCAUX=3Dm=0ACONFIG_USB_SERIAL_Q=
UALCOMM=3Dm=0ACONFIG_USB_SERIAL_SPCP8X5=3Dm=0ACONFIG_USB_SERIAL_SAFE=3Dm=0A=
CONFIG_USB_SERIAL_SAFE_PADDED=3Dy=0ACONFIG_USB_SERIAL_SIERRAWIRELESS=3Dm=0A=
CONFIG_USB_SERIAL_SYMBOL=3Dm=0ACONFIG_USB_SERIAL_TI=3Dm=0ACONFIG_USB_SERIAL=
_CYBERJACK=3Dm=0ACONFIG_USB_SERIAL_WWAN=3Dm=0ACONFIG_USB_SERIAL_OPTION=3Dm=
=0ACONFIG_USB_SERIAL_OMNINET=3Dm=0ACONFIG_USB_SERIAL_OPTICON=3Dm=0ACONFIG_U=
SB_SERIAL_XSENS_MT=3Dm=0ACONFIG_USB_SERIAL_WISHBONE=3Dm=0ACONFIG_USB_SERIAL=
_SSU100=3Dm=0ACONFIG_USB_SERIAL_QT2=3Dm=0ACONFIG_USB_SERIAL_UPD78F0730=3Dm=
=0ACONFIG_USB_SERIAL_XR=3Dm=0ACONFIG_USB_SERIAL_DEBUG=3Dm=0A=0A#=0A# USB Mi=
scellaneous drivers=0A#=0ACONFIG_USB_USS720=3Dm=0ACONFIG_USB_EMI62=3Dm=0ACO=
NFIG_USB_EMI26=3Dm=0ACONFIG_USB_ADUTUX=3Dm=0ACONFIG_USB_SEVSEG=3Dm=0ACONFIG=
_USB_LEGOTOWER=3Dm=0ACONFIG_USB_LCD=3Dm=0ACONFIG_USB_CYPRESS_CY7C63=3Dm=0AC=
ONFIG_USB_CYTHERM=3Dm=0ACONFIG_USB_IDMOUSE=3Dm=0ACONFIG_USB_APPLEDISPLAY=3D=
m=0ACONFIG_APPLE_MFI_FASTCHARGE=3Dm=0ACONFIG_USB_LJCA=3Dm=0ACONFIG_USB_USBI=
O=3Dm=0ACONFIG_USB_SISUSBVGA=3Dm=0ACONFIG_USB_LD=3Dm=0ACONFIG_USB_TRANCEVIB=
RATOR=3Dm=0ACONFIG_USB_IOWARRIOR=3Dm=0A# CONFIG_USB_TEST is not set=0ACONFI=
G_USB_EHSET_TEST_FIXTURE=3Dm=0ACONFIG_USB_ISIGHTFW=3Dm=0ACONFIG_USB_YUREX=
=3Dm=0ACONFIG_USB_EZUSB_FX2=3Dm=0ACONFIG_USB_HUB_USB251XB=3Dm=0ACONFIG_USB_=
HSIC_USB3503=3Dm=0ACONFIG_USB_HSIC_USB4604=3Dm=0ACONFIG_USB_LINK_LAYER_TEST=
=3Dm=0ACONFIG_USB_CHAOSKEY=3Dm=0ACONFIG_USB_ATM=3Dm=0ACONFIG_USB_SPEEDTOUCH=
=3Dm=0ACONFIG_USB_CXACRU=3Dm=0ACONFIG_USB_UEAGLEATM=3Dm=0ACONFIG_USB_XUSBAT=
M=3Dm=0A=0A#=0A# USB Physical Layer drivers=0A#=0ACONFIG_USB_PHY=3Dy=0ACONF=
IG_NOP_USB_XCEIV=3Dm=0A# CONFIG_USB_GPIO_VBUS is not set=0ACONFIG_USB_ISP13=
01=3Dm=0A# end of USB Physical Layer drivers=0A=0ACONFIG_USB_GADGET=3Dy=0A#=
 CONFIG_USB_GADGET_DEBUG is not set=0A# CONFIG_USB_GADGET_DEBUG_FILES is no=
t set=0A# CONFIG_USB_GADGET_DEBUG_FS is not set=0ACONFIG_USB_GADGET_VBUS_DR=
AW=3D2=0ACONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2=0A# CONFIG_U_SERIAL_CONS=
OLE is not set=0A=0A#=0A# USB Peripheral Controller=0A#=0A# CONFIG_USB_GR_U=
DC is not set=0A# CONFIG_USB_R8A66597 is not set=0A# CONFIG_USB_PXA27X is n=
ot set=0A# CONFIG_USB_M66592 is not set=0A# CONFIG_USB_BDC_UDC is not set=
=0A# CONFIG_USB_AMD5536UDC is not set=0A# CONFIG_USB_NET2280 is not set=0A#=
 CONFIG_USB_GOKU is not set=0ACONFIG_USB_EG20T=3Dm=0A# CONFIG_USB_MAX3420_U=
DC is not set=0ACONFIG_USB_CDNS2_UDC=3Dm=0A# end of USB Peripheral Controll=
er=0A=0ACONFIG_USB_LIBCOMPOSITE=3Dm=0ACONFIG_USB_F_ACM=3Dm=0ACONFIG_USB_F_S=
S_LB=3Dm=0ACONFIG_USB_U_SERIAL=3Dm=0ACONFIG_USB_U_ETHER=3Dm=0ACONFIG_USB_U_=
AUDIO=3Dm=0ACONFIG_USB_F_SERIAL=3Dm=0ACONFIG_USB_F_OBEX=3Dm=0ACONFIG_USB_F_=
NCM=3Dm=0ACONFIG_USB_F_ECM=3Dm=0ACONFIG_USB_F_PHONET=3Dm=0ACONFIG_USB_F_EEM=
=3Dm=0ACONFIG_USB_F_SUBSET=3Dm=0ACONFIG_USB_F_RNDIS=3Dm=0ACONFIG_USB_F_MASS=
_STORAGE=3Dm=0ACONFIG_USB_F_FS=3Dm=0ACONFIG_USB_F_UAC1=3Dm=0ACONFIG_USB_F_U=
AC2=3Dm=0ACONFIG_USB_F_UVC=3Dm=0ACONFIG_USB_F_MIDI=3Dm=0ACONFIG_USB_F_MIDI2=
=3Dm=0ACONFIG_USB_F_HID=3Dm=0ACONFIG_USB_F_PRINTER=3Dm=0ACONFIG_USB_F_TCM=
=3Dm=0ACONFIG_USB_CONFIGFS=3Dm=0ACONFIG_USB_CONFIGFS_SERIAL=3Dy=0ACONFIG_US=
B_CONFIGFS_ACM=3Dy=0ACONFIG_USB_CONFIGFS_OBEX=3Dy=0ACONFIG_USB_CONFIGFS_NCM=
=3Dy=0ACONFIG_USB_CONFIGFS_ECM=3Dy=0ACONFIG_USB_CONFIGFS_ECM_SUBSET=3Dy=0AC=
ONFIG_USB_CONFIGFS_RNDIS=3Dy=0ACONFIG_USB_CONFIGFS_EEM=3Dy=0ACONFIG_USB_CON=
FIGFS_PHONET=3Dy=0ACONFIG_USB_CONFIGFS_MASS_STORAGE=3Dy=0ACONFIG_USB_CONFIG=
FS_F_LB_SS=3Dy=0ACONFIG_USB_CONFIGFS_F_FS=3Dy=0ACONFIG_USB_CONFIGFS_F_UAC1=
=3Dy=0A# CONFIG_USB_CONFIGFS_F_UAC1_LEGACY is not set=0ACONFIG_USB_CONFIGFS=
_F_UAC2=3Dy=0ACONFIG_USB_CONFIGFS_F_MIDI=3Dy=0ACONFIG_USB_CONFIGFS_F_MIDI2=
=3Dy=0ACONFIG_USB_CONFIGFS_F_HID=3Dy=0ACONFIG_USB_CONFIGFS_F_UVC=3Dy=0ACONF=
IG_USB_CONFIGFS_F_PRINTER=3Dy=0ACONFIG_USB_CONFIGFS_F_TCM=3Dy=0A=0A#=0A# US=
B Gadget precomposed configurations=0A#=0ACONFIG_USB_ZERO=3Dm=0ACONFIG_USB_=
ZERO_HNPTEST=3Dy=0ACONFIG_USB_AUDIO=3Dm=0ACONFIG_GADGET_UAC1=3Dy=0A# CONFIG=
_GADGET_UAC1_LEGACY is not set=0ACONFIG_USB_ETH=3Dm=0ACONFIG_USB_ETH_RNDIS=
=3Dy=0ACONFIG_USB_ETH_EEM=3Dy=0ACONFIG_USB_G_NCM=3Dm=0ACONFIG_USB_GADGETFS=
=3Dm=0ACONFIG_USB_FUNCTIONFS=3Dm=0ACONFIG_USB_FUNCTIONFS_ETH=3Dy=0ACONFIG_U=
SB_FUNCTIONFS_RNDIS=3Dy=0ACONFIG_USB_FUNCTIONFS_GENERIC=3Dy=0ACONFIG_USB_MA=
SS_STORAGE=3Dm=0ACONFIG_USB_GADGET_TARGET=3Dm=0ACONFIG_USB_G_SERIAL=3Dm=0AC=
ONFIG_USB_MIDI_GADGET=3Dm=0ACONFIG_USB_G_PRINTER=3Dm=0ACONFIG_USB_CDC_COMPO=
SITE=3Dm=0ACONFIG_USB_G_NOKIA=3Dm=0ACONFIG_USB_G_ACM_MS=3Dm=0ACONFIG_USB_G_=
MULTI=3Dm=0ACONFIG_USB_G_MULTI_RNDIS=3Dy=0ACONFIG_USB_G_MULTI_CDC=3Dy=0ACON=
FIG_USB_G_HID=3Dm=0ACONFIG_USB_G_DBGP=3Dm=0ACONFIG_USB_G_DBGP_PRINTK=3Dy=0A=
# CONFIG_USB_G_DBGP_SERIAL is not set=0ACONFIG_USB_G_WEBCAM=3Dm=0ACONFIG_US=
B_RAW_GADGET=3Dm=0A# end of USB Gadget precomposed configurations=0A=0ACONF=
IG_TYPEC=3Dm=0ACONFIG_TYPEC_TCPM=3Dm=0ACONFIG_TYPEC_TCPCI=3Dm=0ACONFIG_TYPE=
C_RT1711H=3Dm=0ACONFIG_TYPEC_TCPCI_MAXIM=3Dm=0ACONFIG_TYPEC_FUSB302=3Dm=0AC=
ONFIG_TYPEC_WCOVE=3Dm=0ACONFIG_TYPEC_UCSI=3Dm=0ACONFIG_UCSI_CCG=3Dm=0ACONFI=
G_UCSI_ACPI=3Dm=0ACONFIG_UCSI_STM32G0=3Dm=0ACONFIG_CROS_EC_UCSI=3Dm=0ACONFI=
G_TYPEC_TPS6598X=3Dm=0ACONFIG_TYPEC_ANX7411=3Dm=0ACONFIG_TYPEC_RT1719=3Dm=
=0ACONFIG_TYPEC_HD3SS3220=3Dm=0ACONFIG_TYPEC_STUSB160X=3Dm=0ACONFIG_TYPEC_W=
USB3801=3Dm=0A=0A#=0A# USB Type-C Multiplexer/DeMultiplexer Switch support=
=0A#=0ACONFIG_TYPEC_MUX_FSA4480=3Dm=0ACONFIG_TYPEC_MUX_GPIO_SBU=3Dm=0ACONFI=
G_TYPEC_MUX_PI3USB30532=3Dm=0ACONFIG_TYPEC_MUX_INTEL_PMC=3Dm=0ACONFIG_TYPEC=
_MUX_IT5205=3Dm=0ACONFIG_TYPEC_MUX_NB7VPQ904M=3Dm=0ACONFIG_TYPEC_MUX_PS883X=
=3Dm=0ACONFIG_TYPEC_MUX_PTN36502=3Dm=0ACONFIG_TYPEC_MUX_TUSB1046=3Dm=0ACONF=
IG_TYPEC_MUX_WCD939X_USBSS=3Dm=0A# end of USB Type-C Multiplexer/DeMultiple=
xer Switch support=0A=0A#=0A# USB Type-C Alternate Mode drivers=0A#=0ACONFI=
G_TYPEC_DP_ALTMODE=3Dm=0ACONFIG_TYPEC_NVIDIA_ALTMODE=3Dm=0ACONFIG_TYPEC_TBT=
_ALTMODE=3Dm=0A# end of USB Type-C Alternate Mode drivers=0A=0ACONFIG_USB_R=
OLE_SWITCH=3Dm=0ACONFIG_USB_ROLES_INTEL_XHCI=3Dm=0ACONFIG_MMC=3Dm=0ACONFIG_=
MMC_BLOCK=3Dm=0ACONFIG_MMC_BLOCK_MINORS=3D8=0ACONFIG_SDIO_UART=3Dm=0A# CONF=
IG_MMC_TEST is not set=0ACONFIG_MMC_CRYPTO=3Dy=0A=0A#=0A# MMC/SD/SDIO Host =
Controller Drivers=0A#=0A# CONFIG_MMC_DEBUG is not set=0ACONFIG_MMC_SDHCI=
=3Dm=0ACONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy=0ACONFIG_MMC_SDHCI_UHS2=3Dm=0ACONF=
IG_MMC_SDHCI_PCI=3Dm=0ACONFIG_MMC_RICOH_MMC=3Dy=0ACONFIG_MMC_SDHCI_ACPI=3Dm=
=0ACONFIG_MMC_SDHCI_PLTFM=3Dm=0A# CONFIG_MMC_SDHCI_F_SDH30 is not set=0ACON=
FIG_MMC_WBSD=3Dm=0ACONFIG_MMC_ALCOR=3Dm=0ACONFIG_MMC_TIFM_SD=3Dm=0ACONFIG_M=
MC_SPI=3Dm=0ACONFIG_MMC_SDRICOH_CS=3Dm=0ACONFIG_MMC_CB710=3Dm=0ACONFIG_MMC_=
VIA_SDMMC=3Dm=0ACONFIG_MMC_VUB300=3Dm=0ACONFIG_MMC_USHC=3Dm=0ACONFIG_MMC_US=
DHI6ROL0=3Dm=0ACONFIG_MMC_REALTEK_PCI=3Dm=0ACONFIG_MMC_REALTEK_USB=3Dm=0ACO=
NFIG_MMC_CQHCI=3Dm=0ACONFIG_MMC_HSQ=3Dm=0ACONFIG_MMC_TOSHIBA_PCI=3Dm=0ACONF=
IG_MMC_MTK=3Dm=0ACONFIG_MMC_SDHCI_XENON=3Dm=0ACONFIG_SCSI_UFSHCD=3Dm=0ACONF=
IG_SCSI_UFS_BSG=3Dy=0ACONFIG_SCSI_UFS_CRYPTO=3Dy=0A# CONFIG_SCSI_UFS_FAULT_=
INJECTION is not set=0ACONFIG_SCSI_UFS_HWMON=3Dy=0ACONFIG_SCSI_UFSHCD_PCI=
=3Dm=0A# CONFIG_SCSI_UFS_DWC_TC_PCI is not set=0ACONFIG_SCSI_UFSHCD_PLATFOR=
M=3Dm=0ACONFIG_SCSI_UFS_CDNS_PLATFORM=3Dm=0ACONFIG_MEMSTICK=3Dm=0A# CONFIG_=
MEMSTICK_DEBUG is not set=0A=0A#=0A# MemoryStick drivers=0A#=0A# CONFIG_MEM=
STICK_UNSAFE_RESUME is not set=0ACONFIG_MSPRO_BLOCK=3Dm=0ACONFIG_MS_BLOCK=
=3Dm=0A=0A#=0A# MemoryStick Host Controller Drivers=0A#=0ACONFIG_MEMSTICK_T=
IFM_MS=3Dm=0ACONFIG_MEMSTICK_JMICRON_38X=3Dm=0ACONFIG_MEMSTICK_R592=3Dm=0AC=
ONFIG_MEMSTICK_REALTEK_USB=3Dm=0ACONFIG_LEDS_EXPRESSWIRE=3Dy=0ACONFIG_NEW_L=
EDS=3Dy=0ACONFIG_LEDS_CLASS=3Dy=0ACONFIG_LEDS_CLASS_FLASH=3Dm=0ACONFIG_LEDS=
_CLASS_MULTICOLOR=3Dm=0ACONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy=0A=0A#=0A# LE=
D drivers=0A#=0ACONFIG_LEDS_APU=3Dm=0ACONFIG_LEDS_AW200XX=3Dm=0ACONFIG_LEDS=
_CHT_WCOVE=3Dm=0ACONFIG_LEDS_CROS_EC=3Dm=0ACONFIG_LEDS_LM3530=3Dm=0ACONFIG_=
LEDS_LM3532=3Dm=0ACONFIG_LEDS_LM3533=3Dm=0ACONFIG_LEDS_LM3642=3Dm=0ACONFIG_=
LEDS_PCA9532=3Dm=0ACONFIG_LEDS_PCA9532_GPIO=3Dy=0ACONFIG_LEDS_GPIO=3Dm=0ACO=
NFIG_LEDS_LP3944=3Dm=0ACONFIG_LEDS_LP3952=3Dm=0ACONFIG_LEDS_LP50XX=3Dm=0ACO=
NFIG_LEDS_PCA955X=3Dm=0ACONFIG_LEDS_PCA955X_GPIO=3Dy=0ACONFIG_LEDS_PCA963X=
=3Dm=0ACONFIG_LEDS_PCA995X=3Dm=0A# CONFIG_LEDS_DAC124S085 is not set=0ACONF=
IG_LEDS_PWM=3Dm=0ACONFIG_LEDS_REGULATOR=3Dm=0ACONFIG_LEDS_BD2606MVV=3Dm=0AC=
ONFIG_LEDS_BD2802=3Dm=0ACONFIG_LEDS_INTEL_SS4200=3Dm=0ACONFIG_LEDS_LT3593=
=3Dm=0ACONFIG_LEDS_TCA6507=3Dm=0A# CONFIG_LEDS_TLC591XX is not set=0ACONFIG=
_LEDS_LM355x=3Dm=0ACONFIG_LEDS_IS31FL319X=3Dm=0A=0A#=0A# LED driver for bli=
nk(1) USB RGB LED is under Special HID drivers (HID_THINGM)=0A#=0ACONFIG_LE=
DS_BLINKM=3Dm=0ACONFIG_LEDS_BLINKM_MULTICOLOR=3Dy=0ACONFIG_LEDS_MLXCPLD=3Dm=
=0ACONFIG_LEDS_MLXREG=3Dm=0ACONFIG_LEDS_USER=3Dm=0A# CONFIG_LEDS_NIC78BX is=
 not set=0ACONFIG_LEDS_SPI_BYTE=3Dm=0ACONFIG_LEDS_TI_LMU_COMMON=3Dm=0ACONFI=
G_LEDS_LM36274=3Dm=0A=0A#=0A# Flash and Torch LED drivers=0A#=0A# CONFIG_LE=
DS_AS3645A is not set=0ACONFIG_LEDS_LM3601X=3Dm=0ACONFIG_LEDS_RT8515=3Dm=0A=
CONFIG_LEDS_SGM3140=3Dm=0A=0A#=0A# RGB LED drivers=0A#=0ACONFIG_LEDS_KTD202=
X=3Dm=0ACONFIG_LEDS_PWM_MULTICOLOR=3Dm=0A=0A#=0A# LED Triggers=0A#=0ACONFIG=
_LEDS_TRIGGERS=3Dy=0ACONFIG_LEDS_TRIGGER_TIMER=3Dm=0ACONFIG_LEDS_TRIGGER_ON=
ESHOT=3Dm=0ACONFIG_LEDS_TRIGGER_DISK=3Dy=0A# CONFIG_LEDS_TRIGGER_MTD is not=
 set=0ACONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm=0ACONFIG_LEDS_TRIGGER_BACKLIGHT=3D=
m=0ACONFIG_LEDS_TRIGGER_CPU=3Dy=0ACONFIG_LEDS_TRIGGER_ACTIVITY=3Dm=0ACONFIG=
_LEDS_TRIGGER_GPIO=3Dm=0ACONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm=0A=0A#=0A# ipta=
bles trigger is under Netfilter config (LED target)=0A#=0ACONFIG_LEDS_TRIGG=
ER_TRANSIENT=3Dm=0ACONFIG_LEDS_TRIGGER_CAMERA=3Dm=0A# CONFIG_LEDS_TRIGGER_P=
ANIC is not set=0ACONFIG_LEDS_TRIGGER_NETDEV=3Dm=0ACONFIG_LEDS_TRIGGER_PATT=
ERN=3Dm=0ACONFIG_LEDS_TRIGGER_TTY=3Dm=0ACONFIG_LEDS_TRIGGER_INPUT_EVENTS=3D=
m=0A=0A#=0A# Simatic LED drivers=0A#=0ACONFIG_LEDS_SIEMENS_SIMATIC_IPC=3Dm=
=0ACONFIG_LEDS_SIEMENS_SIMATIC_IPC_APOLLOLAKE=3Dm=0ACONFIG_LEDS_SIEMENS_SIM=
ATIC_IPC_F7188X=3Dm=0ACONFIG_LEDS_SIEMENS_SIMATIC_IPC_ELKHARTLAKE=3Dm=0A# C=
ONFIG_ACCESSIBILITY is not set=0ACONFIG_INFINIBAND=3Dm=0ACONFIG_INFINIBAND_=
USER_MAD=3Dm=0ACONFIG_INFINIBAND_USER_ACCESS=3Dm=0ACONFIG_INFINIBAND_USER_M=
EM=3Dy=0ACONFIG_INFINIBAND_ON_DEMAND_PAGING=3Dy=0ACONFIG_INFINIBAND_ADDR_TR=
ANS=3Dy=0ACONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=3Dy=0ACONFIG_INFINIBAND_VIR=
T_DMA=3Dy=0ACONFIG_INFINIBAND_BNXT_RE=3Dm=0ACONFIG_INFINIBAND_BNG_RE=3Dm=0A=
CONFIG_INFINIBAND_CXGB4=3Dm=0ACONFIG_INFINIBAND_EFA=3Dm=0ACONFIG_INFINIBAND=
_ERDMA=3Dm=0ACONFIG_INFINIBAND_HFI1=3Dm=0A# CONFIG_HFI1_DEBUG_SDMA_ORDER is=
 not set=0A# CONFIG_SDMA_VERBOSITY is not set=0ACONFIG_INFINIBAND_IONIC=3Dm=
=0ACONFIG_INFINIBAND_IRDMA=3Dm=0ACONFIG_MANA_INFINIBAND=3Dm=0ACONFIG_MLX4_I=
NFINIBAND=3Dm=0ACONFIG_MLX5_INFINIBAND=3Dm=0ACONFIG_INFINIBAND_MTHCA=3Dm=0A=
CONFIG_INFINIBAND_MTHCA_DEBUG=3Dy=0ACONFIG_INFINIBAND_OCRDMA=3Dm=0ACONFIG_I=
NFINIBAND_QEDR=3Dm=0ACONFIG_INFINIBAND_USNIC=3Dm=0ACONFIG_INFINIBAND_VMWARE=
_PVRDMA=3Dm=0ACONFIG_INFINIBAND_RDMAVT=3Dm=0ACONFIG_RDMA_RXE=3Dm=0ACONFIG_R=
DMA_SIW=3Dm=0ACONFIG_INFINIBAND_IPOIB=3Dm=0ACONFIG_INFINIBAND_IPOIB_CM=3Dy=
=0ACONFIG_INFINIBAND_IPOIB_DEBUG=3Dy=0A# CONFIG_INFINIBAND_IPOIB_DEBUG_DATA=
 is not set=0ACONFIG_INFINIBAND_SRP=3Dm=0ACONFIG_INFINIBAND_SRPT=3Dm=0ACONF=
IG_INFINIBAND_ISER=3Dm=0ACONFIG_INFINIBAND_ISERT=3Dm=0ACONFIG_INFINIBAND_RT=
RS=3Dm=0ACONFIG_INFINIBAND_RTRS_CLIENT=3Dm=0ACONFIG_INFINIBAND_RTRS_SERVER=
=3Dm=0ACONFIG_INFINIBAND_OPA_VNIC=3Dm=0ACONFIG_EDAC_ATOMIC_SCRUB=3Dy=0ACONF=
IG_EDAC_SUPPORT=3Dy=0ACONFIG_EDAC=3Dy=0A# CONFIG_EDAC_DEBUG is not set=0ACO=
NFIG_EDAC_DECODE_MCE=3Dm=0ACONFIG_EDAC_GHES=3Dy=0ACONFIG_EDAC_SCRUB=3Dy=0AC=
ONFIG_EDAC_ECS=3Dy=0ACONFIG_EDAC_MEM_REPAIR=3Dy=0ACONFIG_EDAC_AMD64=3Dm=0AC=
ONFIG_EDAC_E752X=3Dm=0ACONFIG_EDAC_I82975X=3Dm=0ACONFIG_EDAC_I3000=3Dm=0ACO=
NFIG_EDAC_I3200=3Dm=0ACONFIG_EDAC_IE31200=3Dm=0ACONFIG_EDAC_X38=3Dm=0ACONFI=
G_EDAC_I5400=3Dm=0ACONFIG_EDAC_I7CORE=3Dm=0ACONFIG_EDAC_I5100=3Dm=0ACONFIG_=
EDAC_I7300=3Dm=0ACONFIG_EDAC_SBRIDGE=3Dm=0ACONFIG_EDAC_SKX=3Dm=0ACONFIG_EDA=
C_I10NM=3Dm=0ACONFIG_EDAC_IMH=3Dm=0ACONFIG_EDAC_PND2=3Dm=0ACONFIG_EDAC_IGEN=
6=3Dm=0ACONFIG_RTC_LIB=3Dy=0ACONFIG_RTC_MC146818_LIB=3Dy=0ACONFIG_RTC_CLASS=
=3Dy=0ACONFIG_RTC_HCTOSYS=3Dy=0ACONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"=0ACONFIG=
_RTC_SYSTOHC=3Dy=0ACONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"=0A# CONFIG_RTC_DEBUG =
is not set=0ACONFIG_RTC_NVMEM=3Dy=0A=0A#=0A# RTC interfaces=0A#=0ACONFIG_RT=
C_INTF_SYSFS=3Dy=0ACONFIG_RTC_INTF_PROC=3Dy=0ACONFIG_RTC_INTF_DEV=3Dy=0A# C=
ONFIG_RTC_INTF_DEV_UIE_EMUL is not set=0A# CONFIG_RTC_DRV_TEST is not set=
=0A=0A#=0A# I2C RTC drivers=0A#=0ACONFIG_RTC_DRV_ABB5ZES3=3Dm=0ACONFIG_RTC_=
DRV_ABEOZ9=3Dm=0ACONFIG_RTC_DRV_ABX80X=3Dm=0ACONFIG_RTC_DRV_DS1307=3Dm=0ACO=
NFIG_RTC_DRV_DS1307_CENTURY=3Dy=0ACONFIG_RTC_DRV_DS1374=3Dm=0ACONFIG_RTC_DR=
V_DS1374_WDT=3Dy=0ACONFIG_RTC_DRV_DS1672=3Dm=0ACONFIG_RTC_DRV_MAX6900=3Dm=
=0ACONFIG_RTC_DRV_MAX8907=3Dm=0ACONFIG_RTC_DRV_MAX31335=3Dm=0ACONFIG_RTC_DR=
V_NVIDIA_VRS10=3Dm=0ACONFIG_RTC_DRV_RS5C372=3Dm=0ACONFIG_RTC_DRV_ISL1208=3D=
m=0A# CONFIG_RTC_DRV_ISL12022 is not set=0ACONFIG_RTC_DRV_X1205=3Dm=0ACONFI=
G_RTC_DRV_PCF8523=3Dm=0ACONFIG_RTC_DRV_PCF85363=3Dm=0ACONFIG_RTC_DRV_PCF856=
3=3Dm=0ACONFIG_RTC_DRV_PCF8583=3Dm=0ACONFIG_RTC_DRV_M41T80=3Dm=0ACONFIG_RTC=
_DRV_M41T80_WDT=3Dy=0A# CONFIG_RTC_DRV_BQ32K is not set=0ACONFIG_RTC_DRV_TP=
S6594=3Dm=0ACONFIG_RTC_DRV_S35390A=3Dm=0ACONFIG_RTC_DRV_FM3130=3Dm=0ACONFIG=
_RTC_DRV_RX8010=3Dm=0ACONFIG_RTC_DRV_RX8111=3Dm=0A# CONFIG_RTC_DRV_RX8581 i=
s not set=0A# CONFIG_RTC_DRV_RX8025 is not set=0A# CONFIG_RTC_DRV_EM3027 is=
 not set=0ACONFIG_RTC_DRV_RV3028=3Dm=0ACONFIG_RTC_DRV_RV3032=3Dm=0ACONFIG_R=
TC_DRV_RV8803=3Dm=0ACONFIG_RTC_DRV_SD2405AL=3Dm=0ACONFIG_RTC_DRV_SD3078=3Dm=
=0A=0A#=0A# SPI RTC drivers=0A#=0A# CONFIG_RTC_DRV_M41T93 is not set=0A# CO=
NFIG_RTC_DRV_M41T94 is not set=0A# CONFIG_RTC_DRV_DS1302 is not set=0A# CON=
FIG_RTC_DRV_DS1305 is not set=0A# CONFIG_RTC_DRV_DS1343 is not set=0A# CONF=
IG_RTC_DRV_DS1347 is not set=0A# CONFIG_RTC_DRV_DS1390 is not set=0A# CONFI=
G_RTC_DRV_MAX6916 is not set=0A# CONFIG_RTC_DRV_R9701 is not set=0A# CONFIG=
_RTC_DRV_RX4581 is not set=0A# CONFIG_RTC_DRV_RS5C348 is not set=0A# CONFIG=
_RTC_DRV_MAX6902 is not set=0A# CONFIG_RTC_DRV_PCF2123 is not set=0A# CONFI=
G_RTC_DRV_MCP795 is not set=0ACONFIG_RTC_I2C_AND_SPI=3Dy=0A=0A#=0A# SPI and=
 I2C RTC drivers=0A#=0ACONFIG_RTC_DRV_DS3232=3Dm=0ACONFIG_RTC_DRV_DS3232_HW=
MON=3Dy=0ACONFIG_RTC_DRV_PCF2127=3Dm=0ACONFIG_RTC_DRV_PCF85063=3Dm=0A# CONF=
IG_RTC_DRV_RV3029C2 is not set=0A# CONFIG_RTC_DRV_RX6110 is not set=0A=0A#=
=0A# Platform RTC drivers=0A#=0ACONFIG_RTC_DRV_CMOS=3Dy=0A# CONFIG_RTC_DRV_=
DS1286 is not set=0A# CONFIG_RTC_DRV_DS1511 is not set=0A# CONFIG_RTC_DRV_D=
S1553 is not set=0A# CONFIG_RTC_DRV_DS1685_FAMILY is not set=0A# CONFIG_RTC=
_DRV_DS1742 is not set=0A# CONFIG_RTC_DRV_DS2404 is not set=0A# CONFIG_RTC_=
DRV_DA9063 is not set=0A# CONFIG_RTC_DRV_STK17TA8 is not set=0A# CONFIG_RTC=
_DRV_M48T86 is not set=0A# CONFIG_RTC_DRV_M48T35 is not set=0A# CONFIG_RTC_=
DRV_M48T59 is not set=0A# CONFIG_RTC_DRV_MSM6242 is not set=0A# CONFIG_RTC_=
DRV_RP5C01 is not set=0A# CONFIG_RTC_DRV_CROS_EC is not set=0A=0A#=0A# on-C=
PU RTC drivers=0A#=0A# CONFIG_RTC_DRV_FTRTC010 is not set=0ACONFIG_RTC_DRV_=
GOLDFISH=3Dm=0ACONFIG_RTC_DRV_WILCO_EC=3Dm=0A=0A#=0A# HID Sensor RTC driver=
s=0A#=0A# CONFIG_RTC_DRV_HID_SENSOR_TIME is not set=0ACONFIG_DMADEVICES=3Dy=
=0A# CONFIG_DMADEVICES_DEBUG is not set=0A=0A#=0A# DMA Devices=0A#=0ACONFIG=
_DMA_ENGINE=3Dy=0ACONFIG_DMA_VIRTUAL_CHANNELS=3Dy=0ACONFIG_DMA_ACPI=3Dy=0AC=
ONFIG_ALTERA_MSGDMA=3Dm=0ACONFIG_INTEL_IDMA64=3Dm=0ACONFIG_INTEL_IDXD_BUS=
=3Dm=0ACONFIG_INTEL_IDXD=3Dm=0A# CONFIG_INTEL_IDXD_COMPAT is not set=0ACONF=
IG_INTEL_IDXD_SVM=3Dy=0ACONFIG_INTEL_IDXD_PERFMON=3Dy=0ACONFIG_INTEL_IOATDM=
A=3Dm=0ACONFIG_PLX_DMA=3Dm=0ACONFIG_XILINX_DMA=3Dm=0ACONFIG_XILINX_XDMA=3Dm=
=0ACONFIG_AMD_AE4DMA=3Dm=0ACONFIG_AMD_PTDMA=3Dm=0ACONFIG_AMD_QDMA=3Dm=0A# C=
ONFIG_QCOM_HIDMA_MGMT is not set=0A# CONFIG_QCOM_HIDMA is not set=0ACONFIG_=
DW_DMAC_CORE=3Dy=0ACONFIG_DW_DMAC=3Dm=0ACONFIG_DW_DMAC_PCI=3Dy=0ACONFIG_DW_=
EDMA=3Dm=0ACONFIG_DW_EDMA_PCIE=3Dm=0ACONFIG_HSU_DMA=3Dy=0ACONFIG_SF_PDMA=3D=
m=0A# CONFIG_TI_K3_PSIL is not set=0ACONFIG_INTEL_LDMA=3Dy=0A=0A#=0A# DMA C=
lients=0A#=0ACONFIG_ASYNC_TX_DMA=3Dy=0A# CONFIG_DMATEST is not set=0ACONFIG=
_DMA_ENGINE_RAID=3Dy=0A=0A#=0A# DMABUF options=0A#=0ACONFIG_SYNC_FILE=3Dy=
=0ACONFIG_SW_SYNC=3Dy=0ACONFIG_UDMABUF=3Dy=0ACONFIG_DMABUF_MOVE_NOTIFY=3Dy=
=0A# CONFIG_DMABUF_DEBUG is not set=0A# CONFIG_DMABUF_SELFTESTS is not set=
=0ACONFIG_DMABUF_HEAPS=3Dy=0A# CONFIG_DMABUF_SYSFS_STATS is not set=0ACONFI=
G_DMABUF_HEAPS_SYSTEM=3Dy=0A# CONFIG_DMABUF_HEAPS_CMA is not set=0A# end of=
 DMABUF options=0A=0ACONFIG_DCA=3Dm=0ACONFIG_UIO=3Dm=0ACONFIG_UIO_CIF=3Dm=
=0ACONFIG_UIO_PDRV_GENIRQ=3Dm=0ACONFIG_UIO_DMEM_GENIRQ=3Dm=0ACONFIG_UIO_AEC=
=3Dm=0ACONFIG_UIO_SERCOS3=3Dm=0ACONFIG_UIO_PCI_GENERIC=3Dm=0ACONFIG_UIO_NET=
X=3Dm=0ACONFIG_UIO_MF624=3Dm=0ACONFIG_UIO_HV_GENERIC=3Dm=0ACONFIG_UIO_DFL=
=3Dm=0ACONFIG_UIO_PCI_GENERIC_SVA=3Dm=0ACONFIG_VFIO=3Dm=0ACONFIG_VFIO_GROUP=
=3Dy=0ACONFIG_VFIO_CONTAINER=3Dy=0ACONFIG_VFIO_IOMMU_TYPE1=3Dm=0A# CONFIG_V=
FIO_NOIOMMU is not set=0ACONFIG_VFIO_VIRQFD=3Dy=0A# CONFIG_VFIO_DEBUGFS is =
not set=0A=0A#=0A# VFIO support for PCI devices=0A#=0ACONFIG_VFIO_PCI_CORE=
=3Dm=0ACONFIG_VFIO_PCI_INTX=3Dy=0ACONFIG_VFIO_PCI=3Dm=0ACONFIG_VFIO_PCI_VGA=
=3Dy=0ACONFIG_VFIO_PCI_IGD=3Dy=0ACONFIG_VFIO_PCI_DMABUF=3Dy=0ACONFIG_MLX5_V=
FIO_PCI=3Dm=0ACONFIG_PDS_VFIO_PCI=3Dm=0ACONFIG_VIRTIO_VFIO_PCI=3Dm=0ACONFIG=
_VIRTIO_VFIO_PCI_ADMIN_LEGACY=3Dy=0ACONFIG_QAT_VFIO_PCI=3Dm=0ACONFIG_XE_VFI=
O_PCI=3Dm=0A# end of VFIO support for PCI devices=0A=0ACONFIG_VFIO_MDEV=3Dm=
=0ACONFIG_IRQ_BYPASS_MANAGER=3Dm=0ACONFIG_VIRT_DRIVERS=3Dy=0ACONFIG_VMGENID=
=3Dy=0ACONFIG_VBOXGUEST=3Dm=0ACONFIG_NITRO_ENCLAVES=3Dm=0ACONFIG_ACRN_HSM=
=3Dm=0ACONFIG_EFI_SECRET=3Dm=0ACONFIG_SEV_GUEST=3Dm=0ACONFIG_TDX_GUEST_DRIV=
ER=3Dm=0ACONFIG_TSM_GUEST=3Dy=0ACONFIG_TSM_REPORTS=3Dm=0ACONFIG_TSM_MEASURE=
MENTS=3Dy=0ACONFIG_TSM=3Dy=0ACONFIG_VIRTIO_ANCHOR=3Dy=0ACONFIG_VIRTIO=3Dy=
=0ACONFIG_VIRTIO_PCI_LIB=3Dy=0ACONFIG_VIRTIO_PCI_LIB_LEGACY=3Dy=0ACONFIG_VI=
RTIO_MENU=3Dy=0ACONFIG_VIRTIO_PCI=3Dy=0ACONFIG_VIRTIO_PCI_ADMIN_LEGACY=3Dy=
=0ACONFIG_VIRTIO_PCI_LEGACY=3Dy=0ACONFIG_VIRTIO_VDPA=3Dm=0ACONFIG_VIRTIO_PM=
EM=3Dm=0ACONFIG_VIRTIO_BALLOON=3Dm=0ACONFIG_VIRTIO_MEM=3Dm=0ACONFIG_VIRTIO_=
INPUT=3Dm=0ACONFIG_VIRTIO_MMIO=3Dm=0ACONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy=
=0ACONFIG_VIRTIO_DMA_SHARED_BUFFER=3Dm=0A# CONFIG_VIRTIO_DEBUG is not set=
=0ACONFIG_VIRTIO_RTC=3Dm=0ACONFIG_VIRTIO_RTC_PTP=3Dy=0ACONFIG_VIRTIO_RTC_CL=
ASS=3Dy=0ACONFIG_VDPA=3Dm=0ACONFIG_VDPA_SIM=3Dm=0ACONFIG_VDPA_SIM_NET=3Dm=
=0ACONFIG_VDPA_SIM_BLOCK=3Dm=0ACONFIG_VDPA_USER=3Dm=0ACONFIG_IFCVF=3Dm=0ACO=
NFIG_MLX5_VDPA=3Dy=0ACONFIG_MLX5_VDPA_NET=3Dm=0A# CONFIG_MLX5_VDPA_STEERING=
_DEBUG is not set=0ACONFIG_VP_VDPA=3Dm=0ACONFIG_ALIBABA_ENI_VDPA=3Dm=0ACONF=
IG_SNET_VDPA=3Dm=0ACONFIG_PDS_VDPA=3Dm=0ACONFIG_OCTEONEP_VDPA=3Dm=0ACONFIG_=
VHOST_IOTLB=3Dm=0ACONFIG_VHOST_RING=3Dm=0ACONFIG_VHOST_TASK=3Dy=0ACONFIG_VH=
OST=3Dm=0ACONFIG_VHOST_MENU=3Dy=0ACONFIG_VHOST_NET=3Dm=0ACONFIG_VHOST_SCSI=
=3Dm=0ACONFIG_VHOST_VSOCK=3Dm=0ACONFIG_VHOST_VDPA=3Dm=0A# CONFIG_VHOST_CROS=
S_ENDIAN_LEGACY is not set=0ACONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL=3Dy=0A=
=0A#=0A# Microsoft Hyper-V guest support=0A#=0ACONFIG_HYPERV=3Dy=0A# CONFIG=
_HYPERV_VTL_MODE is not set=0ACONFIG_HYPERV_TIMER=3Dy=0ACONFIG_HYPERV_UTILS=
=3Dm=0ACONFIG_HYPERV_BALLOON=3Dm=0ACONFIG_HYPERV_VMBUS=3Dm=0ACONFIG_MSHV_RO=
OT=3Dm=0A# end of Microsoft Hyper-V guest support=0A=0A#=0A# Xen driver sup=
port=0A#=0ACONFIG_XEN_BALLOON=3Dy=0ACONFIG_XEN_BALLOON_MEMORY_HOTPLUG=3Dy=
=0ACONFIG_XEN_MEMORY_HOTPLUG_LIMIT=3D512=0ACONFIG_XEN_SCRUB_PAGES_DEFAULT=
=3Dy=0ACONFIG_XEN_DEV_EVTCHN=3Dm=0ACONFIG_XEN_BACKEND=3Dy=0ACONFIG_XENFS=3D=
m=0ACONFIG_XEN_COMPAT_XENFS=3Dy=0ACONFIG_XEN_SYS_HYPERVISOR=3Dy=0ACONFIG_XE=
N_XENBUS_FRONTEND=3Dy=0ACONFIG_XEN_GNTDEV=3Dm=0ACONFIG_XEN_GNTDEV_DMABUF=3D=
y=0ACONFIG_XEN_GRANT_DEV_ALLOC=3Dm=0ACONFIG_XEN_GRANT_DMA_ALLOC=3Dy=0ACONFI=
G_SWIOTLB_XEN=3Dy=0ACONFIG_XEN_PCI_STUB=3Dy=0ACONFIG_XEN_PCIDEV_BACKEND=3Dm=
=0A# CONFIG_XEN_PVCALLS_FRONTEND is not set=0ACONFIG_XEN_PVCALLS_BACKEND=3D=
y=0ACONFIG_XEN_SCSI_BACKEND=3Dm=0ACONFIG_XEN_PRIVCMD=3Dm=0ACONFIG_XEN_PRIVC=
MD_EVENTFD=3Dy=0ACONFIG_XEN_ACPI_PROCESSOR=3Dm=0ACONFIG_XEN_MCE_LOG=3Dy=0AC=
ONFIG_XEN_HAVE_PVMMU=3Dy=0ACONFIG_XEN_EFI=3Dy=0ACONFIG_XEN_AUTO_XLATE=3Dy=
=0ACONFIG_XEN_ACPI=3Dy=0ACONFIG_XEN_SYMS=3Dy=0ACONFIG_XEN_HAVE_VPMU=3Dy=0AC=
ONFIG_XEN_FRONT_PGDIR_SHBUF=3Dm=0ACONFIG_XEN_UNPOPULATED_ALLOC=3Dy=0ACONFIG=
_XEN_GRANT_DMA_OPS=3Dy=0ACONFIG_XEN_VIRTIO=3Dy=0A# CONFIG_XEN_VIRTIO_FORCE_=
GRANT is not set=0A# end of Xen driver support=0A=0A# CONFIG_GREYBUS is not=
 set=0A# CONFIG_COMEDI is not set=0A# CONFIG_GPIB is not set=0ACONFIG_STAGI=
NG=3Dy=0ACONFIG_RTL8723BS=3Dm=0A=0A#=0A# IIO staging drivers=0A#=0A=0A#=0A#=
 Accelerometers=0A#=0A# CONFIG_ADIS16203 is not set=0A# end of Acceleromete=
rs=0A=0A#=0A# Analog to digital converters=0A#=0A# CONFIG_AD7816 is not set=
=0A# end of Analog to digital converters=0A=0A#=0A# Analog digital bi-direc=
tion converters=0A#=0A# CONFIG_ADT7316 is not set=0A# end of Analog digital=
 bi-direction converters=0A=0A#=0A# Direct Digital Synthesis=0A#=0A# CONFIG=
_AD9832 is not set=0A# CONFIG_AD9834 is not set=0A# end of Direct Digital S=
ynthesis=0A=0A#=0A# Network Analyzer, Impedance Converters=0A#=0A# CONFIG_A=
D5933 is not set=0A# end of Network Analyzer, Impedance Converters=0A# end =
of IIO staging drivers=0A=0A# CONFIG_FB_SM750 is not set=0ACONFIG_STAGING_M=
EDIA=3Dy=0A# CONFIG_INTEL_ATOMISP is not set=0ACONFIG_DVB_AV7110_IR=3Dy=0AC=
ONFIG_DVB_AV7110=3Dm=0ACONFIG_DVB_AV7110_OSD=3Dy=0ACONFIG_DVB_SP8870=3Dm=0A=
CONFIG_VIDEO_IPU3_IMGU=3Dm=0ACONFIG_VIDEO_INTEL_IPU7=3Dm=0A=0A#=0A# StarFiv=
e media platform drivers=0A#=0ACONFIG_STAGING_MEDIA_DEPRECATED=3Dy=0A=0A#=
=0A# Atmel media platform drivers=0A#=0A# CONFIG_VIDEO_ATMEL_ISC_BASE is no=
t set=0A# CONFIG_VME_BUS is not set=0A# CONFIG_GOLDFISH is not set=0ACONFIG=
_CHROME_PLATFORMS=3Dy=0ACONFIG_CHROMEOS_ACPI=3Dm=0ACONFIG_CHROMEOS_LAPTOP=
=3Dm=0ACONFIG_CHROMEOS_PSTORE=3Dm=0ACONFIG_CHROMEOS_TBMC=3Dm=0ACONFIG_CROS_=
EC=3Dm=0ACONFIG_CROS_EC_I2C=3Dm=0ACONFIG_CROS_EC_ISHTP=3Dm=0ACONFIG_CROS_EC=
_SPI=3Dm=0ACONFIG_CROS_EC_UART=3Dm=0ACONFIG_CROS_EC_LPC=3Dm=0ACONFIG_CROS_E=
C_PROTO=3Dm=0ACONFIG_CROS_KBD_LED_BACKLIGHT=3Dm=0ACONFIG_CROS_EC_CHARDEV=3D=
m=0ACONFIG_CROS_EC_LIGHTBAR=3Dm=0ACONFIG_CROS_EC_DEBUGFS=3Dm=0ACONFIG_CROS_=
EC_SENSORHUB=3Dm=0ACONFIG_CROS_EC_SYSFS=3Dm=0ACONFIG_CROS_EC_TYPEC_ALTMODES=
=3Dy=0ACONFIG_CROS_EC_TYPEC=3Dm=0ACONFIG_CROS_HPS_I2C=3Dm=0ACONFIG_CROS_USB=
PD_LOGGER=3Dm=0ACONFIG_CROS_USBPD_NOTIFY=3Dm=0ACONFIG_CHROMEOS_PRIVACY_SCRE=
EN=3Dm=0ACONFIG_CROS_TYPEC_SWITCH=3Dm=0ACONFIG_WILCO_EC=3Dm=0A# CONFIG_WILC=
O_EC_DEBUGFS is not set=0ACONFIG_WILCO_EC_EVENTS=3Dm=0ACONFIG_WILCO_EC_TELE=
METRY=3Dm=0ACONFIG_MELLANOX_PLATFORM=3Dy=0ACONFIG_MLX_PLATFORM=3Dm=0ACONFIG=
_MLXREG_DPU=3Dm=0ACONFIG_MLXREG_HOTPLUG=3Dm=0ACONFIG_MLXREG_IO=3Dm=0ACONFIG=
_MLXREG_LC=3Dm=0ACONFIG_NVSW_SN2201=3Dm=0ACONFIG_SURFACE_PLATFORMS=3Dy=0ACO=
NFIG_SURFACE3_WMI=3Dm=0ACONFIG_SURFACE_3_POWER_OPREGION=3Dm=0ACONFIG_SURFAC=
E_ACPI_NOTIFY=3Dm=0ACONFIG_SURFACE_AGGREGATOR_CDEV=3Dm=0ACONFIG_SURFACE_AGG=
REGATOR_HUB=3Dm=0ACONFIG_SURFACE_AGGREGATOR_REGISTRY=3Dm=0ACONFIG_SURFACE_A=
GGREGATOR_TABLET_SWITCH=3Dm=0ACONFIG_SURFACE_DTX=3Dm=0ACONFIG_SURFACE_GPE=
=3Dm=0ACONFIG_SURFACE_HOTPLUG=3Dm=0ACONFIG_SURFACE_PLATFORM_PROFILE=3Dm=0AC=
ONFIG_SURFACE_PRO3_BUTTON=3Dm=0ACONFIG_SURFACE_AGGREGATOR=3Dm=0ACONFIG_SURF=
ACE_AGGREGATOR_BUS=3Dy=0A# CONFIG_SURFACE_AGGREGATOR_ERROR_INJECTION is not=
 set=0ACONFIG_X86_PLATFORM_DEVICES=3Dy=0ACONFIG_WMI_BMOF=3Dm=0ACONFIG_HUAWE=
I_WMI=3Dm=0ACONFIG_X86_PLATFORM_DRIVERS_UNIWILL=3Dy=0ACONFIG_UNIWILL_LAPTOP=
=3Dm=0ACONFIG_UV_SYSFS=3Dm=0ACONFIG_MXM_WMI=3Dm=0ACONFIG_NVIDIA_WMI_EC_BACK=
LIGHT=3Dm=0ACONFIG_XIAOMI_WMI=3Dm=0ACONFIG_REDMI_WMI=3Dm=0ACONFIG_GIGABYTE_=
WMI=3Dm=0ACONFIG_ACERHDF=3Dm=0ACONFIG_ACER_WIRELESS=3Dm=0ACONFIG_ACER_WMI=
=3Dm=0ACONFIG_AMD_HSMP=3Dm=0A=0A#=0A# AMD HSMP Driver=0A#=0ACONFIG_AMD_HSMP=
_ACPI=3Dm=0ACONFIG_AMD_HSMP_PLAT=3Dm=0A# end of AMD HSMP Driver=0A=0ACONFIG=
_AMD_PMF=3Dm=0A# CONFIG_AMD_PMF_DEBUG is not set=0ACONFIG_AMD_PMC=3Dm=0ACON=
FIG_AMD_MP2_STB=3Dy=0ACONFIG_AMD_HFI=3Dy=0ACONFIG_AMD_3D_VCACHE=3Dm=0ACONFI=
G_AMD_WBRF=3Dy=0ACONFIG_AMD_ISP_PLATFORM=3Dm=0ACONFIG_ADV_SWBUTTON=3Dm=0ACO=
NFIG_APPLE_GMUX=3Dm=0ACONFIG_ASUS_LAPTOP=3Dm=0ACONFIG_ASUS_WIRELESS=3Dm=0AC=
ONFIG_ASUS_ARMOURY=3Dm=0ACONFIG_ASUS_WMI=3Dm=0ACONFIG_ASUS_WMI_DEPRECATED_A=
TTRS=3Dy=0ACONFIG_ASUS_NB_WMI=3Dm=0ACONFIG_ASUS_TF103C_DOCK=3Dm=0ACONFIG_AY=
ANEO_EC=3Dm=0ACONFIG_MERAKI_MX100=3Dm=0ACONFIG_EEEPC_LAPTOP=3Dm=0ACONFIG_EE=
EPC_WMI=3Dm=0ACONFIG_X86_PLATFORM_DRIVERS_DELL=3Dy=0ACONFIG_ALIENWARE_WMI=
=3Dm=0ACONFIG_ALIENWARE_WMI_LEGACY=3Dy=0ACONFIG_ALIENWARE_WMI_WMAX=3Dy=0ACO=
NFIG_DCDBAS=3Dm=0ACONFIG_DELL_LAPTOP=3Dm=0ACONFIG_DELL_RBU=3Dm=0ACONFIG_DEL=
L_RBTN=3Dm=0ACONFIG_DELL_PC=3Dm=0ACONFIG_DELL_SMBIOS=3Dm=0ACONFIG_DELL_SMBI=
OS_WMI=3Dy=0ACONFIG_DELL_SMBIOS_SMM=3Dy=0ACONFIG_DELL_SMO8800=3Dm=0ACONFIG_=
DELL_UART_BACKLIGHT=3Dm=0ACONFIG_DELL_WMI=3Dm=0ACONFIG_DELL_WMI_PRIVACY=3Dy=
=0ACONFIG_DELL_WMI_AIO=3Dm=0ACONFIG_DELL_WMI_DESCRIPTOR=3Dm=0ACONFIG_DELL_W=
MI_DDV=3Dm=0ACONFIG_DELL_WMI_LED=3Dm=0ACONFIG_DELL_WMI_SYSMAN=3Dm=0ACONFIG_=
AMILO_RFKILL=3Dm=0ACONFIG_FUJITSU_LAPTOP=3Dm=0ACONFIG_FUJITSU_TABLET=3Dm=0A=
CONFIG_GPD_POCKET_FAN=3Dm=0ACONFIG_X86_PLATFORM_DRIVERS_HP=3Dy=0ACONFIG_HP_=
ACCEL=3Dm=0ACONFIG_HP_WMI=3Dm=0ACONFIG_HP_BIOSCFG=3Dm=0ACONFIG_WIRELESS_HOT=
KEY=3Dm=0ACONFIG_IBM_RTL=3Dm=0ACONFIG_SENSORS_HDAPS=3Dm=0A# CONFIG_INTEL_AT=
OMISP2_LED is not set=0A# CONFIG_INTEL_ATOMISP2_PM is not set=0ACONFIG_INTE=
L_IFS=3Dm=0ACONFIG_INTEL_SAR_INT1092=3Dm=0ACONFIG_INTEL_SKL_INT3472=3Dm=0AC=
ONFIG_INTEL_PMC_CORE=3Dm=0ACONFIG_INTEL_PMC_SSRAM_TELEMETRY=3Dm=0ACONFIG_IN=
TEL_PMT_CLASS=3Dm=0ACONFIG_INTEL_PMT_TELEMETRY=3Dm=0ACONFIG_INTEL_PMT_CRASH=
LOG=3Dm=0ACONFIG_INTEL_PMT_DISCOVERY=3Dm=0A=0A#=0A# Intel Speed Select Tech=
nology interface support=0A#=0ACONFIG_INTEL_SPEED_SELECT_TPMI=3Dm=0ACONFIG_=
INTEL_SPEED_SELECT_INTERFACE=3Dm=0A# end of Intel Speed Select Technology i=
nterface support=0A=0ACONFIG_INTEL_TELEMETRY=3Dm=0ACONFIG_INTEL_WMI=3Dy=0AC=
ONFIG_INTEL_WMI_SBL_FW_UPDATE=3Dm=0ACONFIG_INTEL_WMI_THUNDERBOLT=3Dm=0A=0A#=
=0A# Intel Uncore Frequency Control=0A#=0ACONFIG_INTEL_UNCORE_FREQ_CONTROL_=
TPMI=3Dm=0ACONFIG_INTEL_UNCORE_FREQ_CONTROL=3Dm=0A# end of Intel Uncore Fre=
quency Control=0A=0ACONFIG_INTEL_HID_EVENT=3Dm=0ACONFIG_INTEL_VBTN=3Dm=0ACO=
NFIG_INTEL_EHL_PSE_IO=3Dm=0ACONFIG_INTEL_INT0002_VGPIO=3Dm=0ACONFIG_INTEL_O=
AKTRAIL=3Dm=0ACONFIG_INTEL_BXTWC_PMIC_TMU=3Dm=0ACONFIG_INTEL_BYTCRC_PWRSRC=
=3Dm=0ACONFIG_INTEL_CHTDC_TI_PWRBTN=3Dm=0ACONFIG_INTEL_CHTWC_INT33FE=3Dm=0A=
CONFIG_INTEL_ISHTP_ECLITE=3Dm=0ACONFIG_INTEL_MRFLD_PWRBTN=3Dm=0ACONFIG_INTE=
L_PUNIT_IPC=3Dm=0ACONFIG_INTEL_RST=3Dm=0ACONFIG_INTEL_SDSI=3Dm=0ACONFIG_INT=
EL_SMARTCONNECT=3Dm=0ACONFIG_INTEL_TPMI_POWER_DOMAINS=3Dm=0ACONFIG_INTEL_TP=
MI=3Dm=0ACONFIG_INTEL_PLR_TPMI=3Dm=0ACONFIG_INTEL_TURBO_MAX_3=3Dy=0ACONFIG_=
INTEL_VSEC=3Dm=0ACONFIG_IDEAPAD_LAPTOP=3Dm=0ACONFIG_LENOVO_WMI_HOTKEY_UTILI=
TIES=3Dm=0ACONFIG_LENOVO_WMI_CAMERA=3Dm=0ACONFIG_LENOVO_YMC=3Dm=0ACONFIG_TH=
INKPAD_ACPI=3Dm=0ACONFIG_THINKPAD_ACPI_ALSA_SUPPORT=3Dy=0A# CONFIG_THINKPAD=
_ACPI_DEBUGFACILITIES is not set=0A# CONFIG_THINKPAD_ACPI_DEBUG is not set=
=0A# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set=0ACONFIG_THINKPAD_ACPI_VID=
EO=3Dy=0ACONFIG_THINKPAD_ACPI_HOTKEY_POLL=3Dy=0ACONFIG_THINKPAD_LMI=3Dm=0AC=
ONFIG_YOGABOOK=3Dm=0ACONFIG_YT2_1380=3Dm=0ACONFIG_LENOVO_WMI_DATA01=3Dm=0AC=
ONFIG_LENOVO_WMI_EVENTS=3Dm=0ACONFIG_LENOVO_WMI_HELPERS=3Dm=0ACONFIG_LENOVO=
_WMI_GAMEZONE=3Dm=0ACONFIG_LENOVO_WMI_TUNING=3Dm=0ACONFIG_ACPI_QUICKSTART=
=3Dm=0ACONFIG_MEEGOPAD_ANX7428=3Dm=0ACONFIG_MSI_EC=3Dm=0ACONFIG_MSI_LAPTOP=
=3Dm=0ACONFIG_MSI_WMI=3Dm=0ACONFIG_MSI_WMI_PLATFORM=3Dm=0ACONFIG_PCENGINES_=
APU2=3Dm=0ACONFIG_PORTWELL_EC=3Dm=0ACONFIG_BARCO_P50_GPIO=3Dm=0ACONFIG_SAMS=
UNG_GALAXYBOOK=3Dm=0ACONFIG_SAMSUNG_LAPTOP=3Dm=0ACONFIG_SAMSUNG_Q10=3Dm=0AC=
ONFIG_ACPI_TOSHIBA=3Dm=0ACONFIG_TOSHIBA_BT_RFKILL=3Dm=0ACONFIG_TOSHIBA_HAPS=
=3Dm=0ACONFIG_TOSHIBA_WMI=3Dm=0ACONFIG_ACPI_CMPC=3Dm=0ACONFIG_COMPAL_LAPTOP=
=3Dm=0ACONFIG_LG_LAPTOP=3Dm=0ACONFIG_PANASONIC_LAPTOP=3Dm=0ACONFIG_SONY_LAP=
TOP=3Dm=0ACONFIG_SONYPI_COMPAT=3Dy=0ACONFIG_SYSTEM76_ACPI=3Dm=0ACONFIG_TOPS=
TAR_LAPTOP=3Dm=0ACONFIG_SERIAL_MULTI_INSTANTIATE=3Dm=0ACONFIG_TOUCHSCREEN_D=
MI=3Dy=0ACONFIG_INSPUR_PLATFORM_PROFILE=3Dm=0ACONFIG_DASHARO_ACPI=3Dm=0ACON=
FIG_X86_ANDROID_TABLETS=3Dm=0ACONFIG_FW_ATTR_CLASS=3Dm=0ACONFIG_INTEL_IPS=
=3Dm=0ACONFIG_INTEL_SCU_IPC=3Dy=0ACONFIG_INTEL_SCU=3Dy=0ACONFIG_INTEL_SCU_P=
CI=3Dy=0ACONFIG_INTEL_SCU_PLATFORM=3Dm=0ACONFIG_INTEL_SCU_IPC_UTIL=3Dm=0ACO=
NFIG_SIEMENS_SIMATIC_IPC=3Dm=0ACONFIG_SIEMENS_SIMATIC_IPC_BATT=3Dm=0ACONFIG=
_SIEMENS_SIMATIC_IPC_BATT_APOLLOLAKE=3Dm=0ACONFIG_SIEMENS_SIMATIC_IPC_BATT_=
ELKHARTLAKE=3Dm=0ACONFIG_SIEMENS_SIMATIC_IPC_BATT_F7188X=3Dm=0ACONFIG_SILIC=
OM_PLATFORM=3Dm=0ACONFIG_WINMATE_FM07_KEYS=3Dm=0ACONFIG_SEL3350_PLATFORM=3D=
m=0ACONFIG_OXP_EC=3Dm=0ACONFIG_TUXEDO_NB04_WMI_AB=3Dm=0ACONFIG_P2SB=3Dy=0AC=
ONFIG_ACPI_WMI=3Dm=0ACONFIG_ACPI_WMI_LEGACY_DEVICE_NAMES=3Dy=0ACONFIG_HAVE_=
CLK=3Dy=0ACONFIG_HAVE_CLK_PREPARE=3Dy=0ACONFIG_COMMON_CLK=3Dy=0ACONFIG_LMK0=
4832=3Dm=0A# CONFIG_COMMON_CLK_MAX9485 is not set=0ACONFIG_COMMON_CLK_SI534=
1=3Dm=0A# CONFIG_COMMON_CLK_SI5351 is not set=0A# CONFIG_COMMON_CLK_SI544 i=
s not set=0A# CONFIG_COMMON_CLK_CDCE706 is not set=0A# CONFIG_COMMON_CLK_TP=
S68470 is not set=0ACONFIG_COMMON_CLK_CS2000_CP=3Dm=0A# CONFIG_COMMON_CLK_N=
XP is not set=0A# CONFIG_COMMON_CLK_PWM is not set=0A# CONFIG_COMMON_CLK_PX=
A is not set=0A# CONFIG_COMMON_CLK_STM32F is not set=0A# CONFIG_COMMON_CLK_=
STM32H7 is not set=0A# CONFIG_COMMON_CLK_MMP2 is not set=0A# CONFIG_CLK_IMX=
1 is not set=0A# CONFIG_CLK_IMX25 is not set=0A# CONFIG_CLK_IMX27 is not se=
t=0A# CONFIG_CLK_IMX31 is not set=0A# CONFIG_CLK_IMX35 is not set=0A# CONFI=
G_CLK_IMX5 is not set=0A# CONFIG_CLK_IMX6Q is not set=0A# CONFIG_CLK_IMX6SL=
 is not set=0A# CONFIG_CLK_IMX6SLL is not set=0A# CONFIG_CLK_IMX6SX is not =
set=0A# CONFIG_CLK_IMX6UL is not set=0A# CONFIG_CLK_IMX7D is not set=0A# CO=
NFIG_CLK_IMX7ULP is not set=0A# CONFIG_CLK_VF610 is not set=0A# CONFIG_COMM=
ON_CLK_PIC32 is not set=0A# CONFIG_CLK_INTEL_SOCFPGA is not set=0A# CONFIG_=
XILINX_VCU is not set=0ACONFIG_HWSPINLOCK=3Dy=0A=0A#=0A# Clock Source drive=
rs=0A#=0ACONFIG_CLKEVT_I8253=3Dy=0ACONFIG_I8253_LOCK=3Dy=0ACONFIG_CLKBLD_I8=
253=3Dy=0A# CONFIG_MTK_CPUX_TIMER is not set=0A# CONFIG_SH_TIMER_CMT is not=
 set=0A# CONFIG_SH_TIMER_MTU2 is not set=0A# CONFIG_SH_TIMER_TMU is not set=
=0A# CONFIG_EM_TIMER_STI is not set=0A# CONFIG_GXP_TIMER is not set=0A# end=
 of Clock Source drivers=0A=0ACONFIG_MAILBOX=3Dy=0ACONFIG_PCC=3Dy=0A# CONFI=
G_ALTERA_MBOX is not set=0ACONFIG_IOMMU_IOVA=3Dy=0ACONFIG_IOMMU_API=3Dy=0AC=
ONFIG_IOMMUFD_DRIVER=3Dy=0ACONFIG_IOMMU_SUPPORT=3Dy=0A=0A#=0A# Generic IOMM=
U Pagetable Support=0A#=0A# end of Generic IOMMU Pagetable Support=0A=0A# C=
ONFIG_IOMMU_DEBUGFS is not set=0A# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not s=
et=0A# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set=0ACONFIG_IOMMU_DEFAULT_PASS=
THROUGH=3Dy=0ACONFIG_IOMMU_DMA=3Dy=0ACONFIG_IOMMU_SVA=3Dy=0ACONFIG_IOMMU_IO=
PF=3Dy=0ACONFIG_AMD_IOMMU=3Dy=0ACONFIG_DMAR_TABLE=3Dy=0ACONFIG_INTEL_IOMMU=
=3Dy=0ACONFIG_INTEL_IOMMU_SVM=3Dy=0A# CONFIG_INTEL_IOMMU_DEFAULT_ON is not =
set=0ACONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy=0A# CONFIG_INTEL_IOMMU_SCALABLE_MODE=
_DEFAULT_ON is not set=0ACONFIG_INTEL_IOMMU_PERF_EVENTS=3Dy=0A# CONFIG_IOMM=
UFD is not set=0ACONFIG_IRQ_REMAP=3Dy=0ACONFIG_HYPERV_IOMMU=3Dy=0ACONFIG_VI=
RTIO_IOMMU=3Dm=0ACONFIG_GENERIC_PT=3Dy=0A# CONFIG_DEBUG_GENERIC_PT is not s=
et=0ACONFIG_IOMMU_PT=3Dy=0ACONFIG_IOMMU_PT_AMDV1=3Dy=0ACONFIG_IOMMU_PT_VTDS=
S=3Dy=0ACONFIG_IOMMU_PT_X86_64=3Dy=0A=0A#=0A# Remoteproc drivers=0A#=0A# CO=
NFIG_REMOTEPROC is not set=0A# end of Remoteproc drivers=0A=0A#=0A# Rpmsg d=
rivers=0A#=0ACONFIG_RPMSG=3Dm=0ACONFIG_RPMSG_CHAR=3Dm=0ACONFIG_RPMSG_CTRL=
=3Dm=0ACONFIG_RPMSG_NS=3Dm=0A# CONFIG_RPMSG_QCOM_GLINK_RPM is not set=0ACON=
FIG_RPMSG_VIRTIO=3Dm=0A# end of Rpmsg drivers=0A=0ACONFIG_SOUNDWIRE=3Dm=0A=
=0A#=0A# SoundWire Devices=0A#=0ACONFIG_SOUNDWIRE_AMD=3Dm=0ACONFIG_SOUNDWIR=
E_CADENCE=3Dm=0ACONFIG_SOUNDWIRE_INTEL=3Dm=0A# CONFIG_SOUNDWIRE_QCOM is not=
 set=0ACONFIG_SOUNDWIRE_GENERIC_ALLOCATION=3Dm=0A=0A#=0A# SOC (System On Ch=
ip) specific Drivers=0A#=0A=0A#=0A# Amlogic SoC drivers=0A#=0A# end of Amlo=
gic SoC drivers=0A=0A#=0A# Broadcom SoC drivers=0A#=0A# end of Broadcom SoC=
 drivers=0A=0A#=0A# NXP/Freescale QorIQ SoC drivers=0A#=0A# end of NXP/Free=
scale QorIQ SoC drivers=0A=0A#=0A# fujitsu SoC drivers=0A#=0A# end of fujit=
su SoC drivers=0A=0A#=0A# i.MX SoC drivers=0A#=0A# end of i.MX SoC drivers=
=0A=0A#=0A# Enable LiteX SoC Builder specific drivers=0A#=0A# end of Enable=
 LiteX SoC Builder specific drivers=0A=0ACONFIG_WPCM450_SOC=3Dm=0A=0A#=0A# =
Qualcomm SoC drivers=0A#=0ACONFIG_QCOM_PMIC_PDCHARGER_ULOG=3Dm=0ACONFIG_QCO=
M_QMI_HELPERS=3Dm=0ACONFIG_QCOM_PBS=3Dm=0A# end of Qualcomm SoC drivers=0A=
=0A# CONFIG_SUNXI_SRAM is not set=0A# CONFIG_SOC_TI is not set=0A=0A#=0A# X=
ilinx SoC drivers=0A#=0A# end of Xilinx SoC drivers=0A# end of SOC (System =
On Chip) specific Drivers=0A=0A#=0A# PM Domains=0A#=0A=0A#=0A# Amlogic PM D=
omains=0A#=0A# end of Amlogic PM Domains=0A=0A#=0A# Broadcom PM Domains=0A#=
=0A# end of Broadcom PM Domains=0A=0A#=0A# i.MX PM Domains=0A#=0A# CONFIG_I=
MX8M_BLK_CTRL is not set=0A# CONFIG_IMX9_BLK_CTRL is not set=0A# end of i.M=
X PM Domains=0A=0A#=0A# Qualcomm PM Domains=0A#=0A# end of Qualcomm PM Doma=
ins=0A# end of PM Domains=0A=0ACONFIG_PM_DEVFREQ=3Dy=0A=0A#=0A# DEVFREQ Gov=
ernors=0A#=0ACONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dm=0ACONFIG_DEVFREQ_GOV_PE=
RFORMANCE=3Dm=0ACONFIG_DEVFREQ_GOV_POWERSAVE=3Dm=0ACONFIG_DEVFREQ_GOV_USERS=
PACE=3Dm=0ACONFIG_DEVFREQ_GOV_PASSIVE=3Dm=0A=0A#=0A# DEVFREQ Drivers=0A#=0A=
CONFIG_PM_DEVFREQ_EVENT=3Dy=0ACONFIG_EXTCON=3Dy=0A=0A#=0A# Extcon Device Dr=
ivers=0A#=0A# CONFIG_EXTCON_ADC_JACK is not set=0ACONFIG_EXTCON_AXP288=3Dm=
=0ACONFIG_EXTCON_FSA9480=3Dm=0ACONFIG_EXTCON_GPIO=3Dm=0ACONFIG_EXTCON_INTEL=
_INT3496=3Dm=0ACONFIG_EXTCON_INTEL_CHT_WC=3Dm=0ACONFIG_EXTCON_INTEL_MRFLD=
=3Dm=0ACONFIG_EXTCON_LC824206XA=3Dm=0ACONFIG_EXTCON_MAX3355=3Dm=0ACONFIG_EX=
TCON_MAX14526=3Dm=0ACONFIG_EXTCON_PTN5150=3Dm=0A# CONFIG_EXTCON_RT8973A is =
not set=0ACONFIG_EXTCON_SM5502=3Dm=0A# CONFIG_EXTCON_USB_GPIO is not set=0A=
CONFIG_EXTCON_USBC_CROS_EC=3Dm=0ACONFIG_EXTCON_USBC_TUSB320=3Dm=0ACONFIG_ME=
MORY=3Dy=0ACONFIG_FPGA_DFL_EMIF=3Dm=0ACONFIG_IIO=3Dm=0ACONFIG_IIO_BUFFER=3D=
y=0ACONFIG_IIO_BUFFER_CB=3Dm=0ACONFIG_IIO_BUFFER_DMA=3Dm=0ACONFIG_IIO_BUFFE=
R_DMAENGINE=3Dm=0A# CONFIG_IIO_BUFFER_HW_CONSUMER is not set=0ACONFIG_IIO_K=
FIFO_BUF=3Dm=0ACONFIG_IIO_TRIGGERED_BUFFER=3Dm=0ACONFIG_IIO_CONFIGFS=3Dm=0A=
CONFIG_IIO_TRIGGER=3Dy=0ACONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2=0ACONFIG_IIO_=
SW_DEVICE=3Dm=0ACONFIG_IIO_SW_TRIGGER=3Dm=0ACONFIG_IIO_TRIGGERED_EVENT=3Dm=
=0A=0A#=0A# Accelerometers=0A#=0A# CONFIG_ADIS16201 is not set=0A# CONFIG_A=
DIS16209 is not set=0A# CONFIG_ADXL313_I2C is not set=0A# CONFIG_ADXL313_SP=
I is not set=0A# CONFIG_ADXL355_I2C is not set=0A# CONFIG_ADXL355_SPI is no=
t set=0A# CONFIG_ADXL367_SPI is not set=0A# CONFIG_ADXL367_I2C is not set=
=0A# CONFIG_ADXL372_SPI is not set=0A# CONFIG_ADXL372_I2C is not set=0A# CO=
NFIG_ADXL380_SPI is not set=0A# CONFIG_ADXL380_I2C is not set=0A# CONFIG_BM=
A220 is not set=0A# CONFIG_BMA400 is not set=0ACONFIG_BMC150_ACCEL=3Dm=0ACO=
NFIG_BMC150_ACCEL_I2C=3Dm=0ACONFIG_BMC150_ACCEL_SPI=3Dm=0A# CONFIG_BMI088_A=
CCEL is not set=0A# CONFIG_DA280 is not set=0A# CONFIG_DA311 is not set=0A#=
 CONFIG_DMARD06 is not set=0A# CONFIG_DMARD09 is not set=0A# CONFIG_DMARD10=
 is not set=0A# CONFIG_FXLS8962AF_I2C is not set=0A# CONFIG_FXLS8962AF_SPI =
is not set=0ACONFIG_HID_SENSOR_ACCEL_3D=3Dm=0ACONFIG_IIO_CROS_EC_ACCEL_LEGA=
CY=3Dm=0A# CONFIG_IIO_ST_ACCEL_3AXIS is not set=0A# CONFIG_IIO_KX022A_SPI i=
s not set=0A# CONFIG_IIO_KX022A_I2C is not set=0A# CONFIG_KXSD9 is not set=
=0ACONFIG_KXCJK1013=3Dm=0A# CONFIG_MC3230 is not set=0ACONFIG_MMA7455=3Dm=
=0ACONFIG_MMA7455_I2C=3Dm=0ACONFIG_MMA7455_SPI=3Dm=0A# CONFIG_MMA7660 is no=
t set=0A# CONFIG_MMA8452 is not set=0ACONFIG_MMA9551_CORE=3Dm=0ACONFIG_MMA9=
551=3Dm=0ACONFIG_MMA9553=3Dm=0A# CONFIG_MSA311 is not set=0ACONFIG_MXC4005=
=3Dm=0ACONFIG_MXC6255=3Dm=0A# CONFIG_SCA3000 is not set=0A# CONFIG_SCA3300 =
is not set=0ACONFIG_STK8312=3Dm=0ACONFIG_STK8BA50=3Dm=0A# end of Accelerome=
ters=0A=0A#=0A# Analog to digital converters=0A#=0A# CONFIG_AD4000 is not s=
et=0A# CONFIG_AD4030 is not set=0A# CONFIG_AD4080 is not set=0A# CONFIG_AD4=
130 is not set=0A# CONFIG_AD4170_4 is not set=0A# CONFIG_AD4695 is not set=
=0A# CONFIG_AD4851 is not set=0A# CONFIG_AD7091R5 is not set=0A# CONFIG_AD7=
091R8 is not set=0A# CONFIG_AD7124 is not set=0A# CONFIG_AD7173 is not set=
=0A# CONFIG_AD7191 is not set=0A# CONFIG_AD7192 is not set=0A# CONFIG_AD726=
6 is not set=0A# CONFIG_AD7280 is not set=0A# CONFIG_AD7291 is not set=0A# =
CONFIG_AD7292 is not set=0A# CONFIG_AD7298 is not set=0A# CONFIG_AD7380 is =
not set=0A# CONFIG_AD7476 is not set=0A# CONFIG_AD7606_IFACE_PARALLEL is no=
t set=0A# CONFIG_AD7606_IFACE_SPI is not set=0A# CONFIG_AD7625 is not set=
=0A# CONFIG_AD7766 is not set=0A# CONFIG_AD7768_1 is not set=0A# CONFIG_AD7=
779 is not set=0A# CONFIG_AD7780 is not set=0A# CONFIG_AD7791 is not set=0A=
# CONFIG_AD7793 is not set=0A# CONFIG_AD7887 is not set=0A# CONFIG_AD7923 i=
s not set=0A# CONFIG_AD7944 is not set=0A# CONFIG_AD7949 is not set=0A# CON=
FIG_AD799X is not set=0A# CONFIG_AD9467 is not set=0A# CONFIG_ADE9000 is no=
t set=0ACONFIG_AXP20X_ADC=3Dm=0ACONFIG_AXP288_ADC=3Dm=0A# CONFIG_CC10001_AD=
C is not set=0ACONFIG_DLN2_ADC=3Dm=0A# CONFIG_ENVELOPE_DETECTOR is not set=
=0A# CONFIG_GEHC_PMC_ADC is not set=0ACONFIG_HI8435=3Dm=0A# CONFIG_HX711 is=
 not set=0A# CONFIG_INA2XX_ADC is not set=0ACONFIG_INTEL_DC_TI_ADC=3Dm=0A# =
CONFIG_INTEL_MRFLD_ADC is not set=0A# CONFIG_LTC2309 is not set=0A# CONFIG_=
LTC2471 is not set=0A# CONFIG_LTC2485 is not set=0A# CONFIG_LTC2496 is not =
set=0A# CONFIG_LTC2497 is not set=0A# CONFIG_MAX1027 is not set=0A# CONFIG_=
MAX11100 is not set=0A# CONFIG_MAX1118 is not set=0A# CONFIG_MAX11205 is no=
t set=0A# CONFIG_MAX11410 is not set=0A# CONFIG_MAX1241 is not set=0A# CONF=
IG_MAX1363 is not set=0ACONFIG_MAX14001=3Dm=0A# CONFIG_MAX34408 is not set=
=0A# CONFIG_MAX9611 is not set=0A# CONFIG_MCP320X is not set=0A# CONFIG_MCP=
3422 is not set=0A# CONFIG_MCP3564 is not set=0A# CONFIG_MCP3911 is not set=
=0A# CONFIG_NAU7802 is not set=0A# CONFIG_NCT7201 is not set=0A# CONFIG_PAC=
1921 is not set=0A# CONFIG_PAC1934 is not set=0A# CONFIG_QCOM_SPMI_IADC is =
not set=0A# CONFIG_QCOM_SPMI_VADC is not set=0A# CONFIG_QCOM_SPMI_ADC5 is n=
ot set=0A# CONFIG_ROHM_BD79112 is not set=0A# CONFIG_ROHM_BD79124 is not se=
t=0A# CONFIG_RICHTEK_RTQ6056 is not set=0A# CONFIG_SD_ADC_MODULATOR is not =
set=0A# CONFIG_TI_ADC081C is not set=0A# CONFIG_TI_ADC0832 is not set=0A# C=
ONFIG_TI_ADC084S021 is not set=0A# CONFIG_TI_ADC108S102 is not set=0A# CONF=
IG_TI_ADC12138 is not set=0A# CONFIG_TI_ADC128S052 is not set=0A# CONFIG_TI=
_ADC161S626 is not set=0A# CONFIG_TI_ADS1015 is not set=0A# CONFIG_TI_ADS11=
00 is not set=0A# CONFIG_TI_ADS1119 is not set=0A# CONFIG_TI_ADS124S08 is n=
ot set=0A# CONFIG_TI_ADS1298 is not set=0A# CONFIG_TI_ADS131E08 is not set=
=0A# CONFIG_TI_ADS7138 is not set=0A# CONFIG_TI_ADS7924 is not set=0A# CONF=
IG_TI_ADS7950 is not set=0A# CONFIG_TI_ADS8344 is not set=0A# CONFIG_TI_ADS=
8688 is not set=0A# CONFIG_TI_LMP92064 is not set=0A# CONFIG_TI_TLC4541 is =
not set=0A# CONFIG_TI_TSC2046 is not set=0A# CONFIG_VF610_ADC is not set=0A=
# CONFIG_VIPERBOARD_ADC is not set=0A# CONFIG_XILINX_XADC is not set=0A# en=
d of Analog to digital converters=0A=0A#=0A# Analog to digital and digital =
to analog converters=0A#=0A# CONFIG_AD74115 is not set=0A# CONFIG_AD74413R =
is not set=0A# CONFIG_STX104 is not set=0A# end of Analog to digital and di=
gital to analog converters=0A=0A#=0A# Analog Front Ends=0A#=0ACONFIG_IIO_RE=
SCALE=3Dm=0A# end of Analog Front Ends=0A=0A#=0A# Amplifiers=0A#=0A# CONFIG=
_AD8366 is not set=0A# CONFIG_ADA4250 is not set=0A# CONFIG_HMC425 is not s=
et=0A# end of Amplifiers=0A=0A#=0A# Capacitance to digital converters=0A#=
=0A# CONFIG_AD7150 is not set=0A# CONFIG_AD7746 is not set=0A# end of Capac=
itance to digital converters=0A=0A#=0A# Chemical Sensors=0A#=0A# CONFIG_AOS=
ONG_AGS02MA is not set=0ACONFIG_ATLAS_PH_SENSOR=3Dm=0A# CONFIG_ATLAS_EZO_SE=
NSOR is not set=0ACONFIG_BME680=3Dm=0ACONFIG_BME680_I2C=3Dm=0ACONFIG_BME680=
_SPI=3Dm=0A# CONFIG_CCS811 is not set=0A# CONFIG_ENS160 is not set=0ACONFIG=
_IAQCORE=3Dm=0A# CONFIG_MHZ19B is not set=0A# CONFIG_PMS7003 is not set=0A#=
 CONFIG_SCD30_CORE is not set=0A# CONFIG_SCD4X is not set=0A# CONFIG_SEN032=
2 is not set=0A# CONFIG_SENSIRION_SGP30 is not set=0A# CONFIG_SENSIRION_SGP=
40 is not set=0A# CONFIG_SPS30_I2C is not set=0A# CONFIG_SPS30_SERIAL is no=
t set=0A# CONFIG_SENSEAIR_SUNRISE_CO2 is not set=0ACONFIG_VZ89X=3Dm=0A# end=
 of Chemical Sensors=0A=0ACONFIG_IIO_CROS_EC_SENSORS_CORE=3Dm=0ACONFIG_IIO_=
CROS_EC_SENSORS=3Dm=0ACONFIG_IIO_CROS_EC_SENSORS_LID_ANGLE=3Dm=0ACONFIG_IIO=
_CROS_EC_ACTIVITY=3Dm=0A=0A#=0A# Hid Sensor IIO Common=0A#=0ACONFIG_HID_SEN=
SOR_IIO_COMMON=3Dm=0ACONFIG_HID_SENSOR_IIO_TRIGGER=3Dm=0A# end of Hid Senso=
r IIO Common=0A=0ACONFIG_IIO_INV_SENSORS_TIMESTAMP=3Dm=0ACONFIG_IIO_MS_SENS=
ORS_I2C=3Dm=0A=0A#=0A# IIO SCMI Sensors=0A#=0A# end of IIO SCMI Sensors=0A=
=0A#=0A# SSP Sensor Common=0A#=0A# CONFIG_IIO_SSP_SENSORHUB is not set=0A# =
end of SSP Sensor Common=0A=0A#=0A# Digital to analog converters=0A#=0A# CO=
NFIG_AD3530R is not set=0A# CONFIG_AD3552R_HS is not set=0A# CONFIG_AD3552R=
 is not set=0A# CONFIG_AD5064 is not set=0A# CONFIG_AD5360 is not set=0A# C=
ONFIG_AD5380 is not set=0A# CONFIG_AD5421 is not set=0A# CONFIG_AD5446_SPI =
is not set=0A# CONFIG_AD5446_I2C is not set=0A# CONFIG_AD5449 is not set=0A=
# CONFIG_AD5592R is not set=0A# CONFIG_AD5593R is not set=0A# CONFIG_AD5504=
 is not set=0A# CONFIG_AD5624R_SPI is not set=0A# CONFIG_AD9739A is not set=
=0A# CONFIG_LTC2688 is not set=0A# CONFIG_AD5686_SPI is not set=0A# CONFIG_=
AD5696_I2C is not set=0A# CONFIG_AD5755 is not set=0A# CONFIG_AD5758 is not=
 set=0ACONFIG_AD5761=3Dm=0A# CONFIG_AD5764 is not set=0A# CONFIG_AD5766 is =
not set=0A# CONFIG_AD5770R is not set=0A# CONFIG_AD5791 is not set=0A# CONF=
IG_AD7293 is not set=0A# CONFIG_AD7303 is not set=0A# CONFIG_AD8460 is not =
set=0A# CONFIG_AD8801 is not set=0A# CONFIG_BD79703 is not set=0A# CONFIG_C=
IO_DAC is not set=0A# CONFIG_DPOT_DAC is not set=0A# CONFIG_DS4424 is not s=
et=0A# CONFIG_LTC1660 is not set=0A# CONFIG_LTC2632 is not set=0A# CONFIG_L=
TC2664 is not set=0A# CONFIG_M62332 is not set=0A# CONFIG_MAX517 is not set=
=0A# CONFIG_MAX5522 is not set=0A# CONFIG_MAX5821 is not set=0A# CONFIG_MCP=
4725 is not set=0A# CONFIG_MCP4728 is not set=0A# CONFIG_MCP4821 is not set=
=0A# CONFIG_MCP4922 is not set=0A# CONFIG_TI_DAC082S085 is not set=0A# CONF=
IG_TI_DAC5571 is not set=0A# CONFIG_TI_DAC7311 is not set=0A# CONFIG_TI_DAC=
7612 is not set=0A# CONFIG_VF610_DAC is not set=0A# end of Digital to analo=
g converters=0A=0A#=0A# IIO dummy driver=0A#=0A# CONFIG_IIO_SIMPLE_DUMMY is=
 not set=0A# end of IIO dummy driver=0A=0A#=0A# Filters=0A#=0A# CONFIG_ADMV=
8818 is not set=0A# end of Filters=0A=0A#=0A# Frequency Synthesizers DDS/PL=
L=0A#=0A=0A#=0A# Clock Generator/Distribution=0A#=0A# CONFIG_AD9523 is not =
set=0A# end of Clock Generator/Distribution=0A=0A#=0A# Phase-Locked Loop (P=
LL) frequency synthesizers=0A#=0A# CONFIG_ADF4350 is not set=0A# CONFIG_ADF=
4371 is not set=0A# CONFIG_ADF4377 is not set=0A# CONFIG_ADMFM2000 is not s=
et=0A# CONFIG_ADMV1013 is not set=0A# CONFIG_ADMV1014 is not set=0A# CONFIG=
_ADMV4420 is not set=0A# CONFIG_ADRF6780 is not set=0A# end of Phase-Locked=
 Loop (PLL) frequency synthesizers=0A# end of Frequency Synthesizers DDS/PL=
L=0A=0A#=0A# Digital gyroscope sensors=0A#=0A# CONFIG_ADIS16080 is not set=
=0A# CONFIG_ADIS16130 is not set=0A# CONFIG_ADIS16136 is not set=0A# CONFIG=
_ADIS16260 is not set=0A# CONFIG_ADXRS290 is not set=0A# CONFIG_ADXRS450 is=
 not set=0A# CONFIG_BMG160 is not set=0A# CONFIG_FXAS21002C is not set=0ACO=
NFIG_HID_SENSOR_GYRO_3D=3Dm=0A# CONFIG_MPU3050_I2C is not set=0A# CONFIG_II=
O_ST_GYRO_3AXIS is not set=0A# CONFIG_ITG3200 is not set=0A# end of Digital=
 gyroscope sensors=0A=0A#=0A# Health Sensors=0A#=0A=0A#=0A# Heart Rate Moni=
tors=0A#=0A# CONFIG_AFE4403 is not set=0A# CONFIG_AFE4404 is not set=0ACONF=
IG_MAX30100=3Dm=0ACONFIG_MAX30102=3Dm=0A# end of Heart Rate Monitors=0A# en=
d of Health Sensors=0A=0A#=0A# Humidity sensors=0A#=0ACONFIG_AM2315=3Dm=0A#=
 CONFIG_DHT11 is not set=0A# CONFIG_ENS210 is not set=0ACONFIG_HDC100X=3Dm=
=0A# CONFIG_HDC2010 is not set=0A# CONFIG_HDC3020 is not set=0ACONFIG_HID_S=
ENSOR_HUMIDITY=3Dm=0A# CONFIG_HTS221 is not set=0ACONFIG_HTU21=3Dm=0A# CONF=
IG_SI7005 is not set=0A# CONFIG_SI7020 is not set=0A# end of Humidity senso=
rs=0A=0A#=0A# Inertial measurement units=0A#=0A# CONFIG_ADIS16400 is not se=
t=0A# CONFIG_ADIS16460 is not set=0A# CONFIG_ADIS16475 is not set=0A# CONFI=
G_ADIS16480 is not set=0A# CONFIG_ADIS16550 is not set=0ACONFIG_BMI160=3Dm=
=0ACONFIG_BMI160_I2C=3Dm=0ACONFIG_BMI160_SPI=3Dm=0A# CONFIG_BMI270_I2C is n=
ot set=0A# CONFIG_BMI270_SPI is not set=0ACONFIG_BMI323=3Dm=0ACONFIG_BMI323=
_I2C=3Dm=0ACONFIG_BMI323_SPI=3Dm=0A# CONFIG_BOSCH_BNO055_SERIAL is not set=
=0A# CONFIG_BOSCH_BNO055_I2C is not set=0A# CONFIG_FXOS8700_I2C is not set=
=0A# CONFIG_FXOS8700_SPI is not set=0ACONFIG_KMX61=3Dm=0A# CONFIG_INV_ICM42=
600_I2C is not set=0A# CONFIG_INV_ICM42600_SPI is not set=0A# CONFIG_INV_IC=
M45600_I2C is not set=0A# CONFIG_INV_ICM45600_SPI is not set=0A# CONFIG_INV=
_ICM45600_I3C is not set=0ACONFIG_INV_MPU6050_IIO=3Dm=0ACONFIG_INV_MPU6050_=
I2C=3Dm=0A# CONFIG_INV_MPU6050_SPI is not set=0A# CONFIG_SMI240 is not set=
=0A# CONFIG_SMI330_I2C is not set=0A# CONFIG_SMI330_SPI is not set=0A# CONF=
IG_IIO_ST_LSM6DSX is not set=0A# CONFIG_IIO_ST_LSM9DS0 is not set=0A# end o=
f Inertial measurement units=0A=0A#=0A# Light sensors=0A#=0ACONFIG_ACPI_ALS=
=3Dm=0A# CONFIG_ADJD_S311 is not set=0A# CONFIG_ADUX1020 is not set=0A# CON=
FIG_AL3000A is not set=0A# CONFIG_AL3010 is not set=0A# CONFIG_AL3320A is n=
ot set=0A# CONFIG_APDS9160 is not set=0A# CONFIG_APDS9300 is not set=0A# CO=
NFIG_APDS9306 is not set=0ACONFIG_APDS9960=3Dm=0A# CONFIG_AS73211 is not se=
t=0A# CONFIG_BH1745 is not set=0A# CONFIG_BH1750 is not set=0ACONFIG_BH1780=
=3Dm=0A# CONFIG_CM32181 is not set=0A# CONFIG_CM3232 is not set=0A# CONFIG_=
CM3323 is not set=0A# CONFIG_CM3605 is not set=0A# CONFIG_CM36651 is not se=
t=0ACONFIG_IIO_CROS_EC_LIGHT_PROX=3Dm=0A# CONFIG_GP2AP002 is not set=0A# CO=
NFIG_GP2AP020A00F is not set=0A# CONFIG_IQS621_ALS is not set=0A# CONFIG_SE=
NSORS_ISL29018 is not set=0A# CONFIG_SENSORS_ISL29028 is not set=0A# CONFIG=
_ISL29125 is not set=0A# CONFIG_ISL76682 is not set=0ACONFIG_HID_SENSOR_ALS=
=3Dm=0ACONFIG_HID_SENSOR_PROX=3Dm=0ACONFIG_JSA1212=3Dm=0A# CONFIG_ROHM_BU27=
034 is not set=0ACONFIG_RPR0521=3Dm=0A# CONFIG_SENSORS_LM3533 is not set=0A=
# CONFIG_LTR390 is not set=0A# CONFIG_LTR501 is not set=0A# CONFIG_LTRF216A=
 is not set=0A# CONFIG_LV0104CS is not set=0ACONFIG_MAX44000=3Dm=0ACONFIG_M=
AX44009=3Dm=0A# CONFIG_NOA1305 is not set=0A# CONFIG_OPT3001 is not set=0A#=
 CONFIG_OPT4001 is not set=0A# CONFIG_OPT4060 is not set=0A# CONFIG_PA12203=
001 is not set=0A# CONFIG_SI1133 is not set=0A# CONFIG_SI1145 is not set=0A=
# CONFIG_STK3310 is not set=0A# CONFIG_ST_UVIS25 is not set=0A# CONFIG_TCS3=
414 is not set=0A# CONFIG_TCS3472 is not set=0A# CONFIG_SENSORS_TSL2563 is =
not set=0A# CONFIG_TSL2583 is not set=0A# CONFIG_TSL2591 is not set=0A# CON=
FIG_TSL2772 is not set=0A# CONFIG_TSL4531 is not set=0ACONFIG_US5182D=3Dm=
=0A# CONFIG_VCNL4000 is not set=0A# CONFIG_VCNL4035 is not set=0A# CONFIG_V=
EML3235 is not set=0A# CONFIG_VEML6030 is not set=0A# CONFIG_VEML6040 is no=
t set=0A# CONFIG_VEML6046X00 is not set=0ACONFIG_VEML6070=3Dm=0A# CONFIG_VE=
ML6075 is not set=0ACONFIG_VL6180=3Dm=0A# CONFIG_ZOPT2201 is not set=0A# en=
d of Light sensors=0A=0A#=0A# Magnetometer sensors=0A#=0A# CONFIG_AK8974 is=
 not set=0A# CONFIG_AK8975 is not set=0A# CONFIG_AK09911 is not set=0A# CON=
FIG_ALS31300 is not set=0ACONFIG_BMC150_MAGN=3Dm=0ACONFIG_BMC150_MAGN_I2C=
=3Dm=0ACONFIG_BMC150_MAGN_SPI=3Dm=0A# CONFIG_MAG3110 is not set=0ACONFIG_HI=
D_SENSOR_MAGNETOMETER_3D=3Dm=0A# CONFIG_MMC35240 is not set=0A# CONFIG_IIO_=
ST_MAGN_3AXIS is not set=0A# CONFIG_INFINEON_TLV493D is not set=0A# CONFIG_=
SENSORS_HMC5843_I2C is not set=0A# CONFIG_SENSORS_HMC5843_SPI is not set=0A=
# CONFIG_SENSORS_RM3100_I2C is not set=0A# CONFIG_SENSORS_RM3100_SPI is not=
 set=0A# CONFIG_SI7210 is not set=0A# CONFIG_TI_TMAG5273 is not set=0A# CON=
FIG_YAMAHA_YAS530 is not set=0A# end of Magnetometer sensors=0A=0A#=0A# Mul=
tiplexers=0A#=0ACONFIG_IIO_MUX=3Dm=0A# end of Multiplexers=0A=0A#=0A# Incli=
nometer sensors=0A#=0ACONFIG_HID_SENSOR_INCLINOMETER_3D=3Dm=0ACONFIG_HID_SE=
NSOR_DEVICE_ROTATION=3Dm=0A# end of Inclinometer sensors=0A=0A#=0A# Trigger=
s - standalone=0A#=0ACONFIG_IIO_HRTIMER_TRIGGER=3Dm=0A# CONFIG_IIO_INTERRUP=
T_TRIGGER is not set=0A# CONFIG_IIO_TIGHTLOOP_TRIGGER is not set=0ACONFIG_I=
IO_SYSFS_TRIGGER=3Dm=0A# end of Triggers - standalone=0A=0A#=0A# Linear and=
 angular position sensors=0A#=0A# CONFIG_IQS624_POS is not set=0A# CONFIG_H=
ID_SENSOR_CUSTOM_INTEL_HINGE is not set=0A# end of Linear and angular posit=
ion sensors=0A=0A#=0A# Digital potentiometers=0A#=0A# CONFIG_AD5110 is not =
set=0ACONFIG_AD5272=3Dm=0ACONFIG_DS1803=3Dm=0A# CONFIG_MAX5432 is not set=
=0A# CONFIG_MAX5481 is not set=0ACONFIG_MAX5487=3Dm=0ACONFIG_MCP4018=3Dm=0A=
CONFIG_MCP4131=3Dm=0ACONFIG_MCP4531=3Dm=0ACONFIG_MCP41010=3Dm=0ACONFIG_TPL0=
102=3Dm=0ACONFIG_X9250=3Dm=0A# end of Digital potentiometers=0A=0A#=0A# Dig=
ital potentiostats=0A#=0A# CONFIG_LMP91000 is not set=0A# end of Digital po=
tentiostats=0A=0A#=0A# Pressure sensors=0A#=0A# CONFIG_ABP060MG is not set=
=0A# CONFIG_ROHM_BM1390 is not set=0ACONFIG_BMP280=3Dm=0ACONFIG_BMP280_I2C=
=3Dm=0ACONFIG_BMP280_SPI=3Dm=0ACONFIG_IIO_CROS_EC_BARO=3Dm=0A# CONFIG_DLHL6=
0D is not set=0A# CONFIG_DPS310 is not set=0ACONFIG_HID_SENSOR_PRESS=3Dm=0A=
CONFIG_HP03=3Dm=0A# CONFIG_HSC030PA is not set=0A# CONFIG_ICP10100 is not s=
et=0A# CONFIG_MPL115_I2C is not set=0A# CONFIG_MPL115_SPI is not set=0A# CO=
NFIG_MPL3115 is not set=0A# CONFIG_MPRLS0025PA is not set=0A# CONFIG_MS5611=
 is not set=0ACONFIG_MS5637=3Dm=0A# CONFIG_SDP500 is not set=0A# CONFIG_IIO=
_ST_PRESS is not set=0A# CONFIG_T5403 is not set=0ACONFIG_HP206C=3Dm=0A# CO=
NFIG_ZPA2326 is not set=0A# CONFIG_ADP810 is not set=0A# end of Pressure se=
nsors=0A=0A#=0A# Lightning sensors=0A#=0A# CONFIG_AS3935 is not set=0A# end=
 of Lightning sensors=0A=0A#=0A# Proximity and distance sensors=0A#=0A# CON=
FIG_CROS_EC_MKBP_PROXIMITY is not set=0A# CONFIG_D3323AA is not set=0A# CON=
FIG_HX9023S is not set=0A# CONFIG_IRSD200 is not set=0ACONFIG_ISL29501=3Dm=
=0ACONFIG_LIDAR_LITE_V2=3Dm=0A# CONFIG_MB1232 is not set=0A# CONFIG_PING is=
 not set=0ACONFIG_RFD77402=3Dm=0ACONFIG_SRF04=3Dm=0A# CONFIG_SX9310 is not =
set=0A# CONFIG_SX9324 is not set=0A# CONFIG_SX9360 is not set=0ACONFIG_SX95=
00=3Dm=0A# CONFIG_SRF08 is not set=0A# CONFIG_VCNL3020 is not set=0ACONFIG_=
VL53L0X_I2C=3Dm=0A# CONFIG_AW96103 is not set=0A# end of Proximity and dist=
ance sensors=0A=0A#=0A# Resolver to digital converters=0A#=0A# CONFIG_AD2S9=
0 is not set=0A# CONFIG_AD2S1200 is not set=0A# CONFIG_AD2S1210 is not set=
=0A# end of Resolver to digital converters=0A=0A#=0A# Temperature sensors=
=0A#=0A# CONFIG_IQS620AT_TEMP is not set=0A# CONFIG_LTC2983 is not set=0A# =
CONFIG_MAXIM_THERMOCOUPLE is not set=0ACONFIG_HID_SENSOR_TEMP=3Dm=0ACONFIG_=
MLX90614=3Dm=0ACONFIG_MLX90632=3Dm=0ACONFIG_MLX90635=3Dm=0A# CONFIG_TMP006 =
is not set=0A# CONFIG_TMP007 is not set=0A# CONFIG_TMP117 is not set=0ACONF=
IG_TSYS01=3Dm=0ACONFIG_TSYS02D=3Dm=0ACONFIG_MAX30208=3Dm=0ACONFIG_MAX31856=
=3Dm=0ACONFIG_MAX31865=3Dm=0ACONFIG_MCP9600=3Dm=0A# end of Temperature sens=
ors=0A=0ACONFIG_NTB=3Dm=0ACONFIG_NTB_MSI=3Dy=0ACONFIG_NTB_AMD=3Dm=0ACONFIG_=
NTB_IDT=3Dm=0ACONFIG_NTB_INTEL=3Dm=0ACONFIG_NTB_EPF=3Dm=0ACONFIG_NTB_SWITCH=
TEC=3Dm=0A# CONFIG_NTB_PINGPONG is not set=0A# CONFIG_NTB_TOOL is not set=
=0ACONFIG_NTB_PERF=3Dm=0A# CONFIG_NTB_MSI_TEST is not set=0ACONFIG_NTB_TRAN=
SPORT=3Dm=0ACONFIG_PWM=3Dy=0A# CONFIG_PWM_DEBUG is not set=0A# CONFIG_PWM_P=
ROVIDE_GPIO is not set=0ACONFIG_PWM_CLK=3Dm=0ACONFIG_PWM_CRC=3Dy=0ACONFIG_P=
WM_CROS_EC=3Dm=0ACONFIG_PWM_DWC_CORE=3Dm=0ACONFIG_PWM_DWC=3Dm=0ACONFIG_PWM_=
GPIO=3Dm=0ACONFIG_PWM_IQS620A=3Dm=0ACONFIG_PWM_LP3943=3Dm=0ACONFIG_PWM_LPSS=
=3Dm=0ACONFIG_PWM_LPSS_PCI=3Dm=0ACONFIG_PWM_LPSS_PLATFORM=3Dm=0ACONFIG_PWM_=
PCA9685=3Dm=0A=0A#=0A# IRQ chip support=0A#=0A# CONFIG_ARM_GIC_V3_ITS is no=
t set=0ACONFIG_IRQ_MSI_LIB=3Dy=0ACONFIG_MADERA_IRQ=3Dm=0A# CONFIG_SUNPLUS_S=
P7021_INTC is not set=0A# end of IRQ chip support=0A=0ACONFIG_IPACK_BUS=3Dm=
=0ACONFIG_BOARD_TPCI200=3Dm=0ACONFIG_SERIAL_IPOCTAL=3Dm=0ACONFIG_RESET_CONT=
ROLLER=3Dy=0A# CONFIG_RESET_ATH79 is not set=0A# CONFIG_RESET_AXS10X is not=
 set=0ACONFIG_RESET_GPIO=3Dm=0A# CONFIG_RESET_LANTIQ is not set=0A# CONFIG_=
RESET_LPC18XX is not set=0A# CONFIG_RESET_NPCM is not set=0A# CONFIG_RESET_=
SIMPLE is not set=0A# CONFIG_RESET_SOCFPGA is not set=0A# CONFIG_RESET_SUNP=
LUS is not set=0A# CONFIG_RESET_SUNXI is not set=0A# CONFIG_RESET_TI_SYSCON=
 is not set=0A# CONFIG_RESET_TI_TPS380X is not set=0A# CONFIG_RESET_ZYNQ is=
 not set=0A# CONFIG_RESET_ZYNQMP is not set=0A# CONFIG_RESET_TEGRA_BPMP is =
not set=0A=0A#=0A# PHY Subsystem=0A#=0ACONFIG_GENERIC_PHY=3Dy=0ACONFIG_GENE=
RIC_PHY_MIPI_DPHY=3Dy=0ACONFIG_USB_LGM_PHY=3Dm=0ACONFIG_PHY_CAN_TRANSCEIVER=
=3Dm=0A=0A#=0A# PHY drivers for Broadcom platforms=0A#=0ACONFIG_BCM_KONA_US=
B2_PHY=3Dm=0A# end of PHY drivers for Broadcom platforms=0A=0A# CONFIG_PHY_=
PXA_28NM_HSIC is not set=0A# CONFIG_PHY_PXA_28NM_USB2 is not set=0A# CONFIG=
_PHY_CPCAP_USB is not set=0ACONFIG_PHY_QCOM_USB_HS=3Dm=0A# CONFIG_PHY_QCOM_=
USB_HSIC is not set=0A# CONFIG_PHY_TUSB1210 is not set=0ACONFIG_PHY_INTEL_L=
GM_EMMC=3Dm=0A# end of PHY Subsystem=0A=0ACONFIG_POWERCAP=3Dy=0ACONFIG_INTE=
L_RAPL_CORE=3Dm=0ACONFIG_INTEL_RAPL=3Dm=0ACONFIG_INTEL_RAPL_TPMI=3Dm=0ACONF=
IG_IDLE_INJECT=3Dy=0A# CONFIG_MCB is not set=0A=0A#=0A# Performance monitor=
 support=0A#=0ACONFIG_DWC_PCIE_PMU=3Dm=0ACONFIG_CXL_PMU=3Dm=0A# end of Perf=
ormance monitor support=0A=0ACONFIG_RAS=3Dy=0ACONFIG_RAS_CEC=3Dy=0A# CONFIG=
_RAS_CEC_DEBUG is not set=0ACONFIG_AMD_ATL=3Dm=0ACONFIG_AMD_ATL_PRM=3Dy=0AC=
ONFIG_RAS_FMPM=3Dm=0ACONFIG_USB4=3Dm=0A# CONFIG_USB4_DEBUGFS_WRITE is not s=
et=0A# CONFIG_USB4_DMA_TEST is not set=0A=0A#=0A# Android=0A#=0A# CONFIG_AN=
DROID_BINDER_IPC is not set=0A# end of Android=0A=0ACONFIG_LIBNVDIMM=3Dm=0A=
CONFIG_BLK_DEV_PMEM=3Dm=0ACONFIG_ND_CLAIM=3Dy=0ACONFIG_ND_BTT=3Dm=0ACONFIG_=
BTT=3Dy=0ACONFIG_ND_PFN=3Dm=0ACONFIG_NVDIMM_PFN=3Dy=0ACONFIG_NVDIMM_DAX=3Dy=
=0ACONFIG_RAMDAX=3Dm=0ACONFIG_NVDIMM_KEYS=3Dy=0A# CONFIG_NVDIMM_SECURITY_TE=
ST is not set=0ACONFIG_DAX=3Dy=0ACONFIG_DEV_DAX=3Dm=0ACONFIG_DEV_DAX_PMEM=
=3Dm=0ACONFIG_DEV_DAX_HMEM=3Dm=0ACONFIG_DEV_DAX_CXL=3Dm=0ACONFIG_DEV_DAX_HM=
EM_DEVICES=3Dy=0ACONFIG_DEV_DAX_KMEM=3Dm=0ACONFIG_NVMEM=3Dy=0ACONFIG_NVMEM_=
SYSFS=3Dy=0A# CONFIG_NVMEM_LAYOUTS is not set=0A# CONFIG_NVMEM_RMEM is not =
set=0ACONFIG_NVMEM_SPMI_SDAM=3Dm=0A# CONFIG_NVMEM_STM32_BSEC_OPTEE_TA is no=
t set=0A=0A#=0A# HW tracing support=0A#=0ACONFIG_STM=3Dm=0ACONFIG_STM_PROTO=
_BASIC=3Dm=0ACONFIG_STM_PROTO_SYS_T=3Dm=0ACONFIG_STM_DUMMY=3Dm=0ACONFIG_STM=
_SOURCE_CONSOLE=3Dm=0ACONFIG_STM_SOURCE_HEARTBEAT=3Dm=0ACONFIG_STM_SOURCE_F=
TRACE=3Dm=0ACONFIG_INTEL_TH=3Dm=0ACONFIG_INTEL_TH_PCI=3Dm=0ACONFIG_INTEL_TH=
_ACPI=3Dm=0ACONFIG_INTEL_TH_GTH=3Dm=0ACONFIG_INTEL_TH_STH=3Dm=0ACONFIG_INTE=
L_TH_MSU=3Dm=0ACONFIG_INTEL_TH_PTI=3Dm=0A# CONFIG_INTEL_TH_DEBUG is not set=
=0A# end of HW tracing support=0A=0ACONFIG_FPGA=3Dm=0ACONFIG_ALTERA_PR_IP_C=
ORE=3Dm=0ACONFIG_FPGA_MGR_ALTERA_PS_SPI=3Dm=0ACONFIG_FPGA_MGR_ALTERA_CVP=3D=
m=0ACONFIG_FPGA_MGR_XILINX_CORE=3Dm=0ACONFIG_FPGA_MGR_XILINX_SELECTMAP=3Dm=
=0ACONFIG_FPGA_MGR_XILINX_SPI=3Dm=0ACONFIG_FPGA_MGR_MACHXO2_SPI=3Dm=0ACONFI=
G_FPGA_BRIDGE=3Dm=0ACONFIG_ALTERA_FREEZE_BRIDGE=3Dm=0ACONFIG_XILINX_PR_DECO=
UPLER=3Dm=0ACONFIG_FPGA_REGION=3Dm=0ACONFIG_FPGA_DFL=3Dm=0ACONFIG_FPGA_DFL_=
FME=3Dm=0ACONFIG_FPGA_DFL_FME_MGR=3Dm=0ACONFIG_FPGA_DFL_FME_BRIDGE=3Dm=0ACO=
NFIG_FPGA_DFL_FME_REGION=3Dm=0ACONFIG_FPGA_DFL_AFU=3Dm=0ACONFIG_FPGA_DFL_NI=
OS_INTEL_PAC_N3000=3Dm=0ACONFIG_FPGA_DFL_PCI=3Dm=0ACONFIG_FPGA_MGR_MICROCHI=
P_SPI=3Dm=0ACONFIG_FPGA_MGR_LATTICE_SYSCONFIG=3Dm=0ACONFIG_FPGA_MGR_LATTICE=
_SYSCONFIG_SPI=3Dm=0ACONFIG_TEE=3Dm=0ACONFIG_TEE_DMABUF_HEAPS=3Dy=0ACONFIG_=
OPTEE_STATIC_PROTMEM_POOL=3Dy=0ACONFIG_AMDTEE=3Dm=0ACONFIG_MULTIPLEXER=3Dm=
=0A=0A#=0A# Multiplexer drivers=0A#=0A# CONFIG_MUX_ADG792A is not set=0A# C=
ONFIG_MUX_ADGS1408 is not set=0A# CONFIG_MUX_GPIO is not set=0A# end of Mul=
tiplexer drivers=0A=0ACONFIG_PM_OPP=3Dy=0A# CONFIG_SIOX is not set=0A# CONF=
IG_SLIMBUS is not set=0A# CONFIG_INTERCONNECT is not set=0ACONFIG_I8254=3Dm=
=0ACONFIG_COUNTER=3Dm=0ACONFIG_104_QUAD_8=3Dm=0ACONFIG_INTEL_QEP=3Dm=0ACONF=
IG_INTERRUPT_CNT=3Dm=0A# CONFIG_MOST is not set=0A# CONFIG_PECI is not set=
=0ACONFIG_HTE=3Dy=0A# end of Device Drivers=0A=0A#=0A# File systems=0A#=0AC=
ONFIG_DCACHE_WORD_ACCESS=3Dy=0A# CONFIG_VALIDATE_FS_PARSER is not set=0ACON=
FIG_FS_IOMAP=3Dy=0ACONFIG_FS_STACK=3Dy=0ACONFIG_BUFFER_HEAD=3Dy=0ACONFIG_LE=
GACY_DIRECT_IO=3Dy=0A# CONFIG_EXT2_FS is not set=0ACONFIG_EXT4_FS=3Dm=0ACON=
FIG_EXT4_USE_FOR_EXT2=3Dy=0ACONFIG_EXT4_FS_POSIX_ACL=3Dy=0ACONFIG_EXT4_FS_S=
ECURITY=3Dy=0A# CONFIG_EXT4_DEBUG is not set=0ACONFIG_JBD2=3Dm=0A# CONFIG_J=
BD2_DEBUG is not set=0ACONFIG_FS_MBCACHE=3Dm=0ACONFIG_JFS_FS=3Dm=0ACONFIG_J=
FS_POSIX_ACL=3Dy=0ACONFIG_JFS_SECURITY=3Dy=0A# CONFIG_JFS_DEBUG is not set=
=0ACONFIG_JFS_STATISTICS=3Dy=0ACONFIG_XFS_FS=3Dm=0ACONFIG_XFS_SUPPORT_V4=3D=
y=0ACONFIG_XFS_SUPPORT_ASCII_CI=3Dy=0ACONFIG_XFS_QUOTA=3Dy=0ACONFIG_XFS_POS=
IX_ACL=3Dy=0ACONFIG_XFS_RT=3Dy=0A# CONFIG_XFS_ONLINE_SCRUB is not set=0A# C=
ONFIG_XFS_WARN is not set=0A# CONFIG_XFS_DEBUG is not set=0ACONFIG_GFS2_FS=
=3Dm=0ACONFIG_GFS2_FS_LOCKING_DLM=3Dy=0ACONFIG_OCFS2_FS=3Dm=0ACONFIG_OCFS2_=
FS_O2CB=3Dm=0ACONFIG_OCFS2_FS_USERSPACE_CLUSTER=3Dm=0ACONFIG_OCFS2_FS_STATS=
=3Dy=0ACONFIG_OCFS2_DEBUG_MASKLOG=3Dy=0A# CONFIG_OCFS2_DEBUG_FS is not set=
=0ACONFIG_BTRFS_FS=3Dm=0ACONFIG_BTRFS_FS_POSIX_ACL=3Dy=0A# CONFIG_BTRFS_FS_=
RUN_SANITY_TESTS is not set=0A# CONFIG_BTRFS_DEBUG is not set=0ACONFIG_BTRF=
S_ASSERT=3Dy=0A# CONFIG_BTRFS_EXPERIMENTAL is not set=0ACONFIG_NILFS2_FS=3D=
m=0ACONFIG_F2FS_FS=3Dm=0ACONFIG_F2FS_STAT_FS=3Dy=0ACONFIG_F2FS_FS_XATTR=3Dy=
=0ACONFIG_F2FS_FS_POSIX_ACL=3Dy=0ACONFIG_F2FS_FS_SECURITY=3Dy=0A# CONFIG_F2=
FS_CHECK_FS is not set=0ACONFIG_F2FS_FAULT_INJECTION=3Dy=0ACONFIG_F2FS_FS_C=
OMPRESSION=3Dy=0ACONFIG_F2FS_FS_LZO=3Dy=0A# CONFIG_F2FS_FS_LZORLE is not se=
t=0A# CONFIG_F2FS_FS_LZ4 is not set=0ACONFIG_F2FS_FS_ZSTD=3Dy=0ACONFIG_F2FS=
_IOSTAT=3Dy=0A# CONFIG_F2FS_UNFAIR_RWSEM is not set=0ACONFIG_ZONEFS_FS=3Dm=
=0ACONFIG_FS_DAX=3Dy=0ACONFIG_FS_DAX_PMD=3Dy=0ACONFIG_FS_POSIX_ACL=3Dy=0ACO=
NFIG_EXPORTFS=3Dy=0ACONFIG_EXPORTFS_BLOCK_OPS=3Dy=0ACONFIG_FILE_LOCKING=3Dy=
=0ACONFIG_FS_ENCRYPTION=3Dy=0ACONFIG_FS_ENCRYPTION_ALGS=3Dm=0ACONFIG_FS_ENC=
RYPTION_INLINE_CRYPT=3Dy=0ACONFIG_FS_VERITY=3Dy=0A# CONFIG_FS_VERITY_BUILTI=
N_SIGNATURES is not set=0ACONFIG_FSNOTIFY=3Dy=0ACONFIG_DNOTIFY=3Dy=0ACONFIG=
_INOTIFY_USER=3Dy=0ACONFIG_FANOTIFY=3Dy=0ACONFIG_FANOTIFY_ACCESS_PERMISSION=
S=3Dy=0ACONFIG_QUOTA=3Dy=0ACONFIG_QUOTA_NETLINK_INTERFACE=3Dy=0A# CONFIG_QU=
OTA_DEBUG is not set=0ACONFIG_QUOTA_TREE=3Dm=0ACONFIG_QFMT_V1=3Dm=0ACONFIG_=
QFMT_V2=3Dm=0ACONFIG_QUOTACTL=3Dy=0ACONFIG_AUTOFS_FS=3Dy=0ACONFIG_FUSE_FS=
=3Dm=0ACONFIG_CUSE=3Dm=0ACONFIG_VIRTIO_FS=3Dm=0ACONFIG_FUSE_DAX=3Dy=0ACONFI=
G_FUSE_PASSTHROUGH=3Dy=0ACONFIG_FUSE_IO_URING=3Dy=0ACONFIG_OVERLAY_FS=3Dm=
=0A# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set=0A# CONFIG_OVERLAY_FS_REDIRE=
CT_ALWAYS_FOLLOW is not set=0A# CONFIG_OVERLAY_FS_INDEX is not set=0A# CONF=
IG_OVERLAY_FS_XINO_AUTO is not set=0A# CONFIG_OVERLAY_FS_METACOPY is not se=
t=0A# CONFIG_OVERLAY_FS_DEBUG is not set=0A=0A#=0A# Caches=0A#=0ACONFIG_NET=
FS_SUPPORT=3Dm=0ACONFIG_NETFS_STATS=3Dy=0A# CONFIG_NETFS_DEBUG is not set=
=0ACONFIG_FSCACHE=3Dy=0ACONFIG_FSCACHE_STATS=3Dy=0ACONFIG_CACHEFILES=3Dm=0A=
# CONFIG_CACHEFILES_DEBUG is not set=0A# CONFIG_CACHEFILES_ERROR_INJECTION =
is not set=0A# CONFIG_CACHEFILES_ONDEMAND is not set=0A# end of Caches=0A=
=0A#=0A# CD-ROM/DVD Filesystems=0A#=0ACONFIG_ISO9660_FS=3Dm=0ACONFIG_JOLIET=
=3Dy=0ACONFIG_ZISOFS=3Dy=0ACONFIG_UDF_FS=3Dm=0A# end of CD-ROM/DVD Filesyst=
ems=0A=0A#=0A# DOS/FAT/EXFAT/NT Filesystems=0A#=0ACONFIG_FAT_FS=3Dm=0ACONFI=
G_MSDOS_FS=3Dm=0ACONFIG_VFAT_FS=3Dm=0ACONFIG_FAT_DEFAULT_CODEPAGE=3D437=0AC=
ONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"=0A# CONFIG_FAT_DEFAULT_UTF8 is no=
t set=0ACONFIG_EXFAT_FS=3Dm=0ACONFIG_EXFAT_DEFAULT_IOCHARSET=3D"utf8"=0ACON=
FIG_NTFS3_FS=3Dm=0A# CONFIG_NTFS3_64BIT_CLUSTER is not set=0ACONFIG_NTFS3_L=
ZX_XPRESS=3Dy=0ACONFIG_NTFS3_FS_POSIX_ACL=3Dy=0ACONFIG_NTFS_FS=3Dm=0A# end =
of DOS/FAT/EXFAT/NT Filesystems=0A=0A#=0A# Pseudo filesystems=0A#=0ACONFIG_=
PROC_FS=3Dy=0ACONFIG_PROC_KCORE=3Dy=0ACONFIG_PROC_VMCORE=3Dy=0ACONFIG_PROC_=
VMCORE_DEVICE_DUMP=3Dy=0ACONFIG_PROC_SYSCTL=3Dy=0ACONFIG_PROC_PAGE_MONITOR=
=3Dy=0ACONFIG_PROC_CHILDREN=3Dy=0ACONFIG_PROC_PID_ARCH_STATUS=3Dy=0ACONFIG_=
PROC_CPU_RESCTRL=3Dy=0ACONFIG_KERNFS=3Dy=0ACONFIG_SYSFS=3Dy=0ACONFIG_TMPFS=
=3Dy=0ACONFIG_TMPFS_POSIX_ACL=3Dy=0ACONFIG_TMPFS_XATTR=3Dy=0ACONFIG_TMPFS_I=
NODE64=3Dy=0ACONFIG_TMPFS_QUOTA=3Dy=0ACONFIG_ARCH_SUPPORTS_HUGETLBFS=3Dy=0A=
CONFIG_HUGETLBFS=3Dy=0A# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is=
 not set=0ACONFIG_HUGETLB_PAGE=3Dy=0ACONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=
=3Dy=0ACONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING=3Dy=0ACONFIG_ARCH_HAS_GIGANTIC=
_PAGE=3Dy=0ACONFIG_CONFIGFS_FS=3Dy=0ACONFIG_EFIVAR_FS=3Dm=0A# end of Pseudo=
 filesystems=0A=0ACONFIG_MISC_FILESYSTEMS=3Dy=0ACONFIG_ORANGEFS_FS=3Dm=0ACO=
NFIG_ADFS_FS=3Dm=0ACONFIG_ADFS_FS_RW=3Dy=0ACONFIG_AFFS_FS=3Dm=0ACONFIG_ECRY=
PT_FS=3Dm=0ACONFIG_ECRYPT_FS_MESSAGING=3Dy=0A# CONFIG_HFS_FS is not set=0AC=
ONFIG_HFSPLUS_FS=3Dm=0ACONFIG_BEFS_FS=3Dm=0A# CONFIG_BEFS_DEBUG is not set=
=0ACONFIG_BFS_FS=3Dm=0ACONFIG_EFS_FS=3Dm=0ACONFIG_JFFS2_FS=3Dm=0ACONFIG_JFF=
S2_FS_DEBUG=3D0=0ACONFIG_JFFS2_FS_WRITEBUFFER=3Dy=0A# CONFIG_JFFS2_FS_WBUF_=
VERIFY is not set=0ACONFIG_JFFS2_SUMMARY=3Dy=0ACONFIG_JFFS2_FS_XATTR=3Dy=0A=
CONFIG_JFFS2_FS_POSIX_ACL=3Dy=0ACONFIG_JFFS2_FS_SECURITY=3Dy=0ACONFIG_JFFS2=
_COMPRESSION_OPTIONS=3Dy=0ACONFIG_JFFS2_ZLIB=3Dy=0A# CONFIG_JFFS2_LZO is no=
t set=0ACONFIG_JFFS2_RTIME=3Dy=0A# CONFIG_JFFS2_RUBIN is not set=0A# CONFIG=
_JFFS2_CMODE_NONE is not set=0ACONFIG_JFFS2_CMODE_PRIORITY=3Dy=0A# CONFIG_J=
FFS2_CMODE_SIZE is not set=0A# CONFIG_JFFS2_CMODE_FAVOURLZO is not set=0ACO=
NFIG_UBIFS_FS=3Dm=0ACONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy=0ACONFIG_UBIFS_FS_LZ=
O=3Dy=0ACONFIG_UBIFS_FS_ZLIB=3Dy=0ACONFIG_UBIFS_FS_ZSTD=3Dy=0ACONFIG_UBIFS_=
ATIME_SUPPORT=3Dy=0ACONFIG_UBIFS_FS_XATTR=3Dy=0ACONFIG_UBIFS_FS_SECURITY=3D=
y=0ACONFIG_UBIFS_FS_AUTHENTICATION=3Dy=0ACONFIG_CRAMFS=3Dm=0ACONFIG_CRAMFS_=
BLOCKDEV=3Dy=0ACONFIG_CRAMFS_MTD=3Dy=0ACONFIG_SQUASHFS=3Dm=0A# CONFIG_SQUAS=
HFS_FILE_CACHE is not set=0ACONFIG_SQUASHFS_FILE_DIRECT=3Dy=0ACONFIG_SQUASH=
FS_DECOMP_SINGLE=3Dy=0ACONFIG_SQUASHFS_DECOMP_MULTI=3Dy=0ACONFIG_SQUASHFS_D=
ECOMP_MULTI_PERCPU=3Dy=0ACONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT=3Dy=0ACONFI=
G_SQUASHFS_MOUNT_DECOMP_THREADS=3Dy=0ACONFIG_SQUASHFS_XATTR=3Dy=0A# CONFIG_=
SQUASHFS_COMP_CACHE_FULL is not set=0ACONFIG_SQUASHFS_ZLIB=3Dy=0ACONFIG_SQU=
ASHFS_LZ4=3Dy=0ACONFIG_SQUASHFS_LZO=3Dy=0ACONFIG_SQUASHFS_XZ=3Dy=0ACONFIG_S=
QUASHFS_ZSTD=3Dy=0A# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set=0A# CONFIG_S=
QUASHFS_EMBEDDED is not set=0ACONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3=0ACON=
FIG_VXFS_FS=3Dm=0ACONFIG_MINIX_FS=3Dm=0ACONFIG_OMFS_FS=3Dm=0ACONFIG_HPFS_FS=
=3Dm=0ACONFIG_QNX4FS_FS=3Dm=0ACONFIG_QNX6FS_FS=3Dm=0A# CONFIG_QNX6FS_DEBUG =
is not set=0ACONFIG_RESCTRL_FS=3Dy=0ACONFIG_RESCTRL_FS_PSEUDO_LOCK=3Dy=0ACO=
NFIG_ROMFS_FS=3Dm=0A# CONFIG_ROMFS_BACKED_BY_BLOCK is not set=0A# CONFIG_RO=
MFS_BACKED_BY_MTD is not set=0ACONFIG_ROMFS_BACKED_BY_BOTH=3Dy=0ACONFIG_ROM=
FS_ON_BLOCK=3Dy=0ACONFIG_ROMFS_ON_MTD=3Dy=0ACONFIG_PSTORE=3Dy=0ACONFIG_PSTO=
RE_DEFAULT_KMSG_BYTES=3D10240=0ACONFIG_PSTORE_COMPRESS=3Dy=0ACONFIG_PSTORE_=
CONSOLE=3Dy=0ACONFIG_PSTORE_PMSG=3Dy=0ACONFIG_PSTORE_FTRACE=3Dy=0ACONFIG_PS=
TORE_RAM=3Dm=0ACONFIG_PSTORE_ZONE=3Dm=0ACONFIG_PSTORE_BLK=3Dm=0ACONFIG_PSTO=
RE_BLK_BLKDEV=3D""=0ACONFIG_PSTORE_BLK_KMSG_SIZE=3D64=0ACONFIG_PSTORE_BLK_M=
AX_REASON=3D2=0ACONFIG_PSTORE_BLK_PMSG_SIZE=3D64=0ACONFIG_PSTORE_BLK_CONSOL=
E_SIZE=3D64=0ACONFIG_PSTORE_BLK_FTRACE_SIZE=3D64=0ACONFIG_UFS_FS=3Dm=0ACONF=
IG_UFS_FS_WRITE=3Dy=0A# CONFIG_UFS_DEBUG is not set=0ACONFIG_EROFS_FS=3Dm=
=0A# CONFIG_EROFS_FS_DEBUG is not set=0ACONFIG_EROFS_FS_XATTR=3Dy=0ACONFIG_=
EROFS_FS_POSIX_ACL=3Dy=0ACONFIG_EROFS_FS_SECURITY=3Dy=0ACONFIG_EROFS_FS_BAC=
KED_BY_FILE=3Dy=0ACONFIG_EROFS_FS_ZIP=3Dy=0ACONFIG_EROFS_FS_ZIP_LZMA=3Dy=0A=
CONFIG_EROFS_FS_ZIP_DEFLATE=3Dy=0ACONFIG_EROFS_FS_ZIP_ZSTD=3Dy=0ACONFIG_ERO=
FS_FS_ZIP_ACCEL=3Dy=0A# CONFIG_EROFS_FS_ONDEMAND is not set=0A# CONFIG_EROF=
S_FS_PCPU_KTHREAD is not set=0ACONFIG_VBOXSF_FS=3Dm=0ACONFIG_NETWORK_FILESY=
STEMS=3Dy=0ACONFIG_NFS_FS=3Dm=0ACONFIG_NFS_V2=3Dm=0ACONFIG_NFS_V3=3Dm=0ACON=
FIG_NFS_V3_ACL=3Dy=0ACONFIG_NFS_V4=3Dm=0ACONFIG_NFS_SWAP=3Dy=0ACONFIG_NFS_V=
4_1=3Dy=0ACONFIG_NFS_V4_2=3Dy=0ACONFIG_PNFS_FILE_LAYOUT=3Dm=0ACONFIG_PNFS_B=
LOCK=3Dm=0ACONFIG_PNFS_FLEXFILE_LAYOUT=3Dm=0ACONFIG_NFS_V4_1_IMPLEMENTATION=
_ID_DOMAIN=3D"kernel.org"=0A# CONFIG_NFS_V4_1_MIGRATION is not set=0ACONFIG=
_NFS_V4_SECURITY_LABEL=3Dy=0ACONFIG_NFS_FSCACHE=3Dy=0A# CONFIG_NFS_USE_LEGA=
CY_DNS is not set=0ACONFIG_NFS_USE_KERNEL_DNS=3Dy=0ACONFIG_NFS_DEBUG=3Dy=0A=
# CONFIG_NFS_DISABLE_UDP_SUPPORT is not set=0ACONFIG_NFS_V4_2_READ_PLUS=3Dy=
=0ACONFIG_NFSD=3Dm=0A# CONFIG_NFSD_V2 is not set=0ACONFIG_NFSD_V3_ACL=3Dy=
=0ACONFIG_NFSD_V4=3Dy=0ACONFIG_NFSD_PNFS=3Dy=0ACONFIG_NFSD_BLOCKLAYOUT=3Dy=
=0ACONFIG_NFSD_SCSILAYOUT=3Dy=0ACONFIG_NFSD_FLEXFILELAYOUT=3Dy=0ACONFIG_NFS=
D_V4_2_INTER_SSC=3Dy=0ACONFIG_NFSD_V4_SECURITY_LABEL=3Dy=0A# CONFIG_NFSD_LE=
GACY_CLIENT_TRACKING is not set=0A# CONFIG_NFSD_V4_DELEG_TIMESTAMPS is not =
set=0ACONFIG_GRACE_PERIOD=3Dm=0ACONFIG_LOCKD=3Dm=0ACONFIG_LOCKD_V4=3Dy=0ACO=
NFIG_NFS_ACL_SUPPORT=3Dm=0ACONFIG_NFS_COMMON=3Dy=0A# CONFIG_NFS_LOCALIO is =
not set=0ACONFIG_NFS_V4_2_SSC_HELPER=3Dy=0ACONFIG_SUNRPC=3Dm=0ACONFIG_SUNRP=
C_GSS=3Dm=0ACONFIG_SUNRPC_BACKCHANNEL=3Dy=0ACONFIG_SUNRPC_SWAP=3Dy=0ACONFIG=
_RPCSEC_GSS_KRB5=3Dm=0ACONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1=3Dy=0ACONFI=
G_RPCSEC_GSS_KRB5_ENCTYPES_CAMELLIA=3Dy=0ACONFIG_RPCSEC_GSS_KRB5_ENCTYPES_A=
ES_SHA2=3Dy=0ACONFIG_SUNRPC_DEBUG=3Dy=0A# CONFIG_SUNRPC_DEBUG_TRACE is not =
set=0ACONFIG_SUNRPC_XPRT_RDMA=3Dm=0ACONFIG_CEPH_FS=3Dm=0ACONFIG_CEPH_FSCACH=
E=3Dy=0ACONFIG_CEPH_FS_POSIX_ACL=3Dy=0ACONFIG_CEPH_FS_SECURITY_LABEL=3Dy=0A=
CONFIG_CIFS=3Dm=0ACONFIG_CIFS_STATS2=3Dy=0ACONFIG_CIFS_ALLOW_INSECURE_LEGAC=
Y=3Dy=0ACONFIG_CIFS_UPCALL=3Dy=0ACONFIG_CIFS_XATTR=3Dy=0ACONFIG_CIFS_POSIX=
=3Dy=0ACONFIG_CIFS_DEBUG=3Dy=0A# CONFIG_CIFS_DEBUG2 is not set=0A# CONFIG_C=
IFS_DEBUG_DUMP_KEYS is not set=0ACONFIG_CIFS_DFS_UPCALL=3Dy=0ACONFIG_CIFS_S=
WN_UPCALL=3Dy=0A# CONFIG_CIFS_SMB_DIRECT is not set=0ACONFIG_CIFS_FSCACHE=
=3Dy=0A# CONFIG_CIFS_COMPRESSION is not set=0ACONFIG_SMB_SERVER=3Dm=0A# CON=
FIG_SMB_SERVER_SMBDIRECT is not set=0ACONFIG_SMB_SERVER_CHECK_CAP_NET_ADMIN=
=3Dy=0ACONFIG_SMB_SERVER_KERBEROS5=3Dy=0ACONFIG_SMBFS=3Dm=0ACONFIG_CODA_FS=
=3Dm=0ACONFIG_AFS_FS=3Dm=0A# CONFIG_AFS_DEBUG is not set=0ACONFIG_AFS_FSCAC=
HE=3Dy=0A# CONFIG_AFS_DEBUG_CURSOR is not set=0ACONFIG_9P_FS=3Dm=0ACONFIG_9=
P_FSCACHE=3Dy=0ACONFIG_9P_FS_POSIX_ACL=3Dy=0ACONFIG_9P_FS_SECURITY=3Dy=0ACO=
NFIG_NLS=3Dy=0ACONFIG_NLS_DEFAULT=3D"utf8"=0ACONFIG_NLS_CODEPAGE_437=3Dm=0A=
CONFIG_NLS_CODEPAGE_737=3Dm=0ACONFIG_NLS_CODEPAGE_775=3Dm=0ACONFIG_NLS_CODE=
PAGE_850=3Dm=0ACONFIG_NLS_CODEPAGE_852=3Dm=0ACONFIG_NLS_CODEPAGE_855=3Dm=0A=
CONFIG_NLS_CODEPAGE_857=3Dm=0ACONFIG_NLS_CODEPAGE_860=3Dm=0ACONFIG_NLS_CODE=
PAGE_861=3Dm=0ACONFIG_NLS_CODEPAGE_862=3Dm=0ACONFIG_NLS_CODEPAGE_863=3Dm=0A=
CONFIG_NLS_CODEPAGE_864=3Dm=0ACONFIG_NLS_CODEPAGE_865=3Dm=0ACONFIG_NLS_CODE=
PAGE_866=3Dm=0ACONFIG_NLS_CODEPAGE_869=3Dm=0ACONFIG_NLS_CODEPAGE_936=3Dm=0A=
CONFIG_NLS_CODEPAGE_950=3Dm=0ACONFIG_NLS_CODEPAGE_932=3Dm=0ACONFIG_NLS_CODE=
PAGE_949=3Dm=0ACONFIG_NLS_CODEPAGE_874=3Dm=0ACONFIG_NLS_ISO8859_8=3Dm=0ACON=
FIG_NLS_CODEPAGE_1250=3Dm=0ACONFIG_NLS_CODEPAGE_1251=3Dm=0ACONFIG_NLS_ASCII=
=3Dm=0ACONFIG_NLS_ISO8859_1=3Dm=0ACONFIG_NLS_ISO8859_2=3Dm=0ACONFIG_NLS_ISO=
8859_3=3Dm=0ACONFIG_NLS_ISO8859_4=3Dm=0ACONFIG_NLS_ISO8859_5=3Dm=0ACONFIG_N=
LS_ISO8859_6=3Dm=0ACONFIG_NLS_ISO8859_7=3Dm=0ACONFIG_NLS_ISO8859_9=3Dm=0ACO=
NFIG_NLS_ISO8859_13=3Dm=0ACONFIG_NLS_ISO8859_14=3Dm=0ACONFIG_NLS_ISO8859_15=
=3Dm=0ACONFIG_NLS_KOI8_R=3Dm=0ACONFIG_NLS_KOI8_U=3Dm=0ACONFIG_NLS_MAC_ROMAN=
=3Dm=0ACONFIG_NLS_MAC_CELTIC=3Dm=0ACONFIG_NLS_MAC_CENTEURO=3Dm=0ACONFIG_NLS=
_MAC_CROATIAN=3Dm=0ACONFIG_NLS_MAC_CYRILLIC=3Dm=0ACONFIG_NLS_MAC_GAELIC=3Dm=
=0ACONFIG_NLS_MAC_GREEK=3Dm=0ACONFIG_NLS_MAC_ICELAND=3Dm=0ACONFIG_NLS_MAC_I=
NUIT=3Dm=0ACONFIG_NLS_MAC_ROMANIAN=3Dm=0ACONFIG_NLS_MAC_TURKISH=3Dm=0ACONFI=
G_NLS_UTF8=3Dm=0ACONFIG_NLS_UCS2_UTILS=3Dm=0ACONFIG_DLM=3Dm=0ACONFIG_DLM_DE=
BUG=3Dy=0ACONFIG_UNICODE=3Dy=0ACONFIG_IO_WQ=3Dy=0A# end of File systems=0A=
=0A#=0A# Security options=0A#=0ACONFIG_KEYS=3Dy=0ACONFIG_KEYS_REQUEST_CACHE=
=3Dy=0ACONFIG_PERSISTENT_KEYRINGS=3Dy=0ACONFIG_BIG_KEYS=3Dy=0ACONFIG_TRUSTE=
D_KEYS=3Dm=0ACONFIG_HAVE_TRUSTED_KEYS=3Dy=0ACONFIG_TRUSTED_KEYS_TPM=3Dy=0AC=
ONFIG_TRUSTED_KEYS_TEE=3Dy=0ACONFIG_ENCRYPTED_KEYS=3Dy=0A# CONFIG_USER_DECR=
YPTED_DATA is not set=0ACONFIG_KEY_DH_OPERATIONS=3Dy=0ACONFIG_KEY_NOTIFICAT=
IONS=3Dy=0A# CONFIG_SECURITY_DMESG_RESTRICT is not set=0ACONFIG_PROC_MEM_AL=
WAYS_FORCE=3Dy=0A# CONFIG_PROC_MEM_FORCE_PTRACE is not set=0A# CONFIG_PROC_=
MEM_NO_FORCE is not set=0ACONFIG_SECURITY=3Dy=0ACONFIG_HAS_SECURITY_AUDIT=
=3Dy=0ACONFIG_SECURITYFS=3Dy=0ACONFIG_SECURITY_NETWORK=3Dy=0ACONFIG_SECURIT=
Y_INFINIBAND=3Dy=0ACONFIG_SECURITY_NETWORK_XFRM=3Dy=0ACONFIG_SECURITY_PATH=
=3Dy=0ACONFIG_INTEL_TXT=3Dy=0ACONFIG_LSM_MMAP_MIN_ADDR=3D65536=0A# CONFIG_S=
TATIC_USERMODEHELPER is not set=0ACONFIG_SECURITY_SELINUX=3Dy=0ACONFIG_SECU=
RITY_SELINUX_BOOTPARAM=3Dy=0ACONFIG_SECURITY_SELINUX_DEVELOP=3Dy=0ACONFIG_S=
ECURITY_SELINUX_AVC_STATS=3Dy=0ACONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=3D=
9=0ACONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=3D256=0ACONFIG_SECURITY_SELI=
NUX_AVC_HASH_BITS=3D9=0A# CONFIG_SECURITY_SELINUX_DEBUG is not set=0A# CONF=
IG_SECURITY_SMACK is not set=0ACONFIG_SECURITY_TOMOYO=3Dy=0ACONFIG_SECURITY=
_TOMOYO_MAX_ACCEPT_ENTRY=3D2048=0ACONFIG_SECURITY_TOMOYO_MAX_AUDIT_LOG=3D10=
24=0A# CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER is not set=0ACONFIG_SEC=
URITY_TOMOYO_POLICY_LOADER=3D"/sbin/tomoyo-init"=0ACONFIG_SECURITY_TOMOYO_A=
CTIVATION_TRIGGER=3D"/sbin/init"=0A# CONFIG_SECURITY_TOMOYO_INSECURE_BUILTI=
N_SETTING is not set=0ACONFIG_SECURITY_APPARMOR=3Dy=0A# CONFIG_SECURITY_APP=
ARMOR_DEBUG is not set=0ACONFIG_SECURITY_APPARMOR_INTROSPECT_POLICY=3Dy=0AC=
ONFIG_SECURITY_APPARMOR_HASH=3Dy=0ACONFIG_SECURITY_APPARMOR_HASH_DEFAULT=3D=
y=0ACONFIG_SECURITY_APPARMOR_EXPORT_BINARY=3Dy=0ACONFIG_SECURITY_APPARMOR_P=
ARANOID_LOAD=3Dy=0A# CONFIG_SECURITY_LOADPIN is not set=0ACONFIG_SECURITY_Y=
AMA=3Dy=0A# CONFIG_SECURITY_SAFESETID is not set=0ACONFIG_SECURITY_LOCKDOWN=
_LSM=3Dy=0ACONFIG_SECURITY_LOCKDOWN_LSM_EARLY=3Dy=0ACONFIG_LOCK_DOWN_IN_EFI=
_SECURE_BOOT=3Dy=0ACONFIG_LOCK_DOWN_KERNEL_FORCE_NONE=3Dy=0A# CONFIG_LOCK_D=
OWN_KERNEL_FORCE_INTEGRITY is not set=0A# CONFIG_LOCK_DOWN_KERNEL_FORCE_CON=
FIDENTIALITY is not set=0ACONFIG_SECURITY_LANDLOCK=3Dy=0A# CONFIG_SECURITY_=
IPE is not set=0ACONFIG_INTEGRITY=3Dy=0ACONFIG_INTEGRITY_SIGNATURE=3Dy=0ACO=
NFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy=0ACONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy=
=0ACONFIG_INTEGRITY_PLATFORM_KEYRING=3Dy=0ACONFIG_INTEGRITY_MACHINE_KEYRING=
=3Dy=0ACONFIG_INTEGRITY_CA_MACHINE_KEYRING=3Dy=0ACONFIG_INTEGRITY_CA_MACHIN=
E_KEYRING_MAX=3Dy=0ACONFIG_LOAD_UEFI_KEYS=3Dy=0ACONFIG_INTEGRITY_AUDIT=3Dy=
=0ACONFIG_IMA=3Dy=0A# CONFIG_IMA_KEXEC is not set=0ACONFIG_IMA_MEASURE_PCR_=
IDX=3D10=0ACONFIG_IMA_LSM_RULES=3Dy=0ACONFIG_IMA_NG_TEMPLATE=3Dy=0A# CONFIG=
_IMA_SIG_TEMPLATE is not set=0ACONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-ng"=0A# C=
ONFIG_IMA_DEFAULT_HASH_SHA1 is not set=0ACONFIG_IMA_DEFAULT_HASH_SHA256=3Dy=
=0A# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set=0ACONFIG_IMA_DEFAULT_HASH=3D=
"sha256"=0A# CONFIG_IMA_WRITE_POLICY is not set=0ACONFIG_IMA_READ_POLICY=3D=
y=0ACONFIG_IMA_APPRAISE=3Dy=0ACONFIG_IMA_ARCH_POLICY=3Dy=0A# CONFIG_IMA_APP=
RAISE_BUILD_POLICY is not set=0ACONFIG_IMA_APPRAISE_BOOTPARAM=3Dy=0ACONFIG_=
IMA_APPRAISE_MODSIG=3Dy=0ACONFIG_IMA_KEYRINGS_PERMIT_SIGNED_BY_BUILTIN_OR_S=
ECONDARY=3Dy=0ACONFIG_IMA_BLACKLIST_KEYRING=3Dy=0A# CONFIG_IMA_LOAD_X509 is=
 not set=0ACONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=3Dy=0ACONFIG_IMA_QUEUE_EARLY_=
BOOT_KEYS=3Dy=0ACONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=3Dy=0ACONFIG_IMA_DISA=
BLE_HTABLE=3Dy=0ACONFIG_EVM=3Dy=0ACONFIG_EVM_ATTR_FSUUID=3Dy=0ACONFIG_EVM_A=
DD_XATTRS=3Dy=0A# CONFIG_EVM_LOAD_X509 is not set=0A# CONFIG_DEFAULT_SECURI=
TY_SELINUX is not set=0A# CONFIG_DEFAULT_SECURITY_TOMOYO is not set=0ACONFI=
G_DEFAULT_SECURITY_APPARMOR=3Dy=0A# CONFIG_DEFAULT_SECURITY_DAC is not set=
=0ACONFIG_LSM=3D"landlock,lockdown,yama,loadpin,safesetid,integrity,apparmo=
r,selinux,smack,tomoyo,bpf"=0A=0A#=0A# Kernel hardening options=0A#=0A=0A#=
=0A# Memory initialization=0A#=0ACONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=3Dy=0A=
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=3Dy=0ACONFIG_CC_HAS_AUTO_VAR_INIT_ZER=
O=3Dy=0ACONFIG_INIT_STACK_NONE=3Dy=0A# CONFIG_INIT_STACK_ALL_PATTERN is not=
 set=0A# CONFIG_INIT_STACK_ALL_ZERO is not set=0A# CONFIG_CC_HAS_SANCOV_STA=
CK_DEPTH_CALLBACK is not set=0A# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set=
=0A# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set=0ACONFIG_CC_HAS_ZERO_CALL_US=
ED_REGS=3Dy=0A# CONFIG_ZERO_CALL_USED_REGS is not set=0A# end of Memory ini=
tialization=0A=0A#=0A# Bounds checking=0A#=0ACONFIG_FORTIFY_SOURCE=3Dy=0ACO=
NFIG_HARDENED_USERCOPY=3Dy=0A# CONFIG_HARDENED_USERCOPY_DEFAULT_ON is not s=
et=0A# end of Bounds checking=0A=0A#=0A# Hardening of kernel data structure=
s=0A#=0ACONFIG_LIST_HARDENED=3Dy=0ACONFIG_BUG_ON_DATA_CORRUPTION=3Dy=0A# en=
d of Hardening of kernel data structures=0A=0A# CONFIG_CC_HAS_RANDSTRUCT is=
 not set=0ACONFIG_RANDSTRUCT_NONE=3Dy=0A# CONFIG_RANDSTRUCT is not set=0A# =
CONFIG_GCC_PLUGIN_RANDSTRUCT is not set=0A# end of Kernel hardening options=
=0A# end of Security options=0A=0ACONFIG_XOR_BLOCKS=3Dm=0ACONFIG_ASYNC_CORE=
=3Dm=0ACONFIG_ASYNC_MEMCPY=3Dm=0ACONFIG_ASYNC_XOR=3Dm=0ACONFIG_ASYNC_PQ=3Dm=
=0ACONFIG_ASYNC_RAID6_RECOV=3Dm=0ACONFIG_CRYPTO=3Dy=0A=0A#=0A# Crypto core =
or helper=0A#=0ACONFIG_CRYPTO_FIPS=3Dy=0ACONFIG_CRYPTO_FIPS_NAME=3D"Linux K=
ernel Cryptographic API"=0A# CONFIG_CRYPTO_FIPS_CUSTOM_VERSION is not set=
=0ACONFIG_CRYPTO_ALGAPI=3Dy=0ACONFIG_CRYPTO_ALGAPI2=3Dy=0ACONFIG_CRYPTO_AEA=
D=3Dy=0ACONFIG_CRYPTO_AEAD2=3Dy=0ACONFIG_CRYPTO_SIG=3Dy=0ACONFIG_CRYPTO_SIG=
2=3Dy=0ACONFIG_CRYPTO_SKCIPHER=3Dy=0ACONFIG_CRYPTO_SKCIPHER2=3Dy=0ACONFIG_C=
RYPTO_HASH=3Dy=0ACONFIG_CRYPTO_HASH2=3Dy=0ACONFIG_CRYPTO_RNG=3Dy=0ACONFIG_C=
RYPTO_RNG2=3Dy=0ACONFIG_CRYPTO_RNG_DEFAULT=3Dy=0ACONFIG_CRYPTO_AKCIPHER2=3D=
y=0ACONFIG_CRYPTO_AKCIPHER=3Dy=0ACONFIG_CRYPTO_KPP2=3Dy=0ACONFIG_CRYPTO_KPP=
=3Dy=0ACONFIG_CRYPTO_ACOMP2=3Dy=0ACONFIG_CRYPTO_HKDF=3Dm=0ACONFIG_CRYPTO_MA=
NAGER=3Dy=0ACONFIG_CRYPTO_MANAGER2=3Dy=0ACONFIG_CRYPTO_USER=3Dm=0ACONFIG_CR=
YPTO_SELFTESTS=3Dy=0A# CONFIG_CRYPTO_SELFTESTS_FULL is not set=0ACONFIG_CRY=
PTO_NULL=3Dy=0ACONFIG_CRYPTO_PCRYPT=3Dm=0ACONFIG_CRYPTO_CRYPTD=3Dm=0ACONFIG=
_CRYPTO_AUTHENC=3Dm=0ACONFIG_CRYPTO_KRB5ENC=3Dm=0ACONFIG_CRYPTO_BENCHMARK=
=3Dm=0ACONFIG_CRYPTO_ENGINE=3Dm=0A# end of Crypto core or helper=0A=0A#=0A#=
 Public-key cryptography=0A#=0ACONFIG_CRYPTO_RSA=3Dy=0ACONFIG_CRYPTO_DH=3Dy=
=0ACONFIG_CRYPTO_DH_RFC7919_GROUPS=3Dy=0ACONFIG_CRYPTO_ECC=3Dy=0ACONFIG_CRY=
PTO_ECDH=3Dy=0ACONFIG_CRYPTO_ECDSA=3Dy=0ACONFIG_CRYPTO_ECRDSA=3Dm=0A# end o=
f Public-key cryptography=0A=0A#=0A# Block ciphers=0A#=0ACONFIG_CRYPTO_AES=
=3Dy=0ACONFIG_CRYPTO_AES_TI=3Dm=0ACONFIG_CRYPTO_ARIA=3Dm=0ACONFIG_CRYPTO_BL=
OWFISH=3Dm=0ACONFIG_CRYPTO_BLOWFISH_COMMON=3Dm=0ACONFIG_CRYPTO_CAMELLIA=3Dm=
=0ACONFIG_CRYPTO_CAST_COMMON=3Dm=0ACONFIG_CRYPTO_CAST5=3Dm=0ACONFIG_CRYPTO_=
CAST6=3Dm=0ACONFIG_CRYPTO_DES=3Dm=0ACONFIG_CRYPTO_FCRYPT=3Dm=0ACONFIG_CRYPT=
O_SERPENT=3Dm=0ACONFIG_CRYPTO_SM4=3Dm=0ACONFIG_CRYPTO_SM4_GENERIC=3Dm=0ACON=
FIG_CRYPTO_TWOFISH=3Dm=0ACONFIG_CRYPTO_TWOFISH_COMMON=3Dm=0A# end of Block =
ciphers=0A=0A#=0A# Length-preserving ciphers and modes=0A#=0ACONFIG_CRYPTO_=
ADIANTUM=3Dm=0ACONFIG_CRYPTO_CHACHA20=3Dm=0ACONFIG_CRYPTO_CBC=3Dy=0ACONFIG_=
CRYPTO_CTR=3Dy=0ACONFIG_CRYPTO_CTS=3Dm=0ACONFIG_CRYPTO_ECB=3Dy=0ACONFIG_CRY=
PTO_HCTR2=3Dm=0ACONFIG_CRYPTO_LRW=3Dm=0ACONFIG_CRYPTO_PCBC=3Dm=0ACONFIG_CRY=
PTO_XCTR=3Dm=0ACONFIG_CRYPTO_XTS=3Dm=0ACONFIG_CRYPTO_NHPOLY1305=3Dm=0A# end=
 of Length-preserving ciphers and modes=0A=0A#=0A# AEAD (authenticated encr=
yption with associated data) ciphers=0A#=0ACONFIG_CRYPTO_AEGIS128=3Dm=0ACON=
FIG_CRYPTO_CHACHA20POLY1305=3Dm=0ACONFIG_CRYPTO_CCM=3Dm=0ACONFIG_CRYPTO_GCM=
=3Dm=0ACONFIG_CRYPTO_GENIV=3Dy=0ACONFIG_CRYPTO_SEQIV=3Dy=0ACONFIG_CRYPTO_EC=
HAINIV=3Dm=0ACONFIG_CRYPTO_ESSIV=3Dm=0A# end of AEAD (authenticated encrypt=
ion with associated data) ciphers=0A=0A#=0A# Hashes, digests, and MACs=0A#=
=0ACONFIG_CRYPTO_BLAKE2B=3Dm=0ACONFIG_CRYPTO_CMAC=3Dm=0ACONFIG_CRYPTO_GHASH=
=3Dm=0ACONFIG_CRYPTO_HMAC=3Dy=0ACONFIG_CRYPTO_MD4=3Dm=0ACONFIG_CRYPTO_MD5=
=3Dy=0ACONFIG_CRYPTO_MICHAEL_MIC=3Dm=0ACONFIG_CRYPTO_RMD160=3Dm=0ACONFIG_CR=
YPTO_SHA1=3Dy=0ACONFIG_CRYPTO_SHA256=3Dy=0ACONFIG_CRYPTO_SHA512=3Dy=0ACONFI=
G_CRYPTO_SHA3=3Dy=0ACONFIG_CRYPTO_SM3_GENERIC=3Dm=0ACONFIG_CRYPTO_STREEBOG=
=3Dm=0ACONFIG_CRYPTO_WP512=3Dm=0ACONFIG_CRYPTO_XCBC=3Dm=0ACONFIG_CRYPTO_XXH=
ASH=3Dm=0A# end of Hashes, digests, and MACs=0A=0A#=0A# CRCs (cyclic redund=
ancy checks)=0A#=0ACONFIG_CRYPTO_CRC32C=3Dy=0ACONFIG_CRYPTO_CRC32=3Dm=0A# e=
nd of CRCs (cyclic redundancy checks)=0A=0A#=0A# Compression=0A#=0ACONFIG_C=
RYPTO_DEFLATE=3Dy=0ACONFIG_CRYPTO_LZO=3Dy=0ACONFIG_CRYPTO_842=3Dm=0ACONFIG_=
CRYPTO_LZ4=3Dm=0ACONFIG_CRYPTO_LZ4HC=3Dm=0ACONFIG_CRYPTO_ZSTD=3Dy=0A# end o=
f Compression=0A=0A#=0A# Random number generation=0A#=0ACONFIG_CRYPTO_DRBG_=
MENU=3Dy=0ACONFIG_CRYPTO_DRBG_HMAC=3Dy=0ACONFIG_CRYPTO_DRBG_HASH=3Dy=0ACONF=
IG_CRYPTO_DRBG_CTR=3Dy=0ACONFIG_CRYPTO_DRBG=3Dy=0ACONFIG_CRYPTO_JITTERENTRO=
PY=3Dy=0ACONFIG_CRYPTO_JITTERENTROPY_MEMSIZE_2=3Dy=0A# CONFIG_CRYPTO_JITTER=
ENTROPY_MEMSIZE_128 is not set=0A# CONFIG_CRYPTO_JITTERENTROPY_MEMSIZE_1024=
 is not set=0A# CONFIG_CRYPTO_JITTERENTROPY_MEMSIZE_8192 is not set=0ACONFI=
G_CRYPTO_JITTERENTROPY_MEMORY_BLOCKS=3D64=0ACONFIG_CRYPTO_JITTERENTROPY_MEM=
ORY_BLOCKSIZE=3D32=0ACONFIG_CRYPTO_JITTERENTROPY_OSR=3D1=0A# CONFIG_CRYPTO_=
JITTERENTROPY_TESTINTERFACE is not set=0ACONFIG_CRYPTO_KDF800108_CTR=3Dy=0A=
CONFIG_CRYPTO_DF80090A=3Dy=0A# end of Random number generation=0A=0A#=0A# U=
serspace interface=0A#=0ACONFIG_CRYPTO_USER_API=3Dm=0ACONFIG_CRYPTO_USER_AP=
I_HASH=3Dm=0ACONFIG_CRYPTO_USER_API_SKCIPHER=3Dm=0ACONFIG_CRYPTO_USER_API_R=
NG=3Dm=0A# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set=0ACONFIG_CRYPTO_USER_=
API_AEAD=3Dm=0A# CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set=0A# end =
of Userspace interface=0A=0A#=0A# Accelerated Cryptographic Algorithms for =
CPU (x86)=0A#=0ACONFIG_CRYPTO_AES_NI_INTEL=3Dm=0ACONFIG_CRYPTO_BLOWFISH_X86=
_64=3Dm=0ACONFIG_CRYPTO_CAMELLIA_X86_64=3Dm=0ACONFIG_CRYPTO_CAMELLIA_AESNI_=
AVX_X86_64=3Dm=0ACONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dm=0ACONFIG_CRYP=
TO_CAST5_AVX_X86_64=3Dm=0ACONFIG_CRYPTO_CAST6_AVX_X86_64=3Dm=0ACONFIG_CRYPT=
O_DES3_EDE_X86_64=3Dm=0ACONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dm=0ACONFIG_CRYP=
TO_SERPENT_AVX_X86_64=3Dm=0ACONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dm=0ACONFIG_=
CRYPTO_SM4_AESNI_AVX_X86_64=3Dm=0ACONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64=3Dm=
=0ACONFIG_CRYPTO_TWOFISH_X86_64=3Dm=0ACONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dm=
=0ACONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dm=0ACONFIG_CRYPTO_ARIA_AESNI_AVX_X86_=
64=3Dm=0ACONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64=3Dm=0ACONFIG_CRYPTO_ARIA_GFNI=
_AVX512_X86_64=3Dm=0ACONFIG_CRYPTO_AEGIS128_AESNI_SSE2=3Dm=0ACONFIG_CRYPTO_=
NHPOLY1305_SSE2=3Dm=0ACONFIG_CRYPTO_NHPOLY1305_AVX2=3Dm=0ACONFIG_CRYPTO_SM3=
_AVX_X86_64=3Dm=0ACONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dm=0A# end of Acceler=
ated Cryptographic Algorithms for CPU (x86)=0A=0ACONFIG_CRYPTO_HW=3Dy=0ACON=
FIG_CRYPTO_DEV_PADLOCK=3Dm=0ACONFIG_CRYPTO_DEV_PADLOCK_AES=3Dm=0ACONFIG_CRY=
PTO_DEV_PADLOCK_SHA=3Dm=0ACONFIG_CRYPTO_DEV_ATMEL_I2C=3Dm=0ACONFIG_CRYPTO_D=
EV_ATMEL_ECC=3Dm=0ACONFIG_CRYPTO_DEV_ATMEL_SHA204A=3Dm=0ACONFIG_CRYPTO_DEV_=
CCP=3Dy=0ACONFIG_CRYPTO_DEV_CCP_DD=3Dm=0ACONFIG_CRYPTO_DEV_SP_CCP=3Dy=0ACON=
FIG_CRYPTO_DEV_CCP_CRYPTO=3Dm=0ACONFIG_CRYPTO_DEV_SP_PSP=3Dy=0A# CONFIG_CRY=
PTO_DEV_CCP_DEBUGFS is not set=0ACONFIG_CRYPTO_DEV_NITROX=3Dm=0ACONFIG_CRYP=
TO_DEV_NITROX_CNN55XX=3Dm=0ACONFIG_CRYPTO_DEV_QAT=3Dm=0ACONFIG_CRYPTO_DEV_Q=
AT_DH895xCC=3Dm=0ACONFIG_CRYPTO_DEV_QAT_C3XXX=3Dm=0ACONFIG_CRYPTO_DEV_QAT_C=
62X=3Dm=0ACONFIG_CRYPTO_DEV_QAT_4XXX=3Dm=0ACONFIG_CRYPTO_DEV_QAT_420XX=3Dm=
=0ACONFIG_CRYPTO_DEV_QAT_6XXX=3Dm=0ACONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dm=0A=
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dm=0ACONFIG_CRYPTO_DEV_QAT_C62XVF=3Dm=0A# CO=
NFIG_CRYPTO_DEV_QAT_ERROR_INJECTION is not set=0ACONFIG_CRYPTO_DEV_IAA_CRYP=
TO=3Dm=0A# CONFIG_CRYPTO_DEV_IAA_CRYPTO_STATS is not set=0ACONFIG_CRYPTO_DE=
V_CHELSIO=3Dm=0ACONFIG_CRYPTO_DEV_VIRTIO=3Dm=0ACONFIG_CRYPTO_DEV_SAFEXCEL=
=3Dm=0ACONFIG_CRYPTO_DEV_AMLOGIC_GXL=3Dm=0A# CONFIG_CRYPTO_DEV_AMLOGIC_GXL_=
DEBUG is not set=0ACONFIG_ASYMMETRIC_KEY_TYPE=3Dy=0ACONFIG_ASYMMETRIC_PUBLI=
C_KEY_SUBTYPE=3Dy=0ACONFIG_X509_CERTIFICATE_PARSER=3Dy=0ACONFIG_PKCS8_PRIVA=
TE_KEY_PARSER=3Dm=0ACONFIG_PKCS7_MESSAGE_PARSER=3Dy=0A# CONFIG_PKCS7_TEST_K=
EY is not set=0ACONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy=0A# CONFIG_FIPS_SIGN=
ATURE_SELFTEST is not set=0A=0A#=0A# Certificates for signature checking=0A=
#=0ACONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"=0ACONFIG_MODULE_SIG_KEY=
_TYPE_RSA=3Dy=0ACONFIG_SYSTEM_TRUSTED_KEYRING=3Dy=0ACONFIG_SYSTEM_TRUSTED_K=
EYS=3D""=0A# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set=0ACONFIG_SECONDARY_=
TRUSTED_KEYRING=3Dy=0A# CONFIG_SECONDARY_TRUSTED_KEYRING_SIGNED_BY_BUILTIN =
is not set=0ACONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy=0ACONFIG_SYSTEM_BLACKLIST_=
HASH_LIST=3D""=0ACONFIG_SYSTEM_REVOCATION_LIST=3Dy=0ACONFIG_SYSTEM_REVOCATI=
ON_KEYS=3D""=0ACONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE=3Dy=0A# end of Certifica=
tes for signature checking=0A=0ACONFIG_CRYPTO_KRB5=3Dm=0A# CONFIG_CRYPTO_KR=
B5_SELFTESTS is not set=0ACONFIG_BINARY_PRINTF=3Dy=0A=0A#=0A# Library routi=
nes=0A#=0ACONFIG_RAID6_PQ=3Dm=0ACONFIG_RAID6_PQ_BENCHMARK=3Dy=0ACONFIG_LINE=
AR_RANGES=3Dy=0ACONFIG_PACKING=3Dy=0ACONFIG_BITREVERSE=3Dy=0A# CONFIG_HAVE_=
ARCH_BITREVERSE is not set=0ACONFIG_GENERIC_STRNCPY_FROM_USER=3Dy=0ACONFIG_=
GENERIC_STRNLEN_USER=3Dy=0ACONFIG_GENERIC_NET_UTILS=3Dy=0ACONFIG_CORDIC=3Dm=
=0A# CONFIG_PRIME_NUMBERS is not set=0ACONFIG_RATIONAL=3Dy=0ACONFIG_GENERIC=
_IOMAP=3Dy=0ACONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy=0ACONFIG_ARCH_HAS_FAST_MUL=
TIPLIER=3Dy=0ACONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy=0ACONFIG_CRC7=3Dm=0ACONFI=
G_CRC8=3Dm=0ACONFIG_CRC16=3Dm=0ACONFIG_CRC_CCITT=3Dy=0ACONFIG_CRC_ITU_T=3Dm=
=0ACONFIG_CRC_T10DIF=3Dy=0ACONFIG_CRC_T10DIF_ARCH=3Dy=0ACONFIG_CRC32=3Dy=0A=
CONFIG_CRC32_ARCH=3Dy=0ACONFIG_CRC64=3Dy=0ACONFIG_CRC64_ARCH=3Dy=0ACONFIG_C=
RC_OPTIMIZATIONS=3Dy=0A=0A#=0A# Crypto library routines=0A#=0ACONFIG_CRYPTO=
_HASH_INFO=3Dy=0ACONFIG_CRYPTO_LIB_UTILS=3Dy=0ACONFIG_CRYPTO_LIB_AES=3Dy=0A=
CONFIG_CRYPTO_LIB_AESCFB=3Dy=0ACONFIG_CRYPTO_LIB_AESGCM=3Dy=0ACONFIG_CRYPTO=
_LIB_ARC4=3Dm=0ACONFIG_CRYPTO_LIB_GF128MUL=3Dy=0ACONFIG_CRYPTO_LIB_BLAKE2B=
=3Dm=0ACONFIG_CRYPTO_LIB_BLAKE2S_ARCH=3Dy=0ACONFIG_CRYPTO_LIB_CHACHA=3Dy=0A=
CONFIG_CRYPTO_LIB_CHACHA_ARCH=3Dy=0ACONFIG_CRYPTO_LIB_CURVE25519=3Dm=0ACONF=
IG_CRYPTO_LIB_CURVE25519_ARCH=3Dy=0ACONFIG_CRYPTO_LIB_CURVE25519_GENERIC=3D=
y=0ACONFIG_CRYPTO_LIB_DES=3Dm=0ACONFIG_CRYPTO_LIB_MD5=3Dy=0ACONFIG_CRYPTO_L=
IB_POLY1305=3Dy=0ACONFIG_CRYPTO_LIB_POLY1305_ARCH=3Dy=0ACONFIG_CRYPTO_LIB_P=
OLY1305_GENERIC=3Dy=0ACONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11=0ACONFIG_CRYPTO=
_LIB_POLYVAL=3Dm=0ACONFIG_CRYPTO_LIB_POLYVAL_ARCH=3Dy=0ACONFIG_CRYPTO_LIB_C=
HACHA20POLY1305=3Dy=0ACONFIG_CRYPTO_LIB_SHA1=3Dy=0ACONFIG_CRYPTO_LIB_SHA1_A=
RCH=3Dy=0ACONFIG_CRYPTO_LIB_SHA256=3Dy=0ACONFIG_CRYPTO_LIB_SHA256_ARCH=3Dy=
=0ACONFIG_CRYPTO_LIB_SHA512=3Dy=0ACONFIG_CRYPTO_LIB_SHA512_ARCH=3Dy=0ACONFI=
G_CRYPTO_LIB_SHA3=3Dy=0ACONFIG_CRYPTO_LIB_SM3=3Dm=0A# end of Crypto library=
 routines=0A=0ACONFIG_XXHASH=3Dy=0A# CONFIG_AUDIT_ARCH_COMPAT_GENERIC is no=
t set=0A# CONFIG_RANDOM32_SELFTEST is not set=0ACONFIG_842_COMPRESS=3Dm=0AC=
ONFIG_842_DECOMPRESS=3Dm=0ACONFIG_ZLIB_INFLATE=3Dy=0ACONFIG_ZLIB_DEFLATE=3D=
y=0ACONFIG_LZO_COMPRESS=3Dy=0ACONFIG_LZO_DECOMPRESS=3Dy=0ACONFIG_LZ4_COMPRE=
SS=3Dm=0ACONFIG_LZ4HC_COMPRESS=3Dm=0ACONFIG_LZ4_DECOMPRESS=3Dy=0ACONFIG_ZST=
D_COMMON=3Dy=0ACONFIG_ZSTD_COMPRESS=3Dy=0ACONFIG_ZSTD_DECOMPRESS=3Dy=0ACONF=
IG_XZ_DEC=3Dy=0ACONFIG_XZ_DEC_X86=3Dy=0ACONFIG_XZ_DEC_POWERPC=3Dy=0ACONFIG_=
XZ_DEC_ARM=3Dy=0ACONFIG_XZ_DEC_ARMTHUMB=3Dy=0ACONFIG_XZ_DEC_ARM64=3Dy=0ACON=
FIG_XZ_DEC_SPARC=3Dy=0ACONFIG_XZ_DEC_RISCV=3Dy=0ACONFIG_XZ_DEC_MICROLZMA=3D=
y=0ACONFIG_XZ_DEC_BCJ=3Dy=0A# CONFIG_XZ_DEC_TEST is not set=0ACONFIG_DECOMP=
RESS_GZIP=3Dy=0ACONFIG_DECOMPRESS_BZIP2=3Dy=0ACONFIG_DECOMPRESS_LZMA=3Dy=0A=
CONFIG_DECOMPRESS_XZ=3Dy=0ACONFIG_DECOMPRESS_LZO=3Dy=0ACONFIG_DECOMPRESS_LZ=
4=3Dy=0ACONFIG_DECOMPRESS_ZSTD=3Dy=0ACONFIG_GENERIC_ALLOCATOR=3Dy=0ACONFIG_=
REED_SOLOMON=3Dm=0ACONFIG_REED_SOLOMON_ENC8=3Dy=0ACONFIG_REED_SOLOMON_DEC8=
=3Dy=0ACONFIG_REED_SOLOMON_DEC16=3Dy=0ACONFIG_BCH=3Dm=0ACONFIG_TEXTSEARCH=
=3Dy=0ACONFIG_TEXTSEARCH_KMP=3Dm=0ACONFIG_TEXTSEARCH_BM=3Dm=0ACONFIG_TEXTSE=
ARCH_FSM=3Dm=0ACONFIG_BTREE=3Dy=0ACONFIG_INTERVAL_TREE=3Dy=0ACONFIG_XARRAY_=
MULTI=3Dy=0ACONFIG_ASSOCIATIVE_ARRAY=3Dy=0ACONFIG_CLOSURES=3Dy=0ACONFIG_HAS=
_IOMEM=3Dy=0ACONFIG_HAS_IOPORT=3Dy=0ACONFIG_HAS_IOPORT_MAP=3Dy=0ACONFIG_HAS=
_DMA=3Dy=0ACONFIG_DMA_OPS_HELPERS=3Dy=0ACONFIG_NEED_SG_DMA_FLAGS=3Dy=0ACONF=
IG_NEED_SG_DMA_LENGTH=3Dy=0ACONFIG_NEED_DMA_MAP_STATE=3Dy=0ACONFIG_ARCH_DMA=
_ADDR_T_64BIT=3Dy=0ACONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=3Dy=0ACONFIG_SWIO=
TLB=3Dy=0A# CONFIG_SWIOTLB_DYNAMIC is not set=0ACONFIG_DMA_NEED_SYNC=3Dy=0A=
CONFIG_DMA_COHERENT_POOL=3Dy=0ACONFIG_DMA_CMA=3Dy=0ACONFIG_DMA_NUMA_CMA=3Dy=
=0A=0A#=0A# Default contiguous memory area size:=0A#=0ACONFIG_CMA_SIZE_MBYT=
ES=3D0=0ACONFIG_CMA_SIZE_SEL_MBYTES=3Dy=0A# CONFIG_CMA_SIZE_SEL_PERCENTAGE =
is not set=0A# CONFIG_CMA_SIZE_SEL_MIN is not set=0A# CONFIG_CMA_SIZE_SEL_M=
AX is not set=0ACONFIG_CMA_ALIGNMENT=3D8=0A# CONFIG_DMA_API_DEBUG is not se=
t=0A# CONFIG_DMA_MAP_BENCHMARK is not set=0ACONFIG_SGL_ALLOC=3Dy=0ACONFIG_I=
OMMU_HELPER=3Dy=0ACONFIG_CHECK_SIGNATURE=3Dy=0ACONFIG_CPUMASK_OFFSTACK=3Dy=
=0A# CONFIG_FORCE_NR_CPUS is not set=0ACONFIG_CPU_RMAP=3Dy=0ACONFIG_DQL=3Dy=
=0ACONFIG_GLOB=3Dy=0A# CONFIG_GLOB_SELFTEST is not set=0ACONFIG_NLATTR=3Dy=
=0ACONFIG_LRU_CACHE=3Dm=0ACONFIG_CLZ_TAB=3Dy=0ACONFIG_IRQ_POLL=3Dy=0ACONFIG=
_MPILIB=3Dy=0ACONFIG_SIGNATURE=3Dy=0ACONFIG_DIMLIB=3Dy=0ACONFIG_OID_REGISTR=
Y=3Dy=0ACONFIG_UCS2_STRING=3Dy=0ACONFIG_HAVE_GENERIC_VDSO=3Dy=0ACONFIG_GENE=
RIC_GETTIMEOFDAY=3Dy=0ACONFIG_GENERIC_VDSO_OVERFLOW_PROTECT=3Dy=0ACONFIG_VD=
SO_GETRANDOM=3Dy=0ACONFIG_FONT_SUPPORT=3Dy=0ACONFIG_FONTS=3Dy=0ACONFIG_FONT=
_8x8=3Dy=0ACONFIG_FONT_8x16=3Dy=0A# CONFIG_FONT_6x11 is not set=0A# CONFIG_=
FONT_7x14 is not set=0A# CONFIG_FONT_PEARL_8x8 is not set=0A# CONFIG_FONT_A=
CORN_8x8 is not set=0A# CONFIG_FONT_MINI_4x6 is not set=0A# CONFIG_FONT_6x1=
0 is not set=0A# CONFIG_FONT_10x18 is not set=0A# CONFIG_FONT_SUN8x16 is no=
t set=0A# CONFIG_FONT_SUN12x22 is not set=0A# CONFIG_FONT_TER10x18 is not s=
et=0ACONFIG_FONT_TER16x32=3Dy=0ACONFIG_FONT_6x8=3Dy=0A# CONFIG_SG_SPLIT is =
not set=0ACONFIG_SG_POOL=3Dy=0A# CONFIG_ARCH_NO_SG_CHAIN is not set=0ACONFI=
G_ARCH_HAS_PMEM_API=3Dy=0ACONFIG_MEMREGION=3Dy=0ACONFIG_ARCH_HAS_CPU_CACHE_=
INVALIDATE_MEMREGION=3Dy=0ACONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy=0ACONFIG_=
ARCH_HAS_COPY_MC=3Dy=0ACONFIG_ARCH_STACKWALK=3Dy=0ACONFIG_STACKDEPOT=3Dy=0A=
CONFIG_STACKDEPOT_MAX_FRAMES=3D64=0ACONFIG_SBITMAP=3Dy=0ACONFIG_PARMAN=3Dm=
=0ACONFIG_OBJAGG=3Dm=0A# CONFIG_LWQ_TEST is not set=0A# end of Library rout=
ines=0A=0ACONFIG_PLDMFW=3Dy=0ACONFIG_ASN1_ENCODER=3Dm=0ACONFIG_POLYNOMIAL=
=3Dm=0ACONFIG_FIRMWARE_TABLE=3Dy=0ACONFIG_UNION_FIND=3Dy=0ACONFIG_MIN_HEAP=
=3Dy=0A=0A#=0A# Kernel hacking=0A#=0A=0A#=0A# printk and dmesg options=0A#=
=0ACONFIG_PRINTK_TIME=3Dy=0ACONFIG_PRINTK_CALLER=3Dy=0ACONFIG_STACKTRACE_BU=
ILD_ID=3Dy=0ACONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7=0ACONFIG_CONSOLE_LOGLEVEL_=
QUIET=3D4=0ACONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4=0A# CONFIG_BOOT_PRINTK_DELA=
Y is not set=0ACONFIG_DYNAMIC_DEBUG=3Dy=0ACONFIG_DYNAMIC_DEBUG_CORE=3Dy=0AC=
ONFIG_SYMBOLIC_ERRNAME=3Dy=0ACONFIG_DEBUG_BUGVERBOSE=3Dy=0ACONFIG_DEBUG_BUG=
VERBOSE_DETAILED=3Dy=0A# end of printk and dmesg options=0A=0ACONFIG_DEBUG_=
KERNEL=3Dy=0ACONFIG_DEBUG_MISC=3Dy=0A=0A#=0A# Compile-time checks and compi=
ler options=0A#=0ACONFIG_DEBUG_INFO=3Dy=0ACONFIG_AS_HAS_NON_CONST_ULEB128=
=3Dy=0A# CONFIG_DEBUG_INFO_NONE is not set=0A# CONFIG_DEBUG_INFO_DWARF_TOOL=
CHAIN_DEFAULT is not set=0A# CONFIG_DEBUG_INFO_DWARF4 is not set=0ACONFIG_D=
EBUG_INFO_DWARF5=3Dy=0A# CONFIG_DEBUG_INFO_REDUCED is not set=0ACONFIG_DEBU=
G_INFO_COMPRESSED_NONE=3Dy=0A# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set=
=0A# CONFIG_DEBUG_INFO_COMPRESSED_ZSTD is not set=0A# CONFIG_DEBUG_INFO_SPL=
IT is not set=0ACONFIG_DEBUG_INFO_BTF=3Dy=0ACONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy=
=0ACONFIG_PAHOLE_HAS_LANG_EXCLUDE=3Dy=0ACONFIG_DEBUG_INFO_BTF_MODULES=3Dy=
=0ACONFIG_MODULE_ALLOW_BTF_MISMATCH=3Dy=0A# CONFIG_GDB_SCRIPTS is not set=
=0ACONFIG_FRAME_WARN=3D2048=0ACONFIG_STRIP_ASM_SYMS=3Dy=0A# CONFIG_READABLE=
_ASM is not set=0A# CONFIG_HEADERS_INSTALL is not set=0A# CONFIG_DEBUG_SECT=
ION_MISMATCH is not set=0ACONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy=0A# CONFIG_=
DEBUG_FORCE_FUNCTION_ALIGN_64B is not set=0ACONFIG_OBJTOOL=3Dy=0A# CONFIG_O=
BJTOOL_WERROR is not set=0ACONFIG_VMLINUX_MAP=3Dy=0ACONFIG_BUILTIN_MODULE_R=
ANGES=3Dy=0ACONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy=0A# end of Compile-time che=
cks and compiler options=0A=0A#=0A# Generic Kernel Debugging Instruments=0A=
#=0ACONFIG_MAGIC_SYSRQ=3Dy=0ACONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1=0ACONF=
IG_MAGIC_SYSRQ_SERIAL=3Dy=0ACONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""=0ACONFI=
G_DEBUG_FS=3Dy=0ACONFIG_DEBUG_FS_ALLOW_ALL=3Dy=0A# CONFIG_DEBUG_FS_ALLOW_NO=
NE is not set=0ACONFIG_HAVE_ARCH_KGDB=3Dy=0ACONFIG_KGDB=3Dy=0ACONFIG_KGDB_H=
ONOUR_BLOCKLIST=3Dy=0ACONFIG_KGDB_SERIAL_CONSOLE=3Dy=0A# CONFIG_KGDB_TESTS =
is not set=0ACONFIG_KGDB_LOW_LEVEL_TRAP=3Dy=0ACONFIG_KGDB_KDB=3Dy=0ACONFIG_=
KDB_DEFAULT_ENABLE=3D0x1=0ACONFIG_KDB_KEYBOARD=3Dy=0ACONFIG_KDB_CONTINUE_CA=
TASTROPHIC=3D0=0ACONFIG_ARCH_HAS_EARLY_DEBUG=3Dy=0ACONFIG_ARCH_HAS_UBSAN=3D=
y=0A# CONFIG_UBSAN is not set=0ACONFIG_HAVE_ARCH_KCSAN=3Dy=0ACONFIG_HAVE_KC=
SAN_COMPILER=3Dy=0A# CONFIG_KCSAN is not set=0A# end of Generic Kernel Debu=
gging Instruments=0A=0A#=0A# Networking Debugging=0A#=0A# CONFIG_NET_DEV_RE=
FCNT_TRACKER is not set=0A# CONFIG_NET_NS_REFCNT_TRACKER is not set=0A# CON=
FIG_DEBUG_NET is not set=0A# CONFIG_DEBUG_NET_SMALL_RTNL is not set=0A# end=
 of Networking Debugging=0A=0A#=0A# Memory Debugging=0A#=0ACONFIG_PAGE_EXTE=
NSION=3Dy=0ACONFIG_DEBUG_PAGEALLOC=3Dy=0A# CONFIG_DEBUG_PAGEALLOC_ENABLE_DE=
FAULT is not set=0ACONFIG_SLUB_DEBUG=3Dy=0A# CONFIG_SLUB_DEBUG_ON is not se=
t=0ACONFIG_PAGE_OWNER=3Dy=0ACONFIG_PAGE_TABLE_CHECK=3Dy=0A# CONFIG_PAGE_TAB=
LE_CHECK_ENFORCED is not set=0ACONFIG_PAGE_POISONING=3Dy=0A# CONFIG_DEBUG_P=
AGE_REF is not set=0A# CONFIG_DEBUG_RODATA_TEST is not set=0ACONFIG_ARCH_HA=
S_DEBUG_WX=3Dy=0ACONFIG_DEBUG_WX=3Dy=0ACONFIG_ARCH_HAS_PTDUMP=3Dy=0ACONFIG_=
PTDUMP=3Dy=0A# CONFIG_PTDUMP_DEBUGFS is not set=0ACONFIG_HAVE_DEBUG_KMEMLEA=
K=3Dy=0A# CONFIG_DEBUG_KMEMLEAK is not set=0A# CONFIG_PER_VMA_LOCK_STATS is=
 not set=0A# CONFIG_DEBUG_OBJECTS is not set=0A# CONFIG_SHRINKER_DEBUG is n=
ot set=0A# CONFIG_DEBUG_STACK_USAGE is not set=0ACONFIG_SCHED_STACK_END_CHE=
CK=3Dy=0ACONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy=0A# CONFIG_DEBUG_VFS is not s=
et=0A# CONFIG_DEBUG_VM_IRQSOFF is not set=0A# CONFIG_DEBUG_VM is not set=0A=
# CONFIG_DEBUG_VM_PGTABLE is not set=0ACONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy=0A=
# CONFIG_DEBUG_VIRTUAL is not set=0ACONFIG_DEBUG_MEMORY_INIT=3Dy=0ACONFIG_M=
EMORY_NOTIFIER_ERROR_INJECT=3Dm=0A# CONFIG_DEBUG_PER_CPU_MAPS is not set=0A=
CONFIG_HAVE_ARCH_KASAN=3Dy=0ACONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy=0ACONFIG_CC=
_HAS_KASAN_GENERIC=3Dy=0ACONFIG_CC_HAS_KASAN_SW_TAGS=3Dy=0ACONFIG_CC_HAS_WO=
RKING_NOSANITIZE_ADDRESS=3Dy=0A# CONFIG_KASAN is not set=0ACONFIG_HAVE_ARCH=
_KFENCE=3Dy=0ACONFIG_KFENCE=3Dy=0ACONFIG_KFENCE_SAMPLE_INTERVAL=3D0=0ACONFI=
G_KFENCE_NUM_OBJECTS=3D255=0A# CONFIG_KFENCE_DEFERRABLE is not set=0ACONFIG=
_KFENCE_STATIC_KEYS=3Dy=0ACONFIG_KFENCE_STRESS_TEST_FAULTS=3D0=0ACONFIG_HAV=
E_ARCH_KMSAN=3Dy=0A# CONFIG_HAVE_KMSAN_COMPILER is not set=0A# end of Memor=
y Debugging=0A=0A# CONFIG_DEBUG_SHIRQ is not set=0A=0A#=0A# Debug Oops, Loc=
kups and Hangs=0A#=0A# CONFIG_PANIC_ON_OOPS is not set=0ACONFIG_PANIC_TIMEO=
UT=3D90=0ACONFIG_LOCKUP_DETECTOR=3Dy=0ACONFIG_SOFTLOCKUP_DETECTOR=3Dy=0A# C=
ONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set=0ACONFIG_HAVE_HARDLOCKUP_DETECT=
OR_BUDDY=3Dy=0ACONFIG_HARDLOCKUP_DETECTOR=3Dy=0A# CONFIG_HARDLOCKUP_DETECTO=
R_PREFER_BUDDY is not set=0ACONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy=0A# CONFIG_=
HARDLOCKUP_DETECTOR_BUDDY is not set=0A# CONFIG_HARDLOCKUP_DETECTOR_ARCH is=
 not set=0ACONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER=3Dy=0ACONFIG_HARDLOCKU=
P_CHECK_TIMESTAMP=3Dy=0ACONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy=0ACONFIG_DETE=
CT_HUNG_TASK=3Dy=0ACONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D480=0ACONFIG_BOOTPARA=
M_HUNG_TASK_PANIC=3D0=0ACONFIG_DETECT_HUNG_TASK_BLOCKER=3Dy=0ACONFIG_WQ_WAT=
CHDOG=3Dy=0A# CONFIG_WQ_CPU_INTENSIVE_REPORT is not set=0A# CONFIG_TEST_LOC=
KUP is not set=0A# end of Debug Oops, Lockups and Hangs=0A=0A#=0A# Schedule=
r Debugging=0A#=0ACONFIG_SCHED_INFO=3Dy=0ACONFIG_SCHEDSTATS=3Dy=0A# end of =
Scheduler Debugging=0A=0A# CONFIG_DEBUG_PREEMPT is not set=0A=0A#=0A# Lock =
Debugging (spinlocks, mutexes, etc...)=0A#=0ACONFIG_LOCK_DEBUGGING_SUPPORT=
=3Dy=0A# CONFIG_PROVE_LOCKING is not set=0A# CONFIG_LOCK_STAT is not set=0A=
# CONFIG_DEBUG_RT_MUTEXES is not set=0A# CONFIG_DEBUG_SPINLOCK is not set=
=0A# CONFIG_DEBUG_MUTEXES is not set=0A# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is =
not set=0A# CONFIG_DEBUG_RWSEMS is not set=0A# CONFIG_DEBUG_LOCK_ALLOC is n=
ot set=0A# CONFIG_DEBUG_ATOMIC_SLEEP is not set=0A# CONFIG_DEBUG_LOCKING_AP=
I_SELFTESTS is not set=0A# CONFIG_LOCK_TORTURE_TEST is not set=0A# CONFIG_W=
W_MUTEX_SELFTEST is not set=0A# CONFIG_SCF_TORTURE_TEST is not set=0A# CONF=
IG_CSD_LOCK_WAIT_DEBUG is not set=0A# end of Lock Debugging (spinlocks, mut=
exes, etc...)=0A=0ACONFIG_NMI_CHECK_CPU=3Dy=0A# CONFIG_DEBUG_IRQFLAGS is no=
t set=0ACONFIG_STACKTRACE=3Dy=0A# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not se=
t=0A# CONFIG_DEBUG_KOBJECT is not set=0A=0A#=0A# Debug kernel data structur=
es=0A#=0A# CONFIG_DEBUG_LIST is not set=0A# CONFIG_DEBUG_PLIST is not set=
=0ACONFIG_DEBUG_SG=3Dy=0A# CONFIG_DEBUG_NOTIFIERS is not set=0A# CONFIG_DEB=
UG_CLOSURES is not set=0A# CONFIG_DEBUG_MAPLE_TREE is not set=0A# end of De=
bug kernel data structures=0A=0A#=0A# RCU Debugging=0A#=0A# CONFIG_PROVE_RC=
U is not set=0ACONFIG_TORTURE_TEST=3Dm=0ACONFIG_RCU_SCALE_TEST=3Dm=0ACONFIG=
_RCU_TORTURE_TEST=3Dm=0A# CONFIG_RCU_TORTURE_TEST_CHK_RDR_STATE is not set=
=0A# CONFIG_RCU_TORTURE_TEST_LOG_CPU is not set=0A# CONFIG_RCU_TORTURE_TEST=
_LOG_GP is not set=0A# CONFIG_RCU_REF_SCALE_TEST is not set=0ACONFIG_RCU_CP=
U_STALL_TIMEOUT=3D60=0ACONFIG_RCU_EXP_CPU_STALL_TIMEOUT=3D0=0ACONFIG_RCU_CP=
U_STALL_CPUTIME=3Dy=0ACONFIG_RCU_TRACE=3Dy=0A# CONFIG_RCU_EQS_DEBUG is not =
set=0A# end of RCU Debugging=0A=0A# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set=
=0A# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set=0A# CONFIG_LATENCYTOP is n=
ot set=0A# CONFIG_DEBUG_CGROUP_REF is not set=0ACONFIG_USER_STACKTRACE_SUPP=
ORT=3Dy=0ACONFIG_NOP_TRACER=3Dy=0ACONFIG_HAVE_RETHOOK=3Dy=0ACONFIG_RETHOOK=
=3Dy=0ACONFIG_HAVE_FUNCTION_TRACER=3Dy=0ACONFIG_HAVE_FUNCTION_GRAPH_TRACER=
=3Dy=0ACONFIG_HAVE_FUNCTION_GRAPH_FREGS=3Dy=0ACONFIG_HAVE_FTRACE_GRAPH_FUNC=
=3Dy=0ACONFIG_HAVE_DYNAMIC_FTRACE=3Dy=0ACONFIG_HAVE_DYNAMIC_FTRACE_WITH_REG=
S=3Dy=0ACONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy=0ACONFIG_HAVE_DYNA=
MIC_FTRACE_WITH_ARGS=3Dy=0ACONFIG_HAVE_FTRACE_REGS_HAVING_PT_REGS=3Dy=0ACON=
FIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=3Dy=0ACONFIG_HAVE_DYNAMIC_FTRACE_WITH_=
JMP=3Dy=0ACONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy=0ACONFIG_HAVE_FENTRY=3Dy=0ACO=
NFIG_HAVE_OBJTOOL_MCOUNT=3Dy=0ACONFIG_HAVE_OBJTOOL_NOP_MCOUNT=3Dy=0ACONFIG_=
HAVE_C_RECORDMCOUNT=3Dy=0ACONFIG_HAVE_BUILDTIME_MCOUNT_SORT=3Dy=0ACONFIG_BU=
ILDTIME_MCOUNT_SORT=3Dy=0ACONFIG_TRACER_MAX_TRACE=3Dy=0ACONFIG_TRACE_CLOCK=
=3Dy=0ACONFIG_RING_BUFFER=3Dy=0ACONFIG_EVENT_TRACING=3Dy=0ACONFIG_CONTEXT_S=
WITCH_TRACER=3Dy=0ACONFIG_RING_BUFFER_ALLOW_SWAP=3Dy=0ACONFIG_TRACING=3Dy=
=0ACONFIG_GENERIC_TRACER=3Dy=0ACONFIG_TRACING_SUPPORT=3Dy=0ACONFIG_FTRACE=
=3Dy=0ACONFIG_TRACEFS_AUTOMOUNT_DEPRECATED=3Dy=0ACONFIG_BOOTTIME_TRACING=3D=
y=0ACONFIG_FUNCTION_TRACER=3Dy=0ACONFIG_FUNCTION_GRAPH_TRACER=3Dy=0ACONFIG_=
FUNCTION_GRAPH_RETVAL=3Dy=0ACONFIG_FUNCTION_GRAPH_RETADDR=3Dy=0ACONFIG_FUNC=
TION_TRACE_ARGS=3Dy=0ACONFIG_DYNAMIC_FTRACE=3Dy=0ACONFIG_DYNAMIC_FTRACE_WIT=
H_REGS=3Dy=0ACONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy=0ACONFIG_DYNAMIC_F=
TRACE_WITH_ARGS=3Dy=0ACONFIG_DYNAMIC_FTRACE_WITH_JMP=3Dy=0A# CONFIG_FUNCTIO=
N_SELF_TRACING is not set=0ACONFIG_FPROBE=3Dy=0ACONFIG_FUNCTION_PROFILER=3D=
y=0ACONFIG_STACK_TRACER=3Dy=0A# CONFIG_IRQSOFF_TRACER is not set=0A# CONFIG=
_PREEMPT_TRACER is not set=0ACONFIG_SCHED_TRACER=3Dy=0A# CONFIG_HWLAT_TRACE=
R is not set=0ACONFIG_OSNOISE_TRACER=3Dy=0ACONFIG_TIMERLAT_TRACER=3Dy=0A# C=
ONFIG_MMIOTRACE is not set=0ACONFIG_FTRACE_SYSCALLS=3Dy=0ACONFIG_TRACE_SYSC=
ALL_BUF_SIZE_DEFAULT=3D63=0ACONFIG_TRACER_SNAPSHOT=3Dy=0ACONFIG_TRACER_SNAP=
SHOT_PER_CPU_SWAP=3Dy=0ACONFIG_BRANCH_PROFILE_NONE=3Dy=0A# CONFIG_PROFILE_A=
NNOTATED_BRANCHES is not set=0ACONFIG_BLK_DEV_IO_TRACE=3Dy=0ACONFIG_FPROBE_=
EVENTS=3Dy=0ACONFIG_PROBE_EVENTS_BTF_ARGS=3Dy=0ACONFIG_KPROBE_EVENTS=3Dy=0A=
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set=0ACONFIG_UPROBE_EVENTS=3Dy=0AC=
ONFIG_EPROBE_EVENTS=3Dy=0ACONFIG_BPF_EVENTS=3Dy=0ACONFIG_DYNAMIC_EVENTS=3Dy=
=0ACONFIG_PROBE_EVENTS=3Dy=0A# CONFIG_BPF_KPROBE_OVERRIDE is not set=0ACONF=
IG_FTRACE_MCOUNT_USE_CC=3Dy=0ACONFIG_TRACING_MAP=3Dy=0ACONFIG_SYNTH_EVENTS=
=3Dy=0A# CONFIG_USER_EVENTS is not set=0ACONFIG_HIST_TRIGGERS=3Dy=0A# CONFI=
G_TRACE_EVENT_INJECT is not set=0A# CONFIG_TRACEPOINT_BENCHMARK is not set=
=0ACONFIG_RING_BUFFER_BENCHMARK=3Dm=0A# CONFIG_TRACE_EVAL_MAP_FILE is not s=
et=0A# CONFIG_FTRACE_RECORD_RECURSION is not set=0A# CONFIG_FTRACE_VALIDATE=
_RCU_IS_WATCHING is not set=0A# CONFIG_FTRACE_STARTUP_TEST is not set=0A# C=
ONFIG_FTRACE_SORT_STARTUP_TEST is not set=0A# CONFIG_RING_BUFFER_STARTUP_TE=
ST is not set=0A# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set=0ACONF=
IG_PREEMPTIRQ_DELAY_TEST=3Dm=0A# CONFIG_SYNTH_EVENT_GEN_TEST is not set=0A#=
 CONFIG_KPROBE_EVENT_GEN_TEST is not set=0A# CONFIG_HIST_TRIGGERS_DEBUG is =
not set=0A# CONFIG_RV is not set=0ACONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy=0A#=
 CONFIG_SAMPLES is not set=0ACONFIG_HAVE_SAMPLE_FTRACE_DIRECT=3Dy=0ACONFIG_=
HAVE_SAMPLE_FTRACE_DIRECT_MULTI=3Dy=0ACONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy=
=0ACONFIG_STRICT_DEVMEM=3Dy=0ACONFIG_IO_STRICT_DEVMEM=3Dy=0A=0A#=0A# x86 De=
bugging=0A#=0ACONFIG_EARLY_PRINTK_USB=3Dy=0A# CONFIG_X86_VERBOSE_BOOTUP is =
not set=0ACONFIG_EARLY_PRINTK=3Dy=0ACONFIG_EARLY_PRINTK_DBGP=3Dy=0ACONFIG_E=
ARLY_PRINTK_USB_XDBC=3Dy=0A# CONFIG_EFI_PGT_DUMP is not set=0A# CONFIG_DEBU=
G_TLBFLUSH is not set=0A# CONFIG_IOMMU_DEBUG is not set=0ACONFIG_HAVE_MMIOT=
RACE_SUPPORT=3Dy=0A# CONFIG_X86_DECODER_SELFTEST is not set=0ACONFIG_IO_DEL=
AY_0X80=3Dy=0A# CONFIG_IO_DELAY_0XED is not set=0A# CONFIG_IO_DELAY_UDELAY =
is not set=0A# CONFIG_IO_DELAY_NONE is not set=0A# CONFIG_DEBUG_BOOT_PARAMS=
 is not set=0A# CONFIG_CPA_DEBUG is not set=0A# CONFIG_DEBUG_ENTRY is not s=
et=0A# CONFIG_DEBUG_NMI_SELFTEST is not set=0A# CONFIG_X86_DEBUG_FPU is not=
 set=0A# CONFIG_PUNIT_ATOM_DEBUG is not set=0ACONFIG_UNWINDER_ORC=3Dy=0A# C=
ONFIG_UNWINDER_FRAME_POINTER is not set=0A# end of x86 Debugging=0A=0A#=0A#=
 Kernel Testing and Coverage=0A#=0A# CONFIG_KUNIT is not set=0ACONFIG_NOTIF=
IER_ERROR_INJECTION=3Dm=0ACONFIG_PM_NOTIFIER_ERROR_INJECT=3Dm=0ACONFIG_NETD=
EV_NOTIFIER_ERROR_INJECT=3Dm=0ACONFIG_FUNCTION_ERROR_INJECTION=3Dy=0ACONFIG=
_FAULT_INJECTION=3Dy=0A# CONFIG_FAILSLAB is not set=0A# CONFIG_FAIL_PAGE_AL=
LOC is not set=0A# CONFIG_FAULT_INJECTION_USERCOPY is not set=0ACONFIG_FAIL=
_MAKE_REQUEST=3Dy=0A# CONFIG_FAIL_IO_TIMEOUT is not set=0A# CONFIG_FAIL_FUT=
EX is not set=0ACONFIG_FAULT_INJECTION_DEBUG_FS=3Dy=0A# CONFIG_FAIL_FUNCTIO=
N is not set=0A# CONFIG_FAIL_MMC_REQUEST is not set=0A# CONFIG_FAIL_SUNRPC =
is not set=0A# CONFIG_FAIL_SKB_REALLOC is not set=0A# CONFIG_FAULT_INJECTIO=
N_CONFIGFS is not set=0A# CONFIG_FAULT_INJECTION_STACKTRACE_FILTER is not s=
et=0ACONFIG_ARCH_HAS_KCOV=3Dy=0A# CONFIG_KCOV is not set=0ACONFIG_RUNTIME_T=
ESTING_MENU=3Dy=0A# CONFIG_TEST_DHRY is not set=0ACONFIG_LKDTM=3Dm=0A# CONF=
IG_TEST_MIN_HEAP is not set=0A# CONFIG_TEST_DIV64 is not set=0A# CONFIG_TES=
T_MULDIV64 is not set=0A# CONFIG_BACKTRACE_SELF_TEST is not set=0A# CONFIG_=
TEST_REF_TRACKER is not set=0ACONFIG_RBTREE_TEST=3Dm=0A# CONFIG_REED_SOLOMO=
N_TEST is not set=0ACONFIG_INTERVAL_TREE_TEST=3Dm=0A# CONFIG_PERCPU_TEST is=
 not set=0A# CONFIG_ATOMIC64_SELFTEST is not set=0ACONFIG_ASYNC_RAID6_TEST=
=3Dm=0A# CONFIG_TEST_HEXDUMP is not set=0A# CONFIG_TEST_KSTRTOX is not set=
=0A# CONFIG_TEST_BITMAP is not set=0A# CONFIG_TEST_UUID is not set=0A# CONF=
IG_TEST_XARRAY is not set=0A# CONFIG_TEST_MAPLE_TREE is not set=0A# CONFIG_=
TEST_RHASHTABLE is not set=0A# CONFIG_TEST_IDA is not set=0A# CONFIG_TEST_P=
ARMAN is not set=0ACONFIG_TEST_LKM=3Dm=0A# CONFIG_TEST_BITOPS is not set=0A=
# CONFIG_TEST_VMALLOC is not set=0A# CONFIG_TEST_BPF is not set=0A# CONFIG_=
FIND_BIT_BENCHMARK is not set=0ACONFIG_TEST_FIRMWARE=3Dm=0ACONFIG_TEST_SYSC=
TL=3Dm=0A# CONFIG_TEST_UDELAY is not set=0A# CONFIG_TEST_STATIC_KEYS is not=
 set=0A# CONFIG_TEST_DYNAMIC_DEBUG is not set=0A# CONFIG_TEST_KMOD is not s=
et=0A# CONFIG_TEST_KALLSYMS is not set=0A# CONFIG_TEST_MEMCAT_P is not set=
=0A# CONFIG_TEST_OBJAGG is not set=0A# CONFIG_TEST_MEMINIT is not set=0A# C=
ONFIG_TEST_HMM is not set=0A# CONFIG_TEST_FREE_PAGES is not set=0A# CONFIG_=
TEST_FPU is not set=0A# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set=0A# CON=
FIG_TEST_OBJPOOL is not set=0ACONFIG_ARCH_USE_MEMTEST=3Dy=0ACONFIG_MEMTEST=
=3Dy=0A# CONFIG_HYPERV_TESTING is not set=0A# end of Kernel Testing and Cov=
erage=0A=0A#=0A# Rust hacking=0A#=0A# end of Rust hacking=0A# end of Kernel=
 hacking=0A=0ACONFIG_IO_URING_ZCRX=3Dy=0ACONFIG_SUSE_KERNEL=3Dy=0A=0A#=0A# =
SUSE Release Details=0A#=0A# CONFIG_SUSE_PRODUCT_SLE is not set=0A# CONFIG_=
SUSE_PRODUCT_OPENSUSE_LEAP is not set=0ACONFIG_SUSE_PRODUCT_OPENSUSE_TUMBLE=
WEED=3Dy=0A# CONFIG_SUSE_PRODUCT_ALP is not set=0ACONFIG_SUSE_PRODUCT_CODE=
=3D3=0ACONFIG_SUSE_VERSION=3D0=0ACONFIG_SUSE_PATCHLEVEL=3D0=0ACONFIG_SUSE_A=
UXRELEASE=3D0=0A# CONFIG_SUSE_KERNEL_SUPPORTED is not set=0A# CONFIG_SUSE_K=
ERNEL_RELEASED is not set=0A# end of SUSE Release Details=0A
--ai25nyuffhvsi3e6--

