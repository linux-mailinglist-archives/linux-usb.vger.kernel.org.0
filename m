Return-Path: <linux-usb+bounces-33205-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNq+IlL6iWkiFQAAu9opvQ
	(envelope-from <linux-usb+bounces-33205-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 16:16:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EFA111CAE
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 16:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6743830143CC
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 15:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FC43793D5;
	Mon,  9 Feb 2026 15:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CM6EMAPk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA0623E23C
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650185; cv=none; b=izZZttZ2+b76AKabnZ9mSMh0OjcDtZwlA6Da+YhQ9id3lVd+KAhMA4rNilqcSlEv6ufFK+IHx1ZNn948XpKPaoyvUjXurWm0jMauTwfm/wDECXZUfwUxzDRQmvTPHGvzEXuP1OoterQCmNDY+sPNlDv6xK3RRdxxZk/kd9TtYrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650185; c=relaxed/simple;
	bh=pAQVPRkhwsXOjkr2lHuE74kZcsH7fQ9K2lwDj2NqTAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2cnFmk2YEiIlG7uveVn9G/E2/OklWCENCjykKb7jplZx/henh8Y4Yk73yqw54Fcw094tAXlxySqTD2rq88fDMUJbVn7JywvzC97ak8iPgS2/wUNS8zVSBEO0P0hb++IIgfZfBx8uKdd8wq3Z8esvLmprM2mr5rnIvaExJy2XcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CM6EMAPk; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-896f82e5961so26365636d6.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 07:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770650184; x=1771254984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a0ZAQyr6UrJJ3R/xqITbNGKyZ6gllZFTWGGpHHoJU1o=;
        b=CM6EMAPkz/6dPcr/tOS+MT+iLOVqHYTXtb4L8Ba5ylrj24b7E5G6XNfftDM1Hf9Qw1
         waSZQ97VxALaZqIf+x3sTbl4A9QooATNpTf7cKigxU7mIn04eems6NWYNIv9S3sNcDDj
         +JttAa9hGbBrOdWyH3qHccfRKuiXhnuKbL300wE7ldNTxgFb8sD6EsFE/N6dj2XhkK10
         oWc0DD+ayHIZZqGocHHRV66YFDYwml6Vqcr18tqb0QcyfoY9LWphN09d+LlebGD5174F
         Lcw4hHrYPl20MnRUhXxI8k5WW9T2dqLwTYWDCD2QRxgIjEJpS3QXCs+iEqRElHSLSAOi
         BIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770650184; x=1771254984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0ZAQyr6UrJJ3R/xqITbNGKyZ6gllZFTWGGpHHoJU1o=;
        b=iVrkcH8UAlxGsg//9cAu8b3VOj9u8ilRP7JNPVTaI9ir1gNmDOX6BA7mGui9nm2Auf
         peev09TbfO6rgXU401ET8IslZkE8gz9Gl2sBR/XI452rL8rRwEzcRKGmlrXZZLX8ayo/
         +U0lY6IJMpOZ1Cv8CO5Sy2Bmr2umRgFW7LE7WQSaJQnomuKrMTrDed0/eS+lSW/tBqSO
         cihWw275smOGuw80pSAYxbOtO2HxwUNugcN3anvGFNXzIDsXyLEv05Y4hjv9qOkF7xa3
         kIBWXzous6BXHIkePP2x+lZWLyKhpddbUBkqQw5l2SpVHdddsat4ddUcDlCPO7oaKSfZ
         4XUw==
X-Forwarded-Encrypted: i=1; AJvYcCXqX3jaOhSC5i4oo1VP/0eFCyTlwDRHKiIpnM48/13mhZHA9+cLZmITdGOWr2CNTU/Nu+M/XZWSBls=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVD+Z8Rk9siRcBs5c2CEXxUi1GJUdH4wNgL5kSmRcx5Bafkdmc
	Z+eTylPyN7K+MkZu5PYeJIEfNshNQ3MnaoyYRooGffqG/r7Ujk6nPBUGmVXrLBS1bg==
X-Gm-Gg: AZuq6aI9MiHNs+CVSiWL2nWyGDNDvSorgT4mxpMCeUe1bEMSSmqjzbdWLf9c5xjGKtj
	n/m8cMgOVkWR1y6IhoJjDtCg4eyizc/OiBYGXZIaGQwDqHHSxKjMmOMTFga2gQITgdfRjIDijaO
	K+f7Fw6SW7H6s24QTcICUkTb8T/e3F9nDtk7RZYz5CNlvLEzDR+1JQx+q3w5Hc0+DB1JY/778KC
	g4lDVJM1N8uioqoso/EnlE6Q2kONoiKDLxx51s0q6EDDtDAFcDkYDjOxF0ugAX0kYwemUAJ9cMf
	Qq7eHAhHuVVxv9UQ2WebY5iMVI8cu+xasMEKVqp4YvvArSYfvxyWUgm4zpAvRtEnFwGBLrIPzBl
	bfEwSqTpv5jENm2CQwVtmE30iz8/9t+nf6gtIB/aeDEsc3tk0HvF16i3OJSQ0mRQ2wM05+twKNM
	SfdcmfNXjkYos5A32E6qP60yFdKqEKmA==
X-Received: by 2002:a05:6214:20ea:b0:888:4930:797e with SMTP id 6a1803df08f44-8953ce9ee5bmr186929236d6.70.1770650184353;
        Mon, 09 Feb 2026 07:16:24 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89651161382sm45166106d6.51.2026.02.09.07.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:16:23 -0800 (PST)
Date: Mon, 9 Feb 2026 10:16:21 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: RFC: Prevent long uninterruptible waits in usbcore
Message-ID: <6456e3e3-b598-4d33-8fcd-c7f8399d8a6d@rowland.harvard.edu>
References: <3acfe838-6334-4f6d-be7c-4bb01704b33d@rowland.harvard.edu>
 <2026020950-prodigy-steadier-f747@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026020950-prodigy-steadier-f747@gregkh>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-33205-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 02EFA111CAE
X-Rspamd-Action: no action

Replying to both Greg and Oliver:

On Mon, Feb 09, 2026 at 11:05:45AM +0100, Greg KH wrote:
> On Sun, Feb 08, 2026 at 09:33:02PM -0500, Alan Stern wrote:
> > I'm asking for comments on the patch below.  The problem it fixes is 
> > that usb_start_wait_urb(), which is used by utility routines like 
> > usb_bulk_msg() and usb_control_msg(), can have arbitrarily long 
> > uninterruptible waits.  And of course this can trigger the kernel's 
> > warning about a hung task.
> > 
> > Normally this isn't a problem, because drivers calling these routines 
> > generally specify timeouts on the order of 10 seconds or less.  In the 
> > particular case found by syzbot, however, the usbtmc driver uses a 
> > timeout value that it gets from an ioctl with no checking for 
> > excessively large numbers (see usbtmc_ioctl_set_timeout()).  We could 
> > change this one function, but what about other drivers?  There should be 
> > a single policy on how we handle these things.
> > 
> > Now, I suppose the reason that the usb_start_wait_urb() uses 
> > uninterruptible waits is that drivers don't want their calls to be 
> > interrupted and aren't prepared for that possibility.  But we also don't 
> > want them to tie up a kernel thread in a ridiculously long 
> > uninterruptible wait state.
> > 
> > I thought that a reasonable compromise would be to keep the 
> > uninterruptible waits for timeout periods less than 60 seconds (somewhat 
> > arbitrary, but hopefully short enough not to trigger the hung-task 
> > detector) and make them interruptible if the timeout is longer.  The 
> > idea is that long USB timeouts don't normally arise in the kernel, so 
> > they are probably caused by a user request (or a bad device), which 
> > would mean that interrupting them wouldn't be such a bad thing.
> > 
> > Any other ideas or thoughts about this?
> 
> Having an upper-bound on this is a good idea, and also the usbtmc driver
> should also be fixed to just reject extra-long delays in that ioctl as
> that's a user-visable way to stall a cpu.

Okay, I'll write a fix for the usbtmc ioctl routine too.  It doesn't 
really stall a CPU, but it does hang a kernel thread.

However, I don't know anything about the USB Test and Measurement class.  
Is 60 seconds a sufficiently large limit for timeouts?

It would be great if there was a way to find other places in the kernel 
where a timeout value comes from the user or the device with no 
checking.  But I don't know of any way to do this.

> So no objection from me with this patch.

On Mon, Feb 09, 2026 at 11:03:09AM +0100, Oliver Neukum wrote:
> Hi,
>
> is this a proof of concept or a test of the real fix?

Proof of concept, since I'm not yet convinced that this is the best way 
to fix the problem.

> I am afraid this is highly problematic.
>
> 1. You'll hit every user of the API. These are probably not ready to 
> handle signals. This includes usb_bulk_message() and the interrupt 
> version.

It won't hit _every_ user, only the ones that ask for timeouts longer 
than 60 seconds.  I don't know how common this _is_, but it _should_ be 
very uncommon since keeping tasks in uninterruptible wait states for 
prolonged periods of time is a bad idea.

In fact, it seems likely that the most common reason for this to happen 
is because of drivers using a timeout value that comes from the device 
itself or from userspace.

> 2. wait_for_completion_interruptible_timeout() reacts to _any_ signal. Do you really want to abort for SIGIO or SIGWINCH right after urb submission?

No; this was merely a simplistic first stab at a solution.

> 3. The error handling is broken. You cannot tell a true timeout and a 
> signal apart.

Correct.  But considering that the caller isn't expecting to be 
interrupted anyway, this doesn't matter.  A failure is a failure, no 
matter what the cause.

> It seems to me that really want a clean API introducing usb_X_message_killable()

Well, the original thought was that anyone needing to send a message 
interruptibly would program it themselves.  That's what the comment at 
the start of the routine says now.

Would it be more acceptable simply to reject outright any calls with a 
timeout longer than 60 seconds?  Perhaps along with a new API as you 
suggest (although I'm not sure that it's really needed)?

Alan Stern

