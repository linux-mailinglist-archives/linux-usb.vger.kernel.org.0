Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630DF67807F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jan 2023 16:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbjAWPvB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 10:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232680AbjAWPvA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 10:51:00 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 95D6118B3B
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 07:50:57 -0800 (PST)
Received: (qmail 130158 invoked by uid 1000); 23 Jan 2023 10:50:56 -0500
Date:   Mon, 23 Jan 2023 10:50:56 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ramneek Mehresh <ramneek.mehresh@freescale.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: host: ehci-fsl: Use DRV_NAME
Message-ID: <Y86s4P588uwPAlC6@rowland.harvard.edu>
References: <20230123100007.1479090-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123100007.1479090-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 23, 2023 at 11:00:07AM +0100, Alexander Stein wrote:
> "fsl-ehci" is used for both MODULE_ALIAS and driver name. As they have to
> match use DRV_NAME in both locations.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-fsl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
> index 38d06e5abfbb3..d74fa5ba845b8 100644
> --- a/drivers/usb/host/ehci-fsl.c
> +++ b/drivers/usb/host/ehci-fsl.c
> @@ -712,7 +712,7 @@ static struct platform_driver ehci_fsl_driver = {
>  	.remove = fsl_ehci_drv_remove,
>  	.shutdown = usb_hcd_platform_shutdown,
>  	.driver = {
> -		.name = "fsl-ehci",
> +		.name = DRV_NAME,
>  		.pm = EHCI_FSL_PM_OPS,
>  	},
>  };
> -- 
> 2.34.1
> 
