Return-Path: <linux-usb+bounces-5394-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB448838A79
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 10:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A35E1C23F98
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 09:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACE059B64;
	Tue, 23 Jan 2024 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HH0eKI5w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3AC59B5C
	for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706002822; cv=none; b=rNUnJDp3KoiJbZ2V/y2Q69f+kqDflOYnY41rMWDgvutjvE+Dzxj8SekyaPdnvMFDJKMyojpL4o3n4JVxJbhXx4A4HFVFs34wWDZqTHGAvxNj8/cJqCxtmcoXhP7K9JXvp5Br1Km2Vtb9oD4zjpk8Q4V3YCfLeG4Yt6CTtDn7fN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706002822; c=relaxed/simple;
	bh=EJ3sW/mCQWqkVnfSlqJV5cD7p+iwDADaEjL6TWjBN1I=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ebN8PNmKh1CVTaG3CG9pUm+QMOTxyTaAnA+jSphgZGY2uXKGqZuO5jVdnHsXDpzB5s+Pazd9jd8vn8QepSynReIv/MuczEWVFca0L9R4RDQWoJLmaFRI+H0p6jhwz4WjkEmdcGh0p4Fm0S+8vdnYsZuMKONDYJnTN9OQcecTRdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HH0eKI5w; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d5f252411aso21593155ad.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 01:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706002821; x=1706607621; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6pBxH4muU/wCLL3hDuth0skp07NXyCMBwBp6iP4UzE=;
        b=HH0eKI5wEcpJr9VOH5PEux2UMGISI/xxdOE8fqON8sH6wAhjV1FNEdJe8hb6p2vSFf
         AwCFh6U+NcvQCANc9iNTj5iZxCVpSiuRmDCvATP97xIJfC70qB8oyrBsPRysZ59xOJKN
         h4XX0B3qbMaajBBqCtcxNwmG47/zXTHpgqJFoCI6zBIY0NL7AS0kdeqqUv5LeQd4V2r3
         4DRiiZy64aSA/cUlWlv3YdUaaW07NPm/XrepAelrVs222bsUvZzlyWofCCru9D85sO12
         HC8BiP18qcuV6Z09GOFQJ1WH7l606q6VVvaf6nbpPuF9IM9iGPS6lDeyielj4jUSHUd0
         6A7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706002821; x=1706607621;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6pBxH4muU/wCLL3hDuth0skp07NXyCMBwBp6iP4UzE=;
        b=bbsV3ryAlDkrHESGCKm6101dDy/pigULEerNe7owmuSVLLGl69l8odZ36u+Qzj9ZI2
         Sz0mLQH5oOJZ92LiMFI/D83P0BI2y9mPj7QOCTaOM95eAecYfT0NlDWJx18FevyXGI3x
         JimKqyhD4kFxsRrkmFP7MX6HOBFMgxf7N2rP9hxvjk20T0dKPji5fr3KnmnexY3VuXcb
         RHM30SJ2aZZeuSAHpml/YPQPrKv/ij/hoJ99pyWCffizmcb8Gf3tAakkdIvVgId1MM8j
         3QN5RLHoHLN5ivisFVT2A33PtvTlScQzeFjv+IsZmgrJSz06DOMDe/PNxEEoa6qwghXk
         kQuw==
X-Gm-Message-State: AOJu0YxBpym52MvFSjcsx0lirH+KNNqD5mmmSgiTIM8wAfPr7AgT0+PQ
	Scu8/yXyxFq94M/NWN1eYvoVTIwCozKw/38EZ9NrD+fTdnmhrH3H
X-Google-Smtp-Source: AGHT+IECHuPipsJcdcNldo9j63/RrHw8yHb/JhbFcVF2rGduprnAbQS+YH2gAv5CYpHYOMTO0T3GZw==
X-Received: by 2002:a17:902:c402:b0:1d4:6429:4e1c with SMTP id k2-20020a170902c40200b001d464294e1cmr3869244plk.4.1706002820783;
        Tue, 23 Jan 2024 01:40:20 -0800 (PST)
Received: from localhost ([101.10.10.163])
        by smtp.gmail.com with ESMTPSA id ix7-20020a170902f80700b001d71c8871e1sm6827043plb.172.2024.01.23.01.40.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2024 01:40:20 -0800 (PST)
From: wojackbb@gmail.com
To: johan@kernel.org
Cc: linux-usb@vger.kernel.org,
	JackBB Wu <wojackbb@gmail.com>
Subject: [PATCH] USB: serial: qcserial: add new usb-id for Dell Wireless DW5826e
Date: Tue, 23 Jan 2024 17:39:48 +0800
Message-Id: <1706002788-19606-1-git-send-email-wojackbb@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: JackBB Wu <wojackbb@gmail.com>

Add support for Dell DW5826e with USB-id 0x413c:0x8217 & 0x413c:0x8218.

It is 0x413c:0x8217
T:  Bus=02 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=  4 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=413c ProdID=8217 Rev= 5.04
S:  Manufacturer=DELL
S:  Product=COMPAL Electronics EXM-G1A
S:  SerialNumber=359302940050401
C:* #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=qcserial
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=qcserial
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=qcserial
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:* If#= 8 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
E:  Ad=88(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

It is 0x413c:0x8218
T:  Bus=02 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=413c ProdID=8218 Rev= 0.00
S:  Manufacturer=DELL
S:  Product=COMPAL Electronics EXM-G1A
S:  SerialNumber=359302940050401
C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  2mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=qcserial
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: JackBB Wu <wojackbb@gmail.com>
---
 drivers/usb/serial/qcserial.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index b1e844b..703a9c5 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -184,6 +184,8 @@ static const struct usb_device_id id_table[] = {
 	{DEVICE_SWI(0x413c, 0x81d0)},   /* Dell Wireless 5819 */
 	{DEVICE_SWI(0x413c, 0x81d1)},   /* Dell Wireless 5818 */
 	{DEVICE_SWI(0x413c, 0x81d2)},   /* Dell Wireless 5818 */
+	{DEVICE_SWI(0x413c, 0x8217)},	/* Dell Wireless DW5826e */
+	{DEVICE_SWI(0x413c, 0x8218)},	/* Dell Wireless DW5826e QDL */
 
 	/* Huawei devices */
 	{DEVICE_HWI(0x03f0, 0x581d)},	/* HP lt4112 LTE/HSPA+ Gobi 4G Modem (Huawei me906e) */
-- 
2.7.4


