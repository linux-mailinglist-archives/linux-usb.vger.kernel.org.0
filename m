Return-Path: <linux-usb+bounces-38225-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOLSMX04HWoqWQkAu9opvQ
	(envelope-from <linux-usb+bounces-38225-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 09:45:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C88261B0EB
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 09:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14B0F308A5F6
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 07:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD6034753F;
	Mon,  1 Jun 2026 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tC4NdUGg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2303F386562
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 07:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780299510; cv=none; b=nia937387JM4IP8CoxHqvLQA50f98PBj/GKD3jsCfk8jhxWkOMnP/RkFLQsMHN63t/dFWYkgMAp3l81DgOrpilb9j2WTOLDe7o7CJ5njMm2Qz7VYbXatHdCy7s+uk+dAPM0daDGiJYNiz7fLXeVF50Di7TJfGaF5m+lnxPLZcsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780299510; c=relaxed/simple;
	bh=HQtzW+AzPTHtktemBwgJ1/AqdLD9KikDHuB6vjDahhE=;
	h=MIME-Version:From:To:Cc:Subject:Message-ID:Date:Content-Type; b=P+dk2e7/wUr2RPmXSizUCkMSzWN8DEmeNPEK971qhCFoRgsCmSj6aFj1ZS4BzUxSUwzWsbBaoa7g/z21fm2/1EMZeHqEkGzBlkLu+yhvJ67uHVjZ6IzMgSzFExaW1sDjBzCrnNxpEKx13GD+LdK/MdrVpl2GTMvFj0dWwyxSN3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tC4NdUGg; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c3543590so6327195ad.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 00:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780299508; x=1780904308; darn=vger.kernel.org;
        h=content-transfer-encoding:date:message-id:subject:cc:to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Li7NM+/Fc50bd4rV+8seyueGkphlIKWlChj7iNY/Qss=;
        b=tC4NdUGgN1r8l/jTCwambRe1lYG0KaKVrgIg4sqX5prwmN4wdvISm10mfNXLRGihz0
         9XM2+ilICi59opwXEpasePihheWYyGiXb5hRexjp5Il0BJHCNvCcvjLxAyF8TBjP28We
         rUmXDbJfnxsVp0Bphe+0HOqT4wzkBRlLYuxSvsFkbiTrFRNOgF4tR9svKaIPXxWOf6xF
         8o6UTtbeQ/mhG+1TnxnAVtZY6NgqZn4lJ7FLiIvFl3gu+WF7Bf03yJS34CdiP+CU4BQZ
         U0P2agrOlfx96s5BhizSF/B+FMSmfDZVinhLKXCuMrhZLdaxo2B7otegX3jBMVQX9k7B
         qZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780299508; x=1780904308;
        h=content-transfer-encoding:date:message-id:subject:cc:to:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Li7NM+/Fc50bd4rV+8seyueGkphlIKWlChj7iNY/Qss=;
        b=UgF6iN6oCs7rrY1cxyY1tzmDaWDVMz9nJIsxyj8HgYGR1jJXK4mkFoi/bCV88iNKGl
         tZOOWqIYz6OO2ZmBdtwfS4cc3jSgTxv+E+kxXab/+D+b0GeB6HfTpu2T/T3wSvkW30i9
         5MPeqYv+ozp9O2q7fI0mHshnI+1ayD46+L5mbkUVQMxT58j/sTucp0VCJefgtVmTPFSL
         kIToTuiKh/lYLh2cAuhnk4XNkkdAgBdI0OkbDhC1liwKWZBbHgoEfU3N6RMgAi9R6/rq
         t6zwL8UJrNjkbBHm/zopxsEDiIZs51917crLs+U9TCrSYUj1MrYaMulI4gaS0F7lTdMa
         1y7Q==
X-Gm-Message-State: AOJu0Yyk5pVjx555BmZvI7L7id0+otHrCZQDefMHtGnfGweBHJq3bYF3
	M8EmlLmH1+aFW+vchdkw5KjbrqVxvgTVxwYwwlSBsKI5nwfHf0m4Rw8W
X-Gm-Gg: Acq92OHTs127tH6cfB+sVLU5XVGVSZ2CDkfKaKyHdjbjEgJAS/xvHv6Fr6h6xHP83YS
	Q86QqkD8qAvr8kmHKMcsVAi1f24vFMjGoGN6pAFtkMED41yW4eA/eny9q5nRYvmIO4mCWpMBW02
	vuGX2aURs0pp/mzhNkpdqICczvSjUXom8Un42IzGewfbpfT9B1xAcOueCVwcrInoEbGDWv6CYln
	3wvvqolg6w1n+Of7hC7rICbT8UxEx7zRGBk2SrVZsEOFP7RiNbvEgfWpjSrzgAcphF4ihO5WFzO
	BsGBoZTcUROQKcIRr7kmAbyYXzhC0wlAfI+Fat6JOaCALabP8lSPVMWpUfC1y0w57LN8q4so0I4
	EyVFsjYrzRHspcEz7Svx4Hm61aLc7Klcn2Dlg/rXfFHGoCRQibswyO9+1LlpUB19T1dkwF50LnR
	GMGHmaGqO+JefHHgfeDG6eW89an2N9KlDJ26GVxMl4AhOM37E=
X-Received: by 2002:a17:903:2441:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2bf7b62a302mr102041225ad.9.1780299508211;
        Mon, 01 Jun 2026 00:38:28 -0700 (PDT)
Received: from GordonMsi ([240e:39e:4b6:6d00:7d23:c974:a73d:af3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a21f0bsm90285415ad.34.2026.06.01.00.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 00:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Gordon Chen" <chengordon326@gmail.com>
To: "Mario Limonciello" <mario.limonciello@amd.com>, 
	"Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>, 
	"Mathias Nyman" <mathias.nyman@intel.com>
Cc: <linux-usb@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>, 
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: USB-audio isochronous Missed Service Errors on AMD Zen5 client (Fire
	 Range) -- Data Fabric idle C-state? No OS-level knob found
Message-ID: <18b4e4f7089aa4f1.da8dbe994ae3bb77.445e21b98b0b205b@GordonMsi>
Date: Mon, 1 Jun 2026 07:38:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-38225-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chengordon326@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 5C88261B0EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mario, Shyam, Mathias,

I'm reporting what looks like an interaction between AMD client SoC idle
power management (Data Fabric / SOCCLK) and low-latency isochronous USB
DMA, on a Ryzen 9 9955HX3D (Fire Range, Zen5) laptop. It reproduces on any
AMD Zen4/5 client I or others have tried, with any USB audio interface;
there is an open community bug with several different-vendor devices [1].

I have a strong differential pointing below the OS, but no way to read DF
C-state residency on this platform to confirm -- hence this mail. Questions
are at the end.

Symptom
-------
USB audio playback has frequent audible clicks, and after ~10-30 min of
continuous playback an occasional full stall. Each click maps 1:1 (time-
aligned) to a short isochronous OUT URB; at the packet level these are
iso_frame_desc[i].status = -EXDEV (COMP_MISSED_SERVICE_ERROR) -- the xHCI
controller missed servicing a 125 us microframe. urb->error_count stays 0
and nothing reaches dmesg; you have to look at per-packet status or count
short OUT URBs. The stall is the same fault at its extreme: on an implicit-
feedback device, a whole errored capture URB starves the OUT ring until
re-plug.

What I tried (all ineffective except the last)
----------------------------------------------
  cpu_dma_latency = 0 (PM QoS, verified locked)        no change
  cpuidle: all C-states disabled                       no change
  cpufreq governor = performance                       no change
  amdgpu power_dpm_force_performance_level = high       no change
  stress-ng --cpu 16 (pure compute, little mem traffic) no change
  stress-ng --stream  (sustained memory bandwidth)     misses -> 0

So CPU residency/frequency is not the lever; sustained memory-controller
traffic is. Reading SoC clock DPM (amdgpu pp_dpm_socclk / pp_dpm_mclk):
idle and under --cpu it sits at socclk 400 MHz / mclk 1600 MHz; under
--stream it jumps to socclk 1200 / mclk 2800.

This points away from clock frequency as the lever: a single --stream
worker already pins socclk=1200 / mclk=2800, yet the misses persist; it
takes several workers of continuous traffic before they drop to zero. So
what tracks the fix is not the clock the SoC reaches, but the amount of
sustained memory-controller traffic. My working hypothesis is that the
Data Fabric idles into a low-power state between the sparse isochronous
transactions, and that the wake/traversal latency on the next microframe
can then exceed the 125 us deadline -- with only traffic dense enough to
keep the fabric out of that state avoiding it. I cannot confirm that from
the OS (I have no way to read DF C-state residency here), so I would
welcome a sanity check on the mechanism; the measurements above are what
I am confident of.

I could not reach this from the OS: profile_peak / force=high do not raise
socclk (ignored for an otherwise-idle iGPU), and a manual pp_dpm_socclk /
pp_dpm_mclk write is rejected with -EINVAL. The BIOS on this laptop exposes
no "DF C-States" / "Power Supply Idle Control" option.

Reproducer
----------
Any AMD Zen4/5 client + any USB audio interface, playing continuously:

  # count short OUT URBs (= missed-service events); nominal is the device's
  # full OUT packet size (768 bytes for the Flow 8 at 48 kHz / 4 ch)
  bpftrace -e 'kprobe:snd_complete_urb {
    $u = (struct urb *)arg0;
    if ((($u->pipe >> 7) & 1) == 0 && $u->actual_length < 768) { @miss++; }
  }'

  # while watching: cat /sys/class/drm/cardN/device/pp_dpm_socclk
  # baseline:           misses > 0,  socclk pinned at 400 MHz
  # with stress-ng --stream 4 running:  misses 0,  socclk 1200 MHz

Questions
---------
 1. Is this a known interaction between DF idle power state (DF C-states /
    SOCCLK gating) and latency-sensitive isochronous DMA on client SoCs --
    an erratum or documented behaviour?

 2. Is there a supported way to hold the Data Fabric out of its deep idle
    state (or set a fabric-active floor) while a latency-sensitive iso USB
    endpoint is streaming -- a kernel interface (amd_pmc / amd_node?), or a
    firmware/PMFW setting -- short of burning memory bandwidth?

 3. If not, what telemetry would help characterize this (amd_pmc STB dump?
    specific SMN / DF P-state or C-state registers? a debugfs)? I'm happy
    to build an instrumented kernel and test patches.

Related: the extreme stall case (whole-URB error on the implicitly-fed OUT
ring) is separately handled in snd-usb-audio by a Flow 8 quirk that emits
silence instead of hanging (commit a23812004228). That only papers over the
hang and does nothing about the clicks, which are the subject here.

System: Ryzen 9 9955HX3D (Fire Range, Zen5, 16C/32T), AMD xHCI, iGPU
smu_v13_0_0 (0x13c0); kernel 7.0.10 (CachyOS, close to mainline for
usb / xhci / amd power-management).

Thanks,
Gordon Chen

[1] https://github.com/CachyOS/linux-cachyos/issues/665

