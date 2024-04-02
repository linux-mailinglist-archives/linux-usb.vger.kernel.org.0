Return-Path: <linux-usb+bounces-8715-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 576B7894F9D
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 12:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C354281285
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 10:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235795B5BE;
	Tue,  2 Apr 2024 10:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyr1AYgG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615855A11D
	for <linux-usb@vger.kernel.org>; Tue,  2 Apr 2024 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712052623; cv=none; b=bz9RSc1Qwgl4VSjg95ke3lsRf5N7JkZhEgIaArAPKgNj78ceZzDGKIXEFaAxEaQPtcrbAJ2B5avVpbSTcukLSfbm+Sa0Vq41jYpvlkGyftBWLOqhCdcI92Ww0qAUeDTzeIzglHtHE7w9wHzppSZMgEimazI5ov2Opp+mnwj15mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712052623; c=relaxed/simple;
	bh=HHiKN7S3mhz9w8BNxgRrMMnlApr7xK0cTtQUxLu8yfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4JEJR9SBNv+wo3CeS5xEk++xFDIzj6+qqFlimvRmF/QDMszExHNeWK4TcVolwNiKrLwkrMB7VJF4+kq1ccmmAWWT8zkzhVgSrQWzmjbm58fxQapx7R+UdkEJFtq0LjQR2JHnMVh3mGDo5URxlR6gEXiDvYAHu8fE/qdsbf51ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyr1AYgG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712052622; x=1743588622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HHiKN7S3mhz9w8BNxgRrMMnlApr7xK0cTtQUxLu8yfw=;
  b=fyr1AYgGY/fyC/Vm/eeZ5B+E/9DaXDutTcikFRcIyw3utks+l+kvEcDT
   6M0TXarKe87zUUZ8dcsUrAlmEYybcbjjcw2OPgMLwjDqdbs5phNcQTCcd
   ilLMffaLEZL84qQauj9j2h2aZ/EZHuaMiiBbsTN3n5z93l7Bv8H15rqb1
   fwf7jvJA/0wsyR6YAQdDKFu9IOZ9+GJztSzE/zYCcQO4Nz41wungVFLDT
   S5X/Viyz6NWIkNESaUQigRVt0HWSCSXMYFt/ucM1qZmJWmJiYwYNsAHz3
   rkgDbEzNeLRD3PV0fxHhBm0MjUSEc1KUVKR0gzgo7snH/M7AvwwCflW1F
   g==;
X-CSE-ConnectionGUID: M7k7C3hNTDKECVWbHf2nfQ==
X-CSE-MsgGUID: EkmqHQyyQlqEJ7jgy5GkRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="24669907"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="24669907"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 03:10:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083262"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083262"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2024 03:10:17 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Apr 2024 13:10:16 +0300
Date: Tue, 2 Apr 2024 13:10:16 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: gregkh@linuxfoundation.org, pmalani@chromium.org, jthies@google.com,
	neil.armstrong@linaro.org, abhishekpandit@chromium.org,
	fabrice.gasnier@foss.st.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Only enable supported notifications
Message-ID: <ZgvZiOSbT3c8gibQ@kuha.fi.intel.com>
References: <yhz7nq622mbg3rqsyvqz632pc756niagpfbnzayfswhzo7esho@vrdtx5c3hjgx>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yhz7nq622mbg3rqsyvqz632pc756niagpfbnzayfswhzo7esho@vrdtx5c3hjgx>

On Wed, Mar 27, 2024 at 12:11:42PM +0000, Diogo Ivo wrote:
> The UCSI specification defines some notifications to be optional for the
> PPM to support. From these only enable the ones the PPM informs us are
> actually supported.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index cf52cb34d285..0c8f3b3a99d6 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1626,6 +1626,27 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  	return ret;
>  }
>  
> +static u64 ucsi_get_supported_notifications(struct ucsi *ucsi)
> +{
> +	u8 features = ucsi->cap.features;
> +	u64 ntfy = UCSI_ENABLE_NTFY_ALL;
> +
> +	if (!(features & UCSI_CAP_ALT_MODE_DETAILS))
> +		ntfy &= ~UCSI_ENABLE_NTFY_CAM_CHANGE;
> +
> +	if (!(features & UCSI_CAP_PDO_DETAILS))
> +		ntfy &= ~(UCSI_ENABLE_NTFY_PWR_LEVEL_CHANGE |
> +			  UCSI_ENABLE_NTFY_CAP_CHANGE);
> +
> +	if (!(features & UCSI_CAP_EXT_SUPPLY_NOTIFICATIONS))
> +		ntfy &= ~UCSI_ENABLE_NTFY_EXT_PWR_SRC_CHANGE;
> +
> +	if (!(features & UCSI_CAP_PD_RESET))
> +		ntfy &= ~UCSI_ENABLE_NTFY_PD_RESET_COMPLETE;
> +
> +	return ntfy;
> +}
> +
>  /**
>   * ucsi_init - Initialize UCSI interface
>   * @ucsi: UCSI to be initialized
> @@ -1679,8 +1700,8 @@ static int ucsi_init(struct ucsi *ucsi)
>  			goto err_unregister;
>  	}
>  
> -	/* Enable all notifications */
> -	ntfy = UCSI_ENABLE_NTFY_ALL;
> +	/* Enable all supported notifications */
> +	ntfy = ucsi_get_supported_notifications(ucsi);
>  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
>  	ret = ucsi_send_command(ucsi, command, NULL, 0);
>  	if (ret < 0)
> -- 
> 2.44.0

-- 
heikki

