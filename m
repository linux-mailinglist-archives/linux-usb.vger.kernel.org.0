Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2CD319CD3
	for <lists+linux-usb@lfdr.de>; Fri, 12 Feb 2021 11:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhBLKrs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Feb 2021 05:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhBLKrr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Feb 2021 05:47:47 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30188C061756
        for <linux-usb@vger.kernel.org>; Fri, 12 Feb 2021 02:47:06 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id y18so10134666edw.13
        for <linux-usb@vger.kernel.org>; Fri, 12 Feb 2021 02:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/KePK+los1O6fajsdCrG8/EKSLrcI/vKFBSjqtIKFg4=;
        b=YdQjKVUVY+VasIl2aPXSH0aNf1V3Wq3N0fy7wsqvJiTCVm/xwisUGVZ69n2z2GNBtZ
         IirmG7gxtMfXNA9faCsAFL7FKur7CfazMUa/1YqEP6hBzLoSDICko4t7DDd4mLzaUwW+
         cWQcNWCctsrPGLXIV3xLlq1IKQ+EWBR0nsBsShkUJlOfeiugDg4f/7A8oYNh/mEIcrAd
         Wv+ApANv5NQEFlVDAC4NWQuk4bqwyH5cta/hJs1sGlVITNODIkQm7DxAarXlf+kg7zX2
         jp6h4wkjkdUgVFhwpOo9ouWyCwBulAGKaNTW0fSs+1MaX0ttdIDn8AXTTAiQ4N/B4/Gn
         9xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/KePK+los1O6fajsdCrG8/EKSLrcI/vKFBSjqtIKFg4=;
        b=Hu4/a4NNgJw7s82CpGxbcEe81lbxOzMgj6dLkGy8PpHP3+O0T/riso0NjduFEb5/Sx
         EVasSCPRtgcErET6H/GskXbMOAETyynrP1lAoprQRMBhJX3IvFe+TezMMiMObWkrl7sA
         87bkJfVA17J0JQylCzQtTJCn1dQVDgLvvvR3LSlBritnzVyKlxTDHq03Ex3VzUSUddoE
         u6cindDKR/6zuBeS7jKjkG68HR/carMoRkQD/JOkMzVj+xHmP5tc55ds/WmNAEUr/AmL
         asNYPAsJ3Cn3V16TUjFirhczGW9QF8dqnP99X1vXzEK5/pfAl0BLiyAPG4Rkm1HkUxTE
         N+tA==
X-Gm-Message-State: AOAM5306C5lj7yRjtC7vXAA9jdAMLngO5js0S7Vn8ohS9bKbtL5LV2MG
        xiTGpvmfs+n6PdWQjK0X2bRhf7bdgXoPxw==
X-Google-Smtp-Source: ABdhPJx3Wb/QBPPq9CFQVHtjWRO4GyFYfq0EAG9WIrg+aErl7jaEERBWUmwsefN1cyTqY76sEDkU/A==
X-Received: by 2002:a05:6402:1398:: with SMTP id b24mr2584768edv.108.1613126824759;
        Fri, 12 Feb 2021 02:47:04 -0800 (PST)
Received: from dell-xps159570.domain_not_set.invalid (129-228-158-163.dynamic.caiway.nl. [163.158.228.129])
        by smtp.gmail.com with ESMTPSA id o10sm6188279eju.89.2021.02.12.02.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 02:47:04 -0800 (PST)
From:   Yorick de Wid <ydewid@gmail.com>
To:     linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>
Cc:     Yorick de Wid <ydewid@gmail.com>
Subject: [PATCH] USB: quirks: Goodix Fingerprint device is not a modem
Date:   Fri, 12 Feb 2021 11:44:24 +0100
Message-Id: <20210212104423.166197-1-ydewid@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The CDC ACM driver is false matching the Goodix Fingerprint device against
the USB_CDC_ACM_PROTO_AT_V25TER.

Signed-off-by: Yorick de Wid <ydewid@gmail.com>
---
 drivers/usb/class/cdc-acm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 78190574581..41d20a44dc3 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1922,6 +1922,11 @@ static const struct usb_device_id acm_ids[] = {
 	.driver_info = IGNORE_DEVICE,
 	},
 
+	/* Exclude Goodix Fingerprint Reader */
+	{ USB_DEVICE(0x27c6, 0x5395),
+	.driver_info = IGNORE_DEVICE,
+	},
+
 	{ USB_DEVICE(0x1bc7, 0x0021), /* Telit 3G ACM only composition */
 	.driver_info = SEND_ZERO_PACKET,
 	},
-- 
2.30.0

