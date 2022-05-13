Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF0BA525F6F
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 12:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351669AbiEMJxd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 05:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347873AbiEMJxc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 05:53:32 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBBF15FE06
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 02:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652435611; x=1683971611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=shAxM+nCXfef+ZsN5janX7kQEyb312CjDpgfNEv+NqM=;
  b=VYDa3rb30NSB3asrQD5o9d4mBNeuPKLH8jp6vtAqKZDIsf5r0lh60yak
   q8EwVv5+Tk+N/G4XzbZio3j9zVmRNDM3A1NASJ4DyY/4xH1CoeZAYLpIt
   3hIOqPKqG3dbCp92LyTUNvveZdM6sqaT1G6XAaqYg3JYgBXIbFFrF2sc0
   k+8j5NSWtiKhzZKMCL4xUtiM7xv9YjP6uMT+W+/a5YLkGAK8bDdX5c9If
   s/v60kugVz2axOmz1jnbiNGX9orgdIsNS5A3QJMlHYkR2ICqe+1QZfnz+
   Ayb5PXC0QoEbCr2Hw3jagtU7kBDw5pocQtF9vsSAOzZcBWNHjL8fNqkUG
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="330865725"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="330865725"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 02:53:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="554163399"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 02:53:28 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 13 May 2022 12:53:25 +0300
Date:   Fri, 13 May 2022 12:53:25 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v3 6/6] thunderbolt: Change TMU mode to HiFi
 uni-directional once DisplayPort tunneled
Message-ID: <Yn4qld89AVEd3cRD@lahna>
References: <20220511140549.10571-1-gil.fine@intel.com>
 <20220511140549.10571-7-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511140549.10571-7-gil.fine@intel.com>
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

Hi Gil,

On Wed, May 11, 2022 at 05:05:49PM +0300, Gil Fine wrote:
> Here we configure TMU mode to HiFi uni-directional once DP tunnel
> is created. This is due to accuracy requirement for DP tunneling
> as appears in CM guide 1.0, section 7.3.2.
> Due to Intel hardware limitation, once we changed the TMU mode to HiFi
> uni-directional (when DP tunnel exists), we don't change TMU mode back to
> normal uni-directional, even if DP tunnel is torn down later.
> 
> Signed-off-by: Gil Fine <gil.fine@intel.com>
> ---
>  drivers/thunderbolt/tb.c  | 28 ++++++++++++++++++++++++++++
>  drivers/thunderbolt/tb.h  |  5 +++++
>  drivers/thunderbolt/tmu.c | 14 ++++++++++++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index f512197e719b..d0f85a8c56de 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -50,6 +50,8 @@ struct tb_hotplug_event {
>  };
>  
>  static void tb_handle_hotplug(struct work_struct *work);
> +static void tb_enable_tmu_1st_child(struct tb *tb,
> +				    enum tb_switch_tmu_rate rate);

This forward declaration is not needed. You can just move the
implementation before you call it first time.

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
> @@ -235,6 +244,19 @@ static int tb_enable_tmu(struct tb_switch *sw)
>  	return tb_switch_tmu_enable(sw);
>  }
>  
> +/*
> + * Once a DP tunnel exists in the domain, we set the TMU mode so that
> + * it meets the accuracy requirements and also enables CLx entry (CL0s).
> + * We set the TMU mode of the first depth router(s) for CL0s to work.
> + */
> +static void tb_enable_tmu_1st_child(struct tb *tb, enum tb_switch_tmu_rate rate)
> +{
> +	struct tb_sw_tmu_config tmu = { .rate = rate };
> +
> +	device_for_each_child(&tb->root_switch->dev, &tmu,
> +			      tb_switch_tmu_config_enable);
> +}
> +
>  /**
>   * tb_find_unused_port() - return the first inactive port on @sw
>   * @sw: Switch to find the port on
> @@ -985,6 +1007,12 @@ static void tb_tunnel_dp(struct tb *tb)
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
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index a16fffba9dd2..3dbd9d919d5f 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -110,6 +110,10 @@ struct tb_switch_tmu {
>  	enum tb_switch_tmu_rate rate_request;
>  };
>  
> +struct tb_sw_tmu_config {
> +	enum tb_switch_tmu_rate rate;
> +};

Is this wrapper structure really needed?

> +
>  enum tb_clx {
>  	TB_CLX_DISABLE,
>  	/* CL0s and CL1 are enabled and supported together */
> @@ -934,6 +938,7 @@ int tb_switch_tmu_enable(struct tb_switch *sw);
>  void tb_switch_tmu_configure(struct tb_switch *sw,
>  			     enum tb_switch_tmu_rate rate,
>  			     bool unidirectional);
> +int tb_switch_tmu_config_enable(struct device *dev, void *data);
>  /**
>   * tb_switch_tmu_is_enabled() - Checks if the specified TMU mode is enabled
>   * @sw: Router whose TMU mode to check
> diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
> index e822ab90338b..b8ff9f64a71e 100644
> --- a/drivers/thunderbolt/tmu.c
> +++ b/drivers/thunderbolt/tmu.c
> @@ -727,6 +727,20 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
>  	return tb_switch_tmu_set_time_disruption(sw, false);
>  }

You are missing kernel-doc for the non-static function.

>  
> +int tb_switch_tmu_config_enable(struct device *dev, void *data)

Also can we please make it take some real type and not something
arbitrary?

Can it be const too?

> +{
> +	if (tb_is_switch(dev)) {
> +		struct tb_switch *sw = tb_to_switch(dev);
> +		struct tb_sw_tmu_config *tmu = data;
> +
> +		tb_switch_tmu_configure(sw, tmu->rate, tb_switch_is_clx_enabled(sw, TB_CL1));
> +		if (tb_switch_tmu_enable(sw))
> +			tb_sw_dbg(sw, "Fail switching TMU to HiFi for 1st depth router\n");

Be consistent with the messaging so don't start with capital letter
here.

> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * tb_switch_tmu_configure() - Configure the TMU rate and directionality
>   * @sw: Router whose mode to change
> -- 
> 2.17.1
