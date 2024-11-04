Return-Path: <linux-usb+bounces-17080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A574B9BC0F5
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 23:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 491DB1F22A77
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 22:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F761AE016;
	Mon,  4 Nov 2024 22:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1cP+WUT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D8283CD3
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 22:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730759551; cv=none; b=dv7Vfi0qxHkirCXrPfTaSA0Clpt1McvcByxwkIoqcbniKzoWEwHav9CMIOMbnAcw9izu2agqQ3mT4l5c7YYnz3CPfsQPxKyhbdVYXib6grcA00OWUqHzjiuRRsN3MewI63EgEuJtZXqo7kHK8Xmv+VdAtnQG4iBWXcnNaMU5nRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730759551; c=relaxed/simple;
	bh=DFKP7HXTnid7mXOjJgxQyTfwZ0D4uN8TT/ChqsRurOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M179HE0rzXghqP+uOQ/Cxrh1BZyvPnzYYZ8Low1RoPllJmd+pa0GieW51Yml1br81ryUy6Y2wE9T5Pw0jLhMXHFSd8TUFTM/AkRwMdvzs1xh4YoK/iCAYQiWj2I9fC5hPF9HPO6tgdu+9AxpkO55fQjRz92+K7Jh1Fer06rAtAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1cP+WUT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730759550; x=1762295550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DFKP7HXTnid7mXOjJgxQyTfwZ0D4uN8TT/ChqsRurOA=;
  b=a1cP+WUTEyIsFnBvA7N/GBJA3JqUqazphr3z6ZnCzXHSRGhWVHvq+xZZ
   aobxdOPbiXvqntLuXw1sbmovdtCAhBOgFyHNyfFhMc1OLQMecoLuK46e8
   0+SVPmazIGubd4PlE4UyDAAPnp8ePvXxlsliSJXSkPRovC7H75PwUUjui
   3i3UxJja64g/EBfMrk6aCahGrPdfgd1nZ9Qh1uF/6Fdw8eOXYC9AhdrDU
   85A4n8iM40aCgE8R3orOvLh/hu+LPiyvTRAiP6tt4ndg7UGZo+3Z0ppUH
   NWzdI35d9GaKFInlruQra41Gfu3B9EKq7O9V8jwX5XqqivfmC4FgvGaZd
   Q==;
X-CSE-ConnectionGUID: c/tWymu0QqSp3NRzMaZf0A==
X-CSE-MsgGUID: dvPOdPoVSi2ARjR8NR/YVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30643329"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30643329"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 14:32:29 -0800
X-CSE-ConnectionGUID: H9EZO1CkQ/ytMq/z3jaUyQ==
X-CSE-MsgGUID: rQCoHPUHQ3OmrHFNp9YlIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="84127335"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 14:32:28 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 24E7111F89A;
	Tue,  5 Nov 2024 00:32:26 +0200 (EET)
Date: Mon, 4 Nov 2024 22:32:26 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH 3/3] usb: misc: ljca: print firmware version
Message-ID: <ZylLevdnD60TziGe@kekkonen.localdomain>
References: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
 <20241104085056.652294-3-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104085056.652294-3-stanislaw.gruszka@linux.intel.com>

Hi Stanislaw,

Thanks for the patch.

On Mon, Nov 04, 2024 at 09:50:56AM +0100, Stanislaw Gruszka wrote:
> For diagnostics purposes read firmware version from device
> and print it to dmesg during initialization.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/usb/misc/usb-ljca.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index 062b7fb47114..0f8751c51bf6 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -43,6 +43,7 @@ enum ljca_client_type {
>  
>  /* MNG client commands */
>  enum ljca_mng_cmd {
> +	LJCA_MNG_GET_VERSION = 1,
>  	LJCA_MNG_RESET = 2,
>  	LJCA_MNG_ENUM_GPIO = 4,
>  	LJCA_MNG_ENUM_I2C = 5,
> @@ -68,6 +69,13 @@ struct ljca_msg {
>  	u8 data[] __counted_by(len);
>  } __packed;
>  
> +struct ljca_fw_version {
> +	u8 major;
> +	u8 minor;
> +	__le16 patch;
> +	__le16 build;
> +} __packed;
> +
>  struct ljca_i2c_ctr_info {
>  	u8 id;
>  	u8 capacity;
> @@ -694,6 +702,24 @@ static int ljca_reset_handshake(struct ljca_adapter *adap)
>  	return 0;
>  }
>  
> +static void ljca_print_fw_version(struct ljca_adapter *adap)
> +{
> +	struct ljca_fw_version version = {};
> +	int ret;
> +
> +	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_GET_VERSION, NULL, 0,
> +			(u8 *)&version, sizeof(version), true, LJCA_WRITE_ACK_TIMEOUT_MS);

This would be nicer wrapped to up to 80 chars per line.

> +
> +	if (ret != sizeof(version)) {
> +		dev_err(adap->dev, "Get version failed, ret: %d\n", ret);
> +		return;
> +	}
> +
> +	dev_info(adap->dev, "Firmware version: %d.%d.%d.%d\n",
> +		 version.major, version.minor,
> +		 le16_to_cpu(version.patch), le16_to_cpu(version.build));
> +}
> +
>  static int ljca_enumerate_clients(struct ljca_adapter *adap)
>  {
>  	struct ljca_client *client, *next;
> @@ -810,6 +836,8 @@ static int ljca_probe(struct usb_interface *interface,
>  	if (ret)
>  		goto err_free;
>  
> +	ljca_print_fw_version(adap);
> +
>  	pm_runtime_set_autosuspend_delay(&usb_dev->dev, 10);
>  	usb_enable_autosuspend(usb_dev);
>  

-- 
Regards,

Sakari Ailus

