Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF9FDB328
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 19:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440617AbfJQRTm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Oct 2019 13:19:42 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:36910 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728639AbfJQRTm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Oct 2019 13:19:42 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iL9R4-0005Yp-RG; Thu, 17 Oct 2019 18:19:38 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iL9R4-0002IK-Cr; Thu, 17 Oct 2019 18:19:38 +0100
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: host: oxu210hp-hcd: fix __iomem annotations
Date:   Thu, 17 Oct 2019 18:19:34 +0100
Message-Id: <20191017171934.8771-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are a number of places in the driver where it fails
to maintain __iomem on pointers used to access registers
so fixup the warnings by adding these in the appropriate
places.

Examples of the sparse warnings fixed:

drivers/usb/host/oxu210hp-hcd.c:686:9: warning: incorrect type in argument 2 (different address spaces)
drivers/usb/host/oxu210hp-hcd.c:686:9:    expected void volatile [noderef] <asn:2> *addr
drivers/usb/host/oxu210hp-hcd.c:686:9:    got void *
drivers/usb/host/oxu210hp-hcd.c:686:9: warning: incorrect type in argument 2 (different address spaces)
drivers/usb/host/oxu210hp-hcd.c:686:9:    expected void volatile [noderef] <asn:2> *addr
drivers/usb/host/oxu210hp-hcd.c:686:9:    got void *
drivers/usb/host/oxu210hp-hcd.c:686:9: warning: incorrect type in argument 2 (different address spaces)
drivers/usb/host/oxu210hp-hcd.c:686:9:    expected void volatile [noderef] <asn:2> *addr
drivers/usb/host/oxu210hp-hcd.c:686:9:    got void *
drivers/usb/host/oxu210hp-hcd.c:681:16: warning: incorrect type in argument 1 (different address spaces)
drivers/usb/host/oxu210hp-hcd.c:681:16:    expected void const volatile [noderef] <asn:2> *addr
drivers/usb/host/oxu210hp-hcd.c:681:16:    got void *

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
---
 drivers/usb/host/oxu210hp-hcd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index e67242e437ed..fe09b8626329 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -676,12 +676,12 @@ static int oxu_hub_control(struct usb_hcd *hcd,
  */
 
 /* Low level read/write registers functions */
-static inline u32 oxu_readl(void *base, u32 reg)
+static inline u32 oxu_readl(void __iomem *base, u32 reg)
 {
 	return readl(base + reg);
 }
 
-static inline void oxu_writel(void *base, u32 reg, u32 val)
+static inline void oxu_writel(void __iomem *base, u32 reg, u32 val)
 {
 	writel(val, base + reg);
 }
@@ -4063,7 +4063,7 @@ static const struct hc_driver oxu_hc_driver = {
  * Module stuff
  */
 
-static void oxu_configuration(struct platform_device *pdev, void *base)
+static void oxu_configuration(struct platform_device *pdev, void __iomem *base)
 {
 	u32 tmp;
 
@@ -4093,7 +4093,7 @@ static void oxu_configuration(struct platform_device *pdev, void *base)
 	oxu_writel(base, OXU_CHIPIRQEN_SET, OXU_USBSPHLPWUI | OXU_USBOTGLPWUI);
 }
 
-static int oxu_verify_id(struct platform_device *pdev, void *base)
+static int oxu_verify_id(struct platform_device *pdev, void __iomem *base)
 {
 	u32 id;
 	static const char * const bo[] = {
@@ -4121,7 +4121,7 @@ static int oxu_verify_id(struct platform_device *pdev, void *base)
 static const struct hc_driver oxu_hc_driver;
 static struct usb_hcd *oxu_create(struct platform_device *pdev,
 				unsigned long memstart, unsigned long memlen,
-				void *base, int irq, int otg)
+				void __iomem *base, int irq, int otg)
 {
 	struct device *dev = &pdev->dev;
 
@@ -4158,7 +4158,7 @@ static struct usb_hcd *oxu_create(struct platform_device *pdev,
 
 static int oxu_init(struct platform_device *pdev,
 				unsigned long memstart, unsigned long memlen,
-				void *base, int irq)
+				void __iomem *base, int irq)
 {
 	struct oxu_info *info = platform_get_drvdata(pdev);
 	struct usb_hcd *hcd;
@@ -4207,7 +4207,7 @@ static int oxu_init(struct platform_device *pdev,
 static int oxu_drv_probe(struct platform_device *pdev)
 {
 	struct resource *res;
-	void *base;
+	void __iomem *base;
 	unsigned long memstart, memlen;
 	int irq, ret;
 	struct oxu_info *info;
-- 
2.23.0

