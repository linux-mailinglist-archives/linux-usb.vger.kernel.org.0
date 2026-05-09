Return-Path: <linux-usb+bounces-37183-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id V7hDDOlJ/2lk4QAAu9opvQ
	(envelope-from <linux-usb+bounces-37183-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 16:51:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD00500299
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 16:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6344F300D92F
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 14:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D4D399364;
	Sat,  9 May 2026 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4N8l12m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6B25B30D
	for <linux-usb@vger.kernel.org>; Sat,  9 May 2026 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778338278; cv=pass; b=MA3f6FwHfH8gktilsiv+JWvzPpZ8/90n5+Pplm/cGqpuNbyIGpQfVLLvWIQfC1N15TPtdV5UbyXevR8plxRrfvpZZDW4iImX3YCZ1invIfe5pdIdSTz/Krj6C7fSF5DnxWGP1m48cFvFg2BD8ZwEAdt5yy3grgg5KthMFY9R630=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778338278; c=relaxed/simple;
	bh=ziPNiIl8x/bPprnnHPRfnuOBjLVQL17BF4/j8KVtk0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cg/bqwo4HrSMJSGEDKznmQsYFC61VTZIIt9uYHoZudVzhg/dBMvMfzr/eJk3KLVwRlIxq9VGgJvfKXwu5Ha+HG4IsL1F+jvYoFHSdKymigVCqC7OIw5Zs8lyMjiGz+osTcL0wnflB7KZKqllGRem8uwBlYanA+hdU1NSVMuWtrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4N8l12m; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8ef2118b478so306766285a.0
        for <linux-usb@vger.kernel.org>; Sat, 09 May 2026 07:51:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778338275; cv=none;
        d=google.com; s=arc-20240605;
        b=PUGNSUGcDfM9ItifEGC538Yh5akYoyUM6RhB4JM2hzuDNYSa4oeRFMag+U+Hoia83B
         8HJ/HNAY4hDl6cDxsqKHKR5O0oYMI1i0Q2XReUHy2U2qQuZ2z5INBtDqj/7sDjBxUdzN
         rDbe5byPp12DXGRS1LzxWcQY8kRZKhPCXxrWv9al8ibA16EZWjjDP9kvjLgevN/vquoM
         0WRpDHi/Cb5WM+r5lZsiJbq1vfOSIrmGzBsmwv0BcRCIy8Mv1geGWZkWfl5p7+noBR5r
         kUhd5Gf1iHqnvb0RmuVp6YKUD+4BzVr6EtfOdb9qXrvmF4Kh2zpPwBUVJA9Cv/cA+krZ
         wwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oE2zPtFvVm+tFwB6IpMMvj/KM1rxQuMSFscPEbGdwsI=;
        fh=oGZB+fAxv3AmVqbpiw6ECejp+zM9/E6xPnWpMntTYL8=;
        b=DG/DrclRYYJuxiFXb2HrtbX2/bKOlOv8hjpNlxye13xSJCuOp7nmB9kWMkh3NEus2S
         U+VJe9xgzSHSTmfRE86PlNFGrySLP5YjRIzAuZ7QM313oIEr3UPXfiZ2fcAvux/Jyb3S
         aa9illvDtidUpMNN6o8TsevwT6VEmLYoa0lzw2HOk3T58JrlI4Nj11XbM/v5pn9ZOv7n
         ktqriy+xDm1lvH1CmaMp89muAP1SZFUqLNAGx9yjXFgkgDNO/J+hwlmphUe1E4p6y8sV
         VMIEHlnboqcPeBAG1ENaAbXjgNBh82PLXqXbhqM1pIfoV6kqmfxExi3LLPu4mMS2EoTO
         rrHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778338275; x=1778943075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oE2zPtFvVm+tFwB6IpMMvj/KM1rxQuMSFscPEbGdwsI=;
        b=n4N8l12mb2lLkzgQqNaLbbDTF6b6y6Lkvk+5ckN83UQHOf6ZYWhBFCWxX3YRRHcfIL
         xJRVTHdo+H5WD+UUwsqQ8PnnJPuYjOdKrZXAvsnrCebxqIrUluZHIN8cCwf07ipf/Ooj
         1vKdE0oHSQf5fInFrojCTZ4hFzMOw85jvgGXvSTUmVqJUnwqUCFsh6Vu9vsH+NFVoXOv
         JEm5VeJHZyT5rMHZnQHwo7YOBxIeUEs0xi8X3Bw1bFE8mOKXtEUYZ9C0T2CZZ63xbk6a
         PhddG9wKGlXYUN0J0Rxu7dsZ1J6kCqi2QV+z0koOfYF3MhBooHw9osfx7L2Hpt9JdIY8
         B6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778338275; x=1778943075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oE2zPtFvVm+tFwB6IpMMvj/KM1rxQuMSFscPEbGdwsI=;
        b=asCFrTENUcYeQ7OgHuUBQoi3QXM9tww1EPT+5wRX7FzZ2IyZoyq0hSL3xRSoQeLxsF
         c/5AjeSDJseTqrO/sRfVWbqNUY30GAjQm3Q4XiqKBhi2MS1EPdpuKrrLNdNC50SvZJSa
         +D0bw48IBr+Tq1WMznsUD/A8GgyrYyYg8kFe/ir7GfrZvQqbf2Taabkj2+X9Li8CfuWf
         kv1I0HS+L3LhpU8nsc9rjaiubJxGPANZ7GzebaWHTtJZAtqLiVjH+xTOn9QgFCNz6LDb
         deIH0USLW2oMSbq/WXaHJTnAuav3wSjvlmu6XT0DCAnj4bVnCPfnW2IW9450BWwKKlgK
         t27Q==
X-Gm-Message-State: AOJu0Yz8eFVlFDiqS3sF7caIOcQ8/zqjKPZfd3q+cpiwa1ai3ZeA/1HS
	r5vSYPKMFp51NMGfEqQg6+sKutzp5ArVReWU+NRoXUNKPiCwjgtFH8hCpLVJ53F/8HzOjeMPV1N
	eqemQKKP3GQatMdUtZ8lDbdAURnDjADYTDr+Y3Ms=
X-Gm-Gg: Acq92OHi+LpmsTv1B16Si/pQ4d0oWe4Sp6VbbbOkBmy7rcuvPKiEz6sX+qoCeaedJ0N
	94HjlxYPua0UElij4lPNedas9GIM5aB/v9hkziidIuQtVkPD625mLV5O96YnzF52YSagfixko4G
	KA39erfSm81yevsiMNej7xuFsUXT3R3NkhyPY77/FwAFWCYIIJRWJcjW6mFGfbSlXT4lSUI3R60
	kF0QiItp9oY8uix6fE6eRm+dYsKLr/8Q/uJ9Tv3QUJ1gFlzIeFSKBhv03Mf71c8QDgCjK7ajznW
	1bpeWd0YJPz4KbZTQOgJQVHyQD8UN+wE2jDhPw==
X-Received: by 2002:a05:620a:370d:b0:902:b2b6:afd with SMTP id
 af79cd13be357-904d68e0a6fmr2645659685a.48.1778338274718; Sat, 09 May 2026
 07:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
 <20260330020749.18fbe433.michal.pecio@gmail.com> <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
 <20260404152438.582f0451.michal.pecio@gmail.com>
In-Reply-To: <20260404152438.582f0451.michal.pecio@gmail.com>
From: Martin Alderson <martinalderson@gmail.com>
Date: Sat, 9 May 2026 15:51:03 +0100
X-Gm-Features: AVHnY4IJucl9BX9TPqIQ3jCUyuhPLKvXkLnTB1z3kxJd46RjfihlpsDwVSEyRng
Message-ID: <CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies
 on resume from suspend
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9CD00500299
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-37183-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinalderson@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi, still experiencing this on 7.0.2. I tried to pull the logs
together to get to the bottom of this (I've tried a few different
kernels)

Kernel                          Suspends   xHCI 0f:00.0 deaths   Rate
------------------------------  --------   -------------------   -----
6.17.1-300.fc43 (March)             ~12             0             0%
6.18.16-200.fc43                     10             0             0%
6.19.7/8-200.fc43                     5             0             0%
7.0-rc4   (build 260320)             13             0             0%
7.0-rc5   (build 260328)              7             2            ~28%
7.0-rc6   (build 260401)             10             4             40%
7.0-rc7   (build 260409)              7             2            ~28%
7.0.0-261.vanilla.fc43                7             2            ~28%
6.17.1-300.fc43 (April, retry)       10             2             20%
 <-- same bug, stable kernel
7.0.1-262.vanilla.fc43                7             2            ~28%
7.0.2-300.vanilla.fc44                6             4            ~66%


May 09 15:29:37 fedora kernel: Freezing user space processes completed
(elapsed 0.001 seconds)
May 09 15:29:37 fedora kernel: OOM killer disabled.
May 09 15:29:37 fedora kernel: Freezing remaining freezable tasks
May 09 15:29:37 fedora kernel: Freezing remaining freezable tasks
completed (elapsed 0.001 seconds)
May 09 15:29:37 fedora kernel: printk: Suspending console(s) (use
no_console_suspend to debug)
May 09 15:29:37 fedora kernel: sd 6:0:0:0: [sdb] Synchronizing SCSI cache
May 09 15:29:37 fedora kernel: serial 00:01: disabled
May 09 15:29:37 fedora kernel: sd 0:0:0:0: [sda] Synchronizing SCSI cache
May 09 15:29:37 fedora kernel: ata1.00: Entering standby power mode
May 09 15:29:37 fedora kernel: xhci_hcd 0000:0f:00.0: xHCI host not
responding to stop endpoint command
May 09 15:29:37 fedora kernel: xhci_hcd 0000:0f:00.0: xHCI host
controller not responding, assume dead
May 09 15:29:37 fedora kernel: xhci_hcd 0000:0f:00.0: HC died; cleaning up
May 09 15:29:37 fedora kernel: PM: suspend devices took 5.758 seconds
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: MODE1 reset
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: GPU mode1 reset
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: GPU smu mode1 reset
May 09 15:29:37 fedora kernel: ACPI: PM: Preparing to enter system
sleep state S3
May 09 15:29:37 fedora kernel: ACPI: PM: Saving platform NVS memory
May 09 15:29:37 fedora kernel: Disabling non-boot CPUs ...
May 09 15:29:37 fedora kernel: smpboot: CPU 23 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 22 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 21 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 20 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 19 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 18 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 17 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 16 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 15 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 14 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 13 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 12 is now offline
May 09 15:29:37 fedora kernel: Spectre V2 : Update user space SMT
mitigation: STIBP off
May 09 15:29:37 fedora kernel: smpboot: CPU 11 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 10 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 9 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 8 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 7 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 6 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 5 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 4 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 3 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 2 is now offline
May 09 15:29:37 fedora kernel: smpboot: CPU 1 is now offline
May 09 15:29:37 fedora kernel: ACPI: PM: Low-level resume complete
May 09 15:29:37 fedora kernel: ACPI: PM: Restoring platform NVS memory
May 09 15:29:37 fedora kernel: AMD-Vi: Virtual APIC enabled
May 09 15:29:37 fedora kernel: AMD-Vi: Virtual APIC enabled
May 09 15:29:37 fedora kernel: LVT offset 0 assigned for vector 0x400
May 09 15:29:37 fedora kernel: Enabling non-boot CPUs ...
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 1 APIC 0x2
May 09 15:29:37 fedora kernel: CPU1 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 2 APIC 0x4
May 09 15:29:37 fedora kernel: CPU2 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 3 APIC 0x6
May 09 15:29:37 fedora kernel: CPU3 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 4 APIC 0x8
May 09 15:29:37 fedora kernel: CPU4 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 5 APIC 0xa
May 09 15:29:37 fedora kernel: CPU5 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 6 APIC 0x1=
0
May 09 15:29:37 fedora kernel: CPU6 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 7 APIC 0x1=
2
May 09 15:29:37 fedora kernel: CPU7 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 8 APIC 0x1=
4
May 09 15:29:37 fedora kernel: CPU8 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 9 APIC 0x1=
6
May 09 15:29:37 fedora kernel: CPU9 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 10 APIC 0x=
18
May 09 15:29:37 fedora kernel: CPU10 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 11 APIC 0x=
1a
May 09 15:29:37 fedora kernel: CPU11 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 12 APIC 0x=
1
May 09 15:29:37 fedora kernel: Spectre V2 : Update user space SMT
mitigation: STIBP always-on
May 09 15:29:37 fedora kernel: CPU12 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 13 APIC 0x=
3
May 09 15:29:37 fedora kernel: Spurious APIC interrupt (vector 0xFF)
on CPU#13, should never happen.
May 09 15:29:37 fedora kernel: CPU13 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 14 APIC 0x=
5
May 09 15:29:37 fedora kernel: Spurious APIC interrupt (vector 0xFF)
on CPU#14, should never happen.
May 09 15:29:37 fedora kernel: CPU14 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 15 APIC 0x=
7
May 09 15:29:37 fedora kernel: Spurious APIC interrupt (vector 0xFF)
on CPU#15, should never happen.
May 09 15:29:37 fedora kernel: CPU15 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 16 APIC 0x=
9
May 09 15:29:37 fedora kernel: Spurious APIC interrupt (vector 0xFF)
on CPU#16, should never happen.
May 09 15:29:37 fedora kernel: CPU16 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 17 APIC 0x=
b
May 09 15:29:37 fedora kernel: Spurious APIC interrupt (vector 0xFF)
on CPU#17, should never happen.
May 09 15:29:37 fedora kernel: CPU17 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 18 APIC 0x=
11
May 09 15:29:37 fedora kernel: Spurious APIC interrupt (vector 0xFF)
on CPU#18, should never happen.
May 09 15:29:37 fedora kernel: CPU18 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 19 APIC 0x=
13
May 09 15:29:37 fedora kernel: Spurious APIC interrupt (vector 0xFF)
on CPU#19, should never happen.
May 09 15:29:37 fedora kernel: CPU19 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 20 APIC 0x=
15
May 09 15:29:37 fedora kernel: Spurious APIC interrupt (vector 0xFF)
on CPU#20, should never happen.
May 09 15:29:37 fedora kernel: CPU20 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 21 APIC 0x=
17
May 09 15:29:37 fedora kernel: Spurious APIC interrupt (vector 0xFF)
on CPU#21, should never happen.
May 09 15:29:37 fedora kernel: CPU21 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 22 APIC 0x=
19
May 09 15:29:37 fedora kernel: Spurious APIC interrupt (vector 0xFF)
on CPU#22, should never happen.
May 09 15:29:37 fedora kernel: CPU22 is up
May 09 15:29:37 fedora kernel: smpboot: Booting Node 0 Processor 23 APIC 0x=
1b
May 09 15:29:37 fedora kernel: Spurious APIC interrupt (vector 0xFF)
on CPU#23, should never happen.
May 09 15:29:37 fedora kernel: CPU23 is up
May 09 15:29:37 fedora kernel: ACPI: PM: Waking up from system sleep state =
S3
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: [drm] PCIE GART of
512M enabled (table at 0x00000083DAB00000).
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: PSP is resuming...
May 09 15:29:37 fedora kernel: nvme nvme0: D3 entry latency set to 10 secon=
ds
May 09 15:29:37 fedora kernel: xhci_hcd 0000:0c:00.0: xHC error in
resume, USBSTS 0x401, Reinit
May 09 15:29:37 fedora kernel: usb usb1: root hub lost power or was reset
May 09 15:29:37 fedora kernel: usb usb2: root hub lost power or was reset
May 09 15:29:37 fedora kernel: serial 00:01: activated
May 09 15:29:37 fedora kernel: nvme nvme0: 24/0/0 default/read/poll queues
May 09 15:29:37 fedora kernel: usb 5-2: reset full-speed USB device
number 2 using xhci_hcd
May 09 15:29:37 fedora kernel: usb 1-7: WARN: invalid context state
for evaluate context command.
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: RAP: optional rap
ta ucode is not available
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: SECUREDISPLAY:
optional securedisplay ta ucode is not available
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: SMU is resuming...
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: smu driver if
version =3D 0x0000002e, smu fw if version =3D 0x00000033, smu fw program =
=3D
0, smu fw version =3D 0x00684c00 (104.76.0)
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: SMU is resumed successf=
ully!
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: program
CP_MES_CNTL : 0x4000000
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: program
CP_MES_CNTL : 0xc000000
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: [drm] DMUB
hardware initialized: version=3D0x0A003500
May 09 15:29:37 fedora kernel: ata4: SATA link down (SStatus 0 SControl 300=
)
May 09 15:29:37 fedora kernel: ata3: SATA link down (SStatus 0 SControl 300=
)
May 09 15:29:37 fedora kernel: ata2: SATA link down (SStatus 0 SControl 300=
)
May 09 15:29:37 fedora kernel: usb 1-7: reset full-speed USB device
number 3 using xhci_hcd
May 09 15:29:37 fedora kernel: ata1: SATA link up 6.0 Gbps (SStatus
133 SControl 300)
May 09 15:29:37 fedora kernel: sd 0:0:0:0: [sda] Starting disk
May 09 15:29:37 fedora kernel: ata1.00: configured for UDMA/133
May 09 15:29:37 fedora kernel: ahci 0000:0d:00.0: port does not
support device sleep
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: ring gfx_0.0.0
uses VM inv eng 0 on hub 0
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: ring comp_1.0.0
uses VM inv eng 1 on hub 0
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: ring comp_1.1.0
uses VM inv eng 4 on hub 0
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: ring comp_1.0.1
uses VM inv eng 7 on hub 0
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: ring comp_1.1.1
uses VM inv eng 8 on hub 0
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: ring sdma0 uses VM
inv eng 9 on hub 0
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: ring sdma1 uses VM
inv eng 10 on hub 0
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: ring vcn_unified_0
uses VM inv eng 0 on hub 8
May 09 15:29:37 fedora kernel: amdgpu 0000:03:00.0: ring jpeg_dec uses
VM inv eng 1 on hub 8
May 09 15:29:37 fedora kernel: usb 1-10: WARN: invalid context state
for evaluate context command.
May 09 15:29:37 fedora kernel: usb 1-10: reset full-speed USB device
number 6 using xhci_hcd
May 09 15:29:37 fedora kernel: usb 1-1: reset high-speed USB device
number 2 using xhci_hcd
May 09 15:29:37 fedora kernel: usb 1-1.4: reset high-speed USB device
number 4 using xhci_hcd
May 09 15:29:37 fedora kernel: PM: resume devices took 2.046 seconds
May 09 15:29:37 fedora kernel: OOM killer enabled.
May 09 15:29:37 fedora kernel: Restarting tasks: Starting
May 09 15:29:37 fedora kernel: usb 7-1: USB disconnect, device number 2
May 09 15:29:37 fedora kernel: Restarting tasks: Done
May 09 15:29:37 fedora kernel: efivarfs: resyncing variable state
May 09 15:29:37 fedora kernel: efivarfs: finished resyncing variable state
May 09 15:29:37 fedora kernel: random: crng reseeded on system resumption
May 09 15:29:37 fedora kernel: PM: suspend exit
May 09 15:29:37 fedora kernel: Bluetooth: hci0: RTL: examining
hci_ver=3D0a hci_rev=3D000b lmp_ver=3D0a lmp_subver=3D8761
May 09 15:29:37 fedora kernel: Bluetooth: hci0: RTL: rom_version
status=3D0 version=3D1
May 09 15:29:37 fedora kernel: Bluetooth: hci0: RTL: btrtl_initialize: key =
id 0
May 09 15:29:37 fedora kernel: Bluetooth: hci0: RTL: loading
rtl_bt/rtl8761bu_fw.bin
May 09 15:29:37 fedora kernel: Bluetooth: hci0: RTL: loading
rtl_bt/rtl8761bu_config.bin
May 09 15:29:37 fedora kernel: Bluetooth: hci0: RTL: cfg_sz 6, total sz 302=
10
May 09 15:29:37 fedora kernel: Realtek Internal NBASE-T PHY
r8169-0-a00:00: attached PHY driver (mii_bus:phy_addr=3Dr8169-0-a00:00,
irq=3DMAC)
May 09 15:29:37 fedora kernel: r8169 0000:0a:00.0 eno1: Link is Down
May 09 15:29:38 fedora kernel: Bluetooth: hci0: RTL: fw version 0xdfc6d922
May 09 15:29:38 fedora kernel: Bluetooth: MGMT ver 1.23
May 09 15:29:41 fedora kernel: r8169 0000:0a:00.0 eno1: Link is Up -
2.5Gbps/Full - flow control rx/tx
May 09 15:30:00 fedora kernel: input: soundcore Space One (AVRCP) as
/devices/virtual/input/input32
May 09 15:31:40 fedora kernel: xhci_hcd 0000:0f:00.0: remove, state 1
May 09 15:31:40 fedora kernel: usb usb7: USB disconnect, device number 1
May 09 15:31:40 fedora kernel: xhci_hcd 0000:0f:00.0: USB bus 7 deregistere=
d
May 09 15:31:41 fedora kernel: pci 0000:0f:00.0: [1022:15b8] type 00
class 0x0c0330 PCIe Endpoint
May 09 15:31:41 fedora kernel: pci 0000:0f:00.0: BAR 0 [mem
0xf6e00000-0xf6efffff 64bit]
May 09 15:31:41 fedora kernel: pci 0000:0f:00.0: PME# supported from
D0 D3hot D3cold
May 09 15:31:41 fedora kernel: pci 0000:0f:00.0: Adding to iommu group 30
May 09 15:31:41 fedora kernel: pci 0000:0f:00.0: BAR 0 [mem
0xf6e00000-0xf6efffff 64bit]: assigned
May 09 15:31:41 fedora kernel: xhci_hcd 0000:0f:00.0: xHCI Host Controller
May 09 15:31:41 fedora kernel: xhci_hcd 0000:0f:00.0: new USB bus
registered, assigned bus number 7
May 09 15:31:41 fedora kernel: xhci_hcd 0000:0f:00.0: USB3 root hub has no =
ports
May 09 15:31:41 fedora kernel: xhci_hcd 0000:0f:00.0: hcc params
0x0110ffc5 hci version 0x120 quirks 0x0000000200000010
May 09 15:31:41 fedora kernel: usb usb7: New USB device found,
idVendor=3D1d6b, idProduct=3D0002, bcdDevice=3D 7.00
May 09 15:31:41 fedora kernel: usb usb7: New USB device strings:
Mfr=3D3, Product=3D2, SerialNumber=3D1
May 09 15:31:41 fedora kernel: usb usb7: Product: xHCI Host Controller
May 09 15:31:41 fedora kernel: usb usb7: Manufacturer: Linux
7.0.2-300.vanilla.fc44.x86_64 xhci-hcd
May 09 15:31:41 fedora kernel: usb usb7: SerialNumber: 0000:0f:00.0
May 09 15:31:41 fedora kernel: hub 7-0:1.0: USB hub found
May 09 15:31:41 fedora kernel: hub 7-0:1.0: 1 port detected
May 09 15:31:41 fedora kernel: usb 7-1: new full-speed USB device
number 2 using xhci_hcd
May 09 15:31:42 fedora kernel: usb 7-1: New USB device found,
idVendor=3D046d, idProduct=3Dc52b, bcdDevice=3D12.11
May 09 15:31:42 fedora kernel: usb 7-1: New USB device strings: Mfr=3D1,
Product=3D2, SerialNumber=3D0
May 09 15:31:42 fedora kernel: usb 7-1: Product: USB Receiver
May 09 15:31:42 fedora kernel: usb 7-1: Manufacturer: Logitech
May 09 15:31:42 fedora kernel: logitech-djreceiver
0003:046D:C52B.000C: hiddev96,hidraw1: USB HID v1.11 Device [Logitech
USB Receiver] on usb-0000:0f:00.0-1/input2
May 09 15:31:42 fedora kernel: input: Logitech M720 Triathlon as
/devices/pci0000:00/0000:00:08.3/0000:0f:00.0/usb7/7-1/7-1:1.2/0003:046D:C5=
2B.000C/0003:046D:405E.000D/input/input33
May 09 15:31:42 fedora kernel: logitech-hidpp-device
0003:046D:405E.000D: input,hidraw3: USB HID v1.11 Keyboard [Logitech
M720 Triathlon] on usb-0000:0f:00.0-1/input2:1
May 09 15:31:42 fedora kernel: logitech-hidpp-device
0003:046D:405E.000D: HID++ 4.5 device connected.

You can see at 15:31 the results of me running echo 1 >
/sys/bus/pci/devices/0000:0f:00.0/remove followed by echo 1 >
/sys/bus/pci/rescan here. This works 100% of the time to restore. I
have now wired this up to a systemd unit. Let me know if I can provide
anything else that would help?


On Sat, Apr 4, 2026 at 2:24=E2=80=AFPM Michal Pecio <michal.pecio@gmail.com=
> wrote:
>
> On Sat, 4 Apr 2026 13:04:02 +0100, Martin Alderson wrote:
> > Just for clarity this never happened to me with the 6.19 kernel I was
> > on before (suspend/resumed many times on that kernel with no issues).
> > It's happened twice now (once with rc5, now with rc6) in a short space
> > of time.
>
> So apparently about once per week. That's not very easy to debug.
> One trick I have seen people use to accelerate such tests is running
> "rtcwake -s 5 -m freeze" in a loop. This puts the system in s2idle and
> resumes automatically after 5 seconds.
>
> Do you have more complete dmesg from those failures with timestamps?
> From suspend up to until everything has calmed down after resume, or
> also including whatever you have done later to restore operation.
>
> > Previously I was on the Fedora 43 default kernel series, now I
> > switched to the COPR for 7.x (to try and fix something else).
>
> Not sure what COPR is, but I gather it went like this:
> 1. Fedora 6.19 kernel was OK for a long time
> 2. Some other kernel, possibly other config, 7.0-rc4 still worked, but
>    only used for a short time. What about 7.0-rc1 to -rc3?
> 3. After updating to -rc5 it's definitely broken.
>
> > Thanks for the bugzilla, I'll look at some of those workarounds.
>
> Particularly, collecting dynamic debug and debugfs could tell if it's
> the same problem with missing IRQ after resume or something else.
>
> Regards,
> Michal

