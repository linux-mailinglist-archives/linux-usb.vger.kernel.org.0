Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B3A62959B
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 11:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiKOKSu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 05:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiKOKSu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 05:18:50 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A798D2F2
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 02:18:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D25D961407
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 10:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38892C433C1;
        Tue, 15 Nov 2022 10:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668507528;
        bh=nWUokod0CV82BGnIBgTvzKjlOu+is+Td+7Of6hz1xOc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m63RpyTc3UaAgX0SL+1H4k2TsYSPVtpWbr7AbRFmBT3o1QsCEN809FwwJHQPzvMfw
         dApT1irb3DpLeRaVu8FlrCeRy58cpwvlGVciylyl9x6WAU+nfQVds3388TOV3zPxLO
         I9QlCnyehzFZtd2KP4UIt+OvX6yfdmiR1aayp3YRIXOYTCslDYNE00BCrUT/J6k6IE
         W2VFCFYCOhPEeAguUVnUYKUDcJwtqssMbObC/Kd+DUMvlcgvk46lBsxEKvNvhsdy2U
         FrVURPHDU/VsBsPchz1aNO1H/mnbZ046rO7QDzdlkDioxiEP4wgsCUajNELBNhPZ/R
         ANgLxxRW+UvPA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1out1E-00060x-VG; Tue, 15 Nov 2022 11:18:17 +0100
Date:   Tue, 15 Nov 2022 11:18:16 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        larsm17@gmail.com, marco.demarco@posteo.net,
        cesare.marzano@gmail.com
Subject: Re: [PATCH v4 3/3] USB: serial: option: add u-blox LARA-L6 modem
Message-ID: <Y3NnaMkDraj5fwvu@hovoldconsulting.com>
References: <Y1qRkuOghwRCGZIT@hovoldconsulting.com>
 <20221108163001.18454-1-davide.tronchin.94@gmail.com>
 <20221108163001.18454-3-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108163001.18454-3-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 08, 2022 at 05:30:01PM +0100, Davide Tronchin wrote:
> Add LARA-L6 PIDs for three different USB compositions.
> 
> LARA-L6 module can be configured (by AT interface) in three different
> USB modes:
> * Default mode (Vendor ID: 0x1546 Product ID: 0x1341) with 4 serial
> interfaces
> * RmNet mode (Vendor ID: 0x1546 Product ID: 0x1342) with 4 serial
> interfaces and 1 RmNet virtual network interface
> * CDC-ECM mode (Vendor ID: 0x1546 Product ID: 0x1343) with 4 serial
> interface and 1 CDC-ECM virtual network interface
> 
> In default mode LARA-L6 exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parser/alternative functions
> 
> In RmNet mode LARA-L6 exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parset/alternative functions
> If 4: RMNET interface
> 
> In CDC-ECM mode LARA-L6 exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parset/alternative functions
> If 4: CDC-ECM interface
> 
> Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
> ---
> 
> V3 -> V4: as requested, the patch has been split to 3 sub-patches.
> Fix comment format.
> 
> V2 -> V3: added this section to tracking changes with previous versions.
> Added some explanations about the RSVD(4) in the description session.
> Added reservation to port 4 of VID:PID 0x05C6:0x908B to meet other
> companies QMI net interface implementation.
> 
> V1 -> V2: define UBLOX_PRODUCT_LARA_R6 0x908b has been deleted together
> with the previosly provided definition of USB_DEVICE since the PID
> is used by another vendor.
> The LARA-L6 patch part is the same of the previosly provided one.
  
> @@ -1125,6 +1130,13 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = RSVD(1) | RSVD(3) },
>  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x908b), /* u-blox LARA-R6 00B */
>  	  .driver_info = RSVD(4) },
> +	/* u-blox products using u-blox vendor ID */
> +	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6),
> +	  .driver_info = RSVD(4) },

Why are you reserving interface 4 here? This should be removed or
explained in the commit message.

> +	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6_RMNET),
> +	  .driver_info = RSVD(4) },
> +	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6_ECM),
> +	  .driver_info = RSVD(4) },
>  	/* Quectel products using Quectel vendor ID */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
>  	  .driver_info = NUMEP2 },

Johan
