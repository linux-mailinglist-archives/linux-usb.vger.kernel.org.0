Return-Path: <linux-usb+bounces-8736-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B531895180
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 13:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B1DF1F23DB9
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 11:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A981069D31;
	Tue,  2 Apr 2024 11:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmaIL5Pe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32CF627E8
	for <linux-usb@vger.kernel.org>; Tue,  2 Apr 2024 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056218; cv=none; b=KOOhNu22n5gUY38rGlcwKhJ/Ag8mZmdiW/JcTLJrcLPsggylmwvSZEZFcNYnQzwugx70/80x79NVIJXPzCyZ8LQieVaetm7Uv9zlGldT33ZMAdxjsK7oW5Ii8HLCtsn5yLphKk3fMYj1y3SSzb/SoGWjLvABOcLfvlmFR9+CAfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056218; c=relaxed/simple;
	bh=CjsMd5sW/WZNkRb0zSSxjKe3R9mfl+xaZ0ShNeNRl3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2DO5+E1XN64UmsMiR1h/+fcbBA2aokJRawe6cXEYmHqvZ+JHAbRKQYkfsqkrPzQoG3uKQMnBI/ZS6zvwunNpGKmg/z3XbvRiyaNssj2A7hvOVWMC5Q2FWwZ+BP1xm9UT1kqnl3afmCC4EaNhQA6fnOqNS3ui4RQ5rxZEa/nXGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmaIL5Pe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712056217; x=1743592217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CjsMd5sW/WZNkRb0zSSxjKe3R9mfl+xaZ0ShNeNRl3I=;
  b=GmaIL5PeN0Ve9rMsR/FMrNNhtYKAlCNCepV0LNgj1x2l6ey5EMXSgoP7
   tD8EDTab6tgkVHtrkcsBPyROvTTskC9fzWqTQW+gKid8NMeaNUyAjRK6P
   2fXZ69boP/Ux9YPxTcERn/OcPeM5g7GO8elBvCUHBDyg1u6NQFmHWgthk
   X6/dARoUntHGZTOuWai2RlZ/vtmAacBzqU5UmyctDhKZW55F5QuJU1JiZ
   wSTzXVADm5F0jNe95h7nfbyVUi6WTI93VI7XlgnJb+iAlBfT5euYLa2eE
   XBO0sAtLP6ISKEpooSjRwUrj1J2mSrx/QJvdntDABOLlobpPFPIHbNTpU
   w==;
X-CSE-ConnectionGUID: TlERDzQ1TQyn3LctuQvnhQ==
X-CSE-MsgGUID: 6qBEpZ0HRMKHvnXac5xXNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17790526"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="17790526"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 04:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083358"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083358"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2024 04:10:13 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Apr 2024 14:10:12 +0300
Date: Tue, 2 Apr 2024 14:10:12 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: gregkh@linuxfoundation.org, dmitry.baryshkov@linaro.org,
	luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH] usb: typec: ptn36502: Only select DRM_AUX_BRIDGE with OF
Message-ID: <ZgvnlOK/84GLdV2V@kuha.fi.intel.com>
References: <20240328-fix-ptn36502-drm_aux_bridge-select-v1-1-85552117e26e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328-fix-ptn36502-drm_aux_bridge-select-v1-1-85552117e26e@kernel.org>

On Thu, Mar 28, 2024 at 09:03:20AM -0700, Nathan Chancellor wrote:
> CONFIG_DRM_AUX_BRIDGE depends on CONFIG_OF but that dependency is not
> included when CONFIG_TYPEC_MUX_PTN36502 selects it, resulting in a
> Kconfig warning when CONFIG_OF is disabled:
> 
>   WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
>     Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>     Selected by [m]:
>     - TYPEC_MUX_PTN36502 [=m] && USB_SUPPORT [=y] && TYPEC [=m] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
> 
> Only select CONFIG_DRM_AUX_BRIDGE when CONFIG_DRM_BRIDGE and CONFIG_OF
> are enabled to clear up the warning. This results in no functional
> change because prior to the refactoring that introduces this warning,
> ptn36502_register_bridge() returned 0 when CONFIG_OF was disabled, which
> continues to occur with drm_aux_bridge_register() when
> CONFIG_DRM_AUX_BRIDGE is not enabled.
> 
> Fixes: 9dc28ea21eb4 ("usb: typec: ptn36502: switch to DRM_AUX_BRIDGE")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index 4827e86fed6d..ce7db6ad3057 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -60,7 +60,7 @@ config TYPEC_MUX_PTN36502
>  	tristate "NXP PTN36502 Type-C redriver driver"
>  	depends on I2C
>  	depends on DRM || DRM=n
> -	select DRM_AUX_BRIDGE if DRM_BRIDGE
> +	select DRM_AUX_BRIDGE if DRM_BRIDGE && OF
>  	select REGMAP_I2C
>  	help
>  	  Say Y or M if your system has a NXP PTN36502 Type-C redriver chip
> 
> ---
> base-commit: ef83531c8e4a5f2fc9c602be7e2a300de1575ee4
> change-id: 20240328-fix-ptn36502-drm_aux_bridge-select-83ddfd8a5375
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>

-- 
heikki

