Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D671DAFA1
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 12:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgETKE7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 06:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETKE7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 06:04:59 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CDAC061A0E
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 03:04:57 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id n5so2251562wmd.0
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLvo6tZEBvTorUy2oD3r4Oa6pziEBTlxgdUU+Pbkrpw=;
        b=jNw1ZELCdjl8nRVsM44rMlK/kcDGHleJNn5oEPV173FokcN1MoKN5LgAufIjGczuNI
         zveThWXIXm5yORH5hF0fqyhNLu1ql7skSnkzoMhqUh/+pr9h92aDEvB+575E+Smx2db+
         gNNd3U/k3WUy8XjTHWp65ZmMqBogYkkrOdpIxID9SvMz55dPSOXJVMMak6SaIU9rFWsa
         GU/JjVpn1zmjGPsNIYMrXEsvH61HxCgKDh5D0MS0h+JsLpaACCTR5umoPnYhak3irPq4
         /wW1nzN4z8uV2iB6LuAmNGP4aJLQ9rvBx8vtWrMHorSVnzFpLKysgNa+60AwaLjf/Vey
         jnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLvo6tZEBvTorUy2oD3r4Oa6pziEBTlxgdUU+Pbkrpw=;
        b=FJeQXv1X/NREIhx1H1yrmoqpvc+IKey57oP/rGUQQOQ+ifNc+hei0tiYNUVZJGLUhb
         qHwMnMeVBPmA1jhrA3N0oeSBQBO6UXWlca83Bo0lJZXtLPiR8TSsogEDb4Lnwrc605HS
         roBfupw5wx+VnxBk/l8ynkCWWkuoTwO40tpa/UNeYpedk4l/L3qqhh77Qx1sMa+79gZI
         TszD6hgq+FjLG6ZX5xTTbxRHeBzOkCwiYfeCT8M+3e2cNyRhwYxZJSt3SBeBnFR6ma4C
         w5Dc3gqQBnhsef16lhAV9VrCgI2k+UMibckgVpnkuIhulD9PahPD4oioM9yIEAd3yCMt
         7lXg==
X-Gm-Message-State: AOAM5322kj+4xmZp65J2ueOw467LKmUCHeOShtrgKDX/6rESA5+C4uQ6
        gBCbvxYdCPUrdEIPMfsnSWkKJtjOX4U=
X-Google-Smtp-Source: ABdhPJzWyqbRNqk/Z6at46eQycSznnhdlzoHjFZqQ0Efw41MAhgSZCRKmpPzSoKF30t/LJJ9JuE9bw==
X-Received: by 2002:a1c:307:: with SMTP id 7mr4001924wmd.104.1589969096053;
        Wed, 20 May 2020 03:04:56 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id v8sm2612013wrs.45.2020.05.20.03.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 03:04:55 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] usb: typec: Ensure USB_ROLE_SWITCH is a dependency for tps6598x
Date:   Wed, 20 May 2020 11:05:26 +0100
Message-Id: <20200520100526.2729-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When I switched on USB role switching for the tps6598x I completely forgot
to add the Kconfig dependency.

This patch ensures the dependency is there to prevent compilation error
when role-switching is off.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/typec/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index b4f2aac7ae8a..4ea18301b15e 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -64,6 +64,7 @@ config TYPEC_HD3SS3220
 config TYPEC_TPS6598X
 	tristate "TI TPS6598x USB Power Delivery controller driver"
 	depends on I2C
+	depends on USB_ROLE_SWITCH
 	select REGMAP_I2C
 	help
 	  Say Y or M here if your system has TI TPS65982 or TPS65983 USB Power
-- 
2.25.1

