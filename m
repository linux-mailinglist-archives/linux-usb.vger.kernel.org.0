Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD69018107C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 07:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbgCKGOp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 02:14:45 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46007 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgCKGOp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Mar 2020 02:14:45 -0400
Received: by mail-pf1-f196.google.com with SMTP id 2so685692pfg.12
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2020 23:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labau-com-tw.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=aqRB1ipP8pdB6p4pCG0uaJYVXRVTNhaWdbAUG12bd4w=;
        b=ifvfOXs7gSPHoC0g6CDbJI+XI/lz2kXJSnbyHO1pr/8L0pwdxlt9TsQdS/MOCujocu
         BffzEbSEpqsW9SlU/q+BOU9fvUK8iy1I0NSHCqv4fHk8jw904z956acdJaMIGjp+pALf
         syFr/laQ6rbgMxqj6tOLUq7RMEqUU3RsgWXV5z4fFsFMLrTm8FAcM7VZkzX9AB+guwAk
         kazkJxNiOXkw6oANx9Y2RGkGLt6MEXM9m9M9+cQdWKgHOuOd9mu5ujmA4BZWf+9oBIrX
         2ilaTHLPj+WY60Kf0xQvJ6Ddfkss/uLOIhLPkJUIcPkUpiaVAm7F1u/e93U71H26xLI8
         jq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=aqRB1ipP8pdB6p4pCG0uaJYVXRVTNhaWdbAUG12bd4w=;
        b=ZaPwuHufBAvidF8e5bvSiWYD2Y2+cSEwkCpit6ZHaQ+iHNeUKNif/WK3u8+OqDGFHQ
         0Ta2yXfIH1a2OIw3ddUoUf4cWmClLTg/FOPyNJR+x9xVv9wrwRYAI47x4TGEV/sz1x43
         z4IWKYtdZ4zbjRPVssofsEUBzReyrOIMDhcroXBoNJQUVEDGbk0UiGFrbSDuCSHBMtPY
         3RxPHHFyPoIlxmryvp6Wcpgvk5GSPaEzVAAjYmFKZzeLR63C38AI3M/rWthcv96zFQt7
         sSEn3Sxk5nzGfvbuyk9zbtwMZXsxnYmkvcnhbAmi2z/aJWKPhY5iK6L0HahUus0gGc9/
         sUIw==
X-Gm-Message-State: ANhLgQ0DiDtA2rxDQUIQhxnI6xrgXSqPob0ZW2IDQWhRanNrYAvalxTM
        /Qi1RZcExc8f7LnzkjUdThMgJw==
X-Google-Smtp-Source: ADFU+vsOnDdfjoSn+srks/CyROEd5VUqKn+ZsIB9LDviWMCRsG9Wx/jzLnyCCULd9K2Yfj+jbgU7SQ==
X-Received: by 2002:aa7:8548:: with SMTP id y8mr1314503pfn.166.1583907284180;
        Tue, 10 Mar 2020 23:14:44 -0700 (PDT)
Received: from localhost.localdomain (60-251-64-13.HINET-IP.hinet.net. [60.251.64.13])
        by smtp.gmail.com with ESMTPSA id x4sm43602306pgi.76.2020.03.10.23.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 23:14:43 -0700 (PDT)
From:   Scott Chen <scott@labau.com.tw>
Cc:     young@labau.com.tw, jocelyn@labau.com.tw, larsm17@gmail.com,
        Scott Chen <scott@labau.com.tw>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] USB: serial: pl2303: add a new PID for HP
Date:   Wed, 11 Mar 2020 14:14:23 +0800
Message-Id: <20200311061423.20686-1-scott@labau.com.tw>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a device id for HP LD381 Display
LD381:   03f0:0f7f

Signed-off-by: Scott Chen <scott@labau.com.tw>
---
 Changes in v2:
  - keep HP entries sorted by PID

 drivers/usb/serial/pl2303.c | 1 +
 drivers/usb/serial/pl2303.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index aab737e1e7b6..c5a2995dfa2e 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -99,6 +99,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(SUPERIAL_VENDOR_ID, SUPERIAL_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LD220_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LD220TA_PRODUCT_ID) },
+	{ USB_DEVICE(HP_VENDOR_ID, HP_LD381_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LD960_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LD960TA_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LCM220_PRODUCT_ID) },
diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
index a019ea7e6e0e..52db5519aaf0 100644
--- a/drivers/usb/serial/pl2303.h
+++ b/drivers/usb/serial/pl2303.h
@@ -130,6 +130,7 @@
 #define HP_LM920_PRODUCT_ID	0x026b
 #define HP_TD620_PRODUCT_ID	0x0956
 #define HP_LD960_PRODUCT_ID	0x0b39
+#define HP_LD381_PRODUCT_ID	0x0f7f
 #define HP_LCM220_PRODUCT_ID	0x3139
 #define HP_LCM960_PRODUCT_ID	0x3239
 #define HP_LD220_PRODUCT_ID	0x3524
-- 
2.17.1

