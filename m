Return-Path: <linux-usb+bounces-3822-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD2D8083F8
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 10:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F3F71C21D33
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 09:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C911E32C63;
	Thu,  7 Dec 2023 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cH2LhsDK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6F0D5E
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 01:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701940312; x=1733476312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZcE5r+onmRZXLVOd8w757XhOgdVfZWpGAi/Ixy4pJPk=;
  b=cH2LhsDKzfPA9zV6tYfTY4lvDqarV4hP3t3+O2G3MjWT+4pgszM7vg1A
   eiiB7bp8YadXqOnsGXgx9kELroUd3whJdgrogBBWm1flpTqe+MalpNEhB
   7NpVxyiq1TqCU7kb8U9XtpW4v/pARVB+8ePMP2vXMyRQ+G5kZbu6RlYCH
   NmZGVpmD69rQ24IoNzPKAy0vhZEP7pf7BrMRSRE1xE/4fVUh9dkNIG6BJ
   Vr8dGCiDUCYTzTnuPe8ogLlGByu0gBNHzexK1Dq7djJHaGDFLwvAL+EoE
   nICQeC/uGj5A/CA8IetF1B2NPggl+1H6ViYjJGVgMvke+Ax6AUgJVu2ec
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391374006"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="391374006"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 01:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="771658852"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="771658852"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga002.jf.intel.com with SMTP; 07 Dec 2023 01:11:45 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 07 Dec 2023 11:11:44 +0200
Date: Thu, 7 Dec 2023 11:11:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: dmitry.baryshkov@linaro.org, gregkh@linuxfoundation.org,
	linux@roeck-us.net, neil.armstrong@linaro.org,
	bryan.odonoghue@linaro.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, patches@lists.linux.dev
Subject: Re: [PATCH 2/3] usb: typec: qcom-pmic-typec: Only select
 DRM_AUX_HPD_BRIDGE with OF
Message-ID: <ZXGMUA7b4m4cIrv5@kuha.fi.intel.com>
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
 <20231205-drm_aux_bridge-fixes-v1-2-d242a0ae9df4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-2-d242a0ae9df4@kernel.org>

On Tue, Dec 05, 2023 at 01:13:35PM -0700, Nathan Chancellor wrote:
> CONFIG_DRM_AUX_HPD_BRIDGE depends on CONFIG_OF but that dependency is
> not included when CONFIG_TYPEC_QCOM_PMIC selects it, resulting in a
> Kconfig warning when CONFIG_OF is disabled:
> 
>   WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
>     Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>     Selected by [m]:
>     - TYPEC_QCOM_PMIC [=m] && USB_SUPPORT [=y] && TYPEC [=m] && TYPEC_TCPM [=m] && (ARCH_QCOM || COMPILE_TEST [=y]) && (DRM [=m] || DRM [=m]=n) && DRM_BRIDGE [=y]
> 
> Only select CONFIG_DRM_AUX_HPD_BRIDGE with both CONFIG_DRM_BRIDGE and
> CONFIG_OF to clear up the warning.
> 
> Fixes: 7d9f1b72b296 ("usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Shouldn't DRM_BRIDGE depend on/select OF instead?

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 64d5421c69e6..8cdd84ca5d6f 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -80,7 +80,7 @@ config TYPEC_QCOM_PMIC
>  	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on DRM || DRM=n
> -	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>  	help
>  	  A Type-C port and Power Delivery driver which aggregates two
>  	  discrete pieces of silicon in the PM8150b PMIC block: the
> 
> -- 
> 2.43.0

-- 
heikki

