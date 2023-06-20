Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBF0736385
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 08:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjFTGV7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 02:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjFTGV6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 02:21:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60834E68
        for <linux-usb@vger.kernel.org>; Mon, 19 Jun 2023 23:21:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F173260E76
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 06:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626ADC433C0;
        Tue, 20 Jun 2023 06:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687242116;
        bh=Qgfy1LqccWFzHNNbqWnmxPwmZjTuVg6Ek8qai+FrSxw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lRID/KtfDzd7m/1MFNEh7VFXTZkuqyTEl4N0L2CXOMZgJolg+TibSoD1Ep1LsZ0ph
         kFfqM11A0q0R9RDuvb+Ax3XOnc/Raa1KyeW/olkinLWFcT1DL9zhSnCMSfWjnjZUNg
         6OhupSPZVlohc9dOZSaXJSdf9Go5bliEa3sQnaf1WHA3rzS8v448NOnxwCxxJ7RJ4F
         Ac7dnm7AxlszdjCu4KZJkTuARH4jYx8egpvWwhqIOSzvBH94zTyXBtGwwiktd09Fzg
         GWVWAejDwHOfaDMcngFgh2rPGpqs0Xj32FQTYx2ET8LixP3ACERT0JdmCCyAt+QNiV
         r2tK+0sRcXaMg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1qBUkW-0006UY-9R; Tue, 20 Jun 2023 08:21:56 +0200
Date:   Tue, 20 Jun 2023 08:21:56 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net
Subject: Re: [PATCH] USB: serial: option: add u-blox LARA-R6 01B modem
Message-ID: <ZJFFhPSo50zG1yYD@hovoldconsulting.com>
References: <20230613141441.35866-1-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613141441.35866-1-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 13, 2023 at 04:14:41PM +0200, Davide Tronchin wrote:
> The new LARA-R6 product variant identified by the "01B" string can be
> configured (by AT interface) in three different USB modes:
> * Default mode (Vendor ID: 0x1546 Product ID: 0x1311) with 4 serial
> interfaces
> * RmNet mode (Vendor ID: 0x1546 Product ID: 0x1312) with 4 serial
> interfaces and 1 RmNet virtual network interface
> * CDC-ECM mode (Vendor ID: 0x1546 Product ID: 0x1313) with 4 serial
> interface and 1 CDC-ECM virtual network interface
> 
> In default mode LARA-R6 01B exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parser/alternative functions
> 
> In RmNet mode LARA-R6 01B exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parser/alternative functions
> If 4: RMNET interface
> 
> In CDC-ECM mode LARA-R6 01B exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parser/alternative functions
> If 4: CDC-ECM interface

Can you please also include the output of usb-devices for these
configurations?

> Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
> 
> ---
>  drivers/usb/serial/option.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 644a55447fd7..5b684b6f5969 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1152,6 +1152,11 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = RSVD(4) },
>  	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1343),		/* u-blox LARA-L6 (ECM) */
>  	  .driver_info = RSVD(4) },
> +	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1311) },	/* u-blox LARA-R6 01B */
> +	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1312),		/* u-blox LARA-R6 01B (RMNET) */
> +	  .driver_info = RSVD(4) },
> +	{ USB_DEVICE(UBLOX_VENDOR_ID, 0x1313),		/* u-blox LARA-R6 01B (ECM) */
> +	  .driver_info = RSVD(4) },

These should all go above the 0x1341 PID.

I see that we used RSVD() also for the CDC interface for LARA-L6, but
shouldn't it be possible to use a more exact match instead? The
usb-devices output should tell.

>  	/* Quectel products using Quectel vendor ID */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
>  	  .driver_info = NUMEP2 },

Johan
