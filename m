Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2ED21407C1
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 11:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgAQKTJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 05:19:09 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41780 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgAQKTJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jan 2020 05:19:09 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so17889468lfp.8
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2020 02:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R7fTftxuuHEMu1dWsjZB/hGLfft2q/fS6SPs46ebZRM=;
        b=UnZAmDY8BVBZPFUFoV1SXQXZPqisWF7RERuLzYWYDcVcK5XNZlRuW87fmSyoSm0slR
         xzQm4/4qvLAI4FJ0mNePRwUhp6UdpXBrGV4O0ULnwLcCxgCYCjdNYa93efIy7LKxMntG
         jSzOpvSFZGYDu6xJLQtOCLpzxh/XEnbrwoPFqcdubQ1L20/tE2Eeby4Nl581qOHjnZRH
         8D80jf+DP+UrS5jQH4L5AzAZ1M8kiCYWYaLnsPieX7KSwQVnm1wWqTS6b549AUGFUQzX
         3+USDkWGU/y+/y0tICyoUbRHMe+jxnVVD6ixb0wv5gwNStf7Shj+AV5nZ0yA+uoXW1ox
         R7HQ==
X-Gm-Message-State: APjAAAVV+E0e8EJRVTwb5q+OH4kSz3+FO/h2f+UpudE7RszCSpQ3CTfg
        j7v0m7H6T11dIZExJf8uHUg=
X-Google-Smtp-Source: APXvYqzzWL9TUbzGZX9LxB4f5aSide0BGWR7ffMI3AMSFIlbYcPRu5sczQAFCy1k5+qCWleNpvWI3w==
X-Received: by 2002:ac2:44a2:: with SMTP id c2mr4800454lfm.105.1579256347481;
        Fri, 17 Jan 2020 02:19:07 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id s18sm14163131ljj.36.2020.01.17.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 02:19:06 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1isOiY-0003pJ-DP; Fri, 17 Jan 2020 11:19:06 +0100
Date:   Fri, 17 Jan 2020 11:19:06 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Reinhard Speyerer <rspmn@arcor.de>
Cc:     Johan Hovold <johan@kernel.org>,
        Kristian Evensen <kristian.evensen@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add support for Quectel RM500Q in
 QDL mode
Message-ID: <20200117101906.GR2301@localhost>
References: <20200114132923.GA18330@arcor.de>
 <20200116160016.GN2301@localhost>
 <20200116223541.GA1080@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116223541.GA1080@arcor.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 16, 2020 at 11:35:42PM +0100, Reinhard Speyerer wrote:
> On Thu, Jan 16, 2020 at 05:00:16PM +0100, Johan Hovold wrote:
> > On Tue, Jan 14, 2020 at 02:29:23PM +0100, Reinhard Speyerer wrote:
> > > Add support for Quectel RM500Q in QDL mode.
> > > 
> > > T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 24 Spd=480  MxCh= 0
> > > D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> > > P:  Vendor=2c7c ProdID=0800 Rev= 0.00
> > > S:  Manufacturer=Qualcomm CDMA Technologies MSM
> > > S:  Product=QUSB_BULK_SN:xxxxxxxx
> > > S:  SerialNumber=xxxxxxxx
> > > C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  2mA
> > > I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=option
> > > E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > > E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > > 
> > > It is assumed that the ZLP flag required for other Qualcomm-based
> > > 5G devices also applies to Quectel RM500Q.
> > > 
> > > Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>
> > > ---
> > > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > > index 62bad1b2c18e..084cc2fff3ae 100644
> > > --- a/drivers/usb/serial/option.c
> > > +++ b/drivers/usb/serial/option.c
> > > @@ -1107,6 +1107,8 @@ static const struct usb_device_id option_ids[] = {
> > >  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM12, 0xff, 0, 0) },
> > >  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0xff, 0x30) },
> > >  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0, 0) },
> > > +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0xff, 0x10),
> > > +	  .driver_info = ZLP },
> > 
> > By the way, don't you want NCTRL(0) here too (cf. Telit SBL FN980).
> 
> Hi Johan,
> 
> NCTRL(0) is also used for the diag port of the Telit FN980 while it
> is not used for the diag port of the RM500Q in Kristian's patch.

But that's not necessarily the same firmware implementation running for
diag and QDL, right?
 
> So far I have not observed any problems when using the diag and the QDL
> ports of the RM500Q without NCTRL(0).
> 
> Unless you or Kristian would prefer to have this changed I would suggest
> to keep it as is now.

Fair enough. We can always add that later if someone confirms it isn't
needed or even incorrect (we should probably at least add a debug
statement for the return value of that control request).

Johan
