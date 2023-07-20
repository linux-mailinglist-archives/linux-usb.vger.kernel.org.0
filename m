Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B257275B031
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jul 2023 15:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjGTNia (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jul 2023 09:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjGTNi3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jul 2023 09:38:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6691986
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 06:38:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 402BF61AEA
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 13:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E40C433C7;
        Thu, 20 Jul 2023 13:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689860307;
        bh=g9EsUvh+orK2v7Cx5OoXSs0mRmwK7x2nHVRGYYFy3KQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v9SX9szgvCRudIZuCFEDAYl0KAsak13ueLE7dLzwJOg6GhEksVazBOdKnfKiLq0b6
         nV+mdC+jCMXrQwSDuDu20RX64CSO2GgC1UqVgipapo1hyCPRLjVsG+93G/1cjGWfIA
         K38Evka7Qu7/aWXrFvV9Xcm9LDaBbZ9a2RDp16vY=
Date:   Thu, 20 Jul 2023 15:38:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Martin Kohn <m.kohn@welotec.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] Quectel EM05G LTE Modem with new Product ID
Message-ID: <2023072049-unclog-savanna-5571@gregkh>
References: <AM0PR04MB5764E9F944881E5B1FCE63F0973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
 <AM0PR04MB5764EE9ECBEC5B8E00BBD84D973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM0PR04MB5764EE9ECBEC5B8E00BBD84D973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 20, 2023 at 12:30:53PM +0000, Martin Kohn wrote:
> Hello everyone,
> 
> Quectel has changed the product ID for EM05G LTE Modem (global variant), here my verified patch for it:
> 
> >From 7a19d929aa07b3541f6a1205cb0ce3f0f5dc54a6 Mon Sep 17 00:00:00 2001
> From: Martin Kohn mailto:m.kohn@welotec.com
> Date: Wed, 19 Jul 2023 12:04:21 +0200
> Subject: [PATCH] Quectel has changed the Product ID from 030a to 030e for the
> EM05G modem. Both versions must be supported in the future.
> 
> Signed-off-by: Martin Kohn mailto:m.kohn@welotec.com
> ---
> drivers/usb/serial/option.c | 3 +++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 288a96a74266..64b1995b410d 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -256,6 +256,7 @@ static void option_instat_callback(struct urb *urb);
> #define QUECTEL_PRODUCT_BG96                                         0x0296
> #define QUECTEL_PRODUCT_EP06                                         0x0306
> #define QUECTEL_PRODUCT_EM05G                                    0x030a
> +#define QUECTEL_PRODUCT_EM05GV2                              0x030e
> #define QUECTEL_PRODUCT_EM060K                                   0x030b
> #define QUECTEL_PRODUCT_EM05G_CS                             0x030c
> #define QUECTEL_PRODUCT_EM05CN_SG                          0x0310
> @@ -1186,6 +1187,8 @@ static const struct usb_device_id option_ids[] = {
>                  .driver_info = RSVD(6) | ZLP },
>                { USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G, 0xff),
>                  .driver_info = RSVD(6) | ZLP },
> +        { USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05GV2, 0xff),
> +          .driver_info = RSVD(6) | ZLP },
>                { USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_CS, 0xff),
>                  .driver_info = RSVD(6) | ZLP },
>                { USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_GR, 0xff),
> -- 
> 2.25.1
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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
