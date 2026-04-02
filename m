Return-Path: <linux-usb+bounces-35897-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHLYLit6zmmMnwYAu9opvQ
	(envelope-from <linux-usb+bounces-35897-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 16:16:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D038A546
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 16:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 440ED305C6C9
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 14:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22C83E715C;
	Thu,  2 Apr 2026 14:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g8Q+Kj6a"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8393E51F4;
	Thu,  2 Apr 2026 14:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138994; cv=none; b=Sh6vdcjxw2rWzvAIcnUrh9res8JUzbfxUIfbumdeS2TDeOcEdLJhpN6aPW4Y1n7nq81G8o9QDREiELDSdxE9Qpdd/g607tCqy+pmdR+XCgYM8Gfb2ZmhEfWmMBj8hjoLPMvZNGTcJKfbink/BusSy3ouidI8MxORB3PPp4uF20A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138994; c=relaxed/simple;
	bh=7zp4ANr68FyPWcDzAkNP4q8JRJH5RLod3BMcemdKkrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIm8HroEbJFqQPYLQ7IpDsLErLx6SLFGv933Ki14ywpMGtdttz7hQuehgMmxi7jqUWgV7ga1NrYq0a3QtXBcIWNCWSOQpExEm3y/f1CiMylGXWmVF5sYFdY7ySHbYXS6GGuW/a+S6h5rOjz6y3Ml9Z8fNnAqmk/rbfq4hzaZU8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g8Q+Kj6a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA0BC116C6;
	Thu,  2 Apr 2026 14:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775138994;
	bh=7zp4ANr68FyPWcDzAkNP4q8JRJH5RLod3BMcemdKkrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8Q+Kj6aEltLsMDz5jn2kxU9xFoskyxUrUXSHsA1FFVEhnbepnYRyjbafF0D1RmIQ
	 Kyb8Q7Sqz0/Bln2iBNWH2jYYvzZI+dfEnEFP2VFBJNi08NBZUvmQSf8c+zL4NW9FeL
	 Ley62pFYVL7fZVwx6jeXzFqmitzCEEGYsuZGhHjI=
Date: Thu, 2 Apr 2026 16:09:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: "Xuetao (kirin)" <xuetao09@huawei.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, caiyadong@huawei.com,
	stable@kernel.org
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
Message-ID: <2026040221-reclusive-garland-6281@gregkh>
References: <20260402021400.28853-1-xuetao09@huawei.com>
 <2026040241-purveyor-bakery-a9f1@gregkh>
 <c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
 <74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35897-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C4D038A546
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 09:56:51AM -0400, Alan Stern wrote:
> On Thu, Apr 02, 2026 at 02:59:35PM +0800, Xuetao (kirin) wrote:
> > 2、Following Alan's suggestion in another email, should I check whether
> > wBytesPerInterval is a valid value and handle it in the
> > usb_parse_ss_endpoint_companion() ?
> 
> Yes, IMO.
> 
> > However, when parsing the device descriptor, we do not know whether the
> > actual data length transmitted by the peripheral is greater than
> > wBytesPerInterval.
> 
> Note: wBytesPerInterval is in the endpoint descriptor, not the device 
> descriptor.
> 
> > Therefore, would it be sufficient to only add a check for whether
> > wBytesPerInterval is 0 in the existing flow, and if it is 0, set
> > wBytesPerInterval to cpu_to_le16(max_tx) by default?
> > 
> > For example, modify it in the following way：
> > 
> >      if (le16_to_cpu(desc->wBytesPerInterval) > max_tx ||
> > le16_to_cpu(desc->wBytesPerInterval) == 0) {
> >         dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d in "
> >                 "config %d interface %d altsetting %d ep %d: "
> >                 "setting to %d\n",
> >                 usb_endpoint_xfer_isoc(&ep->desc) ? "Isoc" : "Int",
> >                 le16_to_cpu(desc->wBytesPerInterval),
> >                 cfgno, inum, asnum, ep->desc.bEndpointAddress,
> >                 max_tx);
> >         ep->ss_ep_comp.wBytesPerInterval = cpu_to_le16(max_tx);
> >     }
> > 
> >  Could you please give me some advice? Thanks.
> 
> Try it and see if it fixes the problems you see with the network 
> adapters.
> 
> I saw the Greg said not to change the descriptors and just fail the 
> device, but we already make this sort of change to correct other errors 
> so there doesn't seem to be any reason not to do it here as well.  
> Especially if it allows people to use devices that otherwise would not 
> work.

I didn't realize this was on "real" devices, sorry.  I thought this was
only a fuzzing thing.  So yes, fix up the broken descriptor after
warning about it is the correct thing to do.

thanks,

greg k-h

