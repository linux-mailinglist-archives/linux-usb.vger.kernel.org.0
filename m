Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8205FB4B0
	for <lists+linux-usb@lfdr.de>; Tue, 11 Oct 2022 16:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbiJKOil (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Oct 2022 10:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiJKOij (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Oct 2022 10:38:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5144B982
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 07:38:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7A59EB8124E
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 14:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE4DC433D6;
        Tue, 11 Oct 2022 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1665499116;
        bh=C8h27T6sGfEi20M1MPk2enBBL0+kvWogzhfKEVjoMZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pU+Q4BMR/w57F58q+ur0Je5lWkNypWL6CXL+bNQ8K9MkuRsYk4WzNnYJ9DjbanAPi
         6q20+YhuhhHLyL+9GODdfZqIDUpQ6edDOMsfTw6kvyI4/mFQrbA0ASpNzbqPOhCMkx
         dI5A8RVxKYGsr1uG08p9cEltGaQhjEPLRxT3z2F4=
Date:   Tue, 11 Oct 2022 16:39:19 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: option: the patch is meant to support
 LARA-R6 Cat 1 and LARA-L6 CAT 4 module family.
Message-ID: <Y0WAF/UiPBsCa17q@kroah.com>
References: <20221011142008.3654-1-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011142008.3654-1-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 11, 2022 at 04:20:08PM +0200, Davide Tronchin wrote:
> The LARA-R6 module old PID (defined as: UBLOX_PRODUCT_R6XX
> 0x90fa) has been removed. The new LARA-R6 (00B) definition uses 0x908b PID
> and the reservation of port 3 is not needed anymore.
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
> 
> Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
> ---
>  drivers/usb/serial/option.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 697683e3f..018f924b0 100644
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
> @@ -1124,8 +1128,14 @@ static const struct usb_device_id option_ids[] = {
>  	/* u-blox products using Qualcomm vendor ID */
>  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
>  	  .driver_info = RSVD(1) | RSVD(3) },
> -	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
> -	  .driver_info = RSVD(3) },
> +	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x908b) }, /* u-blox LARA-R6 00B*/
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
> -- 
> 2.34.1
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
