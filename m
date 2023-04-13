Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E47E6E10C5
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 17:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbjDMPPH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Apr 2023 11:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbjDMPPF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 11:15:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38A1B752;
        Thu, 13 Apr 2023 08:14:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 30F3663F83;
        Thu, 13 Apr 2023 15:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952DEC433D2;
        Thu, 13 Apr 2023 15:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681398888;
        bh=p2EzDGmg/AcSHNxl1kEdsuBAxx5NhTDeYv8wVb1k7uA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H6RcOHZ7pOBPIF2i0Rfg0SGnH4+xpSgeYzGgITNEkgVUIqttW6V6p7f66pAt0+tR3
         Gjz8MsfxaalcuHIEUcH561epYQovzYHGITipJbp8j8Al4Ao5sT/g9oebINoWhxLW9o
         M/J9HHOzgLzf30AEYLnMTd7ZskBawJo/Ou+tbQP4haqXHdp9xinFniZP/tkdxyePVK
         MVwOH2h0WBLGmsacEqAcGdHVva5QWnWnbuu7ZRSKBo4P5l6h823Tf2Z81JLo7+j/cI
         Le3SgKf9tT397kWhs4tca1kOCqTB/2WVIbPFdEv95cnJ9VbwQuGQdWDXbP6Pv/mtBR
         qYY62WUcFCPGA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pmyex-0001xE-WD; Thu, 13 Apr 2023 17:14:52 +0200
Date:   Thu, 13 Apr 2023 17:14:51 +0200
From:   Johan Hovold <johan@kernel.org>
To:     arinc9.unal@gmail.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        =?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, me@1conan.com,
        erkin.bozoglu@xeront.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add UNISOC vendor and TOZED LT70C
 product
Message-ID: <ZDgca7wgfGlK/9cZ@hovoldconsulting.com>
References: <20230406055004.8216-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406055004.8216-1-arinc.unal@arinc9.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 06, 2023 at 08:50:04AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Add UNISOC vendor ID and TOZED LT70-C modem which is based from UNISOC
> SL8563. The modem supports the NCM mode.

Thanks for the patch. Looks mostly good, but see my comments below.

> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  6 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1782 ProdID=4055 Rev=04.04
> S:  Manufacturer=Unisoc Phone
> S:  Product=Unisoc Phone
> S:  SerialNumber=<redacted>
> C:  #Ifs=14 Cfg#= 1 Atr=c0 MxPwr=500mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0d Prot=00 Driver=cdc_ncm
> E:  Ad=82(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=01 Driver=cdc_ncm
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#=10 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=07(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=8b(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#=11 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=08(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=8c(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#=12 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=option
> E:  Ad=09(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=8d(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

This looks like an ADB interface which should be blacklisted (reserved)
so that the driver does not bind to it.

> I:  If#=13 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=0a(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#= 2 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0d Prot=00 Driver=cdc_ncm
> E:  Ad=84(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
> I:  If#= 3 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=01 Driver=cdc_ncm
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#= 4 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0d Prot=00 Driver=cdc_ncm
> E:  Ad=86(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
> I:  If#= 5 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=01 Driver=cdc_ncm
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#= 6 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0d Prot=00 Driver=cdc_ncm
> E:  Ad=88(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
> I:  If#= 7 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=01 Driver=cdc_ncm
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#= 8 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#= 9 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=8a(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Bus 001 Device 002: ID 1782:4055 Unisoc Phone Unisoc Phone
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x1782
>   idProduct          0x4055
>   bcdDevice            4.04
>   iManufacturer           1 Unisoc Phone
>   iProduct                2 Unisoc Phone
>   iSerial                 3 <redacted>
>   bNumConfigurations      1

When resending you can put the verbose lsusb output below the cut-off
line (---) so that we have it in the mail archives if ever needed.

Could you also add something what the various serial interfaces are used
for?

> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
> 
> I did not receive any comments on RFC so I'm sending this as is.
> 
> Arınç
> 
> ---
>  drivers/usb/serial/option.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index f31cc3c76329..65a050a9ca39 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -595,6 +595,11 @@ static void option_instat_callback(struct urb *urb);
>  #define SIERRA_VENDOR_ID			0x1199
>  #define SIERRA_PRODUCT_EM9191			0x90d3
>  
> +/* UNISOC (Spreadtrum) products */
> +#define UNISOC_VENDOR_ID			0x1782
> +/* TOZED TL70-C based on UNISOC SL8563 uses UNISOC's vendor ID */
> +#define TOZED_PRODUCT_LT70C			0x4055
> +
>  /* Device flags */
>  
>  /* Highest interface number which can be used with NCTRL() and RSVD() */
> @@ -2225,6 +2230,7 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE_AND_INTERFACE_INFO(OPPO_VENDOR_ID, OPPO_PRODUCT_R11, 0xff, 0xff, 0x30) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x30) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0, 0) },
> +	{ USB_DEVICE(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C) },

You should match also on the interface class so that you don't try to
bind to the cdc interfaces. See USB_DEVICE_INTERFACE_CLASS() (and
RSVD() for the ADB interface).

>  	{ } /* Terminating entry */
>  };
>  MODULE_DEVICE_TABLE(usb, option_ids);

Johan
