Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F92754F85F
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jun 2022 15:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbiFQNfi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jun 2022 09:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiFQNfh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jun 2022 09:35:37 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7AD2C65A
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 06:35:37 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id k7so3902930plg.7
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 06:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GjQEnVfqWm7ZgA55LwJ6GGK0gfdSHhmp3bzTtWBEVhk=;
        b=BNunKsthV4LsVEJpnuhGh3HAttS/lGsnLUhKjtA1k8EiWohtbeN6MCp8EuoYuUPZxM
         T3aA3bmm06A0JW83f3LfWVLvbHa9pxUJiVHHv9ADSR3eP3tQh+lFilEEBgAegwUjqrNw
         ApOlAW8UBZeeAKLMPWKhz08tpYgI14U9LBF4FS8+JTf/oi3D9kZsXNLxb4D/1fhWjs0t
         0MLX4203TYsSOPSF+PCJ+GrWEksimnx5475iTFOw8+2fS4BH2Bmq825CVrITalsb6F5L
         ++gwOrk1x/VpFPOlZF7sckDakxObu7EiraDbcbeau1FeYSQysDC13EPrfcJX7CUlPNOx
         xnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GjQEnVfqWm7ZgA55LwJ6GGK0gfdSHhmp3bzTtWBEVhk=;
        b=norQNJ4DiV3ZgwK9rSr9N9jtNo8PX80wSYt6DtfqXG4lXPGs+2yJsPQchNsCQia0Yv
         Mm/6NXtPRtuYXDNhTTgwiF/8exan5RR4UXm5Fez8B0uwjpjCo5GxMjjX/tug4it4hLpq
         iQ7gyifKxQsIDc2xl+IYPmYep9selY3UTUSmvg85Ja+uLRUpDlUYETRqy2aupgww/qjR
         +xhqCd+w0avAPB2VCv/+yXKvW9pmekFO3pOAdw7K1OK8+UxJstElGcTQ1/vHuMqqh9IM
         AR6XutnnzQzl9wumy512ZF7v6QDyMkhYXMi810f6sRVGzfmv3yhNgI/z9f4cOXqJxUdH
         CjOA==
X-Gm-Message-State: AJIora+/7Qp9XSkIZqFMuTYHlPtx+HS5aSkA9Ht3IGU4fwbQFblSvzlo
        YoUcmF11gTEFjkHELzYrn4m8x7UqtKY=
X-Google-Smtp-Source: AGRyM1sJmkzfiR7qa6TjoLa1XNWYCmcXyKkrZCRfLBTAWctqzF9NWUUv/XxsJHsQpZZbyOZf1nTqJw==
X-Received: by 2002:a17:90a:cb84:b0:1ea:ffd2:3075 with SMTP id a4-20020a17090acb8400b001eaffd23075mr6967882pju.106.1655472936562;
        Fri, 17 Jun 2022 06:35:36 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-381b-9f7d-d1f2-0ec7-cc88-1351.dynamic-ip6.hinet.net. [2001:b011:381b:9f7d:d1f2:ec7:cc88:1351])
        by smtp.gmail.com with ESMTPSA id l3-20020a17090aaa8300b001e08461ceaesm5545166pjq.37.2022.06.17.06.35.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2022 06:35:35 -0700 (PDT)
From:   Charles Yeh <charlesyeh522@gmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org
Cc:     charles-yeh@prolific.com.tw, Charles Yeh <charlesyeh522@gmail.com>
Subject: [PATCH] USB: serial: pl2303: Modify the detection method of PL2303HXN (TYPE_HXN)
Date:   Fri, 17 Jun 2022 21:35:14 +0800
Message-Id: <20220617133514.357-1-charlesyeh522@gmail.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The setting value of bcdUSB & bcdDevice of PL2303TA is the same as the
setting value of bcdUSB & bcdDevice of a certain chip of PL2303HXN

The setting value of bcdUSB & bcdDevice of PL2303TB is the same as the
setting value of bcdUSB & bcdDevice of a certain chip of PL2303HXN

The PL2303HXN series currently has several chips on sale, and several chips
are about to be sold.
The PL2303HXN cannot use bcdDevice to determine the type one by one.

Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
---
 drivers/usb/serial/pl2303.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 3506c47e1eef..95e5fdf3b80a 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -436,22 +436,23 @@ static int pl2303_detect_type(struct usb_serial *serial)
 		break;
 	case 0x200:
 		switch (bcdDevice) {
-		case 0x100:
-		case 0x105:
-		case 0x305:
-		case 0x405:
-		case 0x605:
+		case 0x300:
+			if (!pl2303_supports_hx_status(serial))
+				return TYPE_HXN;
+			else
+				return TYPE_TA;
+		case 0x500:
+			if (!pl2303_supports_hx_status(serial))
+				return TYPE_HXN;
+			else
+				return TYPE_TB;
+		default:
 			/*
 			 * Assume it's an HXN-type if the device doesn't
 			 * support the old read request value.
 			 */
 			if (!pl2303_supports_hx_status(serial))
 				return TYPE_HXN;
-			break;
-		case 0x300:
-			return TYPE_TA;
-		case 0x500:
-			return TYPE_TB;
 		}
 		break;
 	}
-- 
2.34.1

