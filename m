Return-Path: <linux-usb+bounces-33439-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCBbCfnUlWnFVAIAu9opvQ
	(envelope-from <linux-usb+bounces-33439-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 16:04:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 832A7157413
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 16:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26B583019F0B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 15:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720C1340282;
	Wed, 18 Feb 2026 15:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jWM5M5+C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6A733FE24
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771426935; cv=none; b=PHQ7VgaI+d19VxJTbVXXGWen2AbgzmgaJsF+0zhsn/CzWrM9TzltigghVmtLXX3A+22nT0PCnpNJmeQGFMVMBDpmhYhEbB9U0slMfD7jVEaCs7dknS/aruOXx3kiuZLjAg00ETY/tALWOAShUe1oaP3T6w1DH6cW4fGcA+mtqs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771426935; c=relaxed/simple;
	bh=QpltMKarSxc/+RtEtwF2NBPbBOgObRT1+T/CP2PkXtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpOpBugD9QlZE1AtDtBU3oWu26bIuMVy8BzkbHUzJYzU+c4/BiaNnHKfITPQbx4qSLYwFeJtdRFy7SPeXTSx5fY5/Fh8E93nFfAb6ElX/9QbEExCot57u0TlZXaTZcQmMMhI0q+RAc1AxG5MjCh403WXARo0btNnUUYQiW1Ows8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jWM5M5+C; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94acd026e45so1122079241.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 07:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771426932; x=1772031732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hBNk5l9EVGfBrteKFYto0CBYIRPMHTSaEo9snNEdK1E=;
        b=jWM5M5+C8tPAcZLRIHPkUPml72iByJJBECSdDJZfARuJmhM8DtDSFEbw8tRFT/Yea3
         Lf1a8fQOj9mwly+8iNGiAQdMnEQ3YUgGc12uR0sgUFRU779D03D8EWk1TtuX0yCEwxFD
         2OcTD77vGEbRH9/sWV4JEqO2U4YuCNvMRNFbdfUdQjIxBYNufFDqMCAqHrR+KRybSwmI
         6ZhyS4pnhKS25gElK56EXAlXZGd/l9oPJXRYGofHNV38ak31ByelUuBBDzWTJvqd/2ZS
         QAT+reH4YayXkEKxtN1xde+eLztcH8gNqSPDLu2dow+rFU4hE44Irb+OD2HrorMAvOIb
         +H4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771426932; x=1772031732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBNk5l9EVGfBrteKFYto0CBYIRPMHTSaEo9snNEdK1E=;
        b=GdnXhhkmkwoN3tcEgivziHO4Mm6XbjvYeAtUCrd7SdZ9zQTY+hX7uKcmI4BEgByVEo
         hn/wgxShLWDnZN4E6iyQiXyAOBhf+aanxnJqF51ytYUz2tCGkAFXLlun3t3CFY2+cKBk
         l/Q/G/HAoYc3PNVBOgmNZ2d8cK2UDFfYzGYqpxuuIrvtzIS30ovS33dkB+RSjsnYVwSZ
         vt06nNa918HylvHWBJOUALS+B0z3V0xC2Ao6w8wyO9fXfQqm0JdiBUEy5Z5WhTak3bnq
         6SPdP05sFdZl2AGpNjcGJAIh7319Ffvew9uNreWvBuaJGtgWlwsfaKQm2fe39gCGkwcc
         yDSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh9rXP3q9bGkE3kZsCbtzpq5VlrqXhFLtQUDxF7HE80uzpcFSlVghPbJKs5lxcQYT4mYW57Ml/oUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDn5bv20dVYXLyV+IzWqMzOhww1IxqM+nPyPg23Ur7s/LHCYuZ
	2sBP45t+Vx5SDhMB1wVhnrum49d5gzh06W/G4qeto7IL0GoGeQbrB3tSffwUlFKW0A==
X-Gm-Gg: AZuq6aJdwYnuMiq4bafwKT9EctiacJAA0BKxI7W16T7U720IquPaQsqPRAK2JyPSE7w
	scUwX4lDnbBA5FjPjRudXbcMojnKePI8B4eeE1sWaBxSGHlmbwMt/8DDYfQR39YjPAfMeSegvJt
	+8Em+CJe4rPnlNHWoHnGwgUusSJBn5SbjJh/fgVYQF0nF0C1BwdlSqSOB9EEsUaOxpa/vTq9kkI
	uwTmWIscqbNFTz4zWgkgSRiMfxiFrhEn2GzuiXuvfxw5g/w+dxlINRhOxqh8ouoqjfavHG6to63
	FRTyBV+ehSBk4e9iWn8EXJN0YWonJjWLZAnUbrtV2BRH5K4swupcnnQCjc+fqQD5F93uvwqzzjC
	U3FuOP8po/ibbG73x5Q6outA9WUU4mSRPGkKRaWuj3G/9Ww6RHa79IWlX4Rdv0/YH/v6ROCOpIj
	MtaR6gynIL10Fi+1darbMylpj4rsJV3wo7yWbrFLX11A==
X-Received: by 2002:a05:6102:3f4c:b0:5fe:8b4:19a9 with SMTP id ada2fe7eead31-5fe16f68260mr6529997137.37.1771426927925;
        Wed, 18 Feb 2026 07:02:07 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89949b3d543sm54069386d6.16.2026.02.18.07.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:02:06 -0800 (PST)
Date: Wed, 18 Feb 2026 10:02:04 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] USB: usbcore: Introduce usb_bulk_msg_killable()
Message-ID: <9bc181a5-25e7-4f9d-a6b4-23c716e75269@rowland.harvard.edu>
References: <32a96517-104c-423a-b1b1-8dd139192900@rowland.harvard.edu>
 <7cbb32ef-944d-4d03-9209-5249bd7ae1d0@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cbb32ef-944d-4d03-9209-5249bd7ae1d0@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-33439-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 832A7157413
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 01:54:31PM +0100, Oliver Neukum wrote:
> 
> 
> On 17.02.26 17:22, Alan Stern wrote:
> > The synchronous message API in usbcore (usb_control_msg(),
> > usb_bulk_msg(), and so on) uses uninterruptible waits.  However,
> > drivers may call these routines in the context of a user thread, which
> > means it ought to be possible to at least kill them.
> > 
> > For this reason, introduce a new usb_bulk_msg_killable() function
> > which behaves the same as usb_bulk_msg() except for using
> > wait_for_completion_killable_timeout() instead of
> > wait_for_completion_timeout().  The same can be done later for
> > usb_control_msg() later on, if it turns out to be needed.

> This still leaves the quesion why a timeout can be negative.

My best guess is that the original API was written carelessly.  In any 
case, I don't want to change it now -- it's a separate issue.

The matter is addressed to some extent in the third patch of this 
series.

Alan Stern

