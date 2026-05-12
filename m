Return-Path: <linux-usb+bounces-37356-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMxMEpCsA2oO8wEAu9opvQ
	(envelope-from <linux-usb+bounces-37356-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 00:41:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBBD52AFCC
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 00:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F261C317E8DD
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 22:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9183A254A;
	Tue, 12 May 2026 22:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LS64GOR3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AE3386C28
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 22:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625259; cv=pass; b=eY3VbdVrhgJHXaeikfMgOCSowq9pqwNB+Zks8e+AYcEz6GYUB3tNQtNcjA61+KpqNsPd2PYV1INSsp4QkTbuwQl2YIbGDPHVP+ujt8CMl9YmU4qO7XWIsUQ6XxSx0ohtgYq0iQBw+GgQ0AeqULCbfW4pY01fMovFqDNq7VRpcXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625259; c=relaxed/simple;
	bh=GlQv90YSbElQJaWEObiD98i9eEknL47TUsLkA3csEAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxycAX6mJxPMZymJqLPeq2Khu34OWz0vARwDSck8s2lt2Cu6jZ5TVptEWlLzf9e636cZoUSJx63AQHQsFMYg9prLIXh/sXuv2fOfcGEbsihcNypIiRmUC/Ulxbl6zLlUOB1s0l1PgbpFsKj/vzDZlgL9v4e2rfu/cmN8klAv3Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LS64GOR3; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3939d2bd7ecso48844151fa.0
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 15:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778625256; cv=none;
        d=google.com; s=arc-20240605;
        b=ip/js6uRrne6U8XAhwW+WF9tD8/p8qsk8+lOeY3Xah1Z4phq8cHtpXP7iBpXRetE9A
         +qwRw4eHz/en66CNHJKfylxvSIqDITwdwlGsvSBL+mGbIBXM65Oa7mIgbOrDE6t/57eW
         9p0KVMIs0HrwA0yZZ4KVCcU6Dm2rpaTCvUto76T77MBS7zEY++TlrTIqCziob+qK2QXL
         tQQg4YpfHev+vyg6lmYfNh77Wvh1Bc47iN7gbidynk+kYCmUdSj0x29SFKqYH2ivW+hS
         3KEqaemZU6HN2mJSL/IiWsTkZnfcTpgiJDBWcgs0piuwtu9ZuP8eYbldRxEDw5sSbd3v
         8G+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GvLiKcOU8ghsp/wHfwpe98QQO+Pp9AP0rs6a3+QsoMs=;
        fh=DN19s0ibwwfJeGavrSM1cHit2/YwAmBInLLPIvjttCQ=;
        b=PQE8kfTIVu0LfMHgb+fpqA90AI1nxAq06KaNMaP9OaL24xqEruPCEaxLDFdfqIc/vm
         jGi+bVb/dy00bqZbBgAtWUgVRveiH3hnHefJ3n323VckzHsxVNCOx/5hSt1tIgQf0dH3
         lJuwnFYhcR03jdQIESe5sZVxO+/oTNUXbzoB///TGX6EoPXSSZdXONKqwJitDRBSTBW2
         cC/Q60XGek4a0fHPB1nEjluBF8+xiYeddqNyWr5FuW6BXo4Bc28im4jIbelVHHsMefcW
         GBoMSjR5DZZt+l4EmNDygVjbGn26E16G9U9QyZAOZiRxLrWMGj8WQ0WdKMrslcP//tP3
         p6Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625256; x=1779230056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvLiKcOU8ghsp/wHfwpe98QQO+Pp9AP0rs6a3+QsoMs=;
        b=LS64GOR3AFgFTdRAmiK39sSGq1I6yGYASLnqlxWoaJJnpufza0gq1PT1wVF+B7Sn+r
         uq9ke0NTP8GAkBA6lGqOcPDqNQ9l5HP+IeeDvQUGndpDPdcTQ6lFwnjfdGM/yK8zW8by
         a2lqDegag5i7lqpJ/BUrmy9IaIWfMdbsqYsUPshE8I3o6g0nP8VLHbatR564Lm2Xmlsp
         P2cw2JmCYL5I+M9lBLM655szEhgq8uNcpHGMZHPqnJNZeAaspDBClQCbfpa8stPpzjq1
         hpxlqdGHYwfCvGxD+vNRwB3+uvFOX9QteGcnmLgcne0kph6b3xPe57H0zgXuaZpZtHY0
         ifiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625256; x=1779230056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GvLiKcOU8ghsp/wHfwpe98QQO+Pp9AP0rs6a3+QsoMs=;
        b=jg0H8BparCCgK+tvo5pXhixIEsEbMlmhUPfGzqoF0McQhrvtKL5ZE7SHrYAmUCA9YT
         dn5VdRPjFuuoOrNe62zn9AiHg5XgTUnawvZuCoF5rNJGXLWTorGAxskDJFgqd2bMdnjW
         M0N7ha9C3dBpiP5NAPiW0kV+f54S8GsWAN8/3s5HbgfYxKY06qvTFmHnusBirXRH/hHC
         mJ0TjqQDtWe/p0JRLKyfGA0uu0sP+QF8K8p7nuoUUnD7QGjyOgRiHLGWEobDf+S6P1Y+
         sOvOaV04uYMcFGAt5ZpnW3vb9Ebgr6edwoQy6YNoljChoFLPe3gFHgP1F+KCgMz928+u
         f6nw==
X-Gm-Message-State: AOJu0YzgiMsbkZOr7yaEznWPc6lMX2B05pJlkgmmyVL05Jm6NL92A+p6
	V/AkIhIhpnSOWwchg/ihLd3tdoCff1P1usvk7PXrrshpbksmkLKm1k0y5sLhW7q6n8f+z0oI04E
	Sr78lWYG2hwSOgmwOyqRENdb70LbYrgyjXy3b
X-Gm-Gg: Acq92OFiLIt2fzsd6N5VF5eF7W18jhAGs2b99rm6HgiEOL71FYUJsx+42r/9XWrKkHB
	jVLJnbKyFHd3ME0wE2d2BR5nEijgxR0qBJwvSYFbMNgEXSoI8p0hj8TgcjYgp7C+6i7ciofveXM
	VJgqhLApoyOmRUY7vez+4ZFQ2E0o8JuX4FHG9YhslxTteKX++4apGVDSToDYCqJO1MpuoP0xO8J
	nrUD79GHTcD4LhZ5lMbuOoSD7diofXkxiODn9qRdg+DIx0Ur2AQP9RXNA/IzHz2rFSOlT5EVN7f
	8a+6qlY=
X-Received: by 2002:a05:651c:3259:b0:38e:94c6:b706 with SMTP id
 38308e7fff4ca-394383a1a16mr17073481fa.7.1778625255717; Tue, 12 May 2026
 15:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGwGCQ+YFkxxnnbSKbSWC7wsh5ORAT=5riqHJrwsimtqFCuKYw@mail.gmail.com>
 <20260512122719.51338042.michal.pecio@gmail.com> <CAGwGCQLjcOkjgDZgxmL0gR6uVwmFjxJ22sMzBYRJLXrDtbZZCQ@mail.gmail.com>
 <20260512190203.5695eb7f.michal.pecio@gmail.com>
In-Reply-To: <20260512190203.5695eb7f.michal.pecio@gmail.com>
From: Anders Thomson <andtho888@gmail.com>
Date: Wed, 13 May 2026 00:34:02 +0200
X-Gm-Features: AVHnY4KH8bG54UUDtfX0gH0qUrYq_thEiVMjLW3mH-rKwUoLGB4TNaCD6ptahps
Message-ID: <CAGwGCQJ5eOfuq2dKPSL1yocruT8prwns93sTvzAUVZTJ4CZsyg@mail.gmail.com>
Subject: Re: renesas 1912:0014 failures
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BBBBD52AFCC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37356-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Here we go:
[  469.798260] PM: suspend entry (deep)
[  470.046476] Filesystems sync: 0.248 seconds
[  470.048616] Freezing user space processes
[  470.049453] Freezing user space processes completed (elapsed 0.000 secon=
ds)
[  470.049499] OOM killer disabled.
[  470.049536] Freezing remaining freezable tasks
[  470.050449] Freezing remaining freezable tasks completed (elapsed
0.000 seconds)
[  470.050516] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
[  470.051839] xhci-pci-renesas 0000:03:00.0: Get port status 9-1
read: 0x2a0, return 0x100
[  470.051866] xhci-pci-renesas 0000:03:00.0: Get port status 9-2
read: 0x2a0, return 0x100
[  470.051876] xhci-pci-renesas 0000:03:00.0: Get port status 9-3
read: 0x2a0, return 0x100
[  470.051886] xhci-pci-renesas 0000:03:00.0: Get port status 9-4
read: 0x2a0, return 0x100
[  470.077248] xhci-pci-renesas 0000:03:00.0: Get port status 10-1
read: 0x2a0, return 0x2a0
[  470.077264] xhci-pci-renesas 0000:03:00.0: Get port status 10-2
read: 0x2a0, return 0x2a0
[  470.077276] xhci-pci-renesas 0000:03:00.0: Get port status 10-3
read: 0x2a0, return 0x2a0
[  470.077292] xhci-pci-renesas 0000:03:00.0: Get port status 10-4
read: 0x2a0, return 0x2a0
[  470.077501] sd 7:0:0:0: [sdf] Synchronizing SCSI cache
[  470.077635] xhci-pci-renesas 0000:03:00.0: config port 10-1 wake
bits, portsc: 0x2a0, write: 0x202a0
[  470.077818] xhci-pci-renesas 0000:03:00.0: config port 10-2 wake
bits, portsc: 0x2a0, write: 0x202a0
[  470.077825] xhci-pci-renesas 0000:03:00.0: config port 10-3 wake
bits, portsc: 0x2a0, write: 0x202a0
[  470.077833] xhci-pci-renesas 0000:03:00.0: config port 10-4 wake
bits, portsc: 0x2a0, write: 0x202a0
[  470.077842] xhci-pci-renesas 0000:03:00.0: config port 9-1 wake
bits, portsc: 0x2a0, write: 0x202a0
[  470.077847] xhci-pci-renesas 0000:03:00.0: config port 9-2 wake
bits, portsc: 0x2a0, write: 0x202a0
[  470.077852] xhci-pci-renesas 0000:03:00.0: config port 9-3 wake
bits, portsc: 0x2a0, write: 0x202a0
[  470.077856] xhci-pci-renesas 0000:03:00.0: config port 9-4 wake
bits, portsc: 0x2a0, write: 0x202a0
[  470.077859] xhci-pci-renesas 0000:03:00.0: xhci_suspend: stopping
usb9 port polling.
[  470.078452] r8169 0000:02:00.0 enp2s0: Link is Down
[  470.083228] xhci-pci-renesas 0000:03:00.0: Setting command ring
address to 0x2476001
[  470.085447] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  470.085685] ata1.00: Entering standby power mode
[  470.089467] sd 3:0:0:0: [sdd] Synchronizing SCSI cache
[  470.089471] sd 1:0:0:0: [sdb] Synchronizing SCSI cache
[  470.089498] sd 2:0:0:0: [sdc] Synchronizing SCSI cache
[  470.089976] ata3.00: Entering standby power mode
[  471.185801] ata4.00: Entering standby power mode
[  471.923516] ACPI: PM: Preparing to enter system sleep state S3
[  471.923767] ACPI: PM: Saving platform NVS memory
[  471.924004] Disabling non-boot CPUs ...
[  471.925486] smpboot: CPU 3 is now offline
[  471.927750] smpboot: CPU 2 is now offline
[  471.930012] smpboot: CPU 1 is now offline
[  471.937302] ACPI: PM: Low-level resume complete
[  471.937330] ACPI: PM: Restoring platform NVS memory
[  471.937770] Enabling non-boot CPUs ...
[  471.937814] smpboot: Booting Node 0 Processor 1 APIC 0x1
[  471.948497] CPU1 is up
[  471.948526] smpboot: Booting Node 0 Processor 2 APIC 0x2
[  471.958206] CPU2 is up
[  471.958233] smpboot: Booting Node 0 Processor 3 APIC 0x3
[  471.967051] CPU3 is up
[  471.970459] ACPI: PM: Waking up from system sleep state S3
[  471.973104] usb usb2: root hub lost power or was reset
[  471.973129] usb usb4: root hub lost power or was reset
[  471.973229] usb usb5: root hub lost power or was reset
[  471.973248] usb usb6: root hub lost power or was reset
[  471.973325] usb usb7: root hub lost power or was reset
[  471.973345] usb usb8: root hub lost power or was reset
[  471.973735] hpet: Lost 1253 RTC interrupts
[  471.973898] usb usb9: root hub lost power or was reset
[  471.973901] usb usb10: root hub lost power or was reset
[  471.973904] xhci-pci-renesas 0000:03:00.0: Stop HCD
[  471.973906] xhci-pci-renesas 0000:03:00.0: // Halt the HC
[  471.973917] xhci-pci-renesas 0000:03:00.0: // Reset the HC
[  500.363392] hpet: Lost 1815 RTC interrupts
[  500.363631] xhci-pci-renesas 0000:03:00.0: PCI post-resume error -110!
[  500.363635] xhci-pci-renesas 0000:03:00.0: HC died; cleaning up
[  500.363715] xhci-pci-renesas 0000:03:00.0: PM: dpm_run_callback():
pci_pm_resume returns -110
[  500.363725] xhci-pci-renesas 0000:03:00.0: PM: failed to resume
async: error -110
[  500.421723] r8169 0000:02:00.0 enp2s0: Link is Down
[  500.445507] OOM killer enabled.
[  500.445548] Restarting tasks: Starting
[  500.448081] Restarting tasks: Done
[  500.448138] random: crng reseeded on system resumption
[  500.448920] PM: suspend exit
[  500.463568] ata3: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[  500.463645] ata6: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[  500.463708] ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[  500.464152] ata5: SATA link down (SStatus 0 SControl 300)
[  500.464654] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[  500.464885] ata6.00: configured for UDMA/33
[  500.465423] sd 0:0:0:0: [sda] Starting disk
[  500.466188] ata1.00: configured for UDMA/133
[  500.484215] sd 2:0:0:0: [sdc] Starting disk
[  500.486246] ata3.00: configured for UDMA/133
[  500.667575] ata2: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[  500.681515] sd 1:0:0:0: [sdb] Starting disk
[  500.687837] ata2.00: configured for UDMA/133
[  502.569318] sd 3:0:0:0: [sdd] Starting disk
[  502.572754] ata4.00: configured for UDMA/133
[  502.879209] r8169 0000:02:00.0 enp2s0: Link is Up - 1Gbps/Full -
flow control rx/tx


No devices attached to any port.

BR
Anders

On Tue, May 12, 2026 at 7:02=E2=80=AFPM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Tue, 12 May 2026 16:40:30 +0200, Anders Thomson wrote:
> > Adding that quirk to the boot cmdline, caused this on resume:
> >
> > [ 1357.247864] usb usb10: root hub lost power or was reset
> > [ 1385.611310] xhci-pci-renesas 0000:03:00.0: PCI post-resume error -11=
0!
> > [ 1385.611438] xhci-pci-renesas 0000:03:00.0: HC died; cleaning up
> > [ 1385.611491] xhci-pci-renesas 0000:03:00.0: PM: dpm_run_callback():
> > pci_pm_resume returns -110
> > [ 1385.611506] xhci-pci-renesas 0000:03:00.0: PM: failed to resume
> > async: error -110
>
> Looks like the quirk worked, but the chip is still stuck for good.
>
> Sounds like it happens every time?
> Does it happen without any connected devices?
>
> Any chance that something goes weird already during suspend?
> Maybe try to collect suspend/resume log with extra debug info:
>
> echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
> dmesg -W |tee log.txt
> # suspend and resume
> echo 'module xhci_hcd -p' >/proc/dynamic_debug/control # disable
> # stop dmesg, send log.txt
>
> It's odd, I have a uPD720202 (the 2 port variant) and it never had
> similar problems. But my card doesn't use the standby supply and
> hence it fully power cycles the chip during S3 sleep, so it may be
> apples to oranges if your card keeps aux power applied.
>
> Regards,
> Michal

