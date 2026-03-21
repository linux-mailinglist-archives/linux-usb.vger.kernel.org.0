Return-Path: <linux-usb+bounces-35273-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANQkApydvmklUgMAu9opvQ
	(envelope-from <linux-usb+bounces-35273-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 14:31:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 730282E588F
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 14:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 519243021983
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 13:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B211C3876A1;
	Sat, 21 Mar 2026 13:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3L1wx9p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6FC1D9663
	for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774099865; cv=none; b=RST+cQekM5TtPTdTFqdz8m2U5a6H3pOHENg0jcrBrOOL9/0yJJqhu4k5NnnZz6ZBIKX88rhCjAm7LdZb1Jl3bKl55LVNGWhjvtlW4ep0Rhd9qr8gXZXH8IElfnv+gGHviuvvJ+T1JM/InyUWT8dK7rhXBAtWsxzfbXTEVfLUU10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774099865; c=relaxed/simple;
	bh=TS74yASh6Sth3jqoKNNSfMcv/uTccducddabCfTPQ/g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VztHtZjWslA6c3rMXpdsvLC7rAqkwMWuHFSPI0m+vU6ts34dYgZpWVq+McrGwK4EjhkVzLlAQmXSd6SYCVCE6kNoJr0NqdlI/Uj5plCTVRflXZqNq8bh//+akTi+5Jos+rVlpggQ937zo4rYgAGbaUfTa6w4yLEuJR50dKvCmaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3L1wx9p; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b976536806cso437618766b.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774099862; x=1774704662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7XPUnQJv46kWrhJe/zsWMLxww6MojTktk6olvtQynI=;
        b=S3L1wx9pyMt6GA+4Ppe0d6W5k5RcXenqqZQLI7JdyRYPj+iuJwTVX4x1b2J0ho8IyS
         302EU8nAyDNSMKhCRkE7vj3b51WsaiCT8Niisv12OEr+RUMuG1cEyFb0q0/1dVV2fAZO
         aBH6cIci1CsY2Q1SPcPxmSkCw8L6MgPoOZlMrSU9dhqNohefcOcJN4i6UBEraCHpLrAG
         PDSHVVTrO572v98r5JJDgrko8lg6M1pYnljcK8pmDwZcUczogwV7KCV/Qohhu4Njizsc
         5BlT9VIgy+Twlc2sCoLHNwN+D7AcmB4SLg6YwCTTF22eGDc/gtnI2Dr1CXyQTb73qt51
         tEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774099862; x=1774704662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p7XPUnQJv46kWrhJe/zsWMLxww6MojTktk6olvtQynI=;
        b=rslOeCXBzzM7i7v8a8lNNjxPirGhWMDgC/C8T4tc7St3WPgxFihuAPupY4bOUMezyg
         o6GF3hmbSKqM+CQYD7LhWzKnPFZzAU3nOEVXqvY5vz1/LMbfV57CJFHvgQfs49I7bDrh
         iIr8Kl/IyMEPrMDno4J9gq1yVJ21BHKDCr97HIfK2KSnVHcLg48saDZAjhSnYXtNYpWT
         D5zvr0NV4ZwP2z1AFs/LjXVsqsS8Cd2RwzIC0rrbSsvL9h3TzRUzLWo+/FZExJ8z2rsQ
         sDp6saMKpEntaYvs06sFaD6iTkBYN+Sy3letZVXrsKKwFW0/HQ4zOFWOIKBFrCisBsrq
         T12Q==
X-Forwarded-Encrypted: i=1; AJvYcCWoCDzawXRVzmJISXzoYDbBtBLvFvIe7ahD5JjYk1NGvHSF++NLYb/9qC4YUg1pbmwAlttOKjqoYgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjZgt2YHkxvAdBSXwZEIdqTJwSgSMpE6lKOmaRxv/HYx2vlDXg
	G4qxVtiQANVgXtXEOHomYaqqlg6huqOkYjqgMqGVnUWJId/C4TJtHZMJWQO/VQ==
X-Gm-Gg: ATEYQzyO90HUAaKZ2kHEGSo8qlYbMNCF9zRNnZGUqcNfVWDPO21rfhq/+Nv1pPVkFSl
	p8XDXp4h40k81bIjP6yZPzMXrVkkkeJHYGfI0rxhnXNCRrT/iSPdKQjOdonX1KtDooUKgro/FPI
	/CDM+D5FA03wxhAULLgmCOL5ezpmyoN2xIo+SzVRb51EBBNN7/NRjFmEfXCkVnqyehR65+B/FvL
	xZIadf2qPiR9w3FnIOnX62NAQ6IRQn0xer/10Rv84ZmS4r482fckGh1vuoaiohX2eOp2gQhvidL
	HVmZHugywVmN9nKakKxXMJ0PjOtlDlblKhMk7loeBHuQe8rN3xXXRxej6QsUUzmxRVh75B5ysZv
	VdxERp+WHVjFYu1oTtm1zuzQRnnwELHWGxYXavu+XAb47nJYZ2o7uIi0pzppu2M4USDJf6IN7H9
	rfuX4TdYfUaZzjrTyYfw5MJVV+C2Yy+nE3eTA=
X-Received: by 2002:a17:907:d307:b0:b87:965:9079 with SMTP id a640c23a62f3a-b982f1ec9cdmr469627266b.3.1774099862124;
        Sat, 21 Mar 2026 06:31:02 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b984bfdb2f1sm88356766b.19.2026.03.21.06.31.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 21 Mar 2026 06:31:01 -0700 (PDT)
Date: Sat, 21 Mar 2026 14:30:57 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: xhci: fix Command Aborting
Message-ID: <20260321143057.1bf31b1b.michal.pecio@gmail.com>
In-Reply-To: <20260316142720.1471906-2-niklas.neronin@linux.intel.com>
References: <20260316142720.1471906-1-niklas.neronin@linux.intel.com>
	<20260316142720.1471906-2-niklas.neronin@linux.intel.com>
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35273-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 730282E588F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 15:27:19 +0100, Niklas Neronin wrote:
> Aborting the command ring requires setting the Command Abort (CA) bit
> in the 64-bit Command Ring Control Register (CRCR). Historically,
> several attempts have been made to implement this correctly, but each
> introduced its own problems. This patch fixes the final remaining
> issue: accidental modification of the Command Ring Pointer (i'll
> abbreviate it to CRP).
> 
> Originally [1], the full 64-bit CRCR value was read and written back
> after setting CA. This is a bit unnecessary, only RsvdP bits (5:4)
> should be read and written back (for future-proofing). All other
> writable fields read as zero.
> 
> Later patches attempted to solve an issues, caused by 64-bit writes
> being split into two 32-bit writes. Writing the lower 31:0 bits first
> immediately stopped the ring (CRR=0), and the following upper-half
> write then overwrote part of CRP with zeroes, thus corrupting the CRP.
> Patch [2] avoided this by writing only the lower 31:0 bits with CA
> set, but that broke controllers that latch 64-bit registers only when
> the upper bits are written, as reported in [3].

I too have HW which waits for the high DWORD after low DWORD write.

And I have HW which doesn't. If I write 0xdeadbeef to the high DWORD
after waiting for CRR=0, some HW will ignore the write and some will
IOMMU fault at 0xdeadbeefsomething.

The abort itself takes a few microseconds in my tests.
Is this race causing problems in the real world?

> The current solution [4] attempted to fix this by writing the full
> 64-bit CRCR with both CA and an updated CRP. This does not work. The
> patch tries to modify CRP while setting CA, but with CRR=1 all writes
> to CRP are ignored. Updating CRP requires writing only the CA bit,
> waiting for the controller to process the abort and clear CRR, and
> only then writing the full CRP value.

That's not a problem yet because we *don't* want to change anything.

> Writing a new CRP after CA clears CRR is also unsafe:
>  * TRBs are 16-byte aligned (bits 3:0 clear)
>  * CRP requires 64-byte alignment (bits 5:0 clear)
> Writing a TRB pointer into CRP truncates bits 5:4

But this is a problem and I found HW (NEC, AMD) where waiting for
CRR=0 and writing correct high DWORD causes "mismatched completion"
errors, which is almost certainly (I haven't debugged) this thing.

> For a Command Abort to succeed, the CA bit must be set without
> modifying the CRP. The following sequence ensures this:
> 
>   1. Write the lower 31:0 bits with only the CA bit set. Since CRR=1,
>      CRP write is ignored.
> 
>   2. Poll CRR. If CRR becomes 0, the abort succeeded with CRP
>      preserved.
> 
>   3. If CRR does not clear (timeout), test if controller requires an
>      upper bits write to latch the register. Write the upper 63:32
>      bits (which does not update the CRP because CRR=1).

Unless it just flipped to zero and CRP becomes corrupted as usual.

>      Then poll CRR again. If CRR becomes 0, it was a latching issue
>      and the abort succeeded with CRP preserved.

Another problem is that this slows down the double-write chips and
polls them under spinlock, which is completely crazy because it blocks
xhci_irq() and other IRQs and generally freezes the whole system.

Not sure if there is a way out of this madness without writeq(), quirks
or a completely out-of-the-box solution, like making it possible to
restore CRP. Truncation can be dealt with by ensuring that a few TRBs
before Dequeue are unused and can be made No-Ops at any time.

Regards,
Michal


