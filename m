Return-Path: <linux-usb+bounces-11620-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D06916543
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 12:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 855E1B24AEC
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 10:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990D314A0BD;
	Tue, 25 Jun 2024 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKtVRKZc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF4C2572
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719311489; cv=none; b=hWuc1/jKz1iCIe6aoDa/ZS5BOjMx30j0AhYU7BiZ1XPArwJ+Dno6t65Q+6tgUwZRNP2CvqBTxIJNivukGccXGrz907dLa8ADNNPtSP6cyyQ1V0dl0HEVyhrCglKIneXmjuH0qCniQWOTzLoJVETJL/u6YGqPBVnE5Bikv+W4VBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719311489; c=relaxed/simple;
	bh=iqp82S1k4iv2uYdGkGSiQ+1AikcpsQXk2UGqNCRG31I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kb7NyCjIwCHogRE/sGY5wSo+aylpGSM4aRAhdeXEYjUaeMiFaTou1sftyo0BC39fodAtfhA2XAOL/jF41eYnF473zcK1af/eoTxsxAvk+UlneA2pfpugN3kTKrpu5j+Uw60EuOsNGOBtf5OZmxk0623RdW2e73zt+C/IeA5D8g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKtVRKZc; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57cb9a370ddso6064611a12.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 03:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719311485; x=1719916285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5AnxSiE6U2aFrYccNCSywDXIpbYYl48w1+S7T4V/Su4=;
        b=FKtVRKZcilOWAu51qZwwllP7dKnagNNmRCnYPb254a/SiR7z/M6fa8QmjmNpUtbYsz
         CWV86jOu33i33MYMH/7tlSXenjFGtfGcRb2xGSATG5++32iB56zgEz3bkcKS52PT3JBW
         xTR+vXVimQi05IDz6ng3jd/Yj0q6hWDlZcruXJ2IkGeuV/tD8DkbT/ABBrxQmEp01rhp
         2PRA8/ypCWhLSTZs7y6HAJY6VNeyxyH+tCc6PXRZmFGYruUzsi9TloTVl6pb4u+yGUYc
         Yf4NWVE9bnBdMEWzM1YRJJwqtwszBpFYiNYnTKVX69sagOBovEFAVzjgLz+JwR52pTU4
         sr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719311485; x=1719916285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AnxSiE6U2aFrYccNCSywDXIpbYYl48w1+S7T4V/Su4=;
        b=h5LHSFnacok9zKKUEWNULwR2TdX2F6YWRZ0njTBvvwxOoU5zajjNi7Y4VrC1ZkCMYQ
         u/cQ1ja84mYf3XnhQrDebj/SwR4CFKzvd1c/216RhNAH56MoQTvULWPBuDoiTlFu5DGu
         2vFLV9mED5DFy0Q4NEh2+Sxx0nfC8TdY5XRgjjjtMl5fPsWkxF9dEVrtH2NhkWXZIv3l
         NLSb9k1l+nbKqBs3OAcdfX6omS1golWeCLiYmjyh9LOdZtYNcCGwud8+BDoQDocpBb8w
         1ofxLVlTsf1RyVLFCEIHkecDWspR7BpAjUEOUzMyBUD+SzWauGzsdB/DLpjY9Qf24gUk
         8fbg==
X-Gm-Message-State: AOJu0Yx+Y6TbrQg7IriAgrs5H6T6ASXy8hAXOVLX9wFbvkydOBzSFfTX
	30Y/66Nu7Tubvsuc+C9kQhxvPgvJcxhj4k5hIKJbagHcuUlwWgFU
X-Google-Smtp-Source: AGHT+IH6L3FlIo/5p3oAZZ3tucGbG3r92H6bgcZM8u/sDLh03XG7c8HxWoXIX68LS7z2YK/99lo3lQ==
X-Received: by 2002:a17:906:1110:b0:a6f:63c7:3083 with SMTP id a640c23a62f3a-a7245b6dc79mr408482466b.13.1719311484501;
        Tue, 25 Jun 2024 03:31:24 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com ([2a01:7d0:4800:7:e733:8331:ea5b:c314])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fe813c3a6sm374871166b.146.2024.06.25.03.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 03:31:24 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] USB: serial: option: add Telit FN912 rmnet compositions
Date: Tue, 25 Jun 2024 12:27:16 +0200
Message-Id: <20240625102716.70515-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following Telit FN912 compositions:

0x3000: rmnet + tty (AT/NMEA) + tty (AT) + tty (diag)
T:  Bus=03 Lev=01 Prnt=03 Port=07 Cnt=01 Dev#=  8 Spd=480  MxCh= 0
D:  Ver= 2.01 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=3000 Rev=05.15
S:  Manufacturer=Telit Cinterion
S:  Product=FN912
S:  SerialNumber=92c4c4d8
C:  #Ifs= 4 Cfg#= 1 Atr=e0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

0x3001: rmnet + tty (AT) + tty (diag) + DPL (data packet logging) + adb
T:  Bus=03 Lev=01 Prnt=03 Port=07 Cnt=01 Dev#=  7 Spd=480  MxCh= 0
D:  Ver= 2.01 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=3001 Rev=05.15
S:  Manufacturer=Telit Cinterion
S:  Product=FN912
S:  SerialNumber=92c4c4d8
C:  #Ifs= 5 Cfg#= 1 Atr=e0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 3 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/usb/serial/option.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 8a5846d4adf6..68f2cf70948a 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1425,6 +1425,10 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1901, 0xff),	/* Telit LN940 (MBIM) */
 	  .driver_info = NCTRL(0) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x3000, 0xff),	/* Telit FN912 */
+	  .driver_info = RSVD(0) | NCTRL(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x3001, 0xff),	/* Telit FN912 */
+	  .driver_info = RSVD(0) | NCTRL(2) | RSVD(3) | RSVD(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x7010, 0xff),	/* Telit LE910-S1 (RNDIS) */
 	  .driver_info = NCTRL(2) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x7011, 0xff),	/* Telit LE910-S1 (ECM) */
-- 
2.37.1


