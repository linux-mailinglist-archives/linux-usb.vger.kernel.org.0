Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B99D751ED7C
	for <lists+linux-usb@lfdr.de>; Sun,  8 May 2022 14:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232982AbiEHMiW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 May 2022 08:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbiEHMiV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 May 2022 08:38:21 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27DBDEFB
        for <linux-usb@vger.kernel.org>; Sun,  8 May 2022 05:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652013269; x=1683549269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5wCMaVf0NtCR5PsK1BS+EQPS6mjR5Ajl0laFQSD9Vxc=;
  b=Q4HrmAsDOiSMbJP50lUOh735uabNBaGtujslBiscaATwOFp2CsPgKcpZ
   1rHywNYQkMZhIfn16Qkrf2FXg1UuYF9RTIJClA1Uv/9fC9K3+j9A7ho3t
   n2y96MYTMSLtYbcO2LQcDS10TkL/XGs3JjqYbNt1uiJhP00SA3TQBSnto
   Duwpn7QNiSTh9lX9TzD97lEKR1JMn5mDCEyzw/sCTbGPE6w+63GAtfjyU
   kxC3SofcQEZIvKeDFYJ9nQR5nlchGKf5Wz3WeioPXDwSdhbrnisX5BsCP
   RzaNFwzvGHmZT38Itc2lFRIuRAmiJKz5eNKVdNX5lX+Pq5Xci65q9gLLW
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10340"; a="268473392"
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="268473392"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2022 05:34:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="518771683"
Received: from ccdjpclinux26.jer.intel.com (HELO localhost) ([10.12.48.253])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2022 05:34:27 -0700
Date:   Sun, 8 May 2022 15:44:04 +0300
From:   Gil Fine <gil.fine@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Gil Fine <gil.fine@intel.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 5/5] thunderbolt: Change TMU mode to Hifi-Uni once DP
 tunneled
Message-ID: <20220508124404.GD19479@ccdjLinux26>
References: <20220501203321.19021-1-gil.fine@intel.com>
 <20220501203321.19021-6-gil.fine@intel.com>
 <Ym+t5cI1Qho7B+Sd@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ym+t5cI1Qho7B+Sd@lahna>
Organization: Intel Israel Jerusalem (IDPj /IDCj) Har Hotzvim, HaMarpe Street
 9, Zip code 9777409
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,

On Mon, May 02, 2022 at 01:09:41PM +0300, Mika Westerberg wrote:
> On Sun, May 01, 2022 at 11:33:21PM +0300, Gil Fine wrote:
> > Here we configure TMU mode to Hifi-Uni once DP tunnel is created.
> 
> DisplayPort (at least use that in the $subject).
> 
> > This is due to accuracy requirement for DP tunneling as appears in
> > CM guide 1.0, section 7.3.2
> > Due to Intel HW limitation, once we changed the TMU mode to Hifi-Uni
> 
> HW -> hardware
> 
> HiFi uni-directional
> 
> > (when DP is tunnel exists), we don't change TMU mode back to Normal-Uni,
> 
> normal un-idirectional
> 
> > even if DP tunnel is teared-down later.
> 
> torn down

I will fix in v2 patch.

> 
> > 
> > Signed-off-by: Gil Fine <gil.fine@intel.com>
> > ---
> >  drivers/thunderbolt/tb.c | 40 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> > 
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index 05a084e3e9f6..efe53d221ca8 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -50,6 +50,8 @@ struct tb_hotplug_event {
> >  };
> >  
> >  static void tb_handle_hotplug(struct work_struct *work);
> > +static int tb_enable_tmu_1st_child(struct tb *tb,
> > +				   enum tb_switch_tmu_rate rate);
> >  
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
> > @@ -235,6 +244,31 @@ static int tb_enable_tmu(struct tb_switch *sw)
> >  	return tb_switch_tmu_enable(sw);
> >  }
> >  
> > +/*
> > + * Once a DP tunnel exists in the domain, we set the TMU mode so that
> > + * it meets the accuracy requirements and also enables CLx entry (CL0s).
> > + * We set the TMU mode of the first depth router(s) for CL0s to work.
> > + */
> > +static int tb_enable_tmu_1st_child(struct tb *tb, enum tb_switch_tmu_rate rate)
> > +{
> > +	struct tb_switch *root_sw = tb->root_switch;
> > +	struct tb_port *port;
> > +
> > +	tb_switch_for_each_port(root_sw, port) {
> 
> Can't you use device_for_each_child() here?

Yes sure,I wasn't aware of it, will do in v2 patch.

> 
> > +		struct tb_switch *sw;
> > +		int ret;
> > +
> > +		if (!tb_port_has_remote(port) || !tb_port_is_null(port))
> > +			continue;
> > +		sw = port->remote->sw;
> > +		tb_switch_tmu_configure(sw, rate, tb_switch_is_clx_enabled(sw));
> > +		if (tb_switch_tmu_enable(sw))
> > +			tb_dbg(tb, "Fail switching TMU to HiFi for 1st depth router %d\n", ret);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * tb_find_unused_port() - return the first inactive port on @sw
> >   * @sw: Switch to find the port on
> > @@ -981,6 +1015,12 @@ static void tb_tunnel_dp(struct tb *tb)
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

