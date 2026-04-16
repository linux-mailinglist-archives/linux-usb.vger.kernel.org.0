Return-Path: <linux-usb+bounces-36271-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADk0FbGr4GkCkwAAu9opvQ
	(envelope-from <linux-usb+bounces-36271-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 11:28:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A324840C59E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 11:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78A7431AF7A0
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 09:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7913392811;
	Thu, 16 Apr 2026 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ap94uOsO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102BC3BB57;
	Thu, 16 Apr 2026 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331403; cv=none; b=GnPP8F3PqFS/ZMrdvcwTe25TPXAQALkq6g63ecpWvruZk8CNvqcMFcci9Gh3qC/PToB70Ea6sMeD7RrNYLu83baN1DXRd1cHy1HKsehnyb4Fm+j4XT6cCmjPnZUq6HGDww75J9dpxpVUK9TSFgIIPDne9Dtc0EiM0Rv6LIYW2xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331403; c=relaxed/simple;
	bh=BiOroty+4tMLVSCVNLjdt2BqV7cauMWIPzl2wGTcNQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unyIMFTxEtI3rV2k66J+LB+JcEVZxsL/VQr7z4MGRVUZbg3LVxlouhxaWy/I3mmAxOku+ecRUohCfi4LjUnkcR2DMjmkP3l8wcKLMwn4Ma8lBvh2OZzc/O6KPJFFiYZ5cXtGXk1f6vPo3MnwPOayIp0Pw6qr24F5YeBVbjOBx/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ap94uOsO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776331402; x=1807867402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BiOroty+4tMLVSCVNLjdt2BqV7cauMWIPzl2wGTcNQo=;
  b=Ap94uOsOhWxfpPoTZprwfZAIr0swa/SOov9Wod0nhrYh/C6md6oPK1yM
   p6q+g8YAJt9zTnVUfjT+MGSzS4a2UGIqpYEZUNpUKfBIF2gJmvlw/N9/l
   QvQEZmKcX9nYjP9BbgNNgCyUSbMsClMkgSOIxz49vKHnQu60vPlugDxIk
   U9I8nslIvxslBO+WYK1YqTWs3DP/h8rGMnzLshyGD/NnbB+EtvyPVmcf9
   16UfEC5eWeIzRtopm4YMoq4V/TBACTyEf3PusIL6lUxBXOGRscSjuGmwt
   yhApMlieJp12+LV7YiM2m0SLpVYqcn7IwL+6Q02aW6pwxtFgDIVWCxHlv
   g==;
X-CSE-ConnectionGUID: rZU1WF2oQrCsVWuQZgf1wg==
X-CSE-MsgGUID: M/To/TXLR6O9cyjwQBfe9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77507541"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77507541"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 02:23:21 -0700
X-CSE-ConnectionGUID: nlk2imh8TsC+WwOyg3XFRQ==
X-CSE-MsgGUID: PolV7t/vTWKsRCM8VMH71Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="253926695"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 16 Apr 2026 02:23:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id D382495; Thu, 16 Apr 2026 11:23:17 +0200 (CEST)
Date: Thu, 16 Apr 2026 12:22:26 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <aeCqUma3QeGoIFJL@kuha>
References: <20260413073552.894395-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413073552.894395-1-acelan.kao@canonical.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36271-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,canonical.com:email]
X-Rspamd-Queue-Id: A324840C59E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 03:35:49PM +0800, Chia-Lin Kao (AceLan) wrote:
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
> v4. rebase
> v3. 1. move ucsi_altmode_is_duplicate() before ucsi_register_altmodes_nvidia()
>        for later modification on ucsi_register_altmodes_nvidia()
>     2. use struct typec_altmode **altmodes to simplify the logic
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 76 +++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index f181afca2bb28..eebbb80fae566 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -498,6 +498,73 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
>  	return ret;
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
> +	struct typec_altmode **altmodes;
> +	const char *recipient_name;
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

What is this loop meant to do? It will now always return true because
the svid is always from one of the altmodes in the alt_batch, no?

The "batch" here means what the PPM returns to the GET_ALTERNATE_MODES
command (right?), so you can have maximum of two entries in it. So
wouldn't it be simpler to just check if there is two (instead of only
the one that was requested) altmodes returned, and then just directly
compare the two (alt[0].* == alt[1].*)?

> +	/* Check for duplicates in already registered altmodes */
> +
> +	switch (recipient) {
> +	case UCSI_RECIPIENT_CON:
> +		altmodes = con->port_altmode;
> +		recipient_name = "port";
> +		break;
> +	case UCSI_RECIPIENT_SOP:
> +		altmodes = con->partner_altmode;
> +		recipient_name = "partner";
> +		break;
> +	case UCSI_RECIPIENT_SOP_P:
> +		altmodes = con->plug_altmode;
> +		recipient_name = "plug";
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
> +		if (!altmodes[k])
> +			break;
> +
> +		/* Check SVID for all, VDO only for non-SOP */
> +		if (altmodes[k]->svid != svid)
> +			continue;
> +		if (recipient != UCSI_RECIPIENT_SOP && altmodes[k]->vdo != vdo)
> +			continue;
> +
> +		if (recipient == UCSI_RECIPIENT_SOP) {
> +			dev_warn(con->ucsi->dev,
> +				 "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x (VDO 0x%08x vs 0x%08x) at offset %d, ignoring. Please update your system firmware.\n",
> +				 con->num, recipient_name, svid, altmodes[k]->vdo, vdo, offset);
> +		} else {
> +			dev_warn_once(con->ucsi->dev,
> +				      "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset %d, ignoring. Please update your system firmware.\n",
> +				      con->num, recipient_name, svid, offset);

You have to clean up these prints. Provide a helper function for them.
You can split the print in two. A generic part, and separate for
details if necessary.

With the "recipient_name" I would use a lookup table.

> +		}
> +		return true;
> +	}
> +
> +	return false;
> +}

thanks,

-- 
heikki

