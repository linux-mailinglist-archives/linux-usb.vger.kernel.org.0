Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 839E6CF58B
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 11:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730041AbfJHJCv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 05:02:51 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37479 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727724AbfJHJCu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 05:02:50 -0400
Received: by mail-lf1-f66.google.com with SMTP id w67so11360972lff.4
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 02:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ADgCJdlGY+Zw3z+lbjx+EoicMOEEo+/ZLpLLPcoI9k=;
        b=G9E0UkOxCB8IDCLiyQM1jhRO6rv4PrLd+IR+YFsjk+l6ntY9zev0WPpHua6ENA9D29
         3HBKYAxdFa8vPAdhPBHW97avm3cQv2YvczdjN/8sxwT921NFVPAM5cRysy4Wfuq5zZsm
         nGqg9CKcoub9azOK9hS/KoyqgQXrzpTX6xLq0rlLR87zKXuePmt/ML6g3cGUObBgTpf7
         GsSqD/aZRdOqlCHjEbWlA6KLjVcMORdmeRs6abpqblJ1gmOf4GxtOJDKMkdk5jLm8QHi
         IvK6i7kAwKWH0uFIsf3msIwudsLID511CB6w4uJ0ijBzjevU5TqUp7nEAmhinm4c03QJ
         rZOA==
X-Gm-Message-State: APjAAAVTP+f2B/axtAko6WQjqaeZ3wpsLI90SMtmf5mdaaeX03W/Vutv
        YNDmgd5jADZHWKDJWnVqG+c=
X-Google-Smtp-Source: APXvYqwDs48b7nNNQOxgkswUGUbkR86IhFAbVMNsAiBNNrq/wd0fshKnJsvK6oPTpFiuBoK9Q0S1NQ==
X-Received: by 2002:a19:f512:: with SMTP id j18mr19896131lfb.169.1570525368736;
        Tue, 08 Oct 2019 02:02:48 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id i6sm3405014lfc.37.2019.10.08.02.02.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 02:02:48 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iHlOO-0007uf-J2; Tue, 08 Oct 2019 11:02:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: core: drop OOM message
Date:   Tue,  8 Oct 2019 11:02:40 +0200
Message-Id: <20191008090240.30376-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop redundant OOM message on allocation failures which would already
have been logged by the allocator. This also allows us to clean up the
error paths somewhat.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/core/config.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 151a74a54386..ff9f50f7218f 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -800,10 +800,10 @@ int usb_get_configuration(struct usb_device *dev)
 {
 	struct device *ddev = &dev->dev;
 	int ncfg = dev->descriptor.bNumConfigurations;
-	int result = -ENOMEM;
 	unsigned int cfgno, length;
 	unsigned char *bigbuffer;
 	struct usb_config_descriptor *desc;
+	int result;
 
 	if (ncfg > USB_MAXCONFIG) {
 		dev_warn(ddev, "too many configurations: %d, "
@@ -819,16 +819,16 @@ int usb_get_configuration(struct usb_device *dev)
 	length = ncfg * sizeof(struct usb_host_config);
 	dev->config = kzalloc(length, GFP_KERNEL);
 	if (!dev->config)
-		goto err2;
+		return -ENOMEM;
 
 	length = ncfg * sizeof(char *);
 	dev->rawdescriptors = kzalloc(length, GFP_KERNEL);
 	if (!dev->rawdescriptors)
-		goto err2;
+		return -ENOMEM;
 
 	desc = kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
 	if (!desc)
-		goto err2;
+		return -ENOMEM;
 
 	for (cfgno = 0; cfgno < ncfg; cfgno++) {
 		/* We grab just the first descriptor so we know how long
@@ -890,9 +890,7 @@ int usb_get_configuration(struct usb_device *dev)
 err:
 	kfree(desc);
 	dev->descriptor.bNumConfigurations = cfgno;
-err2:
-	if (result == -ENOMEM)
-		dev_err(ddev, "out of memory\n");
+
 	return result;
 }
 
-- 
2.23.0

