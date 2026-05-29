Return-Path: <linux-usb+bounces-38170-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKRVJzIaGmo+1ggAu9opvQ
	(envelope-from <linux-usb+bounces-38170-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 00:58:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F15046098C8
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 00:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD7A3304E6ED
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 22:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9470388E57;
	Fri, 29 May 2026 22:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOd5LmF+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8233AD526
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 22:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780095469; cv=none; b=og2+sqP526nHQgqvJBBYHOQaF/sRuIvXOw3MU5dbE134quMqrS0c33MnwOB+IX++r2feNIB+Y9B1Ujfbz9tjdO15qqdCKGLZKiZEyjDnbRlhg6peXM06d9foMcjgUHlT4T8zPSZCYF3bCy7yuZRUNT8CMEDQAvfjBPLV458ljwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780095469; c=relaxed/simple;
	bh=3HRc8+f7GImpeaSvqj81M3wXKZwZYQdlEwjmh/pz7a8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q6FOjOaL0TZlP+ZTvkq7UDrXosB9l6nMhTohbYbbY+KWklb1yvDG7WbSuiFGJBCGnPEMhGBgnNgkz3ecR3IsIeR0otq5raxOWYW3bjQRVZt+6SP8spZ8vX7wFIvxMBqaUgq66RZYv4rg0xGZrOTZBwrfMgreD1EMew0nS28+d9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOd5LmF+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49041e84237so67664695e9.1
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 15:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780095466; x=1780700266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HRc8+f7GImpeaSvqj81M3wXKZwZYQdlEwjmh/pz7a8=;
        b=BOd5LmF+3mouNTj951AZz667HCAcOLK96HOfzIy6OWaly33y57msisZ/nsghFR6wy9
         7hKGFvte/JVuSitu8rwyqCLDrjUDlxojAksCd+BIf/XY3zVIl1liaoCr/En1TWGbpLV5
         HQ9vf6psG05KmhmXn1slCZPjgqy73Fi3lxINpmWUy8bdZ3d1bm1/bsmDUbDT82VOiHO4
         BMwF9phCijSIRros1SkOYLbEWr3Fzem/TKnjmnFFbmQS+W+PM44qMeUPErAJbbFeycG/
         PrXRwr6FPS3u7gBTF9XdmJN+9UdHdZTFL49C/5hgYKfIFV5/JbVWIx9s7lYoToQr+zsI
         vGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780095466; x=1780700266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3HRc8+f7GImpeaSvqj81M3wXKZwZYQdlEwjmh/pz7a8=;
        b=QRczOutDb2CZzmOphmsRXgPIBkTeB9diroWWCc/gx97Lq93OJURtOKmEyCtu1u37gs
         I5YcgZDU6tZ2xH2/4M6Cr8f2sX004NBIhu6VxYS2863YKyZUQAeed83fXpiXBlaZ/Fav
         9gtWapFzKKJySeTQVcvLesJVDW/BMfDJtUoUpu4BnBQ9AqjJx7YL9fQiMubdZQh8IUb9
         GUl/q1g6y/nWFyiNpn+oDp4HUlT+mNuhoDaSvp1pYKXtvNmnehALUxWV9TX+Sqr959yh
         nahV3ujk74GVry/2E4TmMNfgZ9WVd8PYosYNNYN8YNNA8d8zCNeNy5Z17TR/YRBM33RT
         DzCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6BJJI4lXjnIo8s7AyuwpuWgdk+i2rJaPTlqL2zHPWXdlnRAjaof8H1hk8MBE+bKno63gEvketYpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKljaT4vW35pVQrOd5zceE3KKPe5DaJ0bf/v8FbsPZAAjdQKvg
	1Rrmt3HmdivIhSOD1jT2aF9hG+h0lZv+qNXCtVfkkKIvHIZxE8W3VFp6
X-Gm-Gg: Acq92OEhKnoToUSVEpAgjFMUf+vX5t9j4OKlMYnDMS/iRgILmPVGOibrLeYO4X0Lxhw
	l4J5osb/YB6wiAxatIcRDi9uEuBgomViqlyP6xkXP+3IACtm+iW9t1KWLxCtU2sWe0M42HgVFdC
	pl6nlv9b9H/6xz9VQOBnAbBxOtlathve5q7UcoFivPsxyH3K1I7rRX6r5biE9n6w/UhR8keBo4J
	vvejCpUIxBgQ0flqQL6iD4D/EHVRCuMETVdh5vJmU/cE9h0WbTSrGPRiAZlSVg2QM/tDuHIhlUv
	g6mMppmBvqRlcEBST2YpXkeqdDZM109tSDmFfqnz3/oMjv8Z4OnUbdHzybD4hltXGnbnitPNGyl
	LjcENxUbKQnorJQ9z3QBEEsdKWPUEDHKCIrMqYXqZkf2b0EGq/SADa3NA4fsBQqo299irG22zCT
	WoXFRTxy5Kl+OncfthNFB7AQccCvnrlBJTszwgfg0TnXAUPQ==
X-Received: by 2002:a05:600c:5254:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-490a2a43b6cmr16204455e9.10.1780095466262;
        Fri, 29 May 2026 15:57:46 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6a0e42sm68907765e9.8.2026.05.29.15.57.45
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 29 May 2026 15:57:45 -0700 (PDT)
Date: Sat, 30 May 2026 00:57:42 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Martin Alderson <martinalderson@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
 dies on resume from suspend
Message-ID: <20260530005742.25893efa.michal.pecio@gmail.com>
In-Reply-To: <CA+_z3hSMRvW6qhZ4wB54hQyY89z+Mm0C48MGA40aqG7_+spX2g@mail.gmail.com>
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
	<20260529122210.6d2c5543.michal.pecio@gmail.com>
	<CA+_z3hSMRvW6qhZ4wB54hQyY89z+Mm0C48MGA40aqG7_+spX2g@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38170-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: F15046098C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 29 May 2026 13:04:49 +0100, Martin Alderson wrote:
> Bus 007 Device 002: ID 046d:c52b Logitech, Inc. Unifying Receiver

So this is the problem device. Until we have any better idea what to
try, please add usbcore and usbhid dynamic debug and keep collecting
logs - maybe something useful will show up.

Looking at usbhid, it seems it may fail to suspend if some operations
are ongoing. And then usbcore may apparently suspend the device anyway
and usbhid will presumably try to continue its thing on the suspended
device. AFAIK any URB submissions should fail then, but there might be
a bug. I haven't yet looked closely at how it all works.

BTW, are you able to test patched kernels in case dynamic debug proves
insufficient to figure out what's going on?

Regards,
Michal

