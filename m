Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8C7519D7F
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 13:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348436AbiEDLDk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 07:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234082AbiEDLDj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 07:03:39 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA2A23BE7
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 04:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651662004; x=1683198004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VKXboVSP9nSq/IBfmOqTNeTOmwsNHvS3XSA2O2iPV0w=;
  b=kOoubQNVWqp78mveRdqVFFniqpPXdcw2d7s9VGQvc0vPOff46E4oFZLI
   mrtMYVM0+soPNDpdTN4gl7IKXNhqEkQVZLreze17lyXpk/aZ6l4bPtI4M
   r3Vg+C5eP0loMYGgCARioNsrAZli+ZVbIGwpR3Nwp+ihTtUzzFfuB625e
   vFNd5VWozDFML641Lh3ZaJze2Bmryq7nK2Pw8T1Jxfr56112k/+ltF0OU
   Agha+NhwCSXkeAsIgHnK2Be+VkT9pWJs8xGO/wzdWQJRLemMYORYwF3ef
   QwTS5Gd41rQCghABfiw/32o8EqH4tBChdw+QBDbfw+fkZhxLzFUuPAwE+
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267612684"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="267612684"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 04:00:03 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="708426385"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 04:00:00 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 04 May 2022 13:59:58 +0300
Date:   Wed, 4 May 2022 13:59:58 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 1/5] thunderbolt: Silently ignore CLx enabling in case
 CLx is not supported
Message-ID: <YnJcrjiWODNK4mPO@lahna>
References: <20220501203321.19021-1-gil.fine@intel.com>
 <20220501203321.19021-2-gil.fine@intel.com>
 <Ym+pgfn8GHurkNQ6@lahna>
 <20220504105127.GA19479@ccdjLinux26>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504105127.GA19479@ccdjLinux26>
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

On Wed, May 04, 2022 at 01:51:27PM +0300, Gil Fine wrote:
> Hi Mika,
> 
> On Mon, May 02, 2022 at 12:50:57PM +0300, Mika Westerberg wrote:
> > Hi Gil,
> > 
> > On Sun, May 01, 2022 at 11:33:17PM +0300, Gil Fine wrote:
> > > We can't enable CLx if it is not supported either by the host or device,
> > > or by the USB4/TBT link (e.g. when an optical cable is used).
> > > We silently ignore CLx enabling in this case.
> > > 
> > > Signed-off-by: Gil Fine <gil.fine@intel.com>
> > > ---
> > >  drivers/thunderbolt/tb.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > > index 44d04b651a8b..7419cd1aefba 100644
> > > --- a/drivers/thunderbolt/tb.c
> > > +++ b/drivers/thunderbolt/tb.c
> > > @@ -581,6 +581,7 @@ static void tb_scan_port(struct tb_port *port)
> > >  	struct tb_cm *tcm = tb_priv(port->sw->tb);
> > >  	struct tb_port *upstream_port;
> > >  	struct tb_switch *sw;
> > > +	int ret;
> > >  
> > >  	if (tb_is_upstream_port(port))
> > >  		return;
> > > @@ -669,7 +670,9 @@ static void tb_scan_port(struct tb_port *port)
> > >  	tb_switch_lane_bonding_enable(sw);
> > >  	/* Set the link configured */
> > >  	tb_switch_configure_link(sw);
> > > -	if (tb_switch_enable_clx(sw, TB_CL0S))
> > > +	/* Silently ignore CLx enabling in case CLx is not supported */
> > > +	ret = tb_switch_enable_clx(sw, TB_CL0S);
> > > +	if (ret && ret != -EOPNOTSUPP)
> > 
> > I think we can debug log this and also:
> > 
> > >  		tb_sw_warn(sw, "failed to enable CLx on upstream port\n");
> > 
> > can we use something like "failed to enable CL%d on upstream port\n" and
> > pass the CL state there too? I think it is useful to see what what CL
> > state failed.
> Not sure is necessary because:
> for CL0s/CL1 from SW (Driver) perspective, they are actually enabled and supported together.
> I mean from HW/FW perspective, entry to CL1 e.g. can be objected and only
> allow entry to CL0s. But SW behaviour is similar for both.
> I mean, that if SW CM fails to enable CL1, it will also fail enabling CL0s and
> vice-versa.

OK

> So, it may be relevant if some-day we add CL2 support (which probably will not
> happen, because the introduce of the adaptive mode in USB4 v2)
> I am thinking to merge both of them to be one ENUM and to name it someting like
> "TB_CL0s_CL1":
> enum tb_clx {
> »·······TB_CLX_DISABLE,
> »·······TB_CL0s_CL1,
> »·······TB_CL2,
> }
> And then do this:
> ret = tb_switch_enable_clx(sw, TB_CL0s_CL1);
> if (ret && ret != -EOPNOTSUPP)
> 	tb_sw_warn(sw, "failed to enable %s on upstream port\n", tb_switch_clx_name(TB_CL0S_CL1));
> What do you think?

If they are always enabled together then sure but I suggest we call the
state then TB_CL1 and that includes both states (we can add comment if
needed, probably not if that's clear from the USB4 spec).
