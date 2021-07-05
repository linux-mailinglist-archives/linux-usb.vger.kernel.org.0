Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5DE3BB95A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jul 2021 10:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhGEIe3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jul 2021 04:34:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:44602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230114AbhGEIe1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Jul 2021 04:34:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD8DD61405;
        Mon,  5 Jul 2021 08:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625473909;
        bh=H5OwiriycfVgCsFoVi+YOoNZ3dpvTFvpWqWAKayDdjQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VACdJqrvVQX7aCGfhej3jSsIKRp8UMk8WxC7MZAsEJGBf56X4cIhHSmCVtac2a7U9
         aVm6zGn5amltaI7K3HFcHRuDTHdIGROFAe2Wumcjd8s9hiaC96Gu/yWgatFjnFWFIU
         WzlsD9b3L0WdSBiUwtSVtkisO2jNa04k0mrBvaiHPPWp+YSqQIxdnCmuE1zHnplmOv
         D1IhSwPux1HNf0pniQ2isAP9LRXQ0HiU/POLHwbsx99yW5HGcGh46xmWisP5IJM+Je
         HVJe0E03DZAKKMHe7IUDD8ZlsKJO6NtQNBbSlZ3oQ8FRQdZGsuC09CJEPJWMC1CdMu
         eMawvk9umX7eA==
Received: from johan by xi with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m0K11-0004oD-Fc; Mon, 05 Jul 2021 10:31:44 +0200
Date:   Mon, 5 Jul 2021 10:31:43 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Marco De Marco <marco.demarco@posteo.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: serial: option: Add support for u-blox LARA-R6
 family
Message-ID: <YOLDb2U2sR86p27x@hovoldconsulting.com>
References: <2644396.hb5XgcuobH@mars>
 <YN1rUbJ9OKWMfwDp@hovoldconsulting.com>
 <2990355.UxunKf390f@mars>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2990355.UxunKf390f@mars>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 03, 2021 at 12:53:20PM +0000, Marco De Marco wrote:
> The patch is meant to support LARA-R6 Cat 1 module family.
> 
> Module USB ID:
> Vendor  ID: 0x05c6
> Product ID: 0x90fA
> 
> Interface layout:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: QMI wwan (not available in all versions)
> 
> Signed-off-by: Marco De Marco <marco.demarco@posteo.net>
> 
> ---
> 
> ADB interface is not available. 
> Diagnostic interface (If 0) can be used with option driver.
> 
> Output of usb-devices command (this version does not have QMI WWAN):
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  3 Spd=480 MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=05c6 ProdID=90fa Rev=00.00
> S:  Manufacturer=Qualcomm, Incorporated
> S:  Product=Qualcomm CDMA Technologies MSM
> S:  SerialNumber=7da8aacd
> C:  #Ifs= 3 Cfg#= 1 Atr=c0 MxPwr=500mA
> I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=(none)
> I:  If#=0x1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=fe Prot=ff Driver=(none)
> 
> Thanks for your patience.

Thanks for the details. All looks good now except that you included the
qmi_wwan changes below.

Can you resend this as a v2 (i.e. a new mail with subject "[PATCH v2]
USB: serial: ...") without the qmi_wwan bits?

Generally when updating you should include a short summary below the
cut-off line ("---").  Please keep the usb-devices output there as well
when resending for completeness (or put it in the commit message).

> diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
> index d08e1de26..bef24b50b 100644
> --- a/drivers/net/usb/qmi_wwan.c
> +++ b/drivers/net/usb/qmi_wwan.c
> @@ -1115,6 +1115,7 @@ static const struct usb_device_id products[] = {
>  	{QMI_FIXED_INTF(0x05c6, 0x9083, 3)},
>  	{QMI_FIXED_INTF(0x05c6, 0x9084, 4)},
>  	{QMI_FIXED_INTF(0x05c6, 0x90b2, 3)},    /* ublox R410M */
> +	{QMI_QUIRK_SET_DTR(0x05c6, 0x90fa, 3)}, /* ublox R6XX  */
>  	{QMI_FIXED_INTF(0x05c6, 0x920d, 0)},
>  	{QMI_FIXED_INTF(0x05c6, 0x920d, 5)},
>  	{QMI_QUIRK_SET_DTR(0x05c6, 0x9625, 4)},	/* YUGA CLM920-NC5 */
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index aeaa3756f..32d1eac8c 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -238,6 +238,7 @@ static void option_instat_callback(struct urb *urb);
>  #define QUECTEL_PRODUCT_UC15			0x9090
>  /* These u-blox products use Qualcomm's vendor ID */
>  #define UBLOX_PRODUCT_R410M			0x90b2
> +#define UBLOX_PRODUCT_R6XX			0x90fa
>  /* These Yuga products use Qualcomm's vendor ID */
>  #define YUGA_PRODUCT_CLM920_NC5			0x9625
>  
> @@ -1101,6 +1102,8 @@ static const struct usb_device_id option_ids[] = {
>  	/* u-blox products using Qualcomm vendor ID */
>  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
>  	  .driver_info = RSVD(1) | RSVD(3) },
> +	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
> +	  .driver_info = RSVD(3) },
>  	/* Quectel products using Quectel vendor ID */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
>  	  .driver_info = NUMEP2 },

Johan
