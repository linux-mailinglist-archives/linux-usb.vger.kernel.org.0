Return-Path: <linux-usb+bounces-36527-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMgDE+wq72n98gAAu9opvQ
	(envelope-from <linux-usb+bounces-36527-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:22:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F046FD33
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B84A1300574D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17ABD1C2AA;
	Mon, 27 Apr 2026 09:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHAXHuLd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072E324501D;
	Mon, 27 Apr 2026 09:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281766; cv=none; b=mFrNDU5cVHCi/WhN4dXsHS1m/YDy5BHQesVla2ctXR/LnoMSGU79TUeZ17o9NrESXgcVilBK7TCBHQ1cgJ4RwbLdh+X/sbLA9nM4om3kR4MNFQI4iZ9CaYiGEdyhiG2fMqOA0iZR0aTKAw84TMI9TP2MQrR9p5ZsS0jvj2Qaqio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281766; c=relaxed/simple;
	bh=bW4FghVBAoYvbYDOGt4eR43fVTRZEf+HTqXNszYCS3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8Z1Ve0S++mvQqXk32tyv015WL/ynACe3pxsHEdOtALUoT0kOTqTPbQ8LhlhltbuLJjeWwN/ll44SmZvR++k7S1DpqwxoUJK4fptpqrtUVtbzZPsPyZaoc99yDNAnQALrfUlIdktuz7yjJpItkNG/W5i9dx+W0MTBs1/I63NQIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHAXHuLd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777281765; x=1808817765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bW4FghVBAoYvbYDOGt4eR43fVTRZEf+HTqXNszYCS3M=;
  b=QHAXHuLdG7iVjqiO13PJAfEtLzzT+3cXaktk0GcumO6xxux28nI0ocWQ
   XBcSEt3Op/bIgSABGu6xqpVs+UNNg+qXqdTHGXYS4PejjXYhr3B2ne6/k
   GgWeLwVa5HOZGYBY8tg/44EA7MniCY93bS6+7BCIyeAM95k2ka09oyhtV
   aS54xkAU35KiSUoKPrnYG2/9ANCZzvRPVxNdJMuTUoWtMTlcDOadfIoSv
   lfBujwcSff+33Fn1/yShHR4mxjimtfroiBNQ9H0W2G2+DA8TQvQd9+2We
   Wim2tXX2p7/I2XYh+f21euzJT1sJYLbwU/BowihfOQ5Pe6mEDz+7A5rN5
   w==;
X-CSE-ConnectionGUID: jWIGynfQT1Wv8hRshzj/Ig==
X-CSE-MsgGUID: 3z/jwukGQwyQR5LVjH1LfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="89543829"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="89543829"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:22:44 -0700
X-CSE-ConnectionGUID: HZ8iRoXDSHOBXXeXOaVWPw==
X-CSE-MsgGUID: OGf71s/nQRCQ/cH64+jJ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="271709248"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 27 Apr 2026 02:22:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 3169795; Mon, 27 Apr 2026 11:22:41 +0200 (CEST)
Date: Mon, 27 Apr 2026 12:22:39 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jack Pham <jack.pham@oss.qualcomm.com>
Subject: Re: [PATCH] usb: typec: mux: ps883x: Power the retimer off when not
 in use
Message-ID: <ae8q3yLta16oS5At@kuha>
References: <20260420-topic-ps883x_unused_reset-v1-1-7aabf7004d2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-topic-ps883x_unused_reset-v1-1-7aabf7004d2a@oss.qualcomm.com>
X-Rspamd-Queue-Id: A03F046FD33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36527-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Mon, Apr 20, 2026 at 01:40:28PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> When there's nothing going through the retimer, there's no reason to
> keep it online. Put it in reset when possible to save power.
> 
> Also, remove the register cache-compare optimization as it makes little
> sense now that the chip resets during almost all transitions and
> tracking the validity of that cache becomes a headache.
> 
> Suggested-by: Jack Pham <jack.pham@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Note most of the diff happens to be there because I need to move
> ps883x_(en/dis)able_vregs() around..
> ---
>  drivers/usb/typec/mux/ps883x.c | 196 ++++++++++++++++++++++++-----------------
>  1 file changed, 114 insertions(+), 82 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
> index 1256252eceed..f52443638ee2 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -61,19 +61,110 @@ struct ps883x_retimer {
>  	struct mutex lock; /* protect non-concurrent retimer & switch */
>  
>  	enum typec_orientation orientation;
> -	u8 cfg0;
> -	u8 cfg1;
> -	u8 cfg2;
> +	bool in_reset;
>  };
>  
> +static int ps883x_enable_vregs(struct ps883x_retimer *retimer)
> +{
> +	struct device *dev = &retimer->client->dev;
> +	int ret;
> +
> +	ret = regulator_enable(retimer->vdd33_supply);
> +	if (ret) {
> +		dev_err(dev, "cannot enable VDD 3.3V regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_enable(retimer->vdd33_cap_supply);
> +	if (ret) {
> +		dev_err(dev, "cannot enable VDD 3.3V CAP regulator: %d\n", ret);
> +		goto err_vdd33_disable;
> +	}
> +
> +	usleep_range(4000, 10000);
> +
> +	ret = regulator_enable(retimer->vdd_supply);
> +	if (ret) {
> +		dev_err(dev, "cannot enable VDD regulator: %d\n", ret);
> +		goto err_vdd33_cap_disable;
> +	}
> +
> +	ret = regulator_enable(retimer->vddar_supply);
> +	if (ret) {
> +		dev_err(dev, "cannot enable VDD AR regulator: %d\n", ret);
> +		goto err_vdd_disable;
> +	}
> +
> +	ret = regulator_enable(retimer->vddat_supply);
> +	if (ret) {
> +		dev_err(dev, "cannot enable VDD AT regulator: %d\n", ret);
> +		goto err_vddar_disable;
> +	}
> +
> +	ret = regulator_enable(retimer->vddio_supply);
> +	if (ret) {
> +		dev_err(dev, "cannot enable VDD IO regulator: %d\n", ret);
> +		goto err_vddat_disable;
> +	}
> +
> +	return 0;
> +
> +err_vddat_disable:
> +	regulator_disable(retimer->vddat_supply);
> +err_vddar_disable:
> +	regulator_disable(retimer->vddar_supply);
> +err_vdd_disable:
> +	regulator_disable(retimer->vdd_supply);
> +err_vdd33_cap_disable:
> +	regulator_disable(retimer->vdd33_cap_supply);
> +err_vdd33_disable:
> +	regulator_disable(retimer->vdd33_supply);
> +
> +	return ret;
> +}
> +
> +static void ps883x_disable_vregs(struct ps883x_retimer *retimer)
> +{
> +	regulator_disable(retimer->vddio_supply);
> +	regulator_disable(retimer->vddat_supply);
> +	regulator_disable(retimer->vddar_supply);
> +	regulator_disable(retimer->vdd_supply);
> +	regulator_disable(retimer->vdd33_cap_supply);
> +	regulator_disable(retimer->vdd33_supply);
> +}
> +
> +static void ps883x_reset(struct ps883x_retimer *retimer)
> +{
> +	if (retimer->in_reset)
> +		return;
> +
> +	gpiod_set_value(retimer->reset_gpio, 1);
> +	ps883x_disable_vregs(retimer);
> +	retimer->in_reset = true;
> +}
> +
>  static int ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
> -			    int cfg1, int cfg2)
> +			    int cfg1, int cfg2, bool reset)
>  {
>  	struct device *dev = &retimer->client->dev;
>  	int ret;
>  
> -	if (retimer->cfg0 == cfg0 && retimer->cfg1 == cfg1 && retimer->cfg2 == cfg2)
> +	if (reset) {
> +		ps883x_reset(retimer);
> +
>  		return 0;
> +	} else if (retimer->in_reset) {
> +		ret = ps883x_enable_vregs(retimer);
> +		if (ret)
> +			return ret;
> +
> +		gpiod_set_value(retimer->reset_gpio, 0);
> +
> +		/* firmware initialization delay */
> +		msleep(60);
> +
> +		retimer->in_reset = false;
> +	}
>  
>  	ret = regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_0, cfg0);
>  	if (ret) {
> @@ -93,10 +184,6 @@ static int ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
>  		return ret;
>  	}
>  
> -	retimer->cfg0 = cfg0;
> -	retimer->cfg1 = cfg1;
> -	retimer->cfg2 = cfg2;
> -
>  	return 0;
>  }
>  
> @@ -107,6 +194,7 @@ static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retimer_state
>  	int cfg0 = CONN_STATUS_0_CONNECTION_PRESENT;
>  	int cfg1 = 0x00;
>  	int cfg2 = 0x00;
> +	bool reset = false;
>  
>  	if (retimer->orientation == TYPEC_ORIENTATION_REVERSE)
>  		cfg0 |= CONN_STATUS_0_ORIENTATION_REVERSED;
> @@ -148,9 +236,13 @@ static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retimer_state
>  		}
>  	} else {
>  		switch (state->mode) {
> +		/* SAFE can be transient or point to an actual disconnect */
>  		case TYPEC_STATE_SAFE:
> +			reset = retimer->orientation == TYPEC_ORIENTATION_NONE;
> +			break;
>  		/* USB2 pins don't even go through this chip */
>  		case TYPEC_MODE_USB2:
> +			reset = true;
>  			break;
>  		case TYPEC_STATE_USB:
>  		case TYPEC_MODE_USB3:
> @@ -171,7 +263,7 @@ static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retimer_state
>  		}
>  	}
>  
> -	return ps883x_configure(retimer, cfg0, cfg1, cfg2);
> +	return ps883x_configure(retimer, cfg0, cfg1, cfg2, reset);
>  }
>  
>  static int ps883x_sw_set(struct typec_switch_dev *sw,
> @@ -184,11 +276,19 @@ static int ps883x_sw_set(struct typec_switch_dev *sw,
>  	if (ret)
>  		return ret;
>  
> -	mutex_lock(&retimer->lock);
> +	guard(mutex)(&retimer->lock);
>  
>  	if (retimer->orientation != orientation) {
>  		retimer->orientation = orientation;
>  
> +		/*
> +		 * Orientation notifications usually come prior to mode switch
> +		 * events. If the retimer is already in reset, we still want to
> +		 * cache the new orientation value for the subsequent ps883x_set().
> +		 */
> +		if (retimer->in_reset)
> +			return 0;
> +
>  		ret = regmap_assign_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
>  					 CONN_STATUS_0_ORIENTATION_REVERSED,
>  					 orientation == TYPEC_ORIENTATION_REVERSE);
> @@ -196,8 +296,6 @@ static int ps883x_sw_set(struct typec_switch_dev *sw,
>  			dev_err(&retimer->client->dev, "failed to set orientation: %d\n", ret);
>  	}
>  
> -	mutex_unlock(&retimer->lock);
> -
>  	return ret;
>  }
>  
> @@ -222,75 +320,6 @@ static int ps883x_retimer_set(struct typec_retimer *rtmr,
>  	return typec_mux_set(retimer->typec_mux, &mux_state);
>  }
>  
> -static int ps883x_enable_vregs(struct ps883x_retimer *retimer)
> -{
> -	struct device *dev = &retimer->client->dev;
> -	int ret;
> -
> -	ret = regulator_enable(retimer->vdd33_supply);
> -	if (ret) {
> -		dev_err(dev, "cannot enable VDD 3.3V regulator: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = regulator_enable(retimer->vdd33_cap_supply);
> -	if (ret) {
> -		dev_err(dev, "cannot enable VDD 3.3V CAP regulator: %d\n", ret);
> -		goto err_vdd33_disable;
> -	}
> -
> -	usleep_range(4000, 10000);
> -
> -	ret = regulator_enable(retimer->vdd_supply);
> -	if (ret) {
> -		dev_err(dev, "cannot enable VDD regulator: %d\n", ret);
> -		goto err_vdd33_cap_disable;
> -	}
> -
> -	ret = regulator_enable(retimer->vddar_supply);
> -	if (ret) {
> -		dev_err(dev, "cannot enable VDD AR regulator: %d\n", ret);
> -		goto err_vdd_disable;
> -	}
> -
> -	ret = regulator_enable(retimer->vddat_supply);
> -	if (ret) {
> -		dev_err(dev, "cannot enable VDD AT regulator: %d\n", ret);
> -		goto err_vddar_disable;
> -	}
> -
> -	ret = regulator_enable(retimer->vddio_supply);
> -	if (ret) {
> -		dev_err(dev, "cannot enable VDD IO regulator: %d\n", ret);
> -		goto err_vddat_disable;
> -	}
> -
> -	return 0;
> -
> -err_vddat_disable:
> -	regulator_disable(retimer->vddat_supply);
> -err_vddar_disable:
> -	regulator_disable(retimer->vddar_supply);
> -err_vdd_disable:
> -	regulator_disable(retimer->vdd_supply);
> -err_vdd33_cap_disable:
> -	regulator_disable(retimer->vdd33_cap_supply);
> -err_vdd33_disable:
> -	regulator_disable(retimer->vdd33_supply);
> -
> -	return ret;
> -}
> -
> -static void ps883x_disable_vregs(struct ps883x_retimer *retimer)
> -{
> -	regulator_disable(retimer->vddio_supply);
> -	regulator_disable(retimer->vddat_supply);
> -	regulator_disable(retimer->vddar_supply);
> -	regulator_disable(retimer->vdd_supply);
> -	regulator_disable(retimer->vdd33_cap_supply);
> -	regulator_disable(retimer->vdd33_supply);
> -}
> -
>  static int ps883x_get_vregs(struct ps883x_retimer *retimer)
>  {
>  	struct device *dev = &retimer->client->dev;
> @@ -422,6 +451,9 @@ static int ps883x_retimer_probe(struct i2c_client *client)
>  		}
>  	}
>  
> +	/* Keep the retimer in reset until a Type-C notification comes */
> +	ps883x_reset(retimer);
> +
>  	sw_desc.drvdata = retimer;
>  	sw_desc.fwnode = dev_fwnode(dev);
>  	sw_desc.set = ps883x_sw_set;
> 
> ---
> base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
> change-id: 20260420-topic-ps883x_unused_reset-9af0909cefac
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

-- 
heikki

