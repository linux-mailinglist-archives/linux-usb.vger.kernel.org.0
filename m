Return-Path: <linux-usb+bounces-35676-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFA5FymGymnd9gUAu9opvQ
	(envelope-from <linux-usb+bounces-35676-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 16:18:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E491835CAEA
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 16:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E2A393013250
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 14:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5773D88F5;
	Mon, 30 Mar 2026 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="oIAD08Rb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3A43D47D7
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880282; cv=none; b=PklbdKu/nZCabx9BiUQtYoPJt9iL0OYZmYpNj8tJLGGfuLRgiLB8CF3RiiVIg/JB5sK88LrVWNzI1x8Qui81GSQYbBp+vQFLbWLW8mrSkOCozgx2x35qbf1i1K8AA8YY3yhy42XwalyE1yGSWKbwnco+4ApEdGHpYXS2zy+Ui5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880282; c=relaxed/simple;
	bh=qRYvM+r8Th17bcLZhqPrdvjB/+ypOZvA8fw1r4fgK64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grOk8z3lavSazwXOsIdQ1OSrILwveEy0aNWa5pEPmw73R6oP6mrNE7h27v4NTXuQoRAfCEIfVGgCmz1/prsdziFs1TvoJew5G/RFYQhjtn1oi0tcVXfWWIuKdFKisq82+E+r0PLzgRNNIkd7Z3llDZyilc+ExtFG4EM/E3CA/Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=oIAD08Rb; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8d00cf835b7so583088885a.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 07:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774880279; x=1775485079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pjkQV5n8aRvsD5z7Wv1cPGQTVQujzDYHvN/j7VAqEJ8=;
        b=oIAD08RbabOE5Z7iNskhFU2ProMZuh6+Ek6+7o87el0GgmaAqU6+RgV/LStkr/Tl8S
         g98dpqRc9IbyKGbNFikGo4qShkxyf86N2gYnfg/sYaiubr9AxaPDN1g9UpBPaeFbWrU5
         bXuBv8EFviQE5tExFBu0Rr67SQcTcq38m2uJxzVRrCFbVZRH/9ghu4fO1Pp2bFfHExLS
         9yNVhb0ldsmeuwfXhtkQqOn1lXPpBB3oQ0U0Vq0IwXnUQB2wJBPlmjZiZJYGRPWfsfDi
         n9sWFg2FB1hme6iiK5QafuqpdMsFA3vdXD838kj0NTUVtH93/03AKEl22mGfjcBIJoU5
         p+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880279; x=1775485079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjkQV5n8aRvsD5z7Wv1cPGQTVQujzDYHvN/j7VAqEJ8=;
        b=TSgp43paG9Ie05IoerNB0XQ+U43jY8ZkGC69vLJBBmiYXLlDx4DjS51Po6Y+LRY+gt
         Q/Q/uyLGuXAF+X2u3Fa0TYNYj53EMCBbJXUMkSWZTRT0lXJTRCOpeGF6XXKLqBJEw0Sy
         nAIjnP1fo8yloNhKhkXUT8uzsaOaKluolhIqxLuksuM+4NPAMgle6dGs3iwgKI0jpq4V
         mPxL1+Qqc0Dp0t5tXakQcs786QgmaFMrP0rmglrpzZadsvWcCcGqSZk99ClEmy117u7z
         oTq9e0sFAfqGx1PJGrIkDtEb3Gq8nSS1Z3gL/3RK8NsxuKs6enrZmX66AzfY3iVksLJZ
         Q7ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXjUaX0AYbU0G+5Np6rPLumyh1wITCgcYqyP9QVJd5QQqGTIQk88D/fll3ZkhpuFQ4kOnYZhi1Xoxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YweSxrDQ4EifNLbImysPXB9kuHk4VLdaptr1mmoMzozfpMO5zwW
	QJDwAzpotYhFqSc0PY10xlomoux1i3Q+APagdDTi92OkSmVth6Ar1JmNOs/UdfPJqg==
X-Gm-Gg: ATEYQzzDTuBbiyOaHWrk7UORnxHq7gWEWGwbldOzNmeQa8A4Bu4gbTo02XYfRhdR+Bc
	oAWBK+iofGonBE8W+1Vc8BLMUF3KfNh/oLu2OzmOFNHlNTruUgeJtYuQJciYISrXycLEdcay8fj
	ShJMf41l4fiJ0VP6W2x7EexfRpwsXGFEa8AYXDZ4VopjQLrkjPu36Vxf7owcaDfqC644duwrpCd
	FFY3ud8HPgZ3XRdp8fl4xXayUR7jbqPBjWr9jN77z7XpazpFfT8fq4lqjqYBlCMs8v8wvu8H6Wr
	44zfzGC50CUYK8XPesIgjYo4JBzAr8j9q0I8Quto0yC6LKJikA7ugsayHKJgeqd3wGmMSBJiHP/
	pOHddJu4d0cLnzy/J1pcCuyTxjp3nxnIfIzBirURU+wv8y/dw+eWuHkGIGLPbnqpcaARAc6oCHK
	0f0+w6aWpIvF0ZJ74uWrTtWx50VgagYiYRv3sy4AG92g==
X-Received: by 2002:a05:620a:46a7:b0:8cd:96e5:f7be with SMTP id af79cd13be357-8d01c816da7mr1683456585a.69.1774880279286;
        Mon, 30 Mar 2026 07:17:59 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027f06ee8sm747901785a.14.2026.03.30.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:17:58 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:17:56 -0400
From: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"michal.pecio@gmail.com" <michal.pecio@gmail.com>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
 <20260325015110.v4r5smfvdd62fcua@synopsys.com>
 <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
 <20260326011910.t7ijezht7g7ttrec@synopsys.com>
 <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
 <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35676-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,gmail.com,suse.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E491835CAEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 03:51:46PM +0300, Mathias Nyman wrote:
> Ideally xhci driver would return the URB with EPIPE after STALL, and not continue
> processing URBs before a clear halt is sent, or a new URB is enqueued.
> USB core would hold off submitting URBs to xhci, buffering URBs enqueued for this
> STALLED endpoint until class driver urb->complete() finishes for that EPIPE URB.
> 
> Usb core could flag this endpoint as "halt_pending" before adding the EPIPE URB to
> the bh workqueue. Then after urb->complete() work is called and core is sure class
> driver  is aware of the EPIPE, then core would clear the flag and flush the buffered
> URBs to the host controller drivers, restarting the ring

This is not practical; it would result in a big slowdown for large bulk 
transfers.  Doing this would mean the core could not send an URB to the 
HCD until all the previous URBs for that endpoint had completed and the 
interrupt handler had run, which would add significant latency to 
transfers.

Exactly what should happen to URBs coming after one that completes with 
-EPIPE is not immediately obvious.  If the HCD did try to send them to 
the device right away then they would also be stalled, which is 
obviously non-productive.  The only guarantee the kernel makes 
about this situation is that the endpoint queue won't restart 
until all completed or unlinked URBs have been given back (likewise for 
-EPROTO errors).

The only safe course available to class drivers is to unlink all the 
pending URBs.  In theory the core could do this for all drivers 
automatically, but at present it doesn't.

> Class driver urb->complete() would most likely retire/cancel the pending URBs, both the
> earlier queued 'tainted' URBs, and the most recent 'buffered' URBs in usb core.
> Class driver should clear the halt, but is free to do whatever it wants.
> It could choose to send a new URB without clearing the halt,
> have it processed, trigger STALL again, and get URB returned with EPIPE status.
> 
> I don't think most class/usb device drivers really handle stall that well.
> Above might be wishful thinking.

Indeed.  We can make life a little easier for drivers, but clearing the 
endpoint halt is up to them.

> > Currently you have the xhci driver to "retire" the halted URBs. However,
> > you also noted that class/core may attempt to retire the pending URBs.
> > Who's expected to handle the retirement here?
> 
> Maybe we should let core retire the pending URBS, and only fix the xhci driver
> 'automatic endpoint restart after stall' part after that core change is done.
> 
> Should cause less regression.
> 
> > 
> > On a separate note, will you plan to implement the clear-halt for EPROTO
> > in xhci?
> 
> I don't think this should be part of xhci driver. Decision to send control requests
> to the device should be done by core or class drivers.

Here's a troubling consequence for people to consider: Suppose an 
endpoint queue stops with -EPROTO or -EPIPE, and before the class driver 
gets around to calling usb_clear_halt(), it is unbound.  What happens 
the next time a driver binds to the device and tries to use the 
endpoint?

In particular: What does xhci-hcd do if an URB is submitted for an 
endpoint whose queue is currently stopped?  Does it reject the 
submission with some sort of error code, or does it go ahead and add the 
URB to the end of the non-advancing queue?  If the latter is true, how 
will a newly bound driver ever discover that the queue is stopped?

Alan Stern

