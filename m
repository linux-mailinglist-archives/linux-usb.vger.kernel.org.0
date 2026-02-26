Return-Path: <linux-usb+bounces-33750-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOQqJXR9oGlgkQQAu9opvQ
	(envelope-from <linux-usb+bounces-33750-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 18:05:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 327C51ABB0B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 18:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94A3A326B0E6
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 16:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4E44418D1;
	Thu, 26 Feb 2026 16:37:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mr07.mx01.tldhost.de (mr07.mx01.tldhost.de [62.108.44.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F504418F2
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 16:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.108.44.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123856; cv=none; b=jNlG4lJ4gKQLhgNNrPsIz8PM9Ae7LXT9u4zIRaEIofBjGFNf3lV60XuoTE1lAvTa+/nHtFR+gPy3lyKdZdhDff8c4vCLqWxrvfjfJuu9qtxvz5DoXvDunbrOctQgCdhMEm4rlYa35nqpACjTBD1O/vPbrB1Bd9iaMrLz9kRNOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123856; c=relaxed/simple;
	bh=pQAdIVrwckzR1Ph1GSFoKQGSQvSM/39SquFnz/NnkSo=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type; b=XNmnWeXY2IyeUJep9/hjV5AaNYYB2m/4eZiP6Jzf7KSbkUOSBYoThFOWztOEaEwqE6to6Ztvd4zwpyfeAhTmtDR6JLzImQ6fBOLHQIqaFbF7x0WSXLz1/ylOgVd45U2dOJTlQblmq873wcO8UYmkWmw0vt24IITKH6qttYjpAzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kiener-muenchen.de; spf=pass smtp.mailfrom=tldhost.de; arc=none smtp.client-ip=62.108.44.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kiener-muenchen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tldhost.de
Received: from mx01.tldhost.de (localhost [127.0.0.1])
	by mx01.tldhost.de (Postfix) with ESMTP id E43C4122CBC
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 17:25:53 +0100 (CET)
Received: by mx01.tldhost.de (Postfix, from userid 1001)
	id D515E122B86; Thu, 26 Feb 2026 17:25:53 +0100 (CET)
Received: from server12.tldhost.de (server12.tldhost.de [84.19.26.112])
	by mx01.tldhost.de (Postfix) with ESMTPS id F0C4B122CBC;
	Thu, 26 Feb 2026 17:25:51 +0100 (CET)
Authentication-Results: server12.tldhost.de;
        spf=pass (sender IP is ::1) smtp.mailfrom=guido@kiener-muenchen.de smtp.helo=webmail.kiener-muenchen.de
Received-SPF: pass (server12.tldhost.de: connection is authenticated)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 26 Feb 2026 17:25:51 +0100
From: guido@kiener-muenchen.de
To: Alan Stern <stern@rowland.harvard.edu>, Greg KH
 <gregkh@linuxfoundation.org>, oneukum@suse.com
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: RE: [Newsletter] [PATCH v3 2/3] USB: usbtmc: Use
 usb_bulk_msg_killable() with user-specified timeouts
Message-ID: <35723ad6dbc4a44df0a7dfa014e72d7f@kiener-muenchen.de>
X-Sender: guido@kiener-muenchen.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <177212315181.3858985.10700307176605420388@server12.tldhost.de>
X-PPP-Vhost: kiener-muenchen.de
X-POWERED-BY: TLDHost.de - AV:CLEAN SPAM:OK
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FAKE_REPLY(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33750-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[kiener-muenchen.de];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guido@kiener-muenchen.de,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 327C51ABB0B
X-Rspamd-Action: no action

> -----Original Message-----
> Subject: [Newsletter] [PATCH v3 2/3] USB: usbtmc: Use
> usb_bulk_msg_killable() with user-specified timeouts
> 
> The usbtmc driver accepts timeout values specified by the user in an 
> ioctl
> command, and uses these timeouts for some usb_bulk_msg() calls.
> Since the user can specify arbitrarily long timeouts and
> usb_bulk_msg() uses unkillable waits, call usb_bulk_msg_killable() 
> instead to avoid
> the possibility of the user hanging a kernel thread indefinitely.
> 
> 
> ---
> 
> v1: Reject ioctls trying to set the timeout to a value larger than
> the maximum.
> 
> v2: Don't reject overly large timeout values. Instead call
> usb_bulk_msg_killable() rather than usb_bulk_msg().
> 
> v3: Add the revision log that was left out of v2.
> 
> drivers/usb/class/usbtmc.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Index: usb-devel/drivers/usb/class/usbtmc.c
> ===============================================================
> ====
> --- usb-devel.orig/drivers/usb/class/usbtmc.c
> +++ usb-devel/drivers/usb/class/usbtmc.c
> @@ -727,7 +727,7 @@ static int usbtmc488_ioctl_trigger(struc
> buffer[1] = data->bTag;
> buffer[2] = ~data->bTag;
> 
> - retval = usb_bulk_msg(data->usb_dev,
> + retval = usb_bulk_msg_killable(data->usb_dev,
> usb_sndbulkpipe(data->usb_dev,
> data->bulk_out),
> buffer, USBTMC_HEADER_SIZE,
> @@ -1347,7 +1347,7 @@ static int send_request_dev_dep_msg_in(s
> buffer[11] = 0; /* Reserved */
> 
> /* Send bulk URB */
> - retval = usb_bulk_msg(data->usb_dev,
> + retval = usb_bulk_msg_killable(data->usb_dev,
> usb_sndbulkpipe(data->usb_dev,
> data->bulk_out),
> buffer, USBTMC_HEADER_SIZE,
> @@ -1419,7 +1419,7 @@ static ssize_t usbtmc_read(struct file *
> actual = 0;
> 
> /* Send bulk URB */
> - retval = usb_bulk_msg(data->usb_dev,
> + retval = usb_bulk_msg_killable(data->usb_dev,
> usb_rcvbulkpipe(data->usb_dev,
> data->bulk_in),
> buffer, bufsize, &actual,

Sorry, when you get this mail twice (HTML problem with my mail client).
It's indeed a problem that an application can block a thread for a very 
long time. Typically, an application should be able to be terminated 
within a few seconds. I assume this is now possible with 
usb_bulk_msg_killable().
Also, when a USB connection is closed, any current I/O operation should 
be completed. The function usbtmc488_ioctl_wait_srq() illustrates this 
issue; it is terminated when usbtmc_flush() is invoked from a separate 
thread.
Dave Penkler and I will investigate the timeout problem and find a 
solution to replace the longterm blocking usb_bulk_msg().

Guido

