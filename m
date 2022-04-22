Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADE450C3F3
	for <lists+linux-usb@lfdr.de>; Sat, 23 Apr 2022 01:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233916AbiDVW5G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 18:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbiDVW47 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 18:56:59 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89BEC374D63
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 15:21:54 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id t15so10600550oie.1
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 15:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AvSAQb1M8ai7iREtClhTlQbpfuCOvIwvoizOPDtnCrk=;
        b=Pc1e+PMZm5IuYicnb0WwTJ3NxS7TWcDp5tMa6jMLdMKAY3An0CjGAK0elizA3QrGdx
         qzxqjjVPtpGIT6IPsJIq1xPrBEMGIwCLBxMej9K4Y+EHPh8ksv960DhiDp443oAUcbFZ
         Jhsny1PFJ8tHy9iAkzQntJe638zmBWWED/CGHiAsKTL/om+PCaUq7KuJMxwxuIDtdN+z
         b24DjqO1UN/wg00srUSnjInLBJasjhNV6itXuEF4Xm2wa8jd5dq6Aeb5ibdQYQLy6MJu
         UaPkjfulA0/O5DsIxHPt15xV9ek4CamZlac5+XwtbU0OWOkFk0ROC2t/7ED58vXNdNM2
         saOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AvSAQb1M8ai7iREtClhTlQbpfuCOvIwvoizOPDtnCrk=;
        b=j8fnLIupSVG10Om1alxmzbURIIcaVNqYDyPyKQz3wBFqsCr6sTHGH9Xt3xBpdwBa5x
         iArW7jewW3/h0X/p3rMEkUKlLOZTrPx2IoPSDhriw9bDBPhfmno0bbSle+I0KGpBeiIA
         1nDL+YAG5nxLEB3iUUabd9cDd1xUt+7FQzli7MhCWmKiS2fGXU5EPvEAHoHrZqzOawLU
         ikiPq7k5RIBmzIQatb496T6TrMl8UdJEnc1SlzS+TWpNGwzxCkCcchOoQI2/j/HfBiZF
         2X10oYhVdtfc1yFF4nXdNuJg6KZc8McSm7BKK1fIfBcYLmkBh4qTpklx9pFV/kNcPgHM
         KrUQ==
X-Gm-Message-State: AOAM530+tsqEQMRw2MU3d1Rv4YZ0QSHds3ridfVp+faWmZADqTEEl2yC
        KL1MxLW2dn+zDBDjfbfDo5ZFi3XzFmAsAuKw
X-Google-Smtp-Source: ABdhPJxPQFhhi1f//zKscwPmmuTNsN+HkKo9ZZPLpV1bgBPsKMaslivRlGVFdAXX/APr6Tx55vb/oQ==
X-Received: by 2002:a05:6808:3b8:b0:322:a783:8fc8 with SMTP id n24-20020a05680803b800b00322a7838fc8mr7584151oie.189.1650666113629;
        Fri, 22 Apr 2022 15:21:53 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id js4-20020a056870bac400b000e687cdf5adsm1049224oab.55.2022.04.22.15.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 15:21:53 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [PATCH v5 3/7] usb: typec: mux: Check dev_set_name() return value
Date:   Fri, 22 Apr 2022 15:23:47 -0700
Message-Id: <20220422222351.1297276-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422222351.1297276-1-bjorn.andersson@linaro.org>
References: <20220422222351.1297276-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It's possible that dev_set_name() returns -ENOMEM, catch and handle this.

Fixes: 3370db35193b ("usb: typec: Registering real device entries for the muxes")
Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Added Fixes tag

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
2.35.1

