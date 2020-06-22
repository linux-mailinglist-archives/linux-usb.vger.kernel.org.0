Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5948D20435E
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 00:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730774AbgFVWPP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 18:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbgFVWPP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jun 2020 18:15:15 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D25C061573
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2020 15:15:14 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g2so10573599lfb.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2020 15:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+VqIBQR0rp7ZhSsu42GYUL1cnsRPk9RChZMbc9dtRoE=;
        b=hewY3Z+bwnR6XriiUiWFqQ73Fk2HZquOj9sNNu1ZWsXKl9aDafDXPAI3d7BxdnXZSU
         Q71FlFWDI+o/egz26JMGPMYss03iSvcQOexfbLV81zcFZ5BGSdblJdkJPHmqcoHvLHbZ
         /lkJSo5OGDXbVBcOGYDHF/9sJ8TDuGxNNJJ60Zgb41EBvxyUN9TRJYAlgytZ5DzpBBv5
         v6c8aiywU9Z9FWTh7KA0PmNd4PjudjYeD7dVIxlczP5v0qSTXwCxfEnIvVbg/ZT1Fi2f
         Oshri1w2SRTSgx0iXaPxESXB4bycju07Cl0Fqk7pI7QXkrktFD70nXxnpCYsRFWTGO1j
         niNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+VqIBQR0rp7ZhSsu42GYUL1cnsRPk9RChZMbc9dtRoE=;
        b=kIZco05PX9XK3DZpX/mJb2nrtCrzEy5YXgGr+3UJg3K8dT89YhNLFMVXNrim5oblsF
         8KAxOzC4/yLVr0BugkHvBNChbVWkmNhXquEhUAn6asr2BNkR5MtSPoosWpYIQGwFsk+T
         jETy6snPQwzM10WWOp8Ucwz6fFbjsArFB9erUV21FAERJbtiWDX3B9PqlFoOck5gQgAz
         rr5vVGf+X+QH1693G8ZAoadW9FsEZdWcLTpaPmqnvqgXKMxovyGfbZSltiltoL7a0mHz
         Inf1qYDD/ACXTWKvCtxCiI+vnK+TkNt0cBEEXSW5nUYDTbtQYkLz1UAl+Gwb+xvu5XKS
         m2BQ==
X-Gm-Message-State: AOAM531uZxJBaNmYisOIEvNHBALVodw9gy6+AD3WCh69uXNQPsSQgeja
        I7D+wnAhIa+X7c2n3RmB6WG+E93nFpgaWQ==
X-Google-Smtp-Source: ABdhPJxdz1PqiT+PStsJH1SUI2xXW0c4xaLLGMSgvg/+O8+3XQTzOdl3TJ+67rd1IYuIXExMi/wFrw==
X-Received: by 2002:a19:691c:: with SMTP id e28mr11064027lfc.131.1592864112904;
        Mon, 22 Jun 2020 15:15:12 -0700 (PDT)
Received: from localhost.localdomain (213-67-189-66-no148.tbcn.telia.com. [213.67.189.66])
        by smtp.gmail.com with ESMTPSA id v22sm2926098ljg.12.2020.06.22.15.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:15:12 -0700 (PDT)
From:   =?UTF-8?q?J=C3=B6rgen=20Storvist?= <jorgen.storvist@gmail.com>
To:     johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        =?UTF-8?q?J=C3=B6rgen=20Storvist?= <jorgen.storvist@gmail.com>
Subject: [PATCH] USB: serial: option: add GosunCn GM500 series
Date:   Tue, 23 Jun 2020 00:13:59 +0200
Message-Id: <20200622221359.16729-1-jorgen.storvist@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add USB IDs for GosunCn GM500 series cellular modules.

RNDIS config:
usb-devices
T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 12 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=305a ProdID=1404 Rev=03.18
S:  Manufacturer=Android
S:  Product=Android
S:  SerialNumber=
C:  #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 1 Cls=e0(wlcon) Sub=01 Prot=03 Driver=rndis_host
I:  If#=0x1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
I:  If#=0x2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option

MBIM config:
usb-devices
T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 11 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=305a ProdID=1405 Rev=03.18
S:  Manufacturer=Android
S:  Product=Android
S:  SerialNumber=
C:  #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
I:  If#=0x1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#=0x3 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
I:  If#=0x4 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim

ECM config:
usb-devices
T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 13 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=305a ProdID=1406 Rev=03.18
S:  Manufacturer=Android
S:  Product=Android
S:  SerialNumber=
C:  #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
I:  If#=0x1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#=0x3 Alt= 0 #EPs= 1 Cls=02(commc) Sub=06 Prot=00 Driver=cdc_ether
I:  If#=0x4 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether

Signed-off-by: Jörgen Storvist <jorgen.storvist@gmail.com>
---
 drivers/usb/serial/option.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 254a8bbee..ef5284153 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2028,6 +2028,9 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(4) | RSVD(5) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0105, 0xff),			/* Fibocom NL678 series */
 	  .driver_info = RSVD(6) },
+	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1404, 0xff) },			/* GosunCn GM500 RNDIS */
+	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1405, 0xff) },			/* GosunCn GM500 MBIM */
+	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1406, 0xff) },			/* GosunCn GM500 ECM/NCM */
 	{ } /* Terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, option_ids);
-- 
2.25.1

