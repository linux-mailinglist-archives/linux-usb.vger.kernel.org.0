Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715C060FA2C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 16:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235796AbiJ0OLu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 10:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234172AbiJ0OLs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 10:11:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01251186D78
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 07:11:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A68C8B82659
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 14:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F891C433D6;
        Thu, 27 Oct 2022 14:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666879905;
        bh=4bS0a8Cypybr9NgwtBHZh4hwUYX5OzOl+6OFQAA0DV8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kjzMhZnQV9zjsNDJs9zER/y+tLmuMjVNzdjdE5bOubV7/D1llzub/FNAkR5+m9ZmN
         uhMOFkem9VFjJQ0i0/W53KfafNOkDKCP9pDSHg1nigicFnx+XxMGOAa5ANPLiyKthS
         ms8Z5sabXsu6kkruDWWkqfAMa/xwhDm+GAkKBcAIGkLCsYw/DLaWl6SRRZo+9fK/Ud
         KYruByz7cPe1/2/hJiCfOYr8xY52hD3tdn+u0qLBXyeA5GWSzHD7cogUY+3CBtzo5h
         GVb0Kh8i0viTAtRazH4P9kVk/CSjRdMflRk6JoxS40vDEMjiHhLqQhqJhvMKMe5v3N
         HZZtKs3wyMwuw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oo3bW-0000GZ-8S; Thu, 27 Oct 2022 16:11:30 +0200
Date:   Thu, 27 Oct 2022 16:11:30 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        larsm17@gmail.com, marco.demarco@posteo.net
Subject: Re: [PATCH v3] USB: serial: option: the patch is meant to support
 LARA-R6 Cat 1 and LARA-L6 CAT 4 module family.
Message-ID: <Y1qRkuOghwRCGZIT@hovoldconsulting.com>
References: <20221012092752.6033-1-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221012092752.6033-1-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 12, 2022 at 11:27:52AM +0200, Davide Tronchin wrote:

First, please use a more concise subject for the patch, for example:

	USB: serial: option: add support for u-blox LARA-R6 and LARA-L6

> The LARA-R6 module old PID (defined as: UBLOX_PRODUCT_R6XX
> 0x90fa) has been removed since is not used anymore by the u-blox 
> LARA-R6 modules. 

This was added just the other year. Please explain better why this
should be removed. Are you sure there are no devices out there using the
original VID/PID? Do you work for u-blox?

> The new LARA-R6 (00B) definition uses 0x908b PID
> and the reservation of port 3 is not needed anymore.
> LARA-R6 00B does not implement a QMI interface on port 4,
> the reservation (RSVD(4)) has been added to meet other
> companies that implement QMI on that interface.
> 
> LARA-R6 00B USB composition exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parser/alternative functions
> 
> LARA-L6 module can be configured in three different USB modes:
> * Default mode (Vendor  ID: 0x1546 Product ID: 0x1341) with 4 serial
> interfaces
> * RmNet mode (Vendor  ID: 0x1546 Product ID: 0x1342) with 4 serial
> interfaces and 1 RmNet virtual network interface
> * CDC-ECM mode (Vendor  ID: 0x1546 Product ID: 0x1343) with 4 serial
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

As you are doing three different things here, please split this in three
separate patches (e.g. so that the removal can be rejected or reverted
independently of the new additions).

> Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
> ---
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
> 
>  drivers/usb/serial/option.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 697683e3f..07915e661 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -240,7 +240,6 @@ static void option_instat_callback(struct urb *urb);
>  #define QUECTEL_PRODUCT_UC15			0x9090
>  /* These u-blox products use Qualcomm's vendor ID */
>  #define UBLOX_PRODUCT_R410M			0x90b2
> -#define UBLOX_PRODUCT_R6XX			0x90fa
>  /* These Yuga products use Qualcomm's vendor ID */
>  #define YUGA_PRODUCT_CLM920_NC5			0x9625
>  
> @@ -581,6 +580,11 @@ static void option_instat_callback(struct urb *urb);
>  #define OPPO_VENDOR_ID				0x22d9
>  #define OPPO_PRODUCT_R11			0x276c
>  
> +/* These u-blox products use u-blox's vendor ID */
> +#define UBLOX_VENDOR_ID				0x1546
> +#define UBLOX_PRODUCT_LARA_L6			0x1341
> +#define UBLOX_PRODUCT_LARA_L6_RMNET		0x1342
> +#define UBLOX_PRODUCT_LARA_L6_ECM		0x1343
>  
>  /* Device flags */
>  
> @@ -1124,8 +1128,15 @@ static const struct usb_device_id option_ids[] = {
>  	/* u-blox products using Qualcomm vendor ID */
>  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
>  	  .driver_info = RSVD(1) | RSVD(3) },
> -	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
> -	  .driver_info = RSVD(3) },
> +	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x908b), /* u-blox LARA-R6 00B*/

Nit: missing space before */

> +	  .driver_info = RSVD(4) },
> +	/* u-blox products using u-blox vendor ID */
> +	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6),
> +	  .driver_info = RSVD(4) },
> +	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6_RMNET),
> +	  .driver_info = RSVD(4) },
> +	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6_ECM),
> +	  .driver_info = RSVD(4) },
>  	/* Quectel products using Quectel vendor ID */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
>  	  .driver_info = NUMEP2 },

Johan
