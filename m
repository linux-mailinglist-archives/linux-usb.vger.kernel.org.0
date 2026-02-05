Return-Path: <linux-usb+bounces-33122-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IUzMILBhGkc5QMAu9opvQ
	(envelope-from <linux-usb+bounces-33122-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 17:12:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE8F50C1
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 17:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 713843007284
	for <lists+linux-usb@lfdr.de>; Thu,  5 Feb 2026 16:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFA242980E;
	Thu,  5 Feb 2026 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h67ctLUP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7632C11DB;
	Thu,  5 Feb 2026 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307961; cv=none; b=jD5kxZS7kYq/SENqfiJlOfYroc1Fytc6OiVwNs6wNq5I3J7ATUKhSZ5QRVyI+04Gxlb0Zl1bkpgrF0vwuUO8OwpBw8SId6XaElotNt8Zg+w4q7v12YuHBk5rjChhea0ohM5GW0XRQX6Rm4mwNGL8gYOOZBfUzMnXdo47CssnWIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307961; c=relaxed/simple;
	bh=idBARNYBr3rpvLuJY1xRjguq/lY2V/tuKmW7CVIGKLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1t8dHy4b1KO5ru9VAv2xbxllV1y9pJM7Ts1YLQZVKH3lSJRygColY3NWGuQ+W5rfBNsCaOcYELXr99DBz2gmBofhiL9w9j+VjpsZXhsYlw56vrvr/o1IzSoavMRsR13+gxvnSplD1jiprKkmDPZUiRfvmPDXqMudPTnYwULE1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h67ctLUP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2C3C4CEF7;
	Thu,  5 Feb 2026 16:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770307961;
	bh=idBARNYBr3rpvLuJY1xRjguq/lY2V/tuKmW7CVIGKLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h67ctLUP7ioA6/uagMAqQo9Bb1t+zavYHdam/F4Y183RvZNeXL5nG7i+JzJ2S2m8K
	 nVqOVBMi9zX2WhQAcpWMgxcJBIQoaR6QNMbS7rirtcW91rWlZE9ozMeGQoKy2XN0Zz
	 c6XVeUl0lYt73P5eCy/z2cbalvr8MKf6V26MdUd8=
Date: Thu, 5 Feb 2026 17:12:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: jindongyang <jindongyang@kylinos.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/usb: misc: use kmalloc_array() instead of
 kmalloc() to prevent overflow
Message-ID: <2026020529-maturing-whoops-0c55@gregkh>
References: <20260129093202.595963-1-jindongyang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129093202.595963-1-jindongyang@kylinos.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33122-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Queue-Id: C8DE8F50C1
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 05:32:02PM +0800, jindongyang wrote:
> Documentation/process/deprecated.rst recommends against the use of
> kmalloc with dynamic size calculations due to the risk of overflow.
> 
> Replace kmalloc() with kmalloc_array() in adutux.c to make the
> intended allocation size clearer and avoid potential overflow issues.
> 
> No functional change intended.
> 
> Signed-off-by: jindongyang <jindongyang@kylinos.cn>

We need a name here, not an email alias.

> ---
>  drivers/usb/misc/adutux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
> index ed6a19254d2f..000a3ade7432 100644
> --- a/drivers/usb/misc/adutux.c
> +++ b/drivers/usb/misc/adutux.c
> @@ -680,7 +680,7 @@ static int adu_probe(struct usb_interface *interface,
>  	in_end_size = usb_endpoint_maxp(dev->interrupt_in_endpoint);
>  	out_end_size = usb_endpoint_maxp(dev->interrupt_out_endpoint);
>  
> -	dev->read_buffer_primary = kmalloc((4 * in_end_size), GFP_KERNEL);
> +	dev->read_buffer_primary = kmalloc_array(4, in_end_size, GFP_KERNEL);

This really doesn't do anything, as there can't be an overflow, right?
So please don't imply that there is in the changelog and subject line.

This is just a "janitorial" patch that does not do anything different.
So there is not really a need for it that I can determine, correct?

thanks,

greg k-h

