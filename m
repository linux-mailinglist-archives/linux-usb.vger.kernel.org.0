Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 533475279BF
	for <lists+linux-usb@lfdr.de>; Sun, 15 May 2022 22:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbiEOUSI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 May 2022 16:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiEOUSG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 May 2022 16:18:06 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04301E3D9
        for <linux-usb@vger.kernel.org>; Sun, 15 May 2022 13:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652645884; x=1684181884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4+uKtVNzRfHLG/OkccYtXiLrZzxLp5fjFzw2xf5kuCI=;
  b=UkTlcUw5EbfNLaWXAoZ28Tu2sPHlzo507M+yYi6rW3KfGSxTSk1Okhz3
   zzD3MFhaCK9hQhyBj2JL8K9lRbu9e1JeGYvgpfON192TryGoVBpONUJFd
   tYqmFN18AEgYnIoIBQwcARqCga8JHMarwiQnqhvpotFHfYrYxs5iQ4k1U
   Pp0a/PNkxo06Dz9dVCdBYyKKLHoT4RVlQgxGSBolUzTG92TsjQraQxQfR
   E2SXCBZ87AFGeYnF3tKy3Vn4ezwLb8q9BRv/VU87bfynuDoOuc1INf+Cv
   PwIO3/ZWOhuxcpvQ1eW4eDZMzd+eb/iZE3lfFKlblKRyxN9bC3ezWQxUw
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="268252193"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="268252193"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2022 13:18:03 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="544057285"
Received: from ccdjpclinux26.jer.intel.com (HELO localhost) ([10.12.48.253])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2022 13:18:01 -0700
Date:   Sun, 15 May 2022 23:27:46 +0300
From:   Gil Fine <gil.fine@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Gil Fine <gil.fine@intel.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v3 6/6] thunderbolt: Change TMU mode to HiFi
 uni-directional once DisplayPort tunneled
Message-ID: <20220515202746.GA8368@ccdjLinux26>
References: <20220511140549.10571-1-gil.fine@intel.com>
 <20220511140549.10571-7-gil.fine@intel.com>
 <Yn4qld89AVEd3cRD@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yn4qld89AVEd3cRD@lahna>
Organization: Intel Israel Jerusalem (IDPj /IDCj) Har Hotzvim, HaMarpe Street
 9, Zip code 9777409
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,

On Fri, May 13, 2022 at 12:53:25PM +0300, Mika Westerberg wrote:
> Hi Gil,
> 
> On Wed, May 11, 2022 at 05:05:49PM +0300, Gil Fine wrote:
> > Here we configure TMU mode to HiFi uni-directional once DP tunnel
> > is created. This is due to accuracy requirement for DP tunneling
> > as appears in CM guide 1.0, section 7.3.2.
> > Due to Intel hardware limitation, once we changed the TMU mode to HiFi
> > uni-directional (when DP tunnel exists), we don't change TMU mode back to
> > normal uni-directional, even if DP tunnel is torn down later.
> > 
> > Signed-off-by: Gil Fine <gil.fine@intel.com>
> > ---
> >  drivers/thunderbolt/tb.c  | 28 ++++++++++++++++++++++++++++
> >  drivers/thunderbolt/tb.h  |  5 +++++
> >  drivers/thunderbolt/tmu.c | 14 ++++++++++++++
> >  3 files changed, 47 insertions(+)
> > 
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index f512197e719b..d0f85a8c56de 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -50,6 +50,8 @@ struct tb_hotplug_event {
> >  };
> >  
> >  static void tb_handle_hotplug(struct work_struct *work);
> > +static void tb_enable_tmu_1st_child(struct tb *tb,
> > +				    enum tb_switch_tmu_rate rate);
> 
> This forward declaration is not needed. You can just move the
> implementation before you call it first time.

Sure, right.

> 
> >  static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
> >  {
> > @@ -118,6 +120,13 @@ static void tb_switch_discover_tunnels(struct tb_switch *sw,
> >  		switch (port->config.type) {
> >  		case TB_TYPE_DP_HDMI_IN:
> >  			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids);
> > +			/*
> > +			 * In case of DP tunnel exists, change TMU mode to
> > +			 * HiFi for CL0s to work.
> > +			 */
> > +			if (tunnel)
> > +				tb_enable_tmu_1st_child(tb,
> > +						TB_SWITCH_TMU_RATE_HIFI);
> >  			break;
> >  
> >  		case TB_TYPE_PCIE_DOWN:
> > @@ -235,6 +244,19 @@ static int tb_enable_tmu(struct tb_switch *sw)
> >  	return tb_switch_tmu_enable(sw);
> >  }
> >  
> > +/*
> > + * Once a DP tunnel exists in the domain, we set the TMU mode so that
> > + * it meets the accuracy requirements and also enables CLx entry (CL0s).
> > + * We set the TMU mode of the first depth router(s) for CL0s to work.
> > + */
> > +static void tb_enable_tmu_1st_child(struct tb *tb, enum tb_switch_tmu_rate rate)
> > +{
> > +	struct tb_sw_tmu_config tmu = { .rate = rate };
> > +
> > +	device_for_each_child(&tb->root_switch->dev, &tmu,
> > +			      tb_switch_tmu_config_enable);
> > +}
> > +
> >  /**
> >   * tb_find_unused_port() - return the first inactive port on @sw
> >   * @sw: Switch to find the port on
> > @@ -985,6 +1007,12 @@ static void tb_tunnel_dp(struct tb *tb)
> >  
> >  	list_add_tail(&tunnel->list, &tcm->tunnel_list);
> >  	tb_reclaim_usb3_bandwidth(tb, in, out);
> > +	/*
> > +	 * In case of DP tunnel exists, change TMU mode to
> > +	 * HiFi for CL0s to work.
> > +	 */
> > +	tb_enable_tmu_1st_child(tb, TB_SWITCH_TMU_RATE_HIFI);
> > +
> >  	return;
> >  
> >  err_free:
> > diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> > index a16fffba9dd2..3dbd9d919d5f 100644
> > --- a/drivers/thunderbolt/tb.h
> > +++ b/drivers/thunderbolt/tb.h
> > @@ -110,6 +110,10 @@ struct tb_switch_tmu {
> >  	enum tb_switch_tmu_rate rate_request;
> >  };
> >  
> > +struct tb_sw_tmu_config {
> > +	enum tb_switch_tmu_rate rate;
> > +};
> 
> Is this wrapper structure really needed?

Right, will fix

> 
> > +
> >  enum tb_clx {
> >  	TB_CLX_DISABLE,
> >  	/* CL0s and CL1 are enabled and supported together */
> > @@ -934,6 +938,7 @@ int tb_switch_tmu_enable(struct tb_switch *sw);
> >  void tb_switch_tmu_configure(struct tb_switch *sw,
> >  			     enum tb_switch_tmu_rate rate,
> >  			     bool unidirectional);
> > +int tb_switch_tmu_config_enable(struct device *dev, void *data);
> >  /**
> >   * tb_switch_tmu_is_enabled() - Checks if the specified TMU mode is enabled
> >   * @sw: Router whose TMU mode to check
> > diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
> > index e822ab90338b..b8ff9f64a71e 100644
> > --- a/drivers/thunderbolt/tmu.c
> > +++ b/drivers/thunderbolt/tmu.c
> > @@ -727,6 +727,20 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
> >  	return tb_switch_tmu_set_time_disruption(sw, false);
> >  }
> 
> You are missing kernel-doc for the non-static function.

Right, will add
> 
> >  
> > +int tb_switch_tmu_config_enable(struct device *dev, void *data)
> 
> Also can we please make it take some real type and not something
> arbitrary?
You mean the names, right?
Something like:
int tb_switch_tmu_config_enable(struct device *parent, void *rate)
If so, yes, I will

> 
> Can it be const too?
IIUC, it shall be a function pointer with specified signature otherwise it will fail
at compilation

> 
> > +{
> > +	if (tb_is_switch(dev)) {
> > +		struct tb_switch *sw = tb_to_switch(dev);
> > +		struct tb_sw_tmu_config *tmu = data;
> > +
> > +		tb_switch_tmu_configure(sw, tmu->rate, tb_switch_is_clx_enabled(sw, TB_CL1));
> > +		if (tb_switch_tmu_enable(sw))
> > +			tb_sw_dbg(sw, "Fail switching TMU to HiFi for 1st depth router\n");
> 
> Be consistent with the messaging so don't start with capital letter
> here.

OK

> 
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * tb_switch_tmu_configure() - Configure the TMU rate and directionality
> >   * @sw: Router whose mode to change
> > -- 
> > 2.17.1

-- 
Thanks,
Gil
---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

