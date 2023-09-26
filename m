Return-Path: <linux-usb+bounces-590-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CDD7AEFE8
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 17:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 3DF9D1C20865
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 15:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A82430D08;
	Tue, 26 Sep 2023 15:46:41 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E9266BA
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 15:46:38 +0000 (UTC)
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1FE10A;
	Tue, 26 Sep 2023 08:46:35 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 9C32382499;
	Tue, 26 Sep 2023 17:46:33 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Tue, 26 Sep 2023 17:46:22 +0200
Subject: [PATCH RFC v2 1/6] ARM: pxa: Convert Spitz OHCI to GPIO
 descriptors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230926-pxa-gpio-v2-1-984464d165dd@skole.hr>
References: <20230926-pxa-gpio-v2-0-984464d165dd@skole.hr>
In-Reply-To: <20230926-pxa-gpio-v2-0-984464d165dd@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2753;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=aaS8kMiqneoLRyB8TsJKCzQAPSmGaArXhTx/CbQd1hc=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlEvzWJsUqoFqdA1T7iq2VCheOULkVgSFLrrG/m
 e2M+Wb3LHyJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZRL81gAKCRCaEZ6wQi2W
 4RxJD/sFrD6/5F+LgaAMPH2MsypLLSc4yCwc0ouSWJ88N8r+4JoWpaQ7xCK7arUZpleaLdqbAZG
 5MOxg49C7aURLPXhtqzhK0GykyxjwqJ2wMpZNuutcZe6n7X4Z+gRvK4eCyLDUug9yMyr1DdJegr
 XWkEgjl8WKiPC733QJ9hlyMBG5M364V98rbaKrhjebdZ+XENSU+LrZGn/zGRPlBYmtWeWgG2qEt
 l5Pv3b5N5HSpeFWgkN/Yn3i7MrTKRXMlGpatolnsLay3xkSagiU98S4wMsOSsipeu1a3+BjmZ91
 oGTJ9d+DVWg5OMmyDDIYfHeZRONX+PGtiXPsW37XmyNWYRYo8lWTU85BD+2uMZTtVTJ3hBlMctN
 5Czzjcy5QOhJUfSXmfZ8bQwezseHYJjyBeUbRk4B6Zei21r1H078MO1VMiZOMa2vFm8UpykYNf2
 3Ut4qas+NwCzvBxqGShT/8TWMbRHwLFzee2san42cbxPzCAW+EuKqH/HL8RBWs3xTQd7BGzYJ9T
 Ta6CU8U66uVX+c57N/gePPWjo3uy/Qe4N1SzFnzeAGxhorqIoZZKcXfc8nL+Tgee0Ezwzfnb+ha
 IFn/WSXxVtCgRp92KEYkNoWde4IQKoA9pu0gpaWf6katGueFjqz6J6kwXisQL2FRvPXPNGQ0zfG
 gZU19Lq3Sdvku1Q==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Sharp's Spitz board still uses the legacy GPIO interface for controlling
a GPIO pin related to the USB host controller.

Convert this function to use the new GPIO descriptor interface.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm/mach-pxa/spitz.c      | 13 ++++++-------
 drivers/usb/host/ohci-pxa27x.c |  7 +++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

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
index 357d9aee38a3..b70d452ca7c2 100644
--- a/drivers/usb/host/ohci-pxa27x.c
+++ b/drivers/usb/host/ohci-pxa27x.c
@@ -121,6 +121,7 @@ struct pxa27x_ohci {
 	void __iomem	*mmio_base;
 	struct regulator *vbus[3];
 	bool		vbus_enabled[3];
+	struct gpio_desc *usb_host;
 };
 
 #define to_pxa27x_ohci(hcd)	(struct pxa27x_ohci *)(hcd_to_ohci(hcd)->priv)
@@ -447,6 +448,10 @@ static int ohci_hcd_pxa27x_probe(struct platform_device *pdev)
 	pxa_ohci = to_pxa27x_ohci(hcd);
 	pxa_ohci->clk = usb_clk;
 	pxa_ohci->mmio_base = (void __iomem *)hcd->regs;
+	pxa_ohci->usb_host = gpiod_get_optional(&pdev->dev, "usb-host", GPIOD_OUT_LOW);
+	if (IS_ERR(pxa_ohci->usb_host))
+		dev_warn(&pdev->dev, "failed to get USB host GPIO with %pe\n",
+				pxa_ohci->usb_host);
 
 	for (i = 0; i < 3; ++i) {
 		char name[6];
@@ -512,6 +517,8 @@ static void ohci_hcd_pxa27x_remove(struct platform_device *pdev)
 	for (i = 0; i < 3; ++i)
 		pxa27x_ohci_set_vbus_power(pxa_ohci, i, false);
 
+	gpiod_put(pxa_ohci->usb_host);
+
 	usb_put_hcd(hcd);
 }
 

-- 
2.42.0



