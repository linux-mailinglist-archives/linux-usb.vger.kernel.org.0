Return-Path: <linux-usb+bounces-34563-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOgBADRzsWlVvAIAu9opvQ
	(envelope-from <linux-usb+bounces-34563-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:50:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B1264D7D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DFA9304AA38
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA69B331202;
	Wed, 11 Mar 2026 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0LdjQgh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E953246EB;
	Wed, 11 Mar 2026 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236684; cv=none; b=IGdpexnpwlYpVZxfcTdvASoZ5sRGRmvb7NWBwU7KQNagoHRrlxYpcEYAS76Vx7hSO/VHPfpxYb84M9hrFCvqqUbO0WLLmTh3C0z3lfEj9PwhDEDXVG/nrKfPcnisqaiJ/WpstV1c29xNxjkFMLMLuFCoo/dd4Lvh1ozIw/TXLLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236684; c=relaxed/simple;
	bh=M+85F0iw//RmpY0Vyatx6+pqHbwS2nU9O2LhkVCgnXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niT+IPe7lGK00WDFJ5JlLI94xJ4OPDTjErQJ2VGiGef2bM6cOWOmIMOQqFg8Yql8Y1rb9TeatA+Xizyw2a32iFo28dxKKtKz9Uv20HAlx88QOs7SMFeV1TJmSyBGo3sR/B7OBWPs4+mDdNnaEeFqECYf8Zldp0y9hMep5f+8/2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0LdjQgh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773236682; x=1804772682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M+85F0iw//RmpY0Vyatx6+pqHbwS2nU9O2LhkVCgnXw=;
  b=b0LdjQghHFezS3LUuCDUxlCjhJUkwhIBTp+DTZK4fp2J6TbL6gt3YjWq
   0B9LLJ8nkLW6Th0LPMBFgNCGyCPiApXq/rEDZk/IGgV99I2cwavuyRxrb
   IN10BEezWAkQkh8SUnu0gXSKaf1cD9GbrTacwFSZTUD+FTgykv0etfr0r
   ve2goAnI5zknQM4fX3TIKxLVwi3LyYTv5nier23s1jEya0PwgqqcJbH0z
   SaoFHIR2wRbHmAS/MtJtetcKtgAtgf+hMJ4vyFCVhYgcA3CXubpBg9DaP
   FKkiRSlK6BOxOtB23RwdszuHxEMiSWUp3fPtgh1W5GN4N0RnQhqfTiAZf
   Q==;
X-CSE-ConnectionGUID: 1ZR751u4S2aIw22LX6EkEg==
X-CSE-MsgGUID: v6fzDQZAQ7GklyG1oUrYyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74213851"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74213851"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:44:41 -0700
X-CSE-ConnectionGUID: 40xNvqfoR8ekLrkVhns5NQ==
X-CSE-MsgGUID: Ki/5RhmoQkq9hAiw+QGqkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217135190"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 11 Mar 2026 06:44:39 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 80B1595; Wed, 11 Mar 2026 14:44:38 +0100 (CET)
Date: Wed, 11 Mar 2026 15:43:55 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Alexey Charkov <alchark@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] usb: typec: fusb302: add DRM DP HPD bridge support
Message-ID: <abFxm8i6swona50j@kuha>
References: <20260310-fusb302-drm-dp-hpd-bridge-v1-1-ffd41ef9afe3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-fusb302-drm-dp-hpd-bridge-v1-1-ffd41ef9afe3@collabora.com>
X-Rspamd-Queue-Id: 685B1264D7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org,collabora.com];
	TAGGED_FROM(0.00)[bounces-34563-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,0.0.0.22:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,2b010000:email,intel.com:dkim,intel.com:email,rk3576:email]
X-Rspamd-Action: no action

Tue, Mar 10, 2026 at 06:17:34PM +0100, Sebastian Reichel kirjoitti:
> Add support to use fusb302 based USB-C connectors with the DP altmode
> helper code on devicetree based platforms. To get this working there
> must be a DRM bridge chain from the DisplayPort controller to the USB-C
> connector. E.g. on Rockchip RK3576:
> 
> root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
> bridge[0]: dw_dp_bridge_funcs
> 	refcount: 7
> 	type: [10] DP
> 	OF: /soc/dp@27e40000:rockchip,rk3576-dp
> 	ops: [0x47] detect edid hpd
> bridge[1]: drm_aux_bridge_funcs
> 	refcount: 4
> 	type: [0] Unknown
> 	OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
> 	ops: [0x0]
> bridge[2]: drm_aux_hpd_bridge_funcs
> 	refcount: 5
> 	type: [10] DP
> 	OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
> 	ops: [0x4] hpd
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> To make this usable on Rockchip RK3588 and RK3576 platforms as shown in
> the commit message, the Designware DP driver and the USBDP PHY driver
> also need changes. Those are being send separately as the fusb302 patch
> can be merged completley independently.
> ---
>  drivers/usb/typec/tcpm/Kconfig   |  2 ++
>  drivers/usb/typec/tcpm/fusb302.c | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 8cdd84ca5d6f..00baa7503d45 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -58,6 +58,8 @@ config TYPEC_FUSB302
>  	tristate "Fairchild FUSB302 Type-C chip driver"
>  	depends on I2C
>  	depends on EXTCON || !EXTCON
> +	depends on DRM || DRM=n
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>  	help
>  	  The Fairchild FUSB302 Type-C chip driver that works with
>  	  Type-C Port Controller Manager to provide USB PD and USB
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 19ff8217818e..ce7069fb4be6 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -5,6 +5,7 @@
>   * Fairchild FUSB302 Type-C Chip Driver
>   */
>  
> +#include <drm/bridge/aux-bridge.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/errno.h>
> @@ -1689,6 +1690,7 @@ static int fusb302_probe(struct i2c_client *client)
>  {
>  	struct fusb302_chip *chip;
>  	struct i2c_adapter *adapter = client->adapter;
> +	struct auxiliary_device *bridge_dev;
>  	struct device *dev = &client->dev;
>  	const char *name;
>  	int ret = 0;
> @@ -1747,6 +1749,13 @@ static int fusb302_probe(struct i2c_client *client)
>  		goto destroy_workqueue;
>  	}
>  
> +	bridge_dev = devm_drm_dp_hpd_bridge_alloc(chip->dev, to_of_node(chip->tcpc_dev.fwnode));
> +	if (IS_ERR(bridge_dev)) {
> +		ret = PTR_ERR(bridge_dev);
> +		dev_err_probe(chip->dev, ret, "failed to alloc bridge\n");
> +		goto destroy_workqueue;
> +	}
> +
>  	chip->tcpm_port = tcpm_register_port(&client->dev, &chip->tcpc_dev);
>  	if (IS_ERR(chip->tcpm_port)) {
>  		fwnode_handle_put(chip->tcpc_dev.fwnode);
> @@ -1764,6 +1773,10 @@ static int fusb302_probe(struct i2c_client *client)
>  	enable_irq_wake(chip->gpio_int_n_irq);
>  	i2c_set_clientdata(client, chip);
>  
> +	ret = devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
> +	if (ret)
> +		return ret;
> +
>  	return ret;
>  
>  tcpm_unregister_port:
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260310-fusb302-drm-dp-hpd-bridge-00f6c9aec3ab
> 
> Best regards,
> -- 
> Sebastian Reichel <sebastian.reichel@collabora.com>

-- 
heikki

