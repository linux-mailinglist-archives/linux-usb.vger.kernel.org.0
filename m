Return-Path: <linux-usb+bounces-31166-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B064CA3CBD
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 14:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 825E9303FA4C
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 13:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE41E33FE11;
	Thu,  4 Dec 2025 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cF/xVem3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60F3DF6C;
	Thu,  4 Dec 2025 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854484; cv=none; b=EvT3YsIYbXrskIzHbYjZdhmcgAWfN75EvrDPHdGi499d444w4GW8Hj/TMoNviudKY4Pzv7yxx0gKf8PtZlVupAmKuRHIwm37tLVt9aXl8mVrVGxOEtd49j8wn5kyC6dl8FuLkBndL+LjF6cFL19HCtesPkgTL5xJSbJH4VE1Puo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854484; c=relaxed/simple;
	bh=C+NU6l/RbJsSuvvywwgKFGVwR01FfnEEkNHaEakSK1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaAzLo95CPCh/+sPZ2XStXuNMw97z6QmOKbdICZnnTBusool4QQXLLXKPtfbTJqzsf5O2r4LGZDOYGWCS6Iqn93J4IyLlE27j/Xc8vhpRyAx0syYWk64s1z74v1etR+gSFujzF3swgD6aOPqQ3L/5La/c5Oc36vyMwjeXIWf64s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cF/xVem3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764854482; x=1796390482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C+NU6l/RbJsSuvvywwgKFGVwR01FfnEEkNHaEakSK1Q=;
  b=cF/xVem3MhAcrVJ9bqz9BA+yYsPBPjOJONa1V4SMTMprrPdf7ZSy91QS
   J/Lghd8XaZ+rFCMU8KT6wM8lEchjawP+GHuaG+F+uhJqh2NEMq7sLytiI
   1a5RNH1aEX12VvFJ+acO9bW/fVHMYYAzxW6Kg6lo0ZTUwWAS48cVq1Xso
   r65laLYo29OE6UQg/U6f3W39l1eKwmpZIBfnbAPSKxFOBy9G/EsPE91LI
   +pIXahBaQ44ORzt8QVOWx7/PaTufglpmhgGxrt29cXGWAn0N7U0i4OvYD
   T/BFqR0IDndDHM+zcLnx2w+CxdpEThRcb+IFypR4GsUuwBK2JZQXjVSjM
   g==;
X-CSE-ConnectionGUID: 7RgE/FLUREas6JkNJmf9GA==
X-CSE-MsgGUID: lFuJBLnGSM661Kx+fdOkgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66914005"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="66914005"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 05:21:14 -0800
X-CSE-ConnectionGUID: Shu53dbaR8qnHZFpAssbIQ==
X-CSE-MsgGUID: cR56gBzvRGGn4ahR+TOk3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195795445"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO kuha) ([10.124.220.149])
  by fmviesa010.fm.intel.com with SMTP; 04 Dec 2025 05:21:10 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 04 Dec 2025 15:21:02 +0200
Date: Thu, 4 Dec 2025 15:21:02 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengyu Luo <mitltlatltl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Yue Haibing <yuehaibing@huawei.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: huawei-gaokin: add DRM dependency
Message-ID: <aTGKvnoMaUGAVhLH@kuha>
References: <20251204101111.1035975-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204101111.1035975-1-arnd@kernel.org>

Thu, Dec 04, 2025 at 11:11:07AM +0100, Arnd Bergmann kirjoitti:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Selecting DRM_AUX_HPD_BRIDGE is not possible from a built-in driver when
> CONFIG_DRM=m:
> 
> WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
>   Depends on [m]: HAS_IOMEM [=y] && DRM [=m] && DRM_BRIDGE [=y] && OF [=y]
>   Selected by [y]:
>   - UCSI_HUAWEI_GAOKUN [=y] && USB_SUPPORT [=y] && TYPEC [=y] && TYPEC_UCSI [=y] && EC_HUAWEI_GAOKUN [=y] && DRM_BRIDGE [=y] && OF [=y]
> 
> Add the same dependency we have in similar drivers to work around this.
> 
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> index 7fcb1e1de5d6..b812be4d0e67 100644
> --- a/drivers/usb/typec/ucsi/Kconfig
> +++ b/drivers/usb/typec/ucsi/Kconfig
> @@ -96,6 +96,7 @@ config UCSI_LENOVO_YOGA_C630
>  config UCSI_HUAWEI_GAOKUN
>  	tristate "UCSI Interface Driver for Huawei Matebook E Go"
>  	depends on EC_HUAWEI_GAOKUN
> +	depends on DRM || !DRM
>  	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>  	help
>  	  This driver enables UCSI support on the Huawei Matebook E Go tablet,
> -- 
> 2.39.5

-- 
heikki

