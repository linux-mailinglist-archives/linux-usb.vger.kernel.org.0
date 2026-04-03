Return-Path: <linux-usb+bounces-35949-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFLxLdkR0GlQ2wYAu9opvQ
	(envelope-from <linux-usb+bounces-35949-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 21:15:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C8439793D
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 21:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AECB83013AAE
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 19:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8251D374160;
	Fri,  3 Apr 2026 19:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nN+cplCw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F54129992B
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 19:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775243625; cv=none; b=Kx/8Jjr61bKrW2/UhdGFP1bMtHt8RCfAw7xB81G+WE2Wve6nSVG2uu0c9/WZq2UGxrnvdzSf2d+k5+GIDjnxxeJbPLFtNuOL0CvV+vkUW5F78jgL7pb8ljK9Hnsg2qILznPE4bPCiuOPyjX42Ayrthqolpew0lgaSb1qSqNnGOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775243625; c=relaxed/simple;
	bh=pMWANwNDsBcowVECoTF5MeuGzarYDMObnWSWYNPv900=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qdo8KMV2zQel6I3bePLuSW4giKSlC++ZknkIw5zDGsL+oMV9h0/lWq9wZoWeWA2C8/XMPPs0uzhq/a2SgVdfvRAl2G+CME6sOa0yVmagm9WcAURul0k2iRZa0riKWUMuCnxb1WiE/RGsOmIq3X7Fjawy1X7zoGlFLg8GikwN450=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nN+cplCw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486ff201041so21229915e9.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 12:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775243622; x=1775848422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Abv0C9/XCVnvJWei9ecpFnjyoh8uXcf1Y+YxCnpPdDw=;
        b=nN+cplCwkRZlEaQ1oteEuR6IlaXW6gA79yCSNZp6YsZ15HdQtbJPa2e7vqRfsZ6GlI
         +YxXyE0+H08IQZ/ynAEHNs5mMlFMLJxZ2/jkujb93UYc2nISZXitYBu51qedPhJKH0/X
         BzJl+NWIcuWVJbtkHCONWBYQ8eVmWsYhUbs31GVI56pFpKEz9q9VJlNCaXHTMi+S15xt
         8JfsDv3MVXjRWVHy7Ii2JigvVVbe3PHvrcyTTJAalzLrUOKe+riHIeaUJBTi3GEqk9BJ
         oaPL+qSM7dtOtdMBA20kgyibgVsPPxRD3Psxpglbh5C36kXit7WIlo7eqb9YvBsq/saa
         lx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775243622; x=1775848422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Abv0C9/XCVnvJWei9ecpFnjyoh8uXcf1Y+YxCnpPdDw=;
        b=ji6+h9u59016uGXsaD8quRUmGkSpeazEn5wQvmejsLEUqO21UZa38xnx+PiyfF0wDO
         yiM+pByfeEaXmycR0m7Y3/7S5xlKb+v28NYOjqSIyr5u+2wcADLmbV6p+1p/I77dqsTf
         NU3QbRKn+55OAkb5UQYtHWES6poBEvWZO1p+d9cc1YpQ0bLiLb4ML9aAqGQZJ/RhZ4lq
         jlyLhNxaBHi0XHMSG0TLaObyQBaORNC/35A0j1JToKXtvJNBKmBz4MO9NNoQ0IETY/K2
         Xy+ysQ+z29UbYYVwkGRu4RPcZ1WDzFafO9PAfBBpjZfwwyay5a250oLW1Mn1Uh7x7vnk
         OrTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaa05288uAVgNv3WZ4CxOtOVszDHgc4csP4hOCBEflWQplBnXa2Og7/o++493NbGwi8ZGOFLp/vAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+mqqBP40Iy0lM1uU8vuxOTwwZpQqi6gykmtlQ/Geh7xLBTij9
	L5UgLPBKWBrWCtzgF+kamoVY17IDddsrE9n443tRdj1ENdy9dWG5918U
X-Gm-Gg: ATEYQzyrRtVcebdom7qCDy8ryKaWMidJqLMY36RCc+iC84MAZwuu/y7vLJDD+r5OlU+
	K8C0kH6gaLL9YFjAcY1zVoH4D9jurXbNIrD+kuHqapxLttdG/cEaDKZ8mfYTaO0XF/rf7ff5TZA
	2V/Fq3x5QCBGHIjJ7N/8y4DVD6A6XdZpZEi26djR9JdA6/FInhxWD/gG9c2pM+et4rzmjwbb5sy
	4bRXnyL860vbvvywCz04e+/b1ucu4vpqsL+nbk98TVtlALqOfzSiDT55cuOzGrCbPpR7EHhs1Rg
	IaSRvGu6WE5x1zNYrrykN/EwizOjelUClatmTy3oDPWD+QF44vqRI0tZr2mzq/pwHwZUQMJ4qrI
	KmKKV3UwKMtm8944ver1nZSbAyjMLpv6vqmWw1V0u7snvXaZAUkCHMcATU567G4qcqK7+rH3zXu
	ZcYzF5Hf5EmrNoiI84BAtOWuLIgAhP6zxx
X-Received: by 2002:a05:600c:c493:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-488996da0e3mr59905875e9.4.1775243621619;
        Fri, 03 Apr 2026 12:13:41 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm301402135e9.7.2026.04.03.12.13.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 03 Apr 2026 12:13:41 -0700 (PDT)
Date: Fri, 3 Apr 2026 21:13:37 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: xhci-hcd and URB_SHORT_NOT_OK
Message-ID: <20260403211337.7b964af2.michal.pecio@gmail.com>
In-Reply-To: <f3897bb1-fd9e-4321-bc62-31ae8329706b@rowland.harvard.edu>
References: <20260326232400.zkplsxflhykhayyb@synopsys.com>
	<2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
	<9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
	<54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
	<86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
	<50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
	<07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
	<20260403015950.lx4n4zdqki37dy27@synopsys.com>
	<28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
	<20260403105145.7e74a410.michal.pecio@gmail.com>
	<f3897bb1-fd9e-4321-bc62-31ae8329706b@rowland.harvard.edu>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35949-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,harvard.edu:email]
X-Rspamd-Queue-Id: 30C8439793D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 3 Apr 2026 10:55:58 -0400, stern@rowland.harvard.edu wrote:
> > This doesn't work in xhci-hcd and I'm not sure if it can. I don't
> > recall any way to make endpoints halt on short transfer at all.
> > 
> > The driver does exactly two things with this flag:
> > 1. Isochronus frames get EREMOTEIO status when it's detected,
> >    although ISTR that URB_SHORT_NOT_OK isn't defined for isochronous
> > 2. All others log a dbg() message. Supposedly, core is
> >    responsible for updating urb->status then.  
> 
> Truly?  What happens if usb-storage is doing a large bulk-IN transfer
> comprising multiple data URBs (with URB_SHORT_NOT_OK set in all but
> the last one), and the device indicates an early end-of-data by
> sending a short packet in the middle?  Will xhci-hcd store the
> information in the following bulk-IN status transaction to the
> transfer buffer for the next URB in the queue of data URBs?

Not sure if I understand the question, but if you mean that the driver
submits multiple "data" URBs followed by a "status" URB to the same
pipe and expects it to stop when any data URB completes short, so that
all others can be unlinked before the status transfer, then nope, not
gonna happen. It will be racing with status being written to the data
URBs and likely lose. The status URB may never complete.

I really don't recall any way of stopping on short transfers and the
relevant xHCI 4.10.1.1 section isn't helpful. It's possible to stop
unconditionally and decide to restart or not, at some performance cost.

But short transfer always terminates the current URB, so natural way is
to coalesce all data into a big SG URB. Perhaps xhci-hcd could do it
transparently, though that would get awkward if a driver doesn't unlink
the remaining SHORT_NOT_OK URBs - we would need to "rewind".

On the upside, I don't see many users of SHORT_NOT_OK URB. This string
appears in Documentation, include, drivers/usb/host, files ending wih
hcd.c, devio/usbip, and usb_sg_init(). The latter is probably what you
were referring to, and it seems to have a shortcut for SG-capable HCs,
which hopefully doesn't require SHORT_NOT_OK to be functional?

Regards,
Michal

