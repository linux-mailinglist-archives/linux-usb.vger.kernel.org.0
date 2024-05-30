Return-Path: <linux-usb+bounces-10692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E3F8D46A3
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 10:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30E80B22F7C
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2024 08:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E487B145352;
	Thu, 30 May 2024 08:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyYxeRpu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5698176AD2
	for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717056251; cv=none; b=aY711M3x8up/kSEqUwbRG6vgii9X+gvTvJVCdIyaMj2/sHHTO/iad/QJw4CATLNAzaFzN+FORnhcsKtGOBo6S8jwdmVLYlLpvIlWBsnuZSZrB5B4+dRsAfXnSvLcR3YWvDf0vwsnM8393W/2ZofPJXbas9upZr2DhhcwZYimTEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717056251; c=relaxed/simple;
	bh=qI0cKTlD5LbnUACIni8mk+kSa8M2VFSd9o/r0b0QdxE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RNRCmJkuYLNjI2OD79ro/nWEN3KZg6MZsMLpq7NoAC3poup9ADRecELMOHzAXmE1ZamIYvWzUOdwzrGxKPv10McaSxPINV7bTOArhTRSODowp2k2LFlcG+xay+j8rPlNz/DJfNwGuy1iFImj+j0RdO6fGti7dYsf7TqjeBXr3+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyYxeRpu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4202cea9a2fso5928025e9.3
        for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 01:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717056248; x=1717661048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZHDci+jrp6zI9qfemsRVlE28sdFTotXiV4TkGC4dj4=;
        b=kyYxeRpuVTcsOT1zF8mdI/WPC9/S1gth9/18gDWp+NoMaNRhLij67pXaL7GzudVTq8
         2YmDHtmAsfQp3ZJOOg3MmbM7XkLEkzFZ8jEbO5ArY2+SD+KgXUmtjg65ZbRIfCZTufXF
         kz86JYavbkFnLFkFTUckyt45OZpJmsS8xkJLG3qCtH0QJl0W9DYnKCfeS4j5t6Nhzb/o
         0qBVBJt0fXzzowh3L1Zzm7s5H312UPEiYNm3RmEvpG+TFGILHb5Dy6G+MaZwn15fX7Oo
         buI9g11RGyxCwGtERr75x4T+0p8TNeItJrhxtIToZYeG4v1cii8Hq4r+RXoNrYA02q64
         mWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717056248; x=1717661048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZHDci+jrp6zI9qfemsRVlE28sdFTotXiV4TkGC4dj4=;
        b=fDK6UUPFbhm5plUIO7riB6uLhz8d8kQOmSeM6chTk/BqvTFL2WOlQR8Bb9XDDr6gRG
         kCJuEyDzboFjHyqptxiSOgoJW8mxTBDdkWTSmncUxuObqDn42LAYkNx4xMnfBMJC68Wu
         cmKsaH8HhMeE/r13T2YN2TWZks7FoAHRkMq2HTcRBEJjitKRD797FXjXhqZdIwdYzcZl
         KD6p8NJma8HQ1bySzQHHv/5BQvcVrAZW16/ssC+RRMIl+UxydkoBF86QhGLTZoui4l3T
         gmFP1cQYWlAn23SF5UM/PoHcgNYtRchmGg5/xF0Zzw+cwUI+V9xvgkzYNQIrQQeDHA8r
         4L2A==
X-Gm-Message-State: AOJu0YzXSNJeXHuK+NWFEqhBVz5q5/+PFBa8bdbTeN0Bs7fXX/LRCBV7
	cO63QZm91aurGiur4w5jNNgVY9npLyGaB+9o58UOJAbgoWdjeqBQQSSxFg==
X-Google-Smtp-Source: AGHT+IEq5tejThsfSL/QjfnEFU1LxaMKY3HAqQz0MCk+pJfn1kcNDsEKE4AQufkJIgEk8Vd28YHfOA==
X-Received: by 2002:a05:600c:3506:b0:418:ee30:3f92 with SMTP id 5b1f17b1804b1-421279243ebmr16068705e9.25.1717056247967;
        Thu, 30 May 2024 01:04:07 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com ([2a01:7d0:4800:7:25c:1566:b696:b0f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dbfe3268fsm1333476f8f.70.2024.05.30.01.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:04:07 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] USB: serial: option: add Telit generic core-dump composition
Date: Thu, 30 May 2024 10:00:53 +0200
Message-Id: <20240530080053.1094657-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following core-dump composition, used in different Telit modems:

0x9000: tty (sahara)
T:  Bus=03 Lev=01 Prnt=03 Port=07 Cnt=01 Dev#= 41 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=9000 Rev=00.00
S:  Manufacturer=Telit Cinterion
S:  Product=FN990-dump
S:  SerialNumber=e815bdde
C:  #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=2mA
I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 8a5846d4adf6..a58dd4ef461b 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1433,6 +1433,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(2) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x701b, 0xff),	/* Telit LE910R1 (ECM) */
 	  .driver_info = NCTRL(2) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x9000, 0xff),	/* Telit generic core-dump device */
+	  .driver_info = NCTRL(0) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9010),				/* Telit SBL FN980 flashing device */
 	  .driver_info = NCTRL(0) | ZLP },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9200),				/* Telit LE910S1 flashing device */
-- 
2.37.1


