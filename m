Return-Path: <linux-usb+bounces-35030-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HZOO21lumklWAIAu9opvQ
	(envelope-from <linux-usb+bounces-35030-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:42:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF62B8419
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D318D3041C90
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 08:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF0138654C;
	Wed, 18 Mar 2026 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6TuTikG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1CC36A02F;
	Wed, 18 Mar 2026 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823253; cv=none; b=SAopx3TvJojBGXzyG+bGVf02CdraLXfiVp7Taz1iwGmJZlivKGPdEcxjzB8d2ITzn8T/mcorjEdtKAvg7kYjw70qBxiKaoY1qYSEKsPN1xvCA6Dy0OKRSOZScTdhYG8qW6VfokyMODLyIhbrATFSXPlN9w7xmJk2F3iWa8XcU+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823253; c=relaxed/simple;
	bh=w/wvZV8mEJ2nmUP5hFKuTv6oekBv+2JY4z4KU9pL4o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uV+C5hSZ4VqFWu6fxWJbFwweMjUUqGn50rdqFubqTnIy8ibo4U8FA1swibFSOPvwT33QhcRrhLC5PR79BIP/ff7GZhN93p7QYCHEXni94FBq+himFU0a+GByC8WlIoPV+21N/44ZmEguiZCt7VxQnp0/oEsWS4Je27pJeoWdcug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6TuTikG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED52EC19421;
	Wed, 18 Mar 2026 08:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773823253;
	bh=w/wvZV8mEJ2nmUP5hFKuTv6oekBv+2JY4z4KU9pL4o4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6TuTikGgzrCAcjcuI+NHxt3KfsDGO0OfmoThHvpJ4T8MnWaxevKmWKTPIzPV+5ZP
	 Xwpw4ai3lIZzogE/4myEtpfM62Nw3w3OXEyNvTJSak0M7OOqJC3T8MHWQnTUj0G3p4
	 /UyB3oMIIFQMvpCk8D7FSkqBjFYjHELT6sJcoxrEZdq9aRptm2tdyUVQEUxU2bdFgS
	 TarzIs5yDimieXoixRDhkEGcX9ruo1tIrLkCGtPGNW8iA2DVcszOrvxMZbUI6bi4p2
	 JsBIabT6fa9EWNjcSk2B4/uv3BlI/1he5LuCt+w9NY41RF2r4wbfhuenVjckSEVxN5
	 ZfxPgSsWernKA==
Date: Wed, 18 Mar 2026 09:40:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Junzhong Pan <panjunzhong@linux.spacemit.com>, Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: misc: onboard_usb_dev: Add Terminus FE1.1s
 USB2.0 Hub (1a40:0101)
Message-ID: <20260318-discreet-rampant-cormorant-ab12c6@quoll>
References: <20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org>
 <20260317-03-usb-hub-fe1-v1-3-71ec3989f5be@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-03-usb-hub-fe1-v1-3-71ec3989f5be@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-35030-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,chromium.org,linux.spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_WP_URI(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,terminus-usa.com:url]
X-Rspamd-Queue-Id: D2CF62B8419
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 08:55:04AM +0000, Yixun Lan wrote:
> Terminus FE1.1s is USB2.0 protocol compliant 4-port USB HUB, It support
> MTT (Multiple Transaction Translator) mode, the upstream port supports
> high-speed 480MHz and full-speed 12MHz modes, also it has integrated 5V
> to 3.3V/1.8V regulator and Power-On-Reset circuit.
> 
> Link: https://terminus-usa.com/wp-content/uploads/2024/06/FE1.1s-Product-Brief-Rev.-2.0-2023.pdf [1]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 2 ++
>  drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index ba37eb99efba..5732843c6687 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -570,6 +570,7 @@ static struct platform_driver onboard_dev_driver = {
>  #define VENDOR_ID_MICROCHIP	0x0424
>  #define VENDOR_ID_PARADE	0x1da0
>  #define VENDOR_ID_REALTEK	0x0bda
> +#define VENDOR_ID_TERMINUS	0x1a40
>  #define VENDOR_ID_TI		0x0451
>  #define VENDOR_ID_VIA		0x2109
>  #define VENDOR_ID_XMOS		0x20B1
> @@ -673,6 +674,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 HUB */
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 HUB */
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0179) }, /* RTL8188ETV 2.4GHz WiFi */
> +	{ USB_DEVICE(VENDOR_ID_TERMINUS, 0x0101) }, /* Terminus FE1.1s 2.0 HUB */
>  	{ USB_DEVICE(VENDOR_ID_TI, 0x8025) }, /* TI USB8020B 3.0 HUB */
>  	{ USB_DEVICE(VENDOR_ID_TI, 0x8027) }, /* TI USB8020B 2.0 HUB */
>  	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 HUB */
> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> index 1a1e86e60e04..4efc5f44c4ee 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -108,6 +108,13 @@ static const struct onboard_dev_pdata genesys_gl852g_data = {
>  	.is_hub = true,
>  };
>  
> +static const struct onboard_dev_pdata terminus_fe11s_data = {
> +	.reset_us = 10,
> +	.num_supplies = 1,
> +	.supply_names = { "vdd" },
> +	.is_hub = true,
> +};

So same as vialab_vl817_data, use that one.

Best regards,
Krzysztof


