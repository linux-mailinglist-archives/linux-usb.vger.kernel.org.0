Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C404D567E50
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jul 2022 08:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiGFG0E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jul 2022 02:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiGFG0D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jul 2022 02:26:03 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E47D421D
        for <linux-usb@vger.kernel.org>; Tue,  5 Jul 2022 23:26:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id EA0F0CE1DC1
        for <linux-usb@vger.kernel.org>; Wed,  6 Jul 2022 06:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBD7C341C0;
        Wed,  6 Jul 2022 06:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1657088758;
        bh=Hv5X/POqw70nE+UpedJ1HzvFyxP3pDgVqOqOS39K0sY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pxHswFpZTK+eQlvSVqajCfpQ5YWyC4A8323hTi+yeRoNSjr4dsG/yw6/EB0fVkWmX
         47XF/0OwgUGdOesCyb+S29l4Kf9jKJ5A96mL8labP4IBXRg4fupJ3r4SfOgYJ7xlmR
         grUCqV7OjlC3bXtAXupFYijyQlb3FmNd5pJXsFc0=
Date:   Wed, 6 Jul 2022 08:25:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, mario.limonciello@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Add DP out resource when DP tunnel is
 discovered.
Message-ID: <YsUq80qWepLR2mZ9@kroah.com>
References: <1657085978-130560-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657085978-130560-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 06, 2022 at 12:39:38AM -0500, Sanjay R Mehta wrote:
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
> index 4602c69..cef2fe3 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1222,6 +1222,7 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port);
>  void usb4_port_device_remove(struct usb4_port *usb4);
>  int usb4_port_device_resume(struct usb4_port *usb4);
>  
> +void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port);

Why not put this in the .h file next to the other tb_* calls?

thanks,

greg k-h
