Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71B35F0ED9
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 17:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbiI3PaQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 11:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbiI3P3w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 11:29:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230834DF3E
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 08:29:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 378FBB8294E
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 15:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9573EC433C1;
        Fri, 30 Sep 2022 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664551786;
        bh=E+y1Q+KEVtUrAHc1b7hJ9c6q9vPE4S+dq06YES5JmNg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RxbDG+Tb9yPwjI5K2o86sP+dxSY9eqLNXbB6eUa/MQL+VCuG1teof+oYD3GXxHkHZ
         FaqOKZmiDs9tegYceyPBHPDAoJhPAsOqThX12v61p+GZHW7+QAaw6lspR36LvVU0l5
         uoqq7w7qVsbYaLlF+xNXk8ujH4+sJq5FwHizurPw=
Date:   Fri, 30 Sep 2022 17:29:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: the patch is meant to support
 LARA-R6 Cat 1 and LARA-L6 CAT 4 module family.
Message-ID: <YzcLaF4uPcbBTjz4@kroah.com>
References: <20220930152344.7877-1-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930152344.7877-1-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 30, 2022 at 05:23:44PM +0200, Davide Tronchin wrote:
> The LARA-R6 module has the following USB identifiers:
> Vendor  ID: 0x05c6
> Product ID: 0x908b
> 
> The USB composition exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parser/alternative functions
> 
> The LARA-L6 module can be configured in three different USB modes: 
> * Default mode (Vendor  ID: 0x1546 Product ID: 0x1341) with 4 serial 
> interfaces
> * RmNet mode (Vendor  ID: 0x1546 Product ID: 0x1342) with 4 serial 
> interfaces and 1 RmNet virtual network interface
> * CDC-ECM mode (Vendor  ID: 0x1546 Product ID: 0x1343) with 4 serial 
> interface and 1 CDC-ECM virtual network interface
> 
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
> Signed-off-by: Davide Tronchin  <davide.tronchin.94@gmail.com>
> ---
>  drivers/usb/serial/option.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 697683e3f..fc0403891 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -240,7 +240,7 @@ static void option_instat_callback(struct urb *urb);
>  #define QUECTEL_PRODUCT_UC15			0x9090
>  /* These u-blox products use Qualcomm's vendor ID */
>  #define UBLOX_PRODUCT_R410M			0x90b2
> -#define UBLOX_PRODUCT_R6XX			0x90fa
> +#define UBLOX_PRODUCT_LARA_R6		0x908b

That is not in sorted order :(

>  /* These Yuga products use Qualcomm's vendor ID */
>  #define YUGA_PRODUCT_CLM920_NC5			0x9625
>  
> @@ -581,6 +581,11 @@ static void option_instat_callback(struct urb *urb);
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
> @@ -1124,8 +1129,14 @@ static const struct usb_device_id option_ids[] = {
>  	/* u-blox products using Qualcomm vendor ID */
>  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
>  	  .driver_info = RSVD(1) | RSVD(3) },
> -	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
> -	  .driver_info = RSVD(3) },

Why did you delete this device from the driver and not mention it at all
in the changelog text?

thanks,

greg k-h
