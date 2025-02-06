Return-Path: <linux-usb+bounces-20272-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C767A2AF24
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 18:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09A5F162D2C
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 17:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A701A00FA;
	Thu,  6 Feb 2025 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="U2pXIE9o"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234EE18D634;
	Thu,  6 Feb 2025 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863541; cv=none; b=GUU+gjGToNAdbdZKutYy43gQiET3VWnR8K9naOHkNfaMSpuqYpMrb5OIcm7/M6iqijvoJXDBfNUzRD9EFtdVChXA+zkctLAyaTxMryWcEauC3ZBD8x18nmWNp4vSc53swIwT3Ll4u4COU+kTgf4MEULa/hwR7naHOVs4cQ14EW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863541; c=relaxed/simple;
	bh=9QmCo1G84X1vZbeBiTVfBzjgYCxTZDPjtxuxsMu2KD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPSGUMA0ERM1wbbB/6ZgAxIlwHxvWVmT9DWijqrKUv7CQhbAVLkR6yCCAprPhST4Lw0CSagYg1GSotgjLpQ1zMiYSu/isdS5XYmLQxmX+RQLuDfeb5nYY05jMd0ptI3gu3wdaj+wuiW+hLdyCp2Uoy0e7gk5fixjuCcQdE56wJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=U2pXIE9o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02394C4CEDD;
	Thu,  6 Feb 2025 17:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738863540;
	bh=9QmCo1G84X1vZbeBiTVfBzjgYCxTZDPjtxuxsMu2KD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U2pXIE9oYKSZSzS5aaEd/FrlO1piuNQ12EdRp2nLxkSfXYYoMPnUA0MnzpkVwpC5W
	 HDOYAxT45o3lCipdn+Bt+l92ZJQiw1wJbkralZvdyMEkrIqsbDCLLO4CuXIfb8EPkG
	 qPZlMq1//KgyQA9DW40vAOJ8pj3piZ9qelJhhiyw=
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
	rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/8] drm/vgem/vgem_drv convert to use faux_device
Date: Thu,  6 Feb 2025 18:38:21 +0100
Message-ID: <2025020625-corsage-undertow-765c@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020620-skedaddle-olympics-1735@gregkh>
References: <2025020620-skedaddle-olympics-1735@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 105
X-Developer-Signature: v=1; a=openpgp-sha256; l=3368; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=9QmCo1G84X1vZbeBiTVfBzjgYCxTZDPjtxuxsMu2KD4=; b=owGbwMvMwCRo6H6F97bub03G02pJDOlLPk98x72R9cfd6DMMHcfYKmapLrV4WJPa0BrQ1iGR1 P1457ykjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZiIznmG+bl38pqrPLkvv5qz 0faUpLjaZ4cXcxgW9Hx/lp9jJXFtx6zQFKNdbGl+zn9nAwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The vgem driver does not need to create a platform device, as there is
no real platform resources associated it,  it only did so because it was
simple to do that in order to get a device to use for resource
management of drm resources.  Change the driver to use the faux device
instead as this is NOT a real platform device.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 v3: new patch in the series.  For an example of the api working, does
     not have to be merged at this time, but I can take it if the
     maintainers give an ack.
 drivers/gpu/drm/vgem/vgem_drv.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 2752ab4f1c97..2a50c0b76fac 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -32,7 +32,7 @@
 
 #include <linux/dma-buf.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/device/faux.h>
 #include <linux/shmem_fs.h>
 #include <linux/vmalloc.h>
 
@@ -52,7 +52,7 @@
 
 static struct vgem_device {
 	struct drm_device drm;
-	struct platform_device *platform;
+	struct faux_device *faux_dev;
 } *vgem_device;
 
 static int vgem_open(struct drm_device *dev, struct drm_file *file)
@@ -127,27 +127,27 @@ static const struct drm_driver vgem_driver = {
 static int __init vgem_init(void)
 {
 	int ret;
-	struct platform_device *pdev;
+	struct faux_device *fdev;
 
-	pdev = platform_device_register_simple("vgem", -1, NULL, 0);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
+	fdev = faux_device_create("vgem", NULL);
+	if (!fdev)
+		return -ENODEV;
 
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
+	if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
 		ret = -ENOMEM;
 		goto out_unregister;
 	}
 
-	dma_coerce_mask_and_coherent(&pdev->dev,
+	dma_coerce_mask_and_coherent(&fdev->dev,
 				     DMA_BIT_MASK(64));
 
-	vgem_device = devm_drm_dev_alloc(&pdev->dev, &vgem_driver,
+	vgem_device = devm_drm_dev_alloc(&fdev->dev, &vgem_driver,
 					 struct vgem_device, drm);
 	if (IS_ERR(vgem_device)) {
 		ret = PTR_ERR(vgem_device);
 		goto out_devres;
 	}
-	vgem_device->platform = pdev;
+	vgem_device->faux_dev = fdev;
 
 	/* Final step: expose the device/driver to userspace */
 	ret = drm_dev_register(&vgem_device->drm, 0);
@@ -157,19 +157,19 @@ static int __init vgem_init(void)
 	return 0;
 
 out_devres:
-	devres_release_group(&pdev->dev, NULL);
+	devres_release_group(&fdev->dev, NULL);
 out_unregister:
-	platform_device_unregister(pdev);
+	faux_device_destroy(fdev);
 	return ret;
 }
 
 static void __exit vgem_exit(void)
 {
-	struct platform_device *pdev = vgem_device->platform;
+	struct faux_device *fdev = vgem_device->faux_dev;
 
 	drm_dev_unregister(&vgem_device->drm);
-	devres_release_group(&pdev->dev, NULL);
-	platform_device_unregister(pdev);
+	devres_release_group(&fdev->dev, NULL);
+	faux_device_destroy(fdev);
 }
 
 module_init(vgem_init);
-- 
2.48.1


