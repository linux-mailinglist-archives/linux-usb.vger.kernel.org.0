Return-Path: <linux-usb+bounces-33186-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMVNL4GxiWndAgUAu9opvQ
	(envelope-from <linux-usb+bounces-33186-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 11:05:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E21A910DF73
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 11:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5FA533002518
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 10:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2703644DD;
	Mon,  9 Feb 2026 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w4Cq2fSH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF002D7DF3
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631548; cv=none; b=IZKmcRuMa0CxlVmcikhTISBpF8MxWl0L0BrXQwEPUzG38I9zg0tT58IMl2AUc53M/qMHAAb/920ieYsGUsXVeGwIeaCAy50JLOqEffJluP3EB0QzHQJWkXDrLBuJZsWzAcZWFfXFTcvDbXWq/Pw9KxNG0USfVcVkNJoW5quYzL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631548; c=relaxed/simple;
	bh=xyc7OcrUrYiLSWRijbk/qIjhuVkUHJxtrnG5f/wCjbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HH8GGbOqu9/UdIgQkkd/AgK4WjceiDjV51srRmMs9tDPdnSE+tHS3xdeyRcKYPFxwK3naj13T2fG47/P8vHqInMf4adcYTLn9vY/ZWc0DdrSzzaGOIIgagESzGdf2GoXR1R0WdQJY4W5i74ZLFYM6hNGk1sClZ08bQdVkuweUos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w4Cq2fSH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D46C116C6;
	Mon,  9 Feb 2026 10:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770631548;
	bh=xyc7OcrUrYiLSWRijbk/qIjhuVkUHJxtrnG5f/wCjbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w4Cq2fSHhZWu13J16UJPApv+QVxP7Qic8liC9JIHqf9l6v7sB+ZvR96DLoO2k7M+i
	 55IhMOEGsYM9YwBqueot5tPdrFFi0P1ivAFZDLm8BVtGOPF9kro4rQPAW29Ouf7YwE
	 w+FesoSJC1xy8qgvAPBa6Dtk4OF1G4rq9E+PV4vU=
Date: Mon, 9 Feb 2026 11:05:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: RFC: Prevent long uninterruptible waits in usbcore
Message-ID: <2026020950-prodigy-steadier-f747@gregkh>
References: <3acfe838-6334-4f6d-be7c-4bb01704b33d@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3acfe838-6334-4f6d-be7c-4bb01704b33d@rowland.harvard.edu>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33186-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: E21A910DF73
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 09:33:02PM -0500, Alan Stern wrote:
> I'm asking for comments on the patch below.  The problem it fixes is 
> that usb_start_wait_urb(), which is used by utility routines like 
> usb_bulk_msg() and usb_control_msg(), can have arbitrarily long 
> uninterruptible waits.  And of course this can trigger the kernel's 
> warning about a hung task.
> 
> Normally this isn't a problem, because drivers calling these routines 
> generally specify timeouts on the order of 10 seconds or less.  In the 
> particular case found by syzbot, however, the usbtmc driver uses a 
> timeout value that it gets from an ioctl with no checking for 
> excessively large numbers (see usbtmc_ioctl_set_timeout()).  We could 
> change this one function, but what about other drivers?  There should be 
> a single policy on how we handle these things.
> 
> Now, I suppose the reason that the usb_start_wait_urb() uses 
> uninterruptible waits is that drivers don't want their calls to be 
> interrupted and aren't prepared for that possibility.  But we also don't 
> want them to tie up a kernel thread in a ridiculously long 
> uninterruptible wait state.
> 
> I thought that a reasonable compromise would be to keep the 
> uninterruptible waits for timeout periods less than 60 seconds (somewhat 
> arbitrary, but hopefully short enough not to trigger the hung-task 
> detector) and make them interruptible if the timeout is longer.  The 
> idea is that long USB timeouts don't normally arise in the kernel, so 
> they are probably caused by a user request (or a bad device), which 
> would mean that interrupting them wouldn't be such a bad thing.
> 
> Any other ideas or thoughts about this?

Having an upper-bound on this is a good idea, and also the usbtmc driver
should also be fixed to just reject extra-long delays in that ioctl as
that's a user-visable way to stall a cpu.

So no objection from me with this patch.

thanks,

greg k-h

