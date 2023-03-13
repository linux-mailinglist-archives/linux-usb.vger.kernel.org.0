Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11F676B7B7C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 16:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjCMPHU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 11:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjCMPHP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 11:07:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8FA5A926
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 08:07:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B5612B80E40
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 15:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517CBC4339B;
        Mon, 13 Mar 2023 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678720029;
        bh=jU8Pp8YYAc++6msKRYXe1IG5qtHBunRhjzhoDDPZ+ww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G3BYMJurJn3aS8RDgQmync1m2cTYwm9mj5hsL9dfqsBbdkyGM/FZk2djdduNjNWV3
         E0venP0nBwKZ80OKHxZ6okqEnVO1bWnWg8iV2nbm0/u9OKaza/3oq35o2WStHSVxL5
         bj9uJcupzsdIVrKybniikx0/6G9L8GznDskDdVwQj241KQbgTgOokfY91jFiXe0zFe
         k2UP//jHnmoyVT1kvWSbDAGdkQUiqyIggjej3d+bpqYYBi7z8DlE2e1IOaSMD+UzYM
         OQ7B9xFbCtBJtWDiIM6DKfjbxbfCqnzuQ1CPpbxQGNDdWWFom22IHWGgk2gWLOn2zI
         /UkEhiGZ9PYYw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pbjmT-0004Fj-Qq; Mon, 13 Mar 2023 16:08:09 +0100
Date:   Mon, 13 Mar 2023 16:08:09 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Enrico Sau <enrico.sau@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit FE990 compositions
Message-ID: <ZA88WZ51iBgpeuXn@hovoldconsulting.com>
References: <20230306120741.198992-1-enrico.sau@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306120741.198992-1-enrico.sau@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 06, 2023 at 01:07:41PM +0100, Enrico Sau wrote:
> Add the following Telit FE990 compositions:
> 
> 0x1080: tty, adb, rmnet, tty, tty, tty, tty
> 0x1081: tty, adb, mbim, tty, tty, tty, tty
> 0x1082: rndis, tty, adb, tty, tty, tty, tty
> 0x1083: tty, adb, ecm, tty, tty, tty, tty
> 
> Signed-off-by: Enrico Sau <enrico.sau@gmail.com>
> ---
> 
> This is the usb-devices output for all compositions:
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=04 Cnt=02 Dev#= 12 Spd=480 MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1bc7 ProdID=1080 Rev=05.04
> S:  Manufacturer=Telit Wireless Solutions
> S:  Product=FE990
> S:  SerialNumber=9455d1d2
> C:  #Ifs= 7 Cfg#= 1 Atr=80 MxPwr=500mA
> I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> I:  If#=0x1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
> I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=04 Cnt=02 Dev#= 13 Spd=480 MxCh= 0
> D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=1bc7 ProdID=1081 Rev=05.04
> S:  Manufacturer=Telit Wireless Solutions
> S:  Product=FE990
> S:  SerialNumber=9455d1d2
> C:  #Ifs= 8 Cfg#= 1 Atr=80 MxPwr=500mA
> I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> I:  If#=0x1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> I:  If#=0x2 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> I:  If#=0x3 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> I:  If#=0x7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=04 Cnt=02 Dev#= 11 Spd=480 MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1bc7 ProdID=1082 Rev=05.04
> S:  Manufacturer=Telit Wireless Solutions
> S:  Product=FE990
> S:  SerialNumber=9455d1d2
> C:  #Ifs= 8 Cfg#= 1 Atr=80 MxPwr=500mA
> I:  If#=0x0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=rndis_host
> I:  If#=0x1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
> I:  If#=0x2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> I:  If#=0x3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> I:  If#=0x7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=04 Cnt=02 Dev#= 14 Spd=480 MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1bc7 ProdID=1083 Rev=05.04
> S:  Manufacturer=Telit Wireless Solutions
> S:  Product=FE990
> S:  SerialNumber=9455d1d2
> C:  #Ifs= 8 Cfg#= 1 Atr=80 MxPwr=500mA
> I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> I:  If#=0x1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> I:  If#=0x2 Alt= 0 #EPs= 1 Cls=02(commc) Sub=06 Prot=00 Driver=cdc_ether
> I:  If#=0x3 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
> I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> I:  If#=0x7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> 
> ---
>  drivers/usb/serial/option.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index e6d8d9b35ad0..9520935bd502 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1300,6 +1300,14 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = NCTRL(0) | RSVD(1) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1075, 0xff),	/* Telit FN990 (PCIe) */
>  	  .driver_info = RSVD(0) },
> +	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1080, 0xff),	/* Telit FE990 (rmnet) */
> +	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
> +	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1081, 0xff),	/* Telit FE990 (MBIM) */
> +	  .driver_info = NCTRL(0) | RSVD(1) },
> +	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1082, 0xff),	/* Telit FE990 (RNDIS) */
> +	  .driver_info = NCTRL(2) | RSVD(3) },
> +	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1083, 0xff),	/* Telit FE990 (ECM) */
> +	  .driver_info = RSVD(0) },

This entry does not seem to match the usb-devices output above (e.g.
it looks like this should be NCTRL(0) | RSVD(1)).

Please double check this one and the others.

>  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910),
>  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(3) },
>  	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910_DUAL_MODEM),

Johan
