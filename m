Return-Path: <linux-usb+bounces-32003-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A92CFE7EA
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 16:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8EA830549B7
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 15:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BA0349AE7;
	Wed,  7 Jan 2026 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NN4XSDO/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A98348879;
	Wed,  7 Jan 2026 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798230; cv=none; b=S50J8xiZyG/7AlXVzgMsdmC6Rdbrb2CknHguSJfGiBMhZWbCRLApntsz7x5dz24nYT2zGaTO9Hy1JgZPKfkeblc/BtR461MUuPxTMBn3kxFAkb7b8Xc4Tt/1A6xwLekJxCmbFLrsWNl0hFqAmP/KDSKcaDLoHaFk5L2lpyFKZXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798230; c=relaxed/simple;
	bh=1j7/+eme4+hD48NodWUYUdYb0sr9+/+ODH6I4gtmzsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVoLLp6eDk/ljh8/Rm/bVC+yfzu1qh+NQEO+Jlgpep03Aqo8Ne65yddeJKBR+GwWOwdT+7WjdgOXiNcV3kvJ8cP1x2YOxqzBVSCP+B/QjpUcVMLR58O9H+jTNbqg5Dkw+s0xMhCaWudME5x40FDvQiRSxSG0V/Wrp95OFBFKVEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NN4XSDO/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D273C19423;
	Wed,  7 Jan 2026 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767798230;
	bh=1j7/+eme4+hD48NodWUYUdYb0sr9+/+ODH6I4gtmzsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NN4XSDO/Tt6ubM35cNgYxNITT3NL9YzC+1uT7OEQCyIxpKREAP4GsKveAN+KXy+PA
	 ZSGOvReV4kDq8yuU3uJtWDC0/8xzVv1Q/YAg1qZ8i5dYbkR62JlUJRTQjwvs7g8nfC
	 5X/7vEP09Xp0i6SfI7Iae067q/fSOaFIYre7mTTI=
Date: Wed, 7 Jan 2026 16:03:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, oneukum@suse.com,
	linux-kernel@vger.kernel.org, naveen.v@harman.com,
	sankarkumar.krishnasamy@harman.com
Subject: Re: [PATCH v2 3/3] usb: hub: send enumeration failure uevent
Message-ID: <2026010740-rotunda-squirt-921f@gregkh>
References: <2025100805-resisting-target-419a@gregkh>
 <20251224115808.415753-1-Akshay.Gujar@harman.com>
 <20251224115808.415753-4-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224115808.415753-4-Akshay.Gujar@harman.com>

On Wed, Dec 24, 2025 at 11:58:08AM +0000, Akshay Gujar wrote:
> Use the device_enumeration_failure_notify() helper when USB device
> enumeration fails. This supplements the existing kernel log message with
> a structured userspace-visible notification identifying the affected
> port.
> 
> Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
> ---
>  drivers/usb/core/hub.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index be50d03034a9..c1963b1bb9fb 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -5613,9 +5613,12 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
>  	if (hub->hdev->parent ||
>  			!hcd->driver->port_handed_over ||
>  			!(hcd->driver->port_handed_over)(hcd, port1)) {
> -		if (status != -ENOTCONN && status != -ENODEV)
> +		if (status != -ENOTCONN && status != -ENODEV) {
>  			dev_err(&port_dev->dev,
>  					"unable to enumerate USB device\n");
> +			device_enumeration_failure_notify(port_dev->dev.parent,

Why use the parent here?  Normally devices can NOT access their parent
pointer "safely" so this feels odd.  Why not have the device itself be
the one that emits this, as that's what dev_err() just gave us.

> +							  dev_name(&port_dev->dev));

Why not just get the name directly from the device you are going to pass
in?  It shouldn't then be needed again, right?

thanks,

greg k-h

