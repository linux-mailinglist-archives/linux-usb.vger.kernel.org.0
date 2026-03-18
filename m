Return-Path: <linux-usb+bounces-35072-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFpaI1bsuml0dAIAu9opvQ
	(envelope-from <linux-usb+bounces-35072-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 19:17:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ECB2C11B5
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 19:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 851FC3141BF6
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 17:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243553559FB;
	Wed, 18 Mar 2026 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MUWrAflE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E52F363F
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855991; cv=none; b=OBKs1OmiJ4l7du/V5twm1Z/daju5sY54XdUCu6F71wpQB80m7cSl1CRS+8riYP54xl4n0Q589q4oOHjTNBDLmJ2PmcrtJGisdd8eap+lxRUdYu20Bmhw13XSfSsV5rV84JoW/xDfu41LkNdL+5/6uJk4iHsT9z5XnyJu2Zz0jC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855991; c=relaxed/simple;
	bh=jFk9YqeD1S70mBny4cIAljApJfrc3KntDZXKsb3h+eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2YsyaT0yKw0nvVoP2H6SGAd3BEPSDAQ1P1a7S6/OqXL8ycQxJiPaBN7C2cFllSSSKuMQLG5iYVm4QopsNtutcVSXN7MNPeFKckBZi16M930PORDnEWrVoLYrR4Mxt2iyXsWAJz7AUXCgyZfTaH9CmTQmGbw5/BXrTB0zegEstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MUWrAflE; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-89a0ece9f14so2448376d6.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 10:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773855989; x=1774460789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JAjScy7Wz9kdem0S7iY2biSjJZ2aUgq9oZ8WECwxKlg=;
        b=MUWrAflEUbXFeqJTJ31JVPlO8C3ADc2JSbQracgAf8U0WdYZte0l5IDNcwUupC3v9Q
         S423rTWOi4BUWNmFpoKLmo/oYExOdAPQiyB2IQcOuUoIoyiDZLoy7A4Ax/F5z1jaqwPx
         +CsOBwjFSe2cEZd7wTLS0L5oEuBYVmJ/t68cj+9bFUCIXH6Ty16nZvT1O3dCQU22cGWt
         iQcxmR103go47ZJEUKrJYqNqYub2kCkYGsnBB5E4xVoIr8QkdoyhiG+/kQ+Qw3It6qVE
         ig+QfA0+eSbXGeLt7asUR9kswC/RNiEtJDnpeq/xM/tKemSQpmw7R3UkqYENJ2jcSa1p
         zUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855989; x=1774460789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAjScy7Wz9kdem0S7iY2biSjJZ2aUgq9oZ8WECwxKlg=;
        b=s5toLPTiPaEU1G63cHQkXlc5WlfA3rzYcBDawki19QWqf2X/5gN1P3IYDtT+BOVMnQ
         qrocbeSyFxK2zUqg2LVNWQJKeQVFUreRZrvFDVfgslWWw1wauSaZgusfr2YgNfnElROl
         sKeSdmsXcF6hy8wd47A9kk6IcGfi8Deq+QehPTyquSIjAUSeBcwvwlEOEUuv+46fyIAm
         CO4uS9wDjJVSrUSQybVj0onYdMIzdo1w0fzXe8C72pajwNtiOXTHNiV0y7xI1wsMHWvY
         +XL2pR21wqLKeE5QP8rxfC/tlELHk5l8nIUUP/yhDgGuz4hZh3WmzfMV83HvzigFVxbD
         Etgw==
X-Forwarded-Encrypted: i=1; AJvYcCVEK/QQ1ZGvglFwcKx85CC0GOYh985USPBnfnj9dS9LFay9MgMu8f/RXNSJ4cPMkEnh2818o/vWNpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4HyG3wjt7Yy7V86SbUH1d2APraqaNE8SFlrUqOumvD3OEAhkd
	owQ1sOATsEQnWdzAHzXVB/qKTk2VxVH9mmeVTyZ3xC7K60JnmjumoknEpjV5mHWCyg==
X-Gm-Gg: ATEYQzwpVkauLfRfNJxxdaSKZEM+Hp551ns8DOKaRvs18cgYlz61mJ29OsZ7IAWxGJa
	Yp8FmK+FRWM9I9eXra6/Oc4kXWQiw5EIOBFVo+Q3o18/5QF5NYGr/GdTe5hPOzViUGQcyfGufuX
	zWB2OzXHIh+Fz0kY96XThkDyoSOAaZIpzxFywrF/iLkEYwpuhjDxH7lSNo+MuZJA+NRA8zTHxRL
	QGTEUHj5pjIe4xddgkTw9a9wHm9HowxzDtOt2+jDBf64CZ7XMitWGERg1ihimdcto4swuQm4Ons
	f8bn/WUSEIzWT6wmTNIE1GcM3qMJZgTFFtVZOTOIEpHIVvo1Rkiu0TTAafy4zsAA8lG6mXMm0jn
	IXhDxrP6PFNuNrKPwiDXpsbdtmZQEO1Ad8mrDYuGtUK4k9c/un56QxpY3IUroMjqZ0Jz49630iJ
	Vg5vwd0vif1S/UdHWRpEgr8oojUl2OsLFOQ+0ysjydBZMUpBVEFl6mBYHccJzxSTvH811IjJSEX
	+VohikgVBEXYCbrXtEC
X-Received: by 2002:a05:6214:19c9:b0:899:fd62:509f with SMTP id 6a1803df08f44-89c6b5bb844mr67105146d6.56.1773855989128;
        Wed, 18 Mar 2026 10:46:29 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c6ba02fb4sm24810746d6.46.2026.03.18.10.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:46:28 -0700 (PDT)
Date: Wed, 18 Mar 2026 13:46:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
References: <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
 <3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
 <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
 <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
 <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-35072-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.959];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: E3ECB2C11B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:54:20AM +0100, Oliver Neukum wrote:
> On 17.03.26 19:03, Alan Stern wrote:
> > On Tue, Mar 17, 2026 at 05:20:37PM +0100, Oliver Neukum wrote:
> 
> > You know, with a USB-2 host controller, transaction errors don't make an
> > endpoint unusable, and clear-halt isn't necessary.  I wonder if xhci-hcd
> > couldn't be adjusted to behave the same way (issuing its own clear-halt
> > internally, if that is needed).  That would make things simpler.
> 
> It could be. But do you want a HCD to generate requests to endpoint 0
> on its own without coordination with usbcore or drivers bound to interfaces
> of the device?

Michal should be the person to answer these questions.  I guess that a 
clear-halt is necessary for synchronizing an xHCI host controller with 
the device's endpoint after an error, but I don't really know.  Maybe 
it's necessary only for USB-3 devices?

> It would be an elegant solution, but I think it would bite us into our
> posterior. E.g. what do we do if a reset is requested or somebody
> wants to suspend the device or change the configuration or a setting?

A core library routine would face the same problems.

> > Another possibility is to change usbcore to automatically unlink all
> > the endpoint's pending URBs as soon as a transaction error occurs.  Then
> > drivers wouldn't have to worry about it.  But even then, drivers would
> > need to know how to react when it happened.
> 
> Yes. That looks more plausible.
> 
> > Reset isn't always the next step.  In some cases the driver should just
> > give up.  For instance, if the device has been unplugged.
> 
> Then we do not care. Signalling and detecting an unplug is not a driver's
> task. A driver should leave enough time for that detection to happen, but
> if usbcore does not eventually tell us that a device is gone, we need
> to treat errors as genuine.

I get your point.  Think of it this way: How long should error recovery 
persist?  Let's say you retry, with increasing delays, for 500 ms and 
then you do a reset.  If you still can't communicate with the endpoint 
after that, there's really nothing else you can do.  It's time to give 
up -- take the device offline, so to speak.

> > > In principle we know how a reset is handled, don't we?
> > > Again, we cannot know whether a driver is the first, let alone only, driver
> > > to request error handling.
> > > If we decide to reset there is no point in clearing a halt and resubmitting
> > > URBs would be wrong.
> > 
> > In practice, does resetting ever help?  With usb-storage and uas, yes,
> > occasionally.  But those are unusual drivers; what about all the other
> > ones?
> 
> They don't even try. UAS, storage and usbhid are the only drivers with
> a full error handling. usbnet has vestiges. That is about it. Others
> may try to clear a spurious halt and that's it.
> 
> Generically speaking, short of giving up, what is the generic alternative?
> As far as other examples are concerned, isn't this scheme quite close
> to what SCSI does in terms of algorithm?

It's similar.  usb-storage doesn't retry sending packets; when a 
communication error occurs it immediately does a reset and relies on the 
SCSI layer to handle retrying the higher-level command.

I'm just wondering how helpful resets will be in general.  I suspect not 
very much.

> > > How else would you handle errors of this kind. It seems to me that we
> > > need to make the delays and number of retries tunable, but other than that
> > > what can you do generically?
> > 
> > You're right that those are the only things to be done.  The question is
> > whether they can be done in a way that will be easy for all drivers to
> > adopt.
> 
> Provide defaults, again best be copied from usbhid.
> 
> > Consider that while error recovery is in progress, the rest of the
> > driver has to remain essentially dormant because the endpoint cannot be
> > used.  I don't think many drivers are written to support such an
> > operating mode.
> 
> Isn't that exactly what you have to do after pre_reset() and suspend()?
> Nor do you have to use this facility, do you?

No.  But the alternative is to give up right away.

It sounds like we're saying that a library routine would have to:

	Start a thread for handling the recovery.  In the thread:

	Call the driver's pre_reset handler.

	Unlink all URBs queued for the endpoint.

	Issue clear-halt (if needed).

	Call the driver's post_reset handler.

It's not obvious where a retry counter, increasing time delay, and 
eventual reset would fit into this scheme.

Alan Stern

