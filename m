Return-Path: <linux-usb+bounces-15344-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D52789840D4
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 10:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5ED01F219CD
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 08:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958A4150981;
	Tue, 24 Sep 2024 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rYiBmXMi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A912E14F123
	for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 08:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167427; cv=none; b=oqHYVo3P4fifisi9QSuLVjezYnE6lG28nzCO2O7eKywE6+9B4ihGeHAfM2kckqls4xFyYiFi9RuSxdYrPyeMj+Mp9V2jOwHy3liKCrl45jR1h2CcVnSNiNlVMXwuYsv5zabjEEYqM4aEvTLQw/k0E6PDhPwViezCwYgvSr1C5ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167427; c=relaxed/simple;
	bh=Mj4u+ITbiHt2BrLynqdFqRUVD2wiITHLXPIiqLdioO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PDfuwNUxXeqt8EAmlo3axUsSSR49elHVZgsWXWige8mBwPBc/Jro5YYvIWzzAWR7WChVg59+6uP/Y4lua0F4XKHguvIOxX6RsK+KfeTVocneZz+EJ1/qYCO7LolWFHtopJdHSlgLVOJT4ZlGqjilTCkCHq8YyO9n7aoGdx79md0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rYiBmXMi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so45399335e9.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 01:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727167420; x=1727772220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UrcxJOOntXmyfWnA7WuQxFhVvIUAv6fSX81uPFr5WuI=;
        b=rYiBmXMislEt0jE2wZ4NjrrE7VrvhmreuRpm3kdFeW4TxPIRaOLZYlxplI53I0fC2Q
         YTWND3BaGw5AOmxwLH6zpbqYJaKCq3TiPDrmsoORa1KBVKaiu6cACg4ZpftiowBQXf3C
         dHDZ3jpx9dGFQy1AmuB/13NUOQM9QUs3H9DPXi+8u+eT+PEIVr7MnUHYVE/18ZQRimmx
         +JESQn+m6yW7kwzrnaMNekgImcnFRYjGze1P3QpQhwVdHPKr6nbq+5VaV5gYv+Xx79E2
         fSZFKR7FGf8qEOtpDAd1BOCHDAbZL0liXJn0zjGmc/2Q05nBTynormE79Zzo/7lQtQtf
         lhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727167420; x=1727772220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrcxJOOntXmyfWnA7WuQxFhVvIUAv6fSX81uPFr5WuI=;
        b=vvI4hxV9Xtd42JQD16EuBmc6yKtYc+EgoM+YgoeojOykbN/+SKTYk3f6HeUuLr/P/N
         iGXq/aj8/ikBGYAzQVh9NppTIIP9aKrE3om2/Q0FI+Wx8QN9bl9jvdR8klb9bfHBc/go
         yszNXcEMd1owl5DP4VTJhNbxH7oNqcmFjWsrLTwiKbFGcd3/5rRVBW8T1nVhKWkWy4up
         FJ3w2QonL1IejNfb3V9aClNtH9+JZJcYr1JgJtOx1GI2bOE6RmZWNEkZhRhMdy8R0GYK
         7ca4gBmpyJejejclAOyeC17BZnaClPjaE/Q//r8w5+OBUbnjMKKl3qozm1zHiIQvCJL1
         vZsg==
X-Gm-Message-State: AOJu0YynkFMWcOTqWayZptSFkP3lu/o2uEkFC0nHPrYC24wEyvquroyb
	3hqDofo8gcQjsY2NZU5eY74hQtrdV4ic8HhtB4ZcphgF0Ij2o7E2lNQwFQvgQpI=
X-Google-Smtp-Source: AGHT+IHfOGrBCt+glW0zja+UtjXEjALQh//HLVliFHgGlxVcD0LCqqiF6Le3OLOFoV3+TiHtKr7dog==
X-Received: by 2002:a05:600c:314a:b0:42c:dce1:8915 with SMTP id 5b1f17b1804b1-42e7add75fbmr108091565e9.33.1727167419625;
        Tue, 24 Sep 2024 01:43:39 -0700 (PDT)
Received: from localhost (amontpellier-556-1-151-252.w109-210.abo.wanadoo.fr. [109.210.7.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7543ac4fsm149696805e9.19.2024.09.24.01.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 01:43:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: Switch back to struct platform_driver::remove()
Date: Tue, 24 Sep 2024 10:43:29 +0200
Message-ID: <20240924084329.53094-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=75948; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Mj4u+ITbiHt2BrLynqdFqRUVD2wiITHLXPIiqLdioO8=; b=owGbwMvMwMXY3/A7olbonx/jabUkhrRP1RtnRwX+FC+8GfxTkKO0R9Wl6/ceWYlJnLkPguILc w82yx3vZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiR+rY/8dxXagsmcmhKSBx m+0xY9b5orT/HPE8B8Pf39lVlWv+5kh00t3X+6Y6Ja0uVDCtkHjeaP6bjUHE7MnnfqGifNeotbF 7/jY9CVgsMPtSxQW72rTZi3dydG7/atPQI7Ne/kCB1jK9hH1zVG/rffxYmfpEWqibP2BicTl3Fo /PM9/PUT9DWiXS/Y81f3LpDp05vSpiofHtlwbpwdEG2SIiKzoer8uOdhda++zx6egMVvY48y7HU ubJz+YFsqfY+ehEV/U/duO7abF45hK3DOsFiSHxkX8OvGhW3vmjWHFm99GMQzoRjPdu6sysqg5a //POoSkXU3wvCt1ZctI84gCD8Lv2AH6fxJ5yJolPKWcA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/usb to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello Greg,

given the simplicity of the individual changes I do this all in a single
patch. Please tell and I will happily split it for an improved commit
count :-) I based this on today's next, feel free to drop changes that
result in a conflict when you come around to apply this. I'll care for
the fallout at a later time then. (Having said that, if you use b4 am -3
and git am -3, there should be hardly any fallout.)

Note I didn't Cc: all the individual driver maintainers to not trigger
sending limits and spam filters.

Best regards
Uwe

 drivers/usb/c67x00/c67x00-drv.c                | 2 +-
 drivers/usb/cdns3/cdns3-imx.c                  | 2 +-
 drivers/usb/cdns3/cdns3-plat.c                 | 2 +-
 drivers/usb/cdns3/cdns3-starfive.c             | 2 +-
 drivers/usb/cdns3/cdns3-ti.c                   | 2 +-
 drivers/usb/chipidea/ci_hdrc_imx.c             | 2 +-
 drivers/usb/chipidea/ci_hdrc_msm.c             | 2 +-
 drivers/usb/chipidea/ci_hdrc_npcm.c            | 2 +-
 drivers/usb/chipidea/ci_hdrc_tegra.c           | 2 +-
 drivers/usb/chipidea/ci_hdrc_usb2.c            | 2 +-
 drivers/usb/chipidea/core.c                    | 2 +-
 drivers/usb/common/usb-conn-gpio.c             | 2 +-
 drivers/usb/dwc2/platform.c                    | 2 +-
 drivers/usb/dwc3/core.c                        | 2 +-
 drivers/usb/dwc3/dwc3-am62.c                   | 2 +-
 drivers/usb/dwc3/dwc3-exynos.c                 | 2 +-
 drivers/usb/dwc3/dwc3-imx8mp.c                 | 2 +-
 drivers/usb/dwc3/dwc3-keystone.c               | 2 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c             | 2 +-
 drivers/usb/dwc3/dwc3-octeon.c                 | 2 +-
 drivers/usb/dwc3/dwc3-of-simple.c              | 2 +-
 drivers/usb/dwc3/dwc3-omap.c                   | 2 +-
 drivers/usb/dwc3/dwc3-qcom.c                   | 2 +-
 drivers/usb/dwc3/dwc3-rtk.c                    | 2 +-
 drivers/usb/dwc3/dwc3-st.c                     | 2 +-
 drivers/usb/dwc3/dwc3-xilinx.c                 | 2 +-
 drivers/usb/fotg210/fotg210-core.c             | 2 +-
 drivers/usb/gadget/legacy/hid.c                | 2 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c      | 2 +-
 drivers/usb/gadget/udc/aspeed_udc.c            | 2 +-
 drivers/usb/gadget/udc/at91_udc.c              | 2 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c        | 2 +-
 drivers/usb/gadget/udc/bcm63xx_udc.c           | 2 +-
 drivers/usb/gadget/udc/bdc/bdc_core.c          | 2 +-
 drivers/usb/gadget/udc/dummy_hcd.c             | 4 ++--
 drivers/usb/gadget/udc/fsl_qe_udc.c            | 2 +-
 drivers/usb/gadget/udc/fsl_udc_core.c          | 2 +-
 drivers/usb/gadget/udc/fusb300_udc.c           | 2 +-
 drivers/usb/gadget/udc/gr_udc.c                | 2 +-
 drivers/usb/gadget/udc/lpc32xx_udc.c           | 2 +-
 drivers/usb/gadget/udc/m66592-udc.c            | 2 +-
 drivers/usb/gadget/udc/mv_u3d_core.c           | 2 +-
 drivers/usb/gadget/udc/mv_udc_core.c           | 2 +-
 drivers/usb/gadget/udc/net2272.c               | 2 +-
 drivers/usb/gadget/udc/omap_udc.c              | 2 +-
 drivers/usb/gadget/udc/pxa25x_udc.c            | 2 +-
 drivers/usb/gadget/udc/pxa27x_udc.c            | 2 +-
 drivers/usb/gadget/udc/r8a66597-udc.c          | 2 +-
 drivers/usb/gadget/udc/renesas_usb3.c          | 2 +-
 drivers/usb/gadget/udc/renesas_usbf.c          | 2 +-
 drivers/usb/gadget/udc/rzv2m_usb3drd.c         | 2 +-
 drivers/usb/gadget/udc/snps_udc_plat.c         | 2 +-
 drivers/usb/gadget/udc/tegra-xudc.c            | 2 +-
 drivers/usb/gadget/udc/udc-xilinx.c            | 2 +-
 drivers/usb/host/ehci-atmel.c                  | 2 +-
 drivers/usb/host/ehci-brcm.c                   | 2 +-
 drivers/usb/host/ehci-exynos.c                 | 2 +-
 drivers/usb/host/ehci-fsl.c                    | 2 +-
 drivers/usb/host/ehci-grlib.c                  | 2 +-
 drivers/usb/host/ehci-mv.c                     | 2 +-
 drivers/usb/host/ehci-npcm7xx.c                | 2 +-
 drivers/usb/host/ehci-omap.c                   | 2 +-
 drivers/usb/host/ehci-orion.c                  | 2 +-
 drivers/usb/host/ehci-platform.c               | 2 +-
 drivers/usb/host/ehci-ppc-of.c                 | 2 +-
 drivers/usb/host/ehci-sh.c                     | 2 +-
 drivers/usb/host/ehci-spear.c                  | 2 +-
 drivers/usb/host/ehci-st.c                     | 2 +-
 drivers/usb/host/ehci-xilinx-of.c              | 2 +-
 drivers/usb/host/fhci-hcd.c                    | 2 +-
 drivers/usb/host/fsl-mph-dr-of.c               | 2 +-
 drivers/usb/host/isp116x-hcd.c                 | 2 +-
 drivers/usb/host/isp1362-hcd.c                 | 2 +-
 drivers/usb/host/octeon-hcd.c                  | 4 ++--
 drivers/usb/host/ohci-at91.c                   | 2 +-
 drivers/usb/host/ohci-da8xx.c                  | 2 +-
 drivers/usb/host/ohci-exynos.c                 | 2 +-
 drivers/usb/host/ohci-nxp.c                    | 2 +-
 drivers/usb/host/ohci-omap.c                   | 2 +-
 drivers/usb/host/ohci-platform.c               | 2 +-
 drivers/usb/host/ohci-ppc-of.c                 | 2 +-
 drivers/usb/host/ohci-pxa27x.c                 | 2 +-
 drivers/usb/host/ohci-s3c2410.c                | 2 +-
 drivers/usb/host/ohci-sm501.c                  | 2 +-
 drivers/usb/host/ohci-spear.c                  | 2 +-
 drivers/usb/host/ohci-st.c                     | 2 +-
 drivers/usb/host/oxu210hp-hcd.c                | 2 +-
 drivers/usb/host/r8a66597-hcd.c                | 2 +-
 drivers/usb/host/sl811-hcd.c                   | 2 +-
 drivers/usb/host/uhci-grlib.c                  | 2 +-
 drivers/usb/host/uhci-platform.c               | 2 +-
 drivers/usb/host/xhci-histb.c                  | 2 +-
 drivers/usb/host/xhci-mtk.c                    | 2 +-
 drivers/usb/host/xhci-plat.c                   | 2 +-
 drivers/usb/host/xhci-rcar.c                   | 2 +-
 drivers/usb/host/xhci-tegra.c                  | 2 +-
 drivers/usb/isp1760/isp1760-if.c               | 2 +-
 drivers/usb/misc/onboard_usb_dev.c             | 2 +-
 drivers/usb/misc/qcom_eud.c                    | 2 +-
 drivers/usb/misc/usb3503.c                     | 2 +-
 drivers/usb/mtu3/mtu3_plat.c                   | 2 +-
 drivers/usb/musb/da8xx.c                       | 2 +-
 drivers/usb/musb/jz4740.c                      | 2 +-
 drivers/usb/musb/mediatek.c                    | 2 +-
 drivers/usb/musb/mpfs.c                        | 2 +-
 drivers/usb/musb/musb_core.c                   | 2 +-
 drivers/usb/musb/musb_dsps.c                   | 2 +-
 drivers/usb/musb/omap2430.c                    | 2 +-
 drivers/usb/musb/sunxi.c                       | 2 +-
 drivers/usb/musb/tusb6010.c                    | 2 +-
 drivers/usb/musb/ux500.c                       | 2 +-
 drivers/usb/phy/phy-ab8500-usb.c               | 2 +-
 drivers/usb/phy/phy-am335x.c                   | 2 +-
 drivers/usb/phy/phy-fsl-usb.c                  | 2 +-
 drivers/usb/phy/phy-generic.c                  | 2 +-
 drivers/usb/phy/phy-gpio-vbus-usb.c            | 2 +-
 drivers/usb/phy/phy-keystone.c                 | 2 +-
 drivers/usb/phy/phy-mv-usb.c                   | 2 +-
 drivers/usb/phy/phy-mxs-usb.c                  | 2 +-
 drivers/usb/phy/phy-tahvo.c                    | 2 +-
 drivers/usb/phy/phy-tegra-usb.c                | 2 +-
 drivers/usb/phy/phy-twl6030-usb.c              | 2 +-
 drivers/usb/renesas_usbhs/common.c             | 2 +-
 drivers/usb/roles/intel-xhci-usb-role-switch.c | 2 +-
 drivers/usb/typec/mux/gpio-sbu-mux.c           | 2 +-
 drivers/usb/typec/mux/intel_pmc_mux.c          | 2 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c  | 2 +-
 drivers/usb/typec/tcpm/tcpci_mt6360.c          | 2 +-
 drivers/usb/typec/tcpm/tcpci_mt6370.c          | 2 +-
 drivers/usb/typec/tcpm/wcove.c                 | 2 +-
 drivers/usb/typec/ucsi/ucsi_acpi.c             | 2 +-
 drivers/usb/usbip/vhci_hcd.c                   | 2 +-
 drivers/usb/usbip/vudc_main.c                  | 2 +-
 133 files changed, 135 insertions(+), 135 deletions(-)

diff --git a/drivers/usb/c67x00/c67x00-drv.c b/drivers/usb/c67x00/c67x00-drv.c
index bb9d5d7ffefc..8f38e2c5369a 100644
--- a/drivers/usb/c67x00/c67x00-drv.c
+++ b/drivers/usb/c67x00/c67x00-drv.c
@@ -201,7 +201,7 @@ static void c67x00_drv_remove(struct platform_device *pdev)
 
 static struct platform_driver c67x00_driver = {
 	.probe	= c67x00_drv_probe,
-	.remove_new = c67x00_drv_remove,
+	.remove = c67x00_drv_remove,
 	.driver	= {
 		.name = "c67x00",
 	},
diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index 281de47e2a3b..a2f041e1707c 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -422,7 +422,7 @@ MODULE_DEVICE_TABLE(of, cdns_imx_of_match);
 
 static struct platform_driver cdns_imx_driver = {
 	.probe		= cdns_imx_probe,
-	.remove_new	= cdns_imx_remove,
+	.remove		= cdns_imx_remove,
 	.driver		= {
 		.name	= "cdns3-imx",
 		.of_match_table	= cdns_imx_of_match,
diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 3ef8e3c872a3..59ec505e198a 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -327,7 +327,7 @@ MODULE_DEVICE_TABLE(of, of_cdns3_match);
 
 static struct platform_driver cdns3_driver = {
 	.probe		= cdns3_plat_probe,
-	.remove_new	= cdns3_plat_remove,
+	.remove		= cdns3_plat_remove,
 	.driver		= {
 		.name	= "cdns-usb3",
 		.of_match_table	= of_match_ptr(of_cdns3_match),
diff --git a/drivers/usb/cdns3/cdns3-starfive.c b/drivers/usb/cdns3/cdns3-starfive.c
index c04d196abd87..2ff7f2b48cc2 100644
--- a/drivers/usb/cdns3/cdns3-starfive.c
+++ b/drivers/usb/cdns3/cdns3-starfive.c
@@ -230,7 +230,7 @@ MODULE_DEVICE_TABLE(of, cdns_starfive_of_match);
 
 static struct platform_driver cdns_starfive_driver = {
 	.probe		= cdns_starfive_probe,
-	.remove_new	= cdns_starfive_remove,
+	.remove		= cdns_starfive_remove,
 	.driver		= {
 		.name	= "cdns3-starfive",
 		.of_match_table	= cdns_starfive_of_match,
diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index cfabc12ee0e3..040bb91e9c01 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -233,7 +233,7 @@ MODULE_DEVICE_TABLE(of, cdns_ti_of_match);
 
 static struct platform_driver cdns_ti_driver = {
 	.probe		= cdns_ti_probe,
-	.remove_new	= cdns_ti_remove,
+	.remove		= cdns_ti_remove,
 	.driver		= {
 		.name	= "cdns3-ti",
 		.of_match_table	= cdns_ti_of_match,
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index c64ab0e07ea0..d655db733797 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -675,7 +675,7 @@ static const struct dev_pm_ops ci_hdrc_imx_pm_ops = {
 };
 static struct platform_driver ci_hdrc_imx_driver = {
 	.probe = ci_hdrc_imx_probe,
-	.remove_new = ci_hdrc_imx_remove,
+	.remove = ci_hdrc_imx_remove,
 	.shutdown = ci_hdrc_imx_shutdown,
 	.driver = {
 		.name = "imx_usb",
diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index 1661639cd2eb..3ab3daa78e34 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -292,7 +292,7 @@ MODULE_DEVICE_TABLE(of, msm_ci_dt_match);
 
 static struct platform_driver ci_hdrc_msm_driver = {
 	.probe = ci_hdrc_msm_probe,
-	.remove_new = ci_hdrc_msm_remove,
+	.remove = ci_hdrc_msm_remove,
 	.driver = {
 		.name = "msm_hsusb",
 		.of_match_table = msm_ci_dt_match,
diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci_hdrc_npcm.c
index 3e5e05dbda89..e52a2b05cbe2 100644
--- a/drivers/usb/chipidea/ci_hdrc_npcm.c
+++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
@@ -98,7 +98,7 @@ MODULE_DEVICE_TABLE(of, npcm_udc_dt_match);
 
 static struct platform_driver npcm_udc_driver = {
 	.probe = npcm_udc_probe,
-	.remove_new = npcm_udc_remove,
+	.remove = npcm_udc_remove,
 	.driver = {
 		.name = "npcm_udc",
 		.of_match_table = npcm_udc_dt_match,
diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 9538d425f0a0..372788f0f970 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -406,7 +406,7 @@ static struct platform_driver tegra_usb_driver = {
 		.pm = pm_ptr(&tegra_usb_pm),
 	},
 	.probe = tegra_usb_probe,
-	.remove_new = tegra_usb_remove,
+	.remove = tegra_usb_remove,
 };
 module_platform_driver(tegra_usb_driver);
 
diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 97379f653b06..8ffa1e95d8e8 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -116,7 +116,7 @@ static void ci_hdrc_usb2_remove(struct platform_device *pdev)
 
 static struct platform_driver ci_hdrc_usb2_driver = {
 	.probe	= ci_hdrc_usb2_probe,
-	.remove_new = ci_hdrc_usb2_remove,
+	.remove = ci_hdrc_usb2_remove,
 	.driver	= {
 		.name		= "chipidea-usb2",
 		.of_match_table	= ci_hdrc_usb2_of_match,
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 835bf2428dc6..36143b2ae482 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1495,7 +1495,7 @@ static const struct dev_pm_ops ci_pm_ops = {
 
 static struct platform_driver ci_hdrc_driver = {
 	.probe	= ci_hdrc_probe,
-	.remove_new = ci_hdrc_remove,
+	.remove = ci_hdrc_remove,
 	.driver	= {
 		.name	= "ci_hdrc",
 		.pm	= &ci_pm_ops,
diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index 501e8bc9738e..c84b4a700084 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -340,7 +340,7 @@ MODULE_DEVICE_TABLE(of, usb_conn_dt_match);
 
 static struct platform_driver usb_conn_driver = {
 	.probe		= usb_conn_probe,
-	.remove_new	= usb_conn_remove,
+	.remove		= usb_conn_remove,
 	.driver		= {
 		.name	= "usb-conn-gpio",
 		.pm	= &usb_conn_pm_ops,
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index c1b7209b9483..91c80a92d9b8 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -756,7 +756,7 @@ static struct platform_driver dwc2_platform_driver = {
 		.pm = &dwc2_dev_pm_ops,
 	},
 	.probe = dwc2_driver_probe,
-	.remove_new = dwc2_driver_remove,
+	.remove = dwc2_driver_remove,
 	.shutdown = dwc2_driver_shutdown,
 };
 
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 9eb085f359ce..9397a6dd669f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2619,7 +2619,7 @@ MODULE_DEVICE_TABLE(acpi, dwc3_acpi_match);
 
 static struct platform_driver dwc3_driver = {
 	.probe		= dwc3_probe,
-	.remove_new	= dwc3_remove,
+	.remove		= dwc3_remove,
 	.driver		= {
 		.name	= "dwc3",
 		.of_match_table	= of_match_ptr(of_dwc3_match),
diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index fad151e78fd6..5e3d1741701f 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -377,7 +377,7 @@ MODULE_DEVICE_TABLE(of, dwc3_ti_of_match);
 
 static struct platform_driver dwc3_ti_driver = {
 	.probe		= dwc3_ti_probe,
-	.remove_new	= dwc3_ti_remove,
+	.remove		= dwc3_ti_remove,
 	.driver		= {
 		.name	= "dwc3-am62",
 		.pm	= DEV_PM_OPS,
diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 9a6e988d165a..f5d963fae9e0 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -243,7 +243,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(dwc3_exynos_dev_pm_ops,
 
 static struct platform_driver dwc3_exynos_driver = {
 	.probe		= dwc3_exynos_probe,
-	.remove_new	= dwc3_exynos_remove,
+	.remove		= dwc3_exynos_remove,
 	.driver		= {
 		.name	= "exynos-dwc3",
 		.of_match_table = exynos_dwc3_match,
diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 64c0cd1995aa..356812cbcd88 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -400,7 +400,7 @@ MODULE_DEVICE_TABLE(of, dwc3_imx8mp_of_match);
 
 static struct platform_driver dwc3_imx8mp_driver = {
 	.probe		= dwc3_imx8mp_probe,
-	.remove_new	= dwc3_imx8mp_remove,
+	.remove		= dwc3_imx8mp_remove,
 	.driver		= {
 		.name	= "imx8mp-dwc3",
 		.pm	= pm_ptr(&dwc3_imx8mp_dev_pm_ops),
diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
index 8899348b6276..7ee1610162b9 100644
--- a/drivers/usb/dwc3/dwc3-keystone.c
+++ b/drivers/usb/dwc3/dwc3-keystone.c
@@ -208,7 +208,7 @@ MODULE_DEVICE_TABLE(of, kdwc3_of_match);
 
 static struct platform_driver kdwc3_driver = {
 	.probe		= kdwc3_probe,
-	.remove_new	= kdwc3_remove,
+	.remove		= kdwc3_remove,
 	.driver		= {
 		.name	= "keystone-dwc3",
 		.of_match_table	= kdwc3_of_match,
diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 2c07c038b584..7d80bf7b18b0 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -968,7 +968,7 @@ MODULE_DEVICE_TABLE(of, dwc3_meson_g12a_match);
 
 static struct platform_driver dwc3_meson_g12a_driver = {
 	.probe		= dwc3_meson_g12a_probe,
-	.remove_new	= dwc3_meson_g12a_remove,
+	.remove		= dwc3_meson_g12a_remove,
 	.driver		= {
 		.name	= "dwc3-meson-g12a",
 		.of_match_table = dwc3_meson_g12a_match,
diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 1a3b205367fd..42bfc14ae0c4 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -520,7 +520,7 @@ MODULE_DEVICE_TABLE(of, dwc3_octeon_of_match);
 
 static struct platform_driver dwc3_octeon_driver = {
 	.probe		= dwc3_octeon_probe,
-	.remove_new	= dwc3_octeon_remove,
+	.remove		= dwc3_octeon_remove,
 	.driver		= {
 		.name	= "dwc3-octeon",
 		.of_match_table = dwc3_octeon_of_match,
diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index be7be00ecb34..a4954a21be93 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -180,7 +180,7 @@ MODULE_DEVICE_TABLE(of, of_dwc3_simple_match);
 
 static struct platform_driver dwc3_of_simple_driver = {
 	.probe		= dwc3_of_simple_probe,
-	.remove_new	= dwc3_of_simple_remove,
+	.remove		= dwc3_of_simple_remove,
 	.shutdown	= dwc3_of_simple_shutdown,
 	.driver		= {
 		.name	= "dwc3-of-simple",
diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index 2a11fc0ee84f..5582d45de110 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -611,7 +611,7 @@ static const struct dev_pm_ops dwc3_omap_dev_pm_ops = {
 
 static struct platform_driver dwc3_omap_driver = {
 	.probe		= dwc3_omap_probe,
-	.remove_new	= dwc3_omap_remove,
+	.remove		= dwc3_omap_remove,
 	.driver		= {
 		.name	= "omap-dwc3",
 		.of_match_table	= of_dwc3_match,
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index c1d4b52f25b0..48fee4537743 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -921,7 +921,7 @@ MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
 
 static struct platform_driver dwc3_qcom_driver = {
 	.probe		= dwc3_qcom_probe,
-	.remove_new	= dwc3_qcom_remove,
+	.remove		= dwc3_qcom_remove,
 	.driver		= {
 		.name	= "dwc3-qcom",
 		.pm	= &dwc3_qcom_dev_pm_ops,
diff --git a/drivers/usb/dwc3/dwc3-rtk.c b/drivers/usb/dwc3/dwc3-rtk.c
index e9c8b032c72c..56c53e0c0257 100644
--- a/drivers/usb/dwc3/dwc3-rtk.c
+++ b/drivers/usb/dwc3/dwc3-rtk.c
@@ -441,7 +441,7 @@ static const struct dev_pm_ops dwc3_rtk_dev_pm_ops = {
 
 static struct platform_driver dwc3_rtk_driver = {
 	.probe		= dwc3_rtk_probe,
-	.remove_new	= dwc3_rtk_remove,
+	.remove		= dwc3_rtk_remove,
 	.driver		= {
 		.name	= "rtk-dwc3",
 		.of_match_table = rtk_dwc3_match,
diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index 2841021f3557..e16c3237180e 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -356,7 +356,7 @@ MODULE_DEVICE_TABLE(of, st_dwc3_match);
 
 static struct platform_driver st_dwc3_driver = {
 	.probe = st_dwc3_probe,
-	.remove_new = st_dwc3_remove,
+	.remove = st_dwc3_remove,
 	.driver = {
 		.name = "usb-st-dwc3",
 		.of_match_table = st_dwc3_match,
diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index b5e5be424ce9..e3738e1610db 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -420,7 +420,7 @@ static const struct dev_pm_ops dwc3_xlnx_dev_pm_ops = {
 
 static struct platform_driver dwc3_xlnx_driver = {
 	.probe		= dwc3_xlnx_probe,
-	.remove_new	= dwc3_xlnx_remove,
+	.remove		= dwc3_xlnx_remove,
 	.driver		= {
 		.name		= "dwc3-xilinx",
 		.of_match_table	= dwc3_xlnx_of_match,
diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fotg210-core.c
index 0655afe7f977..49f25a70b32e 100644
--- a/drivers/usb/fotg210/fotg210-core.c
+++ b/drivers/usb/fotg210/fotg210-core.c
@@ -195,7 +195,7 @@ static struct platform_driver fotg210_driver = {
 		.of_match_table = of_match_ptr(fotg210_of_match),
 	},
 	.probe  = fotg210_probe,
-	.remove_new = fotg210_remove,
+	.remove = fotg210_remove,
 };
 
 static int __init fotg210_init(void)
diff --git a/drivers/usb/gadget/legacy/hid.c b/drivers/usb/gadget/legacy/hid.c
index 4ca67b2f8f24..3684546e8801 100644
--- a/drivers/usb/gadget/legacy/hid.c
+++ b/drivers/usb/gadget/legacy/hid.c
@@ -261,7 +261,7 @@ static struct usb_composite_driver hidg_driver = {
 };
 
 static struct platform_driver hidg_plat_driver = {
-	.remove_new	= hidg_plat_driver_remove,
+	.remove		= hidg_plat_driver_remove,
 	.driver		= {
 		.name	= "hidg",
 	},
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index f60a019bb173..f2685f89b3e5 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -428,7 +428,7 @@ MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
 
 static struct platform_driver ast_vhub_driver = {
 	.probe		= ast_vhub_probe,
-	.remove_new	= ast_vhub_remove,
+	.remove		= ast_vhub_remove,
 	.driver		= {
 		.name	= KBUILD_MODNAME,
 		.of_match_table	= ast_vhub_dt_ids,
diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index f4781e611aaa..6ac1781eb611 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1590,7 +1590,7 @@ MODULE_DEVICE_TABLE(of, ast_udc_of_dt_ids);
 
 static struct platform_driver ast_udc_driver = {
 	.probe			= ast_udc_probe,
-	.remove_new		= ast_udc_remove,
+	.remove			= ast_udc_remove,
 	.driver			= {
 		.name			= KBUILD_MODNAME,
 		.of_match_table		= ast_udc_of_dt_ids,
diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index e3bf17a98b38..e3af4ec3794e 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -2002,7 +2002,7 @@ static int at91udc_resume(struct platform_device *pdev)
 
 static struct platform_driver at91_udc_driver = {
 	.probe		= at91udc_probe,
-	.remove_new	= at91udc_remove,
+	.remove		= at91udc_remove,
 	.shutdown	= at91udc_shutdown,
 	.suspend	= at91udc_suspend,
 	.resume		= at91udc_resume,
diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index b76885d78e8a..6ceaeceffae6 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -2445,7 +2445,7 @@ static SIMPLE_DEV_PM_OPS(usba_udc_pm_ops, usba_udc_suspend, usba_udc_resume);
 
 static struct platform_driver udc_driver = {
 	.probe		= usba_udc_probe,
-	.remove_new	= usba_udc_remove,
+	.remove		= usba_udc_remove,
 	.driver		= {
 		.name		= "atmel_usba_udc",
 		.pm		= &usba_udc_pm_ops,
diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index da7011d906e0..502612a5650e 100644
--- a/drivers/usb/gadget/udc/bcm63xx_udc.c
+++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
@@ -2367,7 +2367,7 @@ static void bcm63xx_udc_remove(struct platform_device *pdev)
 
 static struct platform_driver bcm63xx_udc_driver = {
 	.probe		= bcm63xx_udc_probe,
-	.remove_new	= bcm63xx_udc_remove,
+	.remove		= bcm63xx_udc_remove,
 	.driver		= {
 		.name	= DRV_MODULE_NAME,
 	},
diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 5149e2b7f050..5c3d8b64c0e7 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -648,7 +648,7 @@ static struct platform_driver bdc_driver = {
 		.of_match_table	= bdc_of_match,
 	},
 	.probe		= bdc_probe,
-	.remove_new	= bdc_remove,
+	.remove		= bdc_remove,
 };
 
 module_platform_driver(bdc_driver);
diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index ff7bee78bcc4..c242f146e2cf 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1151,7 +1151,7 @@ static int dummy_udc_resume(struct platform_device *pdev)
 
 static struct platform_driver dummy_udc_driver = {
 	.probe		= dummy_udc_probe,
-	.remove_new	= dummy_udc_remove,
+	.remove		= dummy_udc_remove,
 	.suspend	= dummy_udc_suspend,
 	.resume		= dummy_udc_resume,
 	.driver		= {
@@ -2759,7 +2759,7 @@ static int dummy_hcd_resume(struct platform_device *pdev)
 
 static struct platform_driver dummy_hcd_driver = {
 	.probe		= dummy_hcd_probe,
-	.remove_new	= dummy_hcd_remove,
+	.remove		= dummy_hcd_remove,
 	.suspend	= dummy_hcd_suspend,
 	.resume		= dummy_hcd_resume,
 	.driver		= {
diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index 4e88681a79b6..abf34f00e8f7 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -2704,7 +2704,7 @@ static struct platform_driver udc_driver = {
 		.of_match_table = qe_udc_match,
 	},
 	.probe          = qe_udc_probe,
-	.remove_new     = qe_udc_remove,
+	.remove         = qe_udc_remove,
 #ifdef CONFIG_PM
 	.suspend        = qe_udc_suspend,
 	.resume         = qe_udc_resume,
diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index 3432ebfae978..c1cb980888e9 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2685,7 +2685,7 @@ MODULE_DEVICE_TABLE(of, fsl_udc_dt_ids);
 
 static struct platform_driver udc_driver = {
 	.probe		= fsl_udc_probe,
-	.remove_new	= fsl_udc_remove,
+	.remove		= fsl_udc_remove,
 	.id_table	= fsl_udc_devtype,
 	/* these suspend and resume are not usb suspend and resume */
 	.suspend	= fsl_udc_suspend,
diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
index 873265634ccc..10e5a371c9f2 100644
--- a/drivers/usb/gadget/udc/fusb300_udc.c
+++ b/drivers/usb/gadget/udc/fusb300_udc.c
@@ -1507,7 +1507,7 @@ static int fusb300_probe(struct platform_device *pdev)
 
 static struct platform_driver fusb300_driver = {
 	.probe = fusb300_probe,
-	.remove_new = fusb300_remove,
+	.remove = fusb300_remove,
 	.driver = {
 		.name =	udc_name,
 	},
diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index fb901be5dac1..bf5b3c964c18 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -2249,7 +2249,7 @@ static struct platform_driver gr_driver = {
 		.of_match_table = gr_match,
 	},
 	.probe = gr_probe,
-	.remove_new = gr_remove,
+	.remove = gr_remove,
 };
 module_platform_driver(gr_driver);
 
diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 3bfd889ed56a..89d6daf2bda7 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3249,7 +3249,7 @@ MODULE_DEVICE_TABLE(of, lpc32xx_udc_of_match);
 
 static struct platform_driver lpc32xx_udc_driver = {
 	.probe		= lpc32xx_udc_probe,
-	.remove_new	= lpc32xx_udc_remove,
+	.remove		= lpc32xx_udc_remove,
 	.shutdown	= lpc32xx_udc_shutdown,
 	.suspend	= lpc32xx_udc_suspend,
 	.resume		= lpc32xx_udc_resume,
diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index bfaa5291e6c8..a938b2af0944 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1688,7 +1688,7 @@ static int m66592_probe(struct platform_device *pdev)
 /*-------------------------------------------------------------------------*/
 static struct platform_driver m66592_driver = {
 	.probe =	m66592_probe,
-	.remove_new =	m66592_remove,
+	.remove =	m66592_remove,
 	.driver		= {
 		.name =	udc_name,
 	},
diff --git a/drivers/usb/gadget/udc/mv_u3d_core.c b/drivers/usb/gadget/udc/mv_u3d_core.c
index e1dd5cf25d08..062f43e146aa 100644
--- a/drivers/usb/gadget/udc/mv_u3d_core.c
+++ b/drivers/usb/gadget/udc/mv_u3d_core.c
@@ -2047,7 +2047,7 @@ static void mv_u3d_shutdown(struct platform_device *dev)
 
 static struct platform_driver mv_u3d_driver = {
 	.probe		= mv_u3d_probe,
-	.remove_new	= mv_u3d_remove,
+	.remove		= mv_u3d_remove,
 	.shutdown	= mv_u3d_shutdown,
 	.driver		= {
 		.name	= "mv-u3d",
diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/udc/mv_udc_core.c
index 78308b64955d..1592b2112318 100644
--- a/drivers/usb/gadget/udc/mv_udc_core.c
+++ b/drivers/usb/gadget/udc/mv_udc_core.c
@@ -2409,7 +2409,7 @@ static void mv_udc_shutdown(struct platform_device *pdev)
 
 static struct platform_driver udc_driver = {
 	.probe		= mv_udc_probe,
-	.remove_new	= mv_udc_remove,
+	.remove		= mv_udc_remove,
 	.shutdown	= mv_udc_shutdown,
 	.driver		= {
 		.name	= "mv-udc",
diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 19bbc38f3d35..349383e2fc15 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -2685,7 +2685,7 @@ net2272_plat_remove(struct platform_device *pdev)
 
 static struct platform_driver net2272_plat_driver = {
 	.probe   = net2272_plat_probe,
-	.remove_new = net2272_plat_remove,
+	.remove = net2272_plat_remove,
 	.driver  = {
 		.name  = driver_name,
 	},
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index e13b8ec8ef8a..8429986043a8 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -2980,7 +2980,7 @@ static int omap_udc_resume(struct platform_device *dev)
 
 static struct platform_driver udc_driver = {
 	.probe		= omap_udc_probe,
-	.remove_new	= omap_udc_remove,
+	.remove		= omap_udc_remove,
 	.suspend	= omap_udc_suspend,
 	.resume		= omap_udc_resume,
 	.driver		= {
diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index 1ac26cb49ecf..83a0b36c556d 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -2474,7 +2474,7 @@ static int pxa25x_udc_resume(struct platform_device *dev)
 static struct platform_driver udc_driver = {
 	.shutdown	= pxa25x_udc_shutdown,
 	.probe		= pxa25x_udc_probe,
-	.remove_new	= pxa25x_udc_remove,
+	.remove		= pxa25x_udc_remove,
 	.suspend	= pxa25x_udc_suspend,
 	.resume		= pxa25x_udc_resume,
 	.driver		= {
diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 1a6317e4b2a3..7d3a8a5f3796 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2538,7 +2538,7 @@ static struct platform_driver udc_driver = {
 		.of_match_table = of_match_ptr(udc_pxa_dt_ids),
 	},
 	.probe		= pxa_udc_probe,
-	.remove_new	= pxa_udc_remove,
+	.remove		= pxa_udc_remove,
 	.shutdown	= pxa_udc_shutdown,
 #ifdef CONFIG_PM
 	.suspend	= pxa_udc_suspend,
diff --git a/drivers/usb/gadget/udc/r8a66597-udc.c b/drivers/usb/gadget/udc/r8a66597-udc.c
index db4a10a979f9..ff6f846b1d41 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.c
+++ b/drivers/usb/gadget/udc/r8a66597-udc.c
@@ -1965,7 +1965,7 @@ static int r8a66597_probe(struct platform_device *pdev)
 /*-------------------------------------------------------------------------*/
 static struct platform_driver r8a66597_driver = {
 	.probe =	r8a66597_probe,
-	.remove_new =	r8a66597_remove,
+	.remove =	r8a66597_remove,
 	.driver		= {
 		.name =	udc_name,
 	},
diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 3b01734ce1b7..fce5c41d9f29 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -3013,7 +3013,7 @@ static SIMPLE_DEV_PM_OPS(renesas_usb3_pm_ops, renesas_usb3_suspend,
 
 static struct platform_driver renesas_usb3_driver = {
 	.probe		= renesas_usb3_probe,
-	.remove_new	= renesas_usb3_remove,
+	.remove		= renesas_usb3_remove,
 	.driver		= {
 		.name =	udc_name,
 		.pm		= &renesas_usb3_pm_ops,
diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
index 657f265ac7cc..c8f8aeefeeac 100644
--- a/drivers/usb/gadget/udc/renesas_usbf.c
+++ b/drivers/usb/gadget/udc/renesas_usbf.c
@@ -3381,7 +3381,7 @@ static struct platform_driver udc_driver = {
 		.of_match_table = usbf_match,
 	},
 	.probe          = usbf_probe,
-	.remove_new     = usbf_remove,
+	.remove         = usbf_remove,
 };
 
 module_platform_driver(udc_driver);
diff --git a/drivers/usb/gadget/udc/rzv2m_usb3drd.c b/drivers/usb/gadget/udc/rzv2m_usb3drd.c
index 36f4ff00d22f..4692eae89f44 100644
--- a/drivers/usb/gadget/udc/rzv2m_usb3drd.c
+++ b/drivers/usb/gadget/udc/rzv2m_usb3drd.c
@@ -127,7 +127,7 @@ static struct platform_driver rzv2m_usb3drd_driver = {
 		.of_match_table = rzv2m_usb3drd_of_match,
 	},
 	.probe = rzv2m_usb3drd_probe,
-	.remove_new = rzv2m_usb3drd_remove,
+	.remove = rzv2m_usb3drd_remove,
 };
 module_platform_driver(rzv2m_usb3drd_driver);
 
diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
index ba5a06690507..db842a6de643 100644
--- a/drivers/usb/gadget/udc/snps_udc_plat.c
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -309,7 +309,7 @@ MODULE_DEVICE_TABLE(of, of_udc_match);
 
 static struct platform_driver udc_plat_driver = {
 	.probe		= udc_plat_probe,
-	.remove_new	= udc_plat_remove,
+	.remove		= udc_plat_remove,
 	.driver		= {
 		.name	= "snps-udc-plat",
 		.of_match_table = of_udc_match,
diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 7aa46d426f31..c7fdbc55fb0b 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -4071,7 +4071,7 @@ static const struct dev_pm_ops tegra_xudc_pm_ops = {
 
 static struct platform_driver tegra_xudc_driver = {
 	.probe = tegra_xudc_probe,
-	.remove_new = tegra_xudc_remove,
+	.remove = tegra_xudc_remove,
 	.driver = {
 		.name = "tegra-xudc",
 		.pm = &tegra_xudc_pm_ops,
diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index ebc45565c33e..ae2aeb271897 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -2258,7 +2258,7 @@ static struct platform_driver xudc_driver = {
 		.pm	= &xudc_pm_ops,
 	},
 	.probe = xudc_probe,
-	.remove_new = xudc_remove,
+	.remove = xudc_remove,
 };
 
 module_platform_driver(xudc_driver);
diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
index 6a6e1c510b28..65747270fd88 100644
--- a/drivers/usb/host/ehci-atmel.c
+++ b/drivers/usb/host/ehci-atmel.c
@@ -220,7 +220,7 @@ static SIMPLE_DEV_PM_OPS(ehci_atmel_pm_ops, ehci_atmel_drv_suspend,
 
 static struct platform_driver ehci_atmel_driver = {
 	.probe		= ehci_atmel_drv_probe,
-	.remove_new	= ehci_atmel_drv_remove,
+	.remove		= ehci_atmel_drv_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "atmel-ehci",
diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
index 68cad0620f1a..888e8f6670d2 100644
--- a/drivers/usb/host/ehci-brcm.c
+++ b/drivers/usb/host/ehci-brcm.c
@@ -250,7 +250,7 @@ MODULE_DEVICE_TABLE(of, brcm_ehci_of_match);
 
 static struct platform_driver ehci_brcm_driver = {
 	.probe		= ehci_brcm_probe,
-	.remove_new	= ehci_brcm_remove,
+	.remove		= ehci_brcm_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "ehci-brcm",
diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index e3a961d3f5fc..d2a5bedf736a 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -288,7 +288,7 @@ MODULE_DEVICE_TABLE(of, exynos_ehci_match);
 
 static struct platform_driver exynos_ehci_driver = {
 	.probe		= exynos_ehci_probe,
-	.remove_new	= exynos_ehci_remove,
+	.remove		= exynos_ehci_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
 		.name	= "exynos-ehci",
diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 5b1ce394a417..26f13278d4d6 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -706,7 +706,7 @@ static void fsl_ehci_drv_remove(struct platform_device *pdev)
 
 static struct platform_driver ehci_fsl_driver = {
 	.probe = fsl_ehci_drv_probe,
-	.remove_new = fsl_ehci_drv_remove,
+	.remove = fsl_ehci_drv_remove,
 	.shutdown = usb_hcd_platform_shutdown,
 	.driver = {
 		.name = DRV_NAME,
diff --git a/drivers/usb/host/ehci-grlib.c b/drivers/usb/host/ehci-grlib.c
index 14150e4d3382..bd9762eaa135 100644
--- a/drivers/usb/host/ehci-grlib.c
+++ b/drivers/usb/host/ehci-grlib.c
@@ -168,7 +168,7 @@ MODULE_DEVICE_TABLE(of, ehci_hcd_grlib_of_match);
 
 static struct platform_driver ehci_grlib_driver = {
 	.probe		= ehci_hcd_grlib_probe,
-	.remove_new	= ehci_hcd_grlib_remove,
+	.remove		= ehci_hcd_grlib_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
 		.name = "grlib-ehci",
diff --git a/drivers/usb/host/ehci-mv.c b/drivers/usb/host/ehci-mv.c
index 2f1fc7eb8b72..cbabbe107172 100644
--- a/drivers/usb/host/ehci-mv.c
+++ b/drivers/usb/host/ehci-mv.c
@@ -279,7 +279,7 @@ static const struct of_device_id ehci_mv_dt_ids[] = {
 
 static struct platform_driver ehci_mv_driver = {
 	.probe = mv_ehci_probe,
-	.remove_new = mv_ehci_remove,
+	.remove = mv_ehci_remove,
 	.shutdown = mv_ehci_shutdown,
 	.driver = {
 		.name = "mv-ehci",
diff --git a/drivers/usb/host/ehci-npcm7xx.c b/drivers/usb/host/ehci-npcm7xx.c
index 3d3317a1a0b3..f1c7034c1e80 100644
--- a/drivers/usb/host/ehci-npcm7xx.c
+++ b/drivers/usb/host/ehci-npcm7xx.c
@@ -122,7 +122,7 @@ MODULE_DEVICE_TABLE(of, npcm7xx_ehci_id_table);
 
 static struct platform_driver npcm7xx_ehci_hcd_driver = {
 	.probe		= npcm7xx_ehci_hcd_drv_probe,
-	.remove_new	= npcm7xx_ehci_hcd_drv_remove,
+	.remove		= npcm7xx_ehci_hcd_drv_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name = "npcm7xx-ehci",
diff --git a/drivers/usb/host/ehci-omap.c b/drivers/usb/host/ehci-omap.c
index b24f371a46f3..db4a1acb27da 100644
--- a/drivers/usb/host/ehci-omap.c
+++ b/drivers/usb/host/ehci-omap.c
@@ -264,7 +264,7 @@ MODULE_DEVICE_TABLE(of, omap_ehci_dt_ids);
 
 static struct platform_driver ehci_hcd_omap_driver = {
 	.probe			= ehci_hcd_omap_probe,
-	.remove_new		= ehci_hcd_omap_remove,
+	.remove			= ehci_hcd_omap_remove,
 	.shutdown		= usb_hcd_platform_shutdown,
 	/*.suspend		= ehci_hcd_omap_suspend, */
 	/*.resume		= ehci_hcd_omap_resume, */
diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index ad145a54ca74..34abff8669f8 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -352,7 +352,7 @@ MODULE_DEVICE_TABLE(of, ehci_orion_dt_ids);
 
 static struct platform_driver ehci_orion_driver = {
 	.probe		= ehci_orion_drv_probe,
-	.remove_new	= ehci_orion_drv_remove,
+	.remove		= ehci_orion_drv_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
 		.name	= "orion-ehci",
diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index 98b073185e1c..cdf41886e8ca 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -508,7 +508,7 @@ static SIMPLE_DEV_PM_OPS(ehci_platform_pm_ops, ehci_platform_suspend,
 static struct platform_driver ehci_platform_driver = {
 	.id_table	= ehci_platform_table,
 	.probe		= ehci_platform_probe,
-	.remove_new	= ehci_platform_remove,
+	.remove		= ehci_platform_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "ehci-platform",
diff --git a/drivers/usb/host/ehci-ppc-of.c b/drivers/usb/host/ehci-ppc-of.c
index 7fd83e806ae4..8063b9d3aebd 100644
--- a/drivers/usb/host/ehci-ppc-of.c
+++ b/drivers/usb/host/ehci-ppc-of.c
@@ -230,7 +230,7 @@ MODULE_DEVICE_TABLE(of, ehci_hcd_ppc_of_match);
 
 static struct platform_driver ehci_hcd_ppc_of_driver = {
 	.probe		= ehci_hcd_ppc_of_probe,
-	.remove_new	= ehci_hcd_ppc_of_remove,
+	.remove		= ehci_hcd_ppc_of_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
 		.name = "ppc-of-ehci",
diff --git a/drivers/usb/host/ehci-sh.c b/drivers/usb/host/ehci-sh.c
index d31d9506e41a..5d0d972fb7b1 100644
--- a/drivers/usb/host/ehci-sh.c
+++ b/drivers/usb/host/ehci-sh.c
@@ -169,7 +169,7 @@ static void ehci_hcd_sh_shutdown(struct platform_device *pdev)
 
 static struct platform_driver ehci_hcd_sh_driver = {
 	.probe		= ehci_hcd_sh_probe,
-	.remove_new	= ehci_hcd_sh_remove,
+	.remove		= ehci_hcd_sh_remove,
 	.shutdown	= ehci_hcd_sh_shutdown,
 	.driver		= {
 		.name	= "sh_ehci",
diff --git a/drivers/usb/host/ehci-spear.c b/drivers/usb/host/ehci-spear.c
index d0e94e4c9fe2..0b1fc2563dd6 100644
--- a/drivers/usb/host/ehci-spear.c
+++ b/drivers/usb/host/ehci-spear.c
@@ -143,7 +143,7 @@ MODULE_DEVICE_TABLE(of, spear_ehci_id_table);
 
 static struct platform_driver spear_ehci_hcd_driver = {
 	.probe		= spear_ehci_hcd_drv_probe,
-	.remove_new	= spear_ehci_hcd_drv_remove,
+	.remove		= spear_ehci_hcd_drv_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name = "spear-ehci",
diff --git a/drivers/usb/host/ehci-st.c b/drivers/usb/host/ehci-st.c
index 2dbb0d86daaa..58867d816af7 100644
--- a/drivers/usb/host/ehci-st.c
+++ b/drivers/usb/host/ehci-st.c
@@ -320,7 +320,7 @@ MODULE_DEVICE_TABLE(of, st_ehci_ids);
 
 static struct platform_driver ehci_platform_driver = {
 	.probe		= st_ehci_platform_probe,
-	.remove_new	= st_ehci_platform_remove,
+	.remove		= st_ehci_platform_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "st-ehci",
diff --git a/drivers/usb/host/ehci-xilinx-of.c b/drivers/usb/host/ehci-xilinx-of.c
index a2112c28f631..1d16cfefabd7 100644
--- a/drivers/usb/host/ehci-xilinx-of.c
+++ b/drivers/usb/host/ehci-xilinx-of.c
@@ -220,7 +220,7 @@ MODULE_DEVICE_TABLE(of, ehci_hcd_xilinx_of_match);
 
 static struct platform_driver ehci_hcd_xilinx_of_driver = {
 	.probe		= ehci_hcd_xilinx_of_probe,
-	.remove_new	= ehci_hcd_xilinx_of_remove,
+	.remove		= ehci_hcd_xilinx_of_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
 		.name = "xilinx-of-ehci",
diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 9a1b5224f239..22a0942f0bce 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -791,7 +791,7 @@ static struct platform_driver of_fhci_driver = {
 		.of_match_table = of_fhci_match,
 	},
 	.probe		= of_fhci_probe,
-	.remove_new	= of_fhci_remove,
+	.remove		= of_fhci_remove,
 };
 
 module_platform_driver(of_fhci_driver);
diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index 6cdc3d805c32..4e67b9471986 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -362,7 +362,7 @@ static struct platform_driver fsl_usb2_mph_dr_driver = {
 		.of_match_table = fsl_usb2_mph_dr_of_match,
 	},
 	.probe	= fsl_usb2_mph_dr_of_probe,
-	.remove_new = fsl_usb2_mph_dr_of_remove,
+	.remove = fsl_usb2_mph_dr_of_remove,
 };
 
 module_platform_driver(fsl_usb2_mph_dr_driver);
diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
index a82d8926e922..71c22c4bd163 100644
--- a/drivers/usb/host/isp116x-hcd.c
+++ b/drivers/usb/host/isp116x-hcd.c
@@ -1684,7 +1684,7 @@ MODULE_ALIAS("platform:isp116x-hcd");
 
 static struct platform_driver isp116x_driver = {
 	.probe = isp116x_probe,
-	.remove_new = isp116x_remove,
+	.remove = isp116x_remove,
 	.suspend = isp116x_suspend,
 	.resume = isp116x_resume,
 	.driver = {
diff --git a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp1362-hcd.c
index a52c3d858f3e..8c855629945f 100644
--- a/drivers/usb/host/isp1362-hcd.c
+++ b/drivers/usb/host/isp1362-hcd.c
@@ -2757,7 +2757,7 @@ static int isp1362_resume(struct platform_device *pdev)
 
 static struct platform_driver isp1362_driver = {
 	.probe = isp1362_probe,
-	.remove_new = isp1362_remove,
+	.remove = isp1362_remove,
 
 	.suspend = isp1362_suspend,
 	.resume = isp1362_resume,
diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
index 19d5777f5db2..b2702077c5c0 100644
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -3711,8 +3711,8 @@ static struct platform_driver octeon_usb_driver = {
 		.name		= "octeon-hcd",
 		.of_match_table = octeon_usb_match,
 	},
-	.probe      = octeon_usb_probe,
-	.remove_new = octeon_usb_remove,
+	.probe = octeon_usb_probe,
+	.remove = octeon_usb_remove,
 };
 
 static int __init octeon_usb_driver_init(void)
diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
index f691cd98a574..5df793dcb25d 100644
--- a/drivers/usb/host/ohci-at91.c
+++ b/drivers/usb/host/ohci-at91.c
@@ -685,7 +685,7 @@ static SIMPLE_DEV_PM_OPS(ohci_hcd_at91_pm_ops, ohci_hcd_at91_drv_suspend,
 
 static struct platform_driver ohci_hcd_at91_driver = {
 	.probe		= ohci_hcd_at91_drv_probe,
-	.remove_new	= ohci_hcd_at91_drv_remove,
+	.remove		= ohci_hcd_at91_drv_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "at91_ohci",
diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index d9adae53466b..a4f8e4bc6468 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -531,7 +531,7 @@ static const struct ohci_driver_overrides da8xx_overrides __initconst = {
  */
 static struct platform_driver ohci_hcd_da8xx_driver = {
 	.probe		= ohci_da8xx_probe,
-	.remove_new	= ohci_da8xx_remove,
+	.remove		= ohci_da8xx_remove,
 	.shutdown 	= usb_hcd_platform_shutdown,
 #ifdef	CONFIG_PM
 	.suspend	= ohci_da8xx_suspend,
diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 1379e03644b2..cc5cb0900988 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -262,7 +262,7 @@ MODULE_DEVICE_TABLE(of, exynos_ohci_match);
 
 static struct platform_driver exynos_ohci_driver = {
 	.probe		= exynos_ohci_probe,
-	.remove_new	= exynos_ohci_remove,
+	.remove		= exynos_ohci_remove,
 	.shutdown	= exynos_ohci_shutdown,
 	.driver = {
 		.name	= "exynos-ohci",
diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
index 5b775e1ea527..24d5a1dc5056 100644
--- a/drivers/usb/host/ohci-nxp.c
+++ b/drivers/usb/host/ohci-nxp.c
@@ -254,7 +254,7 @@ static struct platform_driver ohci_hcd_nxp_driver = {
 		.of_match_table = of_match_ptr(ohci_hcd_nxp_match),
 	},
 	.probe = ohci_hcd_nxp_probe,
-	.remove_new = ohci_hcd_nxp_remove,
+	.remove = ohci_hcd_nxp_remove,
 };
 
 static int __init ohci_nxp_init(void)
diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index 21a6f6c55e07..dcd7b0e0952a 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -390,7 +390,7 @@ static int ohci_omap_resume(struct platform_device *dev)
  */
 static struct platform_driver ohci_hcd_omap_driver = {
 	.probe		= ohci_hcd_omap_probe,
-	.remove_new	= ohci_hcd_omap_remove,
+	.remove		= ohci_hcd_omap_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 #ifdef	CONFIG_PM
 	.suspend	= ohci_omap_suspend,
diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 4a75507325dd..f47ae12cde6a 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -344,7 +344,7 @@ static const struct dev_pm_ops ohci_platform_pm_ops = {
 static struct platform_driver ohci_platform_driver = {
 	.id_table	= ohci_platform_table,
 	.probe		= ohci_platform_probe,
-	.remove_new	= ohci_platform_remove,
+	.remove		= ohci_platform_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "ohci-platform",
diff --git a/drivers/usb/host/ohci-ppc-of.c b/drivers/usb/host/ohci-ppc-of.c
index a6be061f8653..acd0a0e398a4 100644
--- a/drivers/usb/host/ohci-ppc-of.c
+++ b/drivers/usb/host/ohci-ppc-of.c
@@ -219,7 +219,7 @@ MODULE_DEVICE_TABLE(of, ohci_hcd_ppc_of_match);
 
 static struct platform_driver ohci_hcd_ppc_of_driver = {
 	.probe		= ohci_hcd_ppc_of_probe,
-	.remove_new	= ohci_hcd_ppc_of_remove,
+	.remove		= ohci_hcd_ppc_of_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
 		.name = "ppc-of-ohci",
diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
index 3348c25ddb18..45d026e85168 100644
--- a/drivers/usb/host/ohci-pxa27x.c
+++ b/drivers/usb/host/ohci-pxa27x.c
@@ -569,7 +569,7 @@ static const struct dev_pm_ops ohci_hcd_pxa27x_pm_ops = {
 
 static struct platform_driver ohci_hcd_pxa27x_driver = {
 	.probe		= ohci_hcd_pxa27x_probe,
-	.remove_new	= ohci_hcd_pxa27x_remove,
+	.remove		= ohci_hcd_pxa27x_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "pxa27x-ohci",
diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
index c5c9b4cbcb9a..66d970854357 100644
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -457,7 +457,7 @@ MODULE_DEVICE_TABLE(of, ohci_hcd_s3c2410_dt_ids);
 
 static struct platform_driver ohci_hcd_s3c2410_driver = {
 	.probe		= ohci_hcd_s3c2410_probe,
-	.remove_new	= ohci_hcd_s3c2410_remove,
+	.remove		= ohci_hcd_s3c2410_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "s3c2410-ohci",
diff --git a/drivers/usb/host/ohci-sm501.c b/drivers/usb/host/ohci-sm501.c
index 4b39e9d6f33a..843a5378764e 100644
--- a/drivers/usb/host/ohci-sm501.c
+++ b/drivers/usb/host/ohci-sm501.c
@@ -252,7 +252,7 @@ static int ohci_sm501_resume(struct platform_device *pdev)
  */
 static struct platform_driver ohci_hcd_sm501_driver = {
 	.probe		= ohci_hcd_sm501_drv_probe,
-	.remove_new	= ohci_hcd_sm501_drv_remove,
+	.remove		= ohci_hcd_sm501_drv_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.suspend	= ohci_sm501_suspend,
 	.resume		= ohci_sm501_resume,
diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
index 993f347c5c28..d7131e5a4477 100644
--- a/drivers/usb/host/ohci-spear.c
+++ b/drivers/usb/host/ohci-spear.c
@@ -157,7 +157,7 @@ MODULE_DEVICE_TABLE(of, spear_ohci_id_table);
 /* Driver definition to register with the platform bus */
 static struct platform_driver spear_ohci_hcd_driver = {
 	.probe =	spear_ohci_hcd_drv_probe,
-	.remove_new =	spear_ohci_hcd_drv_remove,
+	.remove =	spear_ohci_hcd_drv_remove,
 #ifdef CONFIG_PM
 	.suspend =	spear_ohci_hcd_drv_suspend,
 	.resume =	spear_ohci_hcd_drv_resume,
diff --git a/drivers/usb/host/ohci-st.c b/drivers/usb/host/ohci-st.c
index 214342013f7e..d1656fce5400 100644
--- a/drivers/usb/host/ohci-st.c
+++ b/drivers/usb/host/ohci-st.c
@@ -298,7 +298,7 @@ MODULE_DEVICE_TABLE(of, st_ohci_platform_ids);
 
 static struct platform_driver ohci_platform_driver = {
 	.probe		= st_ohci_platform_probe,
-	.remove_new	= st_ohci_platform_remove,
+	.remove		= st_ohci_platform_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "st-ohci",
diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index 3f871fe62b90..6cd25d01e056 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -4289,7 +4289,7 @@ static int oxu_drv_resume(struct device *dev)
 
 static struct platform_driver oxu_driver = {
 	.probe		= oxu_drv_probe,
-	.remove_new	= oxu_drv_remove,
+	.remove		= oxu_drv_remove,
 	.shutdown	= oxu_drv_shutdown,
 	.suspend	= oxu_drv_suspend,
 	.resume		= oxu_drv_resume,
diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index 6576515a29cd..e43e8f8ce7d5 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -2510,7 +2510,7 @@ static int r8a66597_probe(struct platform_device *pdev)
 
 static struct platform_driver r8a66597_driver = {
 	.probe =	r8a66597_probe,
-	.remove_new =	r8a66597_remove,
+	.remove =	r8a66597_remove,
 	.driver		= {
 		.name = hcd_name,
 		.pm	= R8A66597_DEV_PM_OPS,
diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index 2b871540bb50..c95f42e8c061 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1784,7 +1784,7 @@ sl811h_resume(struct platform_device *dev)
 /* this driver is exported so sl811_cs can depend on it */
 struct platform_driver sl811h_driver = {
 	.probe =	sl811h_probe,
-	.remove_new =	sl811h_remove,
+	.remove =	sl811h_remove,
 
 	.suspend =	sl811h_suspend,
 	.resume =	sl811h_resume,
diff --git a/drivers/usb/host/uhci-grlib.c b/drivers/usb/host/uhci-grlib.c
index cfebb833668e..8a1f6d1b5b56 100644
--- a/drivers/usb/host/uhci-grlib.c
+++ b/drivers/usb/host/uhci-grlib.c
@@ -184,7 +184,7 @@ MODULE_DEVICE_TABLE(of, uhci_hcd_grlib_of_match);
 
 static struct platform_driver uhci_grlib_driver = {
 	.probe		= uhci_hcd_grlib_probe,
-	.remove_new	= uhci_hcd_grlib_remove,
+	.remove		= uhci_hcd_grlib_remove,
 	.shutdown	= uhci_hcd_grlib_shutdown,
 	.driver = {
 		.name = "grlib-uhci",
diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
index 3dec5dd3a0d5..a7c934404ebc 100644
--- a/drivers/usb/host/uhci-platform.c
+++ b/drivers/usb/host/uhci-platform.c
@@ -184,7 +184,7 @@ MODULE_DEVICE_TABLE(of, platform_uhci_ids);
 
 static struct platform_driver uhci_platform_driver = {
 	.probe		= uhci_hcd_platform_probe,
-	.remove_new	= uhci_hcd_platform_remove,
+	.remove		= uhci_hcd_platform_remove,
 	.shutdown	= uhci_hcd_platform_shutdown,
 	.driver = {
 		.name = "platform-uhci",
diff --git a/drivers/usb/host/xhci-histb.c b/drivers/usb/host/xhci-histb.c
index f9a4a4b0eb57..8a7d46dae62c 100644
--- a/drivers/usb/host/xhci-histb.c
+++ b/drivers/usb/host/xhci-histb.c
@@ -373,7 +373,7 @@ MODULE_DEVICE_TABLE(of, histb_xhci_of_match);
 
 static struct platform_driver histb_xhci_driver = {
 	.probe	= xhci_histb_probe,
-	.remove_new = xhci_histb_remove,
+	.remove = xhci_histb_remove,
 	.driver	= {
 		.name = "xhci-histb",
 		.pm = DEV_PM_OPS,
diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 3252e3d2d79c..904831344440 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -853,7 +853,7 @@ MODULE_DEVICE_TABLE(of, mtk_xhci_of_match);
 
 static struct platform_driver mtk_xhci_driver = {
 	.probe	= xhci_mtk_probe,
-	.remove_new = xhci_mtk_remove,
+	.remove = xhci_mtk_remove,
 	.driver	= {
 		.name = "xhci-mtk",
 		.pm = DEV_PM_OPS,
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index ecaa75718e59..e6c9006bd568 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -573,7 +573,7 @@ MODULE_DEVICE_TABLE(acpi, usb_xhci_acpi_match);
 
 static struct platform_driver usb_generic_xhci_driver = {
 	.probe	= xhci_generic_plat_probe,
-	.remove_new = xhci_plat_remove,
+	.remove = xhci_plat_remove,
 	.shutdown = usb_hcd_platform_shutdown,
 	.driver	= {
 		.name = "xhci-hcd",
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 8b357647728c..1cc082a3b793 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -274,7 +274,7 @@ static int xhci_renesas_probe(struct platform_device *pdev)
 
 static struct platform_driver usb_xhci_renesas_driver = {
 	.probe = xhci_renesas_probe,
-	.remove_new = xhci_plat_remove,
+	.remove = xhci_plat_remove,
 	.shutdown = usb_hcd_platform_shutdown,
 	.driver = {
 		.name = "xhci-renesas-hcd",
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 6246d5ad1468..12a00a4bb4d3 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2664,7 +2664,7 @@ MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);
 
 static struct platform_driver tegra_xusb_driver = {
 	.probe = tegra_xusb_probe,
-	.remove_new = tegra_xusb_remove,
+	.remove = tegra_xusb_remove,
 	.shutdown = tegra_xusb_shutdown,
 	.driver = {
 		.name = "tegra-xusb",
diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
index fe1e3985419a..a64190addba6 100644
--- a/drivers/usb/isp1760/isp1760-if.c
+++ b/drivers/usb/isp1760/isp1760-if.c
@@ -263,7 +263,7 @@ MODULE_DEVICE_TABLE(of, isp1760_of_match);
 
 static struct platform_driver isp1760_plat_driver = {
 	.probe	= isp1760_plat_probe,
-	.remove_new = isp1760_plat_remove,
+	.remove = isp1760_plat_remove,
 	.driver	= {
 		.name	= "isp1760",
 		.of_match_table = of_match_ptr(isp1760_of_match),
diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 560591e02d6a..ef6845c05784 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -471,7 +471,7 @@ static const struct dev_pm_ops __maybe_unused onboard_dev_pm_ops = {
 
 static struct platform_driver onboard_dev_driver = {
 	.probe = onboard_dev_probe,
-	.remove_new = onboard_dev_remove,
+	.remove = onboard_dev_remove,
 
 	.driver = {
 		.name = "onboard-usb-dev",
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 19906301a4eb..83079c414b4f 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -239,7 +239,7 @@ MODULE_DEVICE_TABLE(of, eud_dt_match);
 
 static struct platform_driver eud_driver = {
 	.probe	= eud_probe,
-	.remove_new = eud_remove,
+	.remove = eud_remove,
 	.driver	= {
 		.name = "qcom_eud",
 		.dev_groups = eud_groups,
diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index 3b33e4878c60..322e59381b78 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -423,7 +423,7 @@ static struct platform_driver usb3503_platform_driver = {
 		.pm = pm_ptr(&usb3503_platform_pm_ops),
 	},
 	.probe		= usb3503_platform_probe,
-	.remove_new	= usb3503_platform_remove,
+	.remove		= usb3503_platform_remove,
 };
 
 static int __init usb3503_init(void)
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 6858ed9fc3b2..6b6f3f8e89a9 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -621,7 +621,7 @@ MODULE_DEVICE_TABLE(of, mtu3_of_match);
 
 static struct platform_driver mtu3_driver = {
 	.probe = mtu3_probe,
-	.remove_new = mtu3_remove,
+	.remove = mtu3_remove,
 	.driver = {
 		.name = MTU3_DRIVER_NAME,
 		.pm = DEV_PM_OPS,
diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index 953094c1930c..f772aa272bea 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -633,7 +633,7 @@ MODULE_DEVICE_TABLE(of, da8xx_id_table);
 
 static struct platform_driver da8xx_driver = {
 	.probe		= da8xx_probe,
-	.remove_new	= da8xx_remove,
+	.remove		= da8xx_remove,
 	.driver		= {
 		.name	= "musb-da8xx",
 		.pm = &da8xx_pm_ops,
diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index b38df9226278..acdeb1117cd3 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -325,7 +325,7 @@ MODULE_DEVICE_TABLE(of, jz4740_musb_of_match);
 
 static struct platform_driver jz4740_driver = {
 	.probe		= jz4740_probe,
-	.remove_new	= jz4740_remove,
+	.remove		= jz4740_remove,
 	.driver		= {
 		.name	= "musb-jz4740",
 		.of_match_table = jz4740_musb_of_match,
diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index 63c86c046b98..aa988d74b58d 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -523,7 +523,7 @@ MODULE_DEVICE_TABLE(of, mtk_musb_match);
 
 static struct platform_driver mtk_musb_driver = {
 	.probe = mtk_musb_probe,
-	.remove_new = mtk_musb_remove,
+	.remove = mtk_musb_remove,
 	.driver = {
 		   .name = "musb-mtk",
 		   .of_match_table = of_match_ptr(mtk_musb_match),
diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 00e13214aa76..7edc8429b274 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -369,7 +369,7 @@ MODULE_DEVICE_TABLE(of, mpfs_id_table);
 
 static struct platform_driver mpfs_musb_driver = {
 	.probe = mpfs_probe,
-	.remove_new = mpfs_remove,
+	.remove = mpfs_remove,
 	.driver = {
 		.name = "mpfs-musb",
 		.of_match_table = of_match_ptr(mpfs_id_table)
diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index b24adb5b399f..25fafde6003c 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2953,7 +2953,7 @@ static struct platform_driver musb_driver = {
 		.dev_groups	= musb_groups,
 	},
 	.probe		= musb_probe,
-	.remove_new	= musb_remove,
+	.remove		= musb_remove,
 };
 
 module_platform_driver(musb_driver);
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index 9c7a8bbc0542..2542239ec64e 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -1032,7 +1032,7 @@ static SIMPLE_DEV_PM_OPS(dsps_pm_ops, dsps_suspend, dsps_resume);
 
 static struct platform_driver dsps_usbss_driver = {
 	.probe		= dsps_probe,
-	.remove_new     = dsps_remove,
+	.remove         = dsps_remove,
 	.driver         = {
 		.name   = "musb-dsps",
 		.pm	= &dsps_pm_ops,
diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index b4a4c1df4e0d..2970967a4fd2 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -608,7 +608,7 @@ MODULE_DEVICE_TABLE(of, omap2430_id_table);
 
 static struct platform_driver omap2430_driver = {
 	.probe		= omap2430_probe,
-	.remove_new	= omap2430_remove,
+	.remove		= omap2430_remove,
 	.driver		= {
 		.name	= "musb-omap2430",
 		.pm	= DEV_PM_OPS,
diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index d54283fd026b..113d026ac2f8 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -859,7 +859,7 @@ MODULE_DEVICE_TABLE(of, sunxi_musb_match);
 
 static struct platform_driver sunxi_musb_driver = {
 	.probe = sunxi_musb_probe,
-	.remove_new = sunxi_musb_remove,
+	.remove = sunxi_musb_remove,
 	.driver = {
 		.name = "musb-sunxi",
 		.of_match_table = sunxi_musb_match,
diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index 461587629bf2..90b760a95e4e 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -1290,7 +1290,7 @@ static void tusb_remove(struct platform_device *pdev)
 
 static struct platform_driver tusb_driver = {
 	.probe		= tusb_probe,
-	.remove_new	= tusb_remove,
+	.remove		= tusb_remove,
 	.driver		= {
 		.name	= "musb-tusb",
 	},
diff --git a/drivers/usb/musb/ux500.c b/drivers/usb/musb/ux500.c
index c8d9d2a1d2f0..8c2a43d992f5 100644
--- a/drivers/usb/musb/ux500.c
+++ b/drivers/usb/musb/ux500.c
@@ -355,7 +355,7 @@ MODULE_DEVICE_TABLE(of, ux500_match);
 
 static struct platform_driver ux500_driver = {
 	.probe		= ux500_probe,
-	.remove_new	= ux500_remove,
+	.remove		= ux500_remove,
 	.driver		= {
 		.name	= "musb-ux500",
 		.pm	= &ux500_pm_ops,
diff --git a/drivers/usb/phy/phy-ab8500-usb.c b/drivers/usb/phy/phy-ab8500-usb.c
index 408f47e39025..6a98aeeeae31 100644
--- a/drivers/usb/phy/phy-ab8500-usb.c
+++ b/drivers/usb/phy/phy-ab8500-usb.c
@@ -987,7 +987,7 @@ MODULE_DEVICE_TABLE(platform, ab8500_usb_devtype);
 
 static struct platform_driver ab8500_usb_driver = {
 	.probe		= ab8500_usb_probe,
-	.remove_new	= ab8500_usb_remove,
+	.remove		= ab8500_usb_remove,
 	.id_table	= ab8500_usb_devtype,
 	.driver		= {
 		.name	= "abx5x0-usb",
diff --git a/drivers/usb/phy/phy-am335x.c b/drivers/usb/phy/phy-am335x.c
index 6db88e00f127..ca9353dad71a 100644
--- a/drivers/usb/phy/phy-am335x.c
+++ b/drivers/usb/phy/phy-am335x.c
@@ -133,7 +133,7 @@ MODULE_DEVICE_TABLE(of, am335x_phy_ids);
 
 static struct platform_driver am335x_phy_driver = {
 	.probe          = am335x_phy_probe,
-	.remove_new     = am335x_phy_remove,
+	.remove         = am335x_phy_remove,
 	.driver         = {
 		.name   = "am335x-phy-driver",
 		.pm = &am335x_pm_ops,
diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 1ebbf189a535..b4b522a21769 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -1002,7 +1002,7 @@ static void fsl_otg_remove(struct platform_device *pdev)
 
 struct platform_driver fsl_otg_driver = {
 	.probe = fsl_otg_probe,
-	.remove_new = fsl_otg_remove,
+	.remove = fsl_otg_remove,
 	.driver = {
 		.name = driver_name,
 	},
diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index e7d50e0a1612..6c3ececf9137 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -345,7 +345,7 @@ MODULE_DEVICE_TABLE(of, nop_xceiv_dt_ids);
 
 static struct platform_driver usb_phy_generic_driver = {
 	.probe		= usb_phy_generic_probe,
-	.remove_new	= usb_phy_generic_remove,
+	.remove		= usb_phy_generic_remove,
 	.driver		= {
 		.name	= "usb_phy_generic",
 		.of_match_table = nop_xceiv_dt_ids,
diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index 5428b2b67de1..ce09e789afd8 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -385,7 +385,7 @@ static struct platform_driver gpio_vbus_driver = {
 		.of_match_table = gpio_vbus_of_match,
 	},
 	.probe		= gpio_vbus_probe,
-	.remove_new	= gpio_vbus_remove,
+	.remove		= gpio_vbus_remove,
 };
 
 module_platform_driver(gpio_vbus_driver);
diff --git a/drivers/usb/phy/phy-keystone.c b/drivers/usb/phy/phy-keystone.c
index bd9a98ad1b30..51155c5513d3 100644
--- a/drivers/usb/phy/phy-keystone.c
+++ b/drivers/usb/phy/phy-keystone.c
@@ -103,7 +103,7 @@ MODULE_DEVICE_TABLE(of, keystone_usbphy_ids);
 
 static struct platform_driver keystone_usbphy_driver = {
 	.probe          = keystone_usbphy_probe,
-	.remove_new     = keystone_usbphy_remove,
+	.remove         = keystone_usbphy_remove,
 	.driver         = {
 		.name   = "keystone-usbphy",
 		.of_match_table = keystone_usbphy_ids,
diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
index df7c27474a75..a7a102f2e163 100644
--- a/drivers/usb/phy/phy-mv-usb.c
+++ b/drivers/usb/phy/phy-mv-usb.c
@@ -867,7 +867,7 @@ static int mv_otg_resume(struct platform_device *pdev)
 
 static struct platform_driver mv_otg_driver = {
 	.probe = mv_otg_probe,
-	.remove_new = mv_otg_remove,
+	.remove = mv_otg_remove,
 	.driver = {
 		   .name = driver_name,
 		   .dev_groups = mv_otg_groups,
diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index cc4156c1b148..7490f1798b46 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -952,7 +952,7 @@ static SIMPLE_DEV_PM_OPS(mxs_phy_pm, mxs_phy_system_suspend,
 
 static struct platform_driver mxs_phy_driver = {
 	.probe = mxs_phy_probe,
-	.remove_new = mxs_phy_remove,
+	.remove = mxs_phy_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = mxs_phy_dt_ids,
diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
index 5cac31c6029b..ae7bf3ff89ee 100644
--- a/drivers/usb/phy/phy-tahvo.c
+++ b/drivers/usb/phy/phy-tahvo.c
@@ -424,7 +424,7 @@ static void tahvo_usb_remove(struct platform_device *pdev)
 
 static struct platform_driver tahvo_usb_driver = {
 	.probe		= tahvo_usb_probe,
-	.remove_new	= tahvo_usb_remove,
+	.remove		= tahvo_usb_remove,
 	.driver		= {
 		.name	= "tahvo-usb",
 		.dev_groups = tahvo_groups,
diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 4ea47e6f835b..bee222967f6b 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -1495,7 +1495,7 @@ static void tegra_usb_phy_remove(struct platform_device *pdev)
 
 static struct platform_driver tegra_usb_phy_driver = {
 	.probe		= tegra_usb_phy_probe,
-	.remove_new	= tegra_usb_phy_remove,
+	.remove		= tegra_usb_phy_remove,
 	.driver		= {
 		.name	= "tegra-phy",
 		.of_match_table = tegra_usb_phy_id_table,
diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index da09cff55abc..49d79c1257f3 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -432,7 +432,7 @@ MODULE_DEVICE_TABLE(of, twl6030_usb_id_table);
 
 static struct platform_driver twl6030_usb_driver = {
 	.probe		= twl6030_usb_probe,
-	.remove_new	= twl6030_usb_remove,
+	.remove		= twl6030_usb_remove,
 	.driver		= {
 		.name	= "twl6030_usb",
 		.of_match_table = of_match_ptr(twl6030_usb_id_table),
diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index edc43f169d49..61b440cc3a16 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -835,7 +835,7 @@ static struct platform_driver renesas_usbhs_driver = {
 		.of_match_table = usbhs_of_match,
 	},
 	.probe		= usbhs_probe,
-	.remove_new	= usbhs_remove,
+	.remove		= usbhs_remove,
 };
 
 module_platform_driver(renesas_usbhs_driver);
diff --git a/drivers/usb/roles/intel-xhci-usb-role-switch.c b/drivers/usb/roles/intel-xhci-usb-role-switch.c
index e5c6c413a075..cd2e026dcb22 100644
--- a/drivers/usb/roles/intel-xhci-usb-role-switch.c
+++ b/drivers/usb/roles/intel-xhci-usb-role-switch.c
@@ -217,7 +217,7 @@ static struct platform_driver intel_xhci_usb_driver = {
 	},
 	.id_table = intel_xhci_usb_table,
 	.probe = intel_xhci_usb_probe,
-	.remove_new = intel_xhci_usb_remove,
+	.remove = intel_xhci_usb_remove,
 };
 
 module_platform_driver(intel_xhci_usb_driver);
diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
index 8902102c05a8..1834f1a2dd9d 100644
--- a/drivers/usb/typec/mux/gpio-sbu-mux.c
+++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
@@ -159,7 +159,7 @@ MODULE_DEVICE_TABLE(of, gpio_sbu_mux_match);
 
 static struct platform_driver gpio_sbu_mux_driver = {
 	.probe = gpio_sbu_mux_probe,
-	.remove_new = gpio_sbu_mux_remove,
+	.remove = gpio_sbu_mux_remove,
 	.driver = {
 		.name = "gpio_sbu_mux",
 		.of_match_table = gpio_sbu_mux_match,
diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 46b4c5c3a6be..5dfe95754394 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -828,7 +828,7 @@ static struct platform_driver pmc_usb_driver = {
 		.acpi_match_table = ACPI_PTR(pmc_usb_acpi_ids),
 	},
 	.probe = pmc_usb_probe,
-	.remove_new = pmc_usb_remove,
+	.remove = pmc_usb_remove,
 };
 
 static int __init pmc_usb_init(void)
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 501eddb294e4..2201eeae5a99 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -161,7 +161,7 @@ static struct platform_driver qcom_pmic_typec_driver = {
 		.of_match_table = qcom_pmic_typec_table,
 	},
 	.probe = qcom_pmic_typec_probe,
-	.remove_new = qcom_pmic_typec_remove,
+	.remove = qcom_pmic_typec_remove,
 };
 
 module_platform_driver(qcom_pmic_typec_driver);
diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
index 02b7fd302265..881ffacbfd77 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
@@ -221,7 +221,7 @@ static struct platform_driver mt6360_tcpc_driver = {
 		.of_match_table = mt6360_tcpc_of_id,
 	},
 	.probe = mt6360_tcpc_probe,
-	.remove_new = mt6360_tcpc_remove,
+	.remove = mt6360_tcpc_remove,
 };
 module_platform_driver(mt6360_tcpc_driver);
 
diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
index 9cda1005ef01..1479f961772d 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
@@ -196,7 +196,7 @@ static struct platform_driver mt6370_tcpc_driver = {
 		.of_match_table = mt6370_tcpc_devid_table,
 	},
 	.probe = mt6370_tcpc_probe,
-	.remove_new = mt6370_tcpc_remove,
+	.remove = mt6370_tcpc_remove,
 };
 module_platform_driver(mt6370_tcpc_driver);
 
diff --git a/drivers/usb/typec/tcpm/wcove.c b/drivers/usb/typec/tcpm/wcove.c
index cf719307b3f6..8eb1db0c0e36 100644
--- a/drivers/usb/typec/tcpm/wcove.c
+++ b/drivers/usb/typec/tcpm/wcove.c
@@ -691,7 +691,7 @@ static struct platform_driver wcove_typec_driver = {
 		.name		= "bxt_wcove_usbc",
 	},
 	.probe			= wcove_typec_probe,
-	.remove_new		= wcove_typec_remove,
+	.remove			= wcove_typec_remove,
 };
 
 module_platform_driver(wcove_typec_driver);
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 7a5dff8d9cc6..6d6120c8ab7c 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -320,7 +320,7 @@ static struct platform_driver ucsi_acpi_platform_driver = {
 		.acpi_match_table = ACPI_PTR(ucsi_acpi_match),
 	},
 	.probe = ucsi_acpi_probe,
-	.remove_new = ucsi_acpi_remove,
+	.remove = ucsi_acpi_remove,
 };
 
 module_platform_driver(ucsi_acpi_platform_driver);
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 8dac1edc74d4..b03e5021c25b 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1487,7 +1487,7 @@ static int vhci_hcd_resume(struct platform_device *pdev)
 
 static struct platform_driver vhci_driver = {
 	.probe	= vhci_hcd_probe,
-	.remove_new = vhci_hcd_remove,
+	.remove = vhci_hcd_remove,
 	.suspend = vhci_hcd_suspend,
 	.resume	= vhci_hcd_resume,
 	.driver	= {
diff --git a/drivers/usb/usbip/vudc_main.c b/drivers/usb/usbip/vudc_main.c
index 8bee553e4894..993e721cb840 100644
--- a/drivers/usb/usbip/vudc_main.c
+++ b/drivers/usb/usbip/vudc_main.c
@@ -19,7 +19,7 @@ MODULE_PARM_DESC(num, "number of emulated controllers");
 
 static struct platform_driver vudc_driver = {
 	.probe		= vudc_probe,
-	.remove_new	= vudc_remove,
+	.remove		= vudc_remove,
 	.driver		= {
 		.name	= GADGET_NAME,
 		.dev_groups = vudc_groups,

base-commit: 4d0326b60bb753627437fff0f76bf1525bcda422
-- 
2.45.2


