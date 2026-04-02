Return-Path: <linux-usb+bounces-35824-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGe3OkDWzWn1iAYAu9opvQ
	(envelope-from <linux-usb+bounces-35824-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 04:36:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFCF382BD3
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 04:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28D173018BE7
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 02:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0FD33F5AC;
	Thu,  2 Apr 2026 02:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Y3IvUMwY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7159F33A007
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 02:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097404; cv=none; b=p9AUGTxEGzEf/OnFMlpS6cFb6tXwJf5dkOfrqcigg4FCEi7ZXvKiTV7PddmxXpfwcrrgk3IkOgEalhz/RcymjDdmO/tfz4B+ZT+zauGbMrAE851tu32OLJbzBch1A3/OluecUupugafzCG2/2O1WolZfiuMWI/w221Q92oGfycs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097404; c=relaxed/simple;
	bh=ODN3RJxk31iUMbX79bmdmdrqI49BG/oWT4mOqFUmp00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMFA+Nin7MrKEPQ2lVsoRO/S9NmPuT70RCP5LfhFtMNpfb0NifXfTJqKDlch3dFFgKDaRd1EyVAV/cyn7Yc5lUMgR1WxmBfGQOg6z8q3jtNL7+mYl1MojrcdUejdza+Y1i3eBCe9tuvwexIyqTltZGMrdF1h9nE2PvH4u8eNXGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Y3IvUMwY; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-506aa685d62so2421131cf.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 19:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775097400; x=1775702200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=09n3eG3nnlzetJLX+hnt+PeTjLc63bDJmetbWxNIGlM=;
        b=Y3IvUMwYr1tBMXDr0KuRnp5TitT2zIr7/nWdXKNwpbZLsCENMdN+0RxNfLjHdLtefB
         ei8OJ5lw6HNe9qrV3R52JiyglYrigd2IUIzPz2uG8tlBgE5odCxgsqK9lkXNfzWZYnUP
         O8L8jz/BPhhQdjMqKi/71BrBE/8j0dzXExw+9fjIx3QRYguRHZ4oxF9Sa0GT0xDFTlvf
         WcK6ZVOQ5L/3/JlZNBdQchI6+m0Wkabcgqe59rJxES+DTe+mdTK+LnfL6QgtU206NEVr
         8c7nJNUXhcyO6PmSDK7JiAF0YNOU+hbcvG6EMNNLwa3PfYefVAck2XQ7rlUrg/4pCw/w
         bvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775097400; x=1775702200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09n3eG3nnlzetJLX+hnt+PeTjLc63bDJmetbWxNIGlM=;
        b=N4u7vSsmMKsbDOBT/fuFK1M9W9o/PnuICIH3LYDVvWBvV3d1Jr+wvPTq6Xc+XZ7/b2
         9KA9P/mUQ+U7L165VeVut+wWqJZgDWr2xDXDp7g6RjJf9LV5mEqXgwsfMC22PGwmYqUf
         wFt6vYeEjgAcwNhrNEjvMj+fY5GYvHY3mPmJqFwXrl6umu/HEYmOUgRbYL1uNGnmjfXG
         FzX4TBcOvIuKb6FMblxXExtMB1JTZcrLg7B+ETQk8F/0afTcSXtP51Yfj9gUqFlCWj9J
         tIO2c5siAN26yXozByneCaNff1YlAniGUM/fdVZigy8nGFhjfGGm7JxBY2k6Xcr6llUk
         chFw==
X-Forwarded-Encrypted: i=1; AJvYcCV31fgmfxHHLQPdQrZoDCFR0zvUpzxJxlGRsOQNnY6bq5IWSBgS5hANudx8yb0ITRDJitN0COMOekE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5gRmKAZUG69K7pm3Yti1vF4Ls1oZOd/C0Sj251zBbclUAYJ+G
	t3zG4CbCa41ijE63IzErUSzHf0HPDHlfHDWwoyyb7FNYZrIVRCAPsIl0kHMs+sm3XQ==
X-Gm-Gg: ATEYQzzmoknXuOjOYofmz3zVsmONVGDav6WRxV0VERIYEyRy1XGh2BhJ27rxIj9NJ0S
	1IaH3oOY0dbOmX+wnlfONJQHCqtNYndK9dzColsQqIcnF91mpdDerg/lHVuBlXnpv65weP4ufbm
	l9hsa1sUzHBr/f/V0aANCtWIqNky47Ey9+qCi/OSLNmyaiTnwijj+IQZlZMAw7q2ucpc2Haawgi
	26Ik+JTOgyTsUSoYnuhKEBnWHHJsAl/IUJeyGKHlxonYCdgMrwar015tQV7JMb5Kr8m0If3srNx
	WVSg/UmZwi9Ryf7QzoZvnj/q7Vz5RfuBG+5VFZxOn8p3uQplH+Y1vSu9nWMCd6Ts5oPXuKX5P6C
	A0m0TWWW1re3/L86TtTF2m0RLoI0hDn3YGfgCC3xZ5VVZXH35Jv5+CRVENHlbjltgzCLvxTVukC
	qzETTv9ZJMhobX33HhFlV3I3vL
X-Received: by 2002:ac8:584b:0:b0:50b:4051:2cab with SMTP id d75a77b69052e-50d3bd93571mr71898531cf.58.1775097400093;
        Wed, 01 Apr 2026 19:36:40 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d502df89dsm4149921cf.12.2026.04.01.19.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:36:39 -0700 (PDT)
Date: Wed, 1 Apr 2026 22:36:36 -0400
From: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"michal.pecio@gmail.com" <michal.pecio@gmail.com>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
References: <20260325015110.v4r5smfvdd62fcua@synopsys.com>
 <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
 <20260326011910.t7ijezht7g7ttrec@synopsys.com>
 <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
 <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
 <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
 <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
 <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
 <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35824-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[harvard.edu:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 4EFCF382BD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 01:08:31AM +0300, Mathias Nyman wrote:
> On 3/31/26 18:31, stern@rowland.harvard.edu wrote:
> > 
> > How about this instead?  We add a "halted" flag to the usb_host_endpoint
> > structure, and the core will set this flag whenever a bulk or interrupt
> > URB gets a status other than 0 (before putting the URB on the bh list).
> > If an URB has one of these statuses, when its completion handler returns
> > the core will unlink all the URBs queued to the same endpoint.  Finally,
> > the "halted" flag should be cleared after a completion handler returns
> > if there are no more unlinked URBs still in the queue or URBs waiting on
> > the bh list to be given back.
> > 
> > The result of this is that any URB remaining in the queue when the flag
> > is cleared must have been submitted by the class driver _after_ the
> > failing URB's completion handler has run.  We can assume the class
> > driver knows what it's doing in this case.
> > 
> > The endpoint queue shouldn't be restarted until the "halted" flag is
> > cleared.  Either right away, if there are any URBs in the queue, or not
> > until the next URB is submitted.  Doing this might require a new HCD
> > callback.  (It would also mean the kerneldoc for usb_unlink_urb() would
> > need to be updated, because the endpoint might restart before all the
> > completion handlers for the unlinked URBs have run.)
> > 
> > What I'm trying to do here is come up with a single, consistent proposal
> > for exactly when halted endpoint queues should restart.  Maybe someone
> > else has a better suggestion.
> 
> Sounds like a possible solution to me.
> 
> Just to clarify, core should unlink the remaining URBs queued to that endpoint
> after setting the "halted" flag, but before URB completion is called.

Above I wrote that the remaining URBs should be unlinked _after_ the 
completion handler is called.  If we did the unlinks before then the 
class driver might submit a new URB after the unlinks were finished and 
before the completion handler learned about the transaction error, and 
this new URB then wouldn't get unlinked.

It's a race between completion of one URB and submission of another.

> "Halted" flag should be cleared after URB completion returns, and endpoint
> should be restarted if there are any pending URBs.

To be clear, the flag should be cleared after the completion handlers 
for _all_ the unlinked URBs (as well as the URB getting the original 
error) have returned.

> This allows the class driver URB completion handler to re-queue the halted URB
> without core unlinking it.

The completion handler shouldn't do this, because it would mean 
resubmitting without doing a clear-halt first.  (Completion handlers 
can't do clear-halts because they run in atomic context.)  If it does 
try to do this anyway, I see nothing wrong with the core unlinking the 
resubmitted URB.

(Are you going to ask about verification tests that set the endpoint's 
Halt feature, submit an URB, wait for it to fail with -EPIPE, and then 
submit another URB from within the completion handler?  :-) )

> > > > Here's a troubling consequence for people to consider: Suppose an
> > > > endpoint queue stops with -EPROTO or -EPIPE, and before the class driver
> > > > gets around to calling usb_clear_halt(), it is unbound.  What happens
> > > > the next time a driver binds to the device and tries to use the
> > > > endpoint?
> > > 
> > > The disable/enable interface and set config calls during unbind/bind should,
> > > if I remember correctly flush pending URBs and drop and re-add the endpoint,
> > > clearing the xhci side halt and reset toggle.
> > 
> > usb_probe_interface() doesn't do any of that stuff, other than a
> > deferred switch to altsetting 0 if needed.
> > 
> > usb_unbind_interface() does call usb_enable_interface() if the interface
> > is already in altsetting 0, but the reset_ep argument is false so the
> > endpoint state doesn't get affected.  Should that be changed?
> 
> Looks like this needs more attention. Interface driver unbind/bind with
> halted endpoint could be an issue. I don't have an answer right now.

We can ponder it...

Alan Stern

