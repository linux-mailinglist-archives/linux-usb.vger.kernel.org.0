Return-Path: <linux-usb+bounces-974-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC077B5BD7
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 22:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id C4018281D26
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 20:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7A7200D7;
	Mon,  2 Oct 2023 20:10:47 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A034200CE
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 20:10:44 +0000 (UTC)
X-Greylist: delayed 552 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 02 Oct 2023 13:10:41 PDT
Received: from mr4.vodafonemail.de (mr4.vodafonemail.de [145.253.228.164])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1FDAC
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 13:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
	s=vfde-mb-mr2-21dec; t=1696276887;
	bh=GLALyzcB0qNBtT23Ee8hX6nho/jrzvkChrJYDDZ9opM=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 In-Reply-To:From;
	b=GSCA9uf8pvmG3coc+vjm05SG4uylwvPJnsIjIVkaroWBOF9W/yA9fhwEpuqseVlfd
	 lLnE3q0Wc1ZvV8l99VIrY63+6bCav9dLNBpuuIDTmekz7IaGS+1JZwt8GvhbpaQUbu
	 OZ4eDAa+PAGcpHDa7zEPEqSYiQCkprIanpn7nytY=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr4.vodafonemail.de (Postfix) with ESMTPS id 4RzsKM4X7Xz1y4F;
	Mon,  2 Oct 2023 20:01:27 +0000 (UTC)
Received: from arcor.de (p57a23d0a.dip0.t-ipconnect.de [87.162.61.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4RzsK30hWGzKm4W;
	Mon,  2 Oct 2023 20:01:08 +0000 (UTC)
Date: Mon, 2 Oct 2023 22:00:56 +0200
From: Reinhard Speyerer <rspmn@arcor.de>
To: Lars Melin <larsm17@gmail.com>
Cc: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@gmx.fr>,
	Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: serial: option: Sierra EM9191 with new firmware
Message-ID: <ZRsheA2vPWDHcpGd@arcor.de>
References: <f72b49af24b281f80bb217cff04d0cc249f229b6.1696261301.git.benoit.monin@gmx.fr>
 <1e67fdfa-be41-6d8f-4b1a-e26f098a6bfc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e67fdfa-be41-6d8f-4b1a-e26f098a6bfc@gmail.com>
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 3101
X-purgate-ID: 155817::1696276883-5AFFF58E-60D56C51/0/0
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 03, 2023 at 12:48:39AM +0700, Lars Melin wrote:
> On 10/2/2023 22:51, Benoît Monin wrote:
> > Following a firmware update of the modem, the interface for the AT
> > command port changed, so add it back.
> > 
> > T:  Bus=08 Lev=01 Prnt=01 Port=01 Cnt=02 Dev#=  2 Spd=5000 MxCh= 0
> > D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> > P:  Vendor=1199 ProdID=90d3 Rev=00.06
> > S:  Manufacturer=Sierra Wireless, Incorporated
> > S:  Product=Sierra Wireless EM9191
> > S:  SerialNumber=xxxxxxxxxxxxxxxx
> > C:  #Ifs= 4 Cfg#= 1 Atr=a0 MxPwr=896mA
> > I:  If#=0x0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> > I:  If#=0x1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> > I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=(none)
> > I:  If#=0x4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> > Signed-off-by: Benoît Monin <benoit.monin@gmx.fr>
> > ---
> >   drivers/usb/serial/option.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > index 7994a4549a6c..73971a3a1897 100644
> > --- a/drivers/usb/serial/option.c
> > +++ b/drivers/usb/serial/option.c
> > @@ -2262,6 +2262,7 @@ static const struct usb_device_id option_ids[] = {
> >   	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1406, 0xff) },			/* GosunCn GM500 ECM/NCM */
> >   	{ USB_DEVICE_AND_INTERFACE_INFO(OPPO_VENDOR_ID, OPPO_PRODUCT_R11, 0xff, 0xff, 0x30) },
> >   	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x30) },
> > +	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x40) },
> >   	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0, 0) },
> >   	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
> >   	{ } /* Terminating entry */
> > 
> 
> No need to add additional lines in the driver, the entry can be simplified
> by removing the previous two lines and add a single line using the
> USB_DEVICE_INTERFACE_CLASS macro.
> 

Hi Lars,

such a simplification can only be applied if you know that the USB
composition does not provide e.g. ADB, DPL or QDSS interfaces which also
use vendor class.

Most newer Sierra Wireless devices based on a Qualcomm chipset with a Linux
AP contain support for an optional ADB interface in production firmware as
this example from a WP7607 shows:

at!usbcomp?
Config Index: 1
Config Type:  1 (Generic)
Interface bitmask: 0009014F (diag,adb,nmea,modem,rmnet0,audio,ecm,rawdat) 

OK

T:  Bus=02 Lev=03 Prnt=08 Port=01 Cnt=02 Dev#= 11 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1199 ProdID=68c0 Rev= 4.14
S:  Manufacturer=Sierra Wireless, Incorporated
S:  Product=Sierra Wireless WP7607
S:  SerialNumber=12345678
...
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Regards,
Reinhard

