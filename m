Return-Path: <linux-usb+bounces-37010-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPIWGC47+2nUXwMAu9opvQ
	(envelope-from <linux-usb+bounces-37010-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 14:59:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 052744DAA12
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 14:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63E713007523
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 12:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3C03FD15D;
	Wed,  6 May 2026 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOioIeFp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C30B4657E2
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072347; cv=pass; b=Ji6VObAuX7PUlppFV9VE6QOv67fJfuje93J5K2Bv/dWNV340klhXsOen69bAej1Qw3twAIqDf4NrTrHfK6ItsOX56NGWOuNKpvwimuHUVFy+3ugBtEf/qx1pIVX5WnnxMp9f59u221k0gtn6ajEOMG/a6Hq90Ssxwl3MI7Bn9PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072347; c=relaxed/simple;
	bh=+Hx03LX3ERxSUmxxeG2Buk+asYmMS/+LFWilCg5Tnig=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=e74M67V4VYikddruxlP9uJimA+sgx/kblRlSnJzcBbMppM5WegmwZhL328nseTrv+b3PgG76qTzqwM9oojATYBwITODRJfKUJPVl9xRNZvAdOxUssx1OtRFUnuHymzjNv1mF12i2JL7+u2XO9cHQr3EAgD7bhGL5Da1igO7v5N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOioIeFp; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3938cc204a7so35579001fa.1
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 05:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778072335; cv=none;
        d=google.com; s=arc-20240605;
        b=GIjI5qlLNQQJmWAn6u9HhttqcDUtbHjVXz97Cna5SgeVb/X6nrUZgu7E9jC0RO6muT
         3jBcmvFBfh9xd1jLqNe0vg96l+1aXXHoFnv1fQ320+2FmPCCTmbISDcDb6fO+MXO8v3n
         fY98fUYqRc16DdHTjh8TAp9qFcGFoGWy1tt2qPWfusBtIgEiBLNDBk4ZI63WZXMxb3SV
         vFLduvL09Vgo2aLNl6EzWXeP+u6XVkD7GyOHq/nCuVCZbI+7i3x9GaG6UCfCXZvx+YVz
         bWgu37vdJDxwYVR1JNmcf0wDdHg/YD2KXngM5U4ZqaGR8WrEVwwaETfkekJIugChvFdf
         GL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=z96FRdcWpbZQypxJhxKQjOilmeJ8ceKaXXibrqLpPCw=;
        fh=DMNDAWYQqGA/XIoZKngBVbNSBQF3MbZ9rIrZ9629+60=;
        b=RX8ZyxyTdh342NaKKUMe12+pKKJozFSdavP6HmwKrOr47OAt/dCd/vO//oIwfP3fk/
         57vBsBQqIwDAiZ3gNO2OIoXiJxEMxqzs8bywlAEDAv0yqaHWaOjU/s/1g3mw8EOlXa3a
         mQ/U8AalZp25fGtMKdcDgF4vpDXlmQLcYkIcgQrLzFg2aQA7dJ4dXjNb/VtiqxgEM5OT
         UV0njZ0YTDWhoXnE8bqNhoaw5zsNUGTZewAGUu2YmEuhxeJXB+XfznU1SSxKn6JH4NR9
         RzAw3+2z1Xya2pKgLqvJEs9LeuSsHbEBbOtEnoSgbEKxRpkOE+LE0rUH5KBvdXt2as5W
         Ha1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778072335; x=1778677135; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z96FRdcWpbZQypxJhxKQjOilmeJ8ceKaXXibrqLpPCw=;
        b=rOioIeFpzycDR/tChrRqTknEOUli3laGi4P/s82AzKEiFp4amJSaNyepxilvjSd8Rc
         JkWdRsMvP8u8ABO+nnIW7Nwb0/qNc29/C8fkxRBjmfKy3v1hs+hp4M97OyEtzcdi2MdQ
         POMsnfgsyOELBlLQwayBovVmQrdXT0866plQIihihE1VHsIBHHooDSc0eumCKNj/1Dnu
         Ava4bPPq7LvVjVCbsoyuN45OoIY9g3CLG5+81HUmFWTEaazcxgnNJUY0quRKjx+WfmKD
         b3w0NydMy/7N/z6dH21T95Q3ghQuQlSUBKyTxq8e+b98ebt5FtVM+GCNlSELG1YoYIv/
         4o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072335; x=1778677135;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z96FRdcWpbZQypxJhxKQjOilmeJ8ceKaXXibrqLpPCw=;
        b=FyeIwBybbvQq4hBYWwLDe1ZtDy9ABqn+QOpACJ+uG02g7+yb/wvbpaNh/BHnfAWgux
         J2+52eQIOFqU6+LJA7c4b5z8tZhTUe8CdC5Lf97AMeLB9uhPj/arAskphdDdm5SNAZ7h
         0Dmp7B2soXgLrkbnSPr6srF8P9ugOzw6IqYa5N2GsYqPDasJz9dBpe7mdG15yhIDQc7Q
         y0/1BuFEbucG2VAmR82d5JbFODPugxGZHp7qrj7KrUa+NkdCly1Zsgn9t3sQD2qo6nOr
         hT1KTz4fLQ2iSNOuwtxFhBYTNSBURD+9yzOL7b2htbsm5EPIfDfp/r2PWBgrtOKsVWWm
         E/7Q==
X-Gm-Message-State: AOJu0Yx/PZ24QN5SdTiGVTuCLZAMChaA0LoKkyI1n9v3y/SW8W+iobqW
	dO2EzdKCRnnJ0J2ALHL1bxipo6YODTRyvAMLO8HVjzwW2Hn9k5dj1iomTNxKTArbzVlvKoHMK2h
	aMQOl4hDdqL2etGSsUlcEeEhgeZeo3sYIqN2d
X-Gm-Gg: AeBDiet1W2Ya3G/phQE4H0XGVAHjY8X/nQipdDWsOhmf7M5k7u8x6oTlISTlCMVEoqM
	HuSChF8D+rGIYZxBv/dwZKk+EDW+mnfYrjVcIb7ynIsoom/VepcUItaNiM5tQWzyq9DjVws950x
	jCKdM9mlTDPw6ehJYL3ARMsSHdTQg3+7kGeeP4DonQXTgm4VagWOe2Gzowj63QY4kRycQdexEAh
	2i9Q1avKAsolBf5rj+Ev9VLiqyBiViDawxisGOZ/coZy350YAztPO+9kfO0P+MZmD1W/mdI7NqN
	evMeGHoSmpE9m8O8Jg==
X-Received: by 2002:a05:651c:35cc:b0:393:af02:960a with SMTP id
 38308e7fff4ca-393c4348026mr14087781fa.31.1778072335085; Wed, 06 May 2026
 05:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Anders Thomson <andtho888@gmail.com>
Date: Wed, 6 May 2026 14:58:44 +0200
X-Gm-Features: AVHnY4IiW264XPejspgLxrqXq3LipKrHSEcpAHvKtw9oYsmsXz_WqbRtLH_0ydA
Message-ID: <CAGwGCQ+YFkxxnnbSKbSWC7wsh5ORAT=5riqHJrwsimtqFCuKYw@mail.gmail.com>
Subject: renesas 1912:0014 failures
To: linux-usb@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 052744DAA12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	RECEIVED_BLOCKLISTDE(3.00)[209.85.208.171:received];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	TAGGED_FROM(0.00)[bounces-37010-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.665];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andtho888@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,a6551.sc:url]

Hi,

I've received a Renesas pcie usb3 card which fails to suspend (to ram)
correctly.

Regular boots appear to be working fine, but upon resuming from
suspend, I get this log:

[  461.824899] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  461.824902] rcu:     3-...0: (3 ticks this GP)
idle=0884/1/0x4000000000000000 softirq=2388/2389 fqs=5249
[  461.824907] rcu:     (detected by 1, t=21002 jiffies, g=5201, q=24 ncpus=4)
[  461.824910] Sending NMI from CPU 1 to CPUs 3:
[  461.824917] NMI backtrace for cpu 3
[  461.824922] CPU: 3 UID: 0 PID: 513 Comm: kworker/u18:6 Tainted: G S
                 7.0.3 #2 PREEMPT(full)
[  461.824926] Tainted: [S]=CPU_OUT_OF_SPEC
[  461.824927] Hardware name: HP-Pavilion FJ422AA-UUW
a6551.sc/Benicia, BIOS 5.32    10/23/2008
[  461.824929] Workqueue: async async_run_entry_fn
[  461.824936] RIP: 0010:xhci_resume+0x3fe/0x5a0
[  461.824941] Code: 04 f6 c4 08 74 5a 41 bd 7b 6f 98 00 eb 21 49 83
ed 01 0f 84 a0 01 00 00 bf c7 10 00 00 e8 1a fa 3e 00 f3 90 48 8b 04
24 8b 00 <f6> c4 08 74 31 83 f8 ff 75 da b8 ed ff ff ff 48 8b 0b 89 c2
48 c7
[  461.824943] RSP: 0000:ffff9ed3003ebd68 EFLAGS: 00000082
[  461.824945] RAX: 0000000000000801 RBX: ffff9112c241a250 RCX: ffff9ed30043e024
[  461.824947] RDX: 0000000000000987 RSI: 0000000000000003 RDI: 0000000bf69fa402
[  461.824948] RBP: ffff9112c241a000 R08: 0000000000000960 R09: 0000000000000003
[  461.824950] R10: 0000000000000003 R11: ffffffff95258f20 R12: 0000000000000000
[  461.824951] R13: 0000000000268925 R14: ffff9112c241a290 R15: 0000000000000000
[  461.824952] FS:  0000000000000000(0000) GS:ffff9113e6604000(0000)
knlGS:0000000000000000
[  461.824954] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  461.824956] CR2: 0000000000000000 CR3: 000000000faeb000 CR4: 00000000000006f0
[  461.824957] Call Trace:
[  461.824960]  <TASK>
[  461.824963]  resume_common+0x89/0xd0
[  461.824968]  ? __pfx_pci_pm_resume+0x10/0x10
[  461.824973]  dpm_run_callback+0x3d/0x160
[  461.824977]  ? dpm_wait_for_superior+0xf7/0x150
[  461.824981]  device_resume+0x158/0x250
[  461.824984]  async_resume+0x14/0x20
[  461.824987]  async_run_entry_fn+0x21/0xa0
[  461.824991]  process_one_work+0x163/0x370
[  461.824994]  worker_thread+0x18f/0x300
[  461.824997]  ? __pfx_worker_thread+0x10/0x10
[  461.824999]  kthread+0xda/0x110
[  461.825003]  ? __pfx_kthread+0x10/0x10
[  461.825006]  ret_from_fork+0x1af/0x2b0
[  461.825009]  ? __pfx_kthread+0x10/0x10
[  461.825012]  ret_from_fork_asm+0x1a/0x30
[  461.825017]  </TASK>
[  462.302911] rcu: INFO: rcu_preempt detected expedited stalls on
CPUs/tasks: { 3-...D } 21425 jiffies s: 365 root: 0x8/.
[  462.302917] rcu: blocking rcu_node structures (internal RCU debug):
[  462.302919] Sending NMI from CPU 1 to CPUs 3:
[  462.302922] NMI backtrace for cpu 3
[  462.302925] CPU: 3 UID: 0 PID: 513 Comm: kworker/u18:6 Tainted: G S
                 7.0.3 #2 PREEMPT(full)
[  462.302928] Tainted: [S]=CPU_OUT_OF_SPEC
[  462.302929] Hardware name: HP-Pavilion FJ422AA-UUW
a6551.sc/Benicia, BIOS 5.32    10/23/2008
[  462.302930] Workqueue: async async_run_entry_fn
[  462.302933] RIP: 0010:xhci_resume+0x3fe/0x5a0
[  462.302936] Code: 04 f6 c4 08 74 5a 41 bd 7b 6f 98 00 eb 21 49 83
ed 01 0f 84 a0 01 00 00 bf c7 10 00 00 e8 1a fa 3e 00 f3 90 48 8b 04
24 8b 00 <f6> c4 08 74 31 83 f8 ff 75 da b8 ed ff ff ff 48 8b 0b 89 c2
48 c7
[  462.302938] RSP: 0000:ffff9ed3003ebd68 EFLAGS: 00000082
[  462.302940] RAX: 0000000000000801 RBX: ffff9112c241a250 RCX: ffff9ed30043e024
[  462.302941] RDX: 0000000000000987 RSI: 0000000000000003 RDI: 0000000c3b0074cb
[  462.302943] RBP: ffff9112c241a000 R08: 0000000000000960 R09: 0000000000000003
[  462.302944] R10: 0000000000000003 R11: ffffffff95258f20 R12: 0000000000000000
[  462.302945] R13: 000000000023f18b R14: ffff9112c241a290 R15: 0000000000000000
[  462.302947] FS:  0000000000000000(0000) GS:ffff9113e6604000(0000)
knlGS:0000000000000000
[  462.302949] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  462.302950] CR2: 0000000000000000 CR3: 000000000faeb000 CR4: 00000000000006f0
[  462.302951] Call Trace:
[  462.302952]  <TASK>
[  462.302953]  resume_common+0x89/0xd0
[  462.302957]  ? __pfx_pci_pm_resume+0x10/0x10
[  462.302961]  dpm_run_callback+0x3d/0x160
[  462.302964]  ? dpm_wait_for_superior+0xf7/0x150
[  462.302967]  device_resume+0x158/0x250
[  462.302970]  async_resume+0x14/0x20
[  462.302974]  async_run_entry_fn+0x21/0xa0
[  462.302977]  process_one_work+0x163/0x370
[  462.302980]  worker_thread+0x18f/0x300
[  462.302983]  ? __pfx_worker_thread+0x10/0x10
[  462.302985]  kthread+0xda/0x110
[  462.302988]  ? __pfx_kthread+0x10/0x10
[  462.302991]  ret_from_fork+0x1af/0x2b0
[  462.302993]  ? __pfx_kthread+0x10/0x10
[  462.302997]  ret_from_fork_asm+0x1a/0x30
[  462.303001]  </TASK>
[  468.932307] xhci-pci-renesas 0000:03:00.0: Controller not ready at
resume -110
[  468.932332] clocksource: Long readout interval, skipping watchdog
check: cs_nsec: 26925372067 wd_nsec: 26925364392
[  468.932394] xhci-pci-renesas 0000:03:00.0: PCI post-resume error -110!
[  468.932401] xhci-pci-renesas 0000:03:00.0: HC died; cleaning up
[  468.932429] xhci-pci-renesas 0000:03:00.0: PM: dpm_run_callback():
pci_pm_resume returns -110
[  468.932434] xhci-pci-renesas 0000:03:00.0: PM: failed to resume
async: error -110


This is on vanilla 7.0.3. If I add the firmware (renesas_usb_fw.mem,
sha256=177560c224c73...)  it fails to load on boot and I get a massive
stall in bootup:

[    0.374764] pci 0000:00:1c.1: enabling device (0106 -> 0107)
[    6.295099] pci 0000:03:00.0: xHCI HW not ready after 5 sec (HC
bug?) status = 0x801
[    6.295198] pci 0000:03:00.0: quirk_usb_early_handoff+0x0/0x700
took 5781678 usecs

followed by:
[    8.238859] sr 5:0:0:0: Attached scsi generic sg4 type 5
[   66.649786] xhci-pci-renesas 0000:03:00.0: failed to load firmware
renesas_usb_fw.mem, fallback to ROM
[   66.649936] xhci-pci-renesas 0000:03:00.0: xHCI Host Controller
[   66.650039] xhci-pci-renesas 0000:03:00.0: new USB bus registered,
assigned bus number 9
[   95.065505] xhci-pci-renesas 0000:03:00.0: can't setup: -110
[   95.065555] xhci-pci-renesas 0000:03:00.0: USB bus 9 deregistered
[   95.065680] xhci-pci-renesas 0000:03:00.0: init 0000:03:00.0 fail, -110
[   95.065739] xhci-pci-renesas 0000:03:00.0: probe with driver
xhci-pci-renesas failed with error -110

After which the usb root devices are not present (according to lsusb).

Any idea how this can be fixed? I also tried the
https://github.com/markusj/upd72020x-load.git loader, but that didn't
change the situation.

Thanks in advance.
Anders

