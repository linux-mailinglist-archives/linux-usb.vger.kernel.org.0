Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF7E1DB347
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 14:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgETMcl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 08:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbgETMcj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 08:32:39 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548C7C061A0E
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 05:32:39 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w64so2665998wmg.4
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 05:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SqdDQHxVqdNrMMYU11R4vaFfKEy10Zt1ixpViRntZEU=;
        b=MMUdilXX+jrjAJBdCm7SOIbUI1vGidcUg2yFlIFXE8ncWrOln7UImFj+DyHmvym5X5
         NLjj+BA4krxpGT2mTDmoMg+PjVxB+9VaRTxqVQkod+UiW2Rew3vsn3UUglzC8m7qDk79
         +Z6cO5EPeHVaxHMhRNiGFrvzwKOYUqfmG1At4jTHN6kAfeZKzEZsBwJvZZJ9FCBjI9Gz
         kpRYJemEnQaTsLV1zesP1KmLGFXdYGkb/AFnySsKPP8lmtihVoKlq1Ge38f5fdeWs7Tf
         12wlBr+Ijxg51MqA3uXH6aju5PvBwjDU7QiHrHMVkISjSBl3jnvSD0d86Bz7SJbZj2/k
         e9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SqdDQHxVqdNrMMYU11R4vaFfKEy10Zt1ixpViRntZEU=;
        b=F7cgV3eKtJX2aaYXBkmmgqOVPnALLQde3SyshKJXUvcq9Rx2rCYmquL/3jL8LwwGRC
         rNv62kFQ5tz369i64xXqlEZ1YIa71AYsTdXbTsFHhBWRZ0t5uYIx3wMXucBOrr8BQ9k0
         HDp9UEsab9gX8RxTJR+wWi2HpH6teauc7VbA70AN+1ktL3mQqwAR0Ln95TZE3kbiXAN8
         4535/8a2McZCCyqqsMr0NNRDl0Wc92hgiOLzP/XLG5Bbgt/mpYjG2d4qrVPgrb49ySkC
         rY8MHG66NdFtXsTFFGZzRxBiZ2wguU9Y+1QN3qaDDxwn7pdyVYOipVbb60DPoFzOn1vj
         jBRA==
X-Gm-Message-State: AOAM531Q0GCQvGry81Fb/tRnR/vY6NqK7QvEwkIhwkyCfyHejaAcmaaE
        3/Dv/n2zWttWrtT09+Jsfnb9782Rg34=
X-Google-Smtp-Source: ABdhPJyojMyUQdst+4f69ijyiNyQPsHtfi/U2dtDhG5o+f+hRduZQzzPlzMAjE9LUaPakg7izEVrrw==
X-Received: by 2002:a1c:9d85:: with SMTP id g127mr4194226wme.149.1589977957763;
        Wed, 20 May 2020 05:32:37 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id g6sm2649861wrp.75.2020.05.20.05.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 05:32:37 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 2/2] usb: typec: Ensure USB_ROLE_SWITCH is selected for hd3ss3220
Date:   Wed, 20 May 2020 13:33:12 +0100
Message-Id: <20200520123312.320281-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200520123312.320281-1-bryan.odonoghue@linaro.org>
References: <20200520123312.320281-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

kbuild found a compile error with recent additions to the tps6598x to add
role-switch notification support. Digging into that error it turns out we
needed to add "select USB_ROLE_SWITCH" to Kconfig.

Adding "depends on USB_ROLE_SWITCH" as had previously been done for this
driver could still result in a link-time failure.

This patch propagates the tps6598x fix to hd3ss3220.

Fixes: da4b5d18dd94 ("usb: typec: add dependency for TYPEC_HD3SS3220")

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/typec/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index a6cdf4ec0be6..8f84304802f4 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -53,7 +53,7 @@ source "drivers/usb/typec/ucsi/Kconfig"
 config TYPEC_HD3SS3220
 	tristate "TI HD3SS3220 Type-C DRP Port controller driver"
 	depends on I2C
-	depends on USB_ROLE_SWITCH
+	select USB_ROLE_SWITCH
 	help
 	  Say Y or M here if your system has TI HD3SS3220 Type-C DRP Port
 	  controller driver.
-- 
2.25.1

