Return-Path: <linux-usb+bounces-3912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 502F480A655
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 15:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04ABD281C80
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 14:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4DD200C7;
	Fri,  8 Dec 2023 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afWsdGPE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6048C1FDE;
	Fri,  8 Dec 2023 06:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702047352; x=1733583352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FfUY+Wstv4jsrYVOnc1MFa+S52d2APzyA3oN4z2k170=;
  b=afWsdGPEuxPZGxFbjiEx76p73zhBeBPTaxXOtbdw30uKDc8Wh66Rn/QJ
   d211x44ZuTzKN73QMZV2rT/xj+F48J0zxXutFwCfrn9pXBS93rTvQHCHV
   mJsRA4IFHeNACGjKDvuvaGcUpbU8i06xM/aSTj9OKfKpBjrgpShAT8+KW
   UAIlZdYVc1JvwCdL+TOF0xoSLOYoanaKNbGjm+VJoBGsBBUkuldP9K8ug
   1M6L5A+GD3stRgBPZB9QcJx4WResYVLmMDcRN4dleUCtxvrLrh9lydUFJ
   kOB34jMPQ3EdNkof2oP4CdzmEF+vZbk0CvQbztS/SQYYg1zC78oe26W7P
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="460890106"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="460890106"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 06:55:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="772149070"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="772149070"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga002.jf.intel.com with SMTP; 08 Dec 2023 06:55:49 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 08 Dec 2023 16:55:48 +0200
Date: Fri, 8 Dec 2023 16:55:48 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: tipd: add function to request firmware
Message-ID: <ZXMudF++A9/y4TNk@kuha.fi.intel.com>
References: <20231207-tps6598x_update-v1-0-dc21b5301d91@wolfvision.net>
 <20231207-tps6598x_update-v1-2-dc21b5301d91@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207-tps6598x_update-v1-2-dc21b5301d91@wolfvision.net>

Hi Javier,

On Thu, Dec 07, 2023 at 12:51:07PM +0100, Javier Carrasco wrote:
> The firmware request process is device agnostic and can be used for
> other parts.
> 
> A probe deferring mechanism has been added in order to account for cases
> where the file system where the firmware resides is still not available
> when the probe function is triggered and no firmware is found.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/typec/tipd/core.c | 36 +++++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index f0c4cd571a37..165a1391dc72 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -873,6 +873,31 @@ tps6598x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
>  	return 0;
>  }
>  
> +static int tps_request_firmware(struct tps6598x *tps, const struct firmware **fw)
> +{
> +	const char *firmware_name;
> +	int ret;
> +
> +	ret = device_property_read_string(tps->dev, "firmware-name",
> +					  &firmware_name);
> +	if (ret)
> +		return ret;
> +
> +	ret = request_firmware(fw, firmware_name, tps->dev);
> +	if (ret) {
> +		dev_err(tps->dev, "failed to retrieve \"%s\"\n", firmware_name);
> +		/* probe deferring in case the file system is not ready */
> +		return (ret == -ENOENT) ? -EPROBE_DEFER : ret;

It's more likely that the firmware really isn't available, and it will
never be available in this case. I think there is only one place in
kernel where failing request_firmware() can lead to deferred probe
(drivers/tee/optee/smc_abi.c) and there the code can actually see the
system state - that's actually the condition.

So just return dev_err_probe() here:

	ret = request_firmware(fw, firmware_name, tps->dev);
	if (ret)
                return dev_err_probe(tps->dev, ret, "failed to retrieve \"%s\"", firmware_name);

> +	}
> +
> +	if ((*fw)->size == 0) {
> +		release_firmware(*fw);
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
>  static int
>  tps25750_write_firmware(struct tps6598x *tps,
>  			u8 bpms_addr, const u8 *data, size_t len)
> @@ -961,16 +986,9 @@ static int tps25750_start_patch_burst_mode(struct tps6598x *tps)
>  	if (ret)
>  		return ret;
>  
> -	ret = request_firmware(&fw, firmware_name, tps->dev);
> -	if (ret) {
> -		dev_err(tps->dev, "failed to retrieve \"%s\"\n", firmware_name);
> +	ret = tps_request_firmware(tps, &fw);
> +	if (ret)
>  		return ret;
> -	}
> -
> -	if (fw->size == 0) {
> -		ret = -EINVAL;
> -		goto release_fw;
> -	}
>  
>  	ret = of_property_match_string(np, "reg-names", "patch-address");
>  	if (ret < 0) {
> 
> -- 
> 2.39.2

thanks,

-- 
heikki

