Return-Path: <linux-usb+bounces-37341-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA+eNbxDA2pV2QEAu9opvQ
	(envelope-from <linux-usb+bounces-37341-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 17:14:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AA652366C
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 17:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E79A8354E7C9
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE5D3B9920;
	Tue, 12 May 2026 14:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXg/COkK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899D43B83E1
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 14:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596845; cv=pass; b=qk5kK66lvLr5MIfU7XjZKKpZDr6aZiD6liDKBvSNDmppBbeeat45/NxcjDn5LfByM7sIcU3X1+8ivMa9WJpPvTFSA0RBvoJaVymlh0BYBIjyHydrDFEnqeKg56fXbJAcdmRKaWq6S4hSexYewEc23T6RQzoF7vfOd28etKa6Ngg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596845; c=relaxed/simple;
	bh=/uQP5+rxvEcQTXo0aAxeCDWCvWD6tOKzdCaxZY4fm1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipHyEOb6qzsoR1zVshKvZXRHvB7yNz3gV5CWlqxAHQc9Dt82EfHva9ptBMWl+qbepu6/CvYrdLl6gf/sUAlMZ9dQBfRJrkcEc/hFHKVczDvLrI8z8pPU3MLOnQbQMip0gjjJ9ha+Ln7HOXocsolhtQjgNhOqPptbj1Ke0TZhUyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXg/COkK; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39397d63804so64638911fa.2
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 07:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778596842; cv=none;
        d=google.com; s=arc-20240605;
        b=Tfqnayyb34RluCHtfEf4162UaL2P/7559ABKqPlELRBugIBefYm5FIEbnKHqy/Q9pk
         E3vDU3VYwR+Y58a2MJj+HYXe8FCO6aw6mXVs9TMepwHRndszTckQ3TvOVmoqlAcmXH6l
         XQ6uY2GDb0KHLDwFhl/7dp44eRVwwTSzd4ySMxPDFHfbZPr0HtYK/tbGjaa/5jCdEbkl
         slIwsUZfSpBGlamq5LKNi6YfJrueOw6Fwx41uwtGILaD699+2JVik/RdhlW5px2X7WZM
         +yMWxIjHeOSp9y5/z2stJ+K2JMyzoSrcJjYNWUfAjHUShjskcA19w0u0IMhYE6iBLXiO
         UMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ordcSi4sPkpocmxNQzsjUGWmhiOT115Idgfl2TAb1ow=;
        fh=DN19s0ibwwfJeGavrSM1cHit2/YwAmBInLLPIvjttCQ=;
        b=gGH0KmwAh2CY6IJlX72yDpFJRhKXn1BxFbgFbmbpMJ7jUOH9rXs7Tg0pvy1SP5ghTC
         /WlB9G1WM1772YH5lsZTg3jOv6AneJcSCGqfNMbyK8OtXO5ZC14tt9f7nV9o5Sy51DUh
         HjXrU/uUbs0uHRszdXy6coY0A5ze5Ksp1umQNY4OZGCkMZHLE5IO75X+ITN7it5qWFTX
         ZHvUNtGHRvTZMtXKpcmb97lNGvLDMcy7ScE92FCfYh3xjWcFfC5mLUzNZfykzLykGI8F
         Ge0hLN6nrp8o3P7gOiHDUJZTn8rB4GSXDMJ1Won4vUyEc4uMrrYnauiQJGXY5NcVHM3E
         MutA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778596842; x=1779201642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ordcSi4sPkpocmxNQzsjUGWmhiOT115Idgfl2TAb1ow=;
        b=AXg/COkKw1a2xndOPrQwg/0Q33FPTolA/Rqc8Iwwk7ZHWh9zM6YpAFFLYWxYKzB3c8
         xnjHrEEA2Gryi06hRU86lL6m5qz5dGxxE9c1KE2+IJSiZ7pvwE3Wa0mLaGL1XrxEkXUj
         Xf0fKYpeZjI0kSOQWs4ZbkZZrOsaL9zJdmWreZd/4oCjD09Lseuvm7PE8rXWiS0eKICW
         GO1lKMHWUlxzaBOvlGMoPQiTrh24UpGR70Eul6Oe/CbBtbp24x1YIAl2TQt6ISyNadGw
         T8zNKTqaoBStBGOV8eqHBP7zrWHJgz2V3ccpldKrLMXYvZa2Ll6oYFELInecD5nMIonp
         izfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596842; x=1779201642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ordcSi4sPkpocmxNQzsjUGWmhiOT115Idgfl2TAb1ow=;
        b=RvMb2pbsnsQ7krtIegrcDvm84nDOL27enqGjIkdLAExfDhGwte68Ykd+fH3Yvtzo9e
         UxqkzLwtXEZvVdsC4adE07TyPEjVeZQMucFNPWWDNJpRMt3tpeN609pLLRh+pXNgdOS6
         MpAa6v6NFAOOMB93LJ4rhM6SpsWPGLsQFHaWkoS7g7kx4cq6SbYywATKWfX7KPYikUSX
         cFxBbAfpQ0IoDfqNqMy/gZIO3fdO1Gs9XkCF60mxttROJsBxg/gzpoihYwg8rPoFkMmO
         KtCEHOoEb4MAs8muVo1GbevNC/RxM55wve+6O53CjL+lv0HSVwhCQtXRaaYEuuBNQETo
         krvw==
X-Gm-Message-State: AOJu0Yxj6CCxOow6X/oV4ivAlu1jLix6q7PYezb9WWTf2rptxO2Y1hF/
	wddLBv4i0smN9z3aLNrUbupk7aIMsRYcjJsLMBPsJNUJDfxRNaRSGrswRRzR6hqFX7IcKjzDuHO
	mu14itcZ9MDxeKu+ybKsoeLFqIdR8Sek=
X-Gm-Gg: Acq92OHV1HmqQR0+Ff5dSDy7DbVWToxTavgEUcMGIWsjcRxAoS8DP1fVYNLGJSigJq6
	v0S9GUKC3GwIlszflMXa5eUanyiM23ETw9YKl6rqjLCFS8BRSKKikG2O7QyuKnfqbkTeepjcfeK
	wxKuu2xBpa59M5gQPu+8OrT/pTRNAEB6K4UdmQnwcTfJiyHDPcCNIIxQtUJsrLX74iRpGKNcd2V
	YZdvHW5GpXB13Yf0rStp/kZdhnlSlgt6sf5vqooj4uvhf57cnZbbNbbeTRAcsjM7pjDDYt/+oZv
	sTFvmk1akQ+DRbV3ng==
X-Received: by 2002:a05:651c:e17:b0:394:898:a351 with SMTP id
 38308e7fff4ca-3940898f7dbmr43553041fa.13.1778596841414; Tue, 12 May 2026
 07:40:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGwGCQ+YFkxxnnbSKbSWC7wsh5ORAT=5riqHJrwsimtqFCuKYw@mail.gmail.com>
 <20260512122719.51338042.michal.pecio@gmail.com>
In-Reply-To: <20260512122719.51338042.michal.pecio@gmail.com>
From: Anders Thomson <andtho888@gmail.com>
Date: Tue, 12 May 2026 16:40:30 +0200
X-Gm-Features: AVHnY4JWrUv9UrngSD1V9zsvdZ20OFDRoQHjbasfMO_yHiA4w2rgZPN8_rYqcQg
Message-ID: <CAGwGCQLjcOkjgDZgxmL0gR6uVwmFjxJ22sMzBYRJLXrDtbZZCQ@mail.gmail.com>
Subject: Re: renesas 1912:0014 failures
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 36AA652366C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37341-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andtho888@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,a6551.sc:url]
X-Rspamd-Action: no action

Adding that quirk to the boot cmdline, caused this on resume:

[ 1357.247864] usb usb10: root hub lost power or was reset
[ 1385.611310] xhci-pci-renesas 0000:03:00.0: PCI post-resume error -110!
[ 1385.611438] xhci-pci-renesas 0000:03:00.0: HC died; cleaning up
[ 1385.611491] xhci-pci-renesas 0000:03:00.0: PM: dpm_run_callback():
pci_pm_resume returns -110
[ 1385.611506] xhci-pci-renesas 0000:03:00.0: PM: failed to resume
async: error -110

and the attached disk is not recognized (obviously).

No stack traces, though.

Anders

On Tue, May 12, 2026 at 12:27=E2=80=AFPM Michal Pecio <michal.pecio@gmail.c=
om> wrote:
>
> On Wed, 6 May 2026 14:58:44 +0200, Anders Thomson wrote:
> > Hi,
> >
> > I've received a Renesas pcie usb3 card which fails to suspend (to ram)
> > correctly.
> >
> > Regular boots appear to be working fine, but upon resuming from
> > suspend, I get this log:
> >
> > [  461.824899] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> > [  461.824902] rcu:     3-...0: (3 ticks this GP)
> > idle=3D0884/1/0x4000000000000000 softirq=3D2388/2389 fqs=3D5249
> > [  461.824907] rcu:     (detected by 1, t=3D21002 jiffies, g=3D5201, q=
=3D24 ncpus=3D4)
> > [  461.824910] Sending NMI from CPU 1 to CPUs 3:
> > [  461.824917] NMI backtrace for cpu 3
> > [  461.824922] CPU: 3 UID: 0 PID: 513 Comm: kworker/u18:6 Tainted: G S
> >                  7.0.3 #2 PREEMPT(full)
> > [  461.824926] Tainted: [S]=3DCPU_OUT_OF_SPEC
> > [  461.824927] Hardware name: HP-Pavilion FJ422AA-UUW
> > a6551.sc/Benicia, BIOS 5.32    10/23/2008
> > [  461.824929] Workqueue: async async_run_entry_fn
> > [  461.824936] RIP: 0010:xhci_resume+0x3fe/0x5a0
> > [  461.824941] Code: 04 f6 c4 08 74 5a 41 bd 7b 6f 98 00 eb 21 49 83
> > ed 01 0f 84 a0 01 00 00 bf c7 10 00 00 e8 1a fa 3e 00 f3 90 48 8b 04
> > 24 8b 00 <f6> c4 08 74 31 83 f8 ff 75 da b8 ed ff ff ff 48 8b 0b 89 c2
> > 48 c7
> > [  461.824943] RSP: 0000:ffff9ed3003ebd68 EFLAGS: 00000082
> > [  461.824945] RAX: 0000000000000801 RBX: ffff9112c241a250 RCX: ffff9ed=
30043e024
> > [  461.824947] RDX: 0000000000000987 RSI: 0000000000000003 RDI: 0000000=
bf69fa402
> > [  461.824948] RBP: ffff9112c241a000 R08: 0000000000000960 R09: 0000000=
000000003
> > [  461.824950] R10: 0000000000000003 R11: ffffffff95258f20 R12: 0000000=
000000000
> > [  461.824951] R13: 0000000000268925 R14: ffff9112c241a290 R15: 0000000=
000000000
> > [  461.824952] FS:  0000000000000000(0000) GS:ffff9113e6604000(0000)
> > knlGS:0000000000000000
> > [  461.824954] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  461.824956] CR2: 0000000000000000 CR3: 000000000faeb000 CR4: 0000000=
0000006f0
> > [  461.824957] Call Trace:
> > [  461.824960]  <TASK>
> > [  461.824963]  resume_common+0x89/0xd0
> > [  461.824968]  ? __pfx_pci_pm_resume+0x10/0x10
> > [  461.824973]  dpm_run_callback+0x3d/0x160
> > [  461.824977]  ? dpm_wait_for_superior+0xf7/0x150
> > [  461.824981]  device_resume+0x158/0x250
> > [  461.824984]  async_resume+0x14/0x20
> > [  461.824987]  async_run_entry_fn+0x21/0xa0
> > [  461.824991]  process_one_work+0x163/0x370
> > [  461.824994]  worker_thread+0x18f/0x300
> > [  461.824997]  ? __pfx_worker_thread+0x10/0x10
> > [  461.824999]  kthread+0xda/0x110
> > [  461.825003]  ? __pfx_kthread+0x10/0x10
> > [  461.825006]  ret_from_fork+0x1af/0x2b0
> > [  461.825009]  ? __pfx_kthread+0x10/0x10
> > [  461.825012]  ret_from_fork_asm+0x1a/0x30
> > [  461.825017]  </TASK>
> > [  462.302911] rcu: INFO: rcu_preempt detected expedited stalls on
> > CPUs/tasks: { 3-...D } 21425 jiffies s: 365 root: 0x8/.
> > [  462.302917] rcu: blocking rcu_node structures (internal RCU debug):
> > [  462.302919] Sending NMI from CPU 1 to CPUs 3:
> > [  462.302922] NMI backtrace for cpu 3
> > [  462.302925] CPU: 3 UID: 0 PID: 513 Comm: kworker/u18:6 Tainted: G S
> >                  7.0.3 #2 PREEMPT(full)
> > [  462.302928] Tainted: [S]=3DCPU_OUT_OF_SPEC
> > [  462.302929] Hardware name: HP-Pavilion FJ422AA-UUW
> > a6551.sc/Benicia, BIOS 5.32    10/23/2008
> > [  462.302930] Workqueue: async async_run_entry_fn
> > [  462.302933] RIP: 0010:xhci_resume+0x3fe/0x5a0
> > [  462.302936] Code: 04 f6 c4 08 74 5a 41 bd 7b 6f 98 00 eb 21 49 83
> > ed 01 0f 84 a0 01 00 00 bf c7 10 00 00 e8 1a fa 3e 00 f3 90 48 8b 04
> > 24 8b 00 <f6> c4 08 74 31 83 f8 ff 75 da b8 ed ff ff ff 48 8b 0b 89 c2
> > 48 c7
> > [  462.302938] RSP: 0000:ffff9ed3003ebd68 EFLAGS: 00000082
> > [  462.302940] RAX: 0000000000000801 RBX: ffff9112c241a250 RCX: ffff9ed=
30043e024
> > [  462.302941] RDX: 0000000000000987 RSI: 0000000000000003 RDI: 0000000=
c3b0074cb
> > [  462.302943] RBP: ffff9112c241a000 R08: 0000000000000960 R09: 0000000=
000000003
> > [  462.302944] R10: 0000000000000003 R11: ffffffff95258f20 R12: 0000000=
000000000
> > [  462.302945] R13: 000000000023f18b R14: ffff9112c241a290 R15: 0000000=
000000000
> > [  462.302947] FS:  0000000000000000(0000) GS:ffff9113e6604000(0000)
> > knlGS:0000000000000000
> > [  462.302949] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  462.302950] CR2: 0000000000000000 CR3: 000000000faeb000 CR4: 0000000=
0000006f0
> > [  462.302951] Call Trace:
> > [  462.302952]  <TASK>
> > [  462.302953]  resume_common+0x89/0xd0
> > [  462.302957]  ? __pfx_pci_pm_resume+0x10/0x10
> > [  462.302961]  dpm_run_callback+0x3d/0x160
> > [  462.302964]  ? dpm_wait_for_superior+0xf7/0x150
> > [  462.302967]  device_resume+0x158/0x250
> > [  462.302970]  async_resume+0x14/0x20
> > [  462.302974]  async_run_entry_fn+0x21/0xa0
> > [  462.302977]  process_one_work+0x163/0x370
> > [  462.302980]  worker_thread+0x18f/0x300
> > [  462.302983]  ? __pfx_worker_thread+0x10/0x10
> > [  462.302985]  kthread+0xda/0x110
> > [  462.302988]  ? __pfx_kthread+0x10/0x10
> > [  462.302991]  ret_from_fork+0x1af/0x2b0
> > [  462.302993]  ? __pfx_kthread+0x10/0x10
> > [  462.302997]  ret_from_fork_asm+0x1a/0x30
> > [  462.303001]  </TASK>
> > [  468.932307] xhci-pci-renesas 0000:03:00.0: Controller not ready at
> > resume -110
> > [  468.932332] clocksource: Long readout interval, skipping watchdog
> > check: cs_nsec: 26925372067 wd_nsec: 26925364392
> > [  468.932394] xhci-pci-renesas 0000:03:00.0: PCI post-resume error -11=
0!
> > [  468.932401] xhci-pci-renesas 0000:03:00.0: HC died; cleaning up
> > [  468.932429] xhci-pci-renesas 0000:03:00.0: PM: dpm_run_callback():
> > pci_pm_resume returns -110
> > [  468.932434] xhci-pci-renesas 0000:03:00.0: PM: failed to resume
> > async: error -110
>
> That's waiting 10 seconds with IRQs disabled for USBSTS.CNR to clear.
> Sadly, a70bcbc322837 doesn't explain why such long timeout was used.
>
> That being said, this bit should clear, so something is wrong.
>
> Similar 0015 controllers have the RESET_ON_RESUME quirk applied. Sadly
> again, the reason isn't documented in all detail we could wish for.
> The quirk would apparently try a reset without looking at CNR (which is
> frankly a spec violation) and only then test CNR.
>
> Wonder if xhci_hcd.quirks=3D0x80 boot parameter would make a difference?
>
> > This is on vanilla 7.0.3. If I add the firmware (renesas_usb_fw.mem,
> > sha256=3D177560c224c73...)  it fails to load on boot and I get a massiv=
e
> > stall in bootup:
> >
> > [    0.374764] pci 0000:00:1c.1: enabling device (0106 -> 0107)
> > [    6.295099] pci 0000:03:00.0: xHCI HW not ready after 5 sec (HC
> > bug?) status =3D 0x801
> > [    6.295198] pci 0000:03:00.0: quirk_usb_early_handoff+0x0/0x700
> > took 5781678 usecs
>
> That's early boot, presence of FW files shouldn't have any effect.
> Perhaps it happens *after* failing to load FW or loading wrong one,
> then rebooting without power cycle or something like that?
>
> Regards,
> Michal

