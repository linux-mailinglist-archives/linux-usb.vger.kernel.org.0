Return-Path: <linux-usb+bounces-5452-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C5383A9FB
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 13:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2251289696
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 12:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0394176918;
	Wed, 24 Jan 2024 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l1BKyYk3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA8D77F00
	for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 12:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099923; cv=none; b=XEpGseQXwV5TarV2mlyLT4s84Lg3Jhf6ba9+/C9wqOY1OyHvESI2kUfgsBDsU5oj7cxaTVH8iPGqWwRzhfUEAHVGjARoBmGZwpUW4JrOUuJ5rQSiAyFKQfoWUI1DE7xQlI9eh9C2cDABOneA/Mv0zfF6R9GK3vB95TRv1MSYiVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099923; c=relaxed/simple;
	bh=s/6X1jfbWg5SPsmbbo6NpG2z8YgS6nM1iMLyo/sQf9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWMwAekqqgl8bOrZvzgOLfNOpyVUMOADnwBillrybrodzLKj0PpNJrXKtl2zh0ze4UorZTZuoo15Fln1tjS+GzV+yaq8ol4dtyCosp/YhHzwYFLe1SEP4fLt6dnsbFqaVjY4vpsubJ/tlHrWmu6KrH0Dux87WoaUK8/B+Hg6ZoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l1BKyYk3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA833C433C7;
	Wed, 24 Jan 2024 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706099923;
	bh=s/6X1jfbWg5SPsmbbo6NpG2z8YgS6nM1iMLyo/sQf9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1BKyYk3t3S242RtPVLzYXnfXTp/P13eSHqezd0ABWgop+lPUP5iLv5VRm1kqL9vY
	 qZe4vZoJmybRn80jhZIGNYwSaoNJ7IWURRY0FL3H6kYd41wBdv4RBmna6eHoQF9iqG
	 JKsM6JxTJDIHlHUh7yXOlXyyOguWwTbEVQAtCk2s=
Date: Wed, 24 Jan 2024 04:38:41 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: benjamin.tissoires@redhat.com, hdegoede@redhat.com,
	ivan.orlov0322@gmail.com, heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
	stern@rowland.harvard.edu
Subject: Re: [PATCH v2 2/2] usb: roles: don't get/set_role() when
 usb_role_switch is unregistered
Message-ID: <2024012442-delivery-knee-503a@gregkh>
References: <20240124064554.1263339-1-xu.yang_2@nxp.com>
 <20240124064554.1263339-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124064554.1263339-2-xu.yang_2@nxp.com>

On Wed, Jan 24, 2024 at 02:45:54PM +0800, Xu Yang wrote:
> There is a possibility that usb_role_switch device is unregistered before
> the user put usb_role_switch. In this case, the user may still want to
> get/set_role() since the user can't sense the changes of usb_role_switch.
> 
> This will add a flag to show if usb_role_switch is already registered and
> avoid unwanted behaviors.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - new patch during test patch 1
>  - add registered flag
> ---
>  drivers/usb/roles/class.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index 2bad038fb9ad..70165dd86b5d 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -23,6 +23,7 @@ struct usb_role_switch {
>  	struct mutex lock; /* device lock*/
>  	struct module *module; /* the module this device depends on */
>  	enum usb_role role;
> +	bool registered;
>  
>  	/* From descriptor */
>  	struct device *usb2_port;
> @@ -49,6 +50,9 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
>  	if (IS_ERR_OR_NULL(sw))
>  		return 0;
>  
> +	if (!sw->registered)
> +		return -EOPNOTSUPP;

What's to prevent this from changing right after you check it?

And why is this patch not cc: stable and have a fixes tag if it resolves
a real issue for people?

thanks,

greg k-h

