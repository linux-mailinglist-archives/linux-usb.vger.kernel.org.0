Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A81461061
	for <lists+linux-usb@lfdr.de>; Mon, 29 Nov 2021 09:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241046AbhK2Iqz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 03:46:55 -0500
Received: from mga04.intel.com ([192.55.52.120]:12518 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243570AbhK2Ioy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Nov 2021 03:44:54 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="234649989"
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800"; 
   d="scan'208";a="234649989"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 00:39:04 -0800
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800"; 
   d="scan'208";a="600128053"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 00:39:01 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 29 Nov 2021 10:38:58 +0200
Date:   Mon, 29 Nov 2021 10:38:58 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 2/7] thunderbolt: Add CL0s support for USB4
Message-ID: <YaSRoq9ZPFlDDRHY@lahna>
References: <20211125143821.16558-1-gil.fine@intel.com>
 <20211125143821.16558-3-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125143821.16558-3-gil.fine@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Nov 25, 2021 at 04:38:16PM +0200, Gil Fine wrote:
> +static int tb_switch_enable_cl0s(struct tb_switch *sw)
> +{
> +	struct tb_switch *parent = tb_switch_parent(sw);
> +	bool up_cl0s_support, down_cl0s_support;
> +	struct tb_port *up, *down;
> +	int ret;
> +
> +	if (!tb_switch_is_usb4(sw))
> +		return 0;
> +
> +	/*
> +	 * Enable CLx for host router's downstream port as part of the
> +	 * downstream router enabling procedure.
> +	 */
> +	if (!tb_route(sw))
> +		return 0;
> +
> +	/* Enable CLx only for first hop router (depth = 1) */
> +	if (tb_route(parent))
> +		return 0;
> +
> +	if (tb_switch_pm_secondary_resolve(sw))
> +		return -EINVAL;
> +
> +	up = tb_upstream_port(sw);
> +	down = tb_port_at(tb_route(sw), parent);
> +
> +	up_cl0s_support = tb_port_cl0s_supported(up);
> +	down_cl0s_support = tb_port_cl0s_supported(down);
> +
> +	tb_port_dbg(up, "CL0s %ssupported\n",
> +		    up_cl0s_support ? "" : "not ");
> +	tb_port_dbg(down, "CL0s %ssupported\n",
> +		    down_cl0s_support ? "" : "not ");
> +
> +	if (!up_cl0s_support || !down_cl0s_support)
> +		return -EOPNOTSUPP;
> +
> +	ret = tb_port_cl0s_enable(up);
> +	if (ret)
> +		return ret;
> +
> +	ret = tb_port_cl0s_enable(down);
> +	if (ret)

Better to get rid of the goto here and do:

	if (ret) {
		tb_port_cl0s_disable(up);
		return ret;
	}

> +		goto out;
> +
> +	sw->clx = TB_CL0S;
> +	tb_sw_dbg(sw, "enabled CL0s on upstream port\n");
> +	return 0;
> +out:
> +	tb_port_cl0s_disable(up);
> +	return ret;
> +}
> +
> +/**
> + * tb_switch_enable_clx() - Enable CLx on upstream port of specified router
> + * @sw: The switch to enable CLx for
> + * @clx: The CLx state to enable
> + *
> + * Enable CLx state only for first hop router. This is because of the HW
> + * limitation on Intel platforms.

Okay but in general do we need to enable it over the whole topology or
is it enough to enable it for the first hop router? I think most of this
is because it allows better thermal management which probably is
applicable for any USB4 host.

> + * CLx is enabled only if both sides of the link support CLx, and if
> + * both sides of the link are not configured as two single lane links
> + * and only if the link is not inter-domain link.
> + * The conditions are descibed in CM Guide 1.0 section 8.1.
> + *
> + * Return: Returns 0 on success or an error code on failure.
> + */
> +int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
> +{
> +	struct tb_switch *root_sw = sw->tb->root_switch;
> +
> +	/* CLx is not enabled and validated on USB4 platforms before ADL */
> +	if (root_sw->generation < 4 ||
> +	    tb_switch_is_tiger_lake(root_sw))
> +		return 0;
> +
> +	switch (clx) {
> +	case TB_CL0S:
> +		return tb_switch_enable_cl0s(sw);
> +
> +	case TB_CL1:
> +	case TB_CL2:

You can drpo the two lines above.

> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int tb_switch_disable_cl0s(struct tb_switch *sw)
> +{
> +	struct tb_switch *parent = tb_switch_parent(sw);
> +	struct tb_port *up, *down;
> +	int ret;
> +
> +	if (!tb_switch_is_usb4(sw))
> +		return 0;
> +
> +	/*
> +	 * Disable CLx for host router's downstream port as part of the
> +	 * downstream router enabling procedure.
> +	 */
> +	if (!tb_route(sw))
> +		return 0;
> +
> +	/* Disable CLx only for first hop router (depth = 1) */
> +	if (tb_route(parent))
> +		return 0;
> +
> +	up = tb_upstream_port(sw);
> +	down = tb_port_at(tb_route(sw), parent);
> +	ret = tb_port_cl0s_disable(up);
> +	if (ret)
> +		return ret;
> +
> +	ret = tb_port_cl0s_disable(down);
> +	if (ret)
> +		return ret;
> +
> +	sw->clx = TB_CLX_DISABLE;
> +	tb_sw_dbg(sw, "disabled CL0s on upstream port\n");
> +	return 0;
> +}
> +
> +/**
> + * tb_switch_disable_clx() - Disable CLx on upstream port of specified router
> + * @sw: The switch to disable CLx for
> + * @clx: The CLx state to disable
> + *
> + * Return: Returns 0 on success or an error code on failure.
> + */
> +int tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
> +{
> +	switch (clx) {
> +	case TB_CL0S:
> +		return tb_switch_disable_cl0s(sw);
> +
> +	case TB_CL1:
> +	case TB_CL2:
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +/**
> + * tb_switch_is_clx_enabled() - Checks if the CLx is enabled
> + * @sw: Router to check the CLx state for
> + *
> + * Checks if the CLx is enabled on the router upstream link.
> + * Not applicable for a host router.
> + */
> +bool tb_switch_is_clx_enabled(struct tb_switch *sw)
> +{
> +	return sw->clx != TB_CLX_DISABLE;
> +}
> +
> +/**
> + * tb_switch_is_cl0s_enabled() - Checks if the CL0s is enabled
> + * @sw: Router to check the CLx state for
> + *
> + * Checks if the CL0s is enabled on the router upstream link.
> + * Not applicable for a host router.
> + */
> +bool tb_switch_is_cl0s_enabled(struct tb_switch *sw)
> +{
> +	return sw->clx == TB_CL0S;
> +}
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 533fe48e85be..f241d42c1c6e 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -669,7 +669,11 @@ static void tb_scan_port(struct tb_port *port)
>  	tb_switch_lane_bonding_enable(sw);
>  	/* Set the link configured */
>  	tb_switch_configure_link(sw);
> -	tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
> +	if (tb_switch_enable_clx(sw, TB_CL0S))
> +		tb_sw_warn(sw, "failed to enable CLx on upstream port\n");
> +
> +	tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI,
> +				tb_switch_is_clx_enabled(sw) ? true : false);

tb_switch_is_clx_enabled() returns boolean so you can use it directly
here.
