Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746B528001F
	for <lists+linux-usb@lfdr.de>; Thu,  1 Oct 2020 15:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732292AbgJAN2P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Oct 2020 09:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732208AbgJAN2O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Oct 2020 09:28:14 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A620C0613E2
        for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2020 06:28:13 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id e2so3097848wme.1
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2020 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=cJ4glN5x+fceHO8drCanza2N1tIoBVi6ERZORMAgvMo=;
        b=Nm9rn+eArD1tlPa8xF2Q1MfLskZzb+DdmOhakgyMsWP8KPPOOZHQB9QrEdjdDkZEIH
         UxyYPBJ+m+OD98LXnxtQlBra8a9vv8F2JXveWx5BJ8iB3lPGGEPEIyZsL1hu7D76VTQv
         b04LY1JCoB/yRAY63+GFax74NGnUohIhsQCZpLDx7QpKEyEUiez40zqglIaOfTUo6Xf5
         WCF3rKl5AkS94XgdXjBVXN+u4irluOvVjWJ+6VGEsigsNO2wt//i3bxqgpu31isz+gpI
         FIWkW1fWgm5slab23uWfsXUmmpBFngZsFAFZWrFkPttt/ORO2K9ykPQWjca4E6cB5y+D
         aPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cJ4glN5x+fceHO8drCanza2N1tIoBVi6ERZORMAgvMo=;
        b=Ty4cJSGcu8tHPIWc6A/tHDr5Qo8tBDb872iP5PvvcCLZpKP1NwoSs1P9VykGNJeK4r
         jesXhUxAyOl10TeQ1pF3bUZLR8f3JfORMk8OeIBgF+rvYEOvHpV/Wu2AFbwhhELkagkz
         67ubW0YNcBQvYjq1+iafWZU6BTcx2s4EpIoGEVNeaFSwH6AZd4N9NgsHaME1kyNYfRbn
         MEslTKBxwH1Tqz3TGUBD9IGGSzyXlHevCMcXKVXRTZDLwrhQGwPHo6S3TdaAZE2y/5DI
         2y/MM3z1+pjDc0Iq99SOgE9daTkZNQpeseXEwt08F8GpFXsxBg2Pbje8S7HSBMIQ27UZ
         0RGg==
X-Gm-Message-State: AOAM530cU4qU8SOLTan168xfa2nrfZzMBHSc1DnuPFO+UFAw7fjsY7U2
        60jQ0unRerzjEKl34fdPdj3Jng==
X-Google-Smtp-Source: ABdhPJxqWPN6haSrZ0MteEjdgcOMc9WlWpLXGGXo/0dQE9R3CbYiPB9JDg7Nt6YUIWmvZPTgcFCYmw==
X-Received: by 2002:a1c:1dd0:: with SMTP id d199mr4856wmd.7.1601558891796;
        Thu, 01 Oct 2020 06:28:11 -0700 (PDT)
Received: from amjad-ThinkPad-T490.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id m10sm8584950wmi.9.2020.10.01.06.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 06:28:11 -0700 (PDT)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-usb@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] reset: Add reset controller API
Date:   Thu,  1 Oct 2020 15:27:58 +0200
Message-Id: <20201001132758.12280-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current reset framework API does not allow to release what is done by
reset_control_reset(), IOW decrement triggered_count. Add the new
reset_control_resettable() call to do so.

When reset_control_reset() has been called once, the counter
triggered_count, in the reset framework, is incremented i.e the resource
under the reset is in-use and the reset should not be done again.
reset_control_resettable() would be the way to state that the resource is 
no longer used and, that from the caller's perspective, the reset can be 
fired again if necessary.

This patch will fix a usb suspend warning seen on the libretech-cc
related to the shared reset line. This warning was addressed by the 
previously reverted commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared
reset control use")

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/core.c  | 57 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/reset.h |  1 +
 2 files changed, 58 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 01c0c7aa835c..53653d4b55c4 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -207,6 +207,19 @@ static int reset_control_array_reset(struct reset_control_array *resets)
 	return 0;
 }
 
+static int reset_control_array_resettable(struct reset_control_array *resets)
+{
+	int ret, i;
+
+	for (i = 0; i < resets->num_rstcs; i++) {
+		ret = reset_control_resettable(resets->rstc[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int reset_control_array_assert(struct reset_control_array *resets)
 {
 	int ret, i;
@@ -324,6 +337,50 @@ int reset_control_reset(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_reset);
 
+/**
+ * reset_control_resettable - decrements triggered_count of the controlled device
+ * @rstc: reset controller
+ *
+ * On a shared reset line the actual reset pulse is only triggered once for the
+ * lifetime of the reset_control instance, except if this function is used.
+ * In fact, It decrements triggered_count that makes sure of not allowing
+ * a reset if triggered_count is not null.
+ *
+ * This is a no-op in case triggered_count is already null i.e shared reset line
+ * is ready to be triggered.
+ *
+ * Consumers must not use reset_control_(de)assert on shared reset lines when
+ * reset_control_reset has been used.
+ *
+ * If rstc is NULL it is an optional clear and the function will just
+ * return 0.
+ */
+int reset_control_resettable(struct reset_control *rstc)
+{
+	if (!rstc)
+		return 0;
+
+	if (WARN_ON(IS_ERR(rstc)))
+		return -EINVAL;
+
+	if (reset_control_is_array(rstc))
+		return reset_control_array_resettable(rstc_to_array(rstc));
+
+	if (rstc->shared) {
+		if (WARN_ON(atomic_read(&rstc->deassert_count) != 0))
+			return -EINVAL;
+
+		if (atomic_read(&rstc->triggered_count) > 0)
+			atomic_dec(&rstc->triggered_count);
+	} else {
+		if (!rstc->acquired)
+			return -EPERM;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(reset_control_resettable);
+
 /**
  * reset_control_assert - asserts the reset line
  * @rstc: reset controller
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 05aa9f440f48..ffa447d0d1d6 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -13,6 +13,7 @@ struct reset_control;
 #ifdef CONFIG_RESET_CONTROLLER
 
 int reset_control_reset(struct reset_control *rstc);
+int reset_control_resettable(struct reset_control *rstc);
 int reset_control_assert(struct reset_control *rstc);
 int reset_control_deassert(struct reset_control *rstc);
 int reset_control_status(struct reset_control *rstc);
-- 
2.17.1

