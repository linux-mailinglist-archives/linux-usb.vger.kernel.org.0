Return-Path: <linux-usb+bounces-27092-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CC3B2F56F
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 12:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7371B3AA90A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 10:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50652305073;
	Thu, 21 Aug 2025 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izzGDPjE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FBE1C701F
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 10:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755772529; cv=none; b=WtWwVa3cREwXsPNFxxai+Fpm2ifrDY3/mE77UWPkI0U3rr1wfrGZh56OkT41y+pot3J3VZvM8IR2XH5RxkxjDF09/7ohwfqoD9KDPd3g8XEzUg9/69B3gZrk8v2cEhEVxPMEBjzQ4i/s0R1xhpylGW43fTjMx/+SYDYFZUvkSrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755772529; c=relaxed/simple;
	bh=H8SqetZe8MXfY4kV7p8Btxdm8TYyRVlnr4kg7krIJTw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d9B1L5Yj/g5MCE2iqc+MbA9ODqyKh8jPjeaJIOdRsIxdK3y/Dyi/CRxS+s9jUAQrQA1RFPCb0nfg1EcWuNaanGNuEBbWwZWbwua6gl9zvl7D/oNFAnZNYSDXBDEh706OwmnPbRlTZKaTXWAvGG9pZRMZjghex6Kxr9oXLMC4FdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izzGDPjE; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-333f901b229so6994261fa.2
        for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 03:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755772526; x=1756377326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Mqtl3Mtf7cq4ZbvrdSFd1CEx5uHF8ZbDTrEeFnbDEo=;
        b=izzGDPjEFvVU8Zp63rIOcqG3hJhhRlbldNnjyMCFJc4Vyc6mQZVgycvwKm0F0TVx95
         gl8r9n8jGV4cj6gwajhkxX0kfc9Oy60TjaGC76cuGCv2JSQe8maeTDmudn50fOLzzYqN
         elAiZXlUONVPTSG5e4f04PFNlCcEBgzzTAeLVmOfK/jwvA+iVXSBbYoGWsgOeWPZB6Gm
         hxiTbQS6eLr3YQDDVEgpeTqPeFqnGAaulw8LzXio2kzo9wn7QqAdYrb8CxgYiernTU34
         pBn2sI1hAjqvbHsT7F443Ihqlm3GDvftdZDFwC7Jr59yt6gofzlkm2rDHnzDiU9O/p7b
         rKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755772526; x=1756377326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Mqtl3Mtf7cq4ZbvrdSFd1CEx5uHF8ZbDTrEeFnbDEo=;
        b=q2ykeKSqdRJUHG/TI66ABwbA9Eo0A9AV9AjbeITw6Te745JPiClYVMSNEzjhGDW6zG
         UrR8718MxGPDDw7IBP5YAvH3jaD1K0qxdFSXKPlrbltus3bfndqInMhHEP/A3CbgsTPQ
         pIyK505Q6DZTV+6aNRcTOKcMlw8kh44iCiR5ApYYMiky2QTP3lCRps+nccNGEN+jou3F
         izvI4HIAaQpSADgzknRoHV93VDFYLrRJTNsBTVxOEap84OdrSsrzdBN7pR8a+35jan6+
         XKS8rexOfgYnksUCvoDQHYn97/u1HYkZcu9gsPFrHefzdkOTf0Ild5e3MKiDjVP/d4S0
         JwZA==
X-Forwarded-Encrypted: i=1; AJvYcCWCVSXZKO51rQC+Yt3q2BeyT4gjhilZHLVdS2mQ12DXXWfd3AhDUHCB9lGJ9bkWaIigl/sKBo9uKs0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9SLkcaCu/nrTWGzBxT1eK1beLRZfGTCkidU6P0MgH5qgKQ6Qi
	yy+RdgrxlhUBCrrcNe1sd80js1JgZ/Lbm8FEyNe8Prp2yvAmxo7m0S06cimO5Q==
X-Gm-Gg: ASbGncvbWj9H0sq3EMBVHEBPrbZRhLmpVMeBBIcQ8WCPa6kVKJOShBp3vSMfF7DjQ9w
	NDpwK3AZDffEdqlRMoxZywBDzO9/UeZ4Cy95SNcrTsQqA6dsVlRQ6yyqJRbWEFwBng4b8E6LCy8
	4BoJHP/P+eMu3Wy/d9v7X4iSaR/DFMx8dLLXQ+hyiLGeR77a5t6lsldT+SNBMwoqmx76rsisQfz
	tevB0ylwfvIlz4SoJ8S2xLMT98RChHl1xzT4D9dwHuGF47UN9s75eReMwEagWja5kqG0HJh0TuI
	3Ff6uavtLtiB9kKngtfJWgVgG6vuRNEUTFBnYfgARTgA4dtfbFCLfOozvdd11MzZVInQDoVI4Kw
	aoT1puOcBUfkuAsbeO3l2yJPqmA/8RV5p+64=
X-Google-Smtp-Source: AGHT+IHbfP9jDT5c870pukdVYpu+p2hIFwGcoqHJK/KttfXLT11VfwS0TJ+Z6BWY4SKLCWy2WIe/dw==
X-Received: by 2002:a2e:a98e:0:b0:335:40e6:d053 with SMTP id 38308e7fff4ca-3354a00caeamr5124691fa.42.1755772526057;
        Thu, 21 Aug 2025 03:35:26 -0700 (PDT)
Received: from foxbook (bgt225.neoplus.adsl.tpnet.pl. [83.28.83.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a604690sm31212051fa.41.2025.08.21.03.35.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 21 Aug 2025 03:35:25 -0700 (PDT)
Date: Thu, 21 Aug 2025 12:35:21 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: xhci: handle Set TR Deq Slot Not Enabled Error
Message-ID: <20250821123521.53e7c37e.michal.pecio@gmail.com>
In-Reply-To: <20250818125742.3572487-3-niklas.neronin@linux.intel.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
	<20250818125742.3572487-3-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 Aug 2025 14:57:40 +0200, Niklas Neronin wrote:
> The Set TR Deq Slot Not Enabled error occurs when the Endpoint State is
> disabled. In this state, the slot's Doorbell register is disabled, meaning
> it cannot receive or handle Transfer Descriptors (TDs).
> 
> Because the slot cannot receive or handle TDs, it should not have any TDs.
> Consequently, all cancelled TDs are released.
> (The goto 'td_cleanup' is used for other cases in later patches)

If there should be no TDs then there should be no need to clean up ;)

Does xhci_hcd really need to bloat itself with workarounds for
hypothetical kernel bugs which are not known to exist and which
should be fixed as soon as they are discovered?

And suppose that somebody does indeed disable a slot without waiting
for pending URBs to finish unlinking, what if he also frees those
virtual endpoints that you would like to manipulate here? And maybe
forgets to clear xhci->devs[x]->eps[y] to NULL?

What if a different device uses the same slot ID now? (That's possibly
a serious problem which perhaps requires a serious solution, btw).

The only thing we know about conditions which would cause this code to
execute is that they are unknown, and the only thing we can expect is
something unexpected, or else we wouldn't be here in the first place.


If there are concerns that slots may be disabled while commands are
pending for them, I think it would make more sense to add sanity checks
right where that happens: ensure that commands cannot be queued for
disabled slots, and that slots cannot be disabled with commands on them.

Then at least you know which function is responsible for the screwup.

In fact, I'm running a local patch which checks for pending URBs when
endpoints or slots are disabled. No violations logged so far.

