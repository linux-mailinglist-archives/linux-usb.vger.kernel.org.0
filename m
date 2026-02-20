Return-Path: <linux-usb+bounces-33499-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC/UGAUZmGki/wIAu9opvQ
	(envelope-from <linux-usb+bounces-33499-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 09:19:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5970165977
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 09:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D61330848EA
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 08:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236FD336ED2;
	Fri, 20 Feb 2026 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CssbhH8P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF02F253340
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771575346; cv=none; b=GNafP6G2+RNiVFU/vRTT+VFfMl88vPeGi4OFGvkVQieCfXl3yPDk+2nooA/OLkqP8PYvldEAZiM7tSWyRelaAHL2JfuZ5rZSKDZEQl52ZSKHNRDOSysSvuHYvZz7KFGn6CypZV074DBr+9aZScaTBesxgnsHnPQP705HKH1lTN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771575346; c=relaxed/simple;
	bh=FKhGBpiyLq7iYhtU9Wgi5Tw1/8FCnHKGhbem5mrEZfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7NII+rHeMEnwryxduBwQATH8FiMVdeULSYzRrb0d4Qpb+F+5O5TQV15uctnQJwhugG9K3bHKld0J80MI0iRW7N5xjtItWxeariZeNilkn+GRjNz5N+jYcfmbLzZo0dROHVw9hc5JydNl+VMxl29vcw1d28qUO+zaLDBv9X46E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CssbhH8P; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso19867365e9.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 00:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771575342; x=1772180142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2c4yw4McqVKYbNEiWy1ExzWWDHyzo4nCpO/gtFeWbBA=;
        b=CssbhH8PmrgNV6wqrsTEwjb9DB8DX6zS/mVU2Paik/MQWTkz/Lu4XpKJsGOf+7Z9iy
         dZzdvjaYyDkg7GGfuKd1dgviEkpb5C5J4M+qwOKPxflKdOAQYFqE+iCm4WjecXeA79+a
         y0ud8Q6+LTSJDdt8zCbCbzBWPh0tWRKivAD/qQDKcfzWdXyiNEOeo61D22RacQPzAN4p
         FohSWg37WOfe0KiYcn0vGyXpXBPOqG0VJrUCTbYMQ24UsHzJyKwCUKq95M3HanG+r5w1
         AGEbuQACnatQaSPO+Gwk725Q9KhCJc/6tE8hTiSJOdAcwqDTk11u8AnCYvHpZ2p3ecGP
         OYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771575342; x=1772180142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2c4yw4McqVKYbNEiWy1ExzWWDHyzo4nCpO/gtFeWbBA=;
        b=VJ8pvbUQ3Jr2Y5+V2ohsrAYZxAFyqoIkMjEivoVRo5Gll8h4E+IBubyhEwrI85bLMm
         rCMuaEZYLsu4HhnVinfwZodgykpFM6HISp7qIndoAFERWmzxGgRC0L9nIH9ijGzWfpUA
         as89RHhBMnLdAUli1CHxid0ZUoRvH9paMB6St6TmpChZz8WkGWuPPSoGDCDrLcnOoWoZ
         UqUzO/wtxmK+JmDOLvMG9E4+zq8Gi+jQZm/C9Ztp+Eei4Jy59322FedLWEqX7pX7iuUK
         9Reclh1hJBjPEE0oXg56pnX3yaMvfy/yoRyhMGb96jo0sx5g51Su+vr3Qao1LDh424sV
         MKzw==
X-Forwarded-Encrypted: i=1; AJvYcCULsXOuga/Y4sri+KseF4xVklbnnUYIlXgbunGGnzJTdqES+qQbgFyRZNbEx3sW57dFhNehhqavwUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzftc+VBaXUt6bEAChT+/mQqzpS7NLtApBb22BHgDgVeAlGJB4S
	ZF4dsx1yHz1Ny6zYSDQsmqkFjc3AzPFFJD9wnzKQpYaehNXmC0yzL0m4qqsWXZR/Y3w=
X-Gm-Gg: AZuq6aJOSzsBV/5DKsHevqLlAro5SlRXRWDYRYKomnLrD2MiTUFbEuKpY3ZnL4J6GRy
	4cmnMAFdr1uxL7kEqOLGMGt/oMoDzab84oDE+xz6+sEUn8VmN6u6P4QiZokgZ8IOMMrovo8HRAG
	IrD7QOHtJkt5aF3cWU/oRis7KoJhxkTGxrv2ZbjfoPRsW9omrh/Nhu9u8Rixu7SRy3deqhihsFM
	R5RU5Pt87qmE06Jbga+ijWO4BhE2EYlqI8UHUSlUi1Bcb5EHYzu+ZsKlqjq5aEfJPdy6E7yA9QQ
	sleJ77LCWGrC47YSb9R6Rv/M6SQ1+OC+4GpU2hZp/v3B5+bquLamB7HhYT+zQ9rgWFbeCmQPt+F
	9G55Epltd8nnEenQ1uBk1Ehvq/pGBevYxxfXErDJ2gQ5T+EBrW0Fc0BrF+8VbHQo5DXyc7lpGPK
	tRTA4lXB3ZbXIYEmu4aRigNWR1JpkA
X-Received: by 2002:a05:600c:1c19:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-48379be817cmr389032125e9.20.1771575341935;
        Fri, 20 Feb 2026 00:15:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31d7b18sm59076645e9.14.2026.02.20.00.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:15:41 -0800 (PST)
Date: Fri, 20 Feb 2026 11:15:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: simplify error check in
 dwc3_qcom_find_num_ports()
Message-ID: <aZgYKin2nP19CZyL@stanley.mountain>
References: <20260218110121.10185-1-zeeshanahmad022019@gmail.com>
 <20260219225528.m2gklrxtqqt5ztk6@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219225528.m2gklrxtqqt5ztk6@synopsys.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33499-lists,linux-usb=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stanley.mountain:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: B5970165977
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 10:55:29PM +0000, Thinh Nguyen wrote:
> On Wed, Feb 18, 2026, Zeeshan Ahmad wrote:
> > diff --git a/drivers/usb/dwc3/dwc3-qcom-legacy.c b/drivers/usb/dwc3/dwc3-qcom-legacy.c
> > index d3fad0fcfdac..34c578309802 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom-legacy.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom-legacy.c
> > @@ -620,14 +620,14 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
> >  	int irq;
> >  
> >  	irq = platform_get_irq_byname_optional(pdev, "dp_hs_phy_1");
> > -	if (irq <= 0)
> > +	if (irq < 0)
> >  		return 1;
> >  
> >  	for (port_num = 2; port_num <= DWC3_QCOM_MAX_PORTS; port_num++) {
> >  		sprintf(irq_name, "dp_hs_phy_%d", port_num);
> >  
> >  		irq = platform_get_irq_byname_optional(pdev, irq_name);
> > -		if (irq <= 0)
> > +		if (irq < 0)
> >  			return port_num - 1;
> >  	}
> >  
> > -- 
> > 2.43.0
> > 
> 
> Since this is not a fix, I prefer new development to be on the dwc3-qcom
> and not the dwc3-qcom-legacy glue.

There might be some static checker warnings for these?  Smatch only
warns if people do an explicit zero check since
platform_get_irq_byname_optional() can never return zero.

regards,
dan carpenter


