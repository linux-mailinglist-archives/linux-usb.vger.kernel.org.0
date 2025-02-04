Return-Path: <linux-usb+bounces-20084-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D659A26FF8
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 12:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F20BE1649D0
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 11:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625F820C02A;
	Tue,  4 Feb 2025 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HvdhsEwa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A6E20A5F1;
	Tue,  4 Feb 2025 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667389; cv=none; b=Rpnft9FTj5GJWf6fsPgXgVrxktBVXfd/BQS+71F6H7/PmwVBbY0jQNkAMzebxbIUNjtg3nMvlNcLglpaWR9YLqMllBWGOxzi//aHZtUi0N9w6JHcZJDx0Vd8/I9ZCrRLXDjvavxxAyDwrTmP4sADpsdVCvO/breA+U2KBjxqkjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667389; c=relaxed/simple;
	bh=BUDXKiFk/9VT3QXVDcyMfviA4AmGJkFmSYcFfg6fQDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HoIv4OXoKfDaOM/xxw95nZ8a0KmMrDg8asiTYnijDwLN5X5fj5fo7P89SKjwdClvvFQizZdPww6w9NeGWFZh+W9GXaSHpUZDzs1UIStYYi6fyQKyggcMRDE4vSHGKbqKjWC+9b8HiKP9CvEgaqJQyBMg6AnHWnMA9vbgM6FM/CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HvdhsEwa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4F2C4CEDF;
	Tue,  4 Feb 2025 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738667389;
	bh=BUDXKiFk/9VT3QXVDcyMfviA4AmGJkFmSYcFfg6fQDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HvdhsEwajw6HdjQcvlPREsrFcafz47DEDkaqlkXrq4vnnEn1rdrwe/KAkkgvZ0k2U
	 TNxwZr6N0fSX6p9NwdLwJnOmZ+LapwNukGZKstN8R5ENFz2IqpOLSOB0wyaeuQWMtH
	 eCGVt5T1dhUGtLq5HNkISLra0ZTioNP2/ajaomsw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 3/5] USB: phy: convert usb_phy_generic logic to use a faux device
Date: Tue,  4 Feb 2025 12:09:15 +0100
Message-ID: <2025020424-overstock-scheming-6a30@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020421-poster-moisture-534b@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 168
X-Developer-Signature: v=1; a=openpgp-sha256; l=5681; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=BUDXKiFk/9VT3QXVDcyMfviA4AmGJkFmSYcFfg6fQDg=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkLv6buy4yMOXKGKdHQdfaU4LIPxSdufO9Z5tnZyXDr0 /y91R/6OmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiC54yzPfy91lcHp0Z+mf9 vgPLVhzYkZgk8IRhwZYgF92HH7cK3jkUqhyXzGITfvzOEQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The usb_phy_generic code was creating a "fake" platform device to pass
around in different places.  Instead of doing that, use the faux bus
instead as that is what is really wanted here.

Site note, this fixes a bug in the mpfs driver where the incorrect
pointer was being passed to usb_phy_generic_unregister(), odd that no
one ever hit this in the past.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 v2: no change

 drivers/usb/chipidea/ci_hdrc_pci.c  | 2 +-
 drivers/usb/dwc2/pci.c              | 4 ++--
 drivers/usb/musb/mediatek.c         | 4 ++--
 drivers/usb/musb/mpfs.c             | 4 ++--
 drivers/usb/musb/tusb6010.c         | 2 +-
 drivers/usb/phy/phy-generic.c       | 9 ++++-----
 include/linux/usb/usb_phy_generic.h | 9 +++++----
 7 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_pci.c b/drivers/usb/chipidea/ci_hdrc_pci.c
index d63479e1ad10..63511ea30d6e 100644
--- a/drivers/usb/chipidea/ci_hdrc_pci.c
+++ b/drivers/usb/chipidea/ci_hdrc_pci.c
@@ -20,7 +20,7 @@
 
 struct ci_hdrc_pci {
 	struct platform_device	*ci;
-	struct platform_device	*phy;
+	struct faux_device	*phy;
 };
 
 /******************************************************************************
diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
index f3a1e4232a31..8cb50620aa55 100644
--- a/drivers/usb/dwc2/pci.c
+++ b/drivers/usb/dwc2/pci.c
@@ -30,7 +30,7 @@ static const char dwc2_driver_name[] = "dwc2-pci";
 
 struct dwc2_pci_glue {
 	struct platform_device *dwc2;
-	struct platform_device *phy;
+	struct faux_device *phy;
 };
 
 /**
@@ -53,7 +53,7 @@ static int dwc2_pci_probe(struct pci_dev *pci,
 {
 	struct resource		res[2];
 	struct platform_device	*dwc2;
-	struct platform_device	*phy;
+	struct faux_device	*phy;
 	int			ret;
 	struct device		*dev = &pci->dev;
 	struct dwc2_pci_glue	*glue;
diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index aa988d74b58d..995bab88506a 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -43,7 +43,7 @@ struct mtk_glue {
 	struct device *dev;
 	struct musb *musb;
 	struct platform_device *musb_pdev;
-	struct platform_device *usb_phy;
+	struct faux_device *usb_phy;
 	struct phy *phy;
 	struct usb_phy *xceiv;
 	enum phy_mode phy_mode;
@@ -507,7 +507,7 @@ static int mtk_musb_probe(struct platform_device *pdev)
 static void mtk_musb_remove(struct platform_device *pdev)
 {
 	struct mtk_glue *glue = platform_get_drvdata(pdev);
-	struct platform_device *usb_phy = glue->usb_phy;
+	struct faux_device *usb_phy = glue->usb_phy;
 
 	platform_device_unregister(glue->musb_pdev);
 	usb_phy_generic_unregister(usb_phy);
diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 7edc8429b274..ef20794aee12 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -25,7 +25,7 @@
 struct mpfs_glue {
 	struct device *dev;
 	struct platform_device *musb;
-	struct platform_device *phy;
+	struct faux_device *phy;
 	struct clk *clk;
 };
 
@@ -356,7 +356,7 @@ static void mpfs_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(glue->clk);
 	platform_device_unregister(glue->musb);
-	usb_phy_generic_unregister(pdev);
+	usb_phy_generic_unregister(glue->phy);
 }
 
 #ifdef CONFIG_OF
diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index 90b760a95e4e..92609f9d20ff 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -32,7 +32,7 @@
 struct tusb6010_glue {
 	struct device		*dev;
 	struct platform_device	*musb;
-	struct platform_device	*phy;
+	struct faux_device	*phy;
 	struct gpio_desc	*enable;
 	struct gpio_desc	*intpin;
 };
diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index 6c3ececf9137..a6cece75d0f8 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -30,16 +30,15 @@
 	(IRQF_SHARED | IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | \
 		IRQF_ONESHOT)
 
-struct platform_device *usb_phy_generic_register(void)
+struct faux_device *usb_phy_generic_register(void)
 {
-	return platform_device_register_simple("usb_phy_generic",
-			PLATFORM_DEVID_AUTO, NULL, 0);
+	return faux_device_create("usb_phy_generic", NULL);
 }
 EXPORT_SYMBOL_GPL(usb_phy_generic_register);
 
-void usb_phy_generic_unregister(struct platform_device *pdev)
+void usb_phy_generic_unregister(struct faux_device *fdev)
 {
-	platform_device_unregister(pdev);
+	faux_device_destroy(fdev);
 }
 EXPORT_SYMBOL_GPL(usb_phy_generic_unregister);
 
diff --git a/include/linux/usb/usb_phy_generic.h b/include/linux/usb/usb_phy_generic.h
index cd9e70a552a0..856db2bacc07 100644
--- a/include/linux/usb/usb_phy_generic.h
+++ b/include/linux/usb/usb_phy_generic.h
@@ -3,18 +3,19 @@
 #define __LINUX_USB_NOP_XCEIV_H
 
 #include <linux/usb/otg.h>
+#include <linux/device/faux.h>
 
 #if IS_ENABLED(CONFIG_NOP_USB_XCEIV)
 /* sometimes transceivers are accessed only through e.g. ULPI */
-extern struct platform_device *usb_phy_generic_register(void);
-extern void usb_phy_generic_unregister(struct platform_device *);
+struct faux_device *usb_phy_generic_register(void);
+void usb_phy_generic_unregister(struct faux_device *);
 #else
-static inline struct platform_device *usb_phy_generic_register(void)
+static inline struct faux_device *usb_phy_generic_register(void)
 {
 	return NULL;
 }
 
-static inline void usb_phy_generic_unregister(struct platform_device *pdev)
+static inline void usb_phy_generic_unregister(struct faux_device *fdev)
 {
 }
 #endif
-- 
2.48.1


