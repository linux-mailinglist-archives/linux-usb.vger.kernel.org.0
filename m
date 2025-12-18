Return-Path: <linux-usb+bounces-31584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DC1CCC82E
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 16:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95A0C30B6735
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75A633B6C3;
	Thu, 18 Dec 2025 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QrhELO0b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5452133987E
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070598; cv=none; b=s05Apvyj403BVEFzycd7a180zlX2bTKgBNTgAfQXwnmworusfdA3GzDn4T749vmsfgZ7gZb0bMSxUe4JNF4v3loG+2qQWNmvDu6LtdZjpgpzP1CbmnA+32rOjz4EHSt/Kn6ahZEiWprVWZxHCLA6SfJxAOWOS3ibjaFB8jFLBAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070598; c=relaxed/simple;
	bh=GyIDox64oAhXs+cWAqmAu/mNEobhQiLAUvWZCeDilLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBYX3S4S6iDmq6iULwWOnfTkYiskkcVVzzl5tOszzei5bk85EU04nJFKiRBMPPpFAUHACZs7GdWL0OX/wXOgq4Z8DeHznEVRKYAm9AKzILGCD07MD2xepI4tkHVymlzBpQgkJPelKPj6BLQykI0I4Y9js0GSrScCwRjLvQs2xwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QrhELO0b; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b21fc25ae1so72555685a.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 07:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1766070595; x=1766675395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JzaJvVThloEXKVKLCSqFNRa/Fj7OHCrP1e6taNw3RLg=;
        b=QrhELO0bSXHknYZXqH9ck660k+1Z5p2lNQ0a/oWgjEdAAy9FOQ8dSPn44jk33hiBpy
         j0Sz72qTsZWusXriVOtKbXWQavsKxQgQaIAP92RmHwArN7qtn5oxiISCn/y7UpQHfK7h
         sbB00KRpXyRjWHVlK5mWVclpysKaY7KzDRXxdHxA/fr3a7zpf/M/xEHivgmrPuRXO/o+
         viC577p7AUkzid/wSGS573vsJLLo09tpKUC9ZXj21Klp2FdVncxWE5JDOCTRNNrkFy2h
         oZLC2dbwZDOwU88rJ3hVctqTTe/XkRrLmlHYICzT0ydz9j7ardimmN+Oyn0ScmidRa7H
         ACyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070595; x=1766675395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzaJvVThloEXKVKLCSqFNRa/Fj7OHCrP1e6taNw3RLg=;
        b=ptQrPU66O4pX6QxHnPS0/DHZglHAClB+TrYGh/sMW/9BqTafUmLyOke3sdooIBnOiT
         agoga65t8l3m24qcb6vli4B6MOih2Ejk8iHuHZcVPo4twut7+perrsFS56CViU7cTRZH
         d1+QSlzdEefeuiakbDH4a59WPVJEStYzPMbidu/wPTFT2Xn2REjT47PgeD2H8qe7WsT4
         zo+abiBOkxbAv0SIHjvAJ/h3ZXXgfpFtON6yl40OG/+SFyogEiDY6LafC4gSnDbRN3ga
         FHZ4BoxMDnfeGgundk6ojviMBvdjZcyINmscRO4PZSzhWfMZfEz4T5AiWQRUs292ispu
         6hxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpTKv6KGJb7TX9V3ORvlTjZpwhwSjfSY0FyfjzGDV/fnW39JKXT9RroR+zLpR4a7xsgzejIi75I7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjPtdO4RzuyGZfwLP+dsPx133pdylMO5SrW8a8MSvvhClR5CmU
	H/cDYfrvVuLOqUXEj8PfFOw6AMKCGoGL7mmX5dEsRgXdZHMAmuoPQvsk6AN47BB2CQ==
X-Gm-Gg: AY/fxX6C8QFPAGCT2lcRwwPJ96IChYP9SU6rMWYSnevALz/P3t8OlXAnr+FbH46u1K3
	vX9jQtBdV8LC/HB/B9QgrcZY97rct7a6UZl5CZCRQv8bxpkiDq29UU0N5OQGmV7AqEYtwmH+Cit
	DkjQiQkWSYWwgjTxJg/pVcqdGfItfzfDMUfSkywaM8UK0nxB4FpfesYhM2UIucjuguPvmPGxRMB
	1dkZUptCuaXtqHiLpQGtkaIJA0aSSVH0V6aZSNTeCzAUIU75Rysasq+moYwIvc8rb1AbNvXXndY
	hAgN3UeUXwmj6yRfzcGKsAmxBDvs0rbc2k77fcm8K8fba7qwa/fKaGRAIIAhlPaNrW5KZqwJ7j0
	+grI5OLdoXtaxq88II4qUYzhS0NrW4wHvtisyUa0pSS2xliQAn2ieBRvCD0FTpgodwFaKKKRy9k
	lJ+NfwSgx50WIM6dBYEcLFMAPy6SZfiA==
X-Google-Smtp-Source: AGHT+IGyxZj7tM1qgZsTUFEyxzuZ4qZWpNIRaxcpRdo2gUBAdUSZImncBLxIljLtq1qdhdQuc+nelw==
X-Received: by 2002:a05:620a:371e:b0:8b2:e7db:2545 with SMTP id af79cd13be357-8bb3a36d230mr2878833885a.53.1766070595009;
        Thu, 18 Dec 2025 07:09:55 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeba3c1aesm175983085a.46.2025.12.18.07.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:09:54 -0800 (PST)
Date: Thu, 18 Dec 2025 10:09:52 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Ma Ke <make24@iscas.ac.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] usb: ohci-nxp: clean up probe error labels
Message-ID: <a23e4407-9017-449c-a514-6e9464ec0266@rowland.harvard.edu>
References: <20251218141945.5884-1-johan@kernel.org>
 <20251218141945.5884-6-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218141945.5884-6-johan@kernel.org>

On Thu, Dec 18, 2025 at 03:19:45PM +0100, Johan Hovold wrote:
> Error labels should be named after what they do rather than after from
> where they are jumped to.
> 
> Rename the probe error labels for consistency and to improve
> readability.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Johan, in the 3/5 patch you also changed a statement label, which was 
not directly related to that patch's actual purpose, but it is directly 
related to this one's.  Can you move that rename from that patch to this 
one?

Alan Stern

>  drivers/usb/host/ohci-nxp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 9a05828bbba1..7663f2aa35e9 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -198,7 +198,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  	hcd->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(hcd->regs)) {
>  		ret = PTR_ERR(hcd->regs);
> -		goto fail_resource;
> +		goto err_put_hcd;
>  	}
>  	hcd->rsrc_start = res->start;
>  	hcd->rsrc_len = resource_size(res);
> @@ -206,7 +206,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
>  		ret = -ENXIO;
> -		goto fail_resource;
> +		goto err_put_hcd;
>  	}
>  
>  	ohci_nxp_start_hc();
> @@ -220,7 +220,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  	}
>  
>  	ohci_nxp_stop_hc();
> -fail_resource:
> +err_put_hcd:
>  	usb_put_hcd(hcd);
>  err_put_client:
>  	put_device(&isp1301_i2c_client->dev);
> -- 
> 2.51.2
> 

