Return-Path: <linux-usb+bounces-9280-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C18A1B4C
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 19:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DA1B286491
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 17:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74C67E580;
	Thu, 11 Apr 2024 16:00:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0252F7AE43
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712851214; cv=none; b=A3f8f/xUllY1dw1Vn00Soy3wJ0vCoDTgVgqhfJXw50g1k0lYl6/yZwx38/MYKGN9/NlzSHYKzzLndyoFc7jePmGjPLpjgh99SZNFhCAT3lIXL0X7BcjiuKy82fDeVcu9cr7Yy+GCWBu/COw0ane+pQZ4gr8/8lsrNMjkpJchsnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712851214; c=relaxed/simple;
	bh=hF4q/sXgshvj0ZDa5lI3gZBKNyGTAD2RxewTPL+BM2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+qKSuIxO7vbUTFTggoAnaOec66QcbhAxJqcR9hifHz0cc17givl2oAw1hO/97bLplpBZeXqcTaJTZQIs1OMrVoJKCRqZDTnnvwg8/ZAcDTAAQ18K/+L/Yy9shFlpSXf271eC6MK9gC0dExZ757vBsHFZTEe0inxz38WYFfHg8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 249662 invoked by uid 1000); 11 Apr 2024 12:00:12 -0400
Date: Thu, 11 Apr 2024 12:00:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC 4/6] usb: usb_parse_endpoint guard against an
 incromprehensible preamble
Message-ID: <47966398-86a8-4807-ba6c-5ab2da4bd88f@rowland.harvard.edu>
References: <20240411124722.17343-1-oneukum@suse.com>
 <20240411124722.17343-5-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411124722.17343-5-oneukum@suse.com>

On Thu, Apr 11, 2024 at 02:43:02PM +0200, Oliver Neukum wrote:
> usb_parse_endpoint processes an endpoint descriptor and then
> advances the parser to the next endpoint descriptor.
> However, a malicious device could feature something other than
> an endpoint descriptor after the interface descriptor
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/config.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 050cd5066ccf..055910fc6b19 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -271,6 +271,8 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  	buffer += d->bLength;
>  	size -= d->bLength;
>  
> +	if (d->bDescriptorType != USB_DT_ENDPOINT)
> +		goto skip_to_next_endpoint_or_interface_descriptor;
>  	if (d->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE)
>  		n = USB_DT_ENDPOINT_AUDIO_SIZE;
>  	else if (d->bLength >= USB_DT_ENDPOINT_SIZE)

Not needed, because usb_parse_interface() calls find_next_descriptor() 
to find an endpoint descriptor or another interface descriptor before 
the first time it calls usb_parse_endpoint().

Alan Stern

