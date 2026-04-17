Return-Path: <linux-usb+bounces-36297-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEDRMY5x4mlP6AAAu9opvQ
	(envelope-from <linux-usb+bounces-36297-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 19:44:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0AD41DA87
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 19:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1A6530E720C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 17:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E99836D51D;
	Fri, 17 Apr 2026 17:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HTXzYNzI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6413364950
	for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 17:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776447533; cv=none; b=msfPBz0q+4m4RWXfNWHuXl/cLQVZkDFRyNmtfA+/AIMQioq2y6caM/OSLSD0LaDHskKC0EhFYvWR3stVLYCqMxo9br77aGGZkgwHnwm13TmoCBLqnTyahhwzdCKAZV3GkOPZIxOY7aFJI6aqkwS4e7rufsGhI8LV5cs5tpx+w+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776447533; c=relaxed/simple;
	bh=BM4SD75ZVrKouBOSJTG7TJVawqlE9siK/NlC62TRYLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cv3UL9x9NdrvYQVyBTjFs1hKIy5VwaUR8UjhQJRLyXKA2Lar1+ADjBLLu1t43RpO5/jt4EFmqXbxyieX3EHvjUlr4GTjUuyhuvvGOg5Y3+fdA/ZRFIbDXX120WdrTx09zegn+/MCciFC5rAhNw75RurJMLywV5OI2njtKsK6Jjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HTXzYNzI; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8a58057d7baso10485346d6.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 10:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776447530; x=1777052330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ScrvFm8dcecLK0fYKosu2aiHEOcHD9LwOrMZOf2kDo=;
        b=HTXzYNzIbsbZJF6IlpOTZgqG5RPsyH5F8lEHZfx85ueNhhxf9Vx41zlzFEKbs4vGu9
         k6qOPFfe4if4b5OGSB8lHWxtPq0eW+K/MUXSnNYvIkKfmDDpUpE/xZusqCUvqsWIbRjD
         KEaSMKwpaCzL7j6ZHl3rrM0S7rcV6wBqbdPNApL44jo2Te4fUhC2jDh/z9I/AiY7epHP
         rgtn3RnLFKqkyJGPWEN7LRb1e54FFkIOa4jF8WyNS4KNSoDutI/+knjlFtoNvwsfvlmy
         nwXQeDTez/eSE6ppSNzR7dwioo5zb8OksZtQDMMyBWs9MtuYx+2zMX3vCJ+/h/A++h2s
         FH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776447530; x=1777052330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ScrvFm8dcecLK0fYKosu2aiHEOcHD9LwOrMZOf2kDo=;
        b=Lv28u9pmw9Hs6LDdoS2SKFaazcryW2SaIvYd7m2DvFaqulmSI4c7e8Byg7bsYH6v9T
         ZRF0eBCwFBXTIkB3fA15krRRKBcbXnF6DtrEURkKvAEL9TWOZ59DlP552rieVEleT7zl
         UZ35fZZgREwiLujIyczYEPHFblBrVqXZrQn9oGTLskbuYfALKEGwPRGLq4ELpoel4/Xm
         fZg4zAwSkuWD0n3CWUQKdK8gr5JRPpwy+xUYoK60vySIT6pPL6IqWg0NcABI7oraF0Jh
         +9PrEvLluqU3E+thDElBJppZofo2ZCtLPkbz+KEWj+ca11KY9tkmZSP1LV2q767C0+iR
         KgPg==
X-Forwarded-Encrypted: i=1; AFNElJ/CGcUbZgrhvSyxq8x2UPf8uWA21dx6q6dUyHFbOLn7HQIJsibppSMMcVl9QCNNDx19jJEsZXfHWnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKy8gUfckfisRioIpZfB4iLTYJCVXeoTM3VpQXONUrY0M3ymv2
	BXIGHlan79d5CCFS9F8edpTC+iT6kEm9oL98HRruwpepB8HxTvqdiQVMEq70bDFz4w==
X-Gm-Gg: AeBDietI2QdLDC+hLr/EjJo6DZgwJpKWBxSeAmDoEI2xJw4wBjac37wjicrmBJJI0A/
	+UC5s7yG5uG6op+gX5zKKCiqBKzCFYixmHryQ1flF9oab3x3oXGmcl3J1ce96iyTUuFNtdJudRM
	fNxB0aWSWRO11Ret9qc2CGvcXXSVDB0X1uhuMCuYOQ8qXh+3NXM50ww5vxkqz0udeXik7WWdZD2
	oIAWKOi3aEvJ1yvrIYagz+ivZOY+5btw3g3tDU2OGu09a1a3Cyk+CO+vDl6qz8WexAZ/ot7yPTj
	YFWueoxQncqTxSe8eEAal9rjHNMBFAJQb8cFWUQrhPqwwXCnPSTfga6hZyDkFBb+lE7yKmCErO2
	cpi85STSyQCTCxuaQ3yJnWhDlvTjhTH0pImSdbPRXBzsFqV1E1/Aqg6kD8K+Xz47kaDdtyTewaR
	IgQlmrbUj+i0t/V8PD3iiwbUrYizVZ+sGKWw8=
X-Received: by 2002:a05:6214:2686:b0:8a4:8b2c:428f with SMTP id 6a1803df08f44-8b027ff8849mr70210706d6.2.1776447530489;
        Fri, 17 Apr 2026 10:38:50 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae6133dsm15421116d6.25.2026.04.17.10.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 10:38:49 -0700 (PDT)
Date: Fri, 17 Apr 2026 13:38:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"michal.pecio@gmail.com" <michal.pecio@gmail.com>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <4a484a89-f52a-48c2-af43-c0029878ddaf@rowland.harvard.edu>
References: <20260404011530.aukxllvizvmc3f3x@synopsys.com>
 <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
 <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
 <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
 <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
 <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
 <20260405030954.32jbg3fphi5xdla3@synopsys.com>
 <74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
 <65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,gmail.com,suse.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-36297-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A0AD41DA87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 11:24:01PM +0300, Mathias Nyman wrote:
> On 4/7/26 18:23, Alan Stern wrote:
> > It's been a while now, and nobody has objected to the proposed plan for
> > handling this issue, so I'm going to assume that everyone is on board
> > with the idea.
> 
> Yes, I support this
> 
> So basically usb core will call usb_clear_halt() after EPROTO URB completion
> handler finishes, and xhci-hcd needs to prevent bulk/interrupt endpoint
> from restarting after returning a EPROTO URB up until usb_reset_endpoint()
> is called
> 
> I also support adding usb_purge_endpoint_queue(), but it doesn't have to
> be done at the same time as the EPROTO changes.

I've started working on an implementation of this, and there are a few 
edge cases.  Can anyone answer these questions?

The behavior for control endpoints isn't clear.  When a transaction 
error occurs in a control transfer, does xHCI stop the endpoint queue?  
Presumably usb_clear_halt() isn't needed, but what about 
usb_reset_endpoint()?

I will assume that all stalls for control endpoints are protocol stalls 
and therefore do not need to be cleared (the device will automatically 
clear the halt condition when it receives the next SETUP packet for the 
endpoint).  But does xhci-hcd still require a usb_reset_endpoint() 
after a control stall?

Recovery from a transaction error on a bulk or interrupt endpoint 
involves sending a Clear-Halt request to the device.  But if the error 
was caused by some sort of transient interference that hasn't ended yet, 
the Clear-Halt might itself fail with the same error.  To handle this, 
we should retry the Clear-Halt at increasing time intervals.  At what 
point should the core give up?

When the error recovery mechanism is in place and working, should 
usb_bulk_msg() and friends automatically retry when a transaction error 
occurs?  If they do, how many times?

Alan Stern

