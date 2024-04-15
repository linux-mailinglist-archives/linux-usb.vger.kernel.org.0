Return-Path: <linux-usb+bounces-9342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E838A48BA
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 09:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D1D8283EE8
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 07:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080E9208BA;
	Mon, 15 Apr 2024 07:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="mO4RTlz0"
X-Original-To: linux-usb@vger.kernel.org
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43871F951
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 07:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713164987; cv=none; b=PM9PXOpr0bM5WhN0rj54zhzOS5TqJRvh0SNFGPGJzXClwSyZiIhil3n/aplKV2KpL/PZ6xo+Q0bQ9J1bH6XoeGy5lVAMU3MExxGJ4gQhc+8dNHInUO9fWmF5fRdG3O3TfdncNYKr7grMus8KNPG2ay6Crbcxv/S7YIDBUaKJ1m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713164987; c=relaxed/simple;
	bh=MyBx2xi+yqq9/vz5fa11a4hemweBLiuQup1HrVyEoEA=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=dwNmy0RXZNKKq5JTMNXpcmIlEYpeBYYC7DMXEBStjBPLIjKJsU2HouyNwOniXnMgfz+RNV5lqJzPKi44Bc3l4ElQc+vbRXnwlOEPIgLDe8CRUwJJkpNgKvWr694FDUGhjAJbDVpuLNu/zvVYYsHql5RuHCUpN2rLRIcGSbPIGSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=mO4RTlz0; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1713164675;
	bh=q6VkBjWMMo5S79MJ57BQXd8i5ccGUTUebSVqJa0/8Qs=;
	h=From:To:Cc:Subject:Date;
	b=mO4RTlz0pi0echw3rRaOsrpQqt3rzh3kGAtl2rIAQjxJnga/Ny0g2UUCGBiZVbcfY
	 oWDE5ZtB2w6K+VIB7aZ/AWGPRvHt6F6QDvAHZW6/OD0BSU9oiIvujnAou2pK9xdznx
	 RQCR6/LzRR7D2ZhN7gqHM45W9RrzDcWV+Pa8192I=
Received: from quectel.localdomain ([220.180.239.55])
	by newxmesmtplogicsvrsza30-0.qq.com (NewEsmtp) with SMTP
	id 11F1C84D; Mon, 15 Apr 2024 15:04:31 +0800
X-QQ-mid: xmsmtpt1713164671tw0p8p28p
Message-ID: <tencent_D5A28A22C0345D2A4B1EE89E1FD5E0C0B007@qq.com>
X-QQ-XMAILINFO: MyIXMys/8kCtq0kmnhT1CUixI5Bl5mcP3KLjbB7lSuBFJJGCoOnce7UTF3FtoT
	 HA2BFUUrIPOWc/LbaJoQEjbRsK5xV0zmTigBWMhwUaim7WpeUcGAlh065rOcb30mFRYFM33zfCOT
	 4ZHUBVs8tIfX187yp25c7KUOB0xkwfwgjCJinlFuRSGc5o8bL2U6jQ2wOKC4DabUVDyD9O/c5YB6
	 WsqAU3S/IKwWQt0+H2ybVn1wXF79UM8BNTot7w07WNgKWYf3k+JAmefUQ8xh0cxCVJw4p1N1ufy8
	 gVXpq6oGh48PJbhuhp6WjUbF0Tv3LpTs8VSRlDm6Cgw8Xd6LhGorsZrl/q1MKLCkvcBgU05/ydyR
	 LQsSgYQ8M22jGT/4FQ3Pnq6yWlP+t5HhlXmEQcYFxP7ks0uxlPICRe9mhx2guaGz0pS9i6x18sQS
	 YSF3Ek6/07EFcE55adQLZy60zFcM7XlECembexHKYK5V0fqgnVQXyvj0WDe3SWIO7lSPSI8yf8ib
	 Ap5MfwhVGhyntAqIJ9w6t0+Hiv5K2ykOD6TLFyaafGqdwUYckCWuxbg4HDbzpimo+YhY6973luWO
	 DyJqnMJRocPpKh9KyTm9pjotvUthKD9FnaC/8LJar53wNGwNm+g4+Z5NekmuReOSF895FQ92TZHs
	 NElIG07f90O6XiH7G4SBJllR7b1GvOFuKiUP8dKth78IXV88Z5/SnanMQ/F8efonNBiVuT/jWZ70
	 8DEH855Bc6DAsphaJ25fKMvBcg4G1VuzrFz7g2zqD7uy/fGp0NwSLK13OzUF4Go+/yxi8Q1rTCvE
	 +eIy96pECCzR9gr+B308T+GRKeKWeeBbVDvETU90D3WhdfZWjiwkNiuh+FVeAe5Y19J3YmFVahfZ
	 nh0zsovsYnDWPnoQTjcWg2oL9Wr6XiVTPnQlzxQphpyaENNMICKvwZaEm1tBaQbaPDeDAVFAcYo4
	 wYsLCLSlVP0lxmugoMIHRKDMAboiO44bgP6DXPplSLBSU9a+frhA==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Jerry Meng <jerry-meng@foxmail.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Jerry Meng <jerry-meng@foxmail.com>
Subject: [PATCH V2] USB: serial: option: support Quectel EM060K sub-models
Date: Mon, 15 Apr 2024 15:04:29 +0800
X-OQ-MSGID: <20240415070429.15106-1-jerry-meng@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EM060K_129, EM060K_12a, EM060K_12b and EM0060K_12c are EM060K's sub-models,
having the same name "Quectel EM060K-GL" and the same interface layout.

MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL

T:  Bus=03 Lev=01 Prnt=01 Port=01 Cnt=02 Dev#=  8 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=2c7c ProdID=0129 Rev= 5.04
S:  Manufacturer=Quectel
S:  Product=Quectel EM060K-GL
S:  SerialNumber=f6fa08b6
C:* #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=500mA
A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=40 Driver=option
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 6 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=70 Driver=(none)
E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 7 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
E:  Ad=8f(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Jerry Meng <jerry-meng@foxmail.com>
---
V1 -> V2: no changes. resend this patch to cc linux-usb@vger.kernel.org

 drivers/usb/serial/option.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 55a65d941..ff3999356 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -255,6 +255,10 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_EM061K_LMS		0x0124
 #define QUECTEL_PRODUCT_EC25			0x0125
 #define QUECTEL_PRODUCT_EM060K_128		0x0128
+#define QUECTEL_PRODUCT_EM060K_129		0x0129
+#define QUECTEL_PRODUCT_EM060K_12a		0x012a
+#define QUECTEL_PRODUCT_EM060K_12b		0x012b
+#define QUECTEL_PRODUCT_EM060K_12c		0x012c
 #define QUECTEL_PRODUCT_EG91			0x0191
 #define QUECTEL_PRODUCT_EG95			0x0195
 #define QUECTEL_PRODUCT_BG96			0x0296
@@ -1218,6 +1222,18 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_128, 0xff, 0xff, 0x30) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_128, 0xff, 0x00, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_128, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_129, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_129, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_129, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12a, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12a, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12a, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12b, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12b, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12b, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12c, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12c, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_12c, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0xff, 0x30) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0x00, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0xff, 0x40) },
-- 
2.25.1


