Return-Path: <linux-usb+bounces-33771-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDOwNY40oWmFrAQAu9opvQ
	(envelope-from <linux-usb+bounces-33771-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 07:07:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EADD1B309C
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 07:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 608653030FF4
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 06:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE1B3E95A9;
	Fri, 27 Feb 2026 06:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q+cNVch/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06D0361DBB;
	Fri, 27 Feb 2026 06:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772172425; cv=none; b=tB7Ed+m5bk36Mffsa9GYQmfacbT7IuxLBy8PMwuI6vOKtwGmYHuB8Z7housbK6xZUtJQ+N7gk38Xn2rE1t6XaQ93c4j0j4t4keox3fE0ey9K+4vrVm/P4BXoWwhZHYamboVX/hS/2rLVEaIAzrmtLgvB0F1kCNAcuWZ1QnqorRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772172425; c=relaxed/simple;
	bh=GIu75fxn2gITTgLlJDiazqpWbQhvH+iRh5dVBHubTOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9vhs7DT9CgMnyR35OwayVaYcBysUVoyeo1xpYiXWlRzFpgdl3OHZtmfkaMVGGUInpLUHVAYIqJpImLH/mbGOv+C02aEoTAftn71KT8Dk2z8Sg4XS7gpAkat6ZMte3JjqXVPGLbwntZ7RuLR6j7o9s5iaEz3ev5OtjAuCHw5kD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=q+cNVch/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E1BC116C6;
	Fri, 27 Feb 2026 06:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772172424;
	bh=GIu75fxn2gITTgLlJDiazqpWbQhvH+iRh5dVBHubTOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q+cNVch/M4M9gcpY+VBBHOPT/p+9K8ARcEVZsl8aalkhDSdx2Wonj4qZ17hfJ+8IB
	 xVG+AaWWqhFkQfnYBi4/PErSKeewBHEh/M0df+v/GR5kQ76pqe8HUzD+Z/GesKE98J
	 j5m8vCViUp9b768WoXi2MzCbM4a7XEEnrorF9mc0=
Date: Thu, 26 Feb 2026 22:06:56 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: new quirk to handle devices with zero
 configurations
Message-ID: <2026022652-padding-backlight-ae49@gregkh>
References: <20260227060400.1480039-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227060400.1480039-1-dengjie03@kylinos.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33771-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7EADD1B309C
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 02:04:00PM +0800, Jie Deng wrote:
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
> 
> Add a new quirk USB_QUIRK_FORCE_ONE_CONFIG to handle such devices.
> When this quirk is set, assume the device has 1 configuration instead
> of failing with -EINVAL.
> 
> This quirk is applied to the device with VID:PID 5131:2007 which
> exhibits this behavior.
> 
> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
> ---
> 
> Changes in v2:
> - Modify the sequence number of the quirks parameter
> - Add the judgment condition of ncfg < 1
> Link to v1: https://lore.kernel.org/linux-usb/
> f7999b43-b6e2-44f4-b8e1-c2b5f5d04a5c@kylinos.cn/T/#mb5246d3b3e3bbb334c046bfa9a69b988f2d0688a
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  drivers/usb/core/config.c                       | 7 ++++++-
>  drivers/usb/core/quirks.c                       | 5 +++++
>  include/linux/usb/quirks.h                      | 3 +++
>  4 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb850e5290c2..7d907efe9f49 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -8183,6 +8183,9 @@ Kernel parameters
>  				p = USB_QUIRK_SHORT_SET_ADDRESS_REQ_TIMEOUT
>  					(Reduce timeout of the SET_ADDRESS
>  					request from 5000 ms to 500 ms);
> +				q = USB_QUIRK_FORCE_ONE_CONFIG (Device
> +					claims zero configurations,
> +					forcing to 1);
>  			Example: quirks=0781:5580:bk,0a5c:5834:gij
>  
>  	usbhid.mousepoll=
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 1cd5fa61dc76..832717549515 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -927,7 +927,12 @@ int usb_get_configuration(struct usb_device *dev)
>  		dev->descriptor.bNumConfigurations = ncfg = USB_MAXCONFIG;
>  	}
>  
> -	if (ncfg < 1) {
> +	if (ncfg < 1 && dev->quirks & USB_QUIRK_FORCE_ONE_CONFIG) {
> +		dev_info(ddev, "Device claims zero configurations, "
> +				"forcing to 1\n");

Do not break a string like this, make it all one line please.
checkpatch should have warned you about this?

thanks,

greg k-h

