Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18F9F5897C4
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 08:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbiHDGar (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 02:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiHDGap (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 02:30:45 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDCCCE22
        for <linux-usb@vger.kernel.org>; Wed,  3 Aug 2022 23:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659594644; x=1691130644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x9Bg0HL1eRsejUAzk2xesEUeHtmLjWJuk8uFjAREOxw=;
  b=ST4gbLTI09q0DiEZdzZUiUIV0+EPnX3f+L4MFbogiqMG5arFxpzSRdW4
   nsnOwDulYHEXTUPKnzX5hL4KBF3PdgI9B7XAVSHY/lWqFYs1TwE8cbENj
   I8HfshNddMlgIzKt3fKS9NRpeQ5T+DYgT3W6rB+oy6AHB8ayitQswZ0+l
   8XeVAjkI4CMAiQgBeavl5xEl/aIGmEOPJ32gGH0B3uS5E0e9xngun4tVw
   qGpevwBIL4DryiOmJGjuXp4CqS40ERlYeE3MGwlDCLV2RaBMU47dnGem/
   EyJsNKKDGi+BgiA3VgiYthNVf3ZudZX7SQ2DM0JgxheU6/kbjqeRGUN9z
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="269626085"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="269626085"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 23:30:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="553603622"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 23:30:40 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 04 Aug 2022 09:30:38 +0300
Date:   Thu, 4 Aug 2022 09:30:38 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        mario.limonciello@amd.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] thunderbolt: Add DP out resource when DP tunnel is
 discovered.
Message-ID: <Yutnjq64OO07QbAR@lahna>
References: <1659587394-115256-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1659587394-115256-1-git-send-email-Sanju.Mehta@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 03, 2022 at 11:29:54PM -0500, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> If the boot firmware implements a connection manager of its
> own it may create a DP tunnel and will be handed off to Linux
> CM, but the DP out resource is not saved in the dp_resource
> list.
> 
> This patch adds tunnelled DP out port to the dp_resource list
> once the DP tunnel is discovered.
> 
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> ---
> v3: make tb_dp_resource_available_discovered as static function.

Hmm, I suggested this:

  Please call this tb_discover_dp_resources() make it static and call it
  right after tb_discover_tunnels() in tb_start() or in
  tb_discover_tunnels().      

Anything preventing you to do that? Or you missed my comment?

> v2: Re-ordering the function declaration as per Greg's comment.
> ---
>  drivers/thunderbolt/tb.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 9a3214f..53abce3 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -105,6 +105,21 @@ static void tb_remove_dp_resources(struct tb_switch *sw)
>  	}
>  }
>  
> +static void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port)
> +{
> +	struct tb_cm *tcm = tb_priv(tb);
> +	struct tb_port *p;
> +
> +	list_for_each_entry(p, &tcm->dp_resources, list) {
> +		if (p == port)
> +			return;
> +	}
> +
> +	tb_port_dbg(port, "DP %s resource available discovered\n",
> +		    tb_port_is_dpin(port) ? "IN" : "OUT");
> +	list_add_tail(&port->list, &tcm->dp_resources);
> +}
> +
>  static void tb_switch_discover_tunnels(struct tb_switch *sw,
>  				       struct list_head *list,
>  				       bool alloc_hopids)
> @@ -118,6 +133,7 @@ static void tb_switch_discover_tunnels(struct tb_switch *sw,
>  		switch (port->config.type) {
>  		case TB_TYPE_DP_HDMI_IN:
>  			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids);

Here tunnel can be NULL...

> +			tb_dp_resource_available_discovered(tb, tunnel->dst_port);

... so this will crash and burn.
