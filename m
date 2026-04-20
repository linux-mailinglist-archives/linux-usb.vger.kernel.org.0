Return-Path: <linux-usb+bounces-36347-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAhvAm5V5mkDuwEAu9opvQ
	(envelope-from <linux-usb+bounces-36347-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 18:33:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB5442F9FE
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 18:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A16132C3755
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 14:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC03372686;
	Mon, 20 Apr 2026 14:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GOcB2bjI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288DD371CEE
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694227; cv=none; b=XocpVffvf4oactTvcbEgh6zpU/t9oByzJyv51yJjFN7fRpIbYZhjWZ8stomBBm6Nce9Dgn4982vgnvDQuZv5qF1FqWl4cIxNajbeiyINb6RGKN6oqvBD6hdqXDPPrA/E4U1Yr2YZswW1G42oeVxefoyR2MGMGAD+2XxBAVCQuSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694227; c=relaxed/simple;
	bh=AUtBJBDhJI3d5YxgERT8DM9QGsBT6Qtol103bc/NIDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1PnccFi70Xxw6H+XZN0ohqDFWe24l1KZdn8VSDCxsawH4IWgiZO8TnregmWU4U0HCStgXrN395EhYGgaN74RjhE6U3U+jF6JSjCfXbKem9V0+Y4WSmWRzDHH65P6rQf9t07mfoEvNxIITaO5SnZOWLhkCpDGf4AwnNPt2NdYnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GOcB2bjI; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7927261a3acso24544977b3.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776694224; x=1777299024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1Ivi3VS3OoyGlZKYKU74XAauef/UB3Zz0gmwHh1M2g=;
        b=GOcB2bjIOYz/7iscWSIbqmc4wHwdSp3jGZ5W3KLPferNG5EXeS2gdgRxwGzOoMkYZK
         5vt81iCckWHpf9KcEYcOCuLbIAEra7BD9W/t0QjkklsTSbDX3wLPNG02wiNRbObRdu4v
         c98hNopt2eT1eVmqpGBHvD9XOnPDl+vZsPAy7E3g7T+h6mS4a3Ii1tCB/OEvLGDt28b7
         88YlH/ra0VPZUZm495dRi5H8qNHKps2bvNaAVA9ix5xQpEoQm7vys6YMLIXE/W+RhYKd
         vjWvAD16EwoOTXL65wr515IqZI+uP5ZhK7BIMQwP/jKHfQXSfTcJ+tgtkZKV0I5k1rxU
         5Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776694224; x=1777299024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1Ivi3VS3OoyGlZKYKU74XAauef/UB3Zz0gmwHh1M2g=;
        b=DY8FhTs6uPijau0+XqKoow43yt5mqLcw3bNia/8yVTEFA4jYoeYkLIGCA7m4+ZYguF
         EmmyCNgbJ42anN2BpKzgIZIn5m3KLZw8sEDNs8/01J3YHe8oTJg4NO5juUl1Jplj8uFJ
         r2I+m46thnMXD+2OrB42BdScLHoSLObHxND5poV84Y51PHqZdZw60/HOMKha6A3vx7Kx
         etMlbAFGglJ98/I3q1BSebNuob7x4naISDLoawoY+6GEEobriR0rgpTjyY8hM3irVOZI
         AGcE1CZmFZqPvD40wXWQ+IF9ECHTK+OZndzsugC3peGlsADjaADKQzBYebOxtm6WNPI/
         1Hmw==
X-Forwarded-Encrypted: i=1; AFNElJ/HIBzkutgH4ZHGM3NRshUFvVDpyaky9EmlmhigtUdeVKxlr5GHC6T0QfLUUmyFDAS5tual32XfIA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeXY8gIdsoQzN3nILAd7J6/9PK7wJNVrZkBOLoKxnhwGzo0na4
	r0l3Suh79e3y6sM33tPfI0X98s6NN/OYjKHvBqVuzmUqNC3p19VxQy/JV5wOW3ihzw==
X-Gm-Gg: AeBDiesKghzdrVBh9LtezpEsTINPG7IFo2DrZwQ5FmmbMejyk2a3r2THt9yMDAQ2VHg
	NxYll6bbkuNks5pm5WXmu8tx5N/5t35InH4mBzG3sOXFjMz+oL9/1e742//T+9+xwJX4rGRKmgv
	g0uQm1u/5S6+PY7hFKZUOzOxuzMG2Iwuv8gVYh4DA+bHZcR2PAws1EBdIcSWjrhzVhbDKBD1oN/
	sqsnSFOXmBq6ROWkGCJns3Hd8ctYt5YyXiaMwQbi2MgEYGMZs4dArq7ucNlKkj6M58usjtowT8V
	8ev7qvsFPoVUWHct92DVfOgU/HRyePdaesGxfamrRatClO7SvjyOm2mSaDD/NKbBGAZTyviDkX0
	tcwQLQp7K/lKsPFCOP4IOsybE2JV5SDLLmljtUkw8kRf1Xj2Sy+wYrKgTyNgYlymq+Vu/xPhiCa
	+kULUZmzjCOm6u/jkmIthwFhygQ2dd8sF9hRoYmY7NXTVhnLrfSgkq
X-Received: by 2002:a05:690c:498f:b0:7b8:f152:7538 with SMTP id 00721157ae682-7b9ece761fdmr149670647b3.1.1776694224093;
        Mon, 20 Apr 2026 07:10:24 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d64cbbdbsm860158085a.12.2026.04.20.07.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:10:23 -0700 (PDT)
Date: Mon, 20 Apr 2026 10:10:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Huisong Li <lihuisong@huawei.com>
Cc: gregkh@linuxfoundation.org, khtsai@google.com, hhhuuu@google.com,
	kees@kernel.org, kexinsun@smail.nju.edu.cn,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linuxarm@huawei.com, zhanjie9@hisilicon.com
Subject: Re: [PATCH] usb: gadget: udc: Fix overwriting the gadget driver of
 occupied udc
Message-ID: <ec166527-2064-4d48-b2c5-fd2e3e5afd87@rowland.harvard.edu>
References: <20260420040223.1232745-1-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420040223.1232745-1-lihuisong@huawei.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36347-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,huawei.com:email,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: EAB5442F9FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

How did you find this "problem"?  By encountering a crash?  By code 
review?  Some other way?

On Mon, Apr 20, 2026 at 12:02:23PM +0800, Huisong Li wrote:
> In gadget_match_driver(), the core only validates whether the gadget
> driver is already bound, but it doesn't check the current state of
> the UDC. This leads to gadget_bind_driver() (the probe stage) being
> invoked for an already occupied UDC.

No it doesn't.  It is not possible for gadget_bind_driver() to be called 
if the UDC is already bound to a driver.  That's because this routine is 
a .probe() callback, and the device core only probes devices that aren't 
already bound to a driver.

It's true that gadget_bind_driver() is a probe routine for the gadget 
bus, not whatever bus the UDC was registered on, but that doesn't matter 
because the UDC's driver is always assigned and cleared along with the 
gadget's driver.

> In gadget_bind_driver(), the code proceeds to overwrite 'udc->driver'
> and forcibly modify the UDC speed without checking if the UDC is
> currently in use. This results in state inconsistency and disruption
> of the existing connection.
> 
> Fix this by adding a check for 'udc->driver' in
> gadget_bind_driver().

This change is not necessary.

Alan Stern

> Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> ---
>  drivers/usb/gadget/udc/core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index e8861eaad907..47e50fe1b75b 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1615,6 +1615,13 @@ static int gadget_bind_driver(struct device *dev)
>  	int ret = 0;
>  
>  	mutex_lock(&udc_lock);
> +	if (udc->driver) {
> +		dev_err(&udc->dev, "UDC (%s) is already in use.\n",
> +			dev_name(&udc->dev));
> +		mutex_unlock(&udc_lock);
> +		return -EBUSY;
> +	}
> +
>  	if (driver->is_bound) {
>  		mutex_unlock(&udc_lock);
>  		return -ENXIO;		/* Driver binds to only one gadget */
> -- 
> 2.33.0
> 
> 

