Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 621DA1DB344
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 14:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgETMck (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 08:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbgETMci (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 08:32:38 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C0FC061A0F
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 05:32:38 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h17so2942233wrc.8
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 05:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uvIWbMez5QP4incIP6WPqITt/gWgPLWGE2WFsjw5LLo=;
        b=AL9MMpEgg9iF+FNdxoHVyPWZF8PbEUyqvw6orQIQ1n1RY3k/y2ULuOxYCw0M5gYAsr
         Ef82cEVsPhLHFJsIqainiLQWIXpxaWHSYKDA4fDRjvmKuyr3ZBO+1kOR1Qk2QmDeUMQ1
         pzF+Hv65f/XLGGJnTudlYl1N80IqnzblNT8b0T0rnn+x5ysz21Nxd5RNU51V9MyYJ493
         +9fR5mF47NsUVnEpZ5eWtCmF8TbnCQJyb4U8pXbBcJq4wop5kiUzl4PMJa0dmVW1f/+R
         0KArx3Q4QyAPuDGeR1E1kv1MlVkPF4tO8r9Wpe8rnPr82HuRQEvT55nPGvN5xwMqkGS5
         z5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uvIWbMez5QP4incIP6WPqITt/gWgPLWGE2WFsjw5LLo=;
        b=A17ovVl/XcZT03CzTFWgHUNf8VwhGijA8lcFGo/iJ73hHrEcHBrYtqCtm+NgLHxcdR
         QZlWfqBqhpUxdquvvtfVoe/3EeCQHlDWDlyLDwltEM4GMYSrtDVMYPfcgnGf66NfhwhU
         WtCo2XPfG09IKkt1fgIJO4/LYfW0hFm64HKJk3VWzTRgXv5Zb7thrpx2HBM7nrl+8378
         IsSJkF1aVvupdORJ94X3qfpg20PnGcxIaBnf37haqwgKlanSXxzHrkGJnrRRYqF8pYe3
         ifTdgovHCSZGjKUPh7FILEwYLCfP8rw8z5b0axRs8KkUXXQ2XudAjf+P1UbCaYZ1GS6F
         nJog==
X-Gm-Message-State: AOAM531u8MInv87KTD+azkjYAOAw6Z6L+IdrE81NuxzMBYumLflaCN7J
        rf99r8pH4MLeqNVy4Q7BVE6v6lzVJ2s=
X-Google-Smtp-Source: ABdhPJwbjzSMOOzwZBMsbPACvMultyucu479rWMCv2kRkD9TxbU7CYX5ysrY9xLgohAciAB5Z6eXDQ==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr4001535wrn.109.1589977956701;
        Wed, 20 May 2020 05:32:36 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id g6sm2649861wrp.75.2020.05.20.05.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 05:32:36 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 1/2] usb: typec: Ensure USB_ROLE_SWITCH is selected for tps6598x
Date:   Wed, 20 May 2020 13:33:11 +0100
Message-Id: <20200520123312.320281-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200520123312.320281-1-bryan.odonoghue@linaro.org>
References: <20200520123312.320281-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When I switched on USB role switching for the tps6598x I completely forgot
to add the Kconfig dependency.

Ensure USB_ROLE_SWITCH is selected to prevent the typs6598x driver being
compiled in but the role-switch driver being compiled as a module, leading
to link error.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/typec/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index b4f2aac7ae8a..a6cdf4ec0be6 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -64,6 +64,7 @@ config TYPEC_HD3SS3220
 config TYPEC_TPS6598X
 	tristate "TI TPS6598x USB Power Delivery controller driver"
 	depends on I2C
+	select USB_ROLE_SWITCH
 	select REGMAP_I2C
 	help
 	  Say Y or M here if your system has TI TPS65982 or TPS65983 USB Power
-- 
2.25.1

