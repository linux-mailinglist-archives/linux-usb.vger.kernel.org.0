Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F0F13FC3E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 23:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732698AbgAPWf7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 17:35:59 -0500
Received: from mx009.vodafonemail.xion.oxcs.net ([153.92.174.39]:52285 "EHLO
        mx009.vodafonemail.xion.oxcs.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729631AbgAPWf6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 17:35:58 -0500
Received: from vsmx002.vodafonemail.xion.oxcs.net (unknown [192.168.75.192])
        by mta-6-out.mta.xion.oxcs.net (Postfix) with ESMTP id 24FAC604ED5;
        Thu, 16 Jan 2020 22:35:56 +0000 (UTC)
Received: from arcor.de (unknown [87.162.53.76])
        by mta-6-out.mta.xion.oxcs.net (Postfix) with ESMTPA id B88CF604ED8;
        Thu, 16 Jan 2020 22:35:49 +0000 (UTC)
Date:   Thu, 16 Jan 2020 23:35:42 +0100
From:   Reinhard Speyerer <rspmn@arcor.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     Kristian Evensen <kristian.evensen@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add support for Quectel RM500Q in
 QDL mode
Message-ID: <20200116223541.GA1080@arcor.de>
References: <20200114132923.GA18330@arcor.de>
 <20200116160016.GN2301@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116160016.GN2301@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-VADE-STATUS: LEGIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 16, 2020 at 05:00:16PM +0100, Johan Hovold wrote:
> On Tue, Jan 14, 2020 at 02:29:23PM +0100, Reinhard Speyerer wrote:
> > Add support for Quectel RM500Q in QDL mode.
> > 
> > T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 24 Spd=480  MxCh= 0
> > D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> > P:  Vendor=2c7c ProdID=0800 Rev= 0.00
> > S:  Manufacturer=Qualcomm CDMA Technologies MSM
> > S:  Product=QUSB_BULK_SN:xxxxxxxx
> > S:  SerialNumber=xxxxxxxx
> > C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  2mA
> > I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=option
> > E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > 
> > It is assumed that the ZLP flag required for other Qualcomm-based
> > 5G devices also applies to Quectel RM500Q.
> > 
> > Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>
> > ---
> > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > index 62bad1b2c18e..084cc2fff3ae 100644
> > --- a/drivers/usb/serial/option.c
> > +++ b/drivers/usb/serial/option.c
> > @@ -1107,6 +1107,8 @@ static const struct usb_device_id option_ids[] = {
> >  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM12, 0xff, 0, 0) },
> >  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0xff, 0x30) },
> >  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0, 0) },
> > +	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0xff, 0x10),
> > +	  .driver_info = ZLP },
> 
> By the way, don't you want NCTRL(0) here too (cf. Telit SBL FN980).

Hi Johan,

NCTRL(0) is also used for the diag port of the Telit FN980 while it
is not used for the diag port of the RM500Q in Kristian's patch.

So far I have not observed any problems when using the diag and the QDL
ports of the RM500Q without NCTRL(0).

Unless you or Kristian would prefer to have this changed I would suggest
to keep it as is now.

Regards,
Reinhard
