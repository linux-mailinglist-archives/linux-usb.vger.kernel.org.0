Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4CF4CF069
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 04:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235125AbiCGDj5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 22:39:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbiCGDju (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 22:39:50 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FAC44DF5A
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 19:38:57 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id z8so10541351oix.3
        for <linux-usb@vger.kernel.org>; Sun, 06 Mar 2022 19:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GmDZYi4u1qi2UI5mnbc01oOxaZZdXpA01oXVaEo5vQ=;
        b=gnQFlufok1ukyNwqUHMx6eGHCZiKYgu2I5hjM9u4WIaIcnZus1X+uVPa+/6wAueX4G
         DQKwVTlhL/G4fI6VDNTiy+HHJZk4N0pz22fHR+kLmGUxsJo9Rd1q5r3HHYkJ4/GdXo5K
         XfkZf5i6nsfZvTZoZAvu0wzGMdZ53cjpOGp2XSXJTDVbJMit7H53GQnTFkD/iyItHosJ
         vJi2PeRS8k7pkWM4ppzPIADSIrqHCq5cty66Q87sYbc1y5nfnvfvdVoZKeJ2ZUdntizH
         ZKztB8nX42X0bx00EQ1kQb6t5UbLf47AF0L/QYGx6qyDhtyZYuJ/MsKGDY84HaouCRmu
         je3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GmDZYi4u1qi2UI5mnbc01oOxaZZdXpA01oXVaEo5vQ=;
        b=NQforP2EDxmgnKkamLgDAozf3F5+AQ3UstVsUF+CD4fjw60IGJwlQWkzP8h4OC2sMg
         QbNe7pQWDtTgO5GTEAJUN4bOd/IeTx9ddMijBpCe/uFgKMU1GSJsWNxXrwu3B394MxnC
         plAaG/J8dqrmokYJzjQHQA6BZB+EpVbiJfomx2yMgBH+LTHQxNgjRL/yQe+3/+QJ8jVF
         c8YNsFe0cl7FruL2xQTFGtHJvQf8QIGA3mOm/Q9Our3D8u2yytHh0sbvRB+Je6NfEd9G
         P4LMe4iwV7f5yVG7xY8Rm+Ut4RCQczo1fGlm2WBYU2MZvf3NhETZr4rgSdsT5/5tmHoY
         uwWA==
X-Gm-Message-State: AOAM533TYlVjUcTCla8DRcEBQ4NsxVmpXd+IUpYj9Zjvv0DZk2wn2EC0
        1noMknaw2WYn4yEKWNEhz29PsQ==
X-Google-Smtp-Source: ABdhPJzUq02KTLVUtsr+9h+MDIT1LRo1KLp30IoSrtUdIlHlXcnBT3PBK/jna4VOieqJ6TtS4/VPrA==
X-Received: by 2002:a05:6808:11cd:b0:2d5:3f90:b9e with SMTP id p13-20020a05680811cd00b002d53f900b9emr5968578oiv.113.1646624336821;
        Sun, 06 Mar 2022 19:38:56 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id o2-20020a05687072c200b000d9ae3e1fabsm5005172oak.12.2022.03.06.19.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 19:38:56 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 3/7] usb: typec: mux: Check dev_set_name() return value
Date:   Sun,  6 Mar 2022 19:40:36 -0800
Message-Id: <20220307034040.1111107-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220307034040.1111107-1-bjorn.andersson@linaro.org>
References: <20220307034040.1111107-1-bjorn.andersson@linaro.org>
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

It's possible that dev_set_name() returns -ENOMEM, catch and handle this.

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- New patch

 drivers/usb/typec/mux.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index c8340de0ed49..d2aaf294b649 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -131,8 +131,11 @@ typec_switch_register(struct device *parent,
 	sw->dev.class = &typec_mux_class;
 	sw->dev.type = &typec_switch_dev_type;
 	sw->dev.driver_data = desc->drvdata;
-	dev_set_name(&sw->dev, "%s-switch",
-		     desc->name ? desc->name : dev_name(parent));
+	ret = dev_set_name(&sw->dev, "%s-switch", desc->name ? desc->name : dev_name(parent));
+	if (ret) {
+		put_device(&sw->dev);
+		return ERR_PTR(ret);
+	}
 
 	ret = device_add(&sw->dev);
 	if (ret) {
@@ -338,8 +341,11 @@ typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
 	mux->dev.class = &typec_mux_class;
 	mux->dev.type = &typec_mux_dev_type;
 	mux->dev.driver_data = desc->drvdata;
-	dev_set_name(&mux->dev, "%s-mux",
-		     desc->name ? desc->name : dev_name(parent));
+	ret = dev_set_name(&mux->dev, "%s-mux", desc->name ? desc->name : dev_name(parent));
+	if (ret) {
+		put_device(&mux->dev);
+		return ERR_PTR(ret);
+	}
 
 	ret = device_add(&mux->dev);
 	if (ret) {
-- 
2.33.1

