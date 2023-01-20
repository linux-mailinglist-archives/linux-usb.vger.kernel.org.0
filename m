Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5CB675A16
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 17:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjATQgX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 11:36:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbjATQgX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 11:36:23 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 4C13A71BFD
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 08:35:55 -0800 (PST)
Received: (qmail 38882 invoked by uid 1000); 20 Jan 2023 11:34:43 -0500
Date:   Fri, 20 Jan 2023 11:34:43 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ramneek Mehresh <ramneek.mehresh@freescale.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: host: ehci-fsl: Fix module alias
Message-ID: <Y8rCo8ggvjy3ScdV@rowland.harvard.edu>
References: <20230120122714.3848784-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120122714.3848784-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 20, 2023 at 01:27:14PM +0100, Alexander Stein wrote:
> Commit ca07e1c1e4a6 ("drivers:usb:fsl:Make fsl ehci drv an independent
> driver module") changed DRV_NAME which was used for MODULE_ALIAS as well.
> Starting from this the module alias didn't match the platform device
> name created in fsl-mph-dr-of.c
> Change DRV_NAME to match the driver name for host mode in fsl-mph-dr-of.
> This is needed for module autoloading on ls1021a.
> 
> Fixes: ca07e1c1e4a6 ("drivers:usb:fsl:Make fsl ehci drv an independent driver module")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Does this need to go in a -stable kernel?

>  drivers/usb/host/ehci-fsl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
> index 3d21946e8822a..92ec655fd09b6 100644
> --- a/drivers/usb/host/ehci-fsl.c
> +++ b/drivers/usb/host/ehci-fsl.c
> @@ -29,7 +29,7 @@
>  #include "ehci-fsl.h"
>  
>  #define DRIVER_DESC "Freescale EHCI Host controller driver"
> -#define DRV_NAME "ehci-fsl"
> +#define DRV_NAME "fsl-ehci"
>  
>  static struct hc_driver __read_mostly fsl_ehci_hc_driver;
>  
> -- 
> 2.34.1
> 
