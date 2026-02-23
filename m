Return-Path: <linux-usb+bounces-33565-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFrTJM5mnGmsFwQAu9opvQ
	(envelope-from <linux-usb+bounces-33565-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 15:40:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 191D3178282
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 15:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 402C7304AD31
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 14:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DC334FF4A;
	Mon, 23 Feb 2026 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QfXiEwYk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27B329ACCD
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 14:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857600; cv=none; b=A6g07t0vp+cuVnDGAvL9MKCm2/DvqTosn4rGXP2jGztJJAB3MbQNzYoBNpJ97LJz0IZra2D5aKfMVnwiY44eweyTrtnothbIDzndS18sNrpwES423YP+t8Law49zek6fHEbwhIAf2isrPxxzDg2PiKySWHRYQyGvT4neeJw/0LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857600; c=relaxed/simple;
	bh=t9KBFUqdb3FGV4nIE+fMrWaLv7ZIwKkO2Dt7HG00xmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfVZ+SCGsPK88WfpRX4olYJzytdMMz0IWK4yLU3hoy1PllxgFt4L7bOhAaNWPV7BC99mNPbnYn/g1ALSaJwbqVVRzgvcCPUHESyH5JAukwK5ZcuH0q0trgli0MBpl3aHUsptTjMnW2YRF2eVEtUYFklbfbf5bdNWHDPyCKEisp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QfXiEwYk; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50335b926c2so40516201cf.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 06:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771857597; x=1772462397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kWORPb6fb34LAVxof+FZjNAy04GbN7Kfnww3yYmf/ys=;
        b=QfXiEwYkdNCqZ5ipDT+COOGs61xLTT3yFvdd3XmPGs6Mm32ff0bWuECDBVkIddIsag
         DSlT7YIjAAysPfUhryT8NEMR9MZ6XdeXhqLWywlOv1+yAcb81fPEisElJqVyBScV5rKF
         Q+FRiIZ1IEfni7I+bGM9gaJwYHyBKvV7Dxd1tQh3OpQmIbCdHtV+T5vH1A9yRf+MvMvt
         QJlnh7naJaBx7VKxF3koasQhajIbRQx7dQu4Qwd7PYKRysUxeU0XWSuXjYaeCyz0WGy7
         qPiF9/94pfOOjqSHonw37CI2oTcjwTzz2CQkEWx+RUFiiQANSSsooC0L3767CbDYFhJ4
         yDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857597; x=1772462397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWORPb6fb34LAVxof+FZjNAy04GbN7Kfnww3yYmf/ys=;
        b=NLPUM41K9mDCZaHepp1d3i+K+7RMawWnyL8FHMwwcEt0aJEKmWXZF6vTrsDY2ADYWS
         LcistTT2zei6ubkcgVNCxRA7qMBQ+MXl0WU736xE0gYZx+hDF5446yKFXiMVgapKC6QW
         ZYOieCO6msJIzwtc0hwPDP6LOl1oV/js+nv2zUuXaFMCUpIHzv4ycpXhFGNOByz9CcGr
         FDaozdJ614j7Pv99gnz+viaW8V5ezRK3guZbQoHsrmPf7S1XlTyTnOoFZxD7vPmmE6NC
         OuJnSK9dOIWxu2DwXIKDPzUuwpZC+LIlLRK6OpFaUzwYXBbkXWqxuKpq//+FuR2yvK9W
         88sw==
X-Forwarded-Encrypted: i=1; AJvYcCWUNsFpI7RxLmQLW3BDHqE/mIFrL029idU2peywfSGMzYLMF4hRyP3y744nc6n3hPNd7jgzPUMOMw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDQGgd75J/LbYK+fAIos1Z93MTW2LGLN2L9YSVaw4yNiUgr0DT
	mzOdUb1TxqZ6i64vv1rkheHuNHPMXj7kGi48p421t0xQd39Od+b2smqAFqtKIES3Wg==
X-Gm-Gg: AZuq6aLzI7kmEhib0+vDvLMJI39li1oylrLZnsTRmU2wrjrnWuCVrd4QBbTsl6hBHDY
	1syPOgZng+PIwV03JS3YIdLX2y5n80tcL0KK/IRx8beSPc/wC9rQaqhGYpWS5Urec9X5mo3yeg0
	5hGXZ6C01Xvs1KXHopip7CnqO+fiBe3n4oezmeXtjBY5EPcEYeuT5uzGu7sMvE/RffJAHz1qE47
	OvoV85Dh0mioZEJApBa0antaf5tDTNQOG6HerfZcDiYDcLLBAU5gn/wrIy26K0t0lMBed0HH2HJ
	HM8+tJzV6pVCISwuxJGM1seBocVN4s1IhM0k3zv6IftgytVl9WxrG8u0Lo+ScFDLsQmL9D7EL8W
	NfKITsEFNc32ILB90j3GwIaPQw6s9E+JB/yKfXZcsRbAU0FR0MO/4PxnAPI3syU/kLWNErlnZC1
	4e+QIozYN2wW6kEqRxUvtZPxZv
X-Received: by 2002:ac8:7f0c:0:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-5070bc6bf35mr117323131cf.40.1771857596854;
        Mon, 23 Feb 2026 06:39:56 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d6e9e81sm70887271cf.32.2026.02.23.06.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:39:56 -0800 (PST)
Date: Mon, 23 Feb 2026 09:39:52 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Petko Manolov <petkan@nucleusys.com>,
	stable <stable@kernel.org>
Subject: Re: [PATCH net] net: usb: pegasus: validate USB endpoints
Message-ID: <acc166b4-9ce7-4e95-8f2f-4300ee6dd27e@rowland.harvard.edu>
References: <2026022347-legibly-attest-cc5c@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026022347-legibly-attest-cc5c@gregkh>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33565-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nucleusys.com:email,linuxfoundation.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 191D3178282
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 01:58:48PM +0100, Greg Kroah-Hartman wrote:
> The pegasus driver should validate that the device it is probing has the
> proper number and types of USB endpoints it is expecting before it binds
> to it.  If a malicious device were to not have the same urbs the driver
> will crash later on when it blindly accesses these endpoints.
> 
> Cc: Petko Manolov <petkan@nucleusys.com>
> Cc: stable <stable@kernel.org>
> Assisted-by: gkh_clanker_2000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

This does much the same thing as

https://lore.kernel.org/linux-usb/20260222050633.410165-1-n7l8m4@u.northwestern.edu/T/#u

and that patch also removes some magic numbers.

BTW, what is gkh_clanker_2000?

Alan Stern

>  drivers/net/usb/pegasus.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
> index 4f539b5d509a..94c17fed0bd4 100644
> --- a/drivers/net/usb/pegasus.c
> +++ b/drivers/net/usb/pegasus.c
> @@ -801,8 +801,19 @@ static void unlink_all_urbs(pegasus_t *pegasus)
>  
>  static int alloc_urbs(pegasus_t *pegasus)
>  {
> +	static const u8 bulk_ep_addr[] = {
> +		1 | USB_DIR_IN,
> +		2 | USB_DIR_OUT,
> +		0};
> +	static const u8 int_ep_addr[] = {
> +		3 | USB_DIR_IN,
> +		0};
>  	int res = -ENOMEM;
>  
> +	if (!usb_check_bulk_endpoints(pegasus->intf, bulk_ep_addr) ||
> +	    !usb_check_int_endpoints(pegasus->intf, int_ep_addr))
> +		return -ENODEV;
> +
>  	pegasus->rx_urb = usb_alloc_urb(0, GFP_KERNEL);
>  	if (!pegasus->rx_urb) {
>  		return res;
> @@ -1143,6 +1154,7 @@ static int pegasus_probe(struct usb_interface *intf,
>  
>  	pegasus = netdev_priv(net);
>  	pegasus->dev_index = dev_index;
> +	pegasus->intf = intf;
>  
>  	res = alloc_urbs(pegasus);
>  	if (res < 0) {
> @@ -1154,7 +1166,6 @@ static int pegasus_probe(struct usb_interface *intf,
>  
>  	INIT_DELAYED_WORK(&pegasus->carrier_check, check_carrier);
>  
> -	pegasus->intf = intf;
>  	pegasus->usb = dev;
>  	pegasus->net = net;
>  
> -- 
> 2.53.0
> 
> 

