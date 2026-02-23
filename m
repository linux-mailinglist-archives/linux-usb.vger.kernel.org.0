Return-Path: <linux-usb+bounces-33563-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IYuG/JanGlHEwQAu9opvQ
	(envelope-from <linux-usb+bounces-33563-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 14:49:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D68D317748C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 14:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43C0F305A2E6
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 13:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2016924DD15;
	Mon, 23 Feb 2026 13:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LocSTY//"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C408202C5C;
	Mon, 23 Feb 2026 13:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854481; cv=none; b=FCkcH1SLPIvZo7bKqJYAYvzuthhYBcLVCuFCwYt+0ggifyJl60QsIX9gWpJ9af6hB2xFdBcq8CDphYFrgLR1ZI51ERxo+2qUt/X+S3lIIfa3JPTShKa98GyGXycckRTKeFbr7ysDd9RptiY9Mhi63DtSDr/viA7BzE0WTvmqSR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854481; c=relaxed/simple;
	bh=tpgeloGIeAOarIjhYxtsJLfYw89esoPpVHEsM3BTuEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjpMAa+aKZMcEex/wgADY4lfFMbmW0Jtc8O1xXgIHQfzIol7UXxht2ONI6o8+FyzdAi902XlPn0eCvA6ymdVhiCsbBm470g3SlvqQNHK5QK4wOPlj8SKQGL30K2njnNaNJvg0PXODadWy65wVwlQEM46ddcLuSvAIGr0svNL1SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LocSTY//; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640E5C116C6;
	Mon, 23 Feb 2026 13:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771854481;
	bh=tpgeloGIeAOarIjhYxtsJLfYw89esoPpVHEsM3BTuEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LocSTY//Br4hRcYwZXZ8BTuVmSGwFAvNTqLoY2INDr96xF/Hsj/JspL5tLD5ebjpa
	 1O5YI76k8bd1Mk8e5wEZVsGJQjvTDJrbxEwnRJmuZolW5NJbSWju2+PiCoGv6TisKr
	 EqXMK99+zpyZjlSbeEr8W57K2hqnY1NIQWPzCoyI=
Date: Mon, 23 Feb 2026 14:09:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH v2] usb: misc: uss720: properly clean up reference in
 uss720_probe()
Message-ID: <2026022310-stooge-cardigan-b68b@gregkh>
References: <2026022327-exhaust-constrain-e21d@gregkh>
 <04778e0c-e15c-4acd-ade2-5cb8dc4319b1@suse.com>
 <2026022316-strobe-zombie-335f@gregkh>
 <1ff10cd4-d3bb-4c9e-9164-056b04b55473@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ff10cd4-d3bb-4c9e-9164-056b04b55473@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33563-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: D68D317748C
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 01:55:55PM +0100, Oliver Neukum wrote:
> On 23.02.26 13:14, Greg Kroah-Hartman wrote:
> > It's tricky stuff like this which makes me can't wait for rust to be
> > possible for USB drivers, someday...
> 
> Well, as you wish to touch upon that topic ...
> 
> I am afraid this is not a problem of language. Rust
> solves the issue of object life time. Unfortunately
> that is useless in this case. I know we all wish
> to solve the issue, but let me explain.
> 
> Now, before you either start despairing or get angry, we
> need to look at concepts. It seems to my you're looking at
> the problem in terms of life time and basically
> something that can be solved by reference counting
> respectively life time rules.
> That is unfortunately not true. Our problem with USB
> drivers is a question of binding. probe() does not mean
> that a device has been plugged in, nor does disconnect()
> mean that a device has gone away. It means that the binding
> between an interface and a driver is requested respectively
> goes away. Hotplug is merely the most common cause of
> these requests.
> 
> Nevertheless you have to cease using the interface as
> disconnect() is called. References cannot change that.
> There are two reasons for that
> 
> a) there is no object representing the binding. It is technically
> a pointer not a data structure. There is nothing to refcount
> and no object whose lifetime you can specify. There is a variable
> that is changing
> b) there is a state transition, not a life time question.
> There is an event that changes the state of a binding if you
> will.
> 
> Sorry you don't like this, but this is a design issue, not
> a language issue.

It's not a choice of me liking it or not, but I think if you look at how
the driver model binds through rust to drivers, most/all of what you
refer to above is already worked out as there the issues here are with
the driver handling resources that it thinks it still has access to (or
forgets about.)  We have working bindings for PCI and other busses
already for rust, and this is handled there pretty cleanly, I see no
reason why USB would be any different.

thanks,

greg k-h

