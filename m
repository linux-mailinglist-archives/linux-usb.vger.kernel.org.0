Return-Path: <linux-usb+bounces-9279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 180CA8A1B45
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 19:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C66E3286930
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 17:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8929D77624;
	Thu, 11 Apr 2024 15:57:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 744C82BD06
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712851043; cv=none; b=VSvVTqVdz2IcgpJ7Fua3kQQJ/jwaK7Lh9DyHAlpXH/7YkOhok/XtbPvsAaIaCIRlfR2hjV4cA/mn0nrT5GYM0Hg6XlRndiwXkeBJGaiTtDVpYHkbTYn1qWVeR0Lx4qkiEwEofNIrvnmYmo2gLcPfzWbFLEfauDsaYYsvj71UYg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712851043; c=relaxed/simple;
	bh=EAxYRJ0OyAMfhG9rDQzT3GCvJSOGfjCCsn61Ac2Cx7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INZoFcdkqqP8Wlf96boFAq/60IPAIG9EXUUgd8/hSSrseiq5cpqfxVwk+OH65+EUSAEI9H7ipfOurXnWNt6OuLJdIc1ACigNMzsOWiMNPSYjXiJHTeyKIZ/aqKiOtR5bHjkE9H1zFlnzwPztcPQRvk91xCjgCPrjTTuJjohgKe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 249502 invoked by uid 1000); 11 Apr 2024 11:57:20 -0400
Date: Thu, 11 Apr 2024 11:57:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC 3/6] usb: usb_parse_endpoint needs to guard against short
 descriptors
Message-ID: <c248cb9a-8072-4269-b4af-f84798c749e0@rowland.harvard.edu>
References: <20240411124722.17343-1-oneukum@suse.com>
 <20240411124722.17343-4-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411124722.17343-4-oneukum@suse.com>

On Thu, Apr 11, 2024 at 02:43:01PM +0200, Oliver Neukum wrote:
> If a malicious device gives us a descriptor of zero length
> we'll go into an infinite loop. We have to check and do
> a hard bailout.
> If we get a descriptor of length < 2 we'll parse the next
> descriptor as part of the current descriptor. We need to check.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/config.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 5891652b6202..050cd5066ccf 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -265,6 +265,9 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  	const unsigned short *maxpacket_maxes;
>  
>  	d = (struct usb_endpoint_descriptor *) buffer;
> +	if (d->bLength < sizeof(struct usb_descriptor_header)) /* this amounts to sabotage */
> +		return -EINVAL;

Your 6/6 patch should guarantee that this can never happen.  Then this 
check won't be needed.

Alan Stern

