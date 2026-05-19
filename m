Return-Path: <linux-usb+bounces-37713-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNJhL6FrDGo8hQUAu9opvQ
	(envelope-from <linux-usb+bounces-37713-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 15:54:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DB158011B
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 15:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9652130379B8
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4E335202C;
	Tue, 19 May 2026 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOTNR3/P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E91D3E6DEC;
	Tue, 19 May 2026 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198684; cv=none; b=pfp4EKjxnYpM37ReRCWyhlyDUwd9t2XMrb0ih0DueguUC1dhe8Y3wmuWjwZSPZOHGHuy2YNmb9rEIN2zdEytot9rYZt5bnv5lNWKKXM1pEWW6vBXaCZe4z7hkdOz2j6o8Ve2fXcwFImuT621GrvN1KaxieObdvTG4VotIky677E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198684; c=relaxed/simple;
	bh=8PxQx7xO6NfDg8JYYuTnRZ1NDdk7IhN6g+QQb68VNic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esNUQWg+BARhRFIPKkNeZDp+32NbI84d8dGE5dK9n2BPrLWrUJRxlFeLQX5S2TEsKSYsGLlYeDZosuNXg2EgH/+qrB6fmXa6i0+opgrwop6q9G0ZkfYo/zUFuc4Ro2jTUuNBbHqoDfHCxjNwa9z3F3roIvu3OvSum59wY0dZ6vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EOTNR3/P; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779198682; x=1810734682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8PxQx7xO6NfDg8JYYuTnRZ1NDdk7IhN6g+QQb68VNic=;
  b=EOTNR3/PpkXGW1hGLB7Kkqqzi9MLttoTI7AaPRnCQNnoHyZqw/dyi/S1
   vDk9NNis5k/FsNcf0WoHOPAoxFoEKGk5C3SGYinDVwzCHiIUTgRgW91Ro
   mh6lpE9SXD07kmpmdtQyk9LtjzaNbWoBUyqW8ug+NoXdN4WbTM06BI4sn
   KDokfMuYjGMS5cinF3kHcLNe+lyX1c3tcqrgy7a2hl5AEbI2m3DTMXfTW
   lGOJrBZ0ODmXGOWIJm3KvH7aMjDgnmnVzDjgH1Rihx7YQSksc6vQe32Qk
   BwTM2v824X8WORpnH8P+qHWLinLh0fi7Sj5aFRBSdKbluXLCXn5tWGsoR
   g==;
X-CSE-ConnectionGUID: 6E4Bs3HlSEScBdnhIQNFDg==
X-CSE-MsgGUID: J2j7e4xNRxSAmDHoomCang==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="97643923"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97643923"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 06:51:21 -0700
X-CSE-ConnectionGUID: KI2FzNxGTmCSjK3IWAbxnw==
X-CSE-MsgGUID: IhqVIyN9T/S8vTGjiYEmAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="244761919"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 19 May 2026 06:51:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 1FC0395; Tue, 19 May 2026 15:51:19 +0200 (CEST)
Date: Tue, 19 May 2026 16:51:07 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpci: add DRM DP HPD bridge support
Message-ID: <agxqyzMwxYcVQU4F@kuha>
References: <20260513-tcpci-drm-bridge-v1-1-1467e770727d@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-tcpci-drm-bridge-v1-1-1467e770727d@flipper.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37713-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,flipper.net:email]
X-Rspamd-Queue-Id: 24DB158011B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Alexey,

On Wed, May 13, 2026 at 05:43:16PM +0400, Alexey Charkov wrote:
> Add support to use TCPCI based USB-C connectors with the DP AltMode
> helper code on devicetree based platforms.

We should be getting a generic HPD bridge, I think that should work
in this case as well:
https://lore.kernel.org/lkml/20260304094152.92-2-kernel@airkyi.com/

Can you please check that?

thanks,

> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  drivers/usb/typec/tcpm/Kconfig |  2 ++
>  drivers/usb/typec/tcpm/tcpci.c | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 00baa7503d45..53abde8ebef9 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -13,7 +13,9 @@ if TYPEC_TCPM
>  
>  config TYPEC_TCPCI
>  	tristate "Type-C Port Controller Interface driver"
> +	depends on DRM || DRM=n
>  	depends on I2C
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>  	select REGMAP_I2C
>  	help
>  	  Type-C Port Controller driver for TCPCI-compliant controller.
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 0148b8f50412..e6cccbd377f7 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -5,6 +5,7 @@
>   * USB Type-C Port Controller Interface.
>   */
>  
> +#include <drm/bridge/aux-bridge.h>
>  #include <linux/bitfield.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> @@ -837,6 +838,7 @@ static int tcpci_parse_config(struct tcpci *tcpci)
>  
>  struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
>  {
> +	struct auxiliary_device *bridge_dev;
>  	struct tcpci *tcpci;
>  	int err;
>  
> @@ -889,12 +891,23 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
>  	if (err < 0)
>  		return ERR_PTR(err);
>  
> +	bridge_dev = devm_drm_dp_hpd_bridge_alloc(tcpci->dev, to_of_node(tcpci->tcpc.fwnode));
> +	if (IS_ERR(bridge_dev))
> +		return ERR_CAST(bridge_dev);
> +
>  	tcpci->port = tcpm_register_port(tcpci->dev, &tcpci->tcpc);
>  	if (IS_ERR(tcpci->port)) {
>  		fwnode_handle_put(tcpci->tcpc.fwnode);
>  		return ERR_CAST(tcpci->port);
>  	}
>  
> +	err = devm_drm_dp_hpd_bridge_add(tcpci->dev, bridge_dev);
> +	if (err < 0) {
> +		tcpm_unregister_port(tcpci->port);
> +		fwnode_handle_put(tcpci->tcpc.fwnode);
> +		return ERR_PTR(err);
> +	}
> +
>  	return tcpci;
>  }
>  EXPORT_SYMBOL_GPL(tcpci_register_port);
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260513-tcpci-drm-bridge-d8dc384d71ee
> 
> Best regards,
> -- 
> Alexey Charkov <alchark@flipper.net>

-- 
heikki

