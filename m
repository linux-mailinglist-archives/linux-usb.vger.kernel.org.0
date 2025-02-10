Return-Path: <linux-usb+bounces-20399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FFA2EC90
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 13:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3018718803F1
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 12:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA1C22FE1A;
	Mon, 10 Feb 2025 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vbDgmG3d"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650AC2248AD;
	Mon, 10 Feb 2025 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190671; cv=none; b=hH12Ml93aQJLLQI2cKw02RzAWLkq9b6VJ+Y3kEAhZQjRc9NajLtf0X9V/4XwsN1B8yaLXG7btphmM577U6EhnarQJuvaoA12OuPLpF+DAgqIn2z3FiBRWzx/qQv2GxGlegB7pGl3rg8NQU3IomX0NpqU6xRuHgU1dOs561hTfFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190671; c=relaxed/simple;
	bh=0USAtSGmpAY1fMq52clM2dXzbsYguzHIPgQpJuTkE0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Id1MEwpIbK9HDqr/pz6xjbqW/zqu47EXDlQFClSrgJsTdpnJw5/OzyBeP28mfGdH3ifiiw0gPu8WMYtvyXXKydaIEYBxh7VqIfBv8xp/br22RAly5GKOEBhJ2rctFBu3cLPq/nHIp0PaF0tr8Gvw5WK0GWaLNqmsyCx3HmpIL0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vbDgmG3d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EDDC4CED1;
	Mon, 10 Feb 2025 12:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739190670;
	bh=0USAtSGmpAY1fMq52clM2dXzbsYguzHIPgQpJuTkE0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vbDgmG3dmcgdFHSnCbChAIEK9WtiDb4v5+u7f6fqYLgTl9mQQsYCkD1sTKOBxoWCk
	 Wa4hKxnqqVLG5PwmmdYYvSC3eLXkcumw87u9s2M1pyMDvm3tnRwTC2vkS9CPVCSs79
	 +6zJR7E4TqfH3Ni5tW1rJJjfdHvMhQf4jYcrm5zo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
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
	rust-for-linux@vger.kernel.org,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 9/9] drm/vkms: convert to use faux_device
Date: Mon, 10 Feb 2025 13:30:33 +0100
Message-ID: <2025021029-snout-swivel-9a45@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025021023-sandstorm-precise-9f5d@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 133
X-Developer-Signature: v=1; a=openpgp-sha256; l=4371; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=0USAtSGmpAY1fMq52clM2dXzbsYguzHIPgQpJuTkE0w=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkrP6bO2LTdx0/GxIvnwdz4HN+Ja3iZj91nYlI/Hye0p O26zAmFjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjIu4sMC3plWbrv3rrodF5u 8Rshi4pUg5J/ggwLdpvOXrLk31u5spUnpmTa7DxzQ3f9RgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The vkms driver does not need to create a platform device, as there is
no real platform resources associated it,  it only did so because it was
simple to do that in order to get a device to use for resource
management of drm resources.  Change the driver to use the faux device
instead as this is NOT a real platform device.

Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v4: - api tweaked due to parent pointer added to faux_device create
      function.
    - fixed space I removed in the .h file
 v3: new patch in the series.  For an example of the api working, does
     not have to be merged at this time, but I can take it if the
     maintainers give an ack.

 drivers/gpu/drm/vkms/vkms_drv.c | 28 ++++++++++++++--------------
 drivers/gpu/drm/vkms/vkms_drv.h |  4 ++--
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e0409aba9349..b3fa0e7c7751 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -10,7 +10,7 @@
  */
 
 #include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/device/faux.h>
 #include <linux/dma-mapping.h>
 
 #include <drm/clients/drm_client_setup.h>
@@ -177,25 +177,25 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 static int vkms_create(struct vkms_config *config)
 {
 	int ret;
-	struct platform_device *pdev;
+	struct faux_device *fdev;
 	struct vkms_device *vkms_device;
 
-	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
+	fdev = faux_device_create(DRIVER_NAME, NULL, NULL);
+	if (!fdev)
+		return -ENODEV;
 
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
+	if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
 		ret = -ENOMEM;
 		goto out_unregister;
 	}
 
-	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
+	vkms_device = devm_drm_dev_alloc(&fdev->dev, &vkms_driver,
 					 struct vkms_device, drm);
 	if (IS_ERR(vkms_device)) {
 		ret = PTR_ERR(vkms_device);
 		goto out_devres;
 	}
-	vkms_device->platform = pdev;
+	vkms_device->faux_dev = fdev;
 	vkms_device->config = config;
 	config->dev = vkms_device;
 
@@ -229,9 +229,9 @@ static int vkms_create(struct vkms_config *config)
 	return 0;
 
 out_devres:
-	devres_release_group(&pdev->dev, NULL);
+	devres_release_group(&fdev->dev, NULL);
 out_unregister:
-	platform_device_unregister(pdev);
+	faux_device_destroy(fdev);
 	return ret;
 }
 
@@ -259,19 +259,19 @@ static int __init vkms_init(void)
 
 static void vkms_destroy(struct vkms_config *config)
 {
-	struct platform_device *pdev;
+	struct faux_device *fdev;
 
 	if (!config->dev) {
 		DRM_INFO("vkms_device is NULL.\n");
 		return;
 	}
 
-	pdev = config->dev->platform;
+	fdev = config->dev->faux_dev;
 
 	drm_dev_unregister(&config->dev->drm);
 	drm_atomic_helper_shutdown(&config->dev->drm);
-	devres_release_group(&pdev->dev, NULL);
-	platform_device_unregister(pdev);
+	devres_release_group(&fdev->dev, NULL);
+	faux_device_destroy(fdev);
 
 	config->dev = NULL;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 00541eff3d1b..f56af53856f7 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -209,13 +209,13 @@ struct vkms_config {
  * struct vkms_device - Description of a VKMS device
  *
  * @drm - Base device in DRM
- * @platform - Associated platform device
+ * @faux_dev - Associated faux device
  * @output - Configuration and sub-components of the VKMS device
  * @config: Configuration used in this VKMS device
  */
 struct vkms_device {
 	struct drm_device drm;
-	struct platform_device *platform;
+	struct faux_device *faux_dev;
 	struct vkms_output output;
 	const struct vkms_config *config;
 };
-- 
2.48.1


