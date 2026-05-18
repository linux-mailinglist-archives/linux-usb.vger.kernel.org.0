Return-Path: <linux-usb+bounces-37610-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEeQI7kWC2o5/wQAu9opvQ
	(envelope-from <linux-usb+bounces-37610-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 15:40:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3289A56DCC6
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 15:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FC013016420
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25F848033E;
	Mon, 18 May 2026 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak9c8C5l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B58B846A
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111604; cv=pass; b=fqzEJsZ3UvP0Wddy+GawbKSBdU23rOh6aWseH6qgp2Zg7BEaIwRCYqVmnUCOUDQ35ofmda7qpI4j7OMKqJTc7M6ilOP4O4uPtVgWpdLQ7PX+hhv3pcBw+O/is609j1hykGvc0Mt/Wt1ciqAjaeGiHJO8aGwXworKymQwtw13m+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111604; c=relaxed/simple;
	bh=N2OHsJjEvFd5n/fJsQdtj/+z9S4I/qiX3ZvyrGu06Kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ApNaCJxvl0NZ/M3r/l6I+yx8aSy6+7Ua/unRTbpo0VWKHm56yevh8+dg3+252ar5QnsGWd9FUX//QpuU5WVSPJ53/wmoFJQOvght6aicl2CAkNIMI54PVe4BENXcqnj3JwRlRIumi+65R2qKAGjY1BKEwChA1vvsq7FG8cLWES0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak9c8C5l; arc=pass smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso21986551fa.2
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 06:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779111601; cv=none;
        d=google.com; s=arc-20240605;
        b=VEN2mYAuL/lYsqRtYcbhpdCOGSOrOhLSxzn9h4W2eoxJC//dhonpPQW8l9+J/vuDOp
         BGWKdL89ydhipMmUcTG9Dqud/WGaL2uNG/GiKBI0Yuu6nGTAkpqBQ5kYmx6K1DR+YA1h
         DnQWcN4OIWLe1Qt1YVbfRXyavF9gKQ1A/LbDgbnX52em9a6riwpIcdoYQucLefUS+6D3
         kCyF9+EtotPfKueKb1+epdd35eApEEadl9gmnbUzoMvlJY3pLMbzJjEpvtZbGXqRr3/F
         rsOmw3B0YuXg5LPJZCmnvYDNUhqdmhUG2/ohcy9WwdZxxWI/rF2zfq9/zwst40Z+ZQVQ
         mnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N2OHsJjEvFd5n/fJsQdtj/+z9S4I/qiX3ZvyrGu06Kc=;
        fh=TeABBsyRRjPSea099vjEAcIj+AGLcv4A05CaOv95qQ8=;
        b=kvfxv4VpBP2Gl0VrWR1ehUO948Ai8RjHcy2cewxjNo0Ue3n49suj1hXXCfXWcVIBR9
         NJ8czJucCak3p8bqU8A+YCZ3lL0iIo3MbMfuMvrX4EdSUgT93Vw1u2eXB/isZkQg31wc
         WZ03L4XFLLFrQ5OOK3c0WjVhbWa63UYjZyidiAhZS8GXUXOHwNHAnuBv9YvFsRH2/Yq+
         t75zptJOYTUEYYj/nM4F7Lmul0P3SULd+dc2c6yFbM4JOfBWS6YKpyE8tD/0LpOAdH6T
         vsngaloJkmXA6JimooRB1TwhU8fMcdTnfpbuWbu9VpDZARYE0z9VVnmSXvhl7hFEKp9p
         IkjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779111601; x=1779716401; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N2OHsJjEvFd5n/fJsQdtj/+z9S4I/qiX3ZvyrGu06Kc=;
        b=Ak9c8C5letLR+ZZrVw94eowUYJe3aj1Wqr6o+tvp+UT6iY9uXTxUZWAGPyaeNtnNtJ
         SBDPkHbNqq4amPj+X07xQwqCOEPko2RGbzBy1wF0Nnsmuoem28rbX7zjRHGb6X+MYP/I
         tFMg7+fbE3tM72TnbaDJVkb4l7Ni5T23V06DKM/Z4dDOH2owG937rLzT5ykRxK7upVbF
         0xOM699Bg8nxY2vSLygiXqjaolG6JY0NWtSSy29xhNuCi53UofnO9SX4N8mbwy7zbB6u
         jYvLAJ/XeHxZm4cFqcvL2dRelNEjNpIGNMY12WBJA3lhcUJRtz07MAO8tMZwgVu3kljH
         4Rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111601; x=1779716401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2OHsJjEvFd5n/fJsQdtj/+z9S4I/qiX3ZvyrGu06Kc=;
        b=Obpz9Xnv2zsOASlvtjclas6UHXMr6cN58Dj06wW5kZM8YI4/n5WKKx0tFze6iUGm0+
         YvCWZYGZPfAvQ9+ksJDW60+03wRSbFripbv2HA7MMtC2PC7axO5fFMuLlctW1b2VrfUZ
         BXoiMluXZ5hYFM3jx1326W/NbZH3/dSVM0vOJcxDEhy/F1zdKl4mNhnLaolO+dOZN/06
         40bDEL4PASTqc/Md+M/OWPvN+lgl9TzyivyH4tYZJyYfFb2r93jzciLDsekSyMJ6pZ8y
         uj8kwBkE5PDdLEeOCbIa9Etq+92UqSW411IE6KpUYNSK01kFFpT86uMxrj3NGbCev+HT
         3AlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zgy5ypfnp2YAjXa9kuWnmOw0TYR/3TATWL1H9mPx6eJUBvucBLjSOs/ksm82R7IzKLpMkcKC0Fo0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza0aM2N4Hc6Zr83yXVD5baUNtgSeD3ePzJ95StqZeDRlrNtuOk
	qKl70clj9OpVx3cww+J5FhwC0XLUrmHhCV5Qea65ZjLWBnOAj5HYbY9PUDSCDfRbP8MhS7vq97F
	TPpNfw84cM+54V/SIT6uA7p0MaOzXxwg=
X-Gm-Gg: Acq92OGIjGl2XVnFYtbSo1PYGYnDJ8Q/pJxjtPgmTjKlNWHMD0BJlgSZ+Smli8MwW7+
	8Cl2rn58X+e5CzFq46ehAgagurw0lYuMG5Bj3/SELHiaGRa6mPYyLjJkfVc9pMoayBTsLZlGMLw
	1ZIcl3CJJgiR1GX21o6J9iZCmFHphiQglEJovDuiitpamwoDlmpuPEbPBP2wshACeO3I6JUneIV
	2qFQg+yWX4XHTZ2vIUQm/6Vd0ovew0dYHBMCVtycrA94hUKiCvpOqGxNp+hi8772L2Qfi9Jlrkx
	NkYCB59YbSgP6h3leDXNTA3GwQm1Ig==
X-Received: by 2002:a2e:bd83:0:b0:38b:be3e:b752 with SMTP id
 38308e7fff4ca-39561cbd552mr47186931fa.20.1779111600945; Mon, 18 May 2026
 06:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516042428.3777524-1-rollkingzzc@gmail.com> <agry2e2brte8W7U0@hovoldconsulting.com>
In-Reply-To: <agry2e2brte8W7U0@hovoldconsulting.com>
From: Cen Zhang <rollkingzzc@gmail.com>
Date: Mon, 18 May 2026 21:39:49 +0800
X-Gm-Features: AVHnY4KEpfkBISmZfHVVogoup8JVaUrKQZIy7HfHsxKxLJr7vNU2BAp2xVW_PJg
Message-ID: <CAB7XQsGZg+wrSpCsjLXdZEsw2y9f73eNGOjYkbz_PLAbR1_C8g@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: belkin_sa: validate interrupt status length
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, zerocling0077@gmail.com, 2045gemini@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37610-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 3289A56DCC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Johan,

Thanks for reviewing this.

On Mon, May 18, 2026 at 01:07:05PM +0200, Johan Hovold wrote:

> How was this issue found? Are you using some kind of static checker or
> LLM?

The initial lead came from an LLM-assisted local audit, not from a
dedicated static checker. I then checked this path manually and validated
the issue under KASAN with a small dummy_hcd/raw_gadget setup.

The reproducer emulates a Belkin 050d:0103-compatible device with one
interrupt-in endpoint whose wMaxPacketSize is 3. After belkin_sa bound and
ttyUSB0 was opened once, the raw_gadget side completed 3-byte interrupt
packets.

The relevant part of the KASAN report as below:

BUG: KASAN: slab-out-of-bounds in belkin_sa_read_int_callback+0xd3/0x290
Read of size 1 at addr ffff8881029d2c43

with the callback reached from URB completion:

belkin_sa_read_int_callback+0xd3/0x290
__usb_hcd_giveback_urb+0x112/0x1d0
dummy_timer+0xaaa/0x19a0
__hrtimer_run_queues+0x102/0x510
hrtimer_run_softirq+0xd0/0x130
handle_softirqs+0x155/0x650

> You only need to verify urb->actual_length here (as actual_length <=
> transfer_buffer_length).

Agreed, thanks for pointing this out. I will send a v2 with the check
reduced to:

if (urb->actual_length < BELKIN_SA_MSR_INDEX + 1)
goto exit;

and update the commit message accordingly.

Best regards,
Zhang Cen

