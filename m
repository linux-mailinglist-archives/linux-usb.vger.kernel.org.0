Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC49056A1E3
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 14:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235209AbiGGMYo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 08:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234925AbiGGMYo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 08:24:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BA5112B
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 05:24:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CBA736232C
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 12:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63FFC3411E;
        Thu,  7 Jul 2022 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1657196682;
        bh=UChBfxo5DimUFHclAEHLiuPV6J/K84Oo2HFYyd6knIY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PuEMwDJeaguxXgNasivzh70wCG0LczQOYh8ZT2kmvpLSfB85T81tVmXp8pdeZXU2f
         P2WQmrBFsacecoDQOktpVnyasTpHH9n3akiDGxe63ySi32wiHrX/rOH3j2KiTVMNza
         ieCSeqoRaIph6F9uuR+CFbQzJSlmgCAcWjy20gjs=
Date:   Thu, 7 Jul 2022 14:24:39 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, mario.limonciello@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Add DP out resource when DP tunnel is
 discovered.
Message-ID: <YsbQhzuqRBBl8X0v@kroah.com>
References: <1657193190-5708-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657193190-5708-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 07, 2022 at 06:26:30AM -0500, Sanjay R Mehta wrote:
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
> ---
>  drivers/thunderbolt/tb.c     | 15 +++++++++++++++
>  drivers/thunderbolt/tb.h     |  1 +
>  drivers/thunderbolt/tunnel.c |  2 ++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 9a3214f..dcd0c3e 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -1006,6 +1006,21 @@ static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
>  	tb_tunnel_dp(tb);
>  }
>  
> +void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port)
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
>  static void tb_dp_resource_available(struct tb *tb, struct tb_port *port)
>  {
>  	struct tb_cm *tcm = tb_priv(tb);
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 4602c69..a841844 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1051,6 +1051,7 @@ int tb_dp_port_set_hops(struct tb_port *port, unsigned int video,
>  			unsigned int aux_tx, unsigned int aux_rx);
>  bool tb_dp_port_is_enabled(struct tb_port *port);
>  int tb_dp_port_enable(struct tb_port *port, bool enable);
> +void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port);
>  
>  struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
>  				 struct tb_port *dst, int dst_hopid,
> diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
> index 2c3cf7f..1394ae9 100644
> --- a/drivers/thunderbolt/tunnel.c
> +++ b/drivers/thunderbolt/tunnel.c
> @@ -845,6 +845,8 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
>  		goto err_deactivate;
>  	}
>  
> +	tb_dp_resource_available_discovered(tb, tunnel->dst_port);
> +
>  	tb_tunnel_dbg(tunnel, "discovered\n");
>  	return tunnel;
>  
> -- 
> 2.7.4
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
