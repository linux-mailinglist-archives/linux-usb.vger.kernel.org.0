Return-Path: <linux-usb+bounces-36046-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBXyJPL21GlkzQcAu9opvQ
	(envelope-from <linux-usb+bounces-36046-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 14:22:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C93813AE415
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 14:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A4C2301533B
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 12:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F0A3B38AF;
	Tue,  7 Apr 2026 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvFK+zAd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CFE3B2FDF;
	Tue,  7 Apr 2026 12:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564521; cv=none; b=IOYWqCnUgpHbbm7bWA4zzpjg4d2tticZe3VAHc1DzcIe+VRa6O7I5wOdF1DjO0B7l8xETKnCdVN9kqQ7Oj+76EXJ/49rQVNhCaOjVOVA3wlM0rstRWX9Jc12vthrdXrY5U3Uu8XhYNWyrcSyczSoh1a+k78xiUTWhsycqFD/3YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564521; c=relaxed/simple;
	bh=uYg3pZIB2gccaufoerf7Z2DqCj1D5S5YRqnE7f53jYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEpZLLhy/KmWbHuTG9f2SmXi386qlMUwvKBYI736uLNuXIpZrRfrllmOFsi7NGdfjuvut0Fumnminnh0a+v6WWwbQZoccKIcefMmCyTiGpkpR6lHdbtOouxgT9kSTqwzrnhQYRiIx1y2s2Pyig6iyK13jE/DwVTz3rAzzAEQQPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvFK+zAd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775564520; x=1807100520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uYg3pZIB2gccaufoerf7Z2DqCj1D5S5YRqnE7f53jYE=;
  b=mvFK+zAdLQuH6rsD7AqLrTVS9WTs8cYkpNVgo3s8aNbEvbwXc/3+FC1u
   8NAEN9x93RmoXCIMnGTeyz8SRdRtwIMrhGpTG7lx5Ce8JksxSiarrYbBC
   HF/soOpTQnFHUCIObSiMv1Mtcz4ac+SlXcmVnhDorrDQkuhzKMbsR/4HN
   SS50PDcYLKACdv1BhyPOd1tF1F2ezK5z9JNX/meqPn265KfGHlmIsA/XU
   pKFAmzzfYn4+eb2mqQVwrtRiWBV4tJf0DSUdx3HicW87nQvxQ5hZl7uWZ
   JEDlI/kyRVWJJSkXejfdkY/hEFDiEGylSuHo6JxVFx6Ogy4PP1s2XBTtZ
   g==;
X-CSE-ConnectionGUID: cK8TNi9GR3KQU3sQEEAyFg==
X-CSE-MsgGUID: VxxkIGhVSX2KJXzuSO+gpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76241870"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76241870"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:22:00 -0700
X-CSE-ConnectionGUID: NA/OqzuxTf2No8pFGseiLA==
X-CSE-MsgGUID: B2lynuH7SqWUVMTA8DGTZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="224968124"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 07 Apr 2026 05:21:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9B53695; Tue, 07 Apr 2026 14:21:56 +0200 (CEST)
Date: Tue, 7 Apr 2026 15:21:07 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jameson Thies <jthies@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org,
	gregkh@linuxfoundation.org, akuchynski@chromium.org,
	abhishekpandit@chromium.org
Subject: Re: [PATCH v1] usb: typec: ucsi: Set usb mode on partner change
Message-ID: <adT2s8bAe-rbRkrn@kuha>
References: <20260402182438.867396-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402182438.867396-1-jthies@google.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36046-lists,linux-usb=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C93813AE415
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thu, Apr 02, 2026 at 06:24:38PM +0000, Jameson Thies kirjoitti:
> Currently the partner usb_mode is only set in ucsi_register_partner().
> If the partner enters USB4 operation after it is registered, this is not
> reported to the typec class. The UCSI spec states that the Connector
> Partner Changed bit can represent a Connector Partner Flags change. When
> handling a UCSI partner change, check the partner flags for USB4
> operation.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index fe1fb8a68a1d..e6fd2e2eba94 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1182,6 +1182,12 @@ static void ucsi_partner_change(struct ucsi_connector *con)
>  			if (UCSI_CONSTAT(con, PARTNER_FLAG_USB))
>  				typec_set_mode(con->port, TYPEC_STATE_USB);
>  		}
> +
> +		if (((con->ucsi->version >= UCSI_VERSION_3_0 &&
> +		    UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN4)) ||
> +		    (con->ucsi->version >= UCSI_VERSION_2_0 &&
> +		    UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN3))) && con->partner)
> +			typec_partner_set_usb_mode(con->partner, USB_MODE_USB4);
>  	}
>  
>  	if ((!UCSI_CONSTAT(con, PARTNER_FLAG_USB)) &&

-- 
heikki

