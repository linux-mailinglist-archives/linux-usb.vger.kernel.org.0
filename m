Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE04575B0DC
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jul 2023 16:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbjGTOJK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jul 2023 10:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjGTOJJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jul 2023 10:09:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9285A211F
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 07:09:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 23B6F61AE9
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 14:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B29C433C7;
        Thu, 20 Jul 2023 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689862147;
        bh=uw/un9qd/4chTIiS7KGApbtBbfoxZpnBs1yBg9iDJD4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MTXr0e3wWs18ZP4Fg08XrIY6tJ8MRUVt8f5I5TzPKhwCw2JZAYfNA75mvhYPIEEYC
         Mxf9ut1fVlWWwgzbkX0q/KUGusFJdBjePLwvEN84WXAjd14tUkwlnfDdLp8a7Dkqoc
         CG+9fGXpOYKl0xokfn16H/vg+kBBPUdnTJXizCZTSVL/X/w/yYDJv2zwkXdLANwfca
         Hd7LKJFMUWf4D8894EgHBcJw3E1v9w1+L99wmJDlBYJxm0rFthKVKYtZOTxzfsM1Pf
         T0L2kSZF4eXIprQ8k3R/S0a7UDXIfbk4mQk1j0cuc51UtLEQwjfHIMaFqemDrIpwZv
         3WFfP40zQjhmQ==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan@kernel.org>)
        id 1qMULD-00085A-1E;
        Thu, 20 Jul 2023 16:09:16 +0200
Date:   Thu, 20 Jul 2023 16:09:15 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Martin Kohn <m.kohn@welotec.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] Quectel EM05G LTE Modem with new Product ID
Message-ID: <ZLlACymhpmIx59UX@hovoldconsulting.com>
References: <AM0PR04MB5764E9F944881E5B1FCE63F0973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
 <AM0PR04MB5764EE9ECBEC5B8E00BBD84D973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM0PR04MB5764EE9ECBEC5B8E00BBD84D973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
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
> From 7a19d929aa07b3541f6a1205cb0ce3f0f5dc54a6 Mon Sep 17 00:00:00 2001
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

Your patch is corrupt (e.g. tabs replaced by spaces) and cannot be
applied. It also lacks proper commit summary (Subject) and commit
message.

Take a look at

	https://lore.kernel.org/all/20230710075218.8895-1-moh53n@moh53n.ir/

for a recent example of what this should look like.

Also make sure to send the patch to yourself first and run checkpatch on
it to make sure it's not damaged in transport.

Johan
