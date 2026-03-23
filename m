Return-Path: <linux-usb+bounces-35329-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ+rNfEjwWmTQwQAu9opvQ
	(envelope-from <linux-usb+bounces-35329-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 12:28:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 451E92F1365
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 12:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D16130062E7
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 11:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7606F3921F8;
	Mon, 23 Mar 2026 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnWT/iGn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E600364EB2
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265108; cv=none; b=UtRGGhkNBajn8i3wztsaypOgjgyGw3y6BQStMwrVu4SCsbaRQ/vuU2XT8yFR3BI6hSMepJ+7vSD6SC7utNYsRWXShcrZgQ8InNT9MfBoKUZsPmh/UKFkzJWXm5Tsk8MXHlKgQvHisEwTWix7VJIdB1jqs3ELUoKIpEUC+fVe7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265108; c=relaxed/simple;
	bh=d1mbfh30PSWLcQGHHJ7QO5Q8nJ2bBIIOFG2e0lGUds0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=my/Z8V8DC2WnkMhIg8uJ2KYU/vk9RTGTZ58xUz/9ZTaiPfyOB/oxNcUsckRMkLgs0T0Da6v2/XHz95yEvK7qW9EcQ1gLPZWN3ySsV9O3HJdRpy4udvwyrYacXCqifiDBakJZHZjL/L2AX7MPIMXKdfTpTJYZ4PotAvmn8nmgsio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnWT/iGn; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6696421701fso1780085a12.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 04:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774265104; x=1774869904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyGVFwoqJXD6sTcQJaRkNfVnZ6mG4fmvwfHqwA2ASCA=;
        b=XnWT/iGnM59wfrlCJ4GMjncZc5ybozmoA4m6peE75MwKXsW4hs9e8OVyQfQIT+mL6b
         CVXAvBbTKlsT1L10QdZx8p6iCnf+52u6vZifXecFc++TzA7KO7CCTJESJ9R+9f0frW58
         UFpe05hcKptyOkZMD5N9B/UKKog9xjxzrjZ9oIH4pAe1taJts34WBu7nLOel0maCnl6d
         u/7Ml+drqYGr3Yum/qGY/Ccl1Gwhlwfayxm7uWBADknru9jm5NBPql/vwjg//tS12uCG
         xZnfn7Fz+ziEwo6Ccqt6zyOvqZ5InWO9B+ZeZwlYO+H2c1hQXJQKXuTQS8utroiE/zD1
         pKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265104; x=1774869904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TyGVFwoqJXD6sTcQJaRkNfVnZ6mG4fmvwfHqwA2ASCA=;
        b=UHposuRBJaRovae2V4tDSg/Utf1iHOtdZXcLFiRU/wWaQjMFAv2nu+TWbpTCVCJAtZ
         Yi9UdlPEzQQvRGRSAsVj/gb24umrtWW3pkNw8dvDqrn7cu26l4+sqYAcb6itOmYKHpIG
         7h7wCxZTsnt9R+qEhKsnYS228HoeuC7HR5s3CAmfeNuljSBEwhV3Q4AaE7sjbcCffCAw
         hMrkqrLRtQcdQTeAFqYEsclkycHWB4uWOhQocLb/QueAX45qe92Q9dTbw8p6RTig6SrH
         ukgRWfDjgy9+Q63xdENyPuBwW05EX4fNGLrJFpEV7L4ZSxSscDJ6w2TH42G+SSI1h8Nf
         leBA==
X-Forwarded-Encrypted: i=1; AJvYcCUKU2TNZqS4BySClTCzqbxk2wyG+F3G/TPq2PawpWLtlmINsVr2mjYQZtRY2jsuX+3hdpr4DTYOFCE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb3WJmGYSqSwvB3PbWFChCrbwmoi2fVIcDW24ivZRs3IkadMp3
	VIZsIlhGcY3Yj8D1IQR7AcfcPdQy9cj5i6oYYYmT24L/JubVWuZ+5Qd5
X-Gm-Gg: ATEYQzy9GTTVWUveRgoV0lGiz8oeTRAzEt3CVSSVgpMxLQnqOC3juNL/I6r6HgyjeXt
	haDdHxVn9ef8NbOgg0Rp+e3rsxkG+COg5gIdvLBb+F2xNd6ZqpFdPYocWWySJCuDR5Ovt8lvV3G
	IqSypFhpRjxEawM9Sy4HLVVMsZi9b+CMu0xpGZlqaPYAJ3VXtnL5ahLteVXqB7Yx4lMMzDtyYFU
	swnw9E+2gHL1GWXXEVWTrlB0zJNTEj7qj7N5ERyWg3RXaKVHaSOgrI2jM6HUsvfQ7zJUPPL60kj
	Z5yZWtuPEHX3uaLt7jVNaMSp8Yjja8WQLtuOsfx7g24Pf7JZZzSJ+AoJqCJOipesDm3txBhgVSG
	K2hN54sqmIufKSUZ15qj0fvwdBrh3QpDXN85oljAXXA9Jh37xQy1Bi1/ucJNifSv4BDSAVO3TCv
	9rsmOJQiyx0jBHgSjs34k1J0u6k4IZPWt3pe0=
X-Received: by 2002:a05:6402:1ecc:b0:668:368b:38d7 with SMTP id 4fb4d7f45d1cf-668c93239dfmr8479086a12.8.1774265104024;
        Mon, 23 Mar 2026 04:25:04 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cf7e30f7sm3603218a12.8.2026.03.23.04.25.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 23 Mar 2026 04:25:03 -0700 (PDT)
Date: Mon, 23 Mar 2026 12:24:58 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org, Pavankumar
 Kondeti <quic_pkondeti@quicinc.com>, Pavankumar Kondeti
 <pkondeti@codeaurora.org>
Subject: Re: [PATCH 1/2] usb: xhci: fix Command Aborting
Message-ID: <20260323122458.0af6b4d0.michal.pecio@gmail.com>
In-Reply-To: <56606a55-b1cb-4669-9025-8a91d8d258bf@linux.intel.com>
References: <20260316142720.1471906-1-niklas.neronin@linux.intel.com>
	<20260316142720.1471906-2-niklas.neronin@linux.intel.com>
	<20260321143057.1bf31b1b.michal.pecio@gmail.com>
	<56606a55-b1cb-4669-9025-8a91d8d258bf@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35329-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 451E92F1365
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 23 Mar 2026 12:25:00 +0200, Neronin, Niklas wrote:
> On 21/03/2026 15.30, Michal Pecio wrote:
> > On Mon, 16 Mar 2026 15:27:19 +0100, Niklas Neronin wrote:  
> >> Aborting the command ring requires setting the Command Abort (CA)
> >> bit in the 64-bit Command Ring Control Register (CRCR).
> >> Historically, several attempts have been made to implement this
> >> correctly, but each introduced its own problems. This patch fixes
> >> the final remaining issue: accidental modification of the Command
> >> Ring Pointer (i'll abbreviate it to CRP).
> >>
> >> Originally [1], the full 64-bit CRCR value was read and written
> >> back after setting CA. This is a bit unnecessary, only RsvdP bits
> >> (5:4) should be read and written back (for future-proofing). All
> >> other writable fields read as zero.
> >>
> >> Later patches attempted to solve an issues, caused by 64-bit writes
> >> being split into two 32-bit writes. Writing the lower 31:0 bits
> >> first immediately stopped the ring (CRR=0), and the following
> >> upper-half write then overwrote part of CRP with zeroes, thus
> >> corrupting the CRP. Patch [2] avoided this by writing only the
> >> lower 31:0 bits with CA set, but that broke controllers that latch
> >> 64-bit registers only when the upper bits are written, as reported
> >> in [3].  
> > 
> > I too have HW which waits for the high DWORD after low DWORD write.
> > 
> > And I have HW which doesn't. If I write 0xdeadbeef to the high DWORD
> > after waiting for CRR=0, some HW will ignore the write and some will
> > IOMMU fault at 0xdeadbeefsomething.
> > 
> > The abort itself takes a few microseconds in my tests.  
> 
> Yes, abort completion itself is usually very fast. The 5 second
> timeout comes directly from the xHCI 1.9 specification, which
> explicitly allows for that duration.
> 
> 4.6.1.2 Aborting a Command:
> "If software doesn't see CRR negated in a timely manner (e.g. longer
>  than 5 seconds), then it should assume that there are larger problems
>  with the xHC and assert HCRST"
> 
> The timeout could probably be reduced to 1 second, but I did not do
> that since I do not have evidence that a shorter timeout would be
> safe across all hardware.

As noted in my later response to patch 2/2, in rare corner cases
ASMedia command abort can take a few seconds and still succeed.

> > Is this race causing problems in the real world?  
> 
> I believe so, given that a fix was proposed specifically to address it:
> https://lore.kernel.org/all/20211008092547.3996295-5-mathias.nyman@linux.intel.com/#t

It does look like a problem which people would be unlikely to discover
without being affected by it, but the patch says nothing.

Hi Pavankumar,

Could you elaborate on the above issue, what was the affected host
controller and what sort of workloads made this race turn bad?

In theory the two DWORD writes could be separated by some NMI/SMI
hitting the CPU or by heavy traffic on the I/O bus.


And if probelms are known to happen here, then what about other users
of xhci_write_64(), for example updating ERDP aka erst_dequeue?

> The current implementation does attempt to change the CRP.
> The sequence is as follows:
>  1. Fetch the next TRB.
>  2. If the TRB is a Link TRB, advance to the next TRB.
>  3. Get the DMA address of that TRB.
>  4. Write the lower DWORD with the new CRP address and the CA bit set.
>  5. Write the upper DWORD with the new CRP address.
> 
> This results in two possible final states, depending on how quickly
> CRR is cleared:
>  1. The CRP is not updated at all.
>  2. Only the upper DWORD of the CRP is updated.

I stand corrected, I wasn't aware of some details. That said,

1. is a valid outcome and not a bug, jumping to the next TRB is not
   necessary, it was a workaround for previous issues.
2. is a bug, but it shouldn't matter because the ring has one segment

But I did have problems on NEC and AMD, which means that something else
is also possible. I think I will need to debug it deeper, but I suspect
that writing high DWORD alone is enough to trigger bit 4:5 truncation
or overwrite low DWORD with some garbage.

> So you believe that when waiting for CRR=0 any software writes to
> CRCR, which are not immediately acted on, i.e. Command Stop/Abort,
> are instead buffered internally?

We all believe that some HW does nothing and waits for high DWORD.

Other HW is seen to begin aborting more or less immediately. However,
until the abort is complete, any subsequent write to high DWORD may
be ignored because we can't change CRP while CRR=1.

Problems begin if CRR=0 before we write high DWORD. CRP bits become
writeable and any write may trigger truncation of bits 4:5.

Note that if the HW interprets this as a single write to high DWORD
separate from the previous abort operation (which it has already
completed) then this is out of spec, because we should write low-high.

It seems that my Etron HC ignores this high DWORD write after CRR=0.
I can write 0xdeadbeef there and it continues working normally.
Or maybe it's broken and should get the disable 64 bits quirk.

But NEC and AMD start getting "mismatched completion" errors, so it
seems that their CRP is corrupted somehow. And I could probably replace
waiting for CRR=0 with usleep(20) and get the same corruption.

I will later look closer what happens here.

Regards,
Michal

