Return-Path: <linux-usb+bounces-32734-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FarBU18d2m9hgEAu9opvQ
	(envelope-from <linux-usb+bounces-32734-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 15:38:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A45FD899B8
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 15:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8042302B50B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 14:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247BC242D62;
	Mon, 26 Jan 2026 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNZzAPc2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730311CEAA3;
	Mon, 26 Jan 2026 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437999; cv=none; b=hI9YwQEcMF+zqLygJAUyMlUUblDOrMUbDrDqjNjiXkAI5g+VHTWt4C4QaPC1luJiko+HKoZ9Hihmk1MvPVKIM83N0tAL/WGFueq4RPHyyqXMQnbUMLf4UucU49kHIouH8a9NSWrhRhlXKlBCLNUZeg6Tt/2d/BnlIC9lFpWmvbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437999; c=relaxed/simple;
	bh=vMLH6rzXP4tdf/nHyU7PxamCgDAD6XQa7ygnT7BT7Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMWwcNYS1qFQPSpLGHDs+4A2LsOi6adCRB006i686aBkaaZsjlh2OuM+YoLa2mj8RUvdONYaBdUCriHwMyHiVno9B6C0dOsLZuibUYAT592FZOLAOmFKVS+ZpTgMYyvFWwOj/WMlczFVg3JKpz8yLFrOYa7sePBCTt1AievWEv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNZzAPc2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769437999; x=1800973999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vMLH6rzXP4tdf/nHyU7PxamCgDAD6XQa7ygnT7BT7Sw=;
  b=PNZzAPc23Vq5PXzuwtD1t9A8Cz9XmbrTel/m1QsKOsvNWOdwgdAI6wf0
   pqD5iGwZDdFHvKDdip3mlF3n/VmxMEkQTZ6qrKHAsdEJ1USbDdIhwrpqH
   dV5dpoZrGatWkY2oXHYTG9D1CraauGt67ombKidXEa+Zb/kQenDKIvQkM
   dKrbTVRI2im9pu/DNvvrFfYh6JpE/Hg1X9iaBoN+aqaU1pmh0XoMNap3G
   IdC2UpvCCvuJgCTIXttFxOre+mkAf2rFykPlvH6KWuQu1N9/u/UWaXJSI
   Ql73TotqHSiGiWZSV3JRaSgi6BNHQCHAap3cui1HCP6te+7R+NX2NvYNo
   A==;
X-CSE-ConnectionGUID: f5zbZ0wtQdamd8oOgTe1gQ==
X-CSE-MsgGUID: 5wJxlMXCSFOSSdQvyI4lMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70518830"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70518830"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:33:18 -0800
X-CSE-ConnectionGUID: Fx1fKu3JQ3iVAk/KpnDjuw==
X-CSE-MsgGUID: m6zJqJxcTtWrYBympBLwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="211784763"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.223.78])
  by orviesa003.jf.intel.com with SMTP; 26 Jan 2026 06:33:15 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 26 Jan 2026 16:32:48 +0200
Date: Mon, 26 Jan 2026 16:32:48 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jan Remmet <j.remmet@phytec.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Message-ID: <aXd7EN9KAmtEHODq@kuha>
References: <20260126-wip-jremmet-hd3ss3220_vbus_split-v1-1-b2f946f1a4ae@phytec.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-wip-jremmet-hd3ss3220_vbus_split-v1-1-b2f946f1a4ae@phytec.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32734-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[phytec.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: A45FD899B8
X-Rspamd-Action: no action

Mon, Jan 26, 2026 at 01:06:36PM +0100, Jan Remmet kirjoitti:
> Check regulator state as peripheral and detach can disable vbus.
> Without this check we will try to disable the regulator twice if
> we disconnect host and then connect as device.
> 
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>
> ---
> This is a fixup from
> - Link to v1: https://lore.kernel.org/r/20260115-wip-jremmet-hd3ss3220_vbus-v1-1-b7d9adfbe346@phytec.de
> To
> - Link to v2: https://lore.kernel.org/r/20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de

I don't understand that, but I think you are fixing a commit in Greg's
tree, right?

If that's the case, then you need the Fixes tag.

thanks,

> ---
>  drivers/usb/typec/hd3ss3220.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index a7c54aa8635f70d6979d98c95f80d4dac277fef2..3e39b800e6b5f4d0cbba957c0dd66c18f781ff38 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -208,6 +208,9 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
>  {
>  	int ret;
>  
> +	if (regulator_is_enabled(hd3ss3220->vbus) == on)
> +		return;
> +
>  	if (on)
>  		ret = regulator_enable(hd3ss3220->vbus);
>  	else
> 
> ---
> base-commit: 8acc379b664ec987dcc7eca25a5f5c4a9a4eb9c4
> change-id: 20260126-wip-jremmet-hd3ss3220_vbus_split-946802479e89
> 
> Best regards,
> -- 
> Jan Remmet <j.remmet@phytec.de>

-- 
heikki

