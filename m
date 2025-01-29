Return-Path: <linux-usb+bounces-19830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 174FDA217BC
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 07:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51ED61889338
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 06:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FB0191F98;
	Wed, 29 Jan 2025 06:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmhvGNZF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFF8823DE;
	Wed, 29 Jan 2025 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738132315; cv=none; b=tfsnQ39yhVhkC3fqBCk35V2TNdhyoD4F8yLDBhCNdh30B/wgcbRPNKNgwKlFplizjaedDJh4VpD+9yj6lEP8QNfqFmyKLjUG9EW8LQl+06KUcO4EVhY8Q1HujYWCU1zSwguc8AtDintVdSuRfIGJjQOGzDAb61VNs3hPuYJMW0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738132315; c=relaxed/simple;
	bh=3hh+OOQuIVI8kBf60bGBDKrvL6gjsqKjh9U/bU8IlYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1nFnIWKZV1T7ZTXqwHuELUWw5Z9IuZqpBAxYJqjuWgt9z4N8msBMOfVry0td/uClEze1sbQUjBKw/8GKDxnQlylE2fCYjhgAJs+I/K9B72htCRRe2uJQG/MLDXMLevRvjGpQQnZv6uTESMNf0sM/EmP/BJvvb7pZptPB96+pM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmhvGNZF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738132313; x=1769668313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3hh+OOQuIVI8kBf60bGBDKrvL6gjsqKjh9U/bU8IlYQ=;
  b=CmhvGNZFTqWMJxZbUwspPkqeE/Vg8bNjCdzz20/WGKc0zH6xE3uuKL/+
   mFjn1Tp47B0ib39fs1d7UfBQl/+3ABPTjGHNxzfmo7nbQY5EQpvJ4Is3p
   Q6QIO08WTuIqGm8ppSSF9fBNPtaLFOG2ErKkbOtOBErvbFIUpu3hpCkeZ
   B6fNciSz7zom83mau2PlzafKSpXGsOV/FAi6WmdTS8niI543Uj0unxrvG
   2YonXagZT6TvnedF/iZdQCqRLXBXkIRBp1D6TWmFH0JChkamCBYDqVwWD
   PqNrcoWVI1c6sCGIjV2MlrSXxZLQDQKh/QeInoJFFyrFn8XICYzx1BSKy
   A==;
X-CSE-ConnectionGUID: z+NhS8dmSrWuV6xL/u1gqA==
X-CSE-MsgGUID: pKfz+upCQdCqoiXbyDbTxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49222593"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="49222593"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 22:31:51 -0800
X-CSE-ConnectionGUID: GW0SzZG1TlaNaI2aMlrE7g==
X-CSE-MsgGUID: 3iSwYzMqTc6pqnVeLcquvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="139836872"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 28 Jan 2025 22:31:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A62E8217; Wed, 29 Jan 2025 08:31:48 +0200 (EET)
Date: Wed, 29 Jan 2025 08:31:48 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <20250129063148.GT3713119@black.fi.intel.com>
References: <20250128163605.19222-1-rahimi.mhmmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128163605.19222-1-rahimi.mhmmd@gmail.com>

Hi,

On Tue, Jan 28, 2025 at 04:36:05PM +0000, Mohammad Rahimi wrote:
> Updates the Connection Manager to disable the Gen 4 Link Recovery
> flow before transitioning from a Symmetric Link to an Asymmetric
> Link, as specified in recent changes to the USB4 v2 specification.
> 
> According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> published in September 2024, the rationale for this change is:
> 
>   "Since the default value of the Target Asymmetric Link might be
>   different than Symmetric Link and Gen 4 Link Recovery flow checks
>   this field to make sure it matched the actual Negotiated Link Width,
>   we’re removing the condition for a Disconnect in the Gen 4 Link
>   Recovery flow when Target Asymmetric Link doesn’t match the actual
>   Link width and adding a Connection Manager note to Disable Gen 4 Link
>   Recovery flow before doing Asymmetric Transitions."
> 
> Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> ---
>  drivers/thunderbolt/tb.c      |  23 ++++---
>  drivers/thunderbolt/tb.h      |   3 +
>  drivers/thunderbolt/tb_regs.h |   1 +
>  drivers/thunderbolt/usb4.c    | 125 ++++++++++++++++++++++++++++++++++
>  4 files changed, 142 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index a7c6919fbf97..da53e4619eca 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -1013,7 +1013,7 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>  			     struct tb_port *dst_port, int requested_up,
>  			     int requested_down)
>  {
> -	bool clx = false, clx_disabled = false, downstream;
> +	bool clx_was_enable = false, lrf_was_enable = false, downstream;

Let's call it link_recovery instead of lrf.

>  	struct tb_switch *sw;
>  	struct tb_port *up;
>  	int ret = 0;
> @@ -1075,14 +1075,12 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>  			continue;
>  
>  		/*
> -		 * Disable CL states before doing any transitions. We
> -		 * delayed it until now that we know there is a real
> -		 * transition taking place.
> +		 * Disable CL states and Link Recovery flow before doing any
> +		 * transitions. We delayed it until now that we know there is
> +		 * a real transition taking place.
>  		 */
> -		if (!clx_disabled) {
> -			clx = tb_disable_clx(sw);
> -			clx_disabled = true;
> -		}
> +		clx_was_enable = tb_disable_clx(sw);
> +		lrf_was_enable = usb4_disable_lrf(sw);

The naming is off here and I suggest to do this per USB4 port not per
router. See below.

>  		tb_sw_dbg(up->sw, "configuring asymmetric link\n");
>  
> @@ -1097,9 +1095,14 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>  		}
>  	}
>  
> -	/* Re-enable CL states if they were previosly enabled */
> -	if (clx)
> +	/*
> +	 * Re-enable CL states and Link Recovery flow if
> +	 * they were previosly enabled
> +	 */
> +	if (clx_was_enable)
>  		tb_enable_clx(sw);
> +	if (lrf_was_enable)
> +		usb4_enable_lrf(sw);
>  
>  	return ret;
>  }
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index ddbf0cd78377..3bec35f78d51 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1336,6 +1336,9 @@ bool usb4_port_asym_supported(struct tb_port *port);
>  int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width);
>  int usb4_port_asym_start(struct tb_port *port);
>  
> +bool usb4_enable_lrf(struct tb_switch *sw);

int usb4_port_link_recovery_enable(struct tb_port *port);

> +bool usb4_disable_lrf(struct tb_switch *sw);

void usb4_port_link_recovery_disable(struct tb_port *port);

and move these above the asym port functions.

> +
>  /**
>   * enum tb_sb_target - Sideband transaction target
>   * @USB4_SB_TARGET_ROUTER: Target is the router itself
> diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
> index 4e43b47f9f11..085139e1a958 100644
> --- a/drivers/thunderbolt/tb_regs.h
> +++ b/drivers/thunderbolt/tb_regs.h
> @@ -398,6 +398,7 @@ struct tb_regs_port_header {
>  #define PORT_CS_19_WOD				BIT(17)
>  #define PORT_CS_19_WOU4				BIT(18)
>  #define PORT_CS_19_START_ASYM			BIT(24)
> +#define PORT_CS_19_ELR				BIT(31)
>  
>  /* Display Port adapter registers */
>  #define ADP_DP_CS_0				0x00
> diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
> index e51d01671d8e..49dd3d201617 100644
> --- a/drivers/thunderbolt/usb4.c
> +++ b/drivers/thunderbolt/usb4.c
> @@ -10,6 +10,7 @@
>  #include <linux/delay.h>
>  #include <linux/ktime.h>
>  #include <linux/units.h>
> +#include <linux/string_helpers.h>
>  
>  #include "sb_regs.h"
>  #include "tb.h"
> @@ -1518,6 +1519,130 @@ bool usb4_port_clx_supported(struct tb_port *port)
>  	return !!(val & PORT_CS_18_CPS);
>  }
>  
> +static int __usb4_port_lrf_enable(struct tb_port *port,
> +		       bool enable, bool *was_enable)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = tb_port_read(port, &val, TB_CFG_PORT,
> +			   port->cap_usb4 + PORT_CS_19, 1);
> +	if (ret)
> +		return ret;
> +
> +	*was_enable |= !!(val & PORT_CS_19_ELR);
> +
> +	if (enable)
> +		val |= PORT_CS_19_ELR;
> +	else
> +		val &= ~PORT_CS_19_ELR;
> +
> +	ret = tb_port_write(port, &val, TB_CFG_PORT,
> +			    port->cap_usb4 + PORT_CS_19, 1);
> +	if (ret)
> +		return ret;
> +
> +	tb_port_dbg(port, "ELR %s\n", str_enabled_disabled(enable));

tb_port_dbg(port, "link recovery %s\n", ...)

Ditto below.

> +	return 0;
> +}
> +
> +static int usb4_switch_lrf_enable(struct tb_switch *sw)
> +{
> +	bool was_enable = false;
> +	struct tb_port *up, *down;
> +	int ret;

Reverse christmas tree:

	struct tb_port *up, *down;
	bool was_enable = false;
	int ret;

Ditto everywhere.

> +
> +	up = tb_upstream_port(sw);
> +	down = tb_switch_downstream_port(sw);
> +
> +	ret = __usb4_port_lrf_enable(up, true, &was_enable);
> +	if (ret)
> +		return ret;
> +
> +	ret = __usb4_port_lrf_enable(down, true, &was_enable);
> +	if (ret)
> +		return ret;
> +
> +	tb_sw_dbg(sw, "ELR %s\n", str_enabled_disabled(true));
> +
> +	return 0;
> +}
> +
> +static int usb4_switch_lrf_disable(struct tb_switch *sw)
> +{
> +	bool was_enable = false;
> +	struct tb_port *up, *down;
> +	int ret;
> +
> +	up = tb_upstream_port(sw);
> +	down = tb_switch_downstream_port(sw);
> +
> +	ret = __usb4_port_lrf_enable(up, false, &was_enable);
> +	if (ret)
> +		return ret;
> +
> +	ret = __usb4_port_lrf_enable(down, false, &was_enable);
> +	if (ret)
> +		return ret;
> +
> +	tb_sw_dbg(sw, "ELR %s\n", str_enabled_disabled(false));
> +
> +	/* At least one ELR has been disabled */
> +	return was_enable ? 1 : 0;

Just return 0 in case of success.

> +}
> +
> +/**
> + * usb4_disable_lrf() - Enables Link Recovery flow up to host router
> + * @sw: Router to start
> + *
> + * Enables Link Recovery flow from @sw up to the host router.
> + * Returns true if every Link Recovery flow was successfully enabled.
> + */
> +bool usb4_enable_lrf(struct tb_switch *sw)
> +{
> +	bool enabled = true;
> +
> +	do {
> +		if (usb4_switch_lrf_enable(sw) < 0) {
> +			tb_sw_warn(sw, "failed to enable Link Recovery flow\n");
> +			enabled = false;
> +		}
> +
> +		sw = tb_switch_parent(sw);
> +	} while (sw);
> +
> +	return enabled;
> +}

This should go to tb.c and called tb_enable_link_recovery() analogous to
tb_enable_clx() and it calls the low-level usb4_port_link_recovery..
functions.

Ditto below.

> +
> +/**
> + * usb4_disable_lrf() - Disable Link Recovery flow up to host router
> + * @sw: Router to start
> + *
> + * Disables Link Recovery flow from @sw up to the host router.
> + * Returns true if any Link Recovery flow was disabled. This
> + * can be used to figure out whether the link was setup by us
> + * or the boot firmware so we don't accidentally enable them if
> + * they were not enabled during discovery.

Okay I think you copied the CLx part here, no? How did you test this?

> + */
> +bool usb4_disable_lrf(struct tb_switch *sw)
> +{
> +	bool disabled = false;
> +
> +	do {
> +		int ret;
> +
> +		ret = usb4_switch_lrf_disable(sw);
> +		if (ret > 0)
> +			disabled = true;
> +		else if (ret < 0)
> +			tb_sw_warn(sw, "Link Recovery flow cannot be disabled\n");
> +
> +		sw = tb_switch_parent(sw);
> +	} while (sw);
> +
> +	return disabled;
> +}
> +
>  /**
>   * usb4_port_asym_supported() - If the port supports asymmetric link
>   * @port: USB4 port
> -- 
> 2.45.2

