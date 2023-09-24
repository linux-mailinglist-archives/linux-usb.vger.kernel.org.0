Return-Path: <linux-usb+bounces-547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC847ACAF5
	for <lists+linux-usb@lfdr.de>; Sun, 24 Sep 2023 19:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 421FB1C20818
	for <lists+linux-usb@lfdr.de>; Sun, 24 Sep 2023 17:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FAADDA5;
	Sun, 24 Sep 2023 17:17:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6103D268
	for <linux-usb@vger.kernel.org>; Sun, 24 Sep 2023 17:17:48 +0000 (UTC)
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0086FC;
	Sun, 24 Sep 2023 10:17:47 -0700 (PDT)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 404C683220;
	Sun, 24 Sep 2023 19:11:27 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Sun, 24 Sep 2023 18:42:54 +0200
Subject: [PATCH RFC 1/6] ARM: pxa: Convert Spitz OHCI to GPIO descriptors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230924-pxa-gpio-v1-1-2805b87d8894@skole.hr>
References: <20230924-pxa-gpio-v1-0-2805b87d8894@skole.hr>
In-Reply-To: <20230924-pxa-gpio-v1-0-2805b87d8894@skole.hr>
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Russell King <linux@armlinux.org.uk>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=+Sz/awoB80RmbtvdOIvdB1I17dA4iaXaSLREife8PXw=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlEG270ggGazGspMk88lLMCw46u4STUHtpeT+Ie
 qd9ziPqrVuJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZRBtuwAKCRCaEZ6wQi2W
 4etcD/9D7l6HUQH9mdjzDPU6tTfkLANQhPadZnhVUxfkp0t6FveMEeAUPBB49XrI9De9Pv5iz+8
 dXDH9DG7ch/kaAsgPtv/tcpcE/UTm76BMlm/n0AUXt1m10olIuN84mSxp7dTfEUE2EPVd7UVs7/
 hmuHXBO9wh2QffllcDNH02daRbqQFMgqKHtejR8LTvG7WcYgbTSQ0ZV9BjwhWgHXM5rfo7UPncB
 nVPCr5VE0v7XCoJHxF+mYXUcSNIMp7qDMzdvfISvi+swTqYAL5A5dxMmuDBL5Nh4msvbGtuRAvb
 bnVfBHRRa1BMSlKLwMopCV3WMxAfcicJI7YFelvJrvQqY8xzcL+larydFbnYrGZZa+RBePHY1oT
 6Fh6XUO+xJRtwjYqdtr/9WltW6Mrk6cKl+HqdROiJsY9oPBcuqKTWaEUIwjeh0gz7OEjj0nbywg
 rbbb7u5e7TYiNi2AGb1dFOk/kCfddW2fMZvwD3VOThXMmxxkT2bcPF3cvFmh1LESlmFnT1RVd/D
 d7AJh7W1xJMtUVacCs8pd511R87vF730jvw2+BpBBVSA5FfmRUg3tbT/YEtu14Zv3/lr6fP7YPf
 ahr83Pel17Ec1biQ0nYr2VSr0dBSMZoPiFSaJvSxb4PiJ+FWOA0WM5g1RvEVVdo06ViNV5tN71b
 tDQ/fWIRF6wbtew==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Sharp's Spitz board still uses the legacy GPIO interface for controlling
a GPIO pin related to the USB host controller.

Convert this function to use the new GPIO descriptor interface.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm/mach-pxa/spitz.c      | 13 ++++++-------
 drivers/usb/host/ohci-pxa27x.c | 10 ++++++++++
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index cc691b199429..535e2b2e997b 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -649,23 +649,22 @@ static inline void spitz_mmc_init(void) {}
  * USB Host
  ******************************************************************************/
 #if defined(CONFIG_USB_OHCI_HCD) || defined(CONFIG_USB_OHCI_HCD_MODULE)
+GPIO_LOOKUP_SINGLE(spitz_usb_host_gpio_table, "pxa27x-ohci", "gpio-pxa",
+		SPITZ_GPIO_USB_HOST, "usb-host", GPIO_ACTIVE_LOW);
+
 static int spitz_ohci_init(struct device *dev)
 {
-	int err;
-
-	err = gpio_request(SPITZ_GPIO_USB_HOST, "USB_HOST");
-	if (err)
-		return err;
+	gpiod_add_lookup_table(&spitz_usb_host_gpio_table);
 
 	/* Only Port 2 is connected, setup USB Port 2 Output Control Register */
 	UP2OCR = UP2OCR_HXS | UP2OCR_HXOE | UP2OCR_DPPDE | UP2OCR_DMPDE;
 
-	return gpio_direction_output(SPITZ_GPIO_USB_HOST, 1);
+	return 0;
 }
 
 static void spitz_ohci_exit(struct device *dev)
 {
-	gpio_free(SPITZ_GPIO_USB_HOST);
+	gpiod_remove_lookup_table(&spitz_usb_host_gpio_table);
 }
 
 static struct pxaohci_platform_data spitz_ohci_platform_data = {
diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
index 357d9aee38a3..0cf222f9d64b 100644
--- a/drivers/usb/host/ohci-pxa27x.c
+++ b/drivers/usb/host/ohci-pxa27x.c
@@ -121,6 +121,7 @@ struct pxa27x_ohci {
 	void __iomem	*mmio_base;
 	struct regulator *vbus[3];
 	bool		vbus_enabled[3];
+	struct gpio_desc *usb_host;
 };
 
 #define to_pxa27x_ohci(hcd)	(struct pxa27x_ohci *)(hcd_to_ohci(hcd)->priv)
@@ -447,6 +448,12 @@ static int ohci_hcd_pxa27x_probe(struct platform_device *pdev)
 	pxa_ohci = to_pxa27x_ohci(hcd);
 	pxa_ohci->clk = usb_clk;
 	pxa_ohci->mmio_base = (void __iomem *)hcd->regs;
+	pxa_ohci->usb_host = gpiod_get(&pdev->dev, "usb-host", GPIOD_OUT_LOW);
+	if (IS_ERR(pxa_ohci->usb_host)) {
+		dev_warn(&pdev->dev, "failed to get USB host GPIO with %d\n",
+				(int) pxa_ohci->usb_host);
+		pxa_ohci->usb_host = NULL;
+	}
 
 	for (i = 0; i < 3; ++i) {
 		char name[6];
@@ -512,6 +519,9 @@ static void ohci_hcd_pxa27x_remove(struct platform_device *pdev)
 	for (i = 0; i < 3; ++i)
 		pxa27x_ohci_set_vbus_power(pxa_ohci, i, false);
 
+	if (pxa_ohci->usb_host)
+		gpiod_put(pxa_ohci->usb_host);
+
 	usb_put_hcd(hcd);
 }
 

-- 
2.42.0



