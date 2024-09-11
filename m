Return-Path: <linux-usb+bounces-14938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CD8974D9D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 10:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA1F3283E83
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 08:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA8E181310;
	Wed, 11 Sep 2024 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="mnR8d/RB"
X-Original-To: linux-usb@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7314A606
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044902; cv=none; b=Deqr1b/agFchDnBQO9mmRv20sPBa45h80g0fvS5R9SpSYL0zFu/X6kXZ/7GE8ILoLhWkyQJ0VGmsF9REeclHpPnjZyl3uDOjEHr0QgCohuxs4PGHIQnPJVqlHIa4rBmtdIMmYSTc2O7M0uMQ3isXoX+W1AXGIfDyWNSXkdS4AJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044902; c=relaxed/simple;
	bh=7CR3tzzt2tFHaC5ojE5e9dFcffNCnYnWifFTCXRideM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ox2IZXOCdV3FHc5zGO+LBpXSmhNCrhZwP07aPbSUmp7hRbsNY2St9kujhfmJPX9LSd8U/wWf4egXhqUk3NANoNeAQ5g6hWPjL39mHHYfyWvHAdIGpHr41AMZTgLXaRrkX5BCAODxG6mxLjRLOzOcfA2mWYtXq1Z/xmMw0KTpBQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=mnR8d/RB; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=wxtzHylNBHDnq7blg8wMXXRWkEN/2AVDaZxBD4AIqaU=; b=mnR8d/RB2zlZxLwPDh4BUEyeBU
	aD8NIprjbT18HhKfICiquPVmy4dwkYa4u+CzCmGT8FGZdhslu1DhQDjaHWtDmSZm++2M0S1pf4QVF
	WGcTVh8T58KmB4Mkb/5lIWDdBNeaVA0tg1NYYq4jnS5RzhJ6ruvRyZdt71+tQ4LkvliTBQoA2Pq1g
	SJPGdbGBMDU71NvGj+r/3uu6juLK9JyzbpeVDZrBOvXmGmqg+eUY4RJeasiVZUFOwKxatvGj5h/z6
	oq0BXfPVEqpi9LgxJLnp+DQH9CtPdPi4cfxv8fh6xUBC9UzsWXfacUP3kLx4O7Fzh/Q5gFKOuwtER
	nVk5jKuQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <benjamin@geanix.com>)
	id 1soJ7q-000Jy7-2M; Wed, 11 Sep 2024 10:54:58 +0200
Received: from [185.17.218.86] (helo=benjamin-ThinkPad.geanix.com)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <benjamin@geanix.com>)
	id 1soJ7p-0003yu-1b;
	Wed, 11 Sep 2024 10:54:57 +0200
From: "Benjamin B. Frost" <benjamin@geanix.com>
To: larsm17@gmail.com
Cc: sean@geanix.com,
	martin@geanix.com,
	johan@kernel.org,
	linux-usb@vger.kernel.org,
	"Benjamin B. Frost" <benjamin@geanix.com>
Subject: [PATCH v2] USB: serial: option: support for Quectel EG916Q-GL
Date: Wed, 11 Sep 2024 10:54:05 +0200
Message-Id: <20240911085405.319899-1-benjamin@geanix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d4b02fcb-6476-4a67-bc07-e6a224891b20@gmail.com>
References: <d4b02fcb-6476-4a67-bc07-e6a224891b20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: benjamin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27394/Tue Sep 10 10:30:36 2024)

Add Quectel EM916Q-GL with product ID 0x6007

T:  Bus=01 Lev=02 Prnt=02 Port=01 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=2c7c ProdID=6007 Rev= 2.00
S:  Manufacturer=Quectel
S:  Product=EG916Q-GL
C:* #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=200mA
A:  FirstIf#= 4 IfCount= 2 Cls=02(comm.) Sub=06 Prot=00
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=82(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=06 Prot=00 Driver=cdc_ether
E:  Ad=88(I) Atr=03(Int.) MxPS=  32 Ivl=32ms
I:  If#= 5 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
I:* If#= 5 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms


Signed-off-by: Benjamin B. Frost <benjamin@geanix.com>
---

V1 -> V2: Change as suggested by Lars has been implemented.
Using USB_DEVICE_AND_INTERFACE_INFO instead of USB_DEVICE.
Thank you for letting me know.

 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 176f38750ad5..e47a12c81a2f 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -279,6 +279,7 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_EG912Y			0x6001
 #define QUECTEL_PRODUCT_EC200S_CN		0x6002
 #define QUECTEL_PRODUCT_EC200A			0x6005
+#define QUECTEL_PRODUCT_EG916Q			0x6007
 #define QUECTEL_PRODUCT_EM061K_LWW		0x6008
 #define QUECTEL_PRODUCT_EM061K_LCN		0x6009
 #define QUECTEL_PRODUCT_EC200T			0x6026
@@ -1271,6 +1272,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC200T, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG912Y, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500K, 0xff, 0x00, 0x00) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG916Q, 0xff, 0x00, 0x00) },
 
 	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6001) },
 	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CMU_300) },
-- 
2.34.1


