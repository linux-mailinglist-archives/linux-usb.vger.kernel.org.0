Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689DE2C21EA
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 10:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731411AbgKXJmD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 04:42:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730985AbgKXJmA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Nov 2020 04:42:00 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E9BC0613D6
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 01:41:59 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id mc24so6420686ejb.6
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 01:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=s0gkWPl5wJLbrbdmuqoKGC1D+4/uDQ7gO8gX1p+WE3c=;
        b=a3TPn0hzZixjxPpfHkFwmMyEkMDrbANbOSn59xhDEIGvUPHm+Uep9wff55Am9L31ko
         eFjJm3kEvff2FLwx0xwfeLkXADwIefUsd5GqBVplgCi1b9cqqQ3HmL6+RzIG0KVC3xTQ
         fV0X7iapYTZDsu+1TIoe8Gmwprv4Fo81vpBaZMCsuchG6e64wvSuC4AqnSNEoSST9RxY
         VipkTuMvHP452QcjXy9mYFsR1l9JzwazEj1WdSO7lasanRlBFZFcNpNZN/Ie+ULrcraX
         AUKLb0PtERGPVOa2EvDXGrC962UjFE5uQJaDIXRhMBP7CLUt9mbewofAP5HbTR0NrChF
         zCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=s0gkWPl5wJLbrbdmuqoKGC1D+4/uDQ7gO8gX1p+WE3c=;
        b=pOAVYspnQnPO2O7LfHrxDAIoiMIhjmdNu6vRLfqdhOOsQtks739xBuCG1xzYpi2pE/
         q0gYSexj8hp/XFxCL+DWrUFEgbtPBjsqK8f05dXwcdJxr6FOwSs3uQtLvutMYaADSfHy
         LwEdS8c7RjsRWGY+noX57d8C3O9BYemjLXTJH7hnL3LnsfTUGmd/cwck1jNqQVST0bJk
         Sk+YrZLd9hAxZrel1StmF6qisq2UxH3M4N7YkqN/d282AQOzbOAzc02nVqy4ReU0Ofbu
         ArrDrh2fwaYTKet1XvLe/Gq+xyda5Yk6612V8L+caaB2G3mBIjdVfFhaw21N0m2ZlElZ
         WimQ==
X-Gm-Message-State: AOAM530LdW7NC09p8TvFCtia76Wo6LRTlGhEa1kAB8qP/ew7/N1jFKvD
        XOJcL4r1CELRTkzFa1QHt0WXgougFfg=
X-Google-Smtp-Source: ABdhPJzQzh9gpBbQK0TrkU35shNUvYZbYDSVI2rFm+dkScJS6OJ1TmmJvhAmT5wZDHxO8TfEhfESQg==
X-Received: by 2002:a17:906:4547:: with SMTP id s7mr3376361ejq.279.1606210918218;
        Tue, 24 Nov 2020 01:41:58 -0800 (PST)
Received: from gci-Precision-M2800.fritz.box ([2a02:8109:8b00:c24:2d99:4a4e:b808:fab8])
        by smtp.googlemail.com with ESMTPSA id gj23sm656855ejb.27.2020.11.24.01.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 01:41:57 -0800 (PST)
From:   Giacinto Cifelli <gciofono@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Giacinto Cifelli <gciofono@gmail.com>
Subject: [PATCH] option: added support for Thales Cinterion EXS82 option port.
Date:   Tue, 24 Nov 2020 10:41:55 +0100
Message-Id: <20201124094155.10510-1-gciofono@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is a single option port in this modem, and it is used as debug port

Signed-off-by: Giacinto Cifelli <gciofono@gmail.com>
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 54ca85cc920d..fda291e68e4b 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -424,6 +424,7 @@ static void option_instat_callback(struct urb *urb);
 #define CINTERION_PRODUCT_AHXX_2RMNET		0x0084
 #define CINTERION_PRODUCT_AHXX_AUDIO		0x0085
 #define CINTERION_PRODUCT_CLS8			0x00b0
+#define CINTERION_PRODUCT_EXS82			0x006c
 
 /* Olivetti products */
 #define OLIVETTI_VENDOR_ID			0x0b3c
@@ -1908,6 +1909,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC25_MDMNET) },
 	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC28_MDM) }, /* HC28 enumerates with Siemens or Cinterion VID depending on FW revision */
 	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC28_MDMNET) },
+	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_EXS82, 0xff) },
 	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD100),
 	  .driver_info = RSVD(4) },
 	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD120),
-- 
2.17.1

