Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFBF3A2287
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 05:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbhFJDDu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 23:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbhFJDDt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 23:03:49 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EABEC061574
        for <linux-usb@vger.kernel.org>; Wed,  9 Jun 2021 20:01:39 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso2895692pjb.5
        for <linux-usb@vger.kernel.org>; Wed, 09 Jun 2021 20:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/8ibD6cQOjhaJXZZr2PzLWT0t0cHU41OsDeIEIeHwvk=;
        b=K4auMbfs7bES5EGJD02j5sl9z3PZ0Ov5AeACVWNt7t+M9Z+Te+BI/oSrfnGDeA63+v
         EwVaKsVsKcOl9uOOqUJtquiW9nA0PhECGxIaerfC+uyLFzZjmbvrkWVAJME3jloSJCZt
         Qal1MqXrV1wRpRKZ65YdYXDiQOSDDJuEYwFJfLAvij4asR/teM/nIUV8vW/yWq8jqI0G
         SVbrZfDRXYLcDbZxHvRoQUfuIbB+2DYXxmfd0osSFJwp6TTRa8bJyGxsLbm1ZsysrzR4
         QvFb7w1wwTi3H6a1oKsmf2p7Cy+ejrfxtUqOMkLFUVesoYvciNezwZfBFrecWwjLGwac
         IFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=/8ibD6cQOjhaJXZZr2PzLWT0t0cHU41OsDeIEIeHwvk=;
        b=MdXKD4lB5tEaUCx4JWzoLhEJ0dMSiH9yxmWbR2DptQWpErX2D/CwoGl7poYeIOVv6W
         LXVSAFpMUH6uj+N7KQv+RvPiHF6ovvkyaUtUiUy/vSNEBLZ1IquMRI3Yer6o1hwBDPk5
         kGeDBfn8JRz1B/7rOr6s8GKVByEA9EMAigTGlJdz8Uvo2dqVkRqou5womsoYBYyDZA/O
         qwHUvgCcTJ32MByRVgYFLn7hbBehnFDb4rlRgag4wWlWZhazWQaV6+0ndt6ksmPf5hHd
         b0VNLrif2ogZnD1PWZ6o7yR/lMzBvq+iPXbYKuuLAywCR510cjkYhdeGuVatO7Xnq6Bi
         pc0g==
X-Gm-Message-State: AOAM5324ljBqFZ0fYfy5ITa4sBxE5lFjzhcda4Be0eaaV+eCstYVNHWi
        fKSU2YMnRSpQJ21DQvYRZVI=
X-Google-Smtp-Source: ABdhPJxPh+WNijaxuHCwr3/HM9pIKneYtLj8bcVNhZhX3Povq5muQ95sHwTqFyC3MwvvYPE80kYVxQ==
X-Received: by 2002:a17:90a:ea86:: with SMTP id h6mr979071pjz.71.1623294096376;
        Wed, 09 Jun 2021 20:01:36 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id s7sm60358pfh.57.2021.06.09.20.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 20:01:35 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Fabio Estevam <festevam@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] usb: gadget: fsl: Re-enable driver for ARM SoCs
Date:   Thu, 10 Jun 2021 12:30:35 +0930
Message-Id: <20210610030035.76864-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The commit a390bef7db1f ("usb: gadget: fsl_mxc_udc: Remove the driver")
dropped the ARCH_MXC dependency from USB_FSL_USB2, leaving it depending
solely on FSL_SOC.

FSL_SOC is powerpc only; it was briefly available on ARM in 2014 with
commit cfd074ad8600 ("ARM: imx: temporarily remove CONFIG_SOC_FSL from
LS1021A"). Therefore the driver can no longer be enabled on ARM
platforms.

This appears to be a mistake as arm64's ARCH_LAERSCAPE and arm32
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
 drivers/usb/gadget/udc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 8c614bb86c66..b32cea2fb99f 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -90,7 +90,7 @@ config USB_BCM63XX_UDC
 
 config USB_FSL_USB2
 	tristate "Freescale Highspeed USB DR Peripheral Controller"
-	depends on FSL_SOC
+	depends on FSL_SOC || ARCH_LAYERSACPE || SOC_LS1021A || COMPILE_TEST
 	help
 	   Some of Freescale PowerPC and i.MX processors have a High Speed
 	   Dual-Role(DR) USB controller, which supports device mode.
-- 
2.30.2

