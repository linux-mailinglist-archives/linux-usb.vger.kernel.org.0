Return-Path: <linux-usb+bounces-38248-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIgHMK2LHWr5bgkAu9opvQ
	(envelope-from <linux-usb+bounces-38248-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:39:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC456202D4
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0558D3028679
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 13:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96258342C8B;
	Mon,  1 Jun 2026 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7gPBZ5a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D14E3A4F32
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 13:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320983; cv=none; b=BgsponIBTb6xDN47w1VtOUdYJMJ2gfEz3S8vhmYouqKs6OwgAJFZCVN0PMwqNWwp8jEg6ZXzM1e7xyZBDSYnRQDL9v/DLIdHq/X1JhEdY/cVmfKZV6zfsd8pgMQE5S899sSUUhblBJzodvQ/0tHGcH690AF7wYC5NjDDi1iAZF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320983; c=relaxed/simple;
	bh=cqCC2R9IcyM6oVqoIDrh4IxNl5KqAns8pp7+WgecHvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZrI/m/YfZ9SVcdFB8sds7fvp1I/yqfgR7JwFHAHbixwhuapuPu0OroejQDIJ5+ylrAQ1DqO7eIBWjOWfhgo4TzRF+rD7UwWbTa1zqlhDljYlQosDe9WpB5E7OmmtWEIlhC3v5B3LXQk6dgNABCisWci2qsQmnqEnpHD84nrfFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7gPBZ5a; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780320981; x=1811856981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cqCC2R9IcyM6oVqoIDrh4IxNl5KqAns8pp7+WgecHvc=;
  b=X7gPBZ5a007Gt0nNSltLZVsh14MDxfBKG01dtK44yz9h4kfdZG/Frnyw
   k1MWGY9QcPqVkn88P/73H/raNK1HimIwB8+rHiBY5wRAlt53E23IHtdSX
   k8tTeRwvs7lyJyPEoW+k3U/z26KabzhEsUXRyxkKr1yarqcLoOalbP2YL
   8LzKR8oVPOQU20YNhyN2qjuGfelJQYtDs9BO9Z5d9TPiP5+7OtC2+jtqF
   1G+eTSbAC+w92VOOLp/nUcsPKtianReJGPG6MhxW/+eVBbEh4psOFlqgg
   +7Y0h92Cqi8DvK+xYvOpkT0oOoL0/aTON5r1UXg4wNgZpe+c+0ugi6AA1
   Q==;
X-CSE-ConnectionGUID: mWq4LlcMS9e6ctBp+DaH/Q==
X-CSE-MsgGUID: otvhOWf3QZuBBb51+6Qzxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="98645504"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="98645504"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 06:36:21 -0700
X-CSE-ConnectionGUID: /Rh3y520Qxiw6DjvHrwn/w==
X-CSE-MsgGUID: D6ye4VRvSdCEMNc22454kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="241058350"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 01 Jun 2026 06:36:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9AE3B95; Mon, 01 Jun 2026 15:36:03 +0200 (CEST)
Date: Mon, 1 Jun 2026 16:36:02 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: cy_huang@richtek.com
Cc: linux-usb@vger.kernel.org, badhri@google.com,
	gregkh@linuxfoundation.org, lucas_tsai@richtek.com,
	ren_chen@richtek.com, kevin_hung@richtek.com
Subject: Re: [PATCH 3/3] usb: typec: tcpci_rt1711h: add low power mode support
Message-ID: <ah2Kwlm6Gm0rMvKt@kuha>
References: <20260518091513.3277975-2-cy_huang@richtek.com>
 <20260518091513.3277975-5-cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518091513.3277975-5-cy_huang@richtek.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-38248-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,richtek.com:email]
X-Rspamd-Queue-Id: 5AC456202D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

I'm sorry to keep you waiting.

On Mon, May 18, 2026 at 05:15:14PM +0800, cy_huang@richtek.com wrote:
> From: Lucas Tsai <lucas_tsai@richtek.com>
> 
> Add low power mode support,
> add the op to enter and exit low power mode,
> this mode reduce RT1711H/RT1715 VDD Iq to 1 of 10,

What is VDD Iq?

> while disabling VBUS detection and PD BMC
> but keeping CC detection and not affecting DRP toggling.
> 
> Signed-off-by: Lucas Tsai <lucas_tsai@richtek.com>
> ---
>  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> index 4b3e4e22a82e..48d6a6823ab9 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -20,6 +20,7 @@
>  
>  #define RT1711H_PHYCTRL1	0x80
>  #define RT1711H_PHYCTRL2	0x81
> +#define RT1711H_BMCCTRL		0x90
>  
>  #define RT1711H_RTCTRL4		0x93
>  /* rx threshold of rd/rp: 1b0 for level 0.4V/0.7V, 1b1 for 0.35V/0.75V */
> @@ -254,6 +255,18 @@ static int rt1711h_start_drp_toggling(struct tcpci *tcpci,
>  	return 0;
>  }
>  
> +static void rt1711h_set_low_power_mode(struct tcpci *tcpci,
> +				       struct tcpci_data *tdata, bool enable)
> +{
> +	int ret;
> +	struct rt1711h_chip *chip = tdata_to_rt1711h(tdata);
> +
> +	ret = rt1711h_write8(chip, RT1711H_BMCCTRL, enable ? 0x08 : 0x07);
> +	if (ret < 0)
> +		dev_err(chip->dev, "%s lpm fail(%d)\n",
> +			enable ? "enter" : "exit", ret);
> +}

Why couldn't this just be done in the PM suspend and resume
callbacks for this driver?

Br,

-- 
heikki

