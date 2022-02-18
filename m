Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2874BBA47
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 14:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235832AbiBRNqZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 08:46:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbiBRNqY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 08:46:24 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F33898CC
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 05:46:07 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a23so15199762eju.3
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 05:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=8Rgx+5ksIswrRAZGrWzLO6Z/++Gmp5E8CGNbb61JSfA=;
        b=MO1it2kxAUfsyDdyRNeDpNQgkUTvwXVamH+y9A8ZEiQ34YIXjH4Ut+kJqpVL76adq9
         XlBAzTd6H/M6jz1IJjr+kG7arsoDn3aj4lBQKRrRidSqXw30el+Mhe187uHzHXsuE7F+
         zaih3QQmi3PXTdPSoQ/b6+oOrlhERIeHVg+FNafyczVB0UiJAXnyHd7Wtw+JCAiYsR4+
         8rNhHnzXZ0AeSDqv1+XYmZ6FEMbuIEtKF5G+2Phu3SSwKYtqiqu16geD+hxy/xTYoejk
         GmRf5CD8kwM5/5gENGNmItOgtx35sR/mlAe3UmjfXq3h4OXJZ4XYtBjVuUktbCjoK/x3
         yNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8Rgx+5ksIswrRAZGrWzLO6Z/++Gmp5E8CGNbb61JSfA=;
        b=sNmgJuzt77nCcgQAqnJo8Jts0olKbJMKqZSmkVqs4WqguKcdnxoKSZy7/1XJgcH0mo
         UUSmFzxZ/tii3cphyAjU9m92ghE/ZYA7fc1esiFQ1HbDZ5ASdTfrEV2T18rWqe3rr1XT
         l2gwN2yJSH4UiRTDrDqgRKzosQP8NhlxV75DbKYqiG/Qs3cBG2CfBgRi0afAsBUOYa6O
         QLTE6RzpJZExDz0/udcwEkdmsNRagTe/wHrhIQWUAx6Fucwi3odwVI131iMIrl5BzOGk
         ZK71Hs0ZaCAmjaPsbcHeEqC0zIs7EaKhkVwacqCtzC9orydO9U+iOQxE/BzgQkTVvLm3
         WQlQ==
X-Gm-Message-State: AOAM530jCl0VE+ObYNSfQJjtY1VuOoo5+O1ABiALIrJHC1yNOim1s9Zu
        KHRhGgVQfdNN+hCWG1CLinLEuWTxxGM=
X-Google-Smtp-Source: ABdhPJwOr0Rp3UE1ysbNVHWnpFRPutOfmg1e8fvfbf+x44cAY0s85vLF49VCesnDMTA74QQ2rAEstQ==
X-Received: by 2002:a17:906:35d5:b0:6b7:faf7:9611 with SMTP id p21-20020a17090635d500b006b7faf79611mr6577819ejb.537.1645191965860;
        Fri, 18 Feb 2022 05:46:05 -0800 (PST)
Received: from LABNL-ITC-SW01.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id b4sm2080130edu.105.2022.02.18.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 05:46:05 -0800 (PST)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] USB: serial: option: add Telit LE910R1 compositions
Date:   Fri, 18 Feb 2022 14:45:52 +0100
Message-Id: <20220218134552.4051-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for the following Telit LE910R1 compositions:

0x701a: rndis, tty, tty, tty
0x701b: ecm, tty, tty, tty
0x9201: tty

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
Hi Johan,

following the output of usb-devices for the compositions:

T:  Bus=01 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=  6 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=701a Rev=01.00
S:  Manufacturer=Marvell
S:  Product=Mobile Composite Device Bus
S:  SerialNumber=200806006809080000
C:  #Ifs= 5 Cfg#= 1 Atr=c0 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 1 Cls=e0(wlcon) Sub=01 Prot=03 Driver=rndis_host
I:  If#=0x1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
I:  If#=0x2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option

T:  Bus=01 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=  8 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=701b Rev=01.00
S:  Manufacturer=ASRMicro
S:  Product=Mobile Composite Device Bus
S:  SerialNumber=200806006809080000
C:  #Ifs= 5 Cfg#= 1 Atr=c0 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=06 Prot=00 Driver=cdc_ether
I:  If#=0x1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
I:  If#=0x2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option

T:  Bus=01 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#= 10 Spd=480 MxCh= 0
D:  Ver= 1.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=9201 Rev=01.00
S:  Manufacturer=Marvell
S:  Product=Telit Download Port
S:  SerialNumber=200806006809080000
C:  #Ifs= 1 Cfg#= 1 Atr=c0 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option

Thanks,
Daniele
---
 drivers/usb/serial/option.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 962e9943fc20..fa1ad626f9fb 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1273,10 +1273,16 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(2) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x7011, 0xff),	/* Telit LE910-S1 (ECM) */
 	  .driver_info = NCTRL(2) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x701a, 0xff),	/* Telit LE910R1 (RNDIS) */
+	  .driver_info = NCTRL(2) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x701b, 0xff),	/* Telit LE910R1 (ECM) */
+	  .driver_info = NCTRL(2) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9010),				/* Telit SBL FN980 flashing device */
 	  .driver_info = NCTRL(0) | ZLP },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9200),				/* Telit LE910S1 flashing device */
 	  .driver_info = NCTRL(0) | ZLP },
+	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9201),				/* Telit LE910R1 flashing device */
+	  .driver_info = NCTRL(0) | ZLP },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF622, 0xff, 0xff, 0xff) }, /* ZTE WCDMA products */
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0002, 0xff, 0xff, 0xff),
 	  .driver_info = RSVD(1) },
-- 
2.32.0

