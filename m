Return-Path: <linux-usb+bounces-38249-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKwKLP6LHWqKbwkAu9opvQ
	(envelope-from <linux-usb+bounces-38249-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:41:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 262E7620306
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2065305AD1B
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 13:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3142F3AC0FA;
	Mon,  1 Jun 2026 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoHfEBNd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EA539E167;
	Mon,  1 Jun 2026 13:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321120; cv=none; b=oKAXiPr+J9rRxfp+JCTeQf7Ng8sJ22SrP1kp1Gg1oAjDlznbQUE8aXhkehzcORwte4G6ISYCeASs6EPm/QCCzBe+llISmDYHhcdqxpD9b+BANmxzRIi/5g5EKqD5nrEVO8rLOyhouO/PuzrC0PC7RcdfumgfLSI6Xuiuw764ZU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321120; c=relaxed/simple;
	bh=uA98h3Pe/5kz6rc++F4ToRqbuR1LgYSftJ6/c3df220=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvrH0i0+tfHXIWRSV04gqWxybydpsaSGnlDFHHEG+D/BkZ+mUdU4lVWc+eC3Bd1mrYWyayxLq7qeIwT/33yamOK8bbgo3jerh/CiOKuNYCWv3GqxMsAThhiLlBF2wmu+zl6X39Y3l0av2+FsDQkBFmWysKZEF1ZDukOE4FwDaPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IoHfEBNd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780321119; x=1811857119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uA98h3Pe/5kz6rc++F4ToRqbuR1LgYSftJ6/c3df220=;
  b=IoHfEBNdEdPjczZVlH/MmTjxXlFKqP6ttcrH0gMs2uEEDWnr6dImTB6S
   Ogzm1uHcD7VHVYSkaolaOyUvX/CuOHqMEQfRVIH5wUC3L0ZrGh1x7Ne4W
   ray/FXrWIiflk/4000mSkBO0NvkYKWZLl8y9/LBQ05FRkYfHyT0PvBPw+
   Vpmh4VpbocUDSx4DYU8rTF4MEtMohxae8/bQq3zNNS4RbAvzKPD4fDJBv
   t6Sz6mlS7N7+vhFPoIbHe49v2SM68IsLyGCYtZ19jRs0l8x86XRyFDXDX
   iurcObQDNgYXYzSWwOsmC9JnH1FVYU/85Dc0oDGUNE/+opUs5Je9GaqQ7
   A==;
X-CSE-ConnectionGUID: wkj44IbbStizAYw/xg1jLA==
X-CSE-MsgGUID: dSizBa0eQ5aiU7FOCOzNNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92459412"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="92459412"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 06:38:39 -0700
X-CSE-ConnectionGUID: iskED669SoW0VIHw6Z8Y/g==
X-CSE-MsgGUID: YI10VYuNRBu53FrBNdCfcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="267468765"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jun 2026 06:38:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 558C795; Mon, 01 Jun 2026 15:38:36 +0200 (CEST)
Date: Mon, 1 Jun 2026 16:38:34 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v2 1/3] usb: typec: tipd: add error message for vendor ID
 read failure
Message-ID: <ah2LWugaEs2LnX_L@kuha>
References: <cover.1779214249.git.radhey.shyam.pandey@amd.com>
 <0aa487d3f054b34689e95760fefd72f7571f64c9.1779214249.git.radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aa487d3f054b34689e95760fefd72f7571f64c9.1779214249.git.radhey.shyam.pandey@amd.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38249-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,amd.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 262E7620306
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:49:54PM +0530, Radhey Shyam Pandey wrote:
> Log an error when the vendor ID read fails or returns zero, including
> the I2C error code and register value, and initialize the vendor ID
> variable to avoid logging an uninitialized value on read failure.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes for v2:
> - Extend commit description to justify vid initialization.
> ---
>  drivers/usb/typec/tipd/core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 43faec794b95..b282366b5326 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -1744,7 +1744,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  	struct tps6598x *tps;
>  	struct fwnode_handle *fwnode;
>  	u32 status;
> -	u32 vid;
> +	u32 vid = 0;
>  	int ret;
>  
>  	data = i2c_get_match_data(client);
> @@ -1772,8 +1772,11 @@ static int tps6598x_probe(struct i2c_client *client)
>  
>  	if (!device_is_compatible(tps->dev, "ti,tps25750")) {
>  		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
> -		if (ret < 0 || !vid)
> +		if (ret < 0 || !vid) {
> +			dev_err(tps->dev, "failed to read vendor ID: %d, vid: %#x\n",
> +				ret, vid);
>  			return -ENODEV;
> +		}
>  	}
>  
>  	/*
> -- 
> 2.43.0

-- 
heikki

