Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63BBB30FFBD
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 22:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbhBDVwZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 16:52:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbhBDVwU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Feb 2021 16:52:20 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3966FC061786
        for <linux-usb@vger.kernel.org>; Thu,  4 Feb 2021 13:51:40 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id m22so6870195lfg.5
        for <linux-usb@vger.kernel.org>; Thu, 04 Feb 2021 13:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ng2X5eRhhHWu3ager37VxGO6ynaqHZvXbkTeNyXieNg=;
        b=PjcfTnBv34cVtdx0xTONF4aFv1OxYSJA0tYxb/O2hz4bXxw6jpDjLRy/ln5jdXd3+3
         880iojh3DXvZI7DW8zk4ZwFj7obfcEDrzIkNG8NjIfQDHHUnWpbtCR5+nPZ5ORlw8CzM
         GkD0LS/l9Z1nSR5OdAgevqG+xLSwJCpRs3fiF6WpJ7WzX+94KA3UPLBmuJqAIeai6xHV
         E6Hq2u/g/t10lgIh/xIME70Co8QjU9HsdNAIyrOTGBmbwyrg14NH9h9lcvv8gg+0G6J3
         7At1z+6mrPKoumMtAawQoOGNQvKpdRrHtLo8sVlYNKciSXHj6CeLtSQbeBTDmToEukgy
         hKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ng2X5eRhhHWu3ager37VxGO6ynaqHZvXbkTeNyXieNg=;
        b=lrznMLlXqHWxDa+H4VquuRMPfU/VcC1/EKqN5SpsE2IhUe6yAnUfjzFuztVxnyb3xG
         DGyfoZI7c72q8NVqKzXDKCHkstW8ybhR2nQ4lsz3bgXoKv+AgK2cVqQuCHsVJ7UL004E
         edSTBo+8nV6OPZz67bo00f5ILSNgU/5D6zUhRiFI1tlrwYLvwrmezVrcjvcwh4tF471T
         vY5pb57lVbxynRZFdRlLp3Tf4JnGzP6bGLVZUNdbWP3dSQmVJjZ69sZEIrN89cVOkjm3
         VAkmN/4AvBTQXMZosrCJBYwvPljicFvn3l++jQYZIMbjhxjVYyH4dXYYJLDT82K7/G2+
         mtqg==
X-Gm-Message-State: AOAM533tSIBD7/zIea3m9QJ2+j4LnoIZDEPDU3LGd7KqP4FEEYFsvvt4
        bRIWVTit35L4++qwLjyIVGg32lDboiqoFg==
X-Google-Smtp-Source: ABdhPJw2Ekqc22WPzCPa9foxxoviaF9NhzyF8TjxrLMnKQy9NpwqOL3cV0kHX1qP+jN0w3ta+qITMA==
X-Received: by 2002:ac2:4a9c:: with SMTP id l28mr767148lfp.298.1612475496636;
        Thu, 04 Feb 2021 13:51:36 -0800 (PST)
Received: from rafiki.local (user-5-173-242-247.play-internet.pl. [5.173.242.247])
        by smtp.gmail.com with ESMTPSA id z2sm750906lfd.142.2021.02.04.13.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 13:51:35 -0800 (PST)
From:   Lech Perczak <lech.perczak@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Lech Perczak <lech.perczak@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Subject: [PATCH 2/2] usb: serial: option: add AT ports for ZTE P685M
Date:   Thu,  4 Feb 2021 22:51:30 +0100
Message-Id: <20210204215130.27656-1-lech.perczak@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Only 1st (DIAG) port was supported, support ports 1 (PCUI) and 2 (Modem)
on ff/00/00 too. Ports expose AT command interface.

The modem is used inside ZTE MF283+ router and carriers identify it as
such.
Interface mapping is:
0: QCDM, 1: AT (PCUI), 2: AT (Modem), 3: QMI, 4: ADB

T:  Bus=02 Lev=02 Prnt=02 Port=05 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
D:  Ver= 2.01 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=19d2 ProdID=1275 Rev=f0.00
S:  Manufacturer=ZTE,Incorporated
S:  Product=ZTE Technologies MSM
S:  SerialNumber=P685M510ZTED0000CP&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&0
C:* #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
E:  Ad=87(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Cc: Johan Hovold <johan@kernel.org>
Cc: Bjørn Mork <bjorn@mork.no>
Signed-off-by: Lech Perczak <lech.perczak@gmail.com>
---
 drivers/usb/serial/option.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 3fe959104311..087520afdbde 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1567,7 +1567,8 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1272, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1273, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1274, 0xff, 0xff, 0xff) },
-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1275, 0xff, 0xff, 0xff) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1275, 0xff, 0x00, 0x00) }, /* ZTE P685M AT */
+	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1275, 0xff, 0xff, 0xff) }, /* ZTE P685M QCDM */
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1276, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1277, 0xff, 0xff, 0xff) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1278, 0xff, 0xff, 0xff) },
-- 
2.20.1

