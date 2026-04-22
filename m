Return-Path: <linux-usb+bounces-36412-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDYcBR5d6GmPJgIAu9opvQ
	(envelope-from <linux-usb+bounces-36412-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 07:31:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 941C24421A3
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 07:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAFB73028C25
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 05:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B929131E821;
	Wed, 22 Apr 2026 05:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HomeytOx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4B12DE6E6
	for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 05:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776835864; cv=none; b=koDHr6xFset1fyB2yvkUWTdGAfb63AY+jpFeZuJEjryCz1TqgB4RDVd4SNXX3rXMeEIt3b9P3vDBGtojGm8IQOi9nyeKQb8mPhLJwbHYwpxVd5jy2bN1MfSQnCz5wSN8VV3z5arSnN3/NkWrbQ7rsGVaTw3vgN6qVithNIkmhVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776835864; c=relaxed/simple;
	bh=ADuThMhYqdoXx9YUluyx3OmpgzXRVXh5hYFYIJWP1m8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o1V/peu5HiHN0IGxq46QHS8yRPr8wFOTdTAkoXaENpSAUD0iYTbuCbtKE5UN0lIUFsOIJo1OffNo/v2sYlpwpAuplsEBuLwENyYkiKSupJHyZ9N0+CxNpnAnmo0arFYvv/0awyGPGBfeLGE/br4/d3OYXPnzGJUVD6qEs1X6OGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HomeytOx; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso6113925e87.3
        for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 22:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776835861; x=1777440661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Og8UPRi3vzyiTEBu/78yMPzqSvep1UCSOq6qlV1JS6g=;
        b=HomeytOx3f6WdQwzdn6JJqsJr41djjrwef4sdiVKa5tKN22Tfqw3mu8sVaqvQ6xcCV
         Pprp+mK41p7UxsNxgTm4x5FjK/NT5iVb5t7xZnTfrloCeEnMdC5GshpZAkV/wXeSExpD
         QoknVR6pGD+xEfTE1iWPFgvWZkkhROh7qzIE4/M2P9TFCW1BsPPP+zHf14vQ4l3GpGwG
         0nK/Ia8984lUIxhwx30XCyroYB5rsp5PjO3wvhJ7AsfhdmcjlYy4JdJyeWnbr+7t1twT
         bpqtLcfHD9BxWMkdAAybmZUO9ShqpCogjqWpUDSiCoZ47JzyhPP88ZvLvLUwoosPDpOX
         HZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776835861; x=1777440661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Og8UPRi3vzyiTEBu/78yMPzqSvep1UCSOq6qlV1JS6g=;
        b=fM0KU5GhL5p0dIT+6IrWyRzeeLOR0VH28/fDgQ2jiJ5aODxCxvcNIeHgS7r+OixIup
         eAOu25cuO7CNkpNOC9ozZua2R6eVPxkvPnwNO02lpEndf+JbQEC66AkcGaTQB/2vMM3b
         6kkWPdYANt4mapBBsH+SI8movBdaEHRa6JpbtLCYW9IOBFq4HHcLofKmf+mUf9zYWCue
         c6TAxDcH20BTa6VQhEUeNpHPXf+mNSnO8h0B1IT1V0XrgZ3y8tODBUByvCqSObUfmmH1
         cHKHrnSjq1awBDok/gVUG77IJwOw0LmvtfRkbvansNjFPqEHTIzC1ihyD8CH714mj7lf
         gcrg==
X-Forwarded-Encrypted: i=1; AFNElJ8i7zM22M/d0OKvqzUrtRAAeoSZtVdxGgbOmbrqb45IRZOJU4yTRdieTc7ZDd8yhzQdpkYJOTlFivU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDLKTGcJWM4pPqYV+IkNWRUyONogROf2ZBSEmuVr/zlHOxnj56
	SnI7gFJxuPjos/LQPfwN6XWtGPpNC3AcE8ziEawrslXuTS6feLk+KOdR
X-Gm-Gg: AeBDieu2hjQb1QBiobGvNowWKFp5mOMX2PabWyS4EOGFM/lqMFezY/tHg4+cRrC6T4R
	hp2ni/hvOZ5dVp2QdVPQNHzqvCEEFpfOClhDR3xtrU5mIYrNJiDkRJxPq/+1liN4c2AkB5WFrg+
	pWe8RTt0ReEMpi40lFek32ItVfCXXe4FjMjYSxgQc7b3jkSXZHpFiMB6VbVZF2Zr+URsBBOqYv/
	vb/6I/E17jdB0PhTE1i514mrChYGwlw7ArC4Mm1MlpQHkSXjR32NZ4LeKIvwr4rg8WqQ3BRZtC8
	RSInA2fIhJYz8s5Qpy0wBg94m0ourZpjUhUNOwlMVEX9BYGyu4gKcKdnhKwq5HtwXG4dRo5LKPb
	jfjdheLBkITfcmNMJEgXLJK3A/Y4XqYbrIM+0ScXE4oA4Q/0eJLF0YaNBgomzspFq+xCV66vrIW
	iytY0vUP2hZof3wJXcFeUw3u64BHTw2skhQ9kCaZm2W5HQoKphMFrzdA==
X-Received: by 2002:a05:6512:3b2b:b0:5a2:bc5d:c675 with SMTP id 2adb3069b0e04-5a4172dcd63mr6225967e87.28.1776835860598;
        Tue, 21 Apr 2026 22:31:00 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187eb5f1sm4088853e87.72.2026.04.21.22.30.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 21 Apr 2026 22:30:59 -0700 (PDT)
Date: Wed, 22 Apr 2026 07:30:54 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <20260422073054.0bd482ba.michal.pecio@gmail.com>
In-Reply-To: <54fd265d-4ae8-4573-b618-587af98176c9@rowland.harvard.edu>
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
	<54fd265d-4ae8-4573-b618-587af98176c9@rowland.harvard.edu>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36412-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 941C24421A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 21 Apr 2026 22:11:41 -0400, Alan Stern wrote:
> On Tue, Apr 07, 2026 at 11:24:01PM +0300, Mathias Nyman wrote:
> > On 4/7/26 18:23, Alan Stern wrote:  
> > > It's been a while now, and nobody has objected to the proposed
> > > plan for handling this issue, so I'm going to assume that
> > > everyone is on board with the idea.  
> > 
> > Yes, I support this
> > 
> > So basically usb core will call usb_clear_halt() after EPROTO URB
> > completion handler finishes, and xhci-hcd needs to prevent
> > bulk/interrupt endpoint from restarting after returning a EPROTO
> > URB up until usb_reset_endpoint() is called  
> 
> Can you confirm that it's also possible for xhci-hcd to prevent
> control endpoints from restarting when a transaction error (-EPROTO)
> occurs?  Up until usb_reset_endpoint() or a new callback?

Doable. They halt like any other and it's SW's choice how to restart.

BTW, what about EOVERFLOW? It's treated similarly by xhci-hcd.

> I've been thinking about how to implement all this, and some issues
> have to be solved.  In particular, suppose we have sent a Clear-Halt
> request for an endpoint that has gotten an error, and either the
> request times out or the device replies with a stall.

(... or the TT replies with STALL due to downstream bus EPROTO).

> My feeling is that either of these events would mean that the device
> is so far out of whack that the only thing to do is try resetting it.
> Any proposals for something a little less drastic?

Let's look at possible causes:

1. disconnected device
Doesn't matter what happens.

2. completely brain dead host controller
Ditto. Just be sure not to lock up so xhci-hcd can be reloaded.

3. temporary EMI or low link quality
This should clear itself after a few retries.

4. broken D+/D- wire in a LS/FS cable
Issues can last arbitrarily long and yet still clear.
Least disruptive solution: wait forever with sporadic retries.
Acceptable alternative: request user attention, i.e. disconnect.

Note: we would disconnect instantly if the opposite wire broke.

5. crashed device firmware
In this case a reset seems more productive than retrying forever.

A compromise betwen 4 and 5 could be to retry for some time, then
reset a few times, then disconnect.

6. device doesn't support clear-halt, stalls or does something odd

Nightmare fuel.

> Also, it seems reasonable to devote only a single thread to endpoint 
> error recovery.  Another possibility would be to have one thread for 
> each device having problems, but I think the likelihood of this 
> happening to multiple devices at once is pretty small unless the
> problem affects a hub upstream from all of them -- in which case
> having multiple threads wouldn't really help much.  Other opinions?

Well, another option is asynchronous URBs and "callback hell". For
instance, besides hcd methods, all xhci-hcd endpoint management is
asynchronous, tracks current state with bit flags and defers actions
blocked by flags until the flags are cleared. This includes waiting
for Reset Endpoint commands, TT clearing, ongoing unlinks, etc.

One practical complication is that hcd->endpoint_reset() may sleep.
But it will only extremely rarely take 5 seconds and time out.

Regards,
Michal

