Return-Path: <linux-usb+bounces-35932-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIOFJXqBz2mvwgYAu9opvQ
	(envelope-from <linux-usb+bounces-35932-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 10:59:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F29392713
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 10:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D9203082FB6
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 08:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D1C3803F5;
	Fri,  3 Apr 2026 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAsYfgeU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9982D94BA
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206313; cv=none; b=Herc0SUn7xxTimqkgAjvihPfa/J+TTPQNraWAUzNA6R4xIjH69/EAGiUIHJ4wT72tffHJBNVFc+t8+LC5CnWddns4wqDSw2O1/ho4gzntj8tKU0JFt1SsSA80MRVeOcfdN7c/NKZwdAmsdie7cP/clizM+zwpHbaNNTjU6e4os8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206313; c=relaxed/simple;
	bh=vwZoqm2nK/TO4MOrS59mA5ABmTfwQJKL4eRStWaEzcY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HQSNrb1RCrwNMq3n4Xkkjtb5rQWCGwlGWqGVovx9woJFULaU5wewlxcMeOrnQll2uZtpAGAIdf8gVIqTJAbyYQsgtXnzqqa9nPokStlaOEkeZroejKa1Am1v3gmP+94P8IPuDtr7gWI8By9qeg0eyjnjTZwSrx8X1EAFLg93TG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pAsYfgeU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48891776099so19451035e9.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 01:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775206310; x=1775811110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzoKTzy/K1lrfOBgYvdwSXj9RSXtY/lDKFGFaL27dZU=;
        b=pAsYfgeUGLQsJffaVe259P44+0lOlChNoeUPWnJ/RRvvdwO3dGKVDpxwHzweWSDgN1
         MVNk/CDvpqeSvD3l6jISuVankuVvzRcz4WvgTtCT92C5soEmRTPvImiAjGTPKoFL8sYu
         xhT4McbH0a8kFQn69k9sZnigEQW+gcgesJttKSRYcBIAqfgP7PIXZp0LqXBeaWkTdDsl
         7f3/cpW3ODsTgGeJaGpWXQNX1UaYpdmKbgqO4XnDr8XdwdXOOTTPcFafxFHOeoDw3/sf
         sPBv54rr9RUcJ2ExvySdkeRJVWJ0P2mNmb17ooD5tzeJhJxipElQptSMqBrmr08wzaKN
         1u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206310; x=1775811110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wzoKTzy/K1lrfOBgYvdwSXj9RSXtY/lDKFGFaL27dZU=;
        b=AZ3o+T5V0iunhwG7P8IFzLDWjBHk1Vsp5RVj5Zy3af2pEIxYst07PoNbLt1nkgItU6
         i5NGz89nQtLcuExlSgQfX4JLx9NmUC1QUAgMR1xCV49EvaqsbUFz2OJcSjjYsyxjhVVQ
         Xz0zdGx1Em5/7fdogwR14VdCL5vgtD/e0CQy7++TB5uFGBdAvoForHk5FqcV7p9F+R0o
         hDaMgmeZiUw8LSFBAsDznobgCGShJJKubCniKcu9gGGRGVfaU6MfXMlDgepF7Rmp0EhK
         HkMjccfYhdz0Q5n7NQPJiop41ir7zn+xNp6AaZtRJDmKpgaoZdUB6P/Hsodt9tRLkLSx
         HSeg==
X-Forwarded-Encrypted: i=1; AJvYcCUW4eB1FNc2CDwG0WGM4rgyp4OupHFXWBjHaS9QknnMpnx3CqmcmZeoZSllME2LSBdmJ6VKYYcPqkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuG/AGQwGpW8bL4Xjo42JYDkwFYsf2VGwgk0NlMLtVvFNN0JT0
	hG/DBRuo2K/YWDB731J2LCsE7JNWFS6AFExOq0zhdxHfwZ+A5mBfU/fEwqQELg==
X-Gm-Gg: ATEYQzxJgowEpvej5gdPbMWlVTz5svzQMVgan4a2hA8DtbNDj3SHQQ3BiCn2STDCO+y
	TkmU4U1X55V0J8f/fyVXOiBsp5+ShwsaROrPdYDUNr1kbhn1UWVtgpPjATHKXBFNb84EbFjLPoh
	tFmyXHmLQAtb/T/mydZkCqLK4h2OYygCHAmeMe1dgp8qQAQEozRZ5oG3EHaorOWP5yxZBNBpl8G
	sAsHHTHDhuDrb70hO3x3Fq1HMZE7oHqprJy+S6GBhVuUKLOt/wMz+pNKiAHFaWh8BHrdOyQlKWB
	aHB4HqxUVln1GSRYCX02axvCr/HFQ+85EESLPTbbBEI/mJFzMROZIartUFmzZQFI5iczb0aB6RM
	jvLVikutV9/Wd3PkEUVM7H/qXwn/eumuBEj5FcMgeg+JTSfoTLRy9JMCTvdSEWbmnz5LybP3JWk
	LUwpXpCzJo/IPjTkATUGt2iqaVDVWUK5Zz
X-Received: by 2002:a05:600c:8b46:b0:485:4006:960c with SMTP id 5b1f17b1804b1-4889978e22emr36833735e9.16.1775206309841;
        Fri, 03 Apr 2026 01:51:49 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a705f99sm122826715e9.11.2026.04.03.01.51.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 03 Apr 2026 01:51:49 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:51:45 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <20260403105145.7e74a410.michal.pecio@gmail.com>
In-Reply-To: <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
References: <20260326011910.t7ijezht7g7ttrec@synopsys.com>
	<9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
	<20260326232400.zkplsxflhykhayyb@synopsys.com>
	<2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
	<9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
	<54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
	<86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
	<50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
	<07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
	<20260403015950.lx4n4zdqki37dy27@synopsys.com>
	<28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
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
	TAGGED_FROM(0.00)[bounces-35932-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: D3F29392713
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 22:42:39 -0400, stern@rowland.harvard.edu wrote:
> Every status other than 0 should mean that the endpoint's queue is 
> halted.  But not all statuses require a clear-halt or reset-endpoint
> to recover.  For instance, a short transfer when the URB_SHORT_NOT_OK
> flag is set.

This doesn't work in xhci-hcd and I'm not sure if it can. I don't recall
any way to make endpoints halt on short transfer at all.

The driver does exactly two things with this flag:
1. Isochronus frames get EREMOTEIO status when it's detected, although
   ISTR that URB_SHORT_NOT_OK isn't defined for isochronous URBs.
2. All others log a dbg() message. Supposedly, core is responsible for
   updating urb->status then.

> > * The USB core will not attempt to unlink pending URBs due to halted
> >   condition
> > * The HCD is responsible for completing or canceling queued URBs
> >   when the halted flag is set. Cancelled and newly submitted URBs
> > will be returned with -EPIPE as long as the halted flag is set  
> 
> Why make the HCD responsible for draining the queue?  It's like
> setting the halted flag; one central place is simpler and less
> error-prone than lots of separate places.

Is emptying the queue really a good idea at all? It obviously breaks
lazy drivers which just ignore errors and continue with the URBs they
have already submitted. Removing the URBs only adds more data loss.

> For newly submitted URBs, should the submission fail with -EPIPE, or 
> should the submission succeed and then the URB complete with -EPIPE?  
> The first is simpler, but drivers probably aren't prepared for it

Are they truly expecting the alternative? I bet most of them would
usb_clear_halt() for each received EPIPE, or not at all.

If completion unlinks remaining URBs before returning, this question
doesn't exist (if we fix restarting before completion). If it doesn't
unlink them, who even knows what the driver wants?

For example, some drivers resubmit the URB while handling EPROTO and
don't unlink anything. To me, it says "screw data loss and continue".

It admittedly doesn't work on SuperSpeed anymore, but not all drivers
need to worry about SuperSpeed. Including some old and lazy ones.

Regards,
Michal

