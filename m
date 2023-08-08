Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09F28774593
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 20:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233748AbjHHSnh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 14:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233592AbjHHSnV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 14:43:21 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43811387CA
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 09:37:49 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe10f0f4d1so9727218e87.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Aug 2023 09:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691512644; x=1692117444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A6LfCAMj0DFAFgXZ5oRgcMXEYEXLBhRELRNEOdU8pto=;
        b=gTPysjpvBSz7i325J9Uc7ujkJFq16hrEQex/LtXLbHZ+wBkB6n4RvpRnBcYPOyHPTI
         FYNnuSvP/JfRUd5ghr7fPg5S/fCafPu9n9J2KiUUvqooUOZ6jw2kajgTSHXFMvLDmFfp
         8/OcyKKyF+M+HEHjlrjCO43WfSGsSjAn52jLd76bBd2Ry2vT8b9HvrToIK3XnXyyiHfY
         R3uivCerAy899iyTX+B158TVe5s90UlmwVj1+n0jV0ngYsJB3lHR+OJHiQPNrvhYQNup
         lQ7sC5e6gC94wOOCtrOn01D5G9obAeGkzpCQjDvWOTi4SpTJbKjhAARa072wZ5XoUX+F
         rJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512644; x=1692117444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6LfCAMj0DFAFgXZ5oRgcMXEYEXLBhRELRNEOdU8pto=;
        b=GQqUqOu9Bl+fXiZVpEmMQ84cIkO0AI0wYqZnuUUQAx4u4Qx0W9nAIabQ15rL+4KaK0
         LJlzvGwyMW9XIVx7Grw8qR6dMxoBk9PoevVJtoxYez4CpLvy5YjakYTqUCGY6rxYPMmN
         Kb5Aug8U04v5vx/a9AfVxlFpkiEBgGz1Q8OqFup2N5Zl8bop03wbpB14P90bxq1A46oi
         0D2Z6fVFAVeDAucKrDb/OCIS42XFADawtcbwtlsDHAGRT9v7oE1ODBntxqIXNV4mjHi4
         6/HSKr6tInKJm4FTqd6xxSoMeNSYWVZngYW9zofMAwbwGblSzfAsOCQy46bLj4L9x0S5
         0iMg==
X-Gm-Message-State: AOJu0Yy593MjzwPcgp67uPlxULVsMOFkuP2f2LinBWHnge1xVSFMkohx
        jPOoAXS9WHRJYXQSNMEu7apvGxd8NShbS7cW
X-Google-Smtp-Source: AGHT+IGW9Ialzh0UtEfgQ/NUlrxfMl+JvOwGOmx807BHruxTqgrFB1wO8FtSUuOq7S5R+/RKKpuMcQ==
X-Received: by 2002:adf:dd83:0:b0:317:4755:9e48 with SMTP id x3-20020adfdd83000000b0031747559e48mr7053045wrl.53.1691491952555;
        Tue, 08 Aug 2023 03:52:32 -0700 (PDT)
Received: from localhost.localdomain ([31.145.189.2])
        by smtp.googlemail.com with ESMTPSA id t6-20020a5d6a46000000b003142e438e8csm13265709wrw.26.2023.08.08.03.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 03:52:31 -0700 (PDT)
From:   Alper Ak <alperyasinak1@gmail.com>
To:     johan@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH] USB: serial: option: add Quectel EG912Y module support
Date:   Tue,  8 Aug 2023 13:51:58 +0300
Message-Id: <20230808105158.631761-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add Quectel EG912Y "DIAG, AT, MODEM"

0x6001: ECM / RNDIS + DIAG + AT + MODEM

T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=2c7c ProdID=6001 Rev= 3.18
S:  Manufacturer=Android
S:  Product=Android
S:  SerialNumber=0000
C:* #Ifs= 5 Cfg#= 1 Atr=e0 MxPwr=500mA
A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=06 Prot=00
I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=06 Prot=00 Driver=cdc_ether
E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0c(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0b(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=89(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0a(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 8ac98e60fff5..5a132dd0a9cf 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -274,6 +274,7 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_EM061K_LCN		0x6009
 #define QUECTEL_PRODUCT_EC200T			0x6026
 #define QUECTEL_PRODUCT_RM500K			0x7001
+#define QUECTEL_PRODUCT_EG912Y			0x6001
 
 #define CMOTECH_VENDOR_ID			0x16d8
 #define CMOTECH_PRODUCT_6001			0x6001
@@ -1235,6 +1236,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC200S_CN, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC200T, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500K, 0xff, 0x00, 0x00) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG912Y, 0xff, 0, 0) },
 
 	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6001) },
 	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CMU_300) },
-- 
2.25.1

