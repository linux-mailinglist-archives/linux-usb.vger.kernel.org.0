Return-Path: <linux-usb+bounces-29523-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12832BFC9C0
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 16:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEA9A6E1CD3
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 14:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511EC34C12E;
	Wed, 22 Oct 2025 14:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arcor.de header.i=@arcor.de header.b="EpWN9z/6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mr3.vodafonemail.de (mr3.vodafonemail.de [145.253.228.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2EB34C98D
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761143153; cv=none; b=nCl+nBkD2fQq2g+dhKgNTdZ2H9NTTdJ6p3pw3u/BKgbFZfNvi+6cwZvzjHuNiz8VuvOZW33ZassF+OPulnw7HPdmEqhDXZcIrGsFF4m2DRjGHcfjrNrSjb0BgJcOlYVgUQP3R0PpDOXUWPYdZG9Yrl9AK25H4E0jOQYb9OdD13k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761143153; c=relaxed/simple;
	bh=ESNqsLUnWltzX0uEDu/4tU5IPOA6jB0TlR5VmfSaQlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vw+NAuRmXndZsHvIw/JUTRexYTOmWuqdJZyAo9YsoirXrPAtNWDcF0pC9KVXc0iLQCKM6jqZQLmCOoxPIMMmID/vsYDn44BaR9TjEp1zWOQ3cacwacC986ONghUfwDe5+hByoxQX/0azwH9CMVNHZnRg8BqShiCQJqiWqSOWZAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arcor.de; spf=pass smtp.mailfrom=arcor.de; dkim=pass (1024-bit key) header.d=arcor.de header.i=@arcor.de header.b=EpWN9z/6; arc=none smtp.client-ip=145.253.228.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arcor.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arcor.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
	s=vfde-mb-mr2-23sep; t=1761142661;
	bh=2SFj8XGY2fJgd7GTO5PPHTrK61f5S1QvSXkPqXxHTKQ=;
	h=Date:From:To:Subject:Message-ID:Content-Type:From;
	b=EpWN9z/6iM707XON7e+wxjCca4upvFCQCWR7HwuKoo1ZHOBksLIhc6xCtLBD4o+uH
	 tJUrSejiac6mDYxHvy8emKKakLFivYNdDhimH5S0uwTn5YEnoWqH5LsPsqsHJoen7a
	 NIM2D9AXY/SXRBCM6Lx5Wr6/Mw8w3t6nQlkZsnX8=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr3.vodafonemail.de (Postfix) with ESMTPS id 4csB8538p1z2GP0;
	Wed, 22 Oct 2025 14:17:41 +0000 (UTC)
Received: from arcor.de (p5b2819fc.dip0.t-ipconnect.de [91.40.25.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4csB7y4xq3z8sXN;
	Wed, 22 Oct 2025 14:17:31 +0000 (UTC)
Date: Wed, 22 Oct 2025 16:17:26 +0200
From: Reinhard Speyerer <rspmn@arcor.de>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, Martin Hou <martin.hou@foxmail.com>
Subject: [PATCH] USB: serial: option: add Quectel RG255C
Message-ID: <aPjndlFsHptjejQ3@arcor.de>
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
X-purgate-size: 2573
X-purgate-ID: 155817::1761142661-E6DDB6B8-67505A01/0/0

Add support for Quectel RG255C devices to complement commit 5c964c8a97c1
("net: usb: qmi_wwan: add Quectel RG255C").
The composition is DM / NMEA / AT / QMI.

T:  Bus=01 Lev=02 Prnt=99 Port=01 Cnt=02 Dev#=110 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=2c7c ProdID=0316 Rev= 5.15
S:  Manufacturer=Quectel
S:  Product=RG255C-GL
S:  SerialNumber=xxxxxxxx
C:* #Ifs= 4 Cfg#= 1 Atr=a0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
E:  Ad=86(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>
---
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 62e984d20e59..a03f2c1429fd 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -273,6 +273,7 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_EM05CN			0x0312
 #define QUECTEL_PRODUCT_EM05G_GR		0x0313
 #define QUECTEL_PRODUCT_EM05G_RS		0x0314
+#define QUECTEL_PRODUCT_RG255C			0x0316
 #define QUECTEL_PRODUCT_EM12			0x0512
 #define QUECTEL_PRODUCT_RM500Q			0x0800
 #define QUECTEL_PRODUCT_RM520N			0x0801
@@ -1270,6 +1271,9 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500K, 0xff, 0x00, 0x00) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG650V, 0xff, 0xff, 0x30) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG650V, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG255C, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG255C, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG255C, 0xff, 0xff, 0x40) },
 
 	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6001) },
 	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CMU_300) },

