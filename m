Return-Path: <linux-usb+bounces-36447-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AZINnkn6mnkvQIAu9opvQ
	(envelope-from <linux-usb+bounces-36447-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 16:06:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 259AC45376C
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 16:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E56CB300846F
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 14:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B05313535;
	Thu, 23 Apr 2026 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="AS90xwYH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615BB30FF31
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953105; cv=none; b=gsnc6x0g7FXtvga1wXjh3Zce3cWj4f+PJv3aK/CE088RXiFQ7pfnD65Ke4N9jVnjcsLZrjY+Hp8ShYzgrbHomXIFNrLZihlNEITxcLEroRk1iVjp6N3jgXeA48uDnCRoJ80D6wwPqO96rpbzP9QVHqNxKN+n9c8PJtS6Ug3twEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953105; c=relaxed/simple;
	bh=M2K838dnFLhTlcjJug/sxKMqS2dzwi3+0fTlACECAAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeGRwdy1xaRB7tBIQjDkyJylRUGHHc9QkIOLKrUrnACx3cN0a/c3mEdjDSZhqiO7e5N6n0H26FvNMTlhqnjO3vVe21fFZbxHhEw7M8v8pl5xjLK5lkajU2qUAyoajnoBRvCUyGYUIGKt85aVSu5lpxGntzhaJoNoegbNJTQzFcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=AS90xwYH; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-479e7e88fb5so2343630b6e.3
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 07:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776953101; x=1777557901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bzFZJ2M+dvbNGK99i56WiCBDLtOMyTwiuj3Vpj9QAng=;
        b=AS90xwYHUKp6glRJE/bsJ2UKa+EhCBZYZgwGoMpvtJdxQKJU4d6aZPtvyxw0N+zfmy
         53BoaFoVfxCsH3kWtS83A96H5T09d23HZ8bgDlS8u0TztIvMTMnr4c784e1aHlvtGqHq
         jjAEWRbIfjZ+PT/LP2q0tBb0ZsUeu7aQNewas6zKGhnFa0t40vFw/azSP8CFAhnDk2NG
         Q+U+fY0WKAfz/QJwAvBhDm88TNSqbhKAWSF/Pw6BXfS4R03SQvTl6szGGhBaBQ9AEmg8
         WeN03R3dRG851n/A5wWjkIW7XEQkn+y1dmBaapCaT3sZXQRc+razKDjrNueqw5tF0sPA
         Jt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953101; x=1777557901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzFZJ2M+dvbNGK99i56WiCBDLtOMyTwiuj3Vpj9QAng=;
        b=PkeTO0B5vmwwKSac/EZ6AsFXH3KaxqgA7wVNlukDObPjqcttNc00duCauQGS+BNEso
         VDddPwFfiX+9g4sLkLwsd4OpHeFFxWD00pLHM57XKIKUHatYXb+Q8lXUAyOHGm/gd/R2
         od8igFOmyN29bI4xlszC+y195SxfobWMYlRoqNLfxn9qepOAl4AJ3Y85AHFpA1tVITYe
         G13OL7iAjlIYmsaj3j5anT5qPoaDcUfovK9fpJhs+X3V2enqmiCwg0z50BanmNP/iECW
         LekTadXwIge2tWB/qqjRsLADdKFxYNkPz2pp6rN8T1Su9usxlentNv9CG5YRmwfb8er1
         Cj9g==
X-Forwarded-Encrypted: i=1; AFNElJ9M3tGfeuN0KkW621EFH6Pa5ulmp+C4JqjL/jmGebqzQb60wx7cmtB6aqSXICTLk9ALzUdpZ/J4Fu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8aXbMnBT4qdaglb6OYRportnECEK6ME0RA6L3sKxw7OYx4XCy
	5+WAnBfI4o6I/5odFipoB+IpmAxPfCVtELKbMxgrKVVsU1/9LemsqzYGjaOjuknymA==
X-Gm-Gg: AeBDieuIL92vinD/l1RLg07zBoD7QHHlDKvNqYEMY4J/4Rc1Tj98Wsa+drNtVYM0QDi
	UH6Fxs8iiBkwNTgiMrmyMGawINXEfNtrlER4NFtMlXhRs25X4Pd+narem9WyBkEeHpoxv4cGKmG
	Vvo94gmBKBgoZ9vbXKs8hY6ocFfa6gqg2ZEx2LL3WTkvl+8UUAQ9SnxHFU/XUjR8j+GrVYIJ2BB
	19wT7wYtWpJRLVcAJrv3Z7MlIplP0QuOYlRNB6PTR7MWsDGgSxfz0oMrW4r8BxPwTsNLwkAofGS
	v6NuJvRMXWWZPvRK7ipQkh3hKR3SiTNdv5ZU7LHd2W2SQ5kfPGP7BN81CULdpAVaDPk1WyQgNB1
	qjlRt0SLCbRQJxhTfZ+LSdXu0B2dNmyROvMqFZALCvgOdq/TSPXizFyp+wX+LDHDtSjmog7eoXY
	53eVoRV/wGFHUNJemWvG2iFB+Acu1vOA+dvY+JKiHVzl+aQp3SXXBR
X-Received: by 2002:a05:6808:4f53:b0:467:1da9:2b0f with SMTP id 5614622812f47-4799cad0f72mr14328220b6e.34.1776953100600;
        Thu, 23 Apr 2026 07:05:00 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae6133dsm153670016d6.25.2026.04.23.07.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:05:00 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:04:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: "Xuetao (kirin)" <xuetao09@huawei.com>,
	Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, caiyadong@huawei.com,
	stable@kernel.org
Subject: Re: [PATCH 2/2] usb: core: Fix up Interrupt IN endpoints with bogus
 wBytesPerInterval
Message-ID: <0ae0316b-90e4-469f-990b-408518f09056@rowland.harvard.edu>
References: <20260402021400.28853-1-xuetao09@huawei.com>
 <2026040241-purveyor-bakery-a9f1@gregkh>
 <c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
 <74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
 <2026040221-reclusive-garland-6281@gregkh>
 <c2d89ac0-1d5c-45b8-ab68-53214546a7ae@huawei.com>
 <00ad170a-2546-4d7a-8f8b-af6d46e09a73@huawei.com>
 <20260423110517.664745da.michal.pecio@gmail.com>
 <20260423110648.158ec861.michal.pecio@gmail.com>
 <20260423110959.0e2f1a4e.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423110959.0e2f1a4e.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36447-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[104.64.211.4:server fail];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:dkim,rowland.harvard.edu:mid,huawei.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 259AC45376C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 11:09:59AM +0200, Michal Pecio wrote:
> Tao Xue found that some common devices violate USB3 section 9.6.7
> by reporting wBytesPerInterval lower than the size of packets they
> actually send. I confirmed that AX88179 may set it to 0 and RTL8153
> CDC configuration sets it to 8 but sends both 8 and 16 byte packets:
> 
> S Ii:11:007:3 -115:128 16 <
> C Ii:11:007:3 0:128 8 = a1000000 01000000
> S Ii:11:007:3 -115:128 16 <
> C Ii:11:007:3 0:128 16 = a12a0000 01000800 00000000 00000000
> 
> Most xHCI host controllers neglect interrupt bandwidth reservations
> and let such devices exceed theirs, some fail the URB with EOVERFLOW.
> 
> Assume that wBytesPerInterval lower than wMaxPacketSize is bogus and
> increase it to the worst case maximum on interrupt IN endpoints. This
> solves xHCI problems and appears to have no other effect. Interrupt
> transfers are not limited to one interval and drivers submit URBs of
> class defined size without looking at wBytesPerInterval. Any multi-
> interval transfer is considered terminated by a packet shorter than
> wMaxPacketSize regardless of wBytesPerInterval - see USB3 8.10.3.
> 
> Stay in spec on OUT endpoints and isochronous. No buggy devices are
> known and we don't want to risk sending more data than the device
> is prepared to handle or confusing isoc drivers regarding altsetting
> capacities guaranteed by the device itself. And don't complain when
> wMaxPacketSize <= wBytesPerInterval < wMaxPacketSize * (bMaxBurst+1)
> because enabling this seems to be the exact goal of the spec.
> 
> Reported-by: Tao Xue <xuetao09@huawei.com>
> Closes: https://lore.kernel.org/linux-usb/20260402021400.28853-1-xuetao09@huawei.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> 
> Note:
> Compared to original suggestion, this is a conservative patch which
> only addresses known broken devices and tries to minimize disruption
> for spec compliant ones.
> 
>  drivers/usb/core/config.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 6a1fd967e0a6..bdd912627bac 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -191,7 +191,14 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
>  			(desc->bMaxBurst + 1);
>  	else
>  		max_tx = 999999;
> -	if (le16_to_cpu(desc->wBytesPerInterval) > max_tx) {
> +	/*
> +	 * wBytesPerInterval > max_tx is bogus, but USB3 spec doesn't forbid the opposite.
> +	 * Experience shows that wBytesPerInterval < wMaxPacketSize on common interrupt IN
> +	 * endpoints is usually bogus too, and recent HCs enforce interrupt BW limits.
> +	 */
> +	if (le16_to_cpu(desc->wBytesPerInterval) > max_tx ||
> +	    (le16_to_cpu(desc->wBytesPerInterval) < usb_endpoint_maxp(&ep->desc) &&
> +	     usb_endpoint_xfer_int(&ep->desc) && usb_endpoint_dir_in(&ep->desc))
You can use usb_endpoint_is_int_in() here.

Alan Stern

) {
>  		dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d in "
>  				"config %d interface %d altsetting %d ep %d: "
>  				"setting to %d\n",
> -- 
> 2.48.1

