Return-Path: <linux-usb+bounces-33815-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OQLLLNgo2myBQUAu9opvQ
	(envelope-from <linux-usb+bounces-33815-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 22:40:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 361411C9327
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 22:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD7833604832
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 20:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454D23630A6;
	Sat, 28 Feb 2026 19:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="KV01679i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A423E36309A
	for <linux-usb@vger.kernel.org>; Sat, 28 Feb 2026 19:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772306662; cv=none; b=kwdR65bcttLK9+MBTW3sSxv4lzLVUbPkGBEwinYvRN/SOcurQtT1v0RUPGcZYhvmvZllOeQJhtBwhN+ZfMtQ0/kuICpnbvXFu6hbUcdkWv2ElSkzXvDAEYGNVve6UrM7BvkDOh0HuWtnYbwixUAnzJMGqwC841X0r5lXDGtRhFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772306662; c=relaxed/simple;
	bh=Conod47dhgqOeXAilsgPCOlHHqxCv+RlMlORS4MyuJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaN7+wOpyhKRVVAyW8y9GUV3NcrfuN1VWh6pYW4N08Y0xq5kQyR5olwlZYqiyUgTgioGb9EjqoCdixFnJu+Ibz4j77T0SweLEhuRvEyn9Z82Ncz6+z+QsRElA4C9nJ7Aq/VB6dAfVVA5E41qVArBOUxHXV9HwxtLUGf6i66RW0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KV01679i; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-899aede64e8so29878196d6.1
        for <linux-usb@vger.kernel.org>; Sat, 28 Feb 2026 11:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772306659; x=1772911459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QWI9wnCcwPlpeSjDQxYql6k6+sYNWx4rnjMNuBKZL1g=;
        b=KV01679iFyFfEX6TFaDSW/bwe10ZlPxB6THc5Bxe9oI3Fm9uXxcsno/8vvM3IfzgGR
         mAxgCHMLZ4ouakcW0U5eHlFgQu1XSZAYxe1zknobLRT+WS3D+uN9F8hYKgg+2Em2xAL4
         YiwfZbeeGunaMd2xznwob9g07PlSsx5ThZuOCdBO/cS+I09G8KEW+zJwW4KnEX+Ram1x
         mU+o/rOhpGGNtPzh5WlMrjD979T+t5n1GFz3Mp1VPm0HgTQHTs3XBydJ66iNIGM5Ol9C
         OjEWC+0zSBU5XD718n760Z2U4PW9bZOTJSH6/nUSfYdKlXbKldCsCbE1djtFZGa1EOb8
         dmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772306659; x=1772911459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWI9wnCcwPlpeSjDQxYql6k6+sYNWx4rnjMNuBKZL1g=;
        b=pgWuA024Ni+M6xfKqPSthinlvklo4fwCHHQBs1QmQ97p2Nk3NiRIjHCpEmMHnnpFyF
         05XtbmTnGtGhnMRiNcZ6HS8rgEFzkTH5ABYWd69ClY/3JZMz31TIASlWUOM5OHMGtO3m
         wcmGOcz/9T+rEHQOML8Al5E+tbP+TrFgkOVQP0bqTq4krpMnTXqxhq9Tut01I98ske4H
         7qrtsankniMrNkuCdxY/5BBJghVTcVjCeqSsCvgH/fqY1Kwx1G1EX1+aj2BG0E86IUiu
         xtXKXpxtNXnZU6zPmswB55oPHqu7T/6nvSGz/2/MpVazRggbl4nR4F/t8EqRCL8Z5cO3
         C5gw==
X-Forwarded-Encrypted: i=1; AJvYcCXvroxr2zKjWnVtGIsXWwb5nxdoAAcIXhu5m8ZqdrWB5876LogWpVNk7ePgdodbtVPfoyCWC6mRTdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLssCAS6e+Ae1Zck8vpzff4wCPYJmorzeuogyWMBwokYmVgQTe
	Dshh0QxtdxxaIFk4bXcimWd/QxLIxyv/GvYJvmcrH4ZPGeDCiioeKjv6LpE8/cTHsg==
X-Gm-Gg: ATEYQzwysk26dXcciGDcoMWyEkYP/eR+UqzA0n602tGklLMIrZSZtKPKR3QczUok2aj
	eyZZjxD0jNe8ObBSfJzncvJybmUAM2dpPb726jPWVHU5ZA1HHIPqr5Q85aSOti88xFglMCDnMEN
	P1j4CsqUjm7Yyce8XFdw6yqQsM6Jt5T9oyKDA5wGvMlmzOPXiNiH1mUuNkIFhZL6QD1LPONbLiF
	8rLZFLfdGqNjvZq1mKJvTaH545TpqcMGgYr037GtRU4zBW90cgWt6xgXz7SlXTmMpwbcl91OfEb
	BIAS/H0yNJZddZLsz8PYFodxPpMlLPEf7QiVhoclBbYS9xJN55J6C0ntfvbydFYN1kNZ08dKvub
	6KVo+O5ji2taO1qM3LWKI3agUD3znzzez/rjpdJmwOvz5UnGMXte6SGgyx9a0jH5/cuc5fybpD5
	MwmpYweFJ9O/2U6lABBmcYTfWt
X-Received: by 2002:ad4:5c67:0:b0:899:a98c:1f48 with SMTP id 6a1803df08f44-899c67faf91mr155860076d6.23.1772306659538;
        Sat, 28 Feb 2026 11:24:19 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf658f70sm753665785a.7.2026.02.28.11.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 11:24:18 -0800 (PST)
Date: Sat, 28 Feb 2026 14:24:16 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: ohci: ohci_pdriver.h: fix missing kernel-doc
 comments
Message-ID: <2bebdeb1-bdda-4465-af21-2f463ad2e636@rowland.harvard.edu>
References: <20260228192012.2787573-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228192012.2787573-1-rdunlap@infradead.org>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-33815-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email,harvard.edu:email,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 361411C9327
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 11:20:12AM -0800, Randy Dunlap wrote:
> Convert comments to kernel-doc format to avoid kernel-doc warnings:
> 
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_on'
>  not described in 'usb_ohci_pdata'
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_off'
>  not described in 'usb_ohci_pdata'
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_suspend'
>  not described in 'usb_ohci_pdata'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: linux-usb@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
>  include/linux/usb/ohci_pdriver.h |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> --- linux-next-20260205.orig/include/linux/usb/ohci_pdriver.h
> +++ linux-next-20260205/include/linux/usb/ohci_pdriver.h
> @@ -23,12 +23,14 @@ struct usb_ohci_pdata {
>  	unsigned	no_big_frame_no:1;
>  	unsigned int	num_ports;
>  
> -	/* Turn on all power and clocks */
> +	/** @power_on: Turn on all power and clocks */
>  	int (*power_on)(struct platform_device *pdev);
> -	/* Turn off all power and clocks */
> +	/** @power_off: Turn off all power and clocks */
>  	void (*power_off)(struct platform_device *pdev);
> -	/* Turn on only VBUS suspend power and hotplug detection,
> -	 * turn off everything else */
> +	/**
> +	 * @power_suspend: Turn on only VBUS suspend power and hotplug
> +	 * detection, turn off everything else
> +	 */
>  	void (*power_suspend)(struct platform_device *pdev);
>  };

Shouldn't the function-pointer descriptions go in the big kerneldoc 
comment just before the start of the structure declaration?  That way 
they would be consistent with the descriptions of the other data fields.

Alan Stern

