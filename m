Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9626519D90
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 13:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348494AbiEDLHU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 07:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348461AbiEDLHT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 07:07:19 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6C7237D6
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 04:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651662219; x=1683198219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HWcKFkjpsRRxadZZdOFwx2u6JtoYJZEji6KDkmHQozk=;
  b=HrhBgSdcK978XeoamAh0te/C3eLdC/2KBVVizkxS1Qypc2K5d7mpSctZ
   DgE8ZRm2JmWhzqBG0iZC+zb641qKIsBWroG3tY219to8dqlY8HyboyLcN
   yg4cTgPQzL5CfkJIiQPplvKor2GaV3OQpTTJmk7FioJRZI/qOHkDBDJLP
   naDfWlpo22ktT1VT4ipCbRkQyzWLdDaR5D3gRMI16KFA20yTJYHus6flQ
   RnBV5iTJ7ETJTY52afprVTW7ayxNkFZRxfCnjrYFofpO7g0TUzDgMBcu/
   HeZOK31j2rBgytYi9IrqtnOhNi5aiz2XhyDSTMGlikQfEyVpZyTOFFXzZ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="330720784"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="330720784"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 04:03:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="664421977"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 04:03:36 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 04 May 2022 14:03:33 +0300
Date:   Wed, 4 May 2022 14:03:33 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 4/5] thunderbolt: Add CL1 support for USB4 and Titan
 Ridge routers
Message-ID: <YnJdhTs0gL96LWXP@lahna>
References: <20220501203321.19021-1-gil.fine@intel.com>
 <20220501203321.19021-5-gil.fine@intel.com>
 <Ym+sm09F9Atu5ghC@lahna>
 <20220504105207.GB19479@ccdjLinux26>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504105207.GB19479@ccdjLinux26>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, May 04, 2022 at 01:52:07PM +0300, Gil Fine wrote:
> On Mon, May 02, 2022 at 01:04:11PM +0300, Mika Westerberg wrote:
> > Hi Gil,
> > 
> > On Sun, May 01, 2022 at 11:33:20PM +0300, Gil Fine wrote:
> > > In this patch we add support for a second low power state of the link: CL1.
> > > Low power states (called collectively CLx) are used to reduce
> > > transmitter and receiver power when a high-speed lane is idle.
> > > We enable it, if both sides of the link support it,
> > > and only for the first hop router (i.e. the first device that connected
> > > to the host router). This is needed for better thermal management.
> > > 
> > > Signed-off-by: Gil Fine <gil.fine@intel.com>
> > > ---
> > >  drivers/thunderbolt/switch.c  |  79 ++++++++-------
> > >  drivers/thunderbolt/tb.c      |  24 +++--
> > >  drivers/thunderbolt/tb.h      |  22 ++++-
> > >  drivers/thunderbolt/tb_regs.h |   8 ++
> > >  drivers/thunderbolt/tmu.c     | 177 ++++++++++++++++++++++++++++------
> > >  5 files changed, 237 insertions(+), 73 deletions(-)
> > > 
> > > diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> > > index 42b7daaf9c4d..4288cb5550f8 100644
> > > --- a/drivers/thunderbolt/switch.c
> > > +++ b/drivers/thunderbolt/switch.c
> > > @@ -3064,7 +3064,7 @@ void tb_switch_suspend(struct tb_switch *sw, bool runtime)
> > >  	 * done for USB4 device too as CLx is re-enabled at resume.
> > >  	 */
> > >  	if (tb_switch_is_clx_enabled(sw)) {
> > > -		if (tb_switch_disable_clx(sw, TB_CL0S))
> > > +		if (tb_switch_disable_clx(sw, TB_CL1))
> > 
> > Hm, what if the router only supports CL0s? Will this still enable CL0s
> > then?
> 
> Actually as I just understood, both can't be split and shall be enabled together.
> Even if we only enable CL0s, we shall also enable CL1.
> Also, the "CL0x/CL1 Support" bits set by HW together.
> Seems as the spec is confusing on this...
> Seems like we can merge both of them to be one ENUM and call it someting like
> "TB_CL0s_CL1":
> enum tb_clx {
> 	TB_CLX_DISABLE,
> 	TB_CL0s_CL1,
> 	TB_CL2,
> }
> To do it like this:
> 
> if (tb_switch_is_clx_enabled(sw, TB_CL0S_CL1)) {
> 	if (tb_switch_disable_clx(sw, TB_CL0S_CL1))
> 		tb_sw_warn(sw, "failed to disable %s on upstream port\n",
> 			   tb_switch_clx_name(TB_CL0S_CL1));
> }
> 
> What do you think?

OK but see my answer to the previous email :)

> > 
> > >  			tb_sw_warn(sw, "failed to disable CLx on upstream port\n");
> > >  	}
> > >  
> > > @@ -3358,12 +3358,12 @@ static bool tb_port_clx_supported(struct tb_port *port, enum tb_clx clx)
> > >  
> > >  	switch (clx) {
> > >  	case TB_CL0S:
> > > +	case TB_CL1:
> > >  		/* CL0s support requires also CL1 support */
> > >  		mask = LANE_ADP_CS_0_CL0S_SUPPORT | LANE_ADP_CS_0_CL1_SUPPORT;
> > >  		break;
> > >  
> > > -	/* For now we support only CL0s. Not CL1, CL2 */
> > > -	case TB_CL1:
> > > +	/* For now we support only CL0s and CL1. Not CL2 */
> > >  	case TB_CL2:
> > >  	default:
> > >  		return false;
> > > @@ -3377,12 +3377,7 @@ static bool tb_port_clx_supported(struct tb_port *port, enum tb_clx clx)
> > >  	return !!(val & mask);
> > >  }
> > >  
> > > -static inline bool tb_port_cl0s_supported(struct tb_port *port)
> > > -{
> > > -	return tb_port_clx_supported(port, TB_CL0S);
> > > -}
> > > -
> > > -static int __tb_port_cl0s_set(struct tb_port *port, bool enable)
> > > +static int __tb_port_cl0s_cl1_set(struct tb_port *port, bool enable)
> > >  {
> > >  	u32 phy, mask;
> > >  	int ret;
> > > @@ -3403,20 +3398,32 @@ static int __tb_port_cl0s_set(struct tb_port *port, bool enable)
> > >  			     port->cap_phy + LANE_ADP_CS_1, 1);
> > >  }
> > >  
> > > -static int tb_port_cl0s_disable(struct tb_port *port)
> > > +static int tb_port_cl0s_cl1_disable(struct tb_port *port)
> > > +{
> > > +	return __tb_port_cl0s_cl1_set(port, false);
> > > +}
> > > +
> > > +static int tb_port_cl0s_cl1_enable(struct tb_port *port)
> > >  {
> > > -	return __tb_port_cl0s_set(port, false);
> > > +	return __tb_port_cl0s_cl1_set(port, true);
> > >  }
> > >  
> > > -static int tb_port_cl0s_enable(struct tb_port *port)
> > > +static const char *tb_switch_clx_name(enum tb_clx clx)
> > >  {
> > > -	return __tb_port_cl0s_set(port, true);
> > > +	switch (clx) {
> > > +	case TB_CL0S:
> > > +		return "CL0s";
> > > +	case TB_CL1:
> > > +		return "CL1";
> > > +	default:
> > > +		return "Unknown";
> > > +	}
> > >  }
> > >  
> > > -static int tb_switch_enable_cl0s(struct tb_switch *sw)
> > > +static int __tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
> > >  {
> > >  	struct tb_switch *parent = tb_switch_parent(sw);
> > > -	bool up_cl0s_support, down_cl0s_support;
> > > +	bool up_clx_support, down_clx_support;
> > >  	struct tb_port *up, *down;
> > >  	int ret;
> > >  
> > > @@ -3441,37 +3448,37 @@ static int tb_switch_enable_cl0s(struct tb_switch *sw)
> > >  	up = tb_upstream_port(sw);
> > >  	down = tb_port_at(tb_route(sw), parent);
> > >  
> > > -	up_cl0s_support = tb_port_cl0s_supported(up);
> > > -	down_cl0s_support = tb_port_cl0s_supported(down);
> > > +	up_clx_support = tb_port_clx_supported(up, clx);
> > > +	down_clx_support = tb_port_clx_supported(down, clx);
> > >  
> > > -	tb_port_dbg(up, "CL0s %ssupported\n",
> > > -		    up_cl0s_support ? "" : "not ");
> > > -	tb_port_dbg(down, "CL0s %ssupported\n",
> > > -		    down_cl0s_support ? "" : "not ");
> > > +	tb_port_dbg(up, "%s %ssupported\n", tb_switch_clx_name(clx),
> > > +		    up_clx_support ? "" : "not ");
> > > +	tb_port_dbg(down, "%s %ssupported\n", tb_switch_clx_name(clx),
> > > +		    down_clx_support ? "" : "not ");
> > >  
> > > -	if (!up_cl0s_support || !down_cl0s_support)
> > > +	if (!up_clx_support || !down_clx_support)
> > >  		return -EOPNOTSUPP;
> > >  
> > > -	ret = tb_port_cl0s_enable(up);
> > > +	ret = tb_port_cl0s_cl1_enable(up);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > -	ret = tb_port_cl0s_enable(down);
> > > +	ret = tb_port_cl0s_cl1_enable(down);
> > >  	if (ret) {
> > > -		tb_port_cl0s_disable(up);
> > > +		tb_port_cl0s_cl1_disable(up);
> > >  		return ret;
> > >  	}
> > >  
> > >  	ret = tb_switch_mask_clx_objections(sw);
> > >  	if (ret) {
> > > -		tb_port_cl0s_disable(up);
> > > -		tb_port_cl0s_disable(down);
> > > +		tb_port_cl0s_cl1_disable(up);
> > > +		tb_port_cl0s_cl1_disable(down);
> > >  		return ret;
> > >  	}
> > >  
> > > -	sw->clx = TB_CL0S;
> > > +	sw->clx = clx;
> > >  
> > > -	tb_port_dbg(up, "CL0s enabled\n");
> > > +	tb_port_dbg(up, "%s enabled\n", tb_switch_clx_name(clx));
> > >  	return 0;
> > >  }
> > >  
> > > @@ -3505,14 +3512,15 @@ int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
> > >  
> > >  	switch (clx) {
> > >  	case TB_CL0S:
> > > -		return tb_switch_enable_cl0s(sw);
> > > +	case TB_CL1:
> > > +		return __tb_switch_enable_clx(sw, clx);
> > >  
> > >  	default:
> > >  		return -EOPNOTSUPP;
> > >  	}
> > >  }
> > >  
> > > -static int tb_switch_disable_cl0s(struct tb_switch *sw)
> > > +static int tb_switch_disable_cl0s_cl1(struct tb_switch *sw)
> > >  {
> > >  	struct tb_switch *parent = tb_switch_parent(sw);
> > >  	struct tb_port *up, *down;
> > > @@ -3534,17 +3542,17 @@ static int tb_switch_disable_cl0s(struct tb_switch *sw)
> > >  
> > >  	up = tb_upstream_port(sw);
> > >  	down = tb_port_at(tb_route(sw), parent);
> > > -	ret = tb_port_cl0s_disable(up);
> > > +	ret = tb_port_cl0s_cl1_disable(up);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > -	ret = tb_port_cl0s_disable(down);
> > > +	ret = tb_port_cl0s_cl1_disable(down);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > >  	sw->clx = TB_CLX_DISABLE;
> > >  
> > > -	tb_port_dbg(up, "CL0s disabled\n");
> > > +	tb_port_dbg(up, "CL0s, CL1 disabled\n");
> > >  	return 0;
> > >  }
> > >  
> > > @@ -3562,7 +3570,8 @@ int tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
> > >  
> > >  	switch (clx) {
> > >  	case TB_CL0S:
> > > -		return tb_switch_disable_cl0s(sw);
> > > +	case TB_CL1:
> > > +		return tb_switch_disable_cl0s_cl1(sw);
> > >  
> > >  	default:
> > >  		return -EOPNOTSUPP;
> > > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > > index 7419cd1aefba..05a084e3e9f6 100644
> > > --- a/drivers/thunderbolt/tb.c
> > > +++ b/drivers/thunderbolt/tb.c
> > > @@ -221,7 +221,7 @@ static int tb_enable_tmu(struct tb_switch *sw)
> > >  	int ret;
> > >  
> > >  	/* If it is already enabled in correct mode, don't touch it */
> > > -	if (tb_switch_tmu_hifi_is_enabled(sw, sw->tmu.unidirectional_request))
> > > +	if (tb_switch_tmu_is_enabled(sw, sw->tmu.unidirectional_request))
> > >  		return 0;
> > >  
> > >  	ret = tb_switch_tmu_disable(sw);
> > > @@ -671,12 +671,19 @@ static void tb_scan_port(struct tb_port *port)
> > >  	/* Set the link configured */
> > >  	tb_switch_configure_link(sw);
> > >  	/* Silently ignore CLx enabling in case CLx is not supported */
> > > -	ret = tb_switch_enable_clx(sw, TB_CL0S);
> > > +	ret = tb_switch_enable_clx(sw, TB_CL1);
> > >  	if (ret && ret != -EOPNOTSUPP)
> > >  		tb_sw_warn(sw, "failed to enable CLx on upstream port\n");
> > >  
> > > -	tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI,
> > > -				tb_switch_is_clx_enabled(sw));
> > > +	if (tb_switch_is_clx_enabled(sw))
> > > +		/*
> > > +		 * To support highest CLx state, we set host router's TMU to
> > > +		 * Normal-Uni mode.
> > > +		 */
> > > +		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_NORMAL, true);
> > > +	else
> > > +		/* If CLx disabled, configure router's TMU to HiFi-Bidir mode*/
> > > +		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
> > >  
> > >  	if (tb_enable_tmu(sw))
> > >  		tb_sw_warn(sw, "failed to enable TMU\n");
> > > @@ -1416,7 +1423,12 @@ static int tb_start(struct tb *tb)
> > >  		return ret;
> > >  	}
> > >  
> > > -	tb_switch_tmu_configure(tb->root_switch, TB_SWITCH_TMU_RATE_HIFI, false);
> > > +	/*
> > > +	 * To support highest CLx state, we set host router's TMU to
> > > +	 * Normal mode.
> > > +	 */
> > > +	tb_switch_tmu_configure(tb->root_switch, TB_SWITCH_TMU_RATE_NORMAL,
> > > +				false);
> > >  	/* Enable TMU if it is off */
> > >  	tb_switch_tmu_enable(tb->root_switch);
> > >  	/* Full scan to discover devices added before the driver was loaded. */
> > > @@ -1462,7 +1474,7 @@ static void tb_restore_children(struct tb_switch *sw)
> > >  		return;
> > >  
> > >  	/* Silently ignore CLx re-enabling in case CLx is not supported */
> > > -	ret = tb_switch_enable_clx(sw, TB_CL0S);
> > > +	ret = tb_switch_enable_clx(sw, TB_CL1);
> > >  	if (ret && ret != -EOPNOTSUPP)
> > >  		tb_sw_warn(sw, "failed to re-enable CLx on upstream port\n");
> > >  
> > > diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> > > index ad025ff142ba..6a7204cf67f1 100644
> > > --- a/drivers/thunderbolt/tb.h
> > > +++ b/drivers/thunderbolt/tb.h
> > > @@ -934,17 +934,17 @@ void tb_switch_tmu_configure(struct tb_switch *sw,
> > >  			     enum tb_switch_tmu_rate rate,
> > >  			     bool unidirectional);
> > >  /**
> > > - * tb_switch_tmu_hifi_is_enabled() - Checks if the specified TMU mode is enabled
> > > + * tb_switch_tmu_is_enabled() - Checks if the specified TMU mode is enabled
> > >   * @sw: Router whose TMU mode to check
> > >   * @unidirectional: If uni-directional (bi-directional otherwise)
> > >   *
> > >   * Return true if hardware TMU configuration matches the one passed in
> > > - * as parameter. That is HiFi and either uni-directional or bi-directional.
> > > + * as parameter. That is HiFi/Normal and either uni-directional or bi-directional.
> > >   */
> > > -static inline bool tb_switch_tmu_hifi_is_enabled(const struct tb_switch *sw,
> > > -						 bool unidirectional)
> > > +static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw,
> > > +					    bool unidirectional)
> > >  {
> > > -	return sw->tmu.rate == TB_SWITCH_TMU_RATE_HIFI &&
> > > +	return sw->tmu.rate == sw->tmu.rate_request &&
> > >  	       sw->tmu.unidirectional == unidirectional;
> > >  }
> > >  
> > > @@ -975,6 +975,18 @@ static inline bool tb_switch_is_cl0s_enabled(const struct tb_switch *sw)
> > >  	return sw->clx == TB_CL0S;
> > >  }
> > >  
> > > +/**
> > > + * tb_switch_is_cl1_enabled() - Checks if the CL1 is enabled
> > > + * @sw: Router to check for the CL1
> > > + *
> > > + * Checks if the CL1 is enabled on the router upstream link.
> > > + * Not applicable for a host router.
> > > + */
> > > +static inline bool tb_switch_is_cl1_enabled(const struct tb_switch *sw)
> > > +{
> > > +	return sw->clx == TB_CL1;
> > > +}
> > > +
> > >  /**
> > >   * tb_switch_is_clx_supported() - Is CLx supported on this type of router
> > >   * @sw: The router to check CLx support for
> > > diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
> > > index b301eeb0c89b..f88dd27e4f62 100644
> > > --- a/drivers/thunderbolt/tb_regs.h
> > > +++ b/drivers/thunderbolt/tb_regs.h
> > > @@ -234,6 +234,8 @@ enum usb4_switch_op {
> > >  
> > >  /* Router TMU configuration */
> > >  #define TMU_RTR_CS_0				0x00
> > > +#define TMU_RTR_CS_0_FREQ_WIND_MASK		GENMASK(26, 16)
> > > +#define TMU_RTR_CS_0_FREQ_WIND_SHIFT		16
> > >  #define TMU_RTR_CS_0_TD				BIT(27)
> > >  #define TMU_RTR_CS_0_UCAP			BIT(30)
> > >  #define TMU_RTR_CS_1				0x01
> > > @@ -244,6 +246,12 @@ enum usb4_switch_op {
> > >  #define TMU_RTR_CS_3_LOCAL_TIME_NS_MASK		GENMASK(15, 0)
> > >  #define TMU_RTR_CS_3_TS_PACKET_INTERVAL_MASK	GENMASK(31, 16)
> > >  #define TMU_RTR_CS_3_TS_PACKET_INTERVAL_SHIFT	16
> > > +#define TMU_RTR_CS_15				0xf
> > > +#define TMU_RTR_CS_15_AVG_MASK			GENMASK(5, 0)
> > > +#define TMU_RTR_CS_15_FREQ_AVG_SHIFT		0
> > > +#define TMU_RTR_CS_15_DELAY_AVG_SHIFT		6
> > > +#define TMU_RTR_CS_15_OFFSET_AVG_SHIFT		12
> > > +#define TMU_RTR_CS_15_ERROR_AVG_SHIFT		18
> > >  #define TMU_RTR_CS_22				0x16
> > >  #define TMU_RTR_CS_24				0x18
> > >  #define TMU_RTR_CS_25				0x19
> > > diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
> > > index 985ca43b8f39..a03c57a8728c 100644
> > > --- a/drivers/thunderbolt/tmu.c
> > > +++ b/drivers/thunderbolt/tmu.c
> > > @@ -11,6 +11,55 @@
> > >  
> > >  #include "tb.h"
> > >  
> > > +static int tb_switch_set_tmu_mode_params(struct tb_switch *sw,
> > > +					 enum tb_switch_tmu_rate rate)
> > > +{
> > > +	u32 freq_meas_wind[2] = { 30, 800 };
> > > +	u32 avg_const[2] = { 4, 8 };
> > > +	u32 freq, avg, val;
> > > +	int ret;
> > > +
> > > +	if (rate == TB_SWITCH_TMU_RATE_NORMAL) {
> > > +		freq = freq_meas_wind[0];
> > > +		avg = avg_const[0];
> > > +	} else if (rate == TB_SWITCH_TMU_RATE_HIFI) {
> > > +		freq = freq_meas_wind[1];
> > > +		avg = avg_const[1];
> > > +	} else {
> > > +		return 0;
> > > +	}
> > > +
> > > +	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
> > > +			 sw->tmu.cap + TMU_RTR_CS_0, 1);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	val &= ~TMU_RTR_CS_0_FREQ_WIND_MASK;
> > > +	val |= freq << TMU_RTR_CS_0_FREQ_WIND_SHIFT;
> > > +
> > > +	ret = tb_sw_write(sw, &val, TB_CFG_SWITCH,
> > > +			  sw->tmu.cap + TMU_RTR_CS_0, 1);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
> > > +			 sw->tmu.cap + TMU_RTR_CS_15, 1);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	val &= ~TMU_RTR_CS_15_AVG_MASK << TMU_RTR_CS_15_FREQ_AVG_SHIFT &
> > > +		~TMU_RTR_CS_15_AVG_MASK << TMU_RTR_CS_15_DELAY_AVG_SHIFT &
> > > +		~TMU_RTR_CS_15_AVG_MASK << TMU_RTR_CS_15_OFFSET_AVG_SHIFT &
> > > +		~TMU_RTR_CS_15_AVG_MASK << TMU_RTR_CS_15_ERROR_AVG_SHIFT;
> > > +	val |= avg << TMU_RTR_CS_15_FREQ_AVG_SHIFT |
> > > +		avg << TMU_RTR_CS_15_DELAY_AVG_SHIFT |
> > > +		avg << TMU_RTR_CS_15_OFFSET_AVG_SHIFT |
> > > +		avg << TMU_RTR_CS_15_ERROR_AVG_SHIFT;
> > 
> > Perhaps use FIELD_x macros from include/linux/bitfield.h?
> > 
> Yes, you are right. I will fix it in v2 series.
> 
> > > +
> > > +	return tb_sw_write(sw, &val, TB_CFG_SWITCH,
> > > +			   sw->tmu.cap + TMU_RTR_CS_15, 1);
> > > +}
> > > +
> > >  static const char *tb_switch_tmu_mode_name(const struct tb_switch *sw)
> > >  {
> > >  	bool root_switch = !tb_route(sw);
> > > @@ -348,7 +397,7 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
> > >  
> > >  
> > >  	if (tb_route(sw)) {
> > > -		bool unidirectional = tb_switch_tmu_hifi_is_enabled(sw, true);
> > > +		bool unidirectional = sw->tmu.unidirectional;
> > >  		struct tb_switch *parent = tb_switch_parent(sw);
> > >  		struct tb_port *down, *up;
> > >  		int ret;
> > > @@ -412,6 +461,7 @@ static void __tb_switch_tmu_off(struct tb_switch *sw, bool unidirectional)
> > >  	else
> > >  		tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
> > >  
> > > +	tb_switch_set_tmu_mode_params(sw, sw->tmu.rate);
> > >  	tb_port_tmu_unidirectional_disable(down);
> > >  	tb_port_tmu_unidirectional_disable(up);
> > >  }
> > > @@ -493,7 +543,11 @@ static int __tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)
> > >  
> > >  	up = tb_upstream_port(sw);
> > >  	down = tb_port_at(tb_route(sw), parent);
> > > -	ret = tb_switch_tmu_rate_write(parent, TB_SWITCH_TMU_RATE_HIFI);
> > > +	ret = tb_switch_tmu_rate_write(parent, sw->tmu.rate_request);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = tb_switch_set_tmu_mode_params(sw, sw->tmu.rate_request);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > @@ -520,7 +574,85 @@ static int __tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)
> > >  	return ret;
> > >  }
> > >  
> > > -static int tb_switch_tmu_hifi_enable(struct tb_switch *sw)
> > > +static void __tb_switch_tmu_change_mode_prev(struct tb_switch *sw)
> > > +{
> > > +	struct tb_switch *parent = tb_switch_parent(sw);
> > > +	struct tb_port *down, *up;
> > > +
> > > +	down = tb_port_at(tb_route(sw), parent);
> > > +	up = tb_upstream_port(sw);
> > > +	/*
> > > +	 * In case of any failure in one of the steps when change mode,
> > > +	 * get back to the TMU configurations in previous mode.
> > > +	 * In case of additional failures in the functions below,
> > > +	 * ignore them since the caller shall already report a failure.
> > > +	 */
> > > +	tb_port_tmu_set_unidirectional(down, sw->tmu.unidirectional);
> > > +	if (sw->tmu.unidirectional_request)
> > > +		tb_switch_tmu_rate_write(parent, sw->tmu.rate);
> > > +	else
> > > +		tb_switch_tmu_rate_write(sw, sw->tmu.rate);
> > > +
> > > +	tb_switch_set_tmu_mode_params(sw, sw->tmu.rate);
> > > +	tb_port_tmu_set_unidirectional(up, sw->tmu.unidirectional);
> > > +}
> > > +
> > > +static int __tb_switch_tmu_change_mode(struct tb_switch *sw)
> > > +{
> > > +	struct tb_switch *parent = tb_switch_parent(sw);
> > > +	struct tb_port *up, *down;
> > > +	int ret;
> > > +
> > > +	up = tb_upstream_port(sw);
> > > +	down = tb_port_at(tb_route(sw), parent);
> > > +	ret = tb_port_tmu_set_unidirectional(down,
> > > +					     sw->tmu.unidirectional_request);
> > 
> > This looks better if you put them single line:
> > 
> > 	ret = tb_port_tmu_set_unidirectional(down, sw->tmu.unidirectional_request);
> > 
> Yes indeed, but in this case it doesn't fit to 80 chars per line :)

It does not matter - 80 chars is not a hard-limit, it's more like
a guidance :)
