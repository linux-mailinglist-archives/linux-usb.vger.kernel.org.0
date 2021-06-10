Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1AB3A22F7
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 05:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbhFJDwG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 23:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhFJDwF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 23:52:05 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF0AC061574
        for <linux-usb@vger.kernel.org>; Wed,  9 Jun 2021 20:50:09 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id fy24-20020a17090b0218b029016c5a59021fso2935796pjb.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Jun 2021 20:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pwLscPt/B/b/5SFEs+HEyMeL+d3/cTsy8u9p+tu3dIo=;
        b=qv8v8cqG/Ai5hMpH29a1Q5T6WTaZ4NIrnjR7FhyNFtOKgcW9hmlCU70zYVrhvvDLqY
         UY33gGZykUoKQSAN9jQCoq/iedqBijDGaSG035hsMTsxxl2VjuFMFBycKVk4I8QL3dfS
         3ro3lQ0sgaBszICT3LUjgW505aUGgNdBPhJR1N8FyGvY4IhC8ir8pbLZX7y8JOXGxnwZ
         RNIWKR0wV3CaJBWXRzNxUUc26pgmlBhEJ8r1dEEjOxE56liOa4YtS1iuOnA9XdcXcHcm
         mYQSg17HTK0Xrh4dTpVrfJtw7GuzTm341QJDbqS5a44hgXqMoe0rVoeo4WJrpQhANm2b
         qSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=pwLscPt/B/b/5SFEs+HEyMeL+d3/cTsy8u9p+tu3dIo=;
        b=Yf96/KeEsw4f6CF9NplIBF/vkQ3bCPbwDgdKT+uoMbL6PAO91O4PUAXiN/+CzjUIgi
         ODDleraD1+pgLJiTY3tojd2F5KEEaWeP5x8AF5o7VcpYOHoTaTZ0xGXJraz2gNIuzWlu
         e+vEYWRABrAY5jmXiCjYguhjOBjW7UeWVWZEI9RhSilkT6/PfETS/ixskbn1n9GzCUQy
         Et15rtaFYOwddQbJuSNKntfvAcEZ2E/wSC7/Rhi0prqGdAnp03+15Vqhei3X/+Lk2vCL
         fL4LqLE2KrpIqgVfXEp1iAfl0Fj6WeoFB/fu2VYlYUI1Jh0YKo2wM3+HslZlXx63AgUf
         meww==
X-Gm-Message-State: AOAM530bMFA+MR1zGyX24xDfWzV5koKmn/qnKDy/vvDGWcjIcbRqXOhM
        MN+dyuOagGh5NQ2e2Lm0Kog=
X-Google-Smtp-Source: ABdhPJxYN735f1W6bGAzwHfU6tFYnMOyQ9KVGyE7AC5r+T8MjcCYyzO3aS0lWNvp10/46STzr3lIkw==
X-Received: by 2002:a17:90a:6289:: with SMTP id d9mr1157140pjj.84.1623297009088;
        Wed, 09 Jun 2021 20:50:09 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id j13sm1062652pgp.29.2021.06.09.20.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 20:50:08 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Fabio Estevam <festevam@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] usb: gadget: fsl: Re-enable driver for ARM SoCs
Date:   Thu, 10 Jun 2021 13:19:57 +0930
Message-Id: <20210610034957.93376-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The commit a390bef7db1f ("usb: gadget: fsl_mxc_udc: Remove the driver")
dropped the ARCH_MXC dependency from USB_FSL_USB2, leaving it depending
solely on FSL_SOC.

FSL_SOC is powerpc only; it was briefly available on ARM in 2014 but was
removed by commit cfd074ad8600 ("ARM: imx: temporarily remove
CONFIG_SOC_FSL from LS1021A"). Therefore the driver can no longer be
enabled on ARM platforms.

This appears to be a mistake as arm64's ARCH_LAYERSCAPE and arm32
SOC_LS1021A SoCs use this symbol. It's enabled in these defconfigs:

arch/arm/configs/imx_v6_v7_defconfig:CONFIG_USB_FSL_USB2=y
arch/arm/configs/multi_v7_defconfig:CONFIG_USB_FSL_USB2=y
arch/powerpc/configs/mgcoge_defconfig:CONFIG_USB_FSL_USB2=y
arch/powerpc/configs/mpc512x_defconfig:CONFIG_USB_FSL_USB2=y

To fix, expand the dependencies so USB_FSL_USB2 can be enabled on the
ARM platforms, and with COMPILE_TEST.

Fixes: a390bef7db1f ("usb: gadget: fsl_mxc_udc: Remove the driver")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Fix spelling of ARCH_LAYERSCAPE
---
 drivers/usb/gadget/udc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 8c614bb86c66..7348acbdc560 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -90,7 +90,7 @@ config USB_BCM63XX_UDC
 
 config USB_FSL_USB2
 	tristate "Freescale Highspeed USB DR Peripheral Controller"
-	depends on FSL_SOC
+	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST
 	help
 	   Some of Freescale PowerPC and i.MX processors have a High Speed
 	   Dual-Role(DR) USB controller, which supports device mode.
-- 
2.30.2

