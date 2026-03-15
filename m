Return-Path: <linux-usb+bounces-34824-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKUcMdjFtmk3IgEAu9opvQ
	(envelope-from <linux-usb+bounces-34824-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 15:44:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D652910DF
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 15:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 869353013256
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 14:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230BF36829E;
	Sun, 15 Mar 2026 14:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="slXTfGGW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214B33A6F0
	for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 14:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773585877; cv=none; b=p8SWiD83Tvg470II3THIbyXaoxpJtBUSgGUd+zoWJvzLTVSZuRpp06EBsAdfHoKAi4rSFwTCcrVcqXgkfuRn0OiKLVTWqxYNJetOV8634OXvwqZ5cbwkTOX7HZZscOCdOP5JLm4c/5tfdmwcU48+zQX+g09iDFnb8HVyh/nbEBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773585877; c=relaxed/simple;
	bh=+15PsdfpJXtE+2GqEcj6TOzPq7c14GA3e2d03olf0Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjEljJDKB+W+c04EFqXnbLXCrYBZ5I6CCPoOU4RQV8gp6JyzYAGqS4giDI7DnA4KW0EFa9Fybs/VMl993fD+4ma9DNfqCOQJz13/yMBEXnamGs45Z6PjLDEGPrL11gkZwyUC3IiN5yNASKY6JQyJ3Ga4MkGzI+4FoFG4wDrSzrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=slXTfGGW; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-89a07f66f4eso46494846d6.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773585875; x=1774190675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O8OKAHs7uT+2ajQgggqXPZOP0fLTZcG9HX/RZUryyHY=;
        b=slXTfGGWFCS1T1pmBbQdb54rNWeW16zniqfn439Fq1P5mSLCBQbH0wya4wQAibwjNH
         uSQmn3rE3dHAKxl1quJSE2WQOUaLVYw8I7bO23sXSZuhYwRFBnvP80MmBTu5xXhgGM9y
         yoigU3GECGHEOPwD48qdZzy+xkElrzEfnjh7hI70gbSuY4J8qZIad1dvCwwAIlO5kWNA
         lCYzitybNnZI0xq6cU2WnIWmdb04L9cRcqbh9L3EWkK+ffkyPR6aeA9Y0J/2GlVm7q26
         BycgtmZ+jUkuX+4gvsa5fP1f6/dRsUhfkf8vHWySgZ6fR6JFbh7IE9u1Bqr7MC6NdnXS
         V38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773585875; x=1774190675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8OKAHs7uT+2ajQgggqXPZOP0fLTZcG9HX/RZUryyHY=;
        b=U1AHCfEoa282gDBPGw0ICqueHI7xSnnYzwF+wfgY4sOO4sTAn2Ey0nPz4eOKRZAV3Z
         x8RN+08N/HmxAS7VQFn1WiiZp2DQp6bUbfLk+9okg6QO8Zwcyue+4MK+GXLQcU/abgZI
         9gWTeR9H3ptsjfQhfAxfKCUKQSvJ176HpOSb4HSv0KnzuXj98kCzIvBQH24raq9ZsuK5
         8//AHrPa5n6nHFN6LpmyBzR3LJ5o7I9fZjxx8ybmVYbAm+CeSK3Kyh+oWuUBH/iHhBGo
         gxPCqVO/I8sFxc1ahhA35ePUYhuGTxHfrs6awPj8FwL91sOgspArKYEiR9yEA0DJPv2+
         MFUw==
X-Forwarded-Encrypted: i=1; AJvYcCWA3QSXRzyKBO66ekVeAaPv5jYEQ7G0LArn++z93l1BnMxkUCYu/IcVRUkmdqbts63YXCzdfvSEAZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5NzYYhb5Or5dIxchsyU4D0HmmsSm1bc/xy3+S86xKbdS7Tqe
	R+BKPz7VqXIqGM2e+oHuvnrMoLprTzNDVz+X/R2IKaD4eLTGSMgxp9yTN4JY2TTnlg==
X-Gm-Gg: ATEYQzwwGGpZBTxjuEim3QjqvHCR9iSzt0ar1cIetfBsWOFDxAYizuHL3RYCWV4xnV+
	+FUyCJSOc1JaR7e0Dxf5o03nfWsXpwAwrbzYQRry3Ou7Zt2S1NWQo73KAgued/bCyC6Gb3x0V4z
	g3zjPMi3U6ofxrqyO1XrbCXVyPuAzaa1O4M+/2F8A++tmhQ7Rax1gUYrvmI8A3HpTuO2TYOX7xf
	nd/kgcePWsZaL8Uywfq46TvXdQWZpSPek4WndrMYaFDHYIYrrp25Y84cTxcXBGADphDuq85gJm0
	cqGW529gpwJb8WUp1usPwpvi/oUt8/f9AUWMDv+eESyKD6uuJQc5YvOSuPfpHewwZcf1GfByu6B
	lPD/wtSTxypVlIeOK0Bs6dLd5zDv2vvqdm7De/tcJQQAzDG1qxD/r2Vc8eAMRcJaSQev+u81Ffp
	o5WGx32X4FFTswKWVsIGckLtrR
X-Received: by 2002:a05:6214:76b:b0:89a:6142:377a with SMTP id 6a1803df08f44-89a81c76c42mr139201406d6.2.1773585875264;
        Sun, 15 Mar 2026 07:44:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a6947c4b8sm97506126d6.20.2026.03.15.07.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 07:44:34 -0700 (PDT)
Date: Sun, 15 Mar 2026 10:44:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Urban <surban@surban.net>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: dummy_hcd: fix data corruption with queued
 requests
Message-ID: <9f2c403b-5955-4e6b-a356-330cebead7ed@rowland.harvard.edu>
References: <20260315090307.304644-1-surban@surban.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315090307.304644-1-surban@surban.net>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34824-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 24D652910DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 10:03:07AM +0100, Sebastian Urban wrote:
> The transfer() function in dummy_hcd iterates over all queued gadget
> requests for a given endpoint via list_for_each_entry(). When the
> per-frame bandwidth budget is exhausted mid-request, leaving a
> partially-transferred gadget request, the loop continues to the next
> queued request instead of stopping.

Why do you say this?  Did you not see the code (at line 1445 
approximately):

		if (unlikely(len == 0))
			is_short = 1;
		else {
			/* not enough bandwidth left? */
			if (limit < ep->ep.maxpacket && limit < len)
				break;

It does break out of the loop when there is not enough space remaining 
in the bandwidth budget for another transaction.  But it does so at the 
start of the iteration following the last allowed transfer, rather than 
at the end of last transfer's iteration (as your patch does).

Furthermore, this test can't be removed, as there might not be enough 
space remaining for even a single transaction.

>  This breaks data ordering in the
> URB transfer buffer.
> 
> Two consequences:
> 
>   1. Data corruption: bytes from subsequent requests are written into
>      the URB buffer ahead of the remaining bytes from the incomplete
>      request. On the next timer tick the incomplete request resumes,
>      appending its remaining data after the out-of-order bytes.
> 
>   2. Premature URB completion: if the next request is a ZLP or shorter
>      than the remaining host buffer, it triggers the is_short path and
>      completes the URB before all data has been transferred.
> 
> Fix this by breaking out of the loop when the current request has
> remaining data (req->req.actual < req->req.length). The request
> resumes on the next timer tick, preserving data ordering.

As far as I can tell, this change is not necessary.  While it would 
avoid executing a few extra statements in the unlikely case where a 
request spans multiple URBs, in most situations it just adds a redundant 
test.

Alan Stern

> Signed-off-by: Sebastian Urban <surban@surban.net>
> ---
>  drivers/usb/gadget/udc/dummy_hcd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index 1cefca660..0eead4a85 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -1534,6 +1534,12 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
>  		/* rescan to continue with any other queued i/o */
>  		if (rescan)
>  			goto top;
> +
> +		/* request not fully transferred; stop iterating to
> +		 * preserve data ordering across queued requests.
> +		 */
> +		if (req->req.actual < req->req.length)
> +			break;
>  	}
>  	return sent;
>  }
> -- 
> 2.53.0
> 
> 

