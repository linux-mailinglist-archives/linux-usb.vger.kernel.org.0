Return-Path: <linux-usb+bounces-33556-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNOcFBRFnGk7CgQAu9opvQ
	(envelope-from <linux-usb+bounces-33556-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 13:16:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB090175FBA
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 13:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41DE3305B958
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4D83659F3;
	Mon, 23 Feb 2026 12:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j9fYdo2v"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AAF361646;
	Mon, 23 Feb 2026 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848882; cv=none; b=fzQJPxUIJ0P667CC2ObUAKppKO2LtmIbgYqC7BspEAnhYR+9HEELGVtl54JyLZbGJbl7OMMlBK82BGDepxevgQAO9ZhhTdNV8a+2Q7lg5ak7xuaiBUS3YSomNKmaMme3OU42Eyf2neUcGstAAjF/hWBnaB2atY3NYORerzQ+ZKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848882; c=relaxed/simple;
	bh=ZHZvWOzjYnA9xeE0Ybqz179umPPT27pNTAzAl0o6Usc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bziaRTfJeUzQT9tQiBCDk4WaxVjk2a7ZUjmxLkpq/3eBoai07ZN7CTtBFFRhjwIlsmatjHmSnCC3Qs2gF7WI2PsHEHb1ZwHSUS3eJ7bE5WMAAAJDEQG35HVf1dyfpGSHa2r0Prewg4OZBF9PDO05HAxVYyP4/iCCRd335v2EfPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j9fYdo2v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2EFC116C6;
	Mon, 23 Feb 2026 12:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771848882;
	bh=ZHZvWOzjYnA9xeE0Ybqz179umPPT27pNTAzAl0o6Usc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9fYdo2v5HuAPHvViQDHizrXZYikpM1rDfj/jX3xbFmcg8ID3GnFGkRzyJJQUBuGS
	 /iItGchSzzKqTM5u8XWmQ2B6NVXdbREEevR1iZvcD8WGc76c+HC5WmdXGDF02MORvP
	 y53n2fMnjvu4bLtJPXzDZxXNljn6c6iipL000lqU=
Date: Mon, 23 Feb 2026 13:14:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH v2] usb: misc: uss720: properly clean up reference in
 uss720_probe()
Message-ID: <2026022316-strobe-zombie-335f@gregkh>
References: <2026022327-exhaust-constrain-e21d@gregkh>
 <04778e0c-e15c-4acd-ade2-5cb8dc4319b1@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04778e0c-e15c-4acd-ade2-5cb8dc4319b1@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33556-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: AB090175FBA
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 12:28:29PM +0100, Oliver Neukum wrote:
> Hi,
> 
> On 23.02.26 12:17, Greg Kroah-Hartman wrote:
> > If get_1284_register() fails, the usb device reference count is
> > incorrect and needs to be properly dropped before returning.
> > 
> > Cc: stable <stable@kernel.org>
> > Assisted-by: gkh_clanker_2000
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >   v2: properly clean up the previously allocated resources by jumping to
> >       the error path and not just retrning directly
> > 
> >   drivers/usb/misc/uss720.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
> > index ec8bd968c4de..54107bf280df 100644
> > --- a/drivers/usb/misc/uss720.c
> > +++ b/drivers/usb/misc/uss720.c
> > @@ -735,8 +735,10 @@ static int uss720_probe(struct usb_interface *intf,
> >   	 * here. */
> >   	ret = get_1284_register(pp, 0, &reg, GFP_KERNEL);
> >   	dev_dbg(&intf->dev, "reg: %7ph\n", priv->reg);
> > -	if (ret < 0)
> > -		return ret;
> > +	if (ret < 0) {
> > +		usb_put_dev(usbdev);
> > +		goto probe_abort;
> 
> This jumps to probe_abort, which calls destroy_priv() indirectly
> via kref_put(). Either that works, which would mean that you must
> _not_ do a second usb_put_dev() or it does not, in which case the
> earlier error handling for parport_register_port() is incorrect.
> 
> Either way, there is a problem.

Argh, I missed that part of the error path, you are right.  The existing
code is wrong for the earlier cleanup logic, I'll go fix that instead,
thanks for the review.

It's tricky stuff like this which makes me can't wait for rust to be
possible for USB drivers, someday...

thanks,

greg k-h

