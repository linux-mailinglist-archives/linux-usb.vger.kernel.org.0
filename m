Return-Path: <linux-usb+bounces-33573-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O34Cr1unGmcGAQAu9opvQ
	(envelope-from <linux-usb+bounces-33573-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 16:14:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C841D178959
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 16:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C057D30ECBC8
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 15:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0468436604E;
	Mon, 23 Feb 2026 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyzD0+Ar"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5CD361DB2;
	Mon, 23 Feb 2026 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859397; cv=none; b=vAf4XU5jfKbp//9VxN7mMv1lJsApQYQgjASsu9XrJNqAhuvbyIaIRVgmkmv1fjeyYnfCsExQQAVBf+WQlwsn/UlZ7L1aiq1yaCqWLbK3qfxO5geKTm0iFzg7Cw8ZRTL7GUwiMPU6jaest+pPk6e2bgJm32yvtCSZTnkAM/X7rZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859397; c=relaxed/simple;
	bh=7jjEhk5eSkpUPZ2wUMVsvGO1xOkM1Vsxz54zPSGtqLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLpj2gSIK7JSHAHBthtpVJwOZyHjxIF/+K9z3WBkjpGBzMCQO21IbyAoFhaZskEXb4bYLHXC5v2XecgrPa+xHO6Wq6gWziEWbij8hdbTnI/wkVAqLeAD02/NI3LBWv36OpFE7KxljyO1A85242mlF0D4L1JER+mBA1oER05cBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyzD0+Ar; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771859396; x=1803395396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7jjEhk5eSkpUPZ2wUMVsvGO1xOkM1Vsxz54zPSGtqLA=;
  b=nyzD0+ArAYvJYi95kQ/xir7PV6VIFUmL7XrTsrtzvIZBFLhT+GoCyLyJ
   PE1Q8kXX1RfOMQtTasTUv0TInbr0rZTsDvKbb35crMR+pw4H+w6DZn+0D
   UpWvOip4l0DDOzqv6GcTVtmwFZLDOm66GdBgIOuc/md1SVO/eQsXH7BG0
   3rJVsvsLeg9LE2cxKj1/6MituOsPrV5uhX19NNNEUT/pJQILEi75rKnRC
   KZY845r+3DRpCN3lZ8nLI2UTIoKzWwKabDJ108Jm2mlQQ5OWAdHaTO2Z2
   DZoXDzBIsUi+MWDrbvrzSrrYFXBTzdUYm0UtORtmULJalUUpldOBfXrws
   Q==;
X-CSE-ConnectionGUID: MqTbjWb7RWyKE83Md3lTkQ==
X-CSE-MsgGUID: 8WVCb9zjSN2xBePDxSW+OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73032330"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="73032330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:09:56 -0800
X-CSE-ConnectionGUID: uB9UYbbKRgSgCT11C9d7eg==
X-CSE-MsgGUID: azbh2O5fRO2hjXqgFYZIXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="214816414"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.123])
  by orviesa010.jf.intel.com with SMTP; 23 Feb 2026 07:09:52 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 23 Feb 2026 17:09:17 +0200
Date: Mon, 23 Feb 2026 17:09:17 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: typec: tcpm: Add vid and chip info for Etek
 ET7304
Message-ID: <aZxtncdzuUejRVF3@kuha>
References: <20260220-et7304-v3-0-ede2d9634957@gmail.com>
 <20260220-et7304-v3-2-ede2d9634957@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-et7304-v3-2-ede2d9634957@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33573-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C841D178959
X-Rspamd-Action: no action

Fri, Feb 20, 2026 at 06:22:41AM +0000, Yuanshen Cao wrote:
> Move VID field to chip info to accommodate different VIDs.
> Add chip info for Etek Micro ET7304. ET7304 is functionally
> identical to the Richtek RT1715, with the only difference
> being the VID.
> 
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> index 88c50b984e8a..37cf55ad74f8 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -19,9 +19,11 @@
>  #include <linux/regulator/consumer.h>
>  
>  #define RT1711H_VID		0x29CF
> +#define ET7304_VID		0x6DCF
>  #define RT1711H_PID		0x1711
>  #define RT1711H_DID		0x2171
>  #define RT1715_DID		0x2173
> +#define ET7304_DID		0x2173
>  
>  #define RT1711H_PHYCTRL1	0x80
>  #define RT1711H_PHYCTRL2	0x81
> @@ -55,6 +57,7 @@
>  
>  struct rt1711h_chip_info {
>  	u32 rxdz_sel;
> +	u16 vid;
>  	u16 did;
>  	bool enable_pd30_extended_message;
>  };
> @@ -308,7 +311,7 @@ static int rt1711h_check_revision(struct i2c_client *i2c, struct rt1711h_chip *c
>  	ret = i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
>  	if (ret < 0)
>  		return ret;
> -	if (ret != RT1711H_VID) {
> +	if (ret != chip->info->vid) {
>  		dev_err(&i2c->dev, "vid is not correct, 0x%04x\n", ret);
>  		return -ENODEV;
>  	}
> @@ -405,17 +408,27 @@ static void rt1711h_remove(struct i2c_client *client)
>  	tcpci_unregister_port(chip->tcpci);
>  }
>  
> +static const struct rt1711h_chip_info et7304 = {
> +	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
> +	.vid = ET7304_VID,
> +	.did = ET7304_DID,
> +	.enable_pd30_extended_message = true,
> +};
> +
>  static const struct rt1711h_chip_info rt1711h = {
> +	.vid = RT1711H_VID,
>  	.did = RT1711H_DID,
>  };
>  
>  static const struct rt1711h_chip_info rt1715 = {
>  	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
> +	.vid = RT1711H_VID,
>  	.did = RT1715_DID,
>  	.enable_pd30_extended_message = true,
>  };
>  
>  static const struct i2c_device_id rt1711h_id[] = {
> +	{ "et7304", (kernel_ulong_t)&et7304 },
>  	{ "rt1711h", (kernel_ulong_t)&rt1711h },
>  	{ "rt1715", (kernel_ulong_t)&rt1715 },
>  	{}
> @@ -423,6 +436,7 @@ static const struct i2c_device_id rt1711h_id[] = {
>  MODULE_DEVICE_TABLE(i2c, rt1711h_id);
>  
>  static const struct of_device_id rt1711h_of_match[] = {
> +	{ .compatible = "etekmicro,et7304", .data = &et7304 },
>  	{ .compatible = "richtek,rt1711h", .data = &rt1711h },
>  	{ .compatible = "richtek,rt1715", .data = &rt1715 },
>  	{}
> 
> -- 
> 2.53.0

-- 
heikki

