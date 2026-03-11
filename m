Return-Path: <linux-usb+bounces-34577-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOA1HK2AsWmjCwAAu9opvQ
	(envelope-from <linux-usb+bounces-34577-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:48:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D07F5265AF8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 376FB307DB13
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1173CEB98;
	Wed, 11 Mar 2026 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xfu8eihH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BF52E2665;
	Wed, 11 Mar 2026 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240273; cv=none; b=faOJO0UGGbnosVHezmU3Hw+BSHbgGsxIjJhiJfDCfgE6yzDEx+TDv4Vi15vPZ6f1wkvXJ6BMB7/mFOOeHazYERAzQbxdX4dd76lhB7ITEwqK+DcJgoUpHin54WG9HZlQKRx/gASwm1EEiuojE0V0R6Kxw191jGURbkFLWpY/hZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240273; c=relaxed/simple;
	bh=65eArto0BGYnh7OXoodToq5GHQ+i+lokx4dNJhi6SO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdcWzIQx81i8cXGAV/8MFo3aB6aF+eGm/UbmVJi5BpV0Dg4LEBj9KDwRpOXNpnOUwp4C00BaAt2rL/6hgDH2bYV1PJxVwXJ62YcLtHOZDNTq6VFcPw9BDfK9YGvm7ioncAuRVBifZFdjLTN+0x9LLXdcd+ASmS/HjDSHnpwcnO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Xfu8eihH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D48FC4CEF7;
	Wed, 11 Mar 2026 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773240273;
	bh=65eArto0BGYnh7OXoodToq5GHQ+i+lokx4dNJhi6SO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xfu8eihHE54zrXRV48tXn1FX1l77O5RbzAfe8tMYqMw8/E+LyRIgtimCeC+JkJe/Y
	 1VpB8+5TCN2MU12yxXReY5EnUYXQj6+Zzv5ycUla0E1PeJyOFREEg9JAf+VR4JfBXV
	 A9fyAWwSUAplfjNxI0uuT6I6tAPKfuKfPapMEU+k=
Date: Wed, 11 Mar 2026 15:44:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v5 2/4] usb: hub: add infrastructure to pass onboard_dev
 port features
Message-ID: <2026031101-rut-storable-7def@gregkh>
References: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
 <20260223-v6-16-topic-usb-onboard-dev-v5-2-28d3018a8026@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-v6-16-topic-usb-onboard-dev-v5-2-28d3018a8026@pengutronix.de>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34577-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,chromium.org,vger.kernel.org,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: D07F5265AF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Feb 23, 2026 at 12:27:35PM +0100, Marco Felsch wrote:
> On board devices may require special handling for en-/disable port
> features due to PCB design decisions e.g. enable/disable the VBUS power
> on the port via a host controlled regulator or GPIO.
> 
> This commit adds the necessary infrastructure to prepare the common code
> base for such use-cases.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/usb/core/hub.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  drivers/usb/core/hub.h |  2 ++
>  include/linux/usb.h    |  3 +++
>  3 files changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 24960ba9caa915f12a4f5582269808fdebd1ee11..9fdfd2f0aacc9b1994cd3761330968e052167c67 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -453,9 +453,19 @@ static int clear_hub_feature(struct usb_device *hdev, int feature)
>   */
>  int usb_clear_port_feature(struct usb_device *hdev, int port1, int feature)
>  {
> -	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
> +	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
> +	int ret;
> +
> +	ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
>  		USB_REQ_CLEAR_FEATURE, USB_RT_PORT, feature, port1,
>  		NULL, 0, 1000);
> +	if (ret)
> +		return ret;
> +
> +	if (hub->onboard_hub_clear_port_feature)
> +		ret = hub->onboard_hub_clear_port_feature(hdev, feature, port1);
> +
> +	return ret;
>  }
>  
>  /*
> @@ -463,9 +473,19 @@ int usb_clear_port_feature(struct usb_device *hdev, int port1, int feature)
>   */
>  static int set_port_feature(struct usb_device *hdev, int port1, int feature)
>  {
> -	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
> +	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
> +	int ret;
> +
> +	ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
>  		USB_REQ_SET_FEATURE, USB_RT_PORT, feature, port1,
>  		NULL, 0, 1000);
> +	if (ret)
> +		return ret;
> +
> +	if (hub->onboard_hub_set_port_feature)
> +		ret = hub->onboard_hub_set_port_feature(hdev, feature, port1);
> +
> +	return ret;
>  }
>  
>  static char *to_led_name(int selector)
> @@ -6545,6 +6565,37 @@ void usb_hub_adjust_deviceremovable(struct usb_device *hdev,
>  	}
>  }
>  
> +/**
> + * usb_hub_register_port_feature_hooks - Register port set/get feature hooks
> + * @hdev: USB device belonging to the usb hub
> + * @set_port_feature: set_feature hook which gets called by the hub core
> + * @clear_port_feature: clear_feature hook which gets called by the hub core
> + *
> + * Register set/get_port_feature hooks for a onboard_dev hub.
> + */
> +void usb_hub_register_port_feature_hooks(struct usb_device *hdev,
> +		int (*set_port_feature)(struct usb_device *, int, int),
> +		int (*clear_port_feature)(struct usb_device *, int, int))

This should be a structure, don't force function pointers to be passed
in a function, that way lies madness :)

thanks,

greg k-h

