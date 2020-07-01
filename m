Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013EB211147
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 18:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732805AbgGAQyQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 12:54:16 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35053 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732544AbgGAQyN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 12:54:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id f8so15720195ljc.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 09:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XqN5BMTTSq0kRme7uXuwIzqY4FXUwpkC+v2C+TXGWC8=;
        b=psvx4DkmFIjF94ZCeIbssc8X/FQa02u8MWtgprorfXGUDWXSwKMxumtf2JI0kVYAB9
         qfKOZclPOsw5TGkJTA09N/vKxOk/f7crjTY4PhqzlwP6l1b9Pay1jNEDforLM4lIJxBV
         UwO7fgbkK7mXFSipl0ZqVdxQPyMrZb4scBYI2uTRL/CvmEBwaaXbxUoJccBhcGh8yIMJ
         2p3QReqxNk8UpSx48WR7+tjvRvCsI6XbijqzF8tVFpE95SVAnYd8wraJ3aIfiXOTjOcU
         O9lShgisW8nSBeBy756hu227Ed7Uz8Si0JvEb/UA9YIkBbbe+tjxZHCE+OKcMCB0CJm/
         dgZA==
X-Gm-Message-State: AOAM533Yyym/BUT3D2WAKlchrGkwou+Cvr7Y/ydfAVQ/vPQkL2bv7i60
        rb2Ip9vgF/2iAcn8e+x4c8FYdE9XA04=
X-Google-Smtp-Source: ABdhPJxCVFwjbu6xEtiLyxmIbpoeE1K/b5YUK75ublcWu2kLG8Yj0LZJS2t3YJGioXg16NkTMt0xNA==
X-Received: by 2002:a2e:161a:: with SMTP id w26mr13906073ljd.216.1593622451281;
        Wed, 01 Jul 2020 09:54:11 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 81sm2253295lfj.24.2020.07.01.09.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 09:54:10 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jqfzq-000425-Ca; Wed, 01 Jul 2020 18:54:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 1/5] USB: serial: garmin_gps: don't compile unused packet definitions
Date:   Wed,  1 Jul 2020 18:53:38 +0200
Message-Id: <20200701165342.15448-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701165342.15448-1-johan@kernel.org>
References: <20200701165342.15448-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Don't compile the four unused packet definitions but keep them around
for documentation purposes.

This avoids the corresponding W=1 (-Wunused-const-variable) warnings.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/garmin_gps.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index d63072fee099..c02c19bb1183 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -179,19 +179,22 @@ static unsigned char const GARMIN_START_SESSION_REPLY[]
 	= { 0, 0, 0, 0,  6, 0, 0, 0, 4, 0, 0, 0 };
 static unsigned char const GARMIN_BULK_IN_AVAIL_REPLY[]
 	= { 0, 0, 0, 0,  2, 0, 0, 0, 0, 0, 0, 0 };
+static unsigned char const GARMIN_STOP_TRANSFER_REQ[]
+	= { 20, 0, 0, 0,  10, 0, 0, 0, 2, 0, 0, 0, 0, 0 };
+static unsigned char const GARMIN_STOP_TRANSFER_REQ_V2[]
+	= { 20, 0, 0, 0,  10, 0, 0, 0, 1, 0, 0, 0, 0 };
+
+/* packets currently unused, left as documentation */
+#if 0
 static unsigned char const GARMIN_APP_LAYER_REPLY[]
 	= { 0x14, 0, 0, 0 };
 static unsigned char const GARMIN_START_PVT_REQ[]
 	= { 20, 0, 0, 0,  10, 0, 0, 0, 2, 0, 0, 0, 49, 0 };
 static unsigned char const GARMIN_STOP_PVT_REQ[]
 	= { 20, 0, 0, 0,  10, 0, 0, 0, 2, 0, 0, 0, 50, 0 };
-static unsigned char const GARMIN_STOP_TRANSFER_REQ[]
-	= { 20, 0, 0, 0,  10, 0, 0, 0, 2, 0, 0, 0, 0, 0 };
-static unsigned char const GARMIN_STOP_TRANSFER_REQ_V2[]
-	= { 20, 0, 0, 0,  10, 0, 0, 0, 1, 0, 0, 0, 0 };
 static unsigned char const PRIVATE_REQ[]
 	=    { 0x4B, 0x6E, 0x10, 0x01,  0xFF, 0, 0, 0, 0xFF, 0, 0, 0 };
-
+#endif
 
 
 static const struct usb_device_id id_table[] = {
-- 
2.26.2

