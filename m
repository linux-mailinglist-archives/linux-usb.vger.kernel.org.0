Return-Path: <linux-usb+bounces-35042-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNBFA6yOumnSXgIAu9opvQ
	(envelope-from <linux-usb+bounces-35042-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 12:38:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF942BAF00
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 12:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5239D301C105
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 11:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C85A3C7E1E;
	Wed, 18 Mar 2026 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fg0rq88B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192E2F83AE;
	Wed, 18 Mar 2026 11:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833885; cv=none; b=gEmryFQNLKmHyf4L6BXXA04bgKvYf9Ct1NAh8GXf05Lz/itcisWLBdPSCYpKTgUilmJ+GaB5SFTTFYOIaf4WG8F2MWchwCgRHdNkCVK6YqMeuTZuRsmhdrGJFvCXWnhuLQcEdOhLsCd7kyy7eJeKtyrKd1yabWjtW0SblYetgtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833885; c=relaxed/simple;
	bh=OLjzImxfuVWex7T22Pkij3mEOpJWTsbXz8bzai1HH5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFUq4wYkoEWjSSw8f7yhDt1xqGKJ4F2N02FUMyWDJmvHepFUlREHxnh5wX9BjGt/7sSM90Drk54s4XlDma/ub1t/JCeHWpLdniVfaWZqU3MfWtjfCjudJykV52aQ+2Xu0YYncpBZeyGPywEfWKDSidx4cSW1ustNJ9jZBJrf6iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fg0rq88B; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773833884; x=1805369884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OLjzImxfuVWex7T22Pkij3mEOpJWTsbXz8bzai1HH5I=;
  b=Fg0rq88B0l/7XC2SFRKEFF5+EwgpEp6BE3qA5sTN5aJugoxfHkrUsq3S
   4u/izmoYqUl5nadaDpcCQ8X+/6I9Hx7H8n7RLT5RziYPHQ9ZcXaQgAUgN
   JNfkhUZRt2frBEDoop6ouUQIm7/M4OksSJVikBX8Bpw8mjFQCr+5SHY8g
   AivGzVQzfmfFgzOcIc+ugPVnW86FuKoA2xhjhPfJ29rp7ubOYEgAibyrG
   mHgGvQ9ozlFx7lRe1DTXVarV2VhCmTUDmmoZIbka6kC7ouDqYQh7jZF+W
   zwcXxQf+IVSOqqhRWqfzr4OY8z7EUohZzDxc8QCL1C0tJeVPP/+QqhswK
   Q==;
X-CSE-ConnectionGUID: J0/IQuAhR5K5ShF0NB9kqg==
X-CSE-MsgGUID: ewvm8JSASNSev2uVNa4g6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74960112"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74960112"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 04:38:03 -0700
X-CSE-ConnectionGUID: sPA8yZiSRmKyItacftGwUA==
X-CSE-MsgGUID: O62ryIL0QsiRCRdgvaG80Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="218635634"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2026 04:38:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 80BCF99; Wed, 18 Mar 2026 12:37:59 +0100 (CET)
Date: Wed, 18 Mar 2026 13:37:13 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gene Chen <gene_chen@richtek.com>,
	Yuanshen Cao <alex.caoys@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] usb: typec: tcpci_rt1711h: Drop unnecessary
 VID/PID/DID checks
Message-ID: <abqOafNqowqKcmLk@kuha>
References: <20260318-husb311-v3-0-2b32e6192b9c@flipper.net>
 <20260318-husb311-v3-4-2b32e6192b9c@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-husb311-v3-4-2b32e6192b9c@flipper.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35042-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,richtek.com,gmail.com,collabora.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,flipper.net:email]
X-Rspamd-Queue-Id: 7FF942BAF00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wed, Mar 18, 2026 at 01:23:46PM +0400, Alexey Charkov kirjoitti:
> Existing checks for VID/PID/DID in the driver are redundant since the
> driver is already matched to the device via I2C device ID and OF
> compatible strings, and they preclude the use of fallback compatibles.
> 
> Remove them to make the driver slimmer and adding new clones easier.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 59 ++--------------------------------
>  1 file changed, 2 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> index 37cf55ad74f8..4b3e4e22a82e 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -18,13 +18,6 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  
> -#define RT1711H_VID		0x29CF
> -#define ET7304_VID		0x6DCF
> -#define RT1711H_PID		0x1711
> -#define RT1711H_DID		0x2171
> -#define RT1715_DID		0x2173
> -#define ET7304_DID		0x2173
> -
>  #define RT1711H_PHYCTRL1	0x80
>  #define RT1711H_PHYCTRL2	0x81
>  
> @@ -57,8 +50,6 @@
>  
>  struct rt1711h_chip_info {
>  	u32 rxdz_sel;
> -	u16 vid;
> -	u16 did;
>  	bool enable_pd30_extended_message;
>  };
>  
> @@ -304,35 +295,6 @@ static int rt1711h_sw_reset(struct rt1711h_chip *chip)
>  	return 0;
>  }
>  
> -static int rt1711h_check_revision(struct i2c_client *i2c, struct rt1711h_chip *chip)
> -{
> -	int ret;
> -
> -	ret = i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
> -	if (ret < 0)
> -		return ret;
> -	if (ret != chip->info->vid) {
> -		dev_err(&i2c->dev, "vid is not correct, 0x%04x\n", ret);
> -		return -ENODEV;
> -	}
> -	ret = i2c_smbus_read_word_data(i2c, TCPC_PRODUCT_ID);
> -	if (ret < 0)
> -		return ret;
> -	if (ret != RT1711H_PID) {
> -		dev_err(&i2c->dev, "pid is not correct, 0x%04x\n", ret);
> -		return -ENODEV;
> -	}
> -	ret = i2c_smbus_read_word_data(i2c, TCPC_BCD_DEV);
> -	if (ret < 0)
> -		return ret;
> -	if (ret != chip->info->did) {
> -		dev_err(&i2c->dev, "did is not correct, 0x%04x\n", ret);
> -		return -ENODEV;
> -	}
> -	dev_dbg(&i2c->dev, "did is 0x%04x\n", ret);
> -	return ret;
> -}
> -
>  static int rt1711h_probe(struct i2c_client *client)
>  {
>  	int ret;
> @@ -349,12 +311,6 @@ static int rt1711h_probe(struct i2c_client *client)
>  
>  	chip->info = i2c_get_match_data(client);
>  
> -	ret = rt1711h_check_revision(client, chip);
> -	if (ret < 0) {
> -		dev_err(&client->dev, "check vid/pid fail\n");
> -		return ret;
> -	}
> -
>  	chip->data.regmap = devm_regmap_init_i2c(client,
>  						 &rt1711h_regmap_config);
>  	if (IS_ERR(chip->data.regmap))
> @@ -408,27 +364,16 @@ static void rt1711h_remove(struct i2c_client *client)
>  	tcpci_unregister_port(chip->tcpci);
>  }
>  
> -static const struct rt1711h_chip_info et7304 = {
> -	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
> -	.vid = ET7304_VID,
> -	.did = ET7304_DID,
> -	.enable_pd30_extended_message = true,
> -};
> -
>  static const struct rt1711h_chip_info rt1711h = {
> -	.vid = RT1711H_VID,
> -	.did = RT1711H_DID,
>  };
>  
>  static const struct rt1711h_chip_info rt1715 = {
>  	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
> -	.vid = RT1711H_VID,
> -	.did = RT1715_DID,
>  	.enable_pd30_extended_message = true,
>  };
>  
>  static const struct i2c_device_id rt1711h_id[] = {
> -	{ "et7304", (kernel_ulong_t)&et7304 },
> +	{ "et7304", (kernel_ulong_t)&rt1715 },
>  	{ "rt1711h", (kernel_ulong_t)&rt1711h },
>  	{ "rt1715", (kernel_ulong_t)&rt1715 },
>  	{}
> @@ -436,7 +381,7 @@ static const struct i2c_device_id rt1711h_id[] = {
>  MODULE_DEVICE_TABLE(i2c, rt1711h_id);
>  
>  static const struct of_device_id rt1711h_of_match[] = {
> -	{ .compatible = "etekmicro,et7304", .data = &et7304 },
> +	{ .compatible = "etekmicro,et7304", .data = &rt1715 },
>  	{ .compatible = "richtek,rt1711h", .data = &rt1711h },
>  	{ .compatible = "richtek,rt1715", .data = &rt1715 },
>  	{}
> 
> -- 
> 2.52.0

-- 
heikki

