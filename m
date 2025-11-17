Return-Path: <linux-usb+bounces-30556-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF346C6304A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 10:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1F63A987A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 09:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E11A3246E6;
	Mon, 17 Nov 2025 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jB8SC/zV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1B9322A00;
	Mon, 17 Nov 2025 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370039; cv=none; b=RBQBXVzTDjFE7qm7a40UNLmv4tIvpyTpQLfwTJdrYpYRSjleAGfy5hYsph1ZB8ncGXk0Wv4fGSzJvRw8F4Qcc5nGGVM/Pi0Uwzc3lJxU8IHzYW4ktczUTzNX4ph0Wa3G4cEjUSTR6B5uJiiN9vMvSoZlIjf3sUYDAHdczwRV4ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370039; c=relaxed/simple;
	bh=CnZlH0vV28MtgAwWBkUyO60uq2qIefAgnKLr+qSpUNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdl+2D+YIUJ3QsZkny7J4DO1Ud3oDLSMTKHmW5Sq2lZyQiYUhiFX55GucSk29ZpZ1hRT7CTyM86+dcfjf4wlQDMImC8cI2eqfntld9+1k9FklULu5MZnJtS61cNLF62BGC/p7lznKgsI0B9T23lHbfV6IVTJ6JpuLDvtWL0wzU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jB8SC/zV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763370036; x=1794906036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CnZlH0vV28MtgAwWBkUyO60uq2qIefAgnKLr+qSpUNg=;
  b=jB8SC/zVhRP+ZDFektHFcb/xBd5o0iVcJgkJ4A9fQtA7CzJStKYrGK36
   HPQdOVlgNcTC++PusoiMNFv4tEumPk8qn4Daa4G9Fu1b+9rBp/Ht0l+6p
   +1eMFZRgZjWqzbhQyvOdbkz4cDBJm6MOvof+W4VDSRspgYwk8oA7Nskae
   UJxbHvjLt5qIy14a0oxiuQjThsSMJs0zMOwC8erZ/p33uv+2K+OH0f9Ro
   LuG2hs0+tlPGPVrTN4wzoZbo7cwTDljAG8E8GRVlQjXG+HIITcStRrNo7
   nYarn4FzDlfXsml399To1JOM25rgSMGY6063NccSZTAPuR5TZGDIIcRY1
   Q==;
X-CSE-ConnectionGUID: /2zGxayCQei+V+FlHdcS+A==
X-CSE-MsgGUID: hMPEe0QsSqC+dtxgKYY80Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="68984513"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="68984513"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 01:00:35 -0800
X-CSE-ConnectionGUID: JJkVzHRaS9qjo3ZDRsWQgA==
X-CSE-MsgGUID: 4USdg9xTQgGWZrFWZjzC8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190837199"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.220.176])
  by fmviesa009.fm.intel.com with SMTP; 17 Nov 2025 01:00:32 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 17 Nov 2025 11:00:29 +0200
Date: Mon, 17 Nov 2025 11:00:29 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Fedor Pchelkin <boddah8794@gmail.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <aRrkLczHJzONnxtT@kuha.fi.intel.com>
References: <20251111010541.145421-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111010541.145421-1-acelan.kao@canonical.com>

Hi,

Tue, Nov 11, 2025 at 09:05:39AM +0800, Chia-Lin Kao (AceLan) kirjoitti:
> Some firmware implementations incorrectly return the same altmode
> multiple times at different offsets when queried via UCSI_GET_ALTERNATE_MODES.
> This causes sysfs duplicate filename errors and kernel call traces when
> the driver attempts to register the same altmode twice:
> 
>   sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0.0/partner'
>   typec-thunderbolt port0-partner.1: failed to create symlinks
>   typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17
> 
> Detect duplicate altmodes by comparing SVID and VDO before registration.
> If a duplicate is detected, skip it and print a single clean warning
> message instead of generating a kernel call trace:
> 
>   ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0x8087 (VDO 0x8087a043 vs 0x00000001) at offset 1, ignoring. Please update your system firmware.
> 
> This makes the error handling more user-friendly while still alerting
> users to the firmware bug.
> 
> The duplicate detection logic is implemented in a reusable helper
> function ucsi_altmode_is_duplicate() and used in ucsi_register_altmodes().
> The fix applies to all three recipient types: partner (SOP), port (CON),
> and plug (SOP_P) altmodes.
> 
> Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 77 +++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 3f568f790f39..7b79e7491094 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -556,6 +556,74 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
>  	return 0;
>  }
>  
> +/*
> + * Check if an altmode is a duplicate. Some firmware implementations
> + * incorrectly return the same altmode multiple times, causing sysfs errors.
> + * Returns true if the altmode should be skipped.
> + */
> +static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
> +				      const struct ucsi_altmode *alt_batch, int batch_idx,
> +				      u16 svid, u32 vdo, int offset)
> +{
> +	int k;
> +
> +	/* Check for duplicates within the current batch first */
> +	for (k = 0; k < batch_idx; k++) {
> +		if (alt_batch[k].svid == svid && alt_batch[k].mid == vdo) {
> +			dev_warn_once(con->ucsi->dev,
> +				      "con%d: Firmware bug: duplicate altmode SVID 0x%04x in same response at offset %d, ignoring. Please update your system firmware.\n",
> +				      con->num, svid, offset);
> +			return true;
> +		}
> +	}
> +
> +	/* Check for duplicates in already registered altmodes */
> +	if (recipient == UCSI_RECIPIENT_SOP) {
> +		for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
> +			if (!con->partner_altmode[k])
> +				break;
> +			/*
> +			 * Some buggy firmware returns the same SVID multiple times
> +			 * with different VDOs. This causes duplicate device registration
> +			 * and sysfs errors. Check SVID only for partner altmodes.
> +			 */
> +			if (con->partner_altmode[k]->svid == svid) {

I'm not sure this works. Some vendor specific modes always come in
pairs. Check Apple for example. I think you always need to check the
VID on top of the SVID.

> +				dev_warn(con->ucsi->dev,
> +					 "con%d: Firmware bug: duplicate partner altmode SVID 0x%04x (VDO 0x%08x vs 0x%08x) at offset %d, ignoring. Please update your system firmware.\n",
> +					 con->num, svid, con->partner_altmode[k]->vdo,
> +					 vdo, offset);
> +				return true;
> +			}
> +		}
> +	} else if (recipient == UCSI_RECIPIENT_CON) {
> +		for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
> +			if (!con->port_altmode[k])
> +				break;
> +			if (con->port_altmode[k]->svid == svid &&
> +			    con->port_altmode[k]->vdo == vdo) {
> +				dev_warn_once(con->ucsi->dev,
> +					      "con%d: Firmware bug: duplicate port altmode SVID 0x%04x at offset %d, ignoring. Please update your system firmware.\n",
> +					      con->num, svid, offset);
> +				return true;
> +			}
> +		}
> +	} else if (recipient == UCSI_RECIPIENT_SOP_P) {
> +		for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
> +			if (!con->plug_altmode[k])
> +				break;
> +			if (con->plug_altmode[k]->svid == svid &&
> +			    con->plug_altmode[k]->vdo == vdo) {
> +				dev_warn_once(con->ucsi->dev,
> +					      "con%d: Firmware bug: duplicate plug altmode SVID 0x%04x at offset %d, ignoring. Please update your system firmware.\n",
> +					      con->num, svid, offset);
> +				return true;
> +			}
> +		}
> +	}

        struct typec_altmode *altmodes;

        switch (recipient) {
        case UCSI_RECIPIENT_CON:
                altmodes = con->port->altmode;
                break;
        case UCSI_RECIPIENT_SOP_P:
                altmodes = con->plug_altmode;
                break;
        ...

> +
> +	return false;
> +}
> +
>  static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
>  {
>  	int max_altmodes = UCSI_MAX_ALTMODES;
> @@ -605,6 +673,15 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
>  			if (!alt[j].svid)
>  				return 0;
>  
> +			/*
> +			 * Check for duplicates in current batch and already
> +			 * registered altmodes. Skip if duplicate found.
> +			 */
> +			if (ucsi_altmode_is_duplicate(con, recipient, alt, j,
> +						      alt[j].svid, alt[j].mid,
> +						      i - num + j))
> +				continue;
> +
>  			memset(&desc, 0, sizeof(desc));
>  			desc.vdo = alt[j].mid;
>  			desc.svid = alt[j].svid;
> -- 
> 2.43.0

thanks,

-- 
heikki

