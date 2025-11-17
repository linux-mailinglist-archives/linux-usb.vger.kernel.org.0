Return-Path: <linux-usb+bounces-30551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00721C62F28
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 09:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 83FF734F763
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 08:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B03C31E0E6;
	Mon, 17 Nov 2025 08:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BB6PmX92"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3132B30DD2E;
	Mon, 17 Nov 2025 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763368959; cv=none; b=T6EhQnvBy3KKI1qjmPAto+g1+tLh01Cj41bS6KbZcN1S8LbGCSMJCMmhBlCze0zVEdvnq+0KeyHcpxGZegyyYQKXa74Gdg1yyf4ImEXf+zTAYMj4OgAPRlsEhVc8QE9n1l3RY1dvacfb28ZAKF3UtXjW5reANY9JcZB8YRD1S4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763368959; c=relaxed/simple;
	bh=tgbUpnnd32C+EmoXr6PdoBbpknMJQrY0GnGAY4oC+n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDCtTYGp+1B+q6hGVrkth13LeXYfiKV79pdHcDyuz8O5RInlWceqVbh5Ek93vEFhjGPIBBSoKBoYOqPYEEAfmuLEvauH3PususMBEGoKSXCBbUKbAJ+T0XPA/l0N8O+BJOh1Ysxyoaq6n5IDHf+CiaE/yGyawk3sB3TO4DaH3mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BB6PmX92; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763368958; x=1794904958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tgbUpnnd32C+EmoXr6PdoBbpknMJQrY0GnGAY4oC+n8=;
  b=BB6PmX92di/jwG0W3YPTek+iWKjf0PLhyt1dq4pVgvYdoACN5SQIbMFY
   65R5eKPKoIif5iwKSEcgY694l+ZcracZRcCGEwAMvaxbutppzfrbDhbap
   hVJbIKN01j3peVR4oqI60A3aAiyXOXcKc358SlmMGNjJ6pDyzzNT/4O9v
   hupW/6sjCfcgsZJDEyt5pZCgmnHtRT45kFgNZYSt7UVDjPuoEyils6atq
   tdv5Jbp7ceI2EfbhUFn6ttp0Cx84221bBytecDLWIXBz9Ezj49xGnkAQq
   JVJNqflBxUtZZoRX8GdTqLcH17I8PoJQ+UQo+UZJhsm6wUNf3lSUWCDdM
   Q==;
X-CSE-ConnectionGUID: vT6QxAgLQm6FAvc+y+QxHg==
X-CSE-MsgGUID: oqx5nJJESCmqH8mlRfTZ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65398449"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65398449"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 00:42:37 -0800
X-CSE-ConnectionGUID: 2fIpZXy1SH6f5kypKQ4mzQ==
X-CSE-MsgGUID: 6SRByjMtRUm61rSq34llzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189642075"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.220.176])
  by orviesa006.jf.intel.com with SMTP; 17 Nov 2025 00:42:34 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 17 Nov 2025 10:42:30 +0200
Date: Mon, 17 Nov 2025 10:42:30 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID
 pin state
Message-ID: <aRrf9nzjYbR8esUm@kuha.fi.intel.com>
References: <20251111072025.2199142-1-krishna.kurapati@oss.qualcomm.com>
 <20251111072025.2199142-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111072025.2199142-3-krishna.kurapati@oss.qualcomm.com>

Tue, Nov 11, 2025 at 12:50:25PM +0530, Krishna Kurapati kirjoitti:
> There is a ID pin present on HD3SS3220 controller that can be routed
> to SoC. As per the datasheet:
> 
> "Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
> not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
> low. This is done to enforce Type-C requirement that VBUS must be at
> VSafe0V before re-enabling VBUS"
> 
> Add support to read the ID pin state and enable VBUS accordingly.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/hd3ss3220.c | 75 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 3ecc688dda82..3876f4faead6 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -15,6 +15,9 @@
>  #include <linux/usb/typec.h>
>  #include <linux/delay.h>
>  #include <linux/workqueue.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/of_graph.h>
>  
>  #define HD3SS3220_REG_CN_STAT		0x08
>  #define HD3SS3220_REG_CN_STAT_CTRL	0x09
> @@ -54,6 +57,11 @@ struct hd3ss3220 {
>  	struct delayed_work output_poll_work;
>  	enum usb_role role_state;
>  	bool poll;
> +
> +	struct gpio_desc *id_gpiod;
> +	int id_irq;
> +
> +	struct regulator *vbus;
>  };
>  
>  static int hd3ss3220_set_power_opmode(struct hd3ss3220 *hd3ss3220, int power_opmode)
> @@ -319,13 +327,33 @@ static const struct regmap_config config = {
>  	.max_register = 0x0A,
>  };
>  
> +static irqreturn_t hd3ss3220_id_isr(int irq, void *dev_id)
> +{
> +	struct hd3ss3220 *hd3ss3220 = dev_id;
> +	int ret;
> +	int id;
> +
> +	id = gpiod_get_value_cansleep(hd3ss3220->id_gpiod);
> +	if (!id)
> +		ret = regulator_enable(hd3ss3220->vbus);
> +	else
> +		ret = regulator_disable(hd3ss3220->vbus);
> +
> +	if (ret)
> +		dev_err(hd3ss3220->dev,
> +			"vbus regulator %s failed: %d\n", id ? "disable" : "enable", ret);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int hd3ss3220_probe(struct i2c_client *client)
>  {
>  	struct typec_capability typec_cap = { };
> -	struct hd3ss3220 *hd3ss3220;
>  	struct fwnode_handle *connector, *ep;
> -	int ret;
> +	struct hd3ss3220 *hd3ss3220;
> +	struct regulator *vbus;
>  	unsigned int data;
> +	int ret;
>  
>  	hd3ss3220 = devm_kzalloc(&client->dev, sizeof(struct hd3ss3220),
>  				 GFP_KERNEL);
> @@ -359,6 +387,49 @@ static int hd3ss3220_probe(struct i2c_client *client)
>  		goto err_put_fwnode;
>  	}
>  
> +	vbus = devm_of_regulator_get_optional(hd3ss3220->dev,
> +					      to_of_node(connector),
> +					      "vbus");
> +	if (IS_ERR(vbus) && vbus != ERR_PTR(-ENODEV)) {
> +		ret = PTR_ERR(vbus);
> +		dev_err(hd3ss3220->dev, "failed to get vbus: %d", ret);
> +		goto err_put_fwnode;
> +	}
> +
> +	hd3ss3220->vbus = (vbus == ERR_PTR(-ENODEV) ? NULL : vbus);
> +
> +	if (hd3ss3220->vbus) {
> +		hd3ss3220->id_gpiod = devm_gpiod_get_optional(hd3ss3220->dev,
> +							      "id",
> +							      GPIOD_IN);
> +		if (IS_ERR(hd3ss3220->id_gpiod)) {
> +			ret = PTR_ERR(hd3ss3220->id_gpiod);
> +			goto err_put_fwnode;
> +		}
> +	}
> +
> +	if (hd3ss3220->id_gpiod) {
> +		hd3ss3220->id_irq = gpiod_to_irq(hd3ss3220->id_gpiod);
> +		if (hd3ss3220->id_irq < 0) {
> +			ret = hd3ss3220->id_irq;
> +			dev_err(hd3ss3220->dev,
> +				"failed to get ID gpio: %d\n",
> +				hd3ss3220->id_irq);
> +			goto err_put_fwnode;
> +		}
> +
> +		ret = devm_request_threaded_irq(hd3ss3220->dev,
> +						hd3ss3220->id_irq, NULL,
> +						hd3ss3220_id_isr,
> +						IRQF_TRIGGER_RISING |
> +						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +						dev_name(hd3ss3220->dev), hd3ss3220);
> +		if (ret < 0) {
> +			dev_err(hd3ss3220->dev, "failed to get ID irq: %d\n", ret);
> +			goto err_put_fwnode;
> +		}
> +	}
> +
>  	typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
>  	typec_cap.driver_data = hd3ss3220;
>  	typec_cap.type = TYPEC_PORT_DRP;
> -- 
> 2.34.1

-- 
heikki

