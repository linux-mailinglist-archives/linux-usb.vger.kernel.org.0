Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7F95F6897
	for <lists+linux-usb@lfdr.de>; Thu,  6 Oct 2022 15:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbiJFNy2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Oct 2022 09:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbiJFNx7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Oct 2022 09:53:59 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id D88AE2528E
        for <linux-usb@vger.kernel.org>; Thu,  6 Oct 2022 06:53:58 -0700 (PDT)
Received: (qmail 785392 invoked by uid 1000); 6 Oct 2022 09:53:58 -0400
Date:   Thu, 6 Oct 2022 09:53:58 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Vadym Kochan <vadym.kochan@plvision.eu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Elad Nachman <enachman@marvell.com>,
        Yuval Shaia <yshaia@marvell.com>
Subject: Re: [PATCH] usb: ehci-orion: Extend DMA mask to 64 bit for AC5
 platform
Message-ID: <Yz7d9lSUegHE8qR2@rowland.harvard.edu>
References: <20221006095257.6934-1-vadym.kochan@plvision.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006095257.6934-1-vadym.kochan@plvision.eu>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 06, 2022 at 12:52:57PM +0300, Vadym Kochan wrote:
> From: Elad Nachman <enachman@marvell.com>
> 
> Signed-off-by: Elad Nachman <enachman@marvell.com>
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
>  drivers/usb/host/ehci-orion.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
> index a3454a3ea4e0..c6205abebbdf 100644
> --- a/drivers/usb/host/ehci-orion.c
> +++ b/drivers/usb/host/ehci-orion.c
> @@ -230,7 +230,7 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
>  	 * set. Since shared usb code relies on it, set it here for
>  	 * now. Once we have dma capability bindings this can go away.
>  	 */
> -	err = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	err = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>  	if (err)
>  		goto err;

Apart from the fact that you didn't include a patch description, how 
come the Subject: line says this applies to the AC5 platform when the 
actual code change applies to all platforms?  Do you know that this 
change is safe for all those other platforms?

Alan Stern
