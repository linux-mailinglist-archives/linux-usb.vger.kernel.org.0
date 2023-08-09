Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8085776218
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 16:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbjHIOLI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Aug 2023 10:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbjHIOLH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Aug 2023 10:11:07 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id AE5111FC2
        for <linux-usb@vger.kernel.org>; Wed,  9 Aug 2023 07:11:06 -0700 (PDT)
Received: (qmail 197592 invoked by uid 1000); 9 Aug 2023 10:11:05 -0400
Date:   Wed, 9 Aug 2023 10:11:05 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH -next] USB: ohci-sm501: remove unnecessary check of mem
Message-ID: <82b7b6b6-4be4-4c47-8a36-cd09be3aa973@rowland.harvard.edu>
References: <20230809085348.2761782-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809085348.2761782-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 09, 2023 at 04:53:48PM +0800, Yang Yingliang wrote:
> The resource is checked in probe function, so there is
> no need do this check in remove function.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/usb/host/ohci-sm501.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-sm501.c b/drivers/usb/host/ohci-sm501.c
> index 0468eeb4fcfd..4b39e9d6f33a 100644
> --- a/drivers/usb/host/ohci-sm501.c
> +++ b/drivers/usb/host/ohci-sm501.c
> @@ -195,8 +195,7 @@ static void ohci_hcd_sm501_drv_remove(struct platform_device *pdev)
>  	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
>  	usb_put_hcd(hcd);
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	if (mem)
> -		release_mem_region(mem->start, resource_size(mem));
> +	release_mem_region(mem->start, resource_size(mem));
>  
>  	/* mask interrupts and disable power */

Acked-by: Alan Stern <stern@rowland.harvard.edu>
