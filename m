Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14EC913DF71
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 17:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgAPQAU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 11:00:20 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40869 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgAPQAT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 11:00:19 -0500
Received: by mail-lf1-f66.google.com with SMTP id i23so15864799lfo.7
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2020 08:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NJ7aZMxm3RzPvb52TF7pvFQmIY3/JMjgi+gugvR/Zm4=;
        b=DyTn1fPq/hLi2x4t7YXYLBFfq/qksbplwCuvQdKW00UHemPYY6a+ELjhtIN/0t/OG/
         DPaFCq7oxIiib2HzjIuKsQg+Ky2vXAlbtP62x1/spA9Se288Q/begYIQ8VWHZ0M97K9U
         5QmT6E5jfrRzjsmOrUqepwaTfDCHesYJiLDPTbNgQiMGNdvLFCFkhngQWFIhu/p2dg2k
         0ZJoV244PZENwmVrm0srQqO7l2nx8IGV/JsNFAongY+eveVP9FTZwtcouyNyufZW1U4v
         P10s75sp/MPDysVst6NPEqwr39idSOC7DkkhzFzTcddUijkyrsTxXRfWai+vPh6j577U
         BREg==
X-Gm-Message-State: APjAAAX4QC7U735d+ituhsyb/WaL5B2hCxj3HZ1G5QgqYJaG9olXZcaW
        /53tJMPNne8ltxB61i3bNE4=
X-Google-Smtp-Source: APXvYqyPb9J+p9ZgwPwRP1rJc60LrEBC/r3HGBmXaPkgS2x0qvRrkoOhVFA3VDkpbDK6CLRQUISCFQ==
X-Received: by 2002:a05:6512:40e:: with SMTP id u14mr2772138lfk.161.1579190417625;
        Thu, 16 Jan 2020 08:00:17 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id r12sm10894718ljh.105.2020.01.16.08.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 08:00:17 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1is7ZA-0007Cg-GL; Thu, 16 Jan 2020 17:00:16 +0100
Date:   Thu, 16 Jan 2020 17:00:16 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Reinhard Speyerer <rspmn@arcor.de>
Cc:     Johan Hovold <johan@kernel.org>,
        Kristian Evensen <kristian.evensen@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add support for Quectel RM500Q in
 QDL mode
Message-ID: <20200116160016.GN2301@localhost>
References: <20200114132923.GA18330@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114132923.GA18330@arcor.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 14, 2020 at 02:29:23PM +0100, Reinhard Speyerer wrote:
> Add support for Quectel RM500Q in QDL mode.
> 
> T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 24 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=2c7c ProdID=0800 Rev= 0.00
> S:  Manufacturer=Qualcomm CDMA Technologies MSM
> S:  Product=QUSB_BULK_SN:xxxxxxxx
> S:  SerialNumber=xxxxxxxx
> C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  2mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=option
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> It is assumed that the ZLP flag required for other Qualcomm-based
> 5G devices also applies to Quectel RM500Q.
> 
> Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>
> ---
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 62bad1b2c18e..084cc2fff3ae 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1107,6 +1107,8 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM12, 0xff, 0, 0) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0xff, 0x30) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0, 0) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0xff, 0x10),
> +	  .driver_info = ZLP },

By the way, don't you want NCTRL(0) here too (cf. Telit SBL FN980).

>  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6001) },
>  	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CMU_300) },

Johan
