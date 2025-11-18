Return-Path: <linux-usb+bounces-30651-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A18C67C66
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 07:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A32CC4EF4B1
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 06:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB6D2EFDBB;
	Tue, 18 Nov 2025 06:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BDy4zoLs"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1886E2E7186;
	Tue, 18 Nov 2025 06:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763448362; cv=none; b=Aay8aSzHTTqgwgOzCQ5tubgdyyKfVLzglRGipbOzRd8g9qMvdR4iY1FMH4euGdwdj2BqMN1lFcwPk18oi3dRvL3EcZVYzcYOBIsn6NXmu9eEI+VrvsG0UNxbLECRbOCcillNhCgErmLUfXFgPUNYlid5sZQogVa0WDsDVsJWC5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763448362; c=relaxed/simple;
	bh=IDLojGFjTcYNpDLSctjJrSpy12uTAkSYaslv2rMF1Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XWtheN77IcbO5ROvkxSiOQQN7fg/YIUVyOiYMuACTO75pwdCieqAeXkqFzPM7D/XzizSxJrYFY1ZTVDMgOn90Hg47d0F7A3Qjp+VCag1UYV5XnXmxadylHYc6LhQh6XoQstI+wjPQOxhikGbEPwk11ir2Z3pAC0E0kmahXI2qao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BDy4zoLs; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Xw
	cpC+G6aYCcUtBTG+JU/rhq7qnT9gGrGLq1ePNcW7o=; b=BDy4zoLsXpKz/2oG2J
	T8MqH4JzmKoh85gJysXVgc/OY0pKHB/twQoEDpWnnp+Z/iwjBehEBLmAHKrBoPTE
	9q0okLlfdXM+/BuS3O8oo/zyCB3smsrs++XzbfTpJ5a2tVRqPX+WYJlTfJdI/3nR
	FC7DYhZGyJzh0B2O+LgYcJIJk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBXc8AKFhxpDeLzAw--.109S2;
	Tue, 18 Nov 2025 14:45:32 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] USB: serial: option: add Foxconn T99W760
Date: Tue, 18 Nov 2025 14:45:28 +0800
Message-Id: <20251118064528.31491-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXc8AKFhxpDeLzAw--.109S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4DAF4fuF13ArWxKrW7urg_yoW8KrW3pF
	4UAa1aqrZ5XFW5WFnIkrn7ZayFgan3Wry7uasrXw4SqFWSyws7JryUArWSqrnF9r4xtrsF
	v3yDK3y8Gas7JrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRhvtLUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbCvwzpTmkcFgz+iQAA3M

T99W760 is designed based on Qualcomm SDX35(5G redcap) chip. There
are 3 serial ports to be enumerated: Modem, NMEA and Diag.

test evidence as below:
T:  Bus=03 Lev=01 Prnt=01 Port=03 Cnt=01 Dev#=  4 Spd=5000  MxCh= 0
D:  Ver= 3.20 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=0489 ProdID=e123 Rev=05.15
S:  Manufacturer=QCOM
S:  Product=SDXBAAGHA-IDP _SN:39A8D3E4
S:  SerialNumber=39a8d3e4
C:  #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=896mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
E:  Ad=85(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=88(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms

0&1: MBIM, 2:Modem, 3:GNSS(non-serial port), 4: NMEA, 5:Diag

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e9400727ad36..d13226f9b811 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2376,6 +2376,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(3) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe0f0, 0xff),			/* Foxconn T99W373 MBIM */
 	  .driver_info = RSVD(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe123, 0xff),			/* Foxconn T99W760 MBIM */
+	  .driver_info = RSVD(3) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe145, 0xff),			/* Foxconn T99W651 RNDIS */
 	  .driver_info = RSVD(5) | RSVD(6) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe15f, 0xff),                     /* Foxconn T99W709 */
-- 
2.25.1


