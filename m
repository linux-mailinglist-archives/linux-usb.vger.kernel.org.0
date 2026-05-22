Return-Path: <linux-usb+bounces-37935-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAB8LC5wEGqgXQYAu9opvQ
	(envelope-from <linux-usb+bounces-37935-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 17:03:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9825B69C7
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 17:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0C5C311FC47
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 14:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34AD421F18;
	Fri, 22 May 2026 14:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="flHeC5C4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545EA407CDE
	for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779459537; cv=none; b=HLiUE1TMby4LJVZo98WIxkwJfiIO1wqIw8lNaA7s2mWgC9YJXA2QNO7okl06Sjs2hP79o3zM5deGXwB/tBGcoPrWyrHukmJHEwe9jGposERJdC1J3cl2mz/XjwgLfkNCJ4QNMmKlVCpIMw9f2BrwTd2FI1ITS9hUPSJPf+fM7jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779459537; c=relaxed/simple;
	bh=TmsPppVeJUDSPPyG74Tnaebarsh9dg8MdLduDKKojzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bx2ONYPIdHgcCWWPPuY+dq7p3mnGbUX7wjEYgUq/ZKRuGok7bK7oF8X8/ewubVVE3zIjzEFz4t7wn2ll0/gWKaD/HKQChce4b5m1qtUvtERd2XZ5hTrf58uJ6xb1fgWDEiLGk0SJF5nYJ2bvy+cJrTLIDWbkrUpYyXjrAmMw/wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=flHeC5C4; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8b6dd874471so108494916d6.0
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1779459529; x=1780064329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OtsoTeN8WOwBQY+NCmRzzN9MgbFzLEsOIs66Ryt4vMg=;
        b=flHeC5C4d5y8cXAI99sdMsTr2tH1a5J+XLAI4KE9xx4ulBiqwcqQ2wGBTL+0wMbcTU
         jsHQNpd7dVkE9zyWbRuMCo1O2ytnbJQ4GI8EAID4Hi2fXh1X4FxtfTr9QCyN/unsHcKW
         eCFAz46mu9UGWOErSW1WSRiEOokcbhlChz261afPiF4YSehHmMnszUYffriBmroB+LbH
         dRkK78MUAdNtTrRpJnanUi2iW8b2QmMFr3wE8L99fiQGups5doPw935Tu+jMPtIdJ5hf
         yZHKDmLY+1KGkMtHxwAksc3kpnJOTzcvGIHPFFuPTWZpK2k+xdpUp2nIO6ZDkNuKP6Ye
         ECog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779459529; x=1780064329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtsoTeN8WOwBQY+NCmRzzN9MgbFzLEsOIs66Ryt4vMg=;
        b=eUQc1iP6nwzw32w2vMUjb4pDJE56G5mRRzltuK6sPHl/4dttIygZ3yiz6ZJcfM5Xjo
         Ll1I9X0PAEkrI5V4u3/Q3btfIgD910szMhhX3JRzTh1wVSOOAb85jv1IhKwSfpI2rmOq
         o74jbV8ShDScIGS7LTgw9OMGYIBm+xrxt4UlPDdBoF968bBBVXExGI5s0VFnCaY7kgXs
         Sk2Nu95R9NF6N6yiM34K8WDlXi7+i1O8oMNXffWVCtoNUqQyxZzybOtYNPcxTKyT28zr
         +9NrxQW5RMvgejxsuT16yER4njZIrOyKe5CJGGeqwZYgA7287PGdRZC00vZr9JAgZTAc
         Gsxw==
X-Gm-Message-State: AOJu0Yw5lUcX8z24Ag+UWAFJHpJAUUNee+jcHo/H2Of7UxCXQWcEb6Pl
	Ux6nfDYL9II/GFHCtWMBT1qK7rW0bgVQal9pskxglt8/gUWM/kDx5d8CSTN+pZamC2/Qw18/jK8
	yDRg=
X-Gm-Gg: Acq92OHDsl2F2h/uffLIk6vKF+WOdqipF7CqPF5z9KA9gyAK9oP5N7XwnQ06xUTL9M0
	pdHbiw5uJbxaaXywQFOLdVBzKD4q1Gq1HzjPyXq/MqdF0OdMHw4POzGzcZle3yHUQtRmBY6CScY
	YigFJQkDJHc/+Uj7izYZf97LrNy/CP+ZcfYypi/qE6DpLsDku/y7BAupcvDzdMOIx7eKEokcObt
	usKfCPzkxl+bawcPP611EHCYJtxZedZcGyYwJuBHGsJtleFTRL25T8G3W0fhQH66mRhUWmA0tbf
	BPT2+FUx6SD9n3Lu0h1G7UoLzUyaG9ea8QK4/Th937oj6MZbhPJpLBRZ1IlIX9S059sJ7BuXeEh
	RRHs9GKC0Nv/s7lYzw6rdi4uRthLcLEl2Wf3eHBiP77WjPk4qhEkhpo60NkUdaXHi/1R2C4NPG/
	YDcXV6HXg7moq4WSSDPXHCyvUZ3hRahMpKJzYh4cG5q5mzzAZeHj2KgBi+9r5/sglG
X-Received: by 2002:a05:6214:450b:b0:8ac:7627:8a71 with SMTP id 6a1803df08f44-8cc7b645335mr63706716d6.49.1779459529073;
        Fri, 22 May 2026 07:18:49 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc812e2018sm18901686d6.28.2026.05.22.07.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:18:48 -0700 (PDT)
Date: Fri, 22 May 2026 10:18:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Brent Page <brentfpage@gmail.com>
Cc: linux-usb@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH] USB: EHCI: inflate max_tt_usecs and implement sitd
 backpointers
Message-ID: <bfdd7729-be9a-4014-87bc-7b7a5b393980@rowland.harvard.edu>
References: <35666FD0-D108-41FD-8CE4-CD8F0DD87472@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35666FD0-D108-41FD-8CE4-CD8F0DD87472@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37935-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BC9825B69C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 17, 2026 at 11:42:35PM -0700, Brent Page wrote:
> This is a follow-up on 
> https://lore.kernel.org/linux-usb/
> B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com/T/#u.
> The goal is to accommodate 1023-byte-endpoint full-speed isochronous-in
> transactions on a USB2 bus.

I've been very busy and haven't had time to review this.  It would help 
if you post your changes in their final form, and do so in a way that 
doesn't get corrupted by your email client.

> One of the main changes is
> - max_tt_usecs[] = { 125, 125, 125, 125, 125, 125, 30, 0 };
> + max_tt_usecs[] = { 145, 145, 145, 145, 145, 145, 35, 0 };

...

> I also want to make sure I understand something that line ~2197 of the patched
> ehci-sched.c: 
>     sitd_before = list_last_entry(&sched->td_list, struct ehci_sitd, sitd_list);
> is based on.  Namely, in the current code, am I correct that
> insertion of a new urb's sitds into the endpoint's td_list looks like: 
> 
> td_list initially (say it's loaded up with a 3-packet urb)
> |-----|   |-----|   |-----|
> |td0_0|-->|td0_1|-->|td0_2|
> |-----|   |-----|   |-----|

That picture is wrong, because the list is doubly linked and there is a 
separate list head.  It actually looks like this:

	+-> stream <--> td0_0 <--> td0_1 <--> td0_2 <-+
	|					      |
	+---------------------------------------------+

> line 2090 in the genuine kernel code:

Genuine as opposed to fake?  :-) Just call it the current or existing 
code, and give the kernel version number if you want to be very 
specific.

> (executed three times for a new 3-packet urb)
> list_add(&sitd->sitd_list, &iso_sched->td_list); 
> 
> |-----|   |-----|   |-----|   |-----|   |-----|   |-----|
> |td0_0|-->|     |-->|     |-->|     |-->|td0_1|-->|td0_2|
> |-----|   |-----|   |-----|   |-----|   |-----|   |-----|
> 
> ?

That loop adds three new "blank" sitds to iso_sched.  At the end of 
sitd_urb_transaction(), the picture looks like this:

	+-> iso_sched <--> new2 <--> new1 <--> new0 <-+
	|					      |
	+---------------------------------------------+

where urb->hcpriv points to iso_sched.  (The entries end up in reverse 
order, since each one is added immediately following the head, but since 
they are all blank this doesn't matter.)

> The following later lines in stid_link_urb (again genuine kernel code) then put
> these new sitds in their proper place I think:
> 2177  sitd = list_entry(iso_sched->td_list.next,
> 2178    struct ehci_itd, sitd_list);
> 2179  list_move_tail(&sitd->sitd_list, &stream->td_list); 

This loop moves the new sitds to the end of the stream's queue, and the 
following calls to sitd_patch() and sitd_link() fill in the entries and 
put them on the hardware schedule.  The end result is:

	+-> stream <--> td0_0 <--> td0_1 <--> td0_2 <--
	|		--> td1_0 <--> td1_1 <--> td1_2 <-+
	|						  |
	+-------------------------------------------------+

> Lastly, I'm still a bit confused by this comment in ehci-sched.c:
> /* special case for isoc transfers larger than 125us:
> * the first and each subsequent fully used uframe
> * must be empty, so as to not illegally delay
> * already scheduled transactions
> */

That comment is from a 20-year-old patch and should be regarded as 
somewhat out of date.  As far as I can see, there's nothing wrong with 
allowing the first uframe to be partially occupied as long as the new 
sitd is added to the end of the uframe's queue, so it doesn't delay the 
sitd's already there.

> To me, the main issue is that the adopted "carryover" approach to budgeting
> doesn't take into account the fact that the TT processes the transactions
> sequentially (at least according to all the footprints shown in the figs. in
> EHCI1 and USB2) and doesn't, e.g., do part of transaction 1, switch to
> transaction 2, then go back to transaction 1.  This most obviously is
> problematic for long transactions, hence ehci-sched.c handling this case
> separately.
> 
> I make a point of bringing this up because, given the inflation of the
> max_tt_usecs values in the patch, it is actually the case that a newly budgeted
> endpoint may "delay already scheduled transactions". For example, say there's a
> transaction budgeted for HuFrame 1 with tt_usecs=2 us and a new device gets
> plugged in that requires up to tt_usecs=140 us per transaction.  The new device
> will also get budgeted for HuFrame 1.  Then, the device's transactions that
> actually do take >125 us (due to unfavorable bit stuffing requirements) will
> delay the 2 us transaction (it's maybe worth pointing out that this relies on
> the fact that sitd_link in ehci-sched.c puts the newer sitds first in the
> periodic queue for each uframe).  I don't think there's anything "illegal"
> about this though.

It's okay for sitd_link() to add new sitds to the beginning of the 
uframe's queue, provided this doesn't push the budgeted start of the 
last sitd in the queue beyond the 145-us limit.  But in general, things 
will be simpler if each new sitd is always added to the end of the 
queue.  The code should be changed to do this.

Alan Stern

