Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0787255CA40
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243293AbiF1Bxa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 21:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243287AbiF1Bxa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 21:53:30 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E98B496
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 18:53:28 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k9so1423666pfg.5
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 18:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wistron-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qmNe/0N3fselmjXx6WkFjhVxkRMv0d5IBKx3lO9MXkg=;
        b=UNsaSKXvhyPVTm2DEwZmNzWe7Vo+++Awnh+gFpClAhy8HlwHpzG+Z7zhxPZUfRnGd1
         HIhvVUFI2ADEGsu/vdM3ow/HGbzT39WdDv889cAipONE3vkMNNvNbM575X6paPnFIdiz
         uNT6eoVqGOWH4FFCft2z+0fMfknGqU8mzrsuaCRH41kNFt1oz4DY2SemNRfnJzGfXK8v
         0cUIcuoIiB7UMXfk3o3ULwjBAzGxSBPrmGLLSR2Np2KAsfCEVI278jMtfMrxuQvxPHLf
         5r0keiF+noXuTUWL6DdZt4O7DWkG8hQsPhi3PzsYSBaV8shxUwQgle1zidnE2kuL56PN
         lhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qmNe/0N3fselmjXx6WkFjhVxkRMv0d5IBKx3lO9MXkg=;
        b=x1glbUefN8W5sccBKLcJlQUi4Z4QkVx4EmUw8bB+FINFnYmc7FeEP5w+etxGbTB7t7
         DSySBVQBS17LB7G/JJr00LalcGbGV3/vcm+4wiFtvICIZN1ssLG88GzibNnQxxejZUBE
         rYu5c/zVbX8dV3GfYpppzMR5Ek975wkEjZTKi/Cko/kRTBns4PsLHxw99ga7SQvgNxSB
         AYlVje1K6iDFxdQxTO8KdYcdgCx2fLEyvnaY/erSwdBSyEu+oO7ONPBqu/vg/EJOhyn8
         yu7LkYAAFfeKBT57ql7ZOmGgaqM2b1j7MfP2pXVqpOLLhPBlJ++z+B00hZVMNRAgdh0k
         5v5A==
X-Gm-Message-State: AJIora+pgIMfxEnmb44KpzyfXSUrguLgqcdfJqwakmTIC3h69psAH3Wa
        J9ZEfJLqfDYCybcILfEb1XjbFg==
X-Google-Smtp-Source: AGRyM1sEdmmSKiRug0JES0Mnz8bDifIHsM4ASO0PiDH35MxEPibvVHpL9D6WFZFnmA3BbqsrIvSibA==
X-Received: by 2002:a63:ae48:0:b0:40c:3775:8b49 with SMTP id e8-20020a63ae48000000b0040c37758b49mr15259472pgp.268.1656381208345;
        Mon, 27 Jun 2022 18:53:28 -0700 (PDT)
Received: from localhost (1-164-249-67.dynamic-ip.hinet.net. [1.164.249.67])
        by smtp.gmail.com with ESMTPSA id 11-20020a63164b000000b0040d4c8e335csm7722004pgw.75.2022.06.27.18.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 18:53:28 -0700 (PDT)
From:   Franklin Lin <franklin_lin@wistron.corp-partner.google.com>
To:     edumazet@google.com
Cc:     kuba@kernel.org, pabeni@redhat.com, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        davem@davemloft.net, franklin_lin@wistron.com,
        franklin_lin <franklin_lin@wistron.corp-partner.google.com>
Subject: [PATCH] drivers/net/usb/r8152: Enable MAC address passthru support
Date:   Tue, 28 Jun 2022 09:53:25 +0800
Message-Id: <20220628015325.1204234-1-franklin_lin@wistron.corp-partner.google.com>
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

From: franklin_lin <franklin_lin@wistron.corp-partner.google.com>

Enable the support for providing a MAC address
for a dock to use based on the VPD values set in the platform.

Signed-off-by: franklin_lin <franklin_lin@wistron.corp-partner.google.com>
---
 drivers/net/usb/r8152.c | 49 ++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 7389d6ef8..732e48d99 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -3,6 +3,7 @@
  *  Copyright (c) 2014 Realtek Semiconductor Corp. All rights reserved.
  */
 
+#include <linux/fs.h>
 #include <linux/signal.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -1608,6 +1609,11 @@ static int vendor_mac_passthru_addr_read(struct r8152 *tp, struct sockaddr *sa)
 	acpi_object_type mac_obj_type;
 	int mac_strlen;
 
+	struct file *fp;
+	unsigned char read_buf[32];
+	loff_t f_pos = 0;
+	int i, j, len;
+
 	if (tp->lenovo_macpassthru) {
 		mac_obj_name = "\\MACA";
 		mac_obj_type = ACPI_TYPE_STRING;
@@ -1641,22 +1647,39 @@ static int vendor_mac_passthru_addr_read(struct r8152 *tp, struct sockaddr *sa)
 	/* returns _AUXMAC_#AABBCCDDEEFF# */
 	status = acpi_evaluate_object(NULL, mac_obj_name, NULL, &buffer);
 	obj = (union acpi_object *)buffer.pointer;
-	if (!ACPI_SUCCESS(status))
-		return -ENODEV;
-	if (obj->type != mac_obj_type || obj->string.length != mac_strlen) {
-		netif_warn(tp, probe, tp->netdev,
+	if (ACPI_SUCCESS(status)) {
+		if (obj->type != mac_obj_type || obj->string.length != mac_strlen) {
+			netif_warn(tp, probe, tp->netdev,
 			   "Invalid buffer for pass-thru MAC addr: (%d, %d)\n",
 			   obj->type, obj->string.length);
-		goto amacout;
-	}
-
-	if (strncmp(obj->string.pointer, "_AUXMAC_#", 9) != 0 ||
-	    strncmp(obj->string.pointer + 0x15, "#", 1) != 0) {
-		netif_warn(tp, probe, tp->netdev,
-			   "Invalid header when reading pass-thru MAC addr\n");
-		goto amacout;
+			goto amacout;
+		}
+		if (strncmp(obj->string.pointer, "_AUXMAC_#", 9) != 0 ||
+			strncmp(obj->string.pointer + 0x15, "#", 1) != 0) {
+			netif_warn(tp, probe, tp->netdev,
+				"Invalid header when reading pass-thru MAC addr\n");
+			goto amacout;
+		}
+		ret = hex2bin(buf, obj->string.pointer + 9, 6);
+	} else {
+		/* read from "/sys/firmware/vpd/ro/dock_mac" */
+		fp = filp_open("/sys/firmware/vpd/ro/dock_mac", O_RDONLY, 0);
+		if (IS_ERR(fp))
+			return -ENOENT;
+		kernel_read(fp, read_buf, 32, &f_pos);
+		len = strlen(read_buf);
+		/* remove ':' form mac address string */
+		for (i = 0; i < len; i++) {
+			if (read_buf[i] == ':') {
+				for (j = i; j < len; j++)
+					read_buf[j] = read_buf[j+1];
+				len--;
+				i--;
+			}
+		}
+		filp_close(fp, NULL);
+		ret = hex2bin(buf, read_buf, 6);
 	}
-	ret = hex2bin(buf, obj->string.pointer + 9, 6);
 	if (!(ret == 0 && is_valid_ether_addr(buf))) {
 		netif_warn(tp, probe, tp->netdev,
 			   "Invalid MAC for pass-thru MAC addr: %d, %pM\n",
-- 
2.34.1

