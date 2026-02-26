Return-Path: <linux-usb+bounces-33741-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAvSB5NaoGlPigQAu9opvQ
	(envelope-from <linux-usb+bounces-33741-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 15:37:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AED1A7B0E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 15:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCDC9317B1E8
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 14:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B493D1CC5;
	Thu, 26 Feb 2026 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2kM/iweh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A163C1996;
	Thu, 26 Feb 2026 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116101; cv=none; b=HI8V38CzSLBwysiEXKL+aLfTMJBOIHbXgATQLTZ607Ots0erCWU3patvCPPud0yMmK3xb9sNLByXP8CZlBrphndxInrzdzfzrW7f9lyBzldEMtgGHTEs3pnL6yxqphhT4xjoRiLvfnG8ibblej0/19P0iIyrpVi2W+B8t63eAmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116101; c=relaxed/simple;
	bh=h/Ht9sOd7QkAcbG9CxFnerLXL9ddwwrtd7ORZjFe+ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fG/eSgF2BCjwp/dmgzFw/jsFif2fUetdj1zSp65W1KgjZTPxGa3jGJ2oA6qeGJ8Ciyz+Qzdfh+7YQnE72+0akNzjvZADoJZbyhJ5WQR5B6ujKbacGcuOOIvhdeDsWWRxL5HiPnKwU06nKlpGi3DDsb4B3rQ5/5WojBPrlRq60MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2kM/iweh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3853BC116C6;
	Thu, 26 Feb 2026 14:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772116101;
	bh=h/Ht9sOd7QkAcbG9CxFnerLXL9ddwwrtd7ORZjFe+ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2kM/iwehz/0Q9bNjfRV1Du+0tLEm7aJOGE9isl68Xi+144i7/kecQ17Qtjq4rAFar
	 oltK6EMF4JS/uzbI/VWte1rVkEXjHKWToma1NdyFKitvu/+XyKxvWFsiuCt7fJFN9q
	 FMQ4rmJ2+aMuIhDTEclXsR41LV3wD0+S02f+NekE=
Date: Thu, 26 Feb 2026 06:28:12 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: new quirk to handle devices with zero
 configurations
Message-ID: <2026022600-employee-unjustly-3db4@gregkh>
References: <20260226094737.1306471-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226094737.1306471-1-dengjie03@kylinos.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33741-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Queue-Id: 74AED1A7B0E
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 05:47:37PM +0800, Jie Deng wrote:
> Some USB devices incorrectly report bNumConfigurations as 0 in their
> device descriptor, which causes the USB core to reject them during
> enumeration.
> logs:
> usb 1-2: device descriptor read/64, error -71
> usb 1-2: no configurations
> usb 1-2: can't read configurations, error -22
> 
> However, these devices actually work correctly when
> treated as having a single configuration.

Really?  Don't devices like this violate the USB spec?

> Add a new quirk USB_QUIRK_FORCE_ONE_CONFIG to handle such devices.
> When this quirk is set, assume the device has 1 configuration instead
> of failing with -EINVAL.
> 
> This quirk is applied to the device with VID:PID 5131:2007 which
> exhibits this behavior.
> 
> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  drivers/usb/core/config.c                       | 7 ++++++-
>  drivers/usb/core/quirks.c                       | 5 +++++
>  include/linux/usb/quirks.h                      | 3 +++
>  4 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb850e5290c2..63e6d3ebbd7a 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -8183,6 +8183,9 @@ Kernel parameters
>  				p = USB_QUIRK_SHORT_SET_ADDRESS_REQ_TIMEOUT
>  					(Reduce timeout of the SET_ADDRESS
>  					request from 5000 ms to 500 ms);
> +				r = USB_QUIRK_FORCE_ONE_CONFIG (Device
> +					claims zero configurations,
> +					forcing to 1);

Why "r"?

>  			Example: quirks=0781:5580:bk,0a5c:5834:gij
>  
>  	usbhid.mousepoll=
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 1cd5fa61dc76..f60fed224cbb 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -927,7 +927,12 @@ int usb_get_configuration(struct usb_device *dev)
>  		dev->descriptor.bNumConfigurations = ncfg = USB_MAXCONFIG;
>  	}
>  
> -	if (ncfg < 1) {
> +	if (dev->quirks & USB_QUIRK_FORCE_ONE_CONFIG) {
> +		dev_info(ddev, "Device claims zero configurations,
> +				forcing to 1\n");
> +		dev->descriptor.bNumConfigurations = 1;
> +		ncfg = 1;

But is the configuration descriptor actually present?  This feels odd to
me.

thanks,

greg k-h

