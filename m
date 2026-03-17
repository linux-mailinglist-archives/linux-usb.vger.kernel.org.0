Return-Path: <linux-usb+bounces-34963-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP1vNoyXuWkJKwIAu9opvQ
	(envelope-from <linux-usb+bounces-34963-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:03:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4408D2B087F
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CA17301C13E
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 18:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50F937D10E;
	Tue, 17 Mar 2026 18:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RQrNQP7h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340542D0C72
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 18:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770629; cv=none; b=SW3DQHNrCs21dTUUpDfEeziG3mo8fHTnupGTmb16Vfd8VlynmsDbxkwQdTUp0BYVaMnA5/RfLbXWQMnPSuEvgje62Q8kjk2qnIK8YL2rctAtzoShUxEqkdFglL6DLgRLaEpo1oLjNX9wOqhuF0fBZqnZj82EUG7Kc6sPcf/ea7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770629; c=relaxed/simple;
	bh=4daLZFcBEvytYTTiRkP6Pk6I2vJV111wL0823RlSFm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=st1FTAbDU9Cw6gVtesx1y6tFm2AuYjo55gHTIdruO536JMyEboQuxSUSWtGMsvoEAAiilruPfUFTyBBu3SPx/BJPrVVagUNp9jaJlCRRe8PvtJJfjR2C7q4QaVrkRT3iqGxCVWdhZnegvHchkeqoxNpLuAtqvamADnZAdHQDkKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RQrNQP7h; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-950d235b500so773882241.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 11:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773770627; x=1774375427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ruMgQJj2J1L7blZ/0i0FPqIRVHd5OUJfIsy+yiawL3s=;
        b=RQrNQP7hfgrhIQ3jOqkE1HOBTcSfUx4iscn3HLySfvE5H9BHfFUPnlV1oPpQoEeN7i
         iY4aQq0ZgJTGcpbLExCi++VPNauh59tq22Kbn4L+9GteRYiAfDhFjmWPvwpN1SgiNzRO
         VyM9AAB72CNGyjqjIyPVdOIPth210B6MZ4bB+yGrv2c7T1DfiTQlUTPH5nQMCOmOaeCM
         ntq4FN+NT2yYz3H6QU81rcXJDxPeJ7SwbdVzcIdIeqrLLQ/tZiPuZL0hCCLkJBcUbcaq
         YrdHcMnndCPJaosCI852u7oclm+c9GHRzZiDuM1kS1jMrJw6QXSt1EBQP3UsTde66pR4
         xuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770627; x=1774375427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruMgQJj2J1L7blZ/0i0FPqIRVHd5OUJfIsy+yiawL3s=;
        b=bU7nzmUp7hIZJAVpL65f2ID0bKJkdUVFZaT1YSG1Lq4mJQDvx8zM4nDgzniWw/jHlb
         DRXe7BJrPeDr4qAPcd3lHlIT2rSSxAX/DBzW0i8sd1q399jmaGIY+wU6/35XroUxm8vq
         AZpifVDN4S+Y01k9lVKMaCBGKqoQNrRSDb2Vi55y/fl0mBlzfLzfpf7R85rGwNmgXiIg
         Qxx947dQFhIDQ+iSrWhQfkCfQh1AuZdnkwV4PNzN71O8vYGoRer7wrGxc2dX3MLuvVCq
         VhPcVdpP3Si3f4AzHL6HsydI78d70b4xa2vJ9qhBa5NEdDZPuk5MGGhJdeFjHqoq11/j
         EKYw==
X-Forwarded-Encrypted: i=1; AJvYcCV9B2Jf+IwOcGpP+v1rU0YsI0pZULOQaXdXE3Rud0fOAziC4rPWCB/JRCEzgOsXusgBY7BbXF+Njpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxvTlkomtqY8DjYxm70u6wyd/iP4mhlAbTA+zF+Rk3dzH9RHkr
	JBYOVZgbwsBb5OSFvH4fn8/WHYWZhlvG9Vau4VWfPkEdS4yykfIGOjavJLG0sB2lGw==
X-Gm-Gg: ATEYQzwFHJfsb2cp0NoQuefPLE9sXgpZ5RSZu3nImakAx2Of+pkFwq15e8A7An2KZXS
	n9rro75HcgdsnYcGIxIhfEwfpPPiFTM/LEYJW3jnbRGCCrrECQcCpxz9mHJQjR3PQUNAGyqdvJ/
	ClG1PAAH/9wwHRTQeISuxhVCHtuEtxe6FGe8cEZSmqv0TiVbMxUS3QTd9Vxd1qUwHkk4JXT4BQq
	rtGIL6kPSKtZeLmVxAADfEUZtFmhMJFuOKNcyj8/g1EV+qWt1A4ulCGT3/h8PPJh0XTHhl0FR9Z
	/e6B6nmBytgLgLu3D8TVha+KNp1fgJ+w0omlT6xQ11snCaKXtruS4S31HcIDv4+DxPV8F9p0+DU
	h/JxcUK40fYu6gGRZrAgHD1Nw4+/x1vniLorD1j10MsE4L0aY8H6WNMDwpK4EAhfp3Yqk2WszKx
	/fFVYjC9KqFRWv0xFLEIH5s8kb
X-Received: by 2002:a05:6102:2ad5:b0:5ff:f9d9:ce73 with SMTP id ada2fe7eead31-6027d0a660cmr376903137.5.1773770627050;
        Tue, 17 Mar 2026 11:03:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c6b90d2b4sm3202106d6.19.2026.03.17.11.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:03:46 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:03:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
References: <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
 <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
 <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
 <3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
 <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
 <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
 <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a692e2-559a-4765-8321-a422751d3589@suse.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-34963-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 4408D2B087F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 05:20:37PM +0100, Oliver Neukum wrote:
> 
> 
> On 17.03.26 15:31, Alan Stern wrote:
> > Following the clear-halt, the URBs need to be resubmitted.  Should this
> > be done by the driver or by the library routine?
> 
> My preference would be by the driver, because it is not clear whether
> simply repeating the IO is the action the driver wants to take. The IO
> may have become obsolete for example.
> Yet the endpoint must be made usable again.

You know, with a USB-2 host controller, transaction errors don't make an 
endpoint unusable, and clear-halt isn't necessary.  I wonder if xhci-hcd 
couldn't be adjusted to behave the same way (issuing its own clear-halt 
internally, if that is needed).  That would make things simpler.

Another possibility is to change usbcore to automatically unlink all 
the endpoint's pending URBs as soon as a transaction error occurs.  Then 
drivers wouldn't have to worry about it.  But even then, drivers would 
need to know how to react when it happened.

> > When the library finishes its work, it needs to tell the driver either
> > to start running again or to give up.  Presumably by means of some
> > callback.
> 
> Yes, but we cannot assume that a full device reset is always the next
> stage. Nor, and that really hurts, can we assume that only a single driver
> of the device is involved.

Reset isn't always the next step.  In some cases the driver should just 
give up.  For instance, if the device has been unplugged.

> > How will the library keep track of recent error recovery attempts?  It
> > needs to know when to stop doing clear-halts & retries and instead issue
> > a reset.  How will this reset interact with the driver's recovery
> > mechanism?
> 
> In principle we know how a reset is handled, don't we?
> Again, we cannot know whether a driver is the first, let alone only, driver
> to request error handling.
> If we decide to reset there is no point in clearing a halt and resubmitting
> URBs would be wrong.

In practice, does resetting ever help?  With usb-storage and uas, yes, 
occasionally.  But those are unusual drivers; what about all the other 
ones?

> > It's a good deal of reasonably complex code, which should not be copied
> > to every other USB driver.  While the approach is sound, the problem is
> > finding a reasonable way to implement it.
> 
> How else would you handle errors of this kind. It seems to me that we
> need to make the delays and number of retries tunable, but other than that
> what can you do generically?

You're right that those are the only things to be done.  The question is 
whether they can be done in a way that will be easy for all drivers to 
adopt.

Consider that while error recovery is in progress, the rest of the 
driver has to remain essentially dormant because the endpoint cannot be 
used.  I don't think many drivers are written to support such an 
operating mode.

Alan Stern

