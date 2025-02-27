Return-Path: <linux-usb+bounces-21172-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D2CA4899A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 21:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FEBC16DF3C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 20:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF172222B7;
	Thu, 27 Feb 2025 20:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JPb6tUCB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA191C07E6
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740687382; cv=none; b=Am+Ho13AIeECoZR2cH4LLR1uCxs9nSQ/aLuy+HK4W7KzbyaxL2V0Q9+zWdmwifY9EksB+VVnYSCqpk9xKuHHeg155f1OI9RoB2kvJSDtMVomM9UcgIdQM2GFL+KNiOm2Dm1qyQDvdBIphmJL2Y6P8RgaD2C0elP0Sjn1K+N6RiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740687382; c=relaxed/simple;
	bh=84h/RFLZWqWFvHRkgj2Eu5xJJkjpYWE2cje3cUPANmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1yu5Di/iTqjpPix6XyiQuekmBKpyIiPkr8Ztqp4ly0qyM1iWzA4tskPIaI8w8+/6yZpsqBiG0mXdzpOThXFtpaa25lrfhGfDxcOCDTNvusmbfpprDwQee4HftnOk9rn8zbMn4jYN+OQyhwwAmG53C2CVWfnA8JldbXpnK75iac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JPb6tUCB; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e0505275b7so2013502a12.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 12:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740687379; x=1741292179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xXJZXOlj8RS1CWCL6FlZJfuUCxngSMS4ulOS9DCvcgQ=;
        b=JPb6tUCBvSy/ZnRCx3SUCN4rRmGuGgZPARCgj8O8/97I7p0JYXwc6kxqKoEwZ5QLj+
         RAFP2Q7qMVbByfbAJ41a7f0/l4jyQZsl5Au6/r9ikU9iVgWNJhfLKpA67G6vYmZus568
         HZCo+WzE/og2N8XJo/rR8NFGlfi9WBPi8GPGD7BycXx3ihfOBREVP5lrXtnEIsMuulc2
         4F1ctBD2QDq2sZDNupzzhf4Uvqcyo8Uv9ITEs03TFfC/YO59gjsLv2d6JoM6wwViEtoR
         gxik6bUHHLRjQaRO9tv6slYIMuWRdTJ/Wpg0U9F93ken1NskvVlvO/qgHncC28V6D0UF
         q7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740687379; x=1741292179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXJZXOlj8RS1CWCL6FlZJfuUCxngSMS4ulOS9DCvcgQ=;
        b=L2q4pxw53LmOwriLZ3H12ox5GP7BMLwKFq7NhmPmauEWe+kwb4RDU6rnpAO4jFnfm0
         VVL3RSH5whYND+1rUAuPnvEJXhwufz8CE2fakj2Go9AXPcR9iIAhi36K1Zogmtw+BFC5
         /EOYHB0OUUkZ1cpczsKrMC/ykgq3w3f9Af+T8wol3yvilJb+RwRdQc+HfnYLvHXZEcJ2
         QH1RVFHwviRp9Y4jSL0HzqL0ar6qFaDxAUgKIpyzwYlAPjlGJcFVNf0irQt97ZkF9/QP
         4QmZboJZInp1bXDaeEbG//fPUCquULemsUZtwAkgnueQ20fDkYgk6yXVXbMO5tRbKNPf
         U54Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiCmLfZWr+EUsV1KLDqwYTSpcWUgdnb2dm2Kl7h8tXGCwqbmTmAFjlCnU402pRiWl7dIYShiiiDYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7dR7VNcCf+2+JZp+G67PbkviwAmls5magiaZcElRuQ77mvVe+
	rKDPbgj/DaJzOvW9fbMe2q3MV5pipzE1Q8+T4iKqTHnNaoQPVEkXxQ2tiy6RKWo=
X-Gm-Gg: ASbGnctTnbNGRxXvjHxqu81/Pi7XAyc4tNs0jdAsS3cHbSedoWk6OeAkN73VdZpFkqr
	ME3XeFiZw6SXml9e0vMzUUuS/pkCs2e7Jl+Ntsv4PfWXcKW9JJs08IwI7ybozcmvOXYmMSmCHVT
	l5+zWzB9F2TmGLi2/VLLuKYLM24g1eNCi67tIQ/ppH3jZE/QNGvFQ5N8uqAT21MQ+amI60QU0bg
	aQpVFtAPSlsAJTE77PrQRABiKQQRjCMWNoR6J0OxD+x+SyUVOuVt8HbA9Yow6O/jSu8I3yQnrFT
	d6jEvbiRjHCZ4akffvraUDUBsQqVm78=
X-Google-Smtp-Source: AGHT+IH/bEmEblcXab5Tj8A0iK4TBeBn4mn3wXNDIIFNA5wM6pq+whn3pw/0Z2EMocbp0uIvyh267A==
X-Received: by 2002:a17:907:94c7:b0:abb:cdca:1c08 with SMTP id a640c23a62f3a-abf2642b53emr72174566b.16.1740687379227;
        Thu, 27 Feb 2025 12:16:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c75d8e8sm173381066b.146.2025.02.27.12.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 12:16:18 -0800 (PST)
Date: Thu, 27 Feb 2025 23:16:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>, mathias.nyman@intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: Fix bcdUSB initialization
Message-ID: <150a2fb5-f1f1-44c3-8923-e23589d5dabc@stanley.mountain>
References: <20250227193400.109593-1-abhishektamboli9@gmail.com>
 <2025022757-extrude-carpenter-5bec@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025022757-extrude-carpenter-5bec@gregkh>

On Thu, Feb 27, 2025 at 11:36:24AM -0800, Greg KH wrote:
> On Fri, Feb 28, 2025 at 01:04:00AM +0530, Abhishek Tamboli wrote:
> > Initialize bcdUSB to 0 to prevent undefined behaviour
> > if accessed without being explicitly set.
> 
> Is it actually accessed without being set?  If so, please explain it and
> also how the compiler is somehow missing this already?
> 

This is a Smatch warning, not a compiler warning.

regards,
dan carpenter


