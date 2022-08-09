Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E30D758D808
	for <lists+linux-usb@lfdr.de>; Tue,  9 Aug 2022 13:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240367AbiHIL3X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Aug 2022 07:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239475AbiHIL3W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Aug 2022 07:29:22 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE13719292
        for <linux-usb@vger.kernel.org>; Tue,  9 Aug 2022 04:29:20 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w3so14742024edc.2
        for <linux-usb@vger.kernel.org>; Tue, 09 Aug 2022 04:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=2cUgeYx3McM3tXKDmqyq/ayi2w9B/n/N7WgjIpdTx7c=;
        b=HfPaBEq/UlOPVPTxie3DZAKnb4RNXfJ5NBle9MyYGR7/3yJubTvucKSba3aRplEsVk
         sUK81GCdqH5Xym1arXfXkKvZ1DYhfprEqGTPJvQX3DXEE11rf6F/XvH7Paq7w81ODnMl
         lnAATORs1NmGkdXBD9ss6ARk157AUqgm+1cGPkZgdvxiU8C539Xx+PLTiPMPSe8wWN9x
         RBAaR/+o3z3KhyHa+CBrosaBJvIvk/1W4ayCdd7U6lNVn3saDg3vR/k2yLgAUeb7F7rH
         9Q+vPsfvDKh5AO2NfRXdKOROWheaoA8zznAolQDUMPotyV3+0AKgb7zadEetfB4j00En
         yFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=2cUgeYx3McM3tXKDmqyq/ayi2w9B/n/N7WgjIpdTx7c=;
        b=ohXFog22TPIGBKBaKpIOcTqJFuvv204qlrWpO1P3mUgq7BDdaQ9XstkaagQZw8Eorm
         lUBVxweTr+yRR38qyA/RWlMueCmfrw4hW4qs7N5Y+wBUaAzJvscu4vSrcEa8QOxgAK9B
         ezieq2z5fGhKloduPDscWJ9SbT49qVdVjRvHkkOzp1Eks8YkTeEwgEivMd4ElHRz/r8s
         xbDHMvLVhyMzFhBiobBRF0tQajgySqHp2lYha6yPr7/49f9UBV/g/XFV5yGgwOm1PNvt
         rrUKmUMkyE4I7VFq8BqA8MRGI+8NO0Pl/zUHjueIYf9z8BGDgoj/jrOG4Ek/4jbNyIBP
         G32Q==
X-Gm-Message-State: ACgBeo2Tg71+/59YXFYGwVikHgtotpnv8m2XJ2kfVUwGq8FD9mDlnXSi
        v2TPXo9ujcPnDX5vAIdEFdJzPzM4oCwdhcRD
X-Google-Smtp-Source: AA6agR5gje2xvsq43D/cPFFEGHBP0yzLDN1nGEZogRACEYgg95tO+vow7oUi1Ct60cRFRw5n2TbC/g==
X-Received: by 2002:a05:6402:1a3a:b0:43c:c4e5:8ebe with SMTP id be26-20020a0564021a3a00b0043cc4e58ebemr21987800edb.97.1660044558962;
        Tue, 09 Aug 2022 04:29:18 -0700 (PDT)
Received: from localhost.localdomain (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id bk25-20020a170906b0d900b00731335b7ceasm1051914ejb.14.2022.08.09.04.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:29:18 -0700 (PDT)
From:   Witold Lipieta <witold.lipieta@thaumatec.com>
To:     USB development list <linux-usb@vger.kernel.org>
Cc:     Witold Lipieta <witold.lipieta@thaumatec.com>
Subject: [PATCH] usb-storage: Add ignore-residue quirk for NXP PN7462AU
Date:   Tue,  9 Aug 2022 13:29:11 +0200
Message-Id: <20220809112911.462776-1-witold.lipieta@thaumatec.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is USB mass storage primary boot loader for code download on
NXP PN7462AU.

Without the quirk it is impossible to write whole memory at once as
device restarts during the write due to bogus residue values reported.

Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
---
Output from /sys/kernel/debug/usb/devices:
T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  4 Spd=12   MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1fc9 ProdID=0117 Rev= 1.00
S:  Manufacturer=NXP
S:  Product=PN7462AU
C:* #Ifs= 1 Cfg#= 1 Atr=c0 MxPwr=100mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
E:  Ad=81(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
 drivers/usb/storage/unusual_devs.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index b6a9a7451620..ee6923b6ab31 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -2265,6 +2265,13 @@ UNUSUAL_DEV( 0x1e74, 0x4621, 0x0000, 0x0000,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_BULK_IGNORE_TAG | US_FL_MAX_SECTORS_64 ),
 
+/* Reported by Witold Lipieta <witold.lipieta@thaumatec.com> */
+UNUSUAL_DEV( 0x1fc9, 0x0117, 0x0100, 0x0100,
+		"NXP Semiconductors",
+		"PN7462AU",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_RESIDUE ),
+
 /* Supplied with some Castlewood ORB removable drives */
 UNUSUAL_DEV(  0x2027, 0xa001, 0x0000, 0x9999,
 		"Double-H Technology",
-- 
2.34.1

