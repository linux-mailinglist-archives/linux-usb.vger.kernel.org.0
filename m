Return-Path: <linux-usb+bounces-19057-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72763A03BFE
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 11:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68C5D165FC7
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 10:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38181E5739;
	Tue,  7 Jan 2025 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLuLj4o9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52311E47CD;
	Tue,  7 Jan 2025 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245000; cv=none; b=h+l0H7HQVgCftQHxGmBA17/7Vo5ZAXZDfEuYrN316QMiLQ8UJrR83qmmXLIRsTubZbB8b4mGJsSfs0IOisvIyTKsw0FUArBIgesRg3kV/qJOo5TET8Xr6oW0/VReTTLGwWB0fMfiiKcE5uYB7jgAg836IsPmuiTeGKw8vvHreIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245000; c=relaxed/simple;
	bh=gz98akC1Quhhh/rysknajIkYXURQu7s7Ns+4dCyU09s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+MqzYB5kx7IvMRZF/7vyJyZbQRzMkH0E26oiWsQTgwm0APu+9+cikWHGkaraRuUXILMCQBwv8j5YlrL/aVNl8TKuYmeGPKuG5ohbdY2xygQvpHRv02pbfFub6Xtu3RAnpN1D8R0FigXmHKyfXVyoAmHZo61SNomK1eU8owzdmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLuLj4o9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736244998; x=1767780998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gz98akC1Quhhh/rysknajIkYXURQu7s7Ns+4dCyU09s=;
  b=gLuLj4o9G/ft29xcSJNZWL89Y/z9ycZVogw55PAbgbOFUZlT+OmQ96qP
   i2INcK8tyr0ue0trqI/sbAPj2VjsKlnxj+a3eMS398fa00islKV/v0aaW
   bHHnc+agBKfapayrVs2OBbHLBuaxZNQX8b7LdPV6IHaLDTpTNKseL4OA9
   E/XT53hTCHG4B8kOOrpwRSiA2+Pyz2zwoIBz2rFB6nlG6cWMKxN8Qs+NK
   uzr3zRUauUunwezFKt+YyJC2HTf3yXu+NX76aRezG4mbGXozL9ujrJUVv
   8+zEcvXh6Hvti3iOeLWuAdsNc8+KDQ4XU7QaUIxW6LQm19AMTgA/05SQK
   A==;
X-CSE-ConnectionGUID: dKVKTOV2RlWFfRmzX8cuxg==
X-CSE-MsgGUID: trTtbMftRRqosRZBA4QlZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36298901"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="36298901"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 02:16:37 -0800
X-CSE-ConnectionGUID: Y+hmQIglTTGXiHKtutqdZQ==
X-CSE-MsgGUID: Td6jNGKbTxCrV0utf4YRPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="102540290"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa009.jf.intel.com with SMTP; 07 Jan 2025 02:16:34 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 07 Jan 2025 12:16:32 +0200
Date: Tue, 7 Jan 2025 12:16:32 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: GONG Ruiqi <gongruiqi1@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: fix pm usage counter imbalance in
 ucsi_ccg_sync_control()
Message-ID: <Z3z_AHHPxCmfxMk1@kuha.fi.intel.com>
References: <20250107015750.2778646-1-gongruiqi1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107015750.2778646-1-gongruiqi1@huawei.com>

On Tue, Jan 07, 2025 at 09:57:50AM +0800, GONG Ruiqi wrote:
> The error handling for the case `con_index == 0` should involve dropping
> the pm usage counter, as ucsi_ccg_sync_control() gets it at the
> beginning. Fix it.
> 
> Cc: stable@vger.kernel.org
> Fixes: e56aac6e5a25 ("usb: typec: fix potential array underflow in ucsi_ccg_sync_control()")
> Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> v2: complement `Cc: stable` as requested
> v1: https://lore.kernel.org/all/20241230093523.1237231-1-gongruiqi1@huawei.com/
> 
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index fcb8e61136cf..740171f24ef9 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -646,7 +646,7 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
>  			UCSI_CMD_CONNECTOR_MASK;
>  		if (con_index == 0) {
>  			ret = -EINVAL;
> -			goto unlock;
> +			goto err_put;
>  		}
>  		con = &uc->ucsi->connector[con_index - 1];
>  		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
> @@ -654,8 +654,8 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
>  
>  	ret = ucsi_sync_control_common(ucsi, command);
>  
> +err_put:
>  	pm_runtime_put_sync(uc->dev);
> -unlock:
>  	mutex_unlock(&uc->lock);
>  
>  	return ret;
> -- 
> 2.25.1

-- 
heikki

