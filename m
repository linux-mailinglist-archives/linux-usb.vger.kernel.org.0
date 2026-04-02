Return-Path: <linux-usb+bounces-35827-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFaKG3nozWkLjAYAu9opvQ
	(envelope-from <linux-usb+bounces-35827-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 05:54:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9724383452
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 05:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F6583051D35
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 03:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498B2199FAB;
	Thu,  2 Apr 2026 03:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wv/pCjws"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0763537F4;
	Thu,  2 Apr 2026 03:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775101884; cv=none; b=FPmhBHmFDJRUZdtdTU38l2qebavMBL148qrzPVYpN3+ntaGxZQ8fvn4kayxApOsXPlX3z+LUVIU3GvxLHsXRaYVT37eM3u0AExX8pkrwZ+Z5gfRjinEyEioyd1rn48xEL/3veuxdhGB2ZAV5kjjw+yx9658zizMcxGJydQeB8sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775101884; c=relaxed/simple;
	bh=Ei0zcERwAzlGq2/DTmZlX7mB0C6+IdXVqA4B5CYk+HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEy7puQFCqQeCV2nd1O1ChTP+sU7sUiZTuXeUh3o9zUcLXcWRi2oeg5qtjH0Zrin5OwI9sp2v5OeF4JxDUWqhX4I/tqHY7oNfhvxpa4zRNeK3sWM8CIxEUAMZdTj36rqMMKbknFZ5HLtwPgmjP9R/xCdl4qYLkm/zESDt4BHby0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wv/pCjws; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C67C19423;
	Thu,  2 Apr 2026 03:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775101884;
	bh=Ei0zcERwAzlGq2/DTmZlX7mB0C6+IdXVqA4B5CYk+HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wv/pCjwsAdQL5D0XR/iKZFXf7/Do7TTaInQB5KGNdeo1cVpRXeBTBlgdGyu4jpJcn
	 llaLjICk4gaC740Iaz8zOiJHQ+Z1yQsis8fg5b296JfH/5CzuLVKLFQoTV8VaIR6Mi
	 HnzAEt3jJVGKlKknJmuWPOTKkwSswsM2uX3FXkXw=
Date: Thu, 2 Apr 2026 05:51:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tao Xue <xuetao09@huawei.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	caiyadong@huawei.com, stable@kernel.org
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
Message-ID: <2026040241-purveyor-bakery-a9f1@gregkh>
References: <20260402021400.28853-1-xuetao09@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402021400.28853-1-xuetao09@huawei.com>
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
	TAGGED_FROM(0.00)[bounces-35827-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: C9724383452
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 10:14:00AM +0800, Tao Xue wrote:
> As specified in Section 4.14.2 of the xHCI Specification, the xHC
> reserves bandwidth for periodic endpoints according to bInterval and
> wBytesPerInterval (Max ESIT Payload).
> 
> Some peripherals report an invalid wBytesPerInterval in their device
> descriptor, which is either 0 or smaller than the actual data length
> transmitted. This issue is observed on ASIX AX88179 series USB 3.0
> Ethernet adapters.
> 
> These errors may lead to unexpected behavior on certain USB host
> controllers, causing USB peripherals to malfunction.
> 
> To address the issue, return max(wBytesPerInterval, max_payload) when
> calculating bandwidth reservation.
> 
> Fixes: 9238f25d5d32 ("USB: xhci: properly set endpoint context fields for periodic eps.")
> Cc: <stable@kernel.org>
> Signed-off-by: Tao Xue <xuetao09@huawei.com>
> ---
>  drivers/usb/core/usb.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index e9a10a33534c..8f2e05a5a015 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -1125,6 +1125,8 @@ EXPORT_SYMBOL_GPL(usb_free_noncoherent);
>  u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
>  				      const struct usb_host_endpoint *ep)
>  {
> +	u32 max_payload;
> +
>  	if (!usb_endpoint_xfer_isoc(&ep->desc) &&
>  	    !usb_endpoint_xfer_int(&ep->desc))
>  		return 0;
> @@ -1135,7 +1137,12 @@ u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
>  			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
>  		fallthrough;
>  	case USB_SPEED_SUPER:
> -		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> +		max_payload = usb_endpoint_maxp(&ep->desc) * (ep->ss_ep_comp.bMaxBurst + 1);
> +		if (usb_endpoint_xfer_isoc(&ep->desc))
> +			return max_t(u32, max_payload * USB_SS_MULT(ep->ss_ep_comp.bmAttributes),
> +					ep->ss_ep_comp.wBytesPerInterval);
> +		else
> +			return max_t(u32, max_payload, ep->ss_ep_comp.wBytesPerInterval);

You dropped the conversion from le16 to cpu?  Why?

thanks,

greg k-h

