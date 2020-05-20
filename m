Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADEFD1DB85F
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 17:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgETPfo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 11:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgETPfo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 11:35:44 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF76CC061A0E
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 08:35:42 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g12so2414720wrw.1
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 08:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U0pCwQKh6b2J78ss79LtQqnEVpeh27wxo+WbRB4jcF4=;
        b=M5GMu/Y7sVQcfY0GyDhTKOgTwH18vUEy/8hsdgnyGsYByakHFTdzhpDct+NUnIMncO
         Tu/VxylSl1pwKqnzbMox1GsRRmVd7eTbedKK64HISIIvMcffVfuIC6ZSQqmqtQYLm5sR
         iBOnIzCL5uCmyfyCTK1FgU+ZQdodNCRQhpAh9bSQRyp6I1gRphC3PTPv9cGP6viVTO7v
         HQEZLoTEUnPuaznxL4ZHsFuvLLkFheGNmUfwyCWytdB4+Aw9j4NVnxGFnNoqT1VxfqFo
         dh44jMQDBhEpK3oB8YsKrvQj2Yn3mS/zYEMGg3Amk+6dSCE9YG+bwFCaZumNuID6zCA7
         kWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U0pCwQKh6b2J78ss79LtQqnEVpeh27wxo+WbRB4jcF4=;
        b=h5KZr8SjtajPdmunRiGRRQgK5IvQ9EIQZHSf8lCefUpnbUfDqgPVNMnb0YlGItu+Hk
         KZrOFdzKzSNVGE/eZb0FM1ir9cXeq32xlkXgy/0Bi3EBXm5pN/4oQiZlJNXC81itpq0Y
         MdaspUCdrpDe5w3unrg4oBp5ZsG3pDd7uNpMt0S2x6DNS7IcG76fSlWLKEmd0u5LzLgc
         Yz+huUTTIP4UwZKMVSYsB/LA8mwRRrKSWCfw4tG3OxdnLTcC6p/xCFApA8h1M1vsYCQK
         DkOSxGpQW70+G9vn3EqU01ld+XDUpLDP9g7NZvBk03zt/rbp93U+5gTgKF1KY4NQcwUu
         s3Mg==
X-Gm-Message-State: AOAM531mDoFpAXbmq6doHpGtw5LQWdECGusAAbK+MW603n8UNJuhLAXU
        9fdGFub1GEbyQxU6ZPKOpXOiCbkJ9Ss=
X-Google-Smtp-Source: ABdhPJyrIXe8u/Wkc1e/M3UlV5M0XM/6dM74+C4wt+cCegAggnzcxEEHWOQolg/y/ihhmShrgWvmoA==
X-Received: by 2002:a5d:4484:: with SMTP id j4mr4569355wrq.325.1589988941377;
        Wed, 20 May 2020 08:35:41 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id n7sm2067591wrj.39.2020.05.20.08.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 08:35:40 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Cc:     shawn.guo@linaro.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3] usb: typec: Ensure USB_ROLE_SWITCH is set as a dependency for tps6598x
Date:   Wed, 20 May 2020 16:36:17 +0100
Message-Id: <20200520153617.610909-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
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

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/typec/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index b4f2aac7ae8a..559dd06117e7 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -64,7 +64,8 @@ config TYPEC_HD3SS3220
 config TYPEC_TPS6598X
 	tristate "TI TPS6598x USB Power Delivery controller driver"
 	depends on I2C
-	select REGMAP_I2C
+	depends on REGMAP_I2C
+	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
 	help
 	  Say Y or M here if your system has TI TPS65982 or TPS65983 USB Power
 	  Delivery controller.
-- 
2.25.1

