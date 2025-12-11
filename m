Return-Path: <linux-usb+bounces-31390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C29CB620F
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 15:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 422143015172
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 14:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C9B2D0603;
	Thu, 11 Dec 2025 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbq87dbr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607FC2C21D5;
	Thu, 11 Dec 2025 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461670; cv=none; b=H5BVkUOaxVqVZdaV/wH2Wt4vvLgNUAoDcfOShuct6p1eISJfz3v8kVKZE6/NsgAAesr4eXl4u2VAZCMz9B1u8+TEZKZza9+8cgS7pxSwdN2SDY/qaW/aKc/ozsXZkvvKiquOAaeU8SquM8EkpO/9GASWyuvjMkJHpkaL15Suhd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461670; c=relaxed/simple;
	bh=sqjm7hjkYN73ciksm6+Vj56sOVUKJQ6nrogir+IDDBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LH1BetyIBgVYoESo0yAjE0oJJOSyPzKIlUumiJUbHtuYsLBepinAYpIuRlTvUUKO805ryyB3eiuY7Hfhvya5jSCfD9JzyVBxGVpmZVx2SQx71YV6O5tFsuGQ8ZXw8JH5FrESyHT3wsEmQBnWpXfmSaYfo5XEkUjuDBBSPb/nI3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbq87dbr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765461669; x=1796997669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sqjm7hjkYN73ciksm6+Vj56sOVUKJQ6nrogir+IDDBA=;
  b=dbq87dbrPQJbxTPOmFO2hHRW0MgNNNoQHNsxyYlwiULyH81/Gpl5YRr3
   a6wcMT3jWgvtDSlP3NSheN+kpQaQYsJJTrmxa8Gk0z3Ba1fYQ2miPoHUy
   do+vQOtRyaqqTTvmfGCDgkauEjBwBSrnkBkSrfrERKdArQDm7qNM7J1SM
   Ra4ebtwmlRk64JicUhkw6rdxBow1tY0f6m+i+O6WD1FtNt9nBI+4ImU82
   n+Pfx3uz2B5zCvfqSaF80c3qDRq6Ae4DQpJ7zhJXgTrSwInB5xVByi+f+
   r2ABmxiF4AmJjiPF0wzwn3ubbb1SxMNCoAWQZooox9M9gf5S8J7pLpkj5
   Q==;
X-CSE-ConnectionGUID: ZVVc0iY1QzS3DeNLJOXPwg==
X-CSE-MsgGUID: m27v3zihRpq6ZIX6p43u8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67491330"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67491330"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 06:01:08 -0800
X-CSE-ConnectionGUID: SUCqP+dcQaG4MHin4f6JMg==
X-CSE-MsgGUID: ShKsBsgRQ9iVD6f4PB/1KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201231338"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.61])
  by fmviesa005.fm.intel.com with SMTP; 11 Dec 2025 06:01:04 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 11 Dec 2025 16:00:54 +0200
Date: Thu, 11 Dec 2025 16:00:54 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Benson Leung <bleung@chromium.org>
Cc: sebastian.reichel@collabora.com, gregkh@linuxfoundation.org,
	jthies@google.com, bleung@google.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: ucsi: psy: Fix voltage and current max
 for non-Fixed PDOs
Message-ID: <aTrOlgu1twt1f9Py@kuha>
References: <20251208174918.289394-1-bleung@chromium.org>
 <20251208174918.289394-3-bleung@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208174918.289394-3-bleung@chromium.org>

Mon, Dec 08, 2025 at 05:48:48PM +0000, Benson Leung kirjoitti:
> ucsi_psy_get_voltage_max and ucsi_psy_get_current_max are calculated
> using whichever pdo is in the last position of the src_pdos array, presuming
> it to be a fixed pdo, so the pdo_fixed_voltage or pdo_max_current
> helpers are used on that last pdo.
> 
> However, non-Fixed PDOs such as Battery PDOs, Augmented PDOs (used for AVS and
> for PPS) may exist, and are always at the end of the array if they do.
> In the event one of these more advanced chargers are attached the helpers for
> fixed return mangled values.
> 
> Here's an example case of a Google Pixel Flex Dual Port 67W USB-C Fast Charger
> with PPS support:
> POWER_SUPPLY_NAME=ucsi-source-psy-cros_ec_ucsi.4.auto2
> POWER_SUPPLY_TYPE=USB
> POWER_SUPPLY_CHARGE_TYPE=Standard
> POWER_SUPPLY_USB_TYPE=C [PD] PD_PPS PD_DRP
> POWER_SUPPLY_ONLINE=1
> POWER_SUPPLY_VOLTAGE_MIN=5000000
> POWER_SUPPLY_VOLTAGE_MAX=13400000
> POWER_SUPPLY_VOLTAGE_NOW=20000000
> POWER_SUPPLY_CURRENT_MAX=5790000
> POWER_SUPPLY_CURRENT_NOW=3250000
> 
> Voltage Max is reading as 13.4V, but that's an incorrect decode of the PPS
> APDO in the last position. Same goes for CURRENT_MAX. 5.79A is incorrect.
> 
> Instead, enumerate through the src_pdos and filter just for Fixed PDOs for
> now, and find the one with the highest voltage and current respectively.
> 
> After, from the same charger:
> POWER_SUPPLY_NAME=ucsi-source-psy-cros_ec_ucsi.4.auto2
> POWER_SUPPLY_TYPE=USB
> POWER_SUPPLY_CHARGE_TYPE=Standard
> POWER_SUPPLY_USB_TYPE=C [PD] PD_PPS PD_DRP
> POWER_SUPPLY_ONLINE=1
> POWER_SUPPLY_VOLTAGE_MIN=5000000
> POWER_SUPPLY_VOLTAGE_MAX=20000000
> POWER_SUPPLY_VOLTAGE_NOW=20000000
> POWER_SUPPLY_CURRENT_MAX=4000000
> POWER_SUPPLY_CURRENT_NOW=3250000
> 
> Signed-off-by: Benson Leung <bleung@chromium.org>

Stable material as well?

Instead of using the ternary operator you could have used a simple if
statement. But that's minor.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/psy.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index b828719e33df..c8ebab8ba7e7 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -112,15 +112,20 @@ static int ucsi_psy_get_voltage_max(struct ucsi_connector *con,
>  				    union power_supply_propval *val)
>  {
>  	u32 pdo;
> +	int max_voltage = 0;
>  
>  	switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
>  	case UCSI_CONSTAT_PWR_OPMODE_PD:
> -		if (con->num_pdos > 0) {
> -			pdo = con->src_pdos[con->num_pdos - 1];
> -			val->intval = pdo_fixed_voltage(pdo) * 1000;
> -		} else {
> -			val->intval = 0;
> +		for (int i = 0; i < con->num_pdos; i++) {
> +			int pdo_voltage = 0;
> +
> +			pdo = con->src_pdos[i];
> +			if (pdo_type(pdo) == PDO_TYPE_FIXED)
> +				pdo_voltage = pdo_fixed_voltage(pdo) * 1000;
> +			max_voltage = (pdo_voltage > max_voltage) ? pdo_voltage
> +								  : max_voltage;
>  		}
> +		val->intval = max_voltage;
>  		break;
>  	case UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0:
>  	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
> @@ -168,6 +173,7 @@ static int ucsi_psy_get_current_max(struct ucsi_connector *con,
>  				    union power_supply_propval *val)
>  {
>  	u32 pdo;
> +	int max_current = 0;
>  
>  	if (!UCSI_CONSTAT(con, CONNECTED)) {
>  		val->intval = 0;
> @@ -176,12 +182,16 @@ static int ucsi_psy_get_current_max(struct ucsi_connector *con,
>  
>  	switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
>  	case UCSI_CONSTAT_PWR_OPMODE_PD:
> -		if (con->num_pdos > 0) {
> -			pdo = con->src_pdos[con->num_pdos - 1];
> -			val->intval = pdo_max_current(pdo) * 1000;
> -		} else {
> -			val->intval = 0;
> +		for (int i = 0; i < con->num_pdos; i++) {
> +			int pdo_current = 0;
> +
> +			pdo = con->src_pdos[i];
> +			if (pdo_type(pdo) == PDO_TYPE_FIXED)
> +				pdo_current = pdo_max_current(pdo) * 1000;
> +			max_current = (pdo_current > max_current) ? pdo_current
> +								  : max_current;
>  		}
> +		val->intval = max_current;
>  		break;
>  	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
>  		val->intval = UCSI_TYPEC_1_5_CURRENT * 1000;
> -- 
> 2.52.0.223.gf5cc29aaa4-goog

-- 
heikki

