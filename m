Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0C04F65E6
	for <lists+linux-usb@lfdr.de>; Wed,  6 Apr 2022 18:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238003AbiDFQx0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 12:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238162AbiDFQw0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 12:52:26 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5BB14965E
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 07:16:22 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id dr20so4549640ejc.6
        for <linux-usb@vger.kernel.org>; Wed, 06 Apr 2022 07:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbzIuyFe7HuBwovzW6rzj7IpAL8unVWtjtF85Xvz4hY=;
        b=VvDoBUECOHffmG74EryH2HMwpk6j11Ib4ch8AaeKQ/HQBpN9kBeETSs4q245IlFK0x
         cVh0tg+Is8pUjIfHVFeKE6O9nGhWxViaQTIVvZ+S9G0L3k7fId0ZT+zcD7FK23hh0eb7
         FVd3vuzQDXS2VF/bTDhh1PoUB3JWoqrjWNXtTMoc0CohT87uS9HGg10AssJXCTCYf+Vg
         ZMHoHhu/nCFlxfElJs4+QP8R+0QEYPnJgWzKjE3Y9LnlrQ0iSGkA/2fwXX05ZbjyDnlo
         2//9MMt0Oj7HvlLMzNtWJXQfqrF1nXMdNejB0I0tyaTgJ3yqqJkUKMl5Zx77CkciIs9O
         hb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbzIuyFe7HuBwovzW6rzj7IpAL8unVWtjtF85Xvz4hY=;
        b=wnQu3uzjX/QIYzHuEPvtg4KyKbnfZ/yBzEaS/JWADkqKlXp9tgwLygEbPgMkonCODs
         YlEAul4LptakoBhXs9/eMgx6xbtHWNZM2AqSMXN7rn+6Otu4yYSSYRIQALOAgQpBc1dd
         qAP3+EGYnxHW7zMo5QavRKxiP9A6UsyoA/45/GCaOfqB9Lpy4289OAKBVQMlCMexl27n
         DSlL+iml4qNGkadgLaQg6Z4yjwXp1qERNjY0NjecnI0o5z7jFS7kyubl3N+WJN2tdyEV
         iaFvlJZXEXDIford4oayhIiDYKAmz3KQEh9Nn+7WR5hBqlo7VGaLHaB56Hkii1agXZee
         Qg4g==
X-Gm-Message-State: AOAM531ZdSA2i/SUPectMRLwm05LZumDqBQLh9ZPsdBQ1SHiTXg2NxNd
        b5WAEn057gLhsuZaRXPOd5VkFwQyOEM=
X-Google-Smtp-Source: ABdhPJx+G02umXsl3UMlqEOzk+/I97yKhPl3lZq4lSKz87ykxDqm1mDA7/PvT92l6Utn8D04R13JVg==
X-Received: by 2002:a17:907:3f02:b0:6e7:7172:4437 with SMTP id hq2-20020a1709073f0200b006e771724437mr8253010ejc.361.1649254579722;
        Wed, 06 Apr 2022 07:16:19 -0700 (PDT)
Received: from ThinkStation-P340.. (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id u5-20020a170906b10500b006ce6fa4f510sm6616808ejy.165.2022.04.06.07.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 07:16:19 -0700 (PDT)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] USB: serial: option: add Telit 0x1057, 0x1058, 0x1075 compositions
Date:   Wed,  6 Apr 2022 16:14:08 +0200
Message-Id: <20220406141408.580669-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for the following Telit FN980 and FN990 compositions:

0x1057: tty, adb, rmnet, tty, tty, tty, tty, tty
0x1058: tty, adb, tty, tty, tty, tty, tty
0x1075: adb, tty

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
Hi Johan,

following the usb-devices output for the compositions:

T:  Bus=02 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=  3 Spd=5000 MxCh= 0
D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1057 Rev=04.14
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN980m
S:  SerialNumber=3cbb984c
C:  #Ifs= 8 Cfg#= 1 Atr=80 MxPwr=896mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#=0x1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=(none)
I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x7 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option

T:  Bus=02 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1058 Rev=04.14
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN980m
S:  SerialNumber=3cbb984c
C:  #Ifs= 7 Cfg#= 1 Atr=80 MxPwr=896mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#=0x1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option

T:  Bus=02 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=  3 Spd=5000 MxCh= 0
D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1075 Rev=05.04
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN990
S:  SerialNumber=e78c1ba4
C:  #Ifs= 2 Cfg#= 1 Atr=80 MxPwr=896mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
I:  If#=0x1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option

Thanks,
Daniele
---
 drivers/usb/serial/option.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e7755d9cfc61..8e2fc232da10 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1217,6 +1217,10 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1056, 0xff),	/* Telit FD980 */
 	  .driver_info = NCTRL(2) | RSVD(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1057, 0xff),	/* Telit FN980 */
+	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1058, 0xff),	/* Telit FN980 (PCIe) */
+	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1060, 0xff),	/* Telit LN920 (rmnet) */
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1061, 0xff),	/* Telit LN920 (MBIM) */
@@ -1233,6 +1237,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(2) | RSVD(3) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1073, 0xff),	/* Telit FN990 (ECM) */
 	  .driver_info = NCTRL(0) | RSVD(1) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1075, 0xff),	/* Telit FN990 (PCIe) */
+	  .driver_info = RSVD(0) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(3) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910_DUAL_MODEM),
-- 
2.32.0

