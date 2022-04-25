Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04AE950DA0E
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 09:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235234AbiDYH3Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 03:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiDYH3R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 03:29:17 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E09D65F8
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 00:26:11 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 15so4330517pgf.4
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 00:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labau-com-tw.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=SVcSJrLVlUR4iRgJZ+k1PIE6YPEQEIKfqaOT7sVPQDU=;
        b=E0GNopUdniQekEhAdER+HF2LWeozVsORZqOwGOgVIxM9fyOv+94wzt0kwod2wnPfI+
         IAOaoXBj9fuNz/bJkR+eE/zHUpPcV6JBsiEIkKpWnzymDZnTE8kDMyXpvINYsOmFqtAM
         G57IQd55ZvBoqVF34ITGioJP4bMOIe05krZgSQp2NjqDYypN2K+0ZsVdpQQHyetH5V2q
         YrJwM5nV2ZmMXPNgvpdUmfS5SH8GU/FiYuN/wJl/HsieYWk4z4meOwtmKhfzYDEf4/Ua
         rkUB2+LMRqOtUs/YRE5fj3QtBhzUcYXgL5s1vQ6vDMjE4RuzBL8cbtVXQcg94vIIZ22b
         e/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SVcSJrLVlUR4iRgJZ+k1PIE6YPEQEIKfqaOT7sVPQDU=;
        b=VPn9WRdT1+mG53gUsj68l6iQO+pkIobe1dYSb/5gJyeFUG1luSrObL6oBUSCI/yDWJ
         0hYEe7WcFaa3sClTquNCAJM0fVuDjU8akNheQ0fsvTET61y4c1GiadJjWGfgus9Y3PLo
         nzMcrrkt16lqJjtAUgLA7UDTbcG7SiPKn2Vkaq6hE9vKS/Omhb6IdorQd2/yoshL6XGU
         e1GaCGxzl4p6i2/g1sjQ8DrM041pB2AHMP08QHvNC5w35zdfLM1XtsbMUefjQPB8iHgq
         wlxyh7JtS0lFuiSS6kxYGWrTjgAouxyGyM2+c7BD0doayy8h7qDa0reeHkVl0qbndBvA
         8WVw==
X-Gm-Message-State: AOAM530aPDOGO8fuy9i8af2nfdIo4+lfqpYioUCkgHR9J1ME8Bh96Azn
        b3uslgl0GBVTsJfCqP/pO8UdVg==
X-Google-Smtp-Source: ABdhPJyaDvaXzr5/wijEbfyZ+WiQkxGfqFvUUpgb9pQ7tStNFYCNcH0YYpvkKNfxSxYxECWGzwhvJQ==
X-Received: by 2002:a63:105:0:b0:3ab:e98:5844 with SMTP id 5-20020a630105000000b003ab0e985844mr6839135pgb.218.1650871570834;
        Mon, 25 Apr 2022 00:26:10 -0700 (PDT)
Received: from labau-virtual-machine.localdomain (61-228-66-64.dynamic-ip.hinet.net. [61.228.66.64])
        by smtp.gmail.com with ESMTPSA id d21-20020a056a0010d500b004fd9ee64134sm10420849pfu.74.2022.04.25.00.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 00:26:10 -0700 (PDT)
From:   Scott Chen <scott@labau.com.tw>
Cc:     young@labau.com.tw, roger@labau.com.tw,
        Scott Chen <scott@labau.com.tw>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: pl2303: add device id for HP LM930 Display
Date:   Mon, 25 Apr 2022 15:24:52 +0800
Message-Id: <20220425072454.33126-1-scott@labau.com.tw>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the device id for the HPLM930Display which is a PL2303GC based device

Signed-off-by: Scott Chen <scott@labau.com.tw>
---
 drivers/usb/serial/pl2303.c | 1 +
 drivers/usb/serial/pl2303.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 88b284d61681..1d878d05a658 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -106,6 +106,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LCM220_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LCM960_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LM920_PRODUCT_ID) },
+	{ USB_DEVICE(HP_VENDOR_ID, HP_LM930_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LM940_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_TD620_PRODUCT_ID) },
 	{ USB_DEVICE(CRESSI_VENDOR_ID, CRESSI_EDY_PRODUCT_ID) },
diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
index c5406452b774..9d8102639e16 100644
--- a/drivers/usb/serial/pl2303.h
+++ b/drivers/usb/serial/pl2303.h
@@ -135,6 +135,7 @@
 #define HP_TD620_PRODUCT_ID	0x0956
 #define HP_LD960_PRODUCT_ID	0x0b39
 #define HP_LD381_PRODUCT_ID	0x0f7f
+#define HP_LM930_PRODUCT_ID     0x0f9b
 #define HP_LCM220_PRODUCT_ID	0x3139
 #define HP_LCM960_PRODUCT_ID	0x3239
 #define HP_LD220_PRODUCT_ID	0x3524
-- 
2.17.1

