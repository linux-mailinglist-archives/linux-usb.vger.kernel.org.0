Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31C73516DE8
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 12:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351588AbiEBKNQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 06:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiEBKNP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 06:13:15 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8888F7D
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651486186; x=1683022186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AnOcEUVp5xrtrFxHrw9GA2aCQlnHve2SUJFO3cEfbWo=;
  b=TuT1+1QczuGAWvmyGpSxPZXWNwybw6A3J+yQko3fR3pBwxTubka1fF2T
   QmOjzKUI1igelW2NNq042GWHTVZmLSWQ7b3fjLkd7j5gzuHP+fFKfoyXp
   Ff9gQEeHUwhr7bMRB8Kt63xFQbSgFAkmNGjNvwsVNCv1I+Vae5tpcEV0O
   UhZUrp2Y8t9gCBz6XB/T1oov1bBFNQ9/GGFaBnhTOY1jpyXsIWss4mdnH
   GBJib0JypQYiBrX2X6zAY2TkUMeAQBoDeDcui0owMzfPPdva4S00WSJpM
   JBAHInPpTdsPJqOVIBdIJY4lgR8raZEHAgMJKzRlhZUrgqtiWINevSTeH
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="330158267"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="330158267"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 03:09:46 -0700
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="516009043"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 03:09:43 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 02 May 2022 13:09:41 +0300
Date:   Mon, 2 May 2022 13:09:41 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 5/5] thunderbolt: Change TMU mode to Hifi-Uni once DP
 tunneled
Message-ID: <Ym+t5cI1Qho7B+Sd@lahna>
References: <20220501203321.19021-1-gil.fine@intel.com>
 <20220501203321.19021-6-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501203321.19021-6-gil.fine@intel.com>
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

On Sun, May 01, 2022 at 11:33:21PM +0300, Gil Fine wrote:
> Here we configure TMU mode to Hifi-Uni once DP tunnel is created.

DisplayPort (at least use that in the $subject).

> This is due to accuracy requirement for DP tunneling as appears in
> CM guide 1.0, section 7.3.2
> Due to Intel HW limitation, once we changed the TMU mode to Hifi-Uni

HW -> hardware

HiFi uni-directional

> (when DP is tunnel exists), we don't change TMU mode back to Normal-Uni,

normal un-idirectional

> even if DP tunnel is teared-down later.

torn down

> 
> Signed-off-by: Gil Fine <gil.fine@intel.com>
> ---
>  drivers/thunderbolt/tb.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 05a084e3e9f6..efe53d221ca8 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -50,6 +50,8 @@ struct tb_hotplug_event {
>  };
>  
>  static void tb_handle_hotplug(struct work_struct *work);
> +static int tb_enable_tmu_1st_child(struct tb *tb,
> +				   enum tb_switch_tmu_rate rate);
>  
>  static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
>  {
> @@ -118,6 +120,13 @@ static void tb_switch_discover_tunnels(struct tb_switch *sw,
>  		switch (port->config.type) {
>  		case TB_TYPE_DP_HDMI_IN:
>  			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids);
> +			/*
> +			 * In case of DP tunnel exists, change TMU mode to
> +			 * HiFi for CL0s to work.
> +			 */
> +			if (tunnel)
> +				tb_enable_tmu_1st_child(tb,
> +						TB_SWITCH_TMU_RATE_HIFI);
>  			break;
>  
>  		case TB_TYPE_PCIE_DOWN:
> @@ -235,6 +244,31 @@ static int tb_enable_tmu(struct tb_switch *sw)
>  	return tb_switch_tmu_enable(sw);
>  }
>  
> +/*
> + * Once a DP tunnel exists in the domain, we set the TMU mode so that
> + * it meets the accuracy requirements and also enables CLx entry (CL0s).
> + * We set the TMU mode of the first depth router(s) for CL0s to work.
> + */
> +static int tb_enable_tmu_1st_child(struct tb *tb, enum tb_switch_tmu_rate rate)
> +{
> +	struct tb_switch *root_sw = tb->root_switch;
> +	struct tb_port *port;
> +
> +	tb_switch_for_each_port(root_sw, port) {

Can't you use device_for_each_child() here?

> +		struct tb_switch *sw;
> +		int ret;
> +
> +		if (!tb_port_has_remote(port) || !tb_port_is_null(port))
> +			continue;
> +		sw = port->remote->sw;
> +		tb_switch_tmu_configure(sw, rate, tb_switch_is_clx_enabled(sw));
> +		if (tb_switch_tmu_enable(sw))
> +			tb_dbg(tb, "Fail switching TMU to HiFi for 1st depth router %d\n", ret);
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * tb_find_unused_port() - return the first inactive port on @sw
>   * @sw: Switch to find the port on
> @@ -981,6 +1015,12 @@ static void tb_tunnel_dp(struct tb *tb)
>  
>  	list_add_tail(&tunnel->list, &tcm->tunnel_list);
>  	tb_reclaim_usb3_bandwidth(tb, in, out);
> +	/*
> +	 * In case of DP tunnel exists, change TMU mode to
> +	 * HiFi for CL0s to work.
> +	 */
> +	tb_enable_tmu_1st_child(tb, TB_SWITCH_TMU_RATE_HIFI);
> +
>  	return;
>  
>  err_free:
> -- 
> 2.17.1
