Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4DA71FD58
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 11:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbjFBJNi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 05:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235122AbjFBJM4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 05:12:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A76E5E
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 02:12:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F87B60FAB
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 09:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C29C433D2;
        Fri,  2 Jun 2023 09:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685697129;
        bh=tSF+4CoW1JQ+9QJovGm/fZx8kxUyon8MdeokvOJlz4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tlUihbvVbzPqz8wI4f6XkXwmFlX8syMnxpWHdwXS84Bbkij1xpU14QcJcsDyqVp1D
         ZAgtntWwN6mEjanWuVm+iVsqnCvar4l+i6CIaM1yBIliwqcITAGSeN/Loc7Z0mRHkD
         amWWqnMnHI/1sfvBA2cOKctLbNHg/xyqdBBQjbndgdJ8tUrvugBD7VQaU1aLpI0s2w
         intu5mgPGpOPGtS/al+0D4cZW1Yu4jIqlKNdFGMAcQtYCAtH6ioZEPa0rAyt0fLezi
         8TWTd/aPUFbBManUFV6BeUQne5TpP4o9z/HF9DVMDfGqKjr5X/eJYtewI1YqMdZe9S
         7DQ21xwdJAoRw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1q50pW-0006Nc-7s; Fri, 02 Jun 2023 11:12:18 +0200
Date:   Fri, 2 Jun 2023 11:12:18 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jerry Meng <jerry-meng@foxmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: option: add Quectel EM061KGL series
Message-ID: <ZHmycsoGxSjRICg4@hovoldconsulting.com>
References: <tencent_935361841584807CBAF9961AD0C83F2AC108@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_935361841584807CBAF9961AD0C83F2AC108@qq.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 31, 2023 at 11:51:16AM +0800, Jerry Meng wrote:
> add support for Quectel EM061KGL series which are based on Qualcomm SDX12 chip
> 
> EM061KGL_LTA(0x2c7c / 0x0123): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
> EM061KGL_LMS(0x2c7c / 0x0124): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
> EM061KGL_LWW(0x2c7c / 0x6008): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
> EM061KGL_LCN(0x2c7c / 0x6009): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
> 
> Above products use the exact same interface layout and
> option driver is for interfaces DIAG, NMEA and AT.

Thanks for clarifying that they all use the same layout.

> Signed-off-by: Jerry Meng <jerry-meng@foxmail.com>
> ---

Next time, try to remember to put a short changelog here after the '---'
line when sending a new revision.

>  drivers/usb/serial/option.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 644a55447fd7..23d7b202590d 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
 
> @@ -1189,6 +1193,18 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K, 0xff, 0x00, 0x40) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K, 0xff, 0xff, 0x30) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K, 0xff, 0xff, 0x40) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LWW, 0xff, 0xff, 0x30) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LWW, 0xff, 0x00, 0x40) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LWW, 0xff, 0xff, 0x40) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0xff, 0x30) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0x00, 0x40) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0xff, 0x40) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LTA, 0xff, 0xff, 0x30) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LTA, 0xff, 0x00, 0x40) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LTA, 0xff, 0xff, 0x40) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LMS, 0xff, 0xff, 0x30) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LMS, 0xff, 0x00, 0x40) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LMS, 0xff, 0xff, 0x40) },

I shuffled these around so that they are sorted alphabetically by the
product name defines.

>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM12, 0xff, 0xff, 0xff),
>  	  .driver_info = RSVD(1) | RSVD(2) | RSVD(3) | RSVD(4) | NUMEP2 },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM12, 0xff, 0, 0) },

Now applied.

Johan
