Return-Path: <linux-usb+bounces-32510-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE281D3AA2A
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 14:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D762130230DF
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 13:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4644368294;
	Mon, 19 Jan 2026 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkgQGD11"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1FE36827A;
	Mon, 19 Jan 2026 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828807; cv=none; b=GDl95/EkwdDiczUGJi91NUE97m1/i5oy1q5xb4TrtuZi3w47a7RtVJN2To0EsSi6uEpykg4XhZlSf8daAphdgXKMp3BpVBW5cZ5wEWLRCxc58lm0d0WE737EwCwqx7CuYJzbMBEV8Wbp8GB7cm+kWb71NkRAscNto1n2e222N1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828807; c=relaxed/simple;
	bh=8Pwk2mM320rXW7LXWm74rtn0AAucQRE+DgHKgITPUpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFFtR+j4ZSdig7wkaY7FUHfn95+HRwKhnOecCyz3mGqJHji/Smysfd/MMX5XB1Q+CgopS1VRCM4LGRDEYRN9x7d4T7vZA/rvSphYFFToCNm8oXCjnTsNTbqxDdrjfYYHpUhtAxAJmg0yFnl/1FXdmAvA0e9dXf9j4DLg0c4O5XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkgQGD11; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768828807; x=1800364807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Pwk2mM320rXW7LXWm74rtn0AAucQRE+DgHKgITPUpk=;
  b=dkgQGD114NcqgB52Hy8JYO+DpW55eKMy6UiUEAxsjQ0ZmX8NpyiiHdtB
   YlDGYwh1oD0JUwWdy7lPqkuxa1vOsxoziWzvjdUJPEQuzdXACTH0vq+w0
   QxVhE+pui5kEmhiUE37OwGhzrYUmeeZqCk+1Pu5cCa1rNV0JJu0RTrjHl
   BNT5iVHDSFoAddv7ECI5q1HOhD/QrrN97B+djjqoh29og1IZPLbLN/Z0y
   03Liy224DkKWYbVpX2e/MSempil3FzkWgcXxom6lyiFhqMi8BwtM6twsO
   IeBYnlqCHVk3Z3gmh+cWbyumoJ27TOkjYBQCFvtMs/TFvp8WrpstYKsk3
   Q==;
X-CSE-ConnectionGUID: mwQ8AhGiRxWmk13JklGYFQ==
X-CSE-MsgGUID: gMY5WIS1QyaRrTJZpf06Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70087874"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70087874"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:20:06 -0800
X-CSE-ConnectionGUID: YWEdYMHjS1+2wl1wtxgalg==
X-CSE-MsgGUID: G6wSFACJR/6T3MZn6iaupQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="236545217"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha) ([10.124.221.165])
  by orviesa002.jf.intel.com with SMTP; 19 Jan 2026 05:20:03 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 19 Jan 2026 15:19:38 +0200
Date: Mon, 19 Jan 2026 15:19:38 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jan Remmet <j.remmet@phytec.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] usb: typec: hd3ss3220: Enable VBUS based on role state
Message-ID: <aW4vauth0USYYy5x@kuha>
References: <20260115-wip-jremmet-hd3ss3220_vbus-v1-1-b7d9adfbe346@phytec.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-wip-jremmet-hd3ss3220_vbus-v1-1-b7d9adfbe346@phytec.de>

Thu, Jan 15, 2026 at 02:11:21PM +0100, Jan Remmet kirjoitti:
> For systems where the ID pin isn't available as gpio use the ATTACHED_STATE
> register instead to control vbus.
> 
> >From the datasheet:
> "This is an additional method to communicate attach other
> than the ID pin. These bits can be read by the application to
> determine what was attached."
> 
> Use this method if id-gpios property is not set, but the connector node
> has vbus-supply defined.
> 
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/hd3ss3220.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 3876f4faead679e6c04062ab2bcf2ae928913a0a..a7c54aa8635f70d6979d98c95f80d4dac277fef2 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -204,6 +204,20 @@ static const struct typec_operations hd3ss3220_ops = {
>  	.port_type_set = hd3ss3220_port_type_set,
>  };
>  
> +static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
> +{
> +	int ret;
> +
> +	if (on)
> +		ret = regulator_enable(hd3ss3220->vbus);
> +	else
> +		ret = regulator_disable(hd3ss3220->vbus);
> +
> +	if (ret)
> +		dev_err(hd3ss3220->dev,
> +			"vbus regulator %s failed: %d\n", on ? "disable" : "enable", ret);
> +}
> +
>  static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
>  {
>  	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
> @@ -221,6 +235,9 @@ static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
>  		break;
>  	}
>  
> +	if (hd3ss3220->vbus && !hd3ss3220->id_gpiod)
> +		hd3ss3220_regulator_control(hd3ss3220, role_state == USB_ROLE_HOST);
> +
>  	hd3ss3220->role_state = role_state;
>  }
>  
> @@ -330,18 +347,10 @@ static const struct regmap_config config = {
>  static irqreturn_t hd3ss3220_id_isr(int irq, void *dev_id)
>  {
>  	struct hd3ss3220 *hd3ss3220 = dev_id;
> -	int ret;
>  	int id;
>  
>  	id = gpiod_get_value_cansleep(hd3ss3220->id_gpiod);
> -	if (!id)
> -		ret = regulator_enable(hd3ss3220->vbus);
> -	else
> -		ret = regulator_disable(hd3ss3220->vbus);
> -
> -	if (ret)
> -		dev_err(hd3ss3220->dev,
> -			"vbus regulator %s failed: %d\n", id ? "disable" : "enable", ret);
> +	hd3ss3220_regulator_control(hd3ss3220, !id);
>  
>  	return IRQ_HANDLED;
>  }
> 
> ---
> base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
> change-id: 20260115-wip-jremmet-hd3ss3220_vbus-732f74894acc
> 
> Best regards,
> -- 
> Jan Remmet <j.remmet@phytec.de>

-- 
heikki

