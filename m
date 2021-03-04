Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B84332CA7F
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 03:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbhCDCdc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 21:33:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhCDCdM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Mar 2021 21:33:12 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB95C061574
        for <linux-usb@vger.kernel.org>; Wed,  3 Mar 2021 18:32:32 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id s7so16246882qkg.4
        for <linux-usb@vger.kernel.org>; Wed, 03 Mar 2021 18:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lnv2xXLGsJr2xSTbuDELWivnFGhF+exslj9+6/rXBS8=;
        b=gOSzOLzZXV4Iw9nmPrhfs/muO8Ri1HRGHmXVf1erprMqz8xqoAaaZlpyeDc12hz07n
         blOh+BOIJ1QfySCHXtjVlqHpvddSXmfM5GK4A4c7E5ERaP65FSfMpHsTckt4z4V9JRQx
         b0KywPJmD1sQBT4l6Cg6ME2XCrrFi64wrybfptBUnC2vlupkQz1XtRl2aLDzSUQE+bt+
         dl9ndpJB98e8R1ubqPd9bWTRdU67gunEbP164FHMja0XG3800uWikUn+kKdSXstT+e9Z
         dOWB6p58FIigUXGWlvzJIXKuaoZli4ocIkpcobNDaYp6t1T7ri3wkGNg5odX96MbHIjB
         Q1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lnv2xXLGsJr2xSTbuDELWivnFGhF+exslj9+6/rXBS8=;
        b=hdpnigPsuydAGcVBtvK/ul6qmfByNFbcWKqf4MVCSHTNqsZuPbDFkVEOX9TgbyM9x2
         4rVPx3CS4gs8HhZQz9OWayrhY9Ja6/Hsbg3at2G8b8rElnr8HM7X/kXgdzJOdu4zbYSo
         g8a4D+DfNaALjpAA2TJLA6anJ6JgsXxI0ph627YaQmTaQZaN31yD3UgsvpwF8CqIjWMe
         fMJ6CQzChuEiH0OuDV6sCKn5hTID4r85FB1ocZkA5BXksXjcAezHqqV+tkSEn3YeXUYm
         72h0BYyDsq+l+ulYbn7yabrzVsx9XfSar/ZkFaSfG3juh6cSAEleCbQ9pI5ipMAwSFxJ
         iZ+w==
X-Gm-Message-State: AOAM530+WpOE8SXxUbGsLdfCW8i806GlWogl2d8CdG4lb4K/NhPAwun4
        O7bU4MMfa5yvEPvv3XoWylE=
X-Google-Smtp-Source: ABdhPJzHEADtEqZwOfmXqdwXZ/V3ODTpn3IurcyJ0PjLHhsv9rpB148qbsyVoKrDu3NeTZFB3Atk7w==
X-Received: by 2002:a37:2749:: with SMTP id n70mr2057013qkn.105.1614825151683;
        Wed, 03 Mar 2021 18:32:31 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:919::1001])
        by smtp.gmail.com with ESMTPSA id m13sm5734962qkm.103.2021.03.03.18.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 18:32:30 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] usb: usb-mx2: Remove unused file
Date:   Wed,  3 Mar 2021 23:32:20 -0300
Message-Id: <20210304023220.2362407-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

i.MX21 support has been dropped, so remove such unused file.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 include/linux/platform_data/usb-mx2.h | 29 ---------------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 include/linux/platform_data/usb-mx2.h

diff --git a/include/linux/platform_data/usb-mx2.h b/include/linux/platform_data/usb-mx2.h
deleted file mode 100644
index 97a670f3d8fb..000000000000
--- a/include/linux/platform_data/usb-mx2.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *	Copyright (C) 2009 Martin Fuzzey <mfuzzey@gmail.com>
- */
-
-#ifndef __ASM_ARCH_MX21_USBH
-#define __ASM_ARCH_MX21_USBH
-
-enum mx21_usbh_xcvr {
-	/* Values below as used by hardware (HWMODE register) */
-	MX21_USBXCVR_TXDIF_RXDIF = 0,
-	MX21_USBXCVR_TXDIF_RXSE = 1,
-	MX21_USBXCVR_TXSE_RXDIF = 2,
-	MX21_USBXCVR_TXSE_RXSE = 3,
-};
-
-struct mx21_usbh_platform_data {
-	enum mx21_usbh_xcvr host_xcvr; /* tranceiver mode host 1,2 ports */
-	enum mx21_usbh_xcvr otg_xcvr; /* tranceiver mode otg (as host) port */
-	u16 	enable_host1:1,
-		enable_host2:1,
-		enable_otg_host:1, /* enable "OTG" port (as host) */
-		host1_xcverless:1, /* traceiverless host1 port */
-		host1_txenoe:1, /* output enable host1 transmit enable */
-		otg_ext_xcvr:1, /* external tranceiver for OTG port */
-		unused:10;
-};
-
-#endif /* __ASM_ARCH_MX21_USBH */
-- 
2.25.1

