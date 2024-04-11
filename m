Return-Path: <linux-usb+bounces-9277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E8B8A1A2B
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 18:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73B87282E97
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 16:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08271C821A;
	Thu, 11 Apr 2024 15:39:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 4E0331CD78C
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712849944; cv=none; b=hNdkrhvCfndFsaJrpzoIilTGKhBIyRMkZlPtg13KtkOc8Aj2X0DAlJ6UXwGS9/8GUh0Y23/X+9ldzRZBmHkuBN638fgwa8J0Rfw8IB1s5SLcBTa6OK0b9tY4I/uvN9+F2kwG7Bnj9QqJVcvQFFxedc0pXF0dLr3+SlIHR5ULD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712849944; c=relaxed/simple;
	bh=EugFuEeveeJvhiT7ihISCs5Gf+zZyCJpSRsBQmEglwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrrHjcZFvo5qICXmc26nTtVQp7DrCGJEZnNwpHYYs3LDqWTjubbg1eEroiMLQm+SH4Z7Sdi2XDLrO2RMD26po2jFzssi61+ngkwo8fG+MM8IjeIZmuF5jTDknjdY5FtbrULQ00wWBPiweejEpHssYcv8WFiugYTHtio7udalIAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 249015 invoked by uid 1000); 11 Apr 2024 11:39:01 -0400
Date: Thu, 11 Apr 2024 11:39:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC 2/6] usb: avoid overrunning a buffer in usb_parse_interface
Message-ID: <05af3e08-362f-424c-96e1-2965c55b7212@rowland.harvard.edu>
References: <20240411124722.17343-1-oneukum@suse.com>
 <20240411124722.17343-3-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411124722.17343-3-oneukum@suse.com>

On Thu, Apr 11, 2024 at 02:43:00PM +0200, Oliver Neukum wrote:
> We must not touch bDescriptorType if it is not within our buffer.
> To guarantee that we have to be sure the first two bytes of the
> descriptor are within the buffer.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index c7056b123d46..5891652b6202 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -575,7 +575,7 @@ static int usb_parse_interface(struct device *ddev, int cfgno,
>  
>  	/* Parse all the endpoint descriptors */
>  	n = 0;
> -	while (size > 0) {
> +	while (size >= sizeof(struct usb_descriptor_header)) { /* minimum length to get bDescriptorType */
>  		if (((struct usb_descriptor_header *) buffer)->bDescriptorType
>  		     == USB_DT_INTERFACE)
>  			break;

I would omit the comment (the point seems pretty obvious even though I 
never noticed it before), but there's nothing wrong with having it.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

