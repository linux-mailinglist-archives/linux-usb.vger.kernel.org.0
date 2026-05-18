Return-Path: <linux-usb+bounces-37588-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA3uF9jkCmqJ9AQAu9opvQ
	(envelope-from <linux-usb+bounces-37588-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:07:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB16556A5C7
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 674073025A7F
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 10:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76843405C55;
	Mon, 18 May 2026 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3NBN3QU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164FC317163;
	Mon, 18 May 2026 10:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098773; cv=none; b=gBr5gZlxA5muEQeC+kQODMRfDX6ZD732eQQuXn9veITOV3rmzyQ71E5f4QBWxGUDGdQwlr9o0fxJkGsbrOUTOGGVAIMJwX/MH++ijPK4BklwqNJvWzd/WrlosS9m0dxS7CHvLqbYgKVMMBMiTTmkwiNxRqwu86zzskeXQdECyuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098773; c=relaxed/simple;
	bh=xeTG2bcmhDSl3CyWztSGVrwSODaDt76DAnA9mZqGycc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuqCY/O4bgUYS6RzddA2YlUncCpAkm4vsvKO/t8TXtWuf7n10DgYmWFX7Tnju173nZvikj31DL5hHG+16aCnUPHVYlqa87eQsS8Ahw7AhgYD89kP1zndE/M5jIIssX8cTRc24CxtHkbEs5XKMiPP1rwak3K8Qy8wx1Ad5lcladU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3NBN3QU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779098771; x=1810634771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xeTG2bcmhDSl3CyWztSGVrwSODaDt76DAnA9mZqGycc=;
  b=f3NBN3QUsKqNr4tgJUSfq+QXh1J/ncfCUpkV+geGFCz1hGBylSGNaxf1
   4KIfFV3Jq4iIzog2zbrvZPt7LChaxrJ5+qp7BwlqP0qgNhNJnN48ARm3x
   eHNTi2vc0DMVH//uT1yz8kSb3hNuU8oTiiSlan8m+RLvR+lXocywHmxkP
   uHlnwHYTylDDpSCO+KGkNIIVmF54VQXtamxsqfIUGhl4YL00x8u9Le4zz
   WY4JAGr/nc2La1RDlLKzFT5jIIzkES7YG42oVwGfhb7wsO3gl2ssF/+e0
   NTSB/ugDshCsELgbD1clEX2fz+y8GReKuba6gdpHPStjYTnv6oOnIwX1z
   w==;
X-CSE-ConnectionGUID: 2E59JP0BSqWa6WZvGkpFLg==
X-CSE-MsgGUID: FMslM01gTfuSeUG+quSnIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83818348"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="83818348"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 03:06:10 -0700
X-CSE-ConnectionGUID: oRCqNqdQSQGM1ANlJSYhZg==
X-CSE-MsgGUID: XLuvtu6ZRze2uB+92Ph93Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="234922987"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 03:06:07 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 3E4B095; Mon, 18 May 2026 12:06:06 +0200 (CEST)
Date: Mon, 18 May 2026 13:06:04 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Hector Martin <marcan@marcan.st>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Peter Korsgaard <peter@korsgaard.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] usb: typec: tipd: Fix error code in tps6598x_probe()
Message-ID: <agrkjOD-VIPwsJO_@kuha>
References: <agL9o7wUK1dOVBTy@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agL9o7wUK1dOVBTy@stanley.mountain>
X-Rspamd-Queue-Id: CB16556A5C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37588-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[marcan.st,linuxfoundation.org,kernel.org,gompa.dev,gmail.com,korsgaard.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Tue, May 12, 2026 at 01:14:59PM +0300, Dan Carpenter kirjoitti:
> Set the error code on these two error paths.  The existing code returns
> success.
> 
> Fixes: 77ed2f4538da ("usb: typec: tipd: Use read_power_status function in probe")
> Fixes: 04041fd7d6ec ("usb: typec: tipd: Read data status in probe and cache its value")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 43faec794b95..d0b769333bd9 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -1835,6 +1835,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  		goto err_role_put;
>  
>  	if (status & TPS_STATUS_PLUG_PRESENT) {
> +		ret = -EINVAL;
>  		if (!tps6598x_read_power_status(tps))
>  			goto err_unregister_port;
>  		if (!tps->data->read_data_status(tps))
> -- 
> 2.53.0

-- 
heikki

