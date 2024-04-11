Return-Path: <linux-usb+bounces-9282-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE898A1C51
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 19:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 514121F2890C
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 17:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0007B33F2;
	Thu, 11 Apr 2024 16:16:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 5EBE215FA80
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712852188; cv=none; b=ktvcIXbPSgKbanDPWIkZi34BiXdjlm+JLgjyZh0qA0trd+GdZp+OZElJmE8aONyPA4JdO8AcLL/EDAkIWHjnV5A3XpO8zfNjwmHBN8xhHPVBWdaJiDyM88GHNrRcTCCo4CjGylrOa7u4vgr8Q7caWh0W8IExFECzzmIIXWQE4AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712852188; c=relaxed/simple;
	bh=BA7UOBAtcSY5Jcpn2LkpUiEYqU0HlhefPdBZaWP3i1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oe4RowVMr8IHqa4FYbtqbyWDaEhV0IBfl7wefiPYBqNhldtODwx/d0VQO1GJdWdHNeQi8tNeUvB6nKnpPopn1/LZ/LT9cs6sBkDpm4yxMV3M2H6CWeNVslrDP4RbRytKkGZl1P4xziz2UIrR1AF0d7iXYIG3JPlTydkb25c8YLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 250368 invoked by uid 1000); 11 Apr 2024 12:16:25 -0400
Date: Thu, 11 Apr 2024 12:16:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC 6/6] usb: config: find_next_descriptor can overflow buffer
Message-ID: <60ad016c-3fb3-45ef-bb36-4a4acdccc1cc@rowland.harvard.edu>
References: <20240411124722.17343-1-oneukum@suse.com>
 <20240411124722.17343-7-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411124722.17343-7-oneukum@suse.com>

On Thu, Apr 11, 2024 at 02:43:04PM +0200, Oliver Neukum wrote:
> If you parse a data structure you cannot
> just test whether the remainder of your buffer holds
> data. It needs to hold a full data structure.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 50acc9021247..43c5ed256e6e 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -32,7 +32,7 @@ static int find_next_descriptor(unsigned char *buffer, int size,
>  	unsigned char *buffer0 = buffer;
>  
>  	/* Find the next descriptor of type dt1 or dt2 */
> -	while (size > 0) {
> +	while (size >= sizeof(struct usb_descriptor_header)) {
>  		h = (struct usb_descriptor_header *) buffer;
>  		if (h->bDescriptorType == dt1 || h->bDescriptorType == dt2)
>  			break;

In fact, I don't think this is needed at all.  These checks are already 
present in usb_parse_configuration().

Alan Stern

