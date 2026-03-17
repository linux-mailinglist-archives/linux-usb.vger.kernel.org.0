Return-Path: <linux-usb+bounces-34938-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFuZNrBouWmZDwIAu9opvQ
	(envelope-from <linux-usb+bounces-34938-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:44:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F312AC341
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E85ED306BE35
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674FB3E6DD8;
	Tue, 17 Mar 2026 14:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MLDyyb2S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1AC3A873B
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757889; cv=none; b=lr5xMUjsBaRLzDNvIJJ0JK5PT48znC+dMPanHXNuQHhXsnjS+wvIbACAP2vSl8f/a3XMKZX1YZUSZGfGkmnFimUI/6s7CeTyYMJEPH/Uk3+Rnont/fMypfk20KJ8ao18vYu9pPS36MNt/urkxodpzmDPvrEAchJiJOIyMqzZPq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757889; c=relaxed/simple;
	bh=7F3A/j9nsXC0pDLwKSneSreZTlcK+/HjmflB9H26WbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhCu9SEVa6AfUX4nzoQRIeWjuHfvuiYjaafl0vHAP6za+mq36jmqqa4hTePZCowtY+xbgSX+ktgbTxW4JqqJeiQ3dwQAD3GGvceQC388u15Yc5kHxuhPTjPDBKSJrpzV2egts8K8Pm13HT1wU05kiHqZ06pcoFPN/tKsl2X5Sio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MLDyyb2S; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89c5446f3caso23590406d6.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 07:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773757887; x=1774362687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j9B6hyx/6JN3SbrNbknzl1dCMrKl0PW91iwOaUcQtL4=;
        b=MLDyyb2S5KrZHU72boTvnPd4W2FFaOCb9kbENcmSzJZkYQ3leVYE0xW76ak9JIFvqy
         bX3X2+pOartn655xY9FYTufZFAT0At12mFHlHIfmlDzLcbbacW6hQU8YdaAuhyIA9I3Q
         NHiW0Tz8LAA23WjSfaYeSjzyK7+HJXvtA4xyNORsihdv8qcAnjcNHfAob7WKXfwVccKS
         54D9lJlfvQ/m1wNAdsfBOoCooyRQ3+SeHNlKa79vKn+2BjBDU91/MwfdIJwVioSm6gkx
         orVRm16+GPjVQUFRbqsVPV8CPrmgiHVkZr2RDjjX9eOFrjYDP0k48OgjW0QjVUBoamgA
         FwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773757887; x=1774362687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9B6hyx/6JN3SbrNbknzl1dCMrKl0PW91iwOaUcQtL4=;
        b=b0U9ByaLFQQEY4a1SMqa00pcsszi6w/yCffUNAlw3KPSaBPSggLqOuTAXl6DoT8fEy
         5P05jC/TQk8AKi6kBnFCCu53c2jJqsImuvBgEDFp+uYPh9tiSA8wnmKaXU1sS/It1TmF
         vA2Qje1zVJMkZIkuS7SzNCSXNmHwNJNq0bQDV8OC0LIMsBxB3v9BeesvDH79iXq/W2Mh
         Cbv11g50aojQbN7tix06aMe8BLOcdNBCAfTiJx2aR3UTl8q6VspqEZyWJoL40QJispi4
         zWH5l2H2FLGbetOMoNIoGQRtuFjVFcqFMpKrc68H9cFICNs9jHD4WzkTs4IKw4JtZalw
         FQOA==
X-Forwarded-Encrypted: i=1; AJvYcCXCGAEkLUYYYT1n3kWqGrBohNLKkvt5nibCyycBMhRRE7qXlrPmOCK/5J0nEtlP3Dso7mTNeEgnmqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAUY3RBmRY6PLUv+EFoRXy2q9tPbfcSs8OJSQBTEW9vwnkzsgU
	aK1Jw0wfNu1A4O0vQvOp/RumibLQS4U41k/bLWPLGy7GvOQ/A1S5gegxny8iIRcLGQ==
X-Gm-Gg: ATEYQzyoeRRB2HPl6jzzEj75WfFu/L/BWlPvntYuCaGojRyxfoKxeVOw+AgpIHxNZAQ
	76e27/2hOOt/YdmvxVX6pKBPQy3wbzf/yeN6ejbs5QcLRHGdtRVaQhc44UwlawVJncBAA1CA/+l
	nkAK60fef/U1Dv53Vy811tLdC9OFYEXYMqPBfPwMHoakokT/4aXaHtTjPC1O2uOzzpvBWjNY2rq
	J+g2lhojJ981hN1RQAY54ZHNM4WzOFlKnpA4fLmSWqSrIM/kdZ9FXOXwQFQl8frK9U1Yk27x5A2
	M+fcYsRSDKMqdVrdsKhCduvlJyA86ePVHPwkXc+lmJB00HQ+fviAOzFdDuBdzBQjle2B6BP1WO2
	ILjScc/3sRIxKuzHlye3HkzVPULxcK1gyGndgNWGTJyXNXJn12Q9t3RgKTKiDO4U+/3UJcqd/eP
	AqXyc9f9C2GuWzYtWZnWBG1lcr
X-Received: by 2002:a05:6214:27c5:b0:89c:551e:1cd8 with SMTP id 6a1803df08f44-89c551e2846mr91700236d6.62.1773757886374;
        Tue, 17 Mar 2026 07:31:26 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c4c018f5esm55904446d6.45.2026.03.17.07.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:31:25 -0700 (PDT)
Date: Tue, 17 Mar 2026 10:31:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
References: <20260313085354.71a6dbf1.michal.pecio@gmail.com>
 <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
 <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
 <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
 <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
 <3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
 <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
 <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
 <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
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
	TAGGED_FROM(0.00)[bounces-34938-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 57F312AC341
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 08:32:59PM +0100, Oliver Neukum wrote:
> On 16.03.26 18:33, Alan Stern wrote:
> > It's more complicated than just clearing halts.  What if the driver has
> > queued a bunch of URBs?  They all have to be unlinked first.
> 
> As far as I can tell for some hardware those URBs may be already be in execution
> when the error is returned. So that is a hard problem. Frankly I do not
> see what we can do more than provide a suitable operation for anchors.

If this happens, it's a bug in the host controller driver.  All bulk and 
interrupt endpoint queues are supposed to stop when a transaction error 
occurs.  This is mentioned explicitly in the kerneldoc.

> > Then after the halt has been cleared, the driver has to resubmit the URB
> > where the error occurred (keeping in mind that some initial part of it
> > may have been sent/received already).  Maybe also submit the other URBs
> > that were in the unlinked queue.
> 
> Correct. Hence usbcore needs to notify the driver when a halt has been
> cleared. I see two obvious options. Either we provide a callback with
> the helper or we declare another full callback akin to pre/post_reset.
> 
> > There has to be a retry counter or timer because the driver should give
> > up after some length of time.  When that happens, should we try to reset
> > the device?
> 
> We need to notify the driver when a halt is cleared. How about we
> provide the option based on the return value of the notification?

Think about what needs to happen from the driver's point of view.  An 
URB completes with a -EPROTO (or similar) error.  We need to unlink all 
URBs queued to the same endpoint, wait for them to complete, and then 
try to recover from the error.  How should a core library routine handle 
this?

Luckily the core manages an URB queue for each endpoint (see 
usb_hcd_link_urb_to_ep()), so the routine will know what URBs need to be 
unlinked.  How will the driver's completion handler know to ignore these 
URBs when they complete?

Following the clear-halt, the URBs need to be resubmitted.  Should this 
be done by the driver or by the library routine?

When the library finishes its work, it needs to tell the driver either 
to start running again or to give up.  Presumably by means of some 
callback.

How will the library keep track of recent error recovery attempts?  It 
needs to know when to stop doing clear-halts & retries and instead issue 
a reset.  How will this reset interact with the driver's recovery 
mechanism?

> > It's a mess.  Implementing it in usbhid was justified because that's
> > such an important driver in such widespread use.  I'm not at all sure
> > how it can be generalized for all sorts of other drivers.
> 
> Don't you think that what usbhid does is a relatively useful model
> for other drivers?

It's a good deal of reasonably complex code, which should not be copied 
to every other USB driver.  While the approach is sound, the problem is 
finding a reasonable way to implement it.

Alan Stern

