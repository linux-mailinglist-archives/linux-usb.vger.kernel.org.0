Return-Path: <linux-usb+bounces-8979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F16089A0DE
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 17:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECC6A287377
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 15:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC8516F856;
	Fri,  5 Apr 2024 15:19:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E43AA16F84A
	for <linux-usb@vger.kernel.org>; Fri,  5 Apr 2024 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330355; cv=none; b=pDVc/jAYOO1BLJY6J8xKvdOkVjtHiCn6DfcTMxJ8075s+GPF9Sq6MC2xfQD+/umOi3Py4gNAYaa9h78YxyWukfq6nh7kzFS48ZOTh2s8+r5vflyNUcUx+hFA6+XUKZrAevHoKCpt/B7avmiq7xukkApadieYfiQ61eztuJTU4cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330355; c=relaxed/simple;
	bh=LVpXQm861SZsiIC82fus7vlpr0fvnekPOAvTe7RNEYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPKdSFA8Qi+lHmPhgPvlwlDrODeysJlCsr2gq9d0T7J7GyUNsmFivqvwySz/k5eGmWkrYJKcwDLluBbPTTpYEI6vcOyY53Po6MFsKMwSJ9LYGypRLRP9fJVqZ8oPn/3C8fKtx9BbN+2F8IzQfg0UoNSElUDLbTo+XwdUnCQGHpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 49387 invoked by uid 1000); 5 Apr 2024 11:19:11 -0400
Date: Fri, 5 Apr 2024 11:19:11 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Norihiko Hama <Norihiko.Hama@alpsalpine.com>
Cc: mdharm-usb@one-eyed-alien.net, gregkh@linuxfoundation.org, corbet@lwn.net,
  linux-doc@vger.kernel.org, kernel@vger.kernel.org,
  linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH v2] usb-storage: Optimize scan delay more precisely
Message-ID: <d1f64a80-99e2-4d26-9187-2a4ddc8b8e6d@rowland.harvard.edu>
References: <20240405021738.13577-1-Norihiko.Hama@alpsalpine.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405021738.13577-1-Norihiko.Hama@alpsalpine.com>

On Fri, Apr 05, 2024 at 11:17:38AM +0900, Norihiko Hama wrote:
> +static int delay_use_set(const char *s, const struct kernel_param *kp)
> +{
> +	unsigned long long delay_ms = 0;
> +	int scale = MSEC_PER_SEC;
> +	const char *p = skip_spaces(s);
> +
> +	if (!isdigit(*p))
> +		return -EINVAL;
> +
> +	while (isdigit(*p)) {
> +		delay_ms *= 10;
> +		delay_ms += scale * (*p++ - '0');
> +		if (delay_ms != (unsigned int)delay_ms)
> +			return -ERANGE;
> +	}
> +
> +	if (*p == '.' && isdigit(*(p + 1))) {
> +		p++;
> +		while (isdigit(*p)) {
> +			scale /= 10;
> +			if (scale == 0)
> +				return -EINVAL;
> +			delay_ms += scale * (*p++ - '0');
> +			if (delay_ms != (unsigned int)delay_ms)
> +				return -ERANGE;
> +		}
> +	}
> +	if (*p == '\n')
> +		p++;
> +	if (*p)
> +		return -EINVAL;
> +
> +	*((unsigned int *)kp->arg) = delay_ms;
> +	return 0;
> +}

I don't think rolling your own routine like this for parsing fixed-point 
values is a very good idea.  On the other hand, I can't find any other 
code in the kernel for doing it, so it may be unavoidable.

Regardless, this doesn't seem like the best approach.  The parsing 
should be done in a separate routine, and it doesn't have to do all the 
work by itself.  For example, it could copy the input data to a 
temporary buffer, leaving out the decimal point and padding with zeros 
on the right so that there are always exactly three fractional digits.  
Then it could call a kstrtouint() to do the rest of the work.

Alan Stern

