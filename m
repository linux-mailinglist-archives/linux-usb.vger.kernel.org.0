Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19F004BA418
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 16:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242363AbiBQPQW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 10:16:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242355AbiBQPQV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 10:16:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E832AE2B4
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 07:16:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7753061E90
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 15:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A5FC340E8;
        Thu, 17 Feb 2022 15:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1645110964;
        bh=kuK/h04e07dmrdHUytDl1MN/GrKqmcZyFaIdDpQQTdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oE5Yv952iPUJe0pvLzeIRF5VQyH6V7CioC5Tch+fvpyTXSBsm36drGrBl8FOo3rDx
         JJtB0jIjFCYLWVBhtUeY6TWQ9r/500kqPaQZe+rRRWFylWVV4eQ4EukZ0XS2imjL2y
         B34OkFn9m4/HPt2Xw4yvwdVHF88pVe29jVM10H8w=
Date:   Thu, 17 Feb 2022 16:16:02 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 5/9] xhci: dbgtty: use IDR to support several dbc
 instances.
Message-ID: <Yg5msgveDOAaYh5u@kroah.com>
References: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
 <20220216095153.1303105-6-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216095153.1303105-6-mathias.nyman@linux.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 16, 2022 at 11:51:49AM +0200, Mathias Nyman wrote:
> To support systems with several xhci controllers with active
> dbc on each xhci we need to use IDR to identify and give
> an index to each port.
> 
> Avoid using global struct tty_driver.driver_state for storing
> dbc port pointer as it won't work with several dbc ports
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/xhci-dbgcap.h |  1 +
>  drivers/usb/host/xhci-dbgtty.c | 46 ++++++++++++++++++++++++++++------
>  2 files changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
> index 5f3304a06591..ca04192fdab1 100644
> --- a/drivers/usb/host/xhci-dbgcap.h
> +++ b/drivers/usb/host/xhci-dbgcap.h
> @@ -100,6 +100,7 @@ struct dbc_ep {
>  struct dbc_port {
>  	struct tty_port			port;
>  	spinlock_t			port_lock;	/* port access */
> +	int				minor;
>  
>  	struct list_head		read_pool;
>  	struct list_head		read_queue;
> diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
> index 059b58f48e3a..d3acc0829ee5 100644
> --- a/drivers/usb/host/xhci-dbgtty.c
> +++ b/drivers/usb/host/xhci-dbgtty.c
> @@ -10,11 +10,14 @@
>  #include <linux/slab.h>
>  #include <linux/tty.h>
>  #include <linux/tty_flip.h>
> +#include <linux/idr.h>
>  
>  #include "xhci.h"
>  #include "xhci-dbgcap.h"
>  
>  static struct tty_driver *dbc_tty_driver;
> +static struct idr dbc_tty_minors;
> +static DEFINE_MUTEX(dbc_tty_minors_lock);

Why not just use an ida instead?  That way you do not need another lock
and it becomes a tiny bit simpler overall.

I'll take this now, but in the future it might be worth to change this.

thanks,

greg k-h
