Return-Path: <linux-usb+bounces-33637-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOdnB+p0nWmAQAQAu9opvQ
	(envelope-from <linux-usb+bounces-33637-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 10:52:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D07184F5E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 10:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69562304B069
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 09:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE1C372B20;
	Tue, 24 Feb 2026 09:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6P7jZjX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAC336D501;
	Tue, 24 Feb 2026 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926730; cv=none; b=EQxN7gl7QC65tN0Ji9eM4ZFNsGHNcTpPFGzpmWToKK7b14YlYdVCHiL1QSoT21W8+dYirnX3qRcyhIBOB4QczoG64UkY7x5yuBQYZWmDSSNNwzbnW0Ju4jFi9lkfbW/olqEwknUKXlD1niNjdVgs4qb25jzdJ52tNJAZ2+x7wQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926730; c=relaxed/simple;
	bh=6pRu6zq62WMN+WyuOARkXhLVVqohePZFybaoMP30tgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ii4xKhWqaisUvTlNYj9e2/7VaYmhjW8FmJ3B9440gNmPBLYauoNlPDX18EyOjnZxTS6uGCAcX80GuPft7+9MFrptmyD9SE5CRNu+m+UDlJlWxIkv0toLkWEpAyNglFEcMzw3deW0vJ1F9e2xb2c5sSdHlcwnG5PRlBAI24KDfvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6P7jZjX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771926730; x=1803462730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6pRu6zq62WMN+WyuOARkXhLVVqohePZFybaoMP30tgE=;
  b=V6P7jZjXOp7dGq2bPPUvn76MJrS+PBiWRfeb4K0oFENkKYRLFwFzszzF
   L6uSyCqTvkbO+mkiboBbv2Lt5DlRtmuShbuG54EIbVrJyl1xN63+0bKtb
   V4HhROTvWqkBS2ivVqL88F3dqg2SlMYijZuY8TpIRooIjHakBE0NvLPMd
   CnMyopWR+FU8rq/MF4e0RnsiZoUDSSeCuekO6Y7KSVD0dzLJCLSC4O55j
   sDMF42r/kjh9N0YafRpyqDsAhhEzEuZ8ReHo+rwWPj48xH6vLFCrxGHDH
   zub6S1e31PnO+q/WYyeCxMnQFvMnpkVlQzTa/rPSL+/qGoA0x6j6oz+Wr
   g==;
X-CSE-ConnectionGUID: 6rHCy/8eSmux7uuCOJJ8yA==
X-CSE-MsgGUID: To1dQcefR3mZbYiunuTPwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72839844"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72839844"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 01:52:09 -0800
X-CSE-ConnectionGUID: gAL2aXsLSUO2SshtxEY5qA==
X-CSE-MsgGUID: N2EPebGQTo+YHb65fFnqkw==
X-ExtLoop1: 1
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.187])
  by fmviesa003.fm.intel.com with SMTP; 24 Feb 2026 01:52:06 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 24 Feb 2026 11:51:31 +0200
Date: Tue, 24 Feb 2026 11:51:31 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/2] usb: typec: mux: avoid duplicated mux switches
Message-ID: <aZ10o7G_9yjYmiQL@kuha>
References: <20260223-typec-mux-duplication-fix-v2-0-0402fefc222e@collabora.com>
 <20260223-typec-mux-duplication-fix-v2-2-0402fefc222e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-typec-mux-duplication-fix-v2-2-0402fefc222e@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33637-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 43D07184F5E
X-Rspamd-Action: no action

Mon, Feb 23, 2026 at 07:27:39PM +0100, Sebastian Reichel wrote:
> Some devices use combo PHYs (i.e. USB3 + DisplayPort), which also
> handle the lane muxing. These PHYs are referenced twice from
> the USB-C connector (USB super-speed lines and SBU/AUX lines)
> resulting in the mux being configured twice. Avoid this by
> dropping duplicates.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 9b908c46bd7d..db5e4a4c0a99 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -275,7 +275,9 @@ static int mux_fwnode_match(struct device *dev, const void *fwnode)
>  static void *typec_mux_match(const struct fwnode_handle *fwnode,
>  			     const char *id, void *data)
>  {
> +	struct typec_mux_dev **mux_devs = data;
>  	struct device *dev;
> +	int i;
>  
>  	/*
>  	 * Device graph (OF graph) does not give any means to identify the
> @@ -291,6 +293,14 @@ static void *typec_mux_match(const struct fwnode_handle *fwnode,
>  	dev = class_find_device(&typec_mux_class, NULL, fwnode,
>  				mux_fwnode_match);
>  
> +	/* Skip duplicates */
> +	for (i = 0; i < TYPEC_MUX_MAX_DEVS; i++)
> +		if (to_typec_mux_dev(dev) == mux_devs[i]) {
> +			put_device(dev);
> +			return NULL;
> +		}
> +
> +
>  	return dev ? to_typec_mux_dev(dev) : ERR_PTR(-EPROBE_DEFER);
>  }
>  
> @@ -316,7 +326,8 @@ struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode)
>  		return ERR_PTR(-ENOMEM);
>  
>  	count = fwnode_connection_find_matches(fwnode, "mode-switch",
> -					       NULL, typec_mux_match,
> +					       (void **)mux_devs,
> +					       typec_mux_match,
>  					       (void **)mux_devs,
>  					       ARRAY_SIZE(mux_devs));
>  	if (count <= 0) {
> 
> -- 
> 2.51.0

-- 
heikki

