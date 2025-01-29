Return-Path: <linux-usb+bounces-19844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49755A21C74
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 12:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A56D3A3714
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 11:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B99F1B87CB;
	Wed, 29 Jan 2025 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJUpig4f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B335672;
	Wed, 29 Jan 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151290; cv=none; b=VT1yT4rdcqUlBnOdAzMBztMC0jCbz+p68MbmDl52/lcLhqc0dJek0hG/4Ql2pFYM93MClTUBoO5iDcAVcMJYF5uAAIUEUxcGZFnIucEa+z2TLbaVAnyc1OjphsUmiKUGuODdBOEFR12PCKOwaSkV6/uXARlIvl0RpVpqJ/WmbW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151290; c=relaxed/simple;
	bh=/Wa5LUVK1pGWbrUaKclq7Jd13feRONqdiTJR6JRM91s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atWSx0Qml61sdwHGcKQuare24fl9Oz8qPtigQLOmxqefCKA73onqymNwRPerPdCu/o3zoXj/+ci9WvnmvWTIAfYx6fep6IbpE3P28XFJth+EKCDiRvd4BrYNbNafyON3n/hhSY7ryBC4e/FlBSHhHce7KmZOCLc5nlC/4Z3Qqy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJUpig4f; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738151288; x=1769687288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/Wa5LUVK1pGWbrUaKclq7Jd13feRONqdiTJR6JRM91s=;
  b=MJUpig4fiaQ6TGwXh1l5JLFxm/P/CfhaDtKqjRBMzoJiNV7psptlXTJQ
   iDhw06jac4PMQaanyh7/VY8BvOlcvuSs+/Ul2hQwlPZqnd/qNzXJd4zRb
   9D/nXKPMI/E6JeTOO9IFn4Z5Nf8mCUmH5hRqI8WadDGrRALeXHoKmSSBO
   ziHG068xCzCAiUvFcdcOz1JlWkPu+96b8hl80DlgaZpEzPX+Es5sd6WWk
   mj6uPJND1GvtOXgNjcYYzpBcEwLlUGzBW6GfS5M1ZJrS8B/ySsaRzfG8d
   kBP9eQ8/Ztn30XtQowDrcjmDDMxUVPB3IE2zgOCxixMt95mJYTjJDYcny
   Q==;
X-CSE-ConnectionGUID: IPLl4HSSRz2GBkTghhRrsw==
X-CSE-MsgGUID: gE/aXTg7QASMG1vIwTxXvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50075135"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50075135"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 03:48:07 -0800
X-CSE-ConnectionGUID: 8HZfl1SZSLejVTb2RG0rMA==
X-CSE-MsgGUID: cCJe3AL1SBW8P3+ICUol0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114139674"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 29 Jan 2025 03:48:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 486F6217; Wed, 29 Jan 2025 13:48:04 +0200 (EET)
Date: Wed, 29 Jan 2025 13:48:04 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <20250129114804.GU3713119@black.fi.intel.com>
References: <20250128163605.19222-1-rahimi.mhmmd@gmail.com>
 <20250129063148.GT3713119@black.fi.intel.com>
 <tycnnkwktd4iryegey2xysib3przadada5o7xuqrt5qfxqdtdc@22gg5ssed6sc>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tycnnkwktd4iryegey2xysib3przadada5o7xuqrt5qfxqdtdc@22gg5ssed6sc>

Hi,

On Wed, Jan 29, 2025 at 11:24:33AM +0000, Mohammad Rahimi wrote:
> Hello! Thanks for the thorough review.
> 
> On Wed, Jan 29, 2025 at 08:31:48AM GMT, Mika Westerberg wrote:
> > Hi,
> > 
> > On Tue, Jan 28, 2025 at 04:36:05PM +0000, Mohammad Rahimi wrote:
> > > Updates the Connection Manager to disable the Gen 4 Link Recovery
> > > flow before transitioning from a Symmetric Link to an Asymmetric
> > > Link, as specified in recent changes to the USB4 v2 specification.
> > > 
> > > According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> > > published in September 2024, the rationale for this change is:
> > > 
> > >   "Since the default value of the Target Asymmetric Link might be
> > >   different than Symmetric Link and Gen 4 Link Recovery flow checks
> > >   this field to make sure it matched the actual Negotiated Link Width,
> > >   we’re removing the condition for a Disconnect in the Gen 4 Link
> > >   Recovery flow when Target Asymmetric Link doesn’t match the actual
> > >   Link width and adding a Connection Manager note to Disable Gen 4 Link
> > >   Recovery flow before doing Asymmetric Transitions."
> > > 
> > > Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> > > ---
> > >  drivers/thunderbolt/tb.c      |  23 ++++---
> > >  drivers/thunderbolt/tb.h      |   3 +
> > >  drivers/thunderbolt/tb_regs.h |   1 +
> > >  drivers/thunderbolt/usb4.c    | 125 ++++++++++++++++++++++++++++++++++
> > >  4 files changed, 142 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > > index a7c6919fbf97..da53e4619eca 100644
> > > --- a/drivers/thunderbolt/tb.c
> > > +++ b/drivers/thunderbolt/tb.c
> > > @@ -1013,7 +1013,7 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> > >  			     struct tb_port *dst_port, int requested_up,
> > >  			     int requested_down)
> > >  {
> > > -	bool clx = false, clx_disabled = false, downstream;
> > > +	bool clx_was_enable = false, lrf_was_enable = false, downstream;
> > 
> > Let's call it link_recovery instead of lrf.
> > 
> > >  	struct tb_switch *sw;
> > >  	struct tb_port *up;
> > >  	int ret = 0;
> > > @@ -1075,14 +1075,12 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> > >  			continue;
> > >  
> > >  		/*
> > > -		 * Disable CL states before doing any transitions. We
> > > -		 * delayed it until now that we know there is a real
> > > -		 * transition taking place.
> > > +		 * Disable CL states and Link Recovery flow before doing any
> > > +		 * transitions. We delayed it until now that we know there is
> > > +		 * a real transition taking place.
> > >  		 */
> > > -		if (!clx_disabled) {
> > > -			clx = tb_disable_clx(sw);
> > > -			clx_disabled = true;
> > > -		}
> > > +		clx_was_enable = tb_disable_clx(sw);
> > > +		lrf_was_enable = usb4_disable_lrf(sw);
> > 
> > The naming is off here and I suggest to do this per USB4 port not per
> > router. See below.
> > 
> 
> Sure, I'll handle it per port. Please see my question below.
> 
> > >  		tb_sw_dbg(up->sw, "configuring asymmetric link\n");
> > >  
> > > @@ -1097,9 +1095,14 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> > >  		}
> > >  	}
> > >  
> > > -	/* Re-enable CL states if they were previosly enabled */
> > > -	if (clx)
> > > +	/*
> > > +	 * Re-enable CL states and Link Recovery flow if
> > > +	 * they were previosly enabled
> > > +	 */
> > > +	if (clx_was_enable)
> > >  		tb_enable_clx(sw);
> > > +	if (lrf_was_enable)
> > > +		usb4_enable_lrf(sw);
> > >  
> > >  	return ret;
> > >  }
> > > diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> > > index ddbf0cd78377..3bec35f78d51 100644
> > > --- a/drivers/thunderbolt/tb.h
> > > +++ b/drivers/thunderbolt/tb.h
> > > @@ -1336,6 +1336,9 @@ bool usb4_port_asym_supported(struct tb_port *port);
> > >  int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width);
> > >  int usb4_port_asym_start(struct tb_port *port);
> > >  
> > > +bool usb4_enable_lrf(struct tb_switch *sw);
> > 
> > int usb4_port_link_recovery_enable(struct tb_port *port);
> > 
> > > +bool usb4_disable_lrf(struct tb_switch *sw);
> > 
> > void usb4_port_link_recovery_disable(struct tb_port *port);
> > 
> 
> Here, you have suggested to return int for enabling but void for disabling.
> Let’s also check my next comment.
> 
> > and move these above the asym port functions.
> > 
> > > +
> > >  /**
> > >   * enum tb_sb_target - Sideband transaction target
> > >   * @USB4_SB_TARGET_ROUTER: Target is the router itself
> > > diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
> > > index 4e43b47f9f11..085139e1a958 100644
> > > --- a/drivers/thunderbolt/tb_regs.h
> > > +++ b/drivers/thunderbolt/tb_regs.h
> > > @@ -398,6 +398,7 @@ struct tb_regs_port_header {
> > >  #define PORT_CS_19_WOD				BIT(17)
> > >  #define PORT_CS_19_WOU4				BIT(18)
> > >  #define PORT_CS_19_START_ASYM			BIT(24)
> > > +#define PORT_CS_19_ELR				BIT(31)
> > >  
> > >  /* Display Port adapter registers */
> > >  #define ADP_DP_CS_0				0x00
> > > diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
> > > index e51d01671d8e..49dd3d201617 100644
> > > --- a/drivers/thunderbolt/usb4.c
> > > +++ b/drivers/thunderbolt/usb4.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/delay.h>
> > >  #include <linux/ktime.h>
> > >  #include <linux/units.h>
> > > +#include <linux/string_helpers.h>
> > >  
> > >  #include "sb_regs.h"
> > >  #include "tb.h"
> > > @@ -1518,6 +1519,130 @@ bool usb4_port_clx_supported(struct tb_port *port)
> > >  	return !!(val & PORT_CS_18_CPS);
> > >  }
> > >  
> > > +static int __usb4_port_lrf_enable(struct tb_port *port,
> > > +		       bool enable, bool *was_enable)
> > > +{
> > > +	int ret;
> > > +	u32 val;
> > > +
> > > +	ret = tb_port_read(port, &val, TB_CFG_PORT,
> > > +			   port->cap_usb4 + PORT_CS_19, 1);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	*was_enable |= !!(val & PORT_CS_19_ELR);
> > > +
> > > +	if (enable)
> > > +		val |= PORT_CS_19_ELR;
> > > +	else
> > > +		val &= ~PORT_CS_19_ELR;
> > > +
> > > +	ret = tb_port_write(port, &val, TB_CFG_PORT,
> > > +			    port->cap_usb4 + PORT_CS_19, 1);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	tb_port_dbg(port, "ELR %s\n", str_enabled_disabled(enable));
> > 
> > tb_port_dbg(port, "link recovery %s\n", ...)
> > 
> > Ditto below.
> > 
> > > +	return 0;
> > > +}
> > > +
> > > +static int usb4_switch_lrf_enable(struct tb_switch *sw)
> > > +{
> > > +	bool was_enable = false;
> > > +	struct tb_port *up, *down;
> > > +	int ret;
> > 
> > Reverse christmas tree:
> > 
> > 	struct tb_port *up, *down;
> > 	bool was_enable = false;
> > 	int ret;
> > 
> > Ditto everywhere.
> > 
> > > +
> > > +	up = tb_upstream_port(sw);
> > > +	down = tb_switch_downstream_port(sw);
> > > +
> > > +	ret = __usb4_port_lrf_enable(up, true, &was_enable);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = __usb4_port_lrf_enable(down, true, &was_enable);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	tb_sw_dbg(sw, "ELR %s\n", str_enabled_disabled(true));
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int usb4_switch_lrf_disable(struct tb_switch *sw)
> > > +{
> > > +	bool was_enable = false;
> > > +	struct tb_port *up, *down;
> > > +	int ret;
> > > +
> > > +	up = tb_upstream_port(sw);
> > > +	down = tb_switch_downstream_port(sw);
> > > +
> > > +	ret = __usb4_port_lrf_enable(up, false, &was_enable);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = __usb4_port_lrf_enable(down, false, &was_enable);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	tb_sw_dbg(sw, "ELR %s\n", str_enabled_disabled(false));
> > > +
> > > +	/* At least one ELR has been disabled */
> > > +	return was_enable ? 1 : 0;
> > 
> > Just return 0 in case of success.
> > 
> 
> If we return 0 on success when disabling Link Recovery, we won’t be able
> to restore ELR to its previous state before the asymmetric transition.
> As a result, enabling Link Recovery will become a side effect of
> asymmetric transitions. I’m not sure—is that acceptable?

I missed the fact that you are using the positive return value to indicated
whether link recovery was enabled.

The port functions can return the previous value like:

	ret = usb4_port_link_recovery_enable(up);

then ret contains < 0 in case of error, 0 if it was not enabled > 0 if it
was.

> > > +}
> > > +
> > > +/**
> > > + * usb4_disable_lrf() - Enables Link Recovery flow up to host router
> > > + * @sw: Router to start
> > > + *
> > > + * Enables Link Recovery flow from @sw up to the host router.
> > > + * Returns true if every Link Recovery flow was successfully enabled.
> > > + */
> > > +bool usb4_enable_lrf(struct tb_switch *sw)
> > > +{
> > > +	bool enabled = true;
> > > +
> > > +	do {
> > > +		if (usb4_switch_lrf_enable(sw) < 0) {
> > > +			tb_sw_warn(sw, "failed to enable Link Recovery flow\n");
> > > +			enabled = false;
> > > +		}
> > > +
> > > +		sw = tb_switch_parent(sw);
> > > +	} while (sw);
> > > +
> > > +	return enabled;
> > > +}
> > 
> > This should go to tb.c and called tb_enable_link_recovery() analogous to
> > tb_enable_clx() and it calls the low-level usb4_port_link_recovery..
> > functions.
> > 
> > Ditto below.
> > 
> 
> Just to confirm my understanding, here’s what I plan to do based on
> your instructions:
> 
> I’ll add two port-level functions in usb4.c:
> 
> int usb4_port_link_recovery_enable(struct tb_port *port);
> void usb4_port_link_recovery_disable(struct tb_port *port);

Yes.

> And two functions in tb.c:
> 
> int tb_enable_link_recovery(struct tb_switch *sw);
> int tb_disable_link_recovery(struct tb_switch *sw);
> 

It can even be one function to avoid duplicating code.

> Both will return 0 on success.
> 
> In tb_configure_asym(), I won’t be using the return value from
> either of these two functions.

It should be checking the the return value and act accordingly. For example
what happens if disabling link recovery fails? Is that error situation or
should we continue configuring asymmetric link? Think also from users'
perspective.

> > > +
> > > +/**
> > > + * usb4_disable_lrf() - Disable Link Recovery flow up to host router
> > > + * @sw: Router to start
> > > + *
> > > + * Disables Link Recovery flow from @sw up to the host router.
> > > + * Returns true if any Link Recovery flow was disabled. This
> > > + * can be used to figure out whether the link was setup by us
> > > + * or the boot firmware so we don't accidentally enable them if
> > > + * they were not enabled during discovery.
> > 
> > Okay I think you copied the CLx part here, no? How did you test this?
> > 
> 
> The way we should handle Link Recovery seems quite similar to CL states.

Yeah but you copied

* can be used to figure out whether the link was setup by us
* or the boot firmware so we don't accidentally enable them if
* they were not enabled during discovery.

and that does not even apply for USB4 v2 host routers by default since we
don't do discovery by default.

> I should have mentioned this in my first email, unfortunately,
> I don’t have access to any Gen 4 hosts or devices for testing.

I think this needs to get some testing on real hardware. I have here some
so I can try the next version.

