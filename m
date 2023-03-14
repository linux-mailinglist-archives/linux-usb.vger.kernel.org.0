Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B908C6B8E0B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Mar 2023 10:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjCNJC3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Mar 2023 05:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjCNJC1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Mar 2023 05:02:27 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C7160D53
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 02:02:26 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id qa18-20020a17090b4fd200b0023750b675f5so19658882pjb.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678784546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L32LER5cX2zy/JoVIn8ovJAMA1GTiZpv3tMeZ8r4Ry4=;
        b=StTVDztL7wGoYltho1n8bN5sRO+rAD+cd73ClmO42HV9H5FU2i3Uzwb41zMZRBZHTM
         x8zUgLbQSki2rje3GXBIHc5B3907UVpWSPqoX+6M9dZ+feEba35w26G4KtLGjSLHRjtI
         j6EZ8wFwO71Hs0HpBzFocBq41reVnvcGLS1B0qoh85efEFXCHJYycvJ2WArEo6jy8mh4
         Z5D/RqyyWO/dSQMwMlMppgjkx8T791bqRQ4MvGMh6Bqpv4RAi2okudNTYKm/Gp5nKJIC
         JTnUhXpFWf8aG/nRHeK56GKhgxilOcsUX2BZgjvjCMcgyecYtUQ7F4o3zrq/otegmQMK
         rk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678784546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L32LER5cX2zy/JoVIn8ovJAMA1GTiZpv3tMeZ8r4Ry4=;
        b=utIcZ7FGwgTuslRPoGPCGlV8v80lnMwZL0jIgzeD8qld/JrHzzihdFJ345HbDohJe2
         GuJdSwO5AGVKb2moHeWfj7F8FBKdqId9ZqhJQGdu/8Ts9mtokrndi+5ShieLeVkvFc2U
         Ur8gFSySlSW+0s79erOXozp8zIWk5bOTD+Cw13iY+tdFoblprMfaYcrfLIatxzHqmMuH
         egAhDxGCvmAOPY5jNr4vN0qBrY/osyUTquCO195N7sVO9PkQgTSMrVY5MNrMB4Fqw7Oo
         UXV0EIxNqIi53B0e2ptAgwWcdvxBlsgMN8enJbBfabIMBvLU/OyytgItYZDl6Jst6M1i
         fAeA==
X-Gm-Message-State: AO0yUKUZCGi6WErd/1DOHP1KVKOi1nyTHKC5yYnNL73C/oTchjtLqOjr
        /w5ZuTeXa+R2OYZ3h3JWAbA=
X-Google-Smtp-Source: AK7set9NE55fuPt+rGjlU9Ko6I6nt3j2uL49qSIpXyihpIAs1tJTuAwV6xm9otx8a92XUMAlEgPn3w==
X-Received: by 2002:a17:90b:1c87:b0:234:d78:9b4c with SMTP id oo7-20020a17090b1c8700b002340d789b4cmr37356119pjb.18.1678784545730;
        Tue, 14 Mar 2023 02:02:25 -0700 (PDT)
Received: from labdl-itc-sw04.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.googlemail.com with ESMTPSA id g3-20020a170902740300b0019a8530c063sm1225755pll.102.2023.03.14.02.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 02:02:24 -0700 (PDT)
From:   Enrico Sau <enrico.sau@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Enrico Sau <enrico.sau@gmail.com>
Subject: [PATCH v2] USB: serial: option: add Telit FE990 compositions
Date:   Tue, 14 Mar 2023 10:00:59 +0100
Message-Id: <20230314090059.77876-1-enrico.sau@gmail.com>
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
Changes since v1:
- Fix NCTRL and RSVD interfaces for 0x1083 composition

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
index e6d8d9b35ad0..1621f66db25f 100644
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
+	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(3) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910_DUAL_MODEM),
-- 
2.25.1

