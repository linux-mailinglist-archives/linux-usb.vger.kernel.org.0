Return-Path: <linux-usb+bounces-19706-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55895A1C28A
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jan 2025 10:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D165B3A737C
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jan 2025 09:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FD01DB933;
	Sat, 25 Jan 2025 09:40:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.on2.de (mailgw.on2.de [213.61.158.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EED25A623;
	Sat, 25 Jan 2025 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.61.158.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737798024; cv=none; b=cvAq+b/mGo1pZqn8xxFpRqJbLHg/1kmJpitoeiBeVj9+OGjQTh+dsAkKr7t3CqgajPB+4vuKY+VKVTB5y8mB0cwH8VLDY/VkAU0zp9WK6F0k42CL2nB0xoNLpAyNGtoP5LXFF9l5NdS7/+WDpB6OKGzhclYdjeuFT4KKjcRbPOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737798024; c=relaxed/simple;
	bh=ib99i9i3UjJ+AgzvHyn0ZqKstpY+ZBa13X9Iu7xHflM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t5Om0MZBIhkNQnUn+xFXIFfLwVMzBDlVv5Z/mWAF+pb8Z8OCviwjviMOq2gfd/tGafYEzEK62JBfrjxHE5bvnAhopp+QNseNFHoHNazBnrlV+1pAmgXmrXtd0QWGrNpkEYC2jFr1MwKYg8dwfMYawalWyDYkYHrzwwlBZtGvOBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=on2.de; spf=pass smtp.mailfrom=on2.de; arc=none smtp.client-ip=213.61.158.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=on2.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=on2.de
Received: from phoebe.cuh.hg.on2.de (phoebe.cuh.hg.on2.de [10.101.9.217])
	by mailgw.on2.de (Postfix) with ESMTP id BA437FFE1C;
	Sat, 25 Jan 2025 10:40:17 +0100 (CET)
From: U Michel <ulv@on2.de>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	U M <ulv@on2.de>
Subject: [PATCH 2/2] USB: serial: option: add Wistron NeWeb M18QW support
Date: Sat, 25 Jan 2025 10:40:05 +0100
Message-Id: <20250125094005.1132785-1-ulv@on2.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: U M <ulv@on2.de>

Update the USB serial option driver to support Wistron NeWeb M18QW.

ID 1435:3185 WNC M18QW

T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1435 ProdID=3185 Rev= 3.18
S:  Manufacturer=Android
S:  Product=Android
S:  SerialNumber=WNC_ADB
C:* #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
E:  Ad=88(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 5 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=(none)
E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=125us

Tested successfully connecting via picocom and submitting at commands

Signed-off-by: U M <ulv@on2.de>
---
 drivers/usb/serial/option.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 1e2ae0c6c41c..b166f1607b0e 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2285,6 +2285,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x7e11, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/A3 */
 	{ USB_DEVICE_INTERFACE_CLASS(0x1435, 0xd191, 0xff),			/* Wistron Neweb D19Q1 */
 	  .driver_info = RSVD(1) | RSVD(4) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x1435, 0x3185, 0xff, 0x00, 0x00) },   /* Wistron Neweb M18QW */
 	{ USB_DEVICE_INTERFACE_CLASS(0x1690, 0x7588, 0xff),			/* ASKEY WWHC050 */
 	  .driver_info = RSVD(1) | RSVD(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x2020, 0x2031, 0xff),			/* Olicard 600 */
-- 
2.34.1


