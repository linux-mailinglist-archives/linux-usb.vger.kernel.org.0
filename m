Return-Path: <linux-usb+bounces-37312-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Nc2JNwAA2rdzQEAu9opvQ
	(envelope-from <linux-usb+bounces-37312-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:28:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1086B51E8CF
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AD853030EBF
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 10:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BAF349CE1;
	Tue, 12 May 2026 10:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMoAj86C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F502395ADA
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581647; cv=none; b=YVzQRhB3AUygnuYX6qyYBiMm9BI3ULMKVtqc1HOEfNNvxSIDDktL+pXLQxh1fUf8V5rlD9VHC/scRLdGvQIJNhDHjxDkZ7oBldpbizmA6bBiqlrBmKSLqjaTDx4IIYrSJMI5pbwGZGjF+c9VJW2/D786YUiZuPYPPuXb2+cPgLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581647; c=relaxed/simple;
	bh=W+WhNQT44HpyH9MIULAVlV+Yezb+cdmFLl1aeW02r60=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hBM0NbVnvbMB72z9VDpafpCl33eGsi0HpB4pfKUzJCuIXxAgFRbj43pgxEh0kJRP24igUpJzW6A7iaNsvu91UAU+s7QeqQqvAN/dFMR7KFBBnT1mLFds3btTPvjjkTBYtuwqHmIOeRPl+w7RONXp75ayXQJL9Bj8I3YPwy/Rwgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMoAj86C; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38be5e86918so66685211fa.3
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 03:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778581643; x=1779186443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJdK1zQJgBLQtctVzhMa5WE1xxqsHJjVUuaNIl8Gl6k=;
        b=gMoAj86CdXFpRTs5gUYYiAXOWmIasLRBjNzeFtypJZnmM+xZZ9rUelzBqsUYqEvW9p
         1YYEHUXVvryY6jlhJ3v0J7TSk10n7+Js0TiYxGQi2btStkIA5ieviuPC1v8OZG9fc7Xu
         aypQgkkUnA+9MX8ahHqwRYPw0KAZW8O6VCyDZC9L5WeZffyIppeZQY0oHjveeOEE63Z/
         M+5Uq8LuaMBbaym63BBHMZP8XDaugziMGIHF2rLZtUERVbY+v+eH9O4kWH6GQUKa8ERh
         kEei/dtiSfC2BXrwy6R7JLqCL3nlF54aUOCOpJn6eLLYN+JD5TOcChabCXXEQPYKA96C
         zfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778581643; x=1779186443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jJdK1zQJgBLQtctVzhMa5WE1xxqsHJjVUuaNIl8Gl6k=;
        b=clxzC/TRIAFTQYzh+mEcM7UtlLUyz0MyMAQdpi1Oxbv8uzAo18FIZav+XeBhupas8o
         xBt37SxISl9UPZZS9h4RiU9ILVZiGcX+f/Hu+tpfrxVFixzywqx7HEEMyRrFmrkaeQcN
         rHOQumbfLcu2uq+FncKAJdkmXgxpVI/aJbIQUAxqdQRKTcBkyLYLXrOEe/YgHfobD9Sa
         iQZ0B749qbH5P3Z+F4wOfWp9uHbllUjKMWSM7LmZd9DVm10qYLm1kbeIRstCuT3f/l+X
         Qvn3oRkwXJCIhaVV2wcHlN7hwWTFyflgbMsfEaNieqonRln7KW6s/qPxoJe0GDH9/jR+
         0LQg==
X-Gm-Message-State: AOJu0YyxKy5PtSOjMTru3KW6IxfTZ+eizgNAXVyIOlnz2zWYSQH1WBqE
	dH/F2xlQY+Ofmgt/PzGKkeuzajUgxVkDLM1Rl2KLJCQuvfC0gNIci+tnE3MozQ==
X-Gm-Gg: Acq92OELr5QTOwgHviFCz7Zim8rxrVunYF3EUca9ujNAYXGemn7td9ctXgGWuslfhW4
	Sgk6N/XXKphOAC/EbQGd9nrTsnAGnAn+S1JlrmOWMtuCdFOVMfAihhdHTtU0TEiDtdXKwqiTglm
	fldKYg3oG7oGR4xi9hEoJ2EqAdfi2Il5MPi864kPrKMEEMUvJ2a0lCyt/i71qdt+o3H4CB2+ISF
	vneSY5a3j9Uucu5A5e35n6zJi1I/4pWJCd6HynGa9CHJqQVVJ+yqYWm8kib6STrRp3mGz4mllDc
	htEbQITsHlpKiTu3kMrGrf7HHH3A+h5ZiSQVh9ADo8xvXfdxLUxqw+sFw54yrTvvm0sP1hKQvE4
	XKfAxyEELjVB989vI3KCdgMW/3FOhOvRKmzJQLeJGTa73KFenKsvljC1MnAssiUIiFzuubizmPw
	3fLOrT+Yd+g+/P0q5DpkCYsrut8nRZDwXV
X-Received: by 2002:a05:651c:255a:20b0:393:4e44:63ba with SMTP id 38308e7fff4ca-393c4328139mr79502781fa.29.1778581643085;
        Tue, 12 May 2026 03:27:23 -0700 (PDT)
Received: from foxbook (bgw15.neoplus.adsl.tpnet.pl. [83.28.86.15])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f628ef7fsm32442751fa.40.2026.05.12.03.27.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 May 2026 03:27:22 -0700 (PDT)
Date: Tue, 12 May 2026 12:27:19 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Anders Thomson <andtho888@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: renesas 1912:0014 failures
Message-ID: <20260512122719.51338042.michal.pecio@gmail.com>
In-Reply-To: <CAGwGCQ+YFkxxnnbSKbSWC7wsh5ORAT=5riqHJrwsimtqFCuKYw@mail.gmail.com>
References: <CAGwGCQ+YFkxxnnbSKbSWC7wsh5ORAT=5riqHJrwsimtqFCuKYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1086B51E8CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37312-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, 6 May 2026 14:58:44 +0200, Anders Thomson wrote:
> Hi,
> 
> I've received a Renesas pcie usb3 card which fails to suspend (to ram)
> correctly.
> 
> Regular boots appear to be working fine, but upon resuming from
> suspend, I get this log:
> 
> [  461.824899] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [  461.824902] rcu:     3-...0: (3 ticks this GP)
> idle=0884/1/0x4000000000000000 softirq=2388/2389 fqs=5249
> [  461.824907] rcu:     (detected by 1, t=21002 jiffies, g=5201, q=24 ncpus=4)
> [  461.824910] Sending NMI from CPU 1 to CPUs 3:
> [  461.824917] NMI backtrace for cpu 3
> [  461.824922] CPU: 3 UID: 0 PID: 513 Comm: kworker/u18:6 Tainted: G S
>                  7.0.3 #2 PREEMPT(full)
> [  461.824926] Tainted: [S]=CPU_OUT_OF_SPEC
> [  461.824927] Hardware name: HP-Pavilion FJ422AA-UUW
> a6551.sc/Benicia, BIOS 5.32    10/23/2008
> [  461.824929] Workqueue: async async_run_entry_fn
> [  461.824936] RIP: 0010:xhci_resume+0x3fe/0x5a0
> [  461.824941] Code: 04 f6 c4 08 74 5a 41 bd 7b 6f 98 00 eb 21 49 83
> ed 01 0f 84 a0 01 00 00 bf c7 10 00 00 e8 1a fa 3e 00 f3 90 48 8b 04
> 24 8b 00 <f6> c4 08 74 31 83 f8 ff 75 da b8 ed ff ff ff 48 8b 0b 89 c2
> 48 c7
> [  461.824943] RSP: 0000:ffff9ed3003ebd68 EFLAGS: 00000082
> [  461.824945] RAX: 0000000000000801 RBX: ffff9112c241a250 RCX: ffff9ed30043e024
> [  461.824947] RDX: 0000000000000987 RSI: 0000000000000003 RDI: 0000000bf69fa402
> [  461.824948] RBP: ffff9112c241a000 R08: 0000000000000960 R09: 0000000000000003
> [  461.824950] R10: 0000000000000003 R11: ffffffff95258f20 R12: 0000000000000000
> [  461.824951] R13: 0000000000268925 R14: ffff9112c241a290 R15: 0000000000000000
> [  461.824952] FS:  0000000000000000(0000) GS:ffff9113e6604000(0000)
> knlGS:0000000000000000
> [  461.824954] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  461.824956] CR2: 0000000000000000 CR3: 000000000faeb000 CR4: 00000000000006f0
> [  461.824957] Call Trace:
> [  461.824960]  <TASK>
> [  461.824963]  resume_common+0x89/0xd0
> [  461.824968]  ? __pfx_pci_pm_resume+0x10/0x10
> [  461.824973]  dpm_run_callback+0x3d/0x160
> [  461.824977]  ? dpm_wait_for_superior+0xf7/0x150
> [  461.824981]  device_resume+0x158/0x250
> [  461.824984]  async_resume+0x14/0x20
> [  461.824987]  async_run_entry_fn+0x21/0xa0
> [  461.824991]  process_one_work+0x163/0x370
> [  461.824994]  worker_thread+0x18f/0x300
> [  461.824997]  ? __pfx_worker_thread+0x10/0x10
> [  461.824999]  kthread+0xda/0x110
> [  461.825003]  ? __pfx_kthread+0x10/0x10
> [  461.825006]  ret_from_fork+0x1af/0x2b0
> [  461.825009]  ? __pfx_kthread+0x10/0x10
> [  461.825012]  ret_from_fork_asm+0x1a/0x30
> [  461.825017]  </TASK>
> [  462.302911] rcu: INFO: rcu_preempt detected expedited stalls on
> CPUs/tasks: { 3-...D } 21425 jiffies s: 365 root: 0x8/.
> [  462.302917] rcu: blocking rcu_node structures (internal RCU debug):
> [  462.302919] Sending NMI from CPU 1 to CPUs 3:
> [  462.302922] NMI backtrace for cpu 3
> [  462.302925] CPU: 3 UID: 0 PID: 513 Comm: kworker/u18:6 Tainted: G S
>                  7.0.3 #2 PREEMPT(full)
> [  462.302928] Tainted: [S]=CPU_OUT_OF_SPEC
> [  462.302929] Hardware name: HP-Pavilion FJ422AA-UUW
> a6551.sc/Benicia, BIOS 5.32    10/23/2008
> [  462.302930] Workqueue: async async_run_entry_fn
> [  462.302933] RIP: 0010:xhci_resume+0x3fe/0x5a0
> [  462.302936] Code: 04 f6 c4 08 74 5a 41 bd 7b 6f 98 00 eb 21 49 83
> ed 01 0f 84 a0 01 00 00 bf c7 10 00 00 e8 1a fa 3e 00 f3 90 48 8b 04
> 24 8b 00 <f6> c4 08 74 31 83 f8 ff 75 da b8 ed ff ff ff 48 8b 0b 89 c2
> 48 c7
> [  462.302938] RSP: 0000:ffff9ed3003ebd68 EFLAGS: 00000082
> [  462.302940] RAX: 0000000000000801 RBX: ffff9112c241a250 RCX: ffff9ed30043e024
> [  462.302941] RDX: 0000000000000987 RSI: 0000000000000003 RDI: 0000000c3b0074cb
> [  462.302943] RBP: ffff9112c241a000 R08: 0000000000000960 R09: 0000000000000003
> [  462.302944] R10: 0000000000000003 R11: ffffffff95258f20 R12: 0000000000000000
> [  462.302945] R13: 000000000023f18b R14: ffff9112c241a290 R15: 0000000000000000
> [  462.302947] FS:  0000000000000000(0000) GS:ffff9113e6604000(0000)
> knlGS:0000000000000000
> [  462.302949] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  462.302950] CR2: 0000000000000000 CR3: 000000000faeb000 CR4: 00000000000006f0
> [  462.302951] Call Trace:
> [  462.302952]  <TASK>
> [  462.302953]  resume_common+0x89/0xd0
> [  462.302957]  ? __pfx_pci_pm_resume+0x10/0x10
> [  462.302961]  dpm_run_callback+0x3d/0x160
> [  462.302964]  ? dpm_wait_for_superior+0xf7/0x150
> [  462.302967]  device_resume+0x158/0x250
> [  462.302970]  async_resume+0x14/0x20
> [  462.302974]  async_run_entry_fn+0x21/0xa0
> [  462.302977]  process_one_work+0x163/0x370
> [  462.302980]  worker_thread+0x18f/0x300
> [  462.302983]  ? __pfx_worker_thread+0x10/0x10
> [  462.302985]  kthread+0xda/0x110
> [  462.302988]  ? __pfx_kthread+0x10/0x10
> [  462.302991]  ret_from_fork+0x1af/0x2b0
> [  462.302993]  ? __pfx_kthread+0x10/0x10
> [  462.302997]  ret_from_fork_asm+0x1a/0x30
> [  462.303001]  </TASK>
> [  468.932307] xhci-pci-renesas 0000:03:00.0: Controller not ready at
> resume -110
> [  468.932332] clocksource: Long readout interval, skipping watchdog
> check: cs_nsec: 26925372067 wd_nsec: 26925364392
> [  468.932394] xhci-pci-renesas 0000:03:00.0: PCI post-resume error -110!
> [  468.932401] xhci-pci-renesas 0000:03:00.0: HC died; cleaning up
> [  468.932429] xhci-pci-renesas 0000:03:00.0: PM: dpm_run_callback():
> pci_pm_resume returns -110
> [  468.932434] xhci-pci-renesas 0000:03:00.0: PM: failed to resume
> async: error -110

That's waiting 10 seconds with IRQs disabled for USBSTS.CNR to clear.
Sadly, a70bcbc322837 doesn't explain why such long timeout was used.

That being said, this bit should clear, so something is wrong.

Similar 0015 controllers have the RESET_ON_RESUME quirk applied. Sadly
again, the reason isn't documented in all detail we could wish for.
The quirk would apparently try a reset without looking at CNR (which is
frankly a spec violation) and only then test CNR.

Wonder if xhci_hcd.quirks=0x80 boot parameter would make a difference?

> This is on vanilla 7.0.3. If I add the firmware (renesas_usb_fw.mem,
> sha256=177560c224c73...)  it fails to load on boot and I get a massive
> stall in bootup:
> 
> [    0.374764] pci 0000:00:1c.1: enabling device (0106 -> 0107)
> [    6.295099] pci 0000:03:00.0: xHCI HW not ready after 5 sec (HC
> bug?) status = 0x801
> [    6.295198] pci 0000:03:00.0: quirk_usb_early_handoff+0x0/0x700
> took 5781678 usecs

That's early boot, presence of FW files shouldn't have any effect.
Perhaps it happens *after* failing to load FW or loading wrong one,
then rebooting without power cycle or something like that?

Regards,
Michal

