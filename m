Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339056ABF1A
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 13:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCFMH7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 07:07:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjCFMH6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 07:07:58 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D51F6
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 04:07:56 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id cw28so37561506edb.5
        for <linux-usb@vger.kernel.org>; Mon, 06 Mar 2023 04:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678104475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyRZ01sUjiZYtp3exEpTK3bGIcYWKTpqvcLJ591WUHo=;
        b=cBUekGfpXYqpdIhBfy/B0Svc5ntQ6qHjNwzQLLNl20grx5MQlNbx4BcBeGJXTku/YS
         5FiFRSIEEyGWhJidxwW8E1f3LmiFwyy+ts6sB9itad+NUtlxqATM8crgtQn4Dp1L1u8T
         6UXfDYS/fvZ9ehBYZrBMzs6+nYbJD/VeEbIryeJSeuhCRgv3Bg7beO+2I4t3bZRG3bkt
         I3j/EaAUMeeQMLGV4xPcSiBvht2rYUmtqUy8Lh9JJ0+J03AdUsaqhj3q4PF8Eg7wgmpC
         bbGdCyHKT89RIaL6jpNSNkyURjqM04AGghxjIc+dwSfIoLmYba6ss8dyIkt0/TebckKv
         ZwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678104475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyRZ01sUjiZYtp3exEpTK3bGIcYWKTpqvcLJ591WUHo=;
        b=P/4odfrdCru2uRpWkV1Z7/zyKX9YAs/DxCqM/thELFCG9ZqI1gGZ8HXymUgMk/Jj+O
         F72vvJ60Xw8lEXvh3rwJCKmme1P7RtTIWaQ2V55BBXiAlDnyL9h4Xb1jzR/z/Idqr/+7
         u3vTSwfKkI0Eg081/VnZ4JqMSIqq+dRuqoQDiiRDEVIaRemV7XWuhNS/qpRpC5fPol+D
         rIZ++Rb1f5vDR3Xvac7+3zzTNjNxSuKD2ihzVP5TAzOQRCidbQog4ihUG1j/qceUWtge
         Dj89amcpTNMw45TMoy9f1U6zMtOXHZGf9GCDQ8McwqmocGTqwyGHktwQuZhTYky1y3+a
         BjkQ==
X-Gm-Message-State: AO0yUKWZdNiN72YEr2bVoIN+qHZn0nKD2mkJphYuXE4leScexdXWFPWc
        kW0Dmj45aGtdK9+RPezJmBk=
X-Google-Smtp-Source: AK7set/loz6M1G4AZpz+MziwuWYCgb3tQ59rWOovhRSUqtpvZ7nY4UJDV2i2rYYa7ac8tXTVR5pVbQ==
X-Received: by 2002:aa7:cd10:0:b0:4d4:9f84:557d with SMTP id b16-20020aa7cd10000000b004d49f84557dmr6524853edw.9.1678104474804;
        Mon, 06 Mar 2023 04:07:54 -0800 (PST)
Received: from labdl-itc-sw04.tmt.telital.com (host-217-57-98-66.business.telecomitalia.it. [217.57.98.66])
        by smtp.googlemail.com with ESMTPSA id u17-20020a50c2d1000000b004af759bc79asm5038899edf.7.2023.03.06.04.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 04:07:54 -0800 (PST)
From:   Enrico Sau <enrico.sau@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Enrico Sau <enrico.sau@gmail.com>
Subject: [PATCH 1/1] USB: serial: option: add Telit FE990 compositions
Date:   Mon,  6 Mar 2023 13:07:41 +0100
Message-Id: <20230306120741.198992-1-enrico.sau@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the following Telit FE990 compositions:

0x1080: tty, adb, rmnet, tty, tty, tty, tty
0x1081: tty, adb, mbim, tty, tty, tty, tty
0x1082: rndis, tty, adb, tty, tty, tty, tty
0x1083: tty, adb, ecm, tty, tty, tty, tty

Signed-off-by: Enrico Sau <enrico.sau@gmail.com>
---

This is the usb-devices output for all compositions:

T:  Bus=01 Lev=01 Prnt=01 Port=04 Cnt=02 Dev#= 12 Spd=480 MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1080 Rev=05.04
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FE990
S:  SerialNumber=9455d1d2
C:  #Ifs= 7 Cfg#= 1 Atr=80 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#=0x1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option

T:  Bus=01 Lev=01 Prnt=01 Port=04 Cnt=02 Dev#= 13 Spd=480 MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1081 Rev=05.04
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FE990
S:  SerialNumber=9455d1d2
C:  #Ifs= 8 Cfg#= 1 Atr=80 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#=0x1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#=0x2 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
I:  If#=0x3 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option

T:  Bus=01 Lev=01 Prnt=01 Port=04 Cnt=02 Dev#= 11 Spd=480 MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1082 Rev=05.04
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FE990
S:  SerialNumber=9455d1d2
C:  #Ifs= 8 Cfg#= 1 Atr=80 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=rndis_host
I:  If#=0x1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
I:  If#=0x2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#=0x3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option

T:  Bus=01 Lev=01 Prnt=01 Port=04 Cnt=02 Dev#= 14 Spd=480 MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1083 Rev=05.04
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FE990
S:  SerialNumber=9455d1d2
C:  #Ifs= 8 Cfg#= 1 Atr=80 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#=0x1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#=0x2 Alt= 0 #EPs= 1 Cls=02(commc) Sub=06 Prot=00 Driver=cdc_ether
I:  If#=0x3 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option

---
 drivers/usb/serial/option.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e6d8d9b35ad0..9520935bd502 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1300,6 +1300,14 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1075, 0xff),	/* Telit FN990 (PCIe) */
 	  .driver_info = RSVD(0) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1080, 0xff),	/* Telit FE990 (rmnet) */
+	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1081, 0xff),	/* Telit FE990 (MBIM) */
+	  .driver_info = NCTRL(0) | RSVD(1) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1082, 0xff),	/* Telit FE990 (RNDIS) */
+	  .driver_info = NCTRL(2) | RSVD(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1083, 0xff),	/* Telit FE990 (ECM) */
+	  .driver_info = RSVD(0) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(3) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910_DUAL_MODEM),
-- 
2.25.1

