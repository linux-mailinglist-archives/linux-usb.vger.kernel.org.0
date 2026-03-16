Return-Path: <linux-usb+bounces-34873-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBn2CDYOuGkWYQEAu9opvQ
	(envelope-from <linux-usb+bounces-34873-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:05:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D48F29AF9D
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0906E304EA5E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 14:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDFF39B95F;
	Mon, 16 Mar 2026 14:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GMllmQ8d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ABC1F3FED
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669740; cv=none; b=tLOkOi+f0gVaZyPkwYhD1T9HQnaG9zRAUJB4idfP4aFG5ioTBVh0DzFVZIpgEWl4k5hukTK7dxq3Q/lNF8rJ8HogbBfCZO30cIwUyoV559IV5SF/BM1gJ3h6Z4QbQSxmUEZOBX0hTxoCvZwd0QmYupUZMZHUzq7etRR1LCvyKZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669740; c=relaxed/simple;
	bh=dMMiy6Qe6WVNBpBW8UeRDZib1650eyr8C07XQXIlz/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7e+mle2j5tzH/TVixpbQzC9v8h8jfJIneWRQx2dcL6KUPqri16SrN7b8HOzEFzHxy2S2F/1fuwJ/v4x31L9BhjHnpAH5d1G5giTqEaEUuteDjzSc0XREo4Ket3AUP6w01PkH3idLSOdA8RsakNoLlJ6QSaaVtLqB9Mu2ZF1Wek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GMllmQ8d; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cd80bea5f3so287791485a.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 07:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773669738; x=1774274538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALX7lcE21ebzREAcmYT6VR/POiIG1UrGJbIc5TeYDEw=;
        b=GMllmQ8dJO7Hb0Nk30Ww4/wtphcN7Uf1l1n+FpDzgd7khT4p+jroNt6hrdzmBqyW/d
         hFERsxmIgw59zxwEqG7RzypWLicqaUPs2jf+jMITWYagA2Po5AQARrW07UV2mfwBX44a
         20sk47EMQ6WKVTGfoiX2MJcS4IkNTi4c/xLdpnD2vY5wcT1QEEWC4hl//EYyUMmJdAcI
         RfmB0lCxBvu1e3riQEDrFqW9TlEZPNJrfE2S3IW34I70TOk11kvy2fQr5oBConBdmZCt
         WYbQ7IuajC1WVN9IYL5EWRaZtGo5hIBFiZDEtAUGZ4K9swD4hbNXqNaxJCRgHVwmdGBh
         1DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669738; x=1774274538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALX7lcE21ebzREAcmYT6VR/POiIG1UrGJbIc5TeYDEw=;
        b=tXi+w5LMxL81SapakO3HENUYid0X2+zrMYPKkX49SfrZtc2YtDDgTekbIe3lgUWcy1
         9FfKU+QXEhYlqN97Thmq+mFQ5xz8Tar9WMjtTpw0Uv7gO2+54z0glj3J5+T1Y29srimJ
         pJpDDGJEQhuewT1ZY38UL1hgqIzOn/mMvflFEsjkIWC1RvvsfgrjwnnWdq4m3hnvqKoy
         C6cTmTpkYL2sp/NqUYue0ID2hlrdHpjQL3eQjWX0eLEkIeuxhJ30czEVFlGWPdR0styh
         UBOlArZsOrARPoP/JW1sSiN0yMV4KAxvY+fZAvYQov2zK5lgPSqLVpspWpUyOBiekkLk
         pfKw==
X-Forwarded-Encrypted: i=1; AJvYcCVeW1LVoNIWeZs+RIGjP4lGUwTamJdBcQ7zxDpa+fvq0W82Hx6JDBc4bHlP3rTbAtjmhRf6Nn9QUgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxogA7D7HDvINJFSrxgvg4XflaXPbhNRli4HZkTTnhofrReqo3P
	RCr+HueqziND7iGRwsyGjg1FPOSV3yVXZOtz7X9SFw2KkzqNivWAuSAGe3zQ+Vtslg==
X-Gm-Gg: ATEYQzxu1cJNzSp1baIWs4LX5roLexYlQgrlDQC4ivnKGJk7Q+yVd0cloawcbmj7LAd
	5WttuWqF2ZIh9iXOmT7ca6Hwxsfl9xpRyCvRUW+yJac53vhJdCNWC9yyfpFBNDUM+qEk0cCQRb0
	3u1qJqWsXwZzyABAxTn7cNPIJMgvqqf4AZfN/hhLbPR0rVgUUzhA0FrBNWLdtvx7aqBu6xbAtn6
	1XPsqYy5SQ780nw6GnizI+1Ua37zZBwX7WJFPMxEKoN43BdDIdZ/XW/dcjoSwiZ4q2F4FL/W0vI
	jhOj8VL5OKfO/Um5BDRpVMuBzCnMJqoQby3Y5nxSNcNASWdDsg6nLxBfO9v4ovQ8bg/INMGFkeI
	urx4r94JGN0+E7Z5+g9UAEFE4CYBCz2MWmpaPocrSNmjqoqHXR//i1R++ALME3GvjohQUW3tJrI
	LgUwsBkz1OYKZNJl8X/6E6qZNpF2BBXcm3BFsB0q6PAIoaoOLArm+7
X-Received: by 2002:a05:6214:1c8c:b0:89a:1888:a1e3 with SMTP id 6a1803df08f44-89a81ebb861mr201034116d6.36.1773669737596;
        Mon, 16 Mar 2026 07:02:17 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c4d6f4308sm28714666d6.8.2026.03.16.07.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:02:16 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:02:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
References: <261996a8-7ad4-4df2-a469-f6602da71255@suse.com>
 <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
 <64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
 <20260313085354.71a6dbf1.michal.pecio@gmail.com>
 <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
 <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
 <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
 <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
 <3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-34873-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 8D48F29AF9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:58:34PM +0100, Oliver Neukum wrote:
> On 14.03.26 03:39, Alan Stern wrote:
> > On Fri, Mar 13, 2026 at 10:45:32PM +0000, Thinh Nguyen wrote:
> > > On Fri, Mar 13, 2026, Alan Stern wrote:
> 
> > Part of what we are discussing is how to carry out a retry.  It seems
> > that the most general approach is to unlink all pending URBs for the
> > endpoint, wait for them to complete, call usb_clear_halt(), and then
> > resubmit everything.
> 
> Yes. That raises the question how much can be centralized.
> > And of course, isochronous transfers are never retried, by definition.
> 
> Do we still need to clear a halt?

Isochronous endpoints do not halt, and isochronous transfers are never 
retried.  And although the spec doesn't seem to say this explicitly, I 
believe isochronous endpoints do not pay any attention to the HALT 
feature setting (which can be changed by a Set-Feature or Clear-Feature 
request).

> > > > I tend to group transaction-level errors like EPROTO into three
> > > > categories:
> > > > 
> > > > 	1. Device has been unplugged, hub will notify us soon;
> > > > 
> > > > 	2. Unrecoverable device problem, needs reset or power cycle;
> > > > 
> > > > 	3. Short term problem (cable issue, EMI, system load).
> > > > 
> > > > Retrying makes sense for 3 but not for 1 or 2.  Unfortunately we can't
> > > > tell which category a particular fault lies in.
> > > 
> > > There's no need to distinquish them if we have a proper fallback
> > > recovery (such as reset/power cycle) should retry failed as noted above.
> > 
> > Yes.  Still, that's a fair amount of logic to add into every device
> > driver.  We should be able to centralize it somehow.
> 
> That would suggest implementing an equivalent of usb_queue_reset_device()
> for clearing halts.

My thought exactly.

> > Also, just to make things more difficult, these errors are reported in
> > atomic context but the recovery procedure has to happen in process
> > context.  Which means there has to be a way to cancel the recovery
> > procedure if it's in progress when the driver is unbound.
> 
> Well, no. Not exactly. If it is necessary to clear a halt before
> you can communicate with the device again, we cannot reprobe
> the device before the error is handled. It wouldn't work.
> We need to wait for error handling to complete if the driver
> is unbound.

Good point.  So not quite the same behavior as usb_queue_reset_device().

Alan Stern

