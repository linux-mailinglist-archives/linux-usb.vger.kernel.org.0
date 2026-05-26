Return-Path: <linux-usb+bounces-38072-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNsyKhDyFWp7fQcAu9opvQ
	(envelope-from <linux-usb+bounces-38072-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 21:18:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E305DBE5D
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 21:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 410D9303635C
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 19:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2371C3C13E6;
	Tue, 26 May 2026 19:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pUB6xy3L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E0D3C1994
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 19:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779822738; cv=pass; b=Et0FTYJXwPWXUX0GlFBt7FQAPwIuN64/OAaAO4KaTG60wdQHXQZPV4Mw1x0IYjzD3WvamTBNDDgIaUXp0LT9qwPbS1HTeKszoU4NDP7625OatvhWhnlMpf4Kr+5+lyK+siVN+YTFZDDvU/1HC2f39th86GuRuQDhzR4hifKJ3ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779822738; c=relaxed/simple;
	bh=aiF8fG6BFn6ui2MZdXJ8W/PTadNodeen3LKVHWm6nSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YF3QO26el2IHpt6H4s54+PDqCRsP68WZpTr2icwgfE25XvsrmI57hbLQ82sryhGBtspbzernNdhgonElV6cPU72FekPrk9QhywLkm7pwFyDi+hDUon08h57q9zCz+RsffVYv94SaD3hFrwknHgHBHy8Yclhjsjsooib5313OOKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pUB6xy3L; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39397d63804so58917651fa.2
        for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 12:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779822734; cv=none;
        d=google.com; s=arc-20240605;
        b=BUBykwSNv7MDcj3cBOBLzxt0hX3AiIJc9+1WVuTUyFLGVMbUicewbXAG9v77tBGk0F
         tcEw2HdNNBLmiR5S6PvG38fig25pYZGO0INy9HwuqBGIFC/EFQhrbBYFPnMMPjSoaXki
         8yhRFgyUsZJjN56U5O0ey0BCOOYNqVeVZOumRKR57NF9LjBawismmloJgGjhU6d7Ukc7
         W6C3AyKa7kGGtlQeT2XCkqz+LADGAYs5W1PbpjciI/y7MOYfBcO1AfVEb8azhLrkdJm1
         0lcObrC7wNA6N+EuHnJDl5clvOyoAiwswnVfiylA7IJwJZ84xJBjjpv2ueFxN1Tc1u2x
         Rgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iSORlCrsECXKalN8WGdeklBADHTM4Z7NlX/OTwwcOfg=;
        fh=DN19s0ibwwfJeGavrSM1cHit2/YwAmBInLLPIvjttCQ=;
        b=feuKD7ya3EzM20vzA/Wl8UmWbuNk41P6gLG2TDtY0fst37bq/m8mLeKuHd73cdr2n2
         MvikybDMOO+UhT3R0DI6TZpyAgw7kCh2Lj4NA7Q7Wq0gFe71WLzEskf1fMQXpbjq3VuT
         64aMtmRjzEh+E30+5LvExpuOTEstefwdHENQLTmWbCrzw0Hx522PFEpT2XaVAuQl+KFL
         noH/cuPJTTVvGgZTb1cXdqToSyTCoPXdADtqZPMqePcJep6q7IGbp8MEHsnohxIGTEQa
         8y6oQ4SmVkYw9wJzoM++K3CamRkI/3RwR7vjp3sjeQr6AXR3Bx101iLxr7czZeoARgIG
         xFUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779822734; x=1780427534; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iSORlCrsECXKalN8WGdeklBADHTM4Z7NlX/OTwwcOfg=;
        b=pUB6xy3LoUv8UdJ9ekHd+cUiePnWecgM4bATz5g1epqYGMepGJQPTZ1Iok4FABb5n0
         KyUOdAMcITwyCP0XeREwOckFyn9wjszpyEZIC0SxsZjSCI5t4HNkzBWThLC8FcO9Lt/Q
         e1F8MDW+iRn11jJsSvPbugdKKVkBA3STldYudCWVOiHJ5f3pKht6F1VwbCnKwl+PtJZB
         AL0piKi90IiRl+5OTiNpf6FPJRlB5FTK7XnIRbF/EWOEBqjKgSVDRlgmymGkOQHxPOK6
         aOjHtRxR8Fh908q7i77w5BGNWpZv1ss1mXwa7s4L1592MdZM4wSbapVtfQ++6vrhdfoS
         PWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779822734; x=1780427534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSORlCrsECXKalN8WGdeklBADHTM4Z7NlX/OTwwcOfg=;
        b=lZJTggR0uClbC6O2KNsMaLyWGXrfHC7NpaX+KbCkDVvA75xLle+2FUH7v/42OoNyGm
         Q1h3qxHF3a3OOiv7xOpP4nyG0dOpTmpLLc/fk1dGMqw6cy43QEKkXAOPHsiJRM7TkAI9
         N7/89zhUcIBS68zDJj/Y2IaSC69iL3A5lpxQqn9iThLmUWFv/W2eC4LTsmu0Pq6ejnJJ
         5Cl/bjINyE566Uq541th5FPeimnmgJ1Iaznd87Ia9giBl/R7VEzP1L/hQSQTk5zMSUaT
         7vGl28iKBzwzO1M/filk5fZYkXBGGFeK5jkFBmxQUJak5yg+wuvQpam8Dbby8gTeshYF
         SayA==
X-Gm-Message-State: AOJu0YwRcBX7X71aY9MDbS2gtwFK9m4gYuRgo/VFAsJiRB7ASrXJYcNj
	Vd742x+bLkGNUw8k1r9zNpPHY0UJtvT+4oega7ci79UdUPjgSAnlGaMsLq3Y+Yr4BLhq8MZpX56
	T0SPoQOEGbrL0V9zCsF14XglxFWBEEgWOeTE8
X-Gm-Gg: Acq92OF9kXhY7Uw8hOFs2eVcxoeE9RiqsuahMmXr/44stFTfHsDUcG907H7kaOW2NXx
	XN+pfJNxjK6zOB9RDIfanHwjKdniuFIPqsBt8OCV2mdqEYMYw5MvAQaUv5XhsRPIlkaff4GOdFJ
	wUN3xU/XP5v7yzDuRXMkRUQFBi5lLmGloYpANzH5V+wMH+LPUmIx2N51o5ekejmLRdHdbzSDOps
	wt88/+xHITU1PvbehYJTSqAea0dQD6b83UXcyPN9zqdTvx5lQ4LK5lOhdPfDC/RUZ4+oSMP0Qoo
	SnHX3lpfbhFp0XHVkQ==
X-Received: by 2002:a2e:a994:0:b0:396:28df:1133 with SMTP id
 38308e7fff4ca-39628df1db6mr6361241fa.16.1779822733497; Tue, 26 May 2026
 12:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGwGCQ+YFkxxnnbSKbSWC7wsh5ORAT=5riqHJrwsimtqFCuKYw@mail.gmail.com>
 <20260512122719.51338042.michal.pecio@gmail.com> <CAGwGCQLjcOkjgDZgxmL0gR6uVwmFjxJ22sMzBYRJLXrDtbZZCQ@mail.gmail.com>
 <20260512190203.5695eb7f.michal.pecio@gmail.com> <CAGwGCQJ5eOfuq2dKPSL1yocruT8prwns93sTvzAUVZTJ4CZsyg@mail.gmail.com>
 <20260518084648.00fdc77e.michal.pecio@gmail.com> <CAGwGCQKyRsyRE_HRCNYgBComN-cZU4SW0j-cq3OwqG=-VH4NKA@mail.gmail.com>
 <CAGwGCQJ6SaB_mLH5DGttVDXHvvNW9zrSnijwYxp2W4d_W40FRw@mail.gmail.com> <20260523183200.344d784f.michal.pecio@gmail.com>
In-Reply-To: <20260523183200.344d784f.michal.pecio@gmail.com>
From: Anders Thomson <andtho888@gmail.com>
Date: Tue, 26 May 2026 21:12:01 +0200
X-Gm-Features: AVHnY4LYLZ7RjoMwPHnXkngf6l0JlS4XdRRG_dVs4LZx8CwVNH0XUWcxhw3sdLU
Message-ID: <CAGwGCQ+_GLAPs5ew33Tk5g_0mz2z15d9Axo13MnB2e4p+QYP4Q@mail.gmail.com>
Subject: Re: renesas 1912:0014 failures
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38072-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andtho888@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: A3E305DBE5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > Some advances, perhaps. I _did_ get (twice) the boot to succeed with
> > the quirk (still with the 26 sec pause) . Both times was after a full
> > power cycle (PSU on/off). After a regular I/O Button press during, the
> > boot stalls. I'll run this a few times more to verify.
>
> xhci_hcd.quirks=0x80 should have no effect on anything besides
> suspend/resume. If you see differences in boot behavior, it probably
> is an effect of suspend/resume cycles performed or attempted during
> the previous boot. It seems that the chip gets into some bad state
> which requires a power cycle to fix. BTW, do you mean just turning off
> the computer, or disconnecting the PSU to remove standby power?
>
Ok. That can be the case. I did power cycle with the (240V presumably)
power button on the back of the case.
To be sure, I now disconnected the power cord for 6 hours, and it
subsequently  booted nicely with the quirk.

[    0.000000] Command line: root=/dev/sda2
init=/usr/lib/systemd/systemd mitigations=off xhci_hcd.quirks=0x80

<snip>

[   87.156173] EXT4-fs (dm-7): mounted filesystem
67bc6f66-1a28-49d3-b834-3a49777f62e6 r/w with ordered data mode. Quota
mode: none.
[   87.173234] systemd-tmpfile (363) used greatest stack depth: 12272 bytes left

Booted with no device attached. I now attach an old iPod
[   88.029820] EXT4-fs (dm-1): mounted filesystem
43370d08-08a3-44a6-9809-7de71d91213a r/w with ordered data mode. Quota
mode: none.
[  106.553175] EXT4-fs (dm-6): unmounting filesystem
aacac1ab-8727-4008-94ed-3997aa0c5cf2.
[  107.627798] EXT4-fs (dm-7): unmounting filesystem
67bc6f66-1a28-49d3-b834-3a49777f62e6.
[  161.704296] usb 9-4: new high-speed USB device number 2 using
xhci-pci-renesas
[  161.835336] usb 9-4: New USB device found, idVendor=05ac,
idProduct=1265, bcdDevice= 0.01
[  161.835411] usb 9-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  161.835461] usb 9-4: Product: iPod
[  161.835506] usb 9-4: Manufacturer: Apple Inc.
[  161.835553] usb 9-4: SerialNumber: 000A27001EAE1B01
[  161.854035] usb-storage 9-4:1.0: USB Mass Storage device detected
[  161.854251] scsi host8: usb-storage 9-4:1.0
[  162.907030] scsi 8:0:0:0: Direct-Access     Apple    iPod
  1.70 PQ: 0 ANSI: 0
[  162.907750] sd 8:0:0:0: Attached scsi generic sg10 type 0
[  162.909876] sd 8:0:0:0: [sdj] Spinning up disk...
[  167.320187] .ready
[  167.322136] sd 8:0:0:0: [sdj] 3901376 4096-byte logical blocks:
(16.0 GB/14.9 GiB)
[  167.322606] sd 8:0:0:0: [sdj] Write Protect is off
[  167.322662] sd 8:0:0:0: [sdj] Mode Sense: 68 00 00 08
[  167.322967] sd 8:0:0:0: [sdj] Write cache: disabled, read cache:
enabled, doesn't support DPO or FUA
[  167.341714]  sdj: sdj1
[  167.341905] sd 8:0:0:0: [sdj] Attached SCSI removable disk
[ 1488.464220] EXT4-fs (dm-1): unmounting filesystem
43370d08-08a3-44a6-9809-7de71d91213a.
[ 1713.180844] PM: suspend entry (deep)
[ 1713.273499] Filesystems sync: 0.092 seconds
[ 1713.276483] Freezing user space processes
[ 1713.299802] Freezing user space processes completed (elapsed 0.023 seconds)
[ 1713.299847] OOM killer disabled.
[ 1713.299893] Freezing remaining freezable tasks
[ 1713.300891] Freezing remaining freezable tasks completed (elapsed
0.000 seconds)
[ 1713.300957] printk: Suspending console(s) (use no_console_suspend to debug)
[ 1713.328404] r8169 0000:02:00.0 enp2s0: Link is Down
[ 1713.328917] sd 7:0:0:0: [sdf] Synchronizing SCSI cache
[ 1713.333896] sd 2:0:0:0: [sdc] Synchronizing SCSI cache
[ 1713.333911] sd 1:0:0:0: [sdb] Synchronizing SCSI cache
[ 1713.333913] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[ 1713.334139] ata1.00: Entering standby power mode
[ 1713.334373] ata3.00: Entering standby power mode
[ 1713.343045] sd 3:0:0:0: [sdd] Synchronizing SCSI cache
[ 1713.541048] ata4.00: Entering standby power mode
[ 1714.273447] ACPI: PM: Preparing to enter system sleep state S3
[ 1714.273740] ACPI: PM: Saving platform NVS memory
[ 1714.273978] Disabling non-boot CPUs ...
[ 1714.275460] smpboot: CPU 3 is now offline
[ 1714.278005] smpboot: CPU 2 is now offline
[ 1714.278085] kworker/u18:4 (76) used greatest stack depth: 11856 bytes left
[ 1714.280461] smpboot: CPU 1 is now offline
[ 1714.287892] ACPI: PM: Low-level resume complete
[ 1714.287921] ACPI: PM: Restoring platform NVS memory
[ 1714.288372] Enabling non-boot CPUs ...
[ 1714.288413] smpboot: Booting Node 0 Processor 1 APIC 0x1
[ 1714.299130] CPU1 is up
[ 1714.299159] smpboot: Booting Node 0 Processor 2 APIC 0x2
[ 1714.308608] CPU2 is up
[ 1714.308642] smpboot: Booting Node 0 Processor 3 APIC 0x3
[ 1714.317495] CPU3 is up
[ 1714.320878] ACPI: PM: Waking up from system sleep state S3
[ 1714.326900] hpet: Lost 5479 RTC interrupts
[ 1714.327867] usb usb1: root hub lost power or was reset
[ 1714.327926] usb usb4: root hub lost power or was reset
[ 1714.328019] usb usb5: root hub lost power or was reset
[ 1714.328071] usb usb6: root hub lost power or was reset
[ 1714.328122] usb usb7: root hub lost power or was reset
[ 1714.328172] usb usb8: root hub lost power or was reset
[ 1714.328305] usb usb9: root hub lost power or was reset
[ 1714.328307] usb usb10: root hub lost power or was reset
[ 1714.717925] ata6: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[ 1714.718977] ata5: SATA link down (SStatus 0 SControl 300)
[ 1714.767957] ata6.00: configured for UDMA/33
[ 1719.766758] ata4: link is slow to respond, please be patient (ready=0)
[ 1719.768733] ata1: link is slow to respond, please be patient (ready=0)
[ 1722.777758] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[ 1722.778469] sd 0:0:0:0: [sda] Starting disk
[ 1722.780092] ata1.00: configured for UDMA/133
[ 1723.235745] ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[ 1725.103942] sd 3:0:0:0: [sdd] Starting disk
[ 1725.107308] ata4.00: configured for UDMA/133
[ 1735.329691] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[ 1735.329695] rcu:     3-...0: (1 GPs behind)
idle=ce4c/1/0x4000000000000000 softirq=63254/63255 fqs=5249
[ 1735.329701] rcu:     (detected by 0, t=21002 jiffies, g=47065, q=31 ncpus=4)
[ 1735.329705] Sending NMI from CPU 0 to CPUs 3:
[ 1735.329711] NMI backtrace for cpu 3
[ 1735.329716] CPU: 3 UID: 0 PID: 1075 Comm: kworker/u18:0 Tainted: G
S                  7.0.3 #6 PREEMPT(full)
[ 1735.329720] Tainted: [S]=CPU_OUT_OF_SPEC
[ 1735.329721] Hardware name: HP-Pavilion FJ422AA-UUW
a6551.sc/Benicia, BIOS 5.32    10/23/2008
[ 1735.329723] Workqueue: async async_run_entry_fn
[ 1735.329730] RIP: 0010:xhci_handshake+0x51/0xc0
[ 1735.329735] Code: fa 8b 07 89 f1 49 89 fe 41 89 f5 21 c1 41 39 cc
75 22 eb 3c f3 90 48 81 eb e9 03 00 00 48 89 da 48 c1 ea 3f 44 21 fa
41 8b 06 <44> 89 e9 21 c1 44 39 e1 74 1c 83 f8 ff 74 2d 84 d2 75 3d bf
c7 10
[ 1735.329737] RSP: 0000:ffff9fef00c3bd18 EFLAGS: 00000046
[ 1735.329739] RAX: 0000000000000002 RBX: 0000000093f583f3 RCX: 0000000000000002
[ 1735.329741] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000bf6319f3f
[ 1735.329742] RBP: 0000000000989680 R08: 0000000000000960 R09: 0000000000000003
[ 1735.329744] R10: 00000000ffffe000 R11: 0000000000000000 R12: 0000000000000000
[ 1735.329745] R13: 0000000000000002 R14: ffff9fef0043a020 R15: 0000000000000001
[ 1735.329746] FS:  0000000000000000(0000) GS:ffff968d5d1c5000(0000)
knlGS:0000000000000000
[ 1735.329748] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1735.329750] CR2: 0000000000000000 CR3: 000000007f644000 CR4: 00000000000026f0
[ 1735.329751] Call Trace:
[ 1735.329754]  <TASK>
[ 1735.329756]  xhci_reset+0x65/0x110
[ 1735.329759]  xhci_resume+0x146/0x710
[ 1735.329762]  resume_common+0x8b/0x110
[ 1735.329766]  ? __pfx_pci_pm_resume+0x10/0x10
[ 1735.329769]  dpm_run_callback+0x4b/0x170
[ 1735.329772]  device_resume+0x158/0x250
[ 1735.329775]  async_resume+0x14/0x20
[ 1735.329777]  async_run_entry_fn+0x29/0x130
[ 1735.329781]  process_one_work+0x163/0x370
[ 1735.329785]  worker_thread+0x18f/0x300
[ 1735.329788]  ? __pfx_worker_thread+0x10/0x10
[ 1735.329790]  kthread+0xda/0x110
[ 1735.329794]  ? __pfx_kthread+0x10/0x10
[ 1735.329797]  ret_from_fork+0x1af/0x2b0
[ 1735.329801]  ? __pfx_kthread+0x10/0x10
[ 1735.329804]  ret_from_fork_asm+0x1a/0x30
[ 1735.329809]  </TASK>
[ 1735.769691] rcu: INFO: rcu_preempt detected expedited stalls on
CPUs/tasks: { 3-...D } 21383 jiffies s: 401 root: 0x8/.
[ 1735.769699] rcu: blocking rcu_node structures (internal RCU debug):
[ 1735.769700] Sending NMI from CPU 1 to CPUs 3:
[ 1735.769704] NMI backtrace for cpu 3
[ 1735.769706] CPU: 3 UID: 0 PID: 1075 Comm: kworker/u18:0 Tainted: G
S                  7.0.3 #6 PREEMPT(full)
[ 1735.769709] Tainted: [S]=CPU_OUT_OF_SPEC
[ 1735.769710] Hardware name: HP-Pavilion FJ422AA-UUW
a6551.sc/Benicia, BIOS 5.32    10/23/2008
[ 1735.769711] Workqueue: async async_run_entry_fn
[ 1735.769715] RIP: 0010:xhci_handshake+0x51/0xc0
[ 1735.769717] Code: fa 8b 07 89 f1 49 89 fe 41 89 f5 21 c1 41 39 cc
75 22 eb 3c f3 90 48 81 eb e9 03 00 00 48 89 da 48 c1 ea 3f 44 21 fa
41 8b 06 <44> 89 e9 21 c1 44 39 e1 74 1c 83 f8 ff 74 2d 84 d2 75 3d bf
c7 10
[ 1735.769719] RSP: 0000:ffff9fef00c3bd18 EFLAGS: 00000046
[ 1735.769721] RAX: 0000000000000002 RBX: 000000008a928e70 RCX: 0000000000000002
[ 1735.769722] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000c352263c9
[ 1735.769724] RBP: 0000000000989680 R08: 0000000000000960 R09: 0000000000000003
[ 1735.769725] R10: 00000000ffffe000 R11: 0000000000000000 R12: 0000000000000000
[ 1735.769726] R13: 0000000000000002 R14: ffff9fef0043a020 R15: 0000000000000001
[ 1735.769728] FS:  0000000000000000(0000) GS:ffff968d5d1c5000(0000)
knlGS:0000000000000000
[ 1735.769729] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1735.769731] CR2: 0000000000000000 CR3: 000000007f644000 CR4: 00000000000026f0
[ 1735.769732] Call Trace:
[ 1735.769733]  <TASK>
[ 1735.769734]  xhci_reset+0x65/0x110
[ 1735.769737]  xhci_resume+0x146/0x710
[ 1735.769739]  resume_common+0x8b/0x110
[ 1735.769742]  ? __pfx_pci_pm_resume+0x10/0x10
[ 1735.769744]  dpm_run_callback+0x4b/0x170
[ 1735.769747]  device_resume+0x158/0x250
[ 1735.769749]  async_resume+0x14/0x20
[ 1735.769752]  async_run_entry_fn+0x29/0x130
[ 1735.769755]  process_one_work+0x163/0x370
[ 1735.769758]  worker_thread+0x18f/0x300
[ 1735.769761]  ? __pfx_worker_thread+0x10/0x10
[ 1735.769763]  kthread+0xda/0x110
[ 1735.769766]  ? __pfx_kthread+0x10/0x10
[ 1735.769770]  ret_from_fork+0x1af/0x2b0
[ 1735.769772]  ? __pfx_kthread+0x10/0x10
[ 1735.769775]  ret_from_fork_asm+0x1a/0x30
[ 1735.769779]  </TASK>
[ 1742.263962] clocksource: Long readout interval, skipping watchdog
check: cs_nsec: 26631211515 wd_nsec: 26631203940
[ 1742.264015] xhci-pci-renesas 0000:03:00.0: PCI post-resume error -110!
[ 1742.264018] xhci-pci-renesas 0000:03:00.0: HC died; cleaning up
[ 1742.264059] xhci-pci-renesas 0000:03:00.0: PM: dpm_run_callback():
pci_pm_resume returns -110
[ 1742.264064] xhci-pci-renesas 0000:03:00.0: PM: failed to resume
async: error -110
[ 1742.266288] r8169 0000:02:00.0 enp2s0: Link is Down
[ 1742.303296] OOM killer enabled.
[ 1742.303337] Restarting tasks: Starting
[ 1742.303541] usb 9-4: USB disconnect, device number 2
[ 1742.303813] Restarting tasks: Done
[ 1742.303874] random: crng reseeded on system resumption
[ 1742.304744] PM: suspend exit
[ 1742.574174] ata2: SATA link up 3.0 Gbps (SStatus 123 SControl 300)



> FYI, the quirk performs full xHCI reset during resume and prevents
> selectively suspending the chip when all its USB devices are suspended
> but the system is running (not going to sleep). It doesn't prevent
> suspending when no USB devices are connected at all. And either way,
> runtime PM may be turned off, see if this is 'on' or 'auto':
>
> cat /sys/bus/pci/devices/0000:03:00.0/power/control
>
# cat /sys/bus/pci/devices/0000:03:00.0/power/control
on



> I have no idea why it works the first time but not the second.
> Not what happens if the same is done without the quirk?
> Maybe try s2idle ("freeze") instead of S3 sleep? But that doesn't
> provide the same power saving on older HW.
>
I''l give that a go.

Thanks!
Anders

> Regards,
> Michal

