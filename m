Return-Path: <linux-usb+bounces-4073-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B47A280F481
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 18:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E23CA1C20D2B
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 17:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F2C7D893;
	Tue, 12 Dec 2023 17:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arcor.de header.i=@arcor.de header.b="Noj7e/zo"
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 584 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Dec 2023 09:25:53 PST
Received: from mr3.vodafonemail.de (mr3.vodafonemail.de [145.253.228.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3768E
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 09:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
	s=vfde-mb-mr2-23sep; t=1702401367;
	bh=bqq4DxFyrr3bTbFZfXKbVmMPSNyik8oJTyiRLa3nM1o=;
	h=Date:From:To:Subject:Message-ID:Content-Type:From;
	b=Noj7e/zowSVtEPAkBSJocELkNkICKalTg/n/3dW5HUWZlFM/7BQ32TPYtGFlTmjpw
	 //0/ImmQ+r/b5h5jyNY5WWZvW0DuZerfnL+CWZGDmKuPUFdp9fFdvvKuckoNFUaiHf
	 UC/853cEVkfsBJxieOyAwtwN8XN+obkhODWcjAsc=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr3.vodafonemail.de (Postfix) with ESMTPS id 4SqQHq1RkRz1yST;
	Tue, 12 Dec 2023 17:16:07 +0000 (UTC)
Received: from arcor.de (p5b28177e.dip0.t-ipconnect.de [91.40.23.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4SqQHc6Gsxz9sQF;
	Tue, 12 Dec 2023 17:15:53 +0000 (UTC)
Date: Tue, 12 Dec 2023 18:15:38 +0100
From: Reinhard Speyerer <rspmn@arcor.de>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, kristian.evensen@gmail.com
Subject: [PATCH] USB: serial: option: add Quectel RM500Q R13 firmware support
Message-ID: <ZXiVOs7LVBzB298i@arcor.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 2198
X-purgate-ID: 155817::1702401363-8F7FD674-24F93C03/0/0

Add support for Quectel RM500Q R13 firmware which uses Prot=40 for the
NMEA port:

T:  Bus=02 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  8 Spd=5000 MxCh= 0
D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
P:  Vendor=2c7c ProdID=0800 Rev= 4.14
S:  Manufacturer=Quectel
S:  Product=RM500Q-AE
S:  SerialNumber=xxxxxxxx
C:* #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=896mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=40 Driver=option
E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=84(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
E:  Ad=88(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms

Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>
---
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 4dffcfefd62d..e749d9d4ae39 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1232,6 +1232,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, 0x0700, 0xff), /* BG95 */
 	  .driver_info = RSVD(3) | ZLP },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0xff, 0x10),
 	  .driver_info = ZLP },

