Return-Path: <linux-usb+bounces-31389-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEC7CB61AF
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 14:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2789A305657E
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 13:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4072C0F6D;
	Thu, 11 Dec 2025 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaqfvqGk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E3280324;
	Thu, 11 Dec 2025 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461260; cv=none; b=k1cQcol2LU5CwYNEBTDX+R4xeVVeagFjx9mq3bZ96DqGkDZu9uKRiugF0KUbpDLnapK3bIgRn/RO1JuDbQtDpNonfEawt7N3T+VHoYO5O2wvSTOmvMBcH6sAa2LZfFxq9I/O5Yi9W5I4d064x5jjoVqHrpQ0GHLh2QvBlCtQBlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461260; c=relaxed/simple;
	bh=FaSdacCpAbFTLsnQIEHi7n83dqcDe0JM6TM0NGzf414=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ly0u7TJDUDoSOdRx5tbrbstzJtj4ZUjNpR9sJfH3T7AMFh9ITyOc55bjRRv3hcsXsk/VuPcXZWQKXh3Ni4/qQjeTnuP59Z87NU5MNKz/V11yOGad7PtqQDv4Bwlmx4Mdsz3Qd4D1nw6zvVF4iopAWFvvQjQleSzU2G2rLLO7/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaqfvqGk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765461259; x=1796997259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FaSdacCpAbFTLsnQIEHi7n83dqcDe0JM6TM0NGzf414=;
  b=DaqfvqGk437VQKctxWorZUUXs/dDyDCGx7ZFjJsgDPHPgo7EjZ8ceTq3
   yVJMMWibfWl0i9JAXgSdAUdRQ+9UlWhMZQbf+T1/2O0JS4CR1MrX2luXJ
   XqgtjcTOeNQU0+SI5qMvQZDrAD9uuLFni2lmzjAwZXpUeWv9n5NROpFrG
   tMmU/Me8Kl4ZVGHwcOEM2Kn3+7SrsQ86ZMxcolxu9qa9vExr0q0yfbR8j
   OBi+b/36xYb9IxjJ2aeJNBjwWN/z3lF7slaOd3bjHpoxGy/nAEkDfwHkG
   jkNrNxMv1VS3ZIi8AtnUq+MsrxZK6G8WdZ9KhwhFvsaMy573vqaQNUJO5
   Q==;
X-CSE-ConnectionGUID: yuqU9WV0RlSmsP6ztBjKaw==
X-CSE-MsgGUID: yrX71wmLScmP4KxTr6tXVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67515442"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67515442"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:54:18 -0800
X-CSE-ConnectionGUID: va1Il0S1QTODxUDnUFDzEA==
X-CSE-MsgGUID: fodiUSOpReadx7CMtDgm9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196072049"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.61])
  by orviesa010.jf.intel.com with SMTP; 11 Dec 2025 05:54:14 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 11 Dec 2025 15:54:03 +0200
Date: Thu, 11 Dec 2025 15:54:03 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Benson Leung <bleung@chromium.org>
Cc: sebastian.reichel@collabora.com, gregkh@linuxfoundation.org,
	jthies@google.com, bleung@google.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: typec: ucsi: psy: Fix ucsi_psy_get_current_now
 in non-PD cases
Message-ID: <aTrM-1HiOtnLtLyc@kuha>
References: <20251208174918.289394-1-bleung@chromium.org>
 <20251208174918.289394-2-bleung@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208174918.289394-2-bleung@chromium.org>

Mon, Dec 08, 2025 at 05:48:47PM +0000, Benson Leung kirjoitti:
> current_now would always return 0 in for non-PD power sources, and the
> negotiated current based on the Request RDO in PD mode.
> 
> For USB Type-C current or legacy Default USB cases current_now will present
> the max value of those modes, as that is the equivalent of the Request RDO
> in PD.
> 
> Also, current_now will now return 0 when the port is disconnected to match
> the same behavior of current_max.
> 
> Signed-off-by: Benson Leung <bleung@chromium.org>

Looks good to me. Shouldn't this be applied also to the stable trees?

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/psy.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index 3abe9370ffaa..b828719e33df 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -202,10 +202,28 @@ static int ucsi_psy_get_current_max(struct ucsi_connector *con,
>  static int ucsi_psy_get_current_now(struct ucsi_connector *con,
>  				    union power_supply_propval *val)
>  {
> -	if (UCSI_CONSTAT(con, PWR_OPMODE) == UCSI_CONSTAT_PWR_OPMODE_PD)
> -		val->intval = rdo_op_current(con->rdo) * 1000;
> -	else
> +	if (!UCSI_CONSTAT(con, CONNECTED)) {
>  		val->intval = 0;
> +		return 0;
> +	}
> +
> +	switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
> +	case UCSI_CONSTAT_PWR_OPMODE_PD:
> +		val->intval = rdo_op_current(con->rdo) * 1000;
> +		break;
> +	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
> +		val->intval = UCSI_TYPEC_1_5_CURRENT * 1000;
> +		break;
> +	case UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0:
> +		val->intval = UCSI_TYPEC_3_0_CURRENT * 1000;
> +		break;
> +	case UCSI_CONSTAT_PWR_OPMODE_BC:
> +	case UCSI_CONSTAT_PWR_OPMODE_DEFAULT:
> +	/* UCSI can't tell b/w DCP/CDP or USB2/3x1/3x2 SDP chargers */
> +	default:
> +		val->intval = UCSI_TYPEC_DEFAULT_CURRENT * 1000;
> +		break;
> +	}
>  	return 0;
>  }
>  
> -- 
> 2.52.0.223.gf5cc29aaa4-goog

-- 
heikki

