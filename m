Return-Path: <linux-usb+bounces-16399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8629A37ED
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 10:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFC3DB22F95
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 08:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7D5189520;
	Fri, 18 Oct 2024 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKYgm6Am"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668BA18952C
	for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 08:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729238459; cv=none; b=ZfGkfKeXPAr9kWSib0iZKKuu+Ca7X9vc4FH/5Jn2JdNsAKfedxmwAvjMopHrswOn0y0HH9najpfgKrgmRVIanLXYeGAimmTkE2ytpo4ZrsAmtgxKwfTHU4aNKbL4ZJ1gi2qtbDbph8saqsGXkThV66wlil1DyyK5zI4CKx/UuAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729238459; c=relaxed/simple;
	bh=rMvzW/nwCmHb3QYh1mBWbjQpiQogZtfMtilaEUuVEKM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s5Y6pX10f37rrf1gCkwPmIs94cLJoBaaq2PLK4M46lwdPj0fkSqzwdVT8CP8kce3f2752ZMI5vJbPUAjDM4G0huCyU8RnDIK6eWIzb2TgUcp3QPfWTK1Cdrcwtg/k9u09DsxZUQ9Fgw/QMotI42hqgvMLQG9Zpc2IPnMfUDUkTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKYgm6Am; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20cb89a4e4cso12945395ad.3
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729238457; x=1729843257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2OfTtc8u6sOXUHjOGNQ6MZgsRxoOB2eKXVJ+A5NY/Sg=;
        b=aKYgm6Ami28DhtsvfrSL/Po19tCjf/wjVdaIcT4VD7sQz3gtMTc905w4w0I/IFZJvu
         2rn0BU84K7bWmapEF/B2lJZPA8/wfOi1FdO8LHUHIbRjwGURgOwtSLv33QqtCfjJzH8i
         vHAv8vN19z2TMTuZTTC+jiLScybxDF7FBRk158cTrbVQpXYSmCzXpmE+yu7lt276jsCB
         4L8KRWuJb/VWSYBqXuF8n/0XXZdumDv+qYiDgXsa0nIFxieTrf/FhmZZjOYIiBpRJqhN
         7QbGLuk+5b8NTU4lBDSB28j4c5CXFAVXldhRH5Rh8hYrEecEdxz9h6ReCRoJnFETWaLz
         ToJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729238457; x=1729843257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2OfTtc8u6sOXUHjOGNQ6MZgsRxoOB2eKXVJ+A5NY/Sg=;
        b=wZsHUn0GKouopGDxXp2kbXy107KyXlrNXlVmOxAiqbyEb+c4OCR2DfHv++EaAM+B9e
         rck2SVYf8rQmmbamVzT0/IbFWG5ys/CgKHSmHGpMCJHfPQk1HrBvez5ZTUR1Ek7L08rU
         k1ewae4aMouCU6VfTfk95ro2YlMstvjpBapqNyJ3+wJPQvah6g7yr/kwOOyx5zft3WeZ
         U0GFjdBxzX8wIJhDjZkRPsAX0YZzc+/hcMRMd0Rxg+YfpjyInyA2ctYJ8XWRdw4UpLqh
         cG2gTstf2W9GKBtRvCoTisjxMUnj2z6ge3MVeiOens5oxYLCm/31+MaY69g4eweLGb4c
         87+w==
X-Gm-Message-State: AOJu0YzPDV61sYDoIo6J88tqaXAkFbiXt0mBO0GockZovQVxKz3lZoJL
	X2SSNRDLcdzl74wk6JrVlsOsfaqOpGN5rSHDZc2lv5tBmXq/wx+Z061He4Vo
X-Google-Smtp-Source: AGHT+IHySLzQyl029wSzFCog2w/sZ8Q/mjbMu2xfiCWOM1uB0BtH1EyWVY5wdNAp+r3k7hEzIygYcg==
X-Received: by 2002:a17:902:ce88:b0:20c:a97d:cc7f with SMTP id d9443c01a7336-20e5a8fb24dmr27279945ad.41.1729238457286;
        Fri, 18 Oct 2024 01:00:57 -0700 (PDT)
Received: from localhost ([2402:7500:479:5c7a:4a5c:7794:109d:58b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a759817sm7602225ad.119.2024.10.18.01.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:00:56 -0700 (PDT)
From: wojackbb@gmail.com
To: linux-usb@vger.kernel.org
Cc: johan@kernel.org,
	Jack Wu <wojackbb@gmail.com>
Subject: [PATCH] Add support for Sierra Wireless EM86xx with USB-id 0x1199:0x90e5 & 0x1199:0x90e4.
Date: Fri, 18 Oct 2024 16:00:49 +0800
Message-Id: <20241018080049.23888-1-wojackbb@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jack Wu <wojackbb@gmail.com>

It is 0x1199:0x90e5
T:  Bus=03 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#= 14 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1199 ProdID=90e5 Rev= 5.15
S:  Manufacturer=Sierra Wireless, Incorporated
S:  Product=Semtech EM8695 Mobile Broadband Adapter
S:  SerialNumber=004403161882339
C:* #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=500mA
A:  FirstIf#=12 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=qcserial
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=qcserial
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
E:  Ad=85(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:* If#=12 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#=13 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
I:* If#=13 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

It is 0x1199:0x90e4
T:  Bus=03 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#= 16 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1199 ProdID=90e4 Rev= 0.00
S:  Manufacturer=Sierra Wireless, Incorporated
S:  SerialNumber=004403161882339
C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  2mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=qcserial
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: JackBB Wu <wojackbb@gmail.com>
---
 drivers/usb/serial/qcserial.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index 703a9c563557..bd0768e61b26 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -168,6 +168,8 @@ static const struct usb_device_id id_table[] = {
 	{DEVICE_SWI(0x1199, 0x90d2)},	/* Sierra Wireless EM9191 QDL */
 	{DEVICE_SWI(0x1199, 0xc080)},	/* Sierra Wireless EM7590 QDL */
 	{DEVICE_SWI(0x1199, 0xc081)},	/* Sierra Wireless EM7590 */
+	{DEVICE_SWI(0x1199, 0x90e4)},	/* Sierra Wireless EM86xx QDL*/
+	{DEVICE_SWI(0x1199, 0x90e5)},	/* Sierra Wireless EM86xx */
 	{DEVICE_SWI(0x413c, 0x81a2)},	/* Dell Wireless 5806 Gobi(TM) 4G LTE Mobile Broadband Card */
 	{DEVICE_SWI(0x413c, 0x81a3)},	/* Dell Wireless 5570 HSPA+ (42Mbps) Mobile Broadband Card */
 	{DEVICE_SWI(0x413c, 0x81a4)},	/* Dell Wireless 5570e HSPA+ (42Mbps) Mobile Broadband Card */
-- 
2.34.1


