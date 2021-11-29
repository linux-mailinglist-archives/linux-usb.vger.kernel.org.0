Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4CE460FF3
	for <lists+linux-usb@lfdr.de>; Mon, 29 Nov 2021 09:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242880AbhK2IZd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 03:25:33 -0500
Received: from mga05.intel.com ([192.55.52.43]:32218 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231421AbhK2IXd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Nov 2021 03:23:33 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="322152194"
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800"; 
   d="scan'208";a="322152194"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 00:19:45 -0800
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800"; 
   d="scan'208";a="676261010"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 00:19:42 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 29 Nov 2021 10:19:39 +0200
Date:   Mon, 29 Nov 2021 10:19:39 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 1/7] thunderbolt: Add TMU unidirectional mode
Message-ID: <YaSNGzpGXIWN4fgh@lahna>
References: <20211125143821.16558-1-gil.fine@intel.com>
 <20211125143821.16558-2-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125143821.16558-2-gil.fine@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Nov 25, 2021 at 04:38:15PM +0200, Gil Fine wrote:
> Up until Titan Ridge (Thunderbolt 3) device, routers only supported
> bidirectional mode. In this patch, we add to TMU, a unidirectional mode.
> Unidirectional mode shall be used for enabling of low power state of the link.

Probably should mention here that this is needed to enable CLx-states.

> The Clx enabling is implemented in the next patch of this series.

This line is not necessary.

> Signed-off-by: Gil Fine <gil.fine@intel.com>
> ---
>  drivers/thunderbolt/tb.c      |   9 +-
>  drivers/thunderbolt/tb.h      |  24 ++--
>  drivers/thunderbolt/tb_regs.h |   2 +
>  drivers/thunderbolt/tmu.c     | 244 ++++++++++++++++++++++++++++------
>  4 files changed, 231 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index a231191b06c6..533fe48e85be 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -221,7 +221,7 @@ static int tb_enable_tmu(struct tb_switch *sw)
>  	int ret;
>  
>  	/* If it is already enabled in correct mode, don't touch it */
> -	if (tb_switch_tmu_is_enabled(sw))
> +	if (tb_switch_tmu_hifi_is_enabled(sw, sw->tmu.unidirect_request))
>  		return 0;
>  
>  	ret = tb_switch_tmu_disable(sw);
> @@ -669,6 +669,7 @@ static void tb_scan_port(struct tb_port *port)
>  	tb_switch_lane_bonding_enable(sw);
>  	/* Set the link configured */
>  	tb_switch_configure_link(sw);
> +	tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
>  
>  	if (tb_enable_tmu(sw))
>  		tb_sw_warn(sw, "failed to enable TMU\n");
> @@ -1375,6 +1376,7 @@ static int tb_start(struct tb *tb)
>  		return ret;
>  	}
>  
> +	tb_switch_tmu_configure(tb->root_switch, TB_SWITCH_TMU_RATE_HIFI, false);
>  	/* Enable TMU if it is off */
>  	tb_switch_tmu_enable(tb->root_switch);
>  	/* Full scan to discover devices added before the driver was loaded. */
> @@ -1418,6 +1420,11 @@ static void tb_restore_children(struct tb_switch *sw)
>  	if (sw->is_unplugged)
>  		return;
>  
> +	/*
> +	 * tb_switch_tmu_configure() was already called when the switch was
> +	 * added before entering SX/RPM, so no need to call it again

Nit: I suggest using "system sleep" and "runtime suspend" here or
similar.

> +	 * before enabling TMU.
> +	 */
>  	if (tb_enable_tmu(sw))
>  		tb_sw_warn(sw, "failed to restore TMU configuration\n");
>  
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 3fae40670b72..0205361ff89a 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -89,15 +89,24 @@ enum tb_switch_tmu_rate {
>   * @cap: Offset to the TMU capability (%0 if not found)
>   * @has_ucap: Does the switch support uni-directional mode
>   * @rate: TMU refresh rate related to upstream switch. In case of root
> - *	  switch this holds the domain rate.
> + *	  switch this holds the domain rate. Reflects the HW setting.
>   * @unidirectional: Is the TMU in uni-directional or bi-directional mode
> - *		    related to upstream switch. Don't case for root switch.
> + *		    related to upstream switch. Don't care for root switch.
> + *		    Reflects the HW setting.
> + * @rate_request: TMU new refresh rate related to upstream switch that is
> + *		  requested to be set. In case of root switch, this holds
> + *		  the new domain rate that is requested to be set.
> + * @unidirect_request: Is the new TMU mode: uni-directional or bi-directional
> + *		       that is requested to be set. Related to upstream switch.
> + *		       Don't care for root switch.
>   */
>  struct tb_switch_tmu {
>  	int cap;
>  	bool has_ucap;
>  	enum tb_switch_tmu_rate rate;
>  	bool unidirectional;
> +	bool unidirect_request;
> +	enum tb_switch_tmu_rate rate_request;
>  };
>  
>  /**
> @@ -891,13 +900,10 @@ int tb_switch_tmu_init(struct tb_switch *sw);
>  int tb_switch_tmu_post_time(struct tb_switch *sw);
>  int tb_switch_tmu_disable(struct tb_switch *sw);
>  int tb_switch_tmu_enable(struct tb_switch *sw);
> -
> -static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw)
> -{
> -	return sw->tmu.rate == TB_SWITCH_TMU_RATE_HIFI &&
> -	       !sw->tmu.unidirectional;
> -}
> -
> +bool tb_switch_tmu_hifi_is_enabled(struct tb_switch *sw, bool unidirect);
> +void tb_switch_tmu_configure(struct tb_switch *sw,
> +			     enum tb_switch_tmu_rate rate,
> +			     bool unidirectional);
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
>  int tb_port_add_nfc_credits(struct tb_port *port, int credits);
>  int tb_port_clear_counter(struct tb_port *port, int counter);
> diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
> index d8ab6c820451..38bc15680d06 100644
> --- a/drivers/thunderbolt/tb_regs.h
> +++ b/drivers/thunderbolt/tb_regs.h
> @@ -305,6 +305,8 @@ struct tb_regs_port_header {
>  /* TMU adapter registers */
>  #define TMU_ADP_CS_3				0x03
>  #define TMU_ADP_CS_3_UDM			BIT(29)
> +#define TMU_ADP_CS_6				0x06
> +#define TMU_ADP_CS_6_DTS			BIT(1)
>  
>  /* Lane adapter registers */
>  #define LANE_ADP_CS_0				0x00
> diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
> index 039c42a06000..1374813bfc5c 100644
> --- a/drivers/thunderbolt/tmu.c
> +++ b/drivers/thunderbolt/tmu.c
> @@ -115,6 +115,11 @@ static inline int tb_port_tmu_unidirectional_disable(struct tb_port *port)
>  	return tb_port_tmu_set_unidirectional(port, false);
>  }
>  
> +static inline int tb_port_tmu_unidirectional_enable(struct tb_port *port)
> +{
> +	return tb_port_tmu_set_unidirectional(port, true);
> +}
> +
>  static bool tb_port_tmu_is_unidirectional(struct tb_port *port)
>  {
>  	int ret;
> @@ -128,6 +133,23 @@ static bool tb_port_tmu_is_unidirectional(struct tb_port *port)
>  	return val & TMU_ADP_CS_3_UDM;
>  }
>  
> +static int tb_port_tmu_time_sync(struct tb_port *port, bool time_sync)
> +{
> +	u32 val = time_sync ? TMU_ADP_CS_6_DTS : 0;
> +
> +	return tb_port_tmu_write(port, TMU_ADP_CS_6, TMU_ADP_CS_6_DTS, val);
> +}
> +
> +static int tb_port_tmu_time_sync_disable(struct tb_port *port)
> +{
> +	return tb_port_tmu_time_sync(port, true);
> +}
> +
> +static int tb_port_tmu_time_sync_enable(struct tb_port *port)
> +{
> +	return tb_port_tmu_time_sync(port, false);
> +}
> +
>  static int tb_switch_tmu_set_time_disruption(struct tb_switch *sw, bool set)
>  {
>  	int ret;
> @@ -297,6 +319,9 @@ int tb_switch_tmu_post_time(struct tb_switch *sw)
>   */
>  int tb_switch_tmu_disable(struct tb_switch *sw)
>  {
> +	struct tb_switch *sw_conf, *parent = tb_switch_parent(sw);

Can you drop this line..

> +	bool unidirect = tb_switch_tmu_hifi_is_enabled(sw, true);
> +	struct tb_port *up, *down;
>  	int ret;
>  
>  	if (!tb_switch_is_usb4(sw))
> @@ -306,21 +331,28 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
>  	if (sw->tmu.rate == TB_SWITCH_TMU_RATE_OFF)
>  		return 0;
>  
> -	if (sw->tmu.unidirectional) {
> -		struct tb_switch *parent = tb_switch_parent(sw);
> -		struct tb_port *up, *down;
> +	up = tb_upstream_port(sw);
> +	down = tb_port_at(tb_route(sw), parent);
>  
> -		up = tb_upstream_port(sw);
> -		down = tb_port_at(tb_route(sw), parent);
> +	if (tb_route(sw)) {
> +		sw_conf = unidirect ? parent : sw;
> +		tb_switch_tmu_rate_write(sw_conf, TB_SWITCH_TMU_RATE_OFF);

.. and here do

	if (unidirect)
		tb_switch_tmu_rate_write(parent, TB_SWITCH_TMU_RATE_OFF);
	else
		tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);

Also add a comment why we need to configure it in the parent when the
TMU mode is unidirectional.

>  
> -		/* The switch may be unplugged so ignore any errors */
> -		tb_port_tmu_unidirectional_disable(up);
> -		ret = tb_port_tmu_unidirectional_disable(down);
> +		tb_port_tmu_time_sync_disable(up);
> +		ret = tb_port_tmu_time_sync_disable(down);
>  		if (ret)
>  			return ret;
> -	}
>  
> -	tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
> +		if (unidirect) {
> +			/* The switch may be unplugged so ignore any errors */
> +			tb_port_tmu_unidirectional_disable(up);
> +			ret = tb_port_tmu_unidirectional_disable(down);
> +			if (ret)
> +				return ret;
> +		}
> +	} else {
> +		tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
> +	}
>  
>  	sw->tmu.unidirectional = false;
>  	sw->tmu.rate = TB_SWITCH_TMU_RATE_OFF;
> @@ -329,55 +361,191 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
>  	return 0;
>  }
>  
> -/**
> - * tb_switch_tmu_enable() - Enable TMU on a switch
> - * @sw: Switch whose TMU to enable
> - *
> - * Enables TMU of a switch to be in bi-directional, HiFi mode. In this mode
> - * all tunneling should work.
> +/*
> + * This function is called when the previous TMU mode was
> + * TB_SWITCH_TMU_RATE_OFF
>   */
> -int tb_switch_tmu_enable(struct tb_switch *sw)
> +static int __tb_switch_tmu_enable_bidir(struct tb_switch *sw)
>  {
> +	struct tb_switch *parent = tb_switch_parent(sw);
> +	struct tb_port *up, *down;
>  	int ret;
>  
> -	if (!tb_switch_is_usb4(sw))
> -		return 0;
> +	up = tb_upstream_port(sw);
> +	down = tb_port_at(tb_route(sw), parent);
>  
> -	if (tb_switch_tmu_is_enabled(sw))
> -		return 0;
> +	ret = tb_port_tmu_unidirectional_enable(up);
> +	if (ret)
> +		return ret;
>  
> -	ret = tb_switch_tmu_set_time_disruption(sw, true);
> +	ret = tb_port_tmu_unidirectional_enable(down);
> +	if (ret)
> +		goto out;
> +
> +	ret = tb_switch_tmu_rate_write(parent, TB_SWITCH_TMU_RATE_HIFI);
> +	if (ret)
> +		goto out;
> +
> +	ret = tb_port_tmu_time_sync_enable(up);
> +	if (ret)
> +		goto out;
> +
> +	ret = tb_port_tmu_time_sync_enable(down);
> +	if (ret)
> +		goto out;
> +
> +	return 0;
> +out:
> +	/*
> +	 * In case of any failure in one of the steps, get back to the
> +	 * TMU configurations in OFF mode. In case of additional failures in
> +	 * the functions below, ignore them since we already report a failure.
> +	 */
> +	tb_port_tmu_time_sync_disable(up);
> +	tb_switch_tmu_rate_write(parent, TB_SWITCH_TMU_RATE_OFF);
> +	tb_port_tmu_unidirectional_disable(down);
> +	tb_port_tmu_unidirectional_disable(up);

Empty line here.

> +	return ret;
> +}
> +
> +/*
> + * This function is called when the previous TMU mode was
> + * TB_SWITCH_TMU_RATE_OFF

Add ending '.' to the sentence.

> + */
> +static int __tb_switch_tmu_enable_uni(struct tb_switch *sw)
> +{
> +	struct tb_switch *parent = tb_switch_parent(sw);
> +	struct tb_port *up, *down;
> +	int ret;
> +
> +	up = tb_upstream_port(sw);
> +	down = tb_port_at(tb_route(sw), parent);
> +	ret = tb_switch_tmu_rate_write(parent, TB_SWITCH_TMU_RATE_HIFI);
>  	if (ret)
>  		return ret;
>  
> -	/* Change mode to bi-directional */
> -	if (tb_route(sw) && sw->tmu.unidirectional) {
> -		struct tb_switch *parent = tb_switch_parent(sw);
> -		struct tb_port *up, *down;
> +	ret = tb_port_tmu_unidirectional_enable(up);
> +	if (ret)
> +		goto out;
> +
> +	ret = tb_port_tmu_time_sync_enable(up);
> +	if (ret)
> +		goto out;
>  
> -		up = tb_upstream_port(sw);
> -		down = tb_port_at(tb_route(sw), parent);
> +	ret = tb_port_tmu_unidirectional_enable(down);
> +	if (ret)
> +		goto out;
>  
> -		ret = tb_port_tmu_unidirectional_disable(down);
> -		if (ret)
> -			return ret;
> +	ret = tb_port_tmu_time_sync_enable(down);
> +	if (ret)
> +		goto out;
>  
> -		ret = tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_HIFI);
> -		if (ret)
> -			return ret;
> +	return 0;
> +out:
> +	/*
> +	 * In case of any failure in one of the steps, get back to the
> +	 * TMU configurations in OFF mode. In case of additional failures in
> +	 * the functions below, ignore them since we already report a failure.
> +	 */
> +	tb_port_tmu_unidirectional_disable(down);
> +	tb_port_tmu_time_sync_disable(up);
> +	tb_port_tmu_unidirectional_disable(up);
> +	tb_switch_tmu_rate_write(parent, TB_SWITCH_TMU_RATE_OFF);

Empty line.

I wonder if it is better to separate these into own function. So you
don't need to duplicate them in error paths.

> +	return ret;
> +}
>  
> -		ret = tb_port_tmu_unidirectional_disable(up);
> -		if (ret)
> -			return ret;
> +static int tb_switch_tmu_hifi_enable(struct tb_switch *sw)
> +{
> +	bool unidirect = sw->tmu.unidirect_request;
> +	int ret;
> +
> +	if (unidirect && !sw->tmu.has_ucap)
> +		return -EOPNOTSUPP;
> +
> +	if (!tb_switch_is_usb4(sw))
> +		return 0;
> +
> +	if (tb_switch_tmu_hifi_is_enabled(sw, sw->tmu.unidirect_request))
> +		return 0;
> +
> +	ret = tb_switch_tmu_set_time_disruption(sw, true);
> +	if (ret)
> +		return ret;
> +
> +	if (tb_route(sw)) {
> +		/* The used mode changes are from OFF to HiFi-Uni/HiFi-BiDir */
> +		if (sw->tmu.rate == TB_SWITCH_TMU_RATE_OFF) {
> +			ret = unidirect ? __tb_switch_tmu_enable_uni(sw)
> +					 : __tb_switch_tmu_enable_bidir(sw);
> +			if (ret)
> +				return ret;

I think it is better if you avoid the ternary operator here:

	if (unidirect)
		ret = __tb_switch_tmu_enable_uni(sw);
	else
		ret = __tb_switch_tmu_enable_bidir(sw);
	if (ret)
		return ret;


> +		}
> +		sw->tmu.unidirectional = unidirect;
>  	} else {
> +		/*
> +		 * Host-router port configurations are written as

Host router

ditto everywhere.

> +		 * configurations for down-stream port of the parent of the

downstream

> +		 * child node - see above.
> +		 * Here only the host's router rate configuration is written

host routers'

> +		 */
>  		ret = tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_HIFI);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	sw->tmu.unidirectional = false;
>  	sw->tmu.rate = TB_SWITCH_TMU_RATE_HIFI;
>  	tb_sw_dbg(sw, "TMU: mode set to: %s\n", tb_switch_tmu_mode_name(sw));
>  
>  	return tb_switch_tmu_set_time_disruption(sw, false);
>  }
> +
> +/**
> + * tb_switch_tmu_enable() - Enable TMU on a switch
> + * @sw: Switch whose TMU to enable
> + *
> + * Enables TMU of a switch to be in unidirectional or bidirectional HiFi mode.
> + * Calling tb_switch_tmu_configure() is required before calling this function,
> + * to select the mode HiFi and directionality (unidirectional/bidirectional).
> + * In both modes all tunneling should work. Unidirectional mode is required for
> + * CLx (Link Low-Power) to work. LowRes mode is not used currently.
> + */
> +int tb_switch_tmu_enable(struct tb_switch *sw)
> +{
> +	if (sw->tmu.rate_request == TB_SWITCH_TMU_RATE_NORMAL)
> +		return -EOPNOTSUPP;
> +
> +	return tb_switch_tmu_hifi_enable(sw);
> +}
> +
> +/**
> + * tb_switch_tmu_configure() - Configure the TMU rate and directionality
> + * @sw: Switch whose mode to change
> + * @rate: Rate to configure Off/LowRes/HiFi
> + * @unidirectional: Unidirectionality selection: Unidirectional or Bidirectional
> + *
> + * Selects the rate of the TMU (Off, LowRes, HiFi), and Directionality
> + * (Unidirectional or Bidirectional)
> + * Shall be called before tb_switch_tmu_enable()
> + */
> +void tb_switch_tmu_configure(struct tb_switch *sw,
> +			     enum tb_switch_tmu_rate rate, bool unidirectional)
> +{
> +	sw->tmu.unidirect_request = unidirectional;
> +	sw->tmu.rate_request = rate;
> +}
> +
> +/**
> + * tb_switch_tmu_hifi_is_enabled() - Checks if the specified TMU mode
> + *				     bidir/uni enabled correctly
> + * @sw: Switch whose TMU mode to check
> + * @unidirect: Select bidirectional or unidirectional mode to check
> + *
> + * Read TMU directionality and rate from HW, and return true,
> + * if matches to bidirectional/unidirectional HiFi mode settings.
> + * Otherwise returns false.
> + */
> +bool tb_switch_tmu_hifi_is_enabled(struct tb_switch *sw, bool unidirect)
> +{
> +	return sw->tmu.rate == TB_SWITCH_TMU_RATE_HIFI &&
> +			       sw->tmu.unidirectional == unidirect;
> +}
> -- 
> 2.17.1
