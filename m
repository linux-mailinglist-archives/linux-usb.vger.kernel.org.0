Return-Path: <linux-usb+bounces-38156-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCKpOpRqGWrGwQgAu9opvQ
	(envelope-from <linux-usb+bounces-38156-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 12:29:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEEB600D24
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 12:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8FCD30185B0
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 10:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FB0334C0D;
	Fri, 29 May 2026 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eu2thMku"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96F288B1
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050137; cv=none; b=mmamSYgvTApAl7dhpiYk2nFY/QpSCYNZaq+ui7bLX9AKVhRnmLm9YAU0eTN3MY+TxAfh3x0nNUHwvkoEGzGF3lAREV+wW6K2yMhFni0fkX91asUD4ZD1huJgHtr+Nh4ArMNohJ+iSQp13ZLwXB2vo9keREFiFTZ43C5cF5EqV+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050137; c=relaxed/simple;
	bh=swNaRLGpmCCNK7W25eaUSW7IfC1gM7H2TkDSocBO9rw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6psgmkmkfQSqsKrl1cMzmhpThbHoYH56pjH8veDM8XmWNUA9mVQRWEOJK24nZtGYrQXoZZTlecgqy9KnM0+tQzV/DVt03dzJTqANyeRwQS/NICD3XtyvQpRqbbR2DQHA2AGRsW0eePqA0sGA/rbOOck7VJs5DTSzRxZN6wsuA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eu2thMku; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4905529b933so54145575e9.0
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780050134; x=1780654934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnpfhPyxnJ7Kh0lmRKEyIf0TDS5gHxTUz0M9525P3r0=;
        b=eu2thMkui2fK+c9cBiW5YgqD1bcQVAOsTTwYtkzt5JJxHF33hYMru7vwy3kWGHE8wA
         w0uQAR08QoGSiwfN61yP/L2RrmWVqm10MLG5FzZR0IXSHVrTN1aiG4SnP3z/a3fi0zfS
         0tl/R2mj8EL4PxMXFvvtgqAuY11qKbSlbtOSq+dVdJ45dTY/6kGbY/HCut0A5o1VKXj2
         By527Ljt51d/FFb6gRp9t/U2LtB09cRRpdPKv23L7y0e1CbRsezVgO1I9PfnuKiBw6JL
         RilAGKNtkw+vo/6qMAkHdvPsCvUUTVkCjNfxC7h96enCenDRKmQuFLguEcjPPzwZ4yI2
         vBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050134; x=1780654934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lnpfhPyxnJ7Kh0lmRKEyIf0TDS5gHxTUz0M9525P3r0=;
        b=eRQ+j1GrwYZs7ERkNd1GnQSYvHxfjbn7YX4X9jP56JvVcHz6i2WzYfiQX/mvn1JZnI
         eWet4PgRdkWis4T6ppaju8oX0QpzntgvnljM4gsd5/Xy6Lueqx/NTnyD/T552wIKYnQn
         KBj0fEPe+zS69hZfnuSZcp0p2jiH6YgdzOPsJzaOlN1mztfjE597BkJwL6qjmNhcEiHy
         0a4YsWOU9BFCpoPuKwYimXjLa0jXiNsoUZ4xQRTC4rwE+K9Z+R/OM4qWz+Zcy8Ey6xLx
         ihhOHBFjRAsQ0fDTpPsGY3DgnLSqpTGEliyFJvr4LcEVZwLIBDRYETFRoT5SCQ3eBndC
         X+zg==
X-Forwarded-Encrypted: i=1; AFNElJ/f0SU9dqk83hokuvQFspNMolfHEjMgSw5pImRxyWir3iKFm256IRnpd7QU06dalEnXgMwPXutJGa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJPou98Zs8/JHOmla0y5RUbUXWo6k6QjNfcyboSOlu9MiRP9io
	WtvkZuMqBfyuLBAZSNci6cZtxS3VyeUB72ynEuDGTSeTWh//uOM2XGIAOl07dw==
X-Gm-Gg: Acq92OGbKj7AJPECjQ5Ativ5d9ReuzEk8D85jSfyKCkmMBHMnLbJHDm/b6gzuOOoKtd
	DjlUQdtmk6cC4r3eIafr4juOmEnhq5PxMCpFaFXEhC1UIZVB3aJFdumugq4+6+yDtolQ0Y7Zu5Z
	g2YChIAfvfgnnKbpQ1saPhUYTXKsXvHvJKZoWSqd6OPCDK53suORLadKk3nnpOMNlUYuCPTuN3i
	PvIugIOZEUsLJhgerh3jvyowEJTwEFOoQdBnHo+89eTogSAF7dIv2GuS23TqhyqLLeSACkDLQ/0
	eLPfDPlpBhnMsCl8Dh9sGf8CfzoS3P+7eTBsOlk0gAMzBR2RISxMpKcXocFA2g6FWKWB1+MyyOH
	LAM45H6rmLn7chxZ5G0ptAaPawqXy+nTFU9pJFk+A8H5v7GzvPucw9phrDVrdnodoDrBIxyBT6f
	pSd3xd5PYd4pdSiEZzSDrhug8zItmDHJ46Dr6KKlBFf0+Naw==
X-Received: by 2002:a05:600c:348f:b0:490:9df1:f0d4 with SMTP id 5b1f17b1804b1-4909df1f2b1mr30467635e9.10.1780050134332;
        Fri, 29 May 2026 03:22:14 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cab0e79sm64696335e9.13.2026.05.29.03.22.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 29 May 2026 03:22:14 -0700 (PDT)
Date: Fri, 29 May 2026 12:22:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Martin Alderson <martinalderson@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
 dies on resume from suspend
Message-ID: <20260529122210.6d2c5543.michal.pecio@gmail.com>
In-Reply-To: <CA+_z3hQF-EGKr11Yaa5vwMLt9TUB1mL9ESUAQU5Rnd=UZDXrBQ@mail.gmail.com>
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
	<20260330020749.18fbe433.michal.pecio@gmail.com>
	<CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
	<20260404152438.582f0451.michal.pecio@gmail.com>
	<CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
	<20260509180603.6f67c9d8.michal.pecio@gmail.com>
	<CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
	<20260512120334.4eef3d0b.michal.pecio@gmail.com>
	<fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
	<CA+_z3hRdXfZm2ziCmsXEDEY-i8XJjxnw2oe6mkTf+O+B0fx91A@mail.gmail.com>
	<20260529001057.1e0403c4.michal.pecio@gmail.com>
	<CA+_z3hQF-EGKr11Yaa5vwMLt9TUB1mL9ESUAQU5Rnd=UZDXrBQ@mail.gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38156-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6BEEB600D24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 29 May 2026 00:06:33 +0100, Martin Alderson wrote:
> Hi, please see this attachment. Thanks for all your help!

Let's go through it.

grep xhci_suspend 20260528T100954Z/dmesg.txt 
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0e:00.4: xhci_suspend: stopping usb5 port polling.
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0c:00.0: xhci_suspend: stopping usb1 port polling.
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0e:00.3: xhci_suspend: stopping usb3 port polling.

Several HCs are suspending, but not 0000:0f:00.0. It seems that the
kernel is aware that "something" is still going on with its child USB
devices and it defers suspend until "something" finishes.

grep 0000:0f:00.0 20260528T100954Z/dmesg.txt 
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Cancel URB 00000000f24bbb02, dev 1, ep 0x83, starting at offset 0xfffe5c70
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: // Ding dong!
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Stopped on Transfer TRB for slot 1 ep 6
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Removing canceled TD starting at 0xfffe5c70 (dma) in stream 0 URB 00000000f24bbb02
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Set TR Deq ptr 0xfffe5c80, cycle 0
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: // Ding dong!
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: xhci_giveback_invalidated_tds: Keep cancelled URB 00000000f24bbb02 TD as cancel_status is 2
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Successful Set TR Deq Ptr cmd, deq = @fffe5c80
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: xhci_handle_cmd_set_deq: Giveback cancelled URB 00000000f24bbb02 TD
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Giveback URB 00000000f24bbb02, len = 0, expected = 32, status = -115
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: // Ding dong!
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Stopped on No-op or Link TRB for slot 1 ep 4
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Stopped on No-op or Link TRB for slot 1 ep 2
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Stopped on No-op or Link TRB for slot 1 ep 0
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Set port 7-1 link state, portsc: 0x603, write 0x10661

Some device under 0000:0f:00.0 is suspended after having a 32 byte URB
unlinked from EP 3 IN and a few other (idle?) endpoints stopped.

[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: Cancel URB 00000000e74c9e14, dev 1, ep 0x0, starting at offset 0xffff4060
[Thu May 28 11:09:45 2026] xhci_hcd 0000:0f:00.0: // Ding dong!
[Thu May 28 11:09:50 2026] xhci_hcd 0000:0f:00.0: Command timeout, USBSTS: 0x00000000
[Thu May 28 11:09:50 2026] xhci_hcd 0000:0f:00.0: xHCI host not responding to stop endpoint command

Then some URB is unlinked from the same device's control endpoint with
no indication that the port has been resumed. Not 100% sure whether the
URB was submitted before or after device suspend. Either way, software
shouldn't do such things and your HW doesn't handle it gracefully.

It seems we will need to figure out how the offending URB gets there.
Can we identify the problematic device? Please post the output of:

lsusb -v |sed '/0000:0f:00.0/,/root hub/ !d'

Regards,
Michal

