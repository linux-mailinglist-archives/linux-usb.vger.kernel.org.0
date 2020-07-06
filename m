Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4790C215883
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729199AbgGFNeI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729318AbgGFNeG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:34:06 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59347C061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:34:06 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w3so29667701wmi.4
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2XV6WS/bjGR5kvGNxTMlo6KlRGNUtCcJKS3bvPtDJNg=;
        b=fczPaGVofLQoIlvYv0yf39Kkx0ejpT8IQpmzlyEiDrJUrZ/MVqPYhOAJMwVAKoB1ZU
         6J89HvSTdqwH4sVQ9ehrAlrY3rUMG4ReE6aDw3yaZbWeVDRbwD2ZN/LGf5R7IYcwl16l
         pUjsgPJLFd9N9yyj+ewLUNlIVcCseEtDtuxb+wQFF8GdHXhG4QBEmkxfd/G1ipCvMoRm
         jh5DxCSHMunlB+DcdKO4cvt+K41fR+0zlKIzEj8el/peWXv+2bbw3u3V69lc+c9I2loI
         xLGaaq388tf6iFV/oZSWojK8abf0KikizWybxZt7Q1cMFodxZXt0vZUlLJkj3kNY/f/5
         TaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2XV6WS/bjGR5kvGNxTMlo6KlRGNUtCcJKS3bvPtDJNg=;
        b=Id4WmpVA+GfeWAom+lzyApygMBfMFNuFyNGL7JhuI4fu64AOpi80l0aWXeSUMloB3j
         rbl5kjYFjvxPjjx550kx0XQRJjkulmbFyOxOMXT64ZOFG09N3+pbStiFVoH1WZShdkLQ
         e1VXUtuxLOH5XuKEQwPvVntcSsTgbNxpSgDBmL+urIQQzmvRhFL+HZQzxMM1FGLbHVun
         bNjAL3FzrxPh+RYSEapxS26ZIy3AnRVAsExyunuvZQ/Fcg7onqzTXGDQ6O92yK0tt/NU
         aX1Y3k01ZT6W2I4wntPobNN8hVw+7FDgVJWPMhYCWl+x3c4i/8r09O8wmzWUrT1SNUOD
         apmQ==
X-Gm-Message-State: AOAM533GKD1Q+nlLuBEbuXspsQing8QuBs7DQdpg0GB4vz/KHKPEZ69L
        d9bPRq3cr1M2StDZVo2NVtoCKg==
X-Google-Smtp-Source: ABdhPJzh1m0Q8D26lQhCsRUAqNMwqePsc1dSEF5Rz1dklZVY+dBtULcNL8uqxOmLNNODWphQLHWsxg==
X-Received: by 2002:a7b:cc92:: with SMTP id p18mr51112164wma.4.1594042445108;
        Mon, 06 Jul 2020 06:34:05 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:04 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Randy Vinson <rvinson@mvista.com>,
        Dave Liu <daveliu@freescale.com>,
        Jerry Huang <Chang-Ming.Huang@freescale.com>,
        Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: [PATCH 17/32] usb: host: ehci-fsl: Fix incorrectly named function argument
Date:   Mon,  6 Jul 2020 14:33:26 +0100
Message-Id: <20200706133341.476881-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/host/ehci-fsl.c:694: warning: Function parameter or member 'pdev' not described in 'fsl_ehci_drv_remove'
 drivers/usb/host/ehci-fsl.c:694: warning: Excess function parameter 'dev' description in 'fsl_ehci_drv_remove'

Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Randy Vinson <rvinson@mvista.com>
Cc: Dave Liu <daveliu@freescale.com>
Cc: Jerry Huang <Chang-Ming.Huang@freescale.com>
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/ehci-fsl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 9e9c232e896fa..1ebe4d425277d 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -683,7 +683,7 @@ static const struct ehci_driver_overrides ehci_fsl_overrides __initconst = {
 
 /**
  * fsl_ehci_drv_remove - shutdown processing for FSL-based HCDs
- * @dev: USB Host Controller being removed
+ * @pdev: USB Host Controller being removed
  * Context: !in_interrupt()
  *
  * Reverses the effect of usb_hcd_fsl_probe().
-- 
2.25.1

