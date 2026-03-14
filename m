Return-Path: <linux-usb+bounces-34778-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id c06jLFXKtGnqswAAu9opvQ
	(envelope-from <linux-usb+bounces-34778-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 03:39:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0073128B6E3
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 03:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA7203049450
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 02:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4682C11C6;
	Sat, 14 Mar 2026 02:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HNvlh03P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4931EA7CE
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 02:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773455952; cv=none; b=SgOH+LhPUq0xcxvndDQIHZ0WynuwrRGlGgUJPasyxBUScrJ2q7q3VxGk0Dr22qheyhGKLfvFHGCM0LI9+/UmNy9gvrJmWctuoxiOHg+9/sK3lmNLs1u/M2N7Vq01aPRm4Cr3wqRpD/aDJlY14OniVbQ3K8XTX7dLc0W0Dzh6rJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773455952; c=relaxed/simple;
	bh=iAFwW0+Dqe5WDWO/St9XPZhC3WybGrnythe/TIQUs9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwkkW9EomRINsLAPndpOMclWk5Jt3+GpX4Ag0enrAnvAcGGCgPXy4lAuv/xqMWrr5PMPXPERyy6LLSK1EiF/3PIieCNsZWFMaH1mOvuPOjDZzbkvUEuS3RwIGmcAZO3gnf96BqC5PCStL45ulJyn5rt7OSQmvswOgysKLDFT5v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HNvlh03P; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-899e43ae2e1so23079866d6.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 19:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773455950; x=1774060750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3bJkKTDd6EcfFvOioQe6tJ3V9zVThg/LnBtoWdSKalM=;
        b=HNvlh03PL7wK2GAAw+uFdxDbCowmAKyUKIFQl+RbnjmnyqOT04Vs7hNt2apnx3Q9Sh
         y5/EHZxYPcKjx2CQpi9Dpy6cilo056IuTAcYuyn8PUO+dclK0AKza0lrvwmSkYMTufVd
         JT4aF6QDUyyzQgOuxkJyxEpAgZNbZUPD34nznIoyR+B+a/rtK7fCGJr1e4HdGdOoMB9q
         6xm/V8z+kvXN7Gl/RdSfBa4DcKjxvwlWDA4JFQ5OF5HIMrmTnK2Sh3/SwgGBcZr9QxAs
         b1BMqpMJOZE7mjP428UeOpX2dbkBrT8rcxCsX0NhMe/HWBbMyAyDCMvYBOipbMnNBtud
         3jcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773455950; x=1774060750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bJkKTDd6EcfFvOioQe6tJ3V9zVThg/LnBtoWdSKalM=;
        b=V40/dp497avVQXpBrxyCH8gMqSxY7XLO7DxQVSWTwe5dw7yCEVPiGIqzzjFGTY4Xng
         oWE+CDdpghLFc5fqGrYzgj/KROMcPswRUD8NBKT6f6PLywEy8mG9bKs/JBfj2BHqwfET
         sU+MaC3aGnChWtaxb6uB6EsBlBDk1ezqtYbYTaab4JjyBrLY8Tr7rWY/FbpKsFpVpZ9y
         LLjd+DlOiOdnBYEM9Wgt3jn7sZGTq2yTLd/QmA49WJDuZ+zMgPjZaqSJnoBxG93sXkri
         JBTDooIh64m1e38tvq4o/Mijv20E1AnatmsRrZ0BC8tCZ+7b1NMctLkYxB5lPLQrNh7Y
         ylcg==
X-Forwarded-Encrypted: i=1; AJvYcCVReU8Fk4pCyAzo4p2KCagFB9ZzwM+Jze9MWhsf+7CfBVWTAluMVU9Z++iIA1ui/BaGGjcu+ZlX1pA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6t+8T9Cq7RXxvlmnqlssNdBOfI5bdY7fT122ble8AtewbVNgZ
	XljWG4mAqv/x29z3M639fY6Ov6hJCvfsAz03yznOM78ctMJfLdkalr0/Mfhc6FRRfw==
X-Gm-Gg: ATEYQzz7pyPbPoYflfS9xjUQ7bTz+O+ukSGzpVUICqMTwCI8QJaBZ9B/5HX+gIFurHQ
	P/vuxyUo2ys7UnMimbCemr2rwKBfAF5XH0+uZ9bQwa2JP3O4Nko51pSjK+KJmqpERzcs5jLtjUT
	BH7aO6cjPTSwdnZ1qAX5n4RipuWUxp2W+tudTBdP0yVU85kuS+kGdQLqbfPozUjI7BYIhQz3Oha
	/ctcAELI8GV66ZggMkYVrxs1z3etTEvt98oW1erWTcD5oWX0KLQfSVO4/nAj3pTZ5aiiRqAtLmi
	vXLAw4DJzveW1+LerV7spv/ZAvL6yzjUggcRUlFBjdFFsr0p6Y56OcwGN7A4RkYmaOH+2MBVhJM
	nRm9czSwVf6bVE95qUYG+gOJC+i5+Hm3OS/4RsxpTDdJZBHtppw+9wrN+wzcRKlfD4lf9NfkEOI
	7fJl4Q7kcHQHUOilqUh7F0C1uo
X-Received: by 2002:ad4:5769:0:b0:899:f691:fd3a with SMTP id 6a1803df08f44-89a81d87083mr82232456d6.27.1773455949534;
        Fri, 13 Mar 2026 19:39:09 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb4b3sm70313456d6.14.2026.03.13.19.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 19:39:08 -0700 (PDT)
Date: Fri, 13 Mar 2026 22:39:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Oliver Neukum <oneukum@suse.com>, Michal Pecio <michal.pecio@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
References: <261996a8-7ad4-4df2-a469-f6602da71255@suse.com>
 <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
 <64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
 <20260313085354.71a6dbf1.michal.pecio@gmail.com>
 <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
 <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
 <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-34778-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 0073128B6E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 10:45:32PM +0000, Thinh Nguyen wrote:
> On Fri, Mar 13, 2026, Alan Stern wrote:
> > On Fri, Mar 13, 2026 at 11:33:48AM +0100, Oliver Neukum wrote:
> > > On 13.03.26 08:53, Michal Pecio wrote:
> > > 
> > > There are also these pesky software systems where a perpetual immediate
> > > retry causes a livelock.
> > 
> > Yes, we need to avoid this.
> > 
> 
> This can be handled by the class driver (e.g. fall back to port reset
> after 3 retry failures in a row).

Part of what we are discussing is how to carry out a retry.  It seems 
that the most general approach is to unlink all pending URBs for the 
endpoint, wait for them to complete, call usb_clear_halt(), and then 
resubmit everything.

And of course, isochronous transfers are never retried, by definition.

> > I tend to group transaction-level errors like EPROTO into three 
> > categories:
> > 
> > 	1. Device has been unplugged, hub will notify us soon;
> > 
> > 	2. Unrecoverable device problem, needs reset or power cycle;
> > 
> > 	3. Short term problem (cable issue, EMI, system load).
> > 
> > Retrying makes sense for 3 but not for 1 or 2.  Unfortunately we can't 
> > tell which category a particular fault lies in.
> 
> There's no need to distinquish them if we have a proper fallback
> recovery (such as reset/power cycle) should retry failed as noted above. 

Yes.  Still, that's a fair amount of logic to add into every device 
driver.  We should be able to centralize it somehow.

Also, just to make things more difficult, these errors are reported in 
atomic context but the recovery procedure has to happen in process 
context.  Which means there has to be a way to cancel the recovery 
procedure if it's in progress when the driver is unbound.

> Just want to give my 2-cent here: I experimented and have seen Windows
> drivers do retry for MSC (particularly for UASP devices), and it works
> well.
> 
> The retry is not specifically at the failed URB. It's a retry of the
> UASP command where the data block offset is specified, and the entire
> transfer is resent.

Right.  usb-storage and uas rely on the SCSI layer to retry failed 
commands; we don't need to worry about them.

> This will probably not work for application with isoc endpoints where
> timing is critical or application without certain synchronization
> protocol in its transfer header.

Because the host and the device may disagree about whether the last 
transaction was received.  USB-2 would handle this okay if we skip the 
usb_clear_halt() step, but I'm not so sure that xHCI controllers will 
allow it to be skipped.

Alan Stern

