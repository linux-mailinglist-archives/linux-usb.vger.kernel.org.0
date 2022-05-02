Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1D5516DC3
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 11:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384415AbiEBJ5K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 05:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384399AbiEBJzb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 05:55:31 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF3B13F1A
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 02:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651485093; x=1683021093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OrR0XnQyjdduN7uSCMQSSGW2lYr3OsH8eVIoFvo6iYQ=;
  b=Wd3z36ehsQPG+GK3/XMimzTgpHGpO8XvVjPIneZInFCZMpfBAFvnQB2O
   8IRPqojfjBfsrcP4pfyW04Bd7rK4B8TzTbcwHXF+ji2Bs/c4bQPVaTyiO
   aIj82YulV7w/ik/pJa3sIvEaCJK8w5T+QtGLqFxxzBp3BEBh2Of8Wu2sV
   BZF22A6y2R3N6EcYlYB8GsfQxnYYGINqSH/XQ1kDvl6etdRxcf7T8ghxV
   6+ee6hdf1woHEEZQbulOYjgSiVrzwvK0AOff8IXxttgn7qoOXrZbAakvJ
   IddRiyyt7cjuu9/FZuMWm7EKt7PUpFXgMKA1FOu7SyPNMFLw66Av5Z0au
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="353598724"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="353598724"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 02:51:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="689969113"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 02:51:25 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 02 May 2022 12:50:57 +0300
Date:   Mon, 2 May 2022 12:50:57 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 1/5] thunderbolt: Silently ignore CLx enabling in case
 CLx is not supported
Message-ID: <Ym+pgfn8GHurkNQ6@lahna>
References: <20220501203321.19021-1-gil.fine@intel.com>
 <20220501203321.19021-2-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501203321.19021-2-gil.fine@intel.com>
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

On Sun, May 01, 2022 at 11:33:17PM +0300, Gil Fine wrote:
> We can't enable CLx if it is not supported either by the host or device,
> or by the USB4/TBT link (e.g. when an optical cable is used).
> We silently ignore CLx enabling in this case.
> 
> Signed-off-by: Gil Fine <gil.fine@intel.com>
> ---
>  drivers/thunderbolt/tb.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 44d04b651a8b..7419cd1aefba 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -581,6 +581,7 @@ static void tb_scan_port(struct tb_port *port)
>  	struct tb_cm *tcm = tb_priv(port->sw->tb);
>  	struct tb_port *upstream_port;
>  	struct tb_switch *sw;
> +	int ret;
>  
>  	if (tb_is_upstream_port(port))
>  		return;
> @@ -669,7 +670,9 @@ static void tb_scan_port(struct tb_port *port)
>  	tb_switch_lane_bonding_enable(sw);
>  	/* Set the link configured */
>  	tb_switch_configure_link(sw);
> -	if (tb_switch_enable_clx(sw, TB_CL0S))
> +	/* Silently ignore CLx enabling in case CLx is not supported */
> +	ret = tb_switch_enable_clx(sw, TB_CL0S);
> +	if (ret && ret != -EOPNOTSUPP)

I think we can debug log this and also:

>  		tb_sw_warn(sw, "failed to enable CLx on upstream port\n");

can we use something like "failed to enable CL%d on upstream port\n" and
pass the CL state there too? I think it is useful to see what what CL
state failed.
