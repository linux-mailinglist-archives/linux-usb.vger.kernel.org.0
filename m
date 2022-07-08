Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E37756B917
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jul 2022 14:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238234AbiGHL7I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jul 2022 07:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238119AbiGHL7H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jul 2022 07:59:07 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA519A698
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 04:59:06 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id o4so30241649wrh.3
        for <linux-usb@vger.kernel.org>; Fri, 08 Jul 2022 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dzKDE1uBJvt2gX7ZdYoRvRdyIdUe1nxk3awvgL9qY+Y=;
        b=FlI4u6OWNlz86YzZ7RhIO5/Jd7v00zipXBQw0NWdgB7zaD48hygY7HRQZ3P012Upot
         n69jIyfqiWMfviN2yitSkOLkZM4QD+ERvVfi3Zwhs74C8rU1krOPy9dR7Naa5OIfO2sB
         88o+mcgAQyv6mZgUxJ4ylfCnlCdY5e5W9z0Cx0VufpvgoigdFY+zwf1MB2cc6lSUUvKS
         +WZWot1jzGMMLWFt/4e3jTnvkQaq3yRnlXf+E+fvYKGZ69IGmKMx0MceLJdcr1t9f6ls
         Il1rHmZhD3DOSV5yyMPypydymb8N6f3mRIy1jfYXxOdKDM9xqUlYVXd/cZd/tlaPfkrh
         tnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dzKDE1uBJvt2gX7ZdYoRvRdyIdUe1nxk3awvgL9qY+Y=;
        b=Ef/uDDxD6Rjf3ZdIzhAtoVaLN6tG9Gynk/M+akRfSFIIABU0gb0o3TGZ+7nH82+1f3
         dlBAu3pWtExB+vyhllcbW0ZYZcLkCMt6addrxoueDihA+wBzXSrMlzhTuebm/jEQQA0t
         QT0QwaTL20fg95IM6FLVJvaHJMu8TYVjX8i4PDx+vV9ziKaXGvKrCF2V9hjwlGKV4Zcu
         BntYkExHsZWUj/WBCic6iAScpKYBI+BSQREBy9PK+uGn1bpE4fIpZb3ngBGsxyn7oQuK
         mXjvvq6z9aD0FNVSrD5DKuE6RkaS5A9l/Twk/ARMlNXWlCM5VxF1yDaG84mbcIMY0GJK
         2zIA==
X-Gm-Message-State: AJIora9xUlbgvDpCtCHa4nNSt0LSVQJLSSSsji/tBbFQKq6L/AAZAZX0
        FqXzsFd91v8vQJNRGC5Xa/JzwkA1ut4mjQ==
X-Google-Smtp-Source: AGRyM1vhPFqm2+sYalz2RdBlAyNy8f5Jw7aVYRNDJuNpBZAOL745CEgPJ4Bp9LIN5ez9VKRhEqknbg==
X-Received: by 2002:a5d:4982:0:b0:21d:6e04:1fb3 with SMTP id r2-20020a5d4982000000b0021d6e041fb3mr3022384wrq.69.1657281544357;
        Fri, 08 Jul 2022 04:59:04 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z5-20020adfe545000000b0021b81855c1csm49436474wrm.27.2022.07.08.04.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:59:03 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     faizel.kb@dicortech.com, baihaowen@meizu.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH 1/3] tools: usb: testusb: Add wireless speed reporting
Date:   Fri,  8 Jul 2022 12:58:57 +0100
Message-Id: <20220708115859.2095714-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708115859.2095714-1-bryan.odonoghue@linaro.org>
References: <20220708115859.2095714-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the ability to detect and print the USB speed as "wireless" if/when the
kernel reports that speed.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 tools/usb/testusb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/usb/testusb.c b/tools/usb/testusb.c
index 474bae868b353..6f428f9253844 100644
--- a/tools/usb/testusb.c
+++ b/tools/usb/testusb.c
@@ -96,7 +96,8 @@ struct usb_interface_descriptor {
 enum usb_device_speed {
 	USB_SPEED_UNKNOWN = 0,			/* enumerating */
 	USB_SPEED_LOW, USB_SPEED_FULL,		/* usb 1.1 */
-	USB_SPEED_HIGH				/* usb 2.0 */
+	USB_SPEED_HIGH,				/* usb 2.0 */
+	USB_SPEED_WIRELESS,			/* wireless (usb 2.5) */
 };
 
 /*-------------------------------------------------------------------------*/
@@ -104,11 +105,12 @@ enum usb_device_speed {
 static char *speed (enum usb_device_speed s)
 {
 	switch (s) {
-	case USB_SPEED_UNKNOWN:	return "unknown";
-	case USB_SPEED_LOW:	return "low";
-	case USB_SPEED_FULL:	return "full";
-	case USB_SPEED_HIGH:	return "high";
-	default:		return "??";
+	case USB_SPEED_UNKNOWN:		return "unknown";
+	case USB_SPEED_LOW:		return "low";
+	case USB_SPEED_FULL:		return "full";
+	case USB_SPEED_HIGH:		return "high";
+	case USB_SPEED_WIRELESS:	return "wireless";
+	default:			return "??";
 	}
 }
 
-- 
2.36.1

