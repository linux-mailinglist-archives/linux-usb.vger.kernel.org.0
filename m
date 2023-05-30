Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81325716637
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 17:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbjE3PIo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 11:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjE3PIn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 11:08:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73881B4
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 08:08:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3AEE062B24
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 15:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C615C433EF;
        Tue, 30 May 2023 15:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685459249;
        bh=JMPs++RBdw/StYy2jx2zmilzENQdTZvDG+sFGRK/F9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fpfv4GZtQkt2kbC76vWzhJkH/2rvWBCUXcQmr3oUtjGxsdLGD9AdCImFt+FFrpf7r
         rBQdOqbEpSWRn1OPVQEhkf/hrfGWqsyUS8BHd89pVw1BTy5WjvUFLlt3Lz/mpudEhW
         92YXNLMXXnsPUGzXSUd5ouAh00m9ssAOMUBiJVVXNgw/Ob34OjOSrZjTJ9gbNxD1Mt
         5IQOTzB7IZgiD+SUsZA+/EzgvxedU20FTBcR0JFket9sZZpeHCYy35+WLh3gwLfqmA
         08YE3QoGnYPExikKweAOHyyqJvcO4ANSF8vYlf8JGrMIHdg30roYa8Z5WtvFIMEiMY
         XtB47vChm15gQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1q40wd-0000xR-GN; Tue, 30 May 2023 17:07:31 +0200
Date:   Tue, 30 May 2023 17:07:31 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jerry Meng <jerry-meng@foxmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Quectel EM061KGL series
Message-ID: <ZHYRM-ReTLvS_nRQ@hovoldconsulting.com>
References: <tencent_9E34E48F5FB07FD875452120856EAE650906@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_9E34E48F5FB07FD875452120856EAE650906@qq.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 30, 2023 at 11:42:00AM +0800, Jerry Meng wrote:
> add support for Quectel EM061KGL series which are based on Qualcomm SDX12 chip
> 
> EM061KGL_LWW(0x2c7c / 0x6008): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
> EM061KGL_LCN(0x2c7c / 0x6009): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
> EM061KGL_LTA(0x2c7c / 0x0123): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
> EM061KGL_LMS(0x2c7c / 0x0124): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
> 
> Option driver just for interfaces DIAG, NMEA and AT
> 
> T:  Bus=03 Lev=01 Prnt=01 Port=01 Cnt=02 Dev#=  5 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=2c7c ProdID=6008 Rev= 5.04

I assume all of the above products use the exact same interface layout?

Or can you include usb-devices output for all of them for completeness?

> S:  Manufacturer=Quectel
> S:  Product=Quectel EM061K-GL
> S:  SerialNumber=f6fa08b6
> C:* #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=500mA
> A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=40 Driver=option
> E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 6 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=70 Driver=(none)
> E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 7 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
> E:  Ad=8f(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Jerry Meng <jerry-meng@foxmail.com>
> ---
>  drivers/usb/serial/option.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 644a55447fd7..e9275fd9640e 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -255,6 +255,10 @@ static void option_instat_callback(struct urb *urb);
>  #define QUECTEL_PRODUCT_EP06			0x0306
>  #define QUECTEL_PRODUCT_EM05G			0x030a
>  #define QUECTEL_PRODUCT_EM060K			0x030b
> +#define QUECTEL_PRODUCT_EM061K_LWW		0x6008
> +#define QUECTEL_PRODUCT_EM061K_LCN		0x6009
> +#define QUECTEL_PRODUCT_EM061K_LTA		0x0123
> +#define QUECTEL_PRODUCT_EM061K_LMS		0x0124

Please keep the defines sorted by PID here.

>  #define QUECTEL_PRODUCT_EM05G_CS		0x030c
>  #define QUECTEL_PRODUCT_EM05CN_SG		0x0310
>  #define QUECTEL_PRODUCT_EM05G_SG		0x0311
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
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM12, 0xff, 0xff, 0xff),
>  	  .driver_info = RSVD(1) | RSVD(2) | RSVD(3) | RSVD(4) | NUMEP2 },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM12, 0xff, 0, 0) },

Johan
