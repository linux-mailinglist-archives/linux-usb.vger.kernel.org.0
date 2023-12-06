Return-Path: <linux-usb+bounces-3782-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A87B806FEE
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 13:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12D00281C0D
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 12:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA6E35F1F;
	Wed,  6 Dec 2023 12:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mionK04X"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B336AFF
	for <linux-usb@vger.kernel.org>; Wed,  6 Dec 2023 12:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFDAC433C8;
	Wed,  6 Dec 2023 12:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701866314;
	bh=Fj8YObxpZ6Ytr5jvxIskxu3K4FrlW7trloaLma4Dwnk=;
	h=From:To:Cc:Subject:Date:From;
	b=mionK04XCoEyEbBjHqMndI2zOeorIQi2PMaZFCfIo1mYYyTlEIjRFDvbm3WWSK6Xz
	 4eERufRZbWwPsaT6F4LrEyr2EDrhWuWZF5+5kY6h5giUmxKs9+SkCP1/IyCcWcYR2o
	 7j/NMF2pooxe3dXERIgj+q2lIdPdvinvaiCnKTbiUyxTjWgTzuLkW6f6cywtP6TmE5
	 z5AUmRMUchiUjN/DJtgrhCwBFirUd5/NfEjwSlhle6TNHBXP4Oe0Wr36LTxabi1g9+
	 3Hq777JBeb/p7i6kLflFKGmq3fgUIwKhWhOgOU3ZykK10t9oUwh4jGbLJn4b8BnK1r
	 EGArkXXZ0E0Uw==
From: Arnd Bergmann <arnd@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: nb7vpq904m: add CONFIG_OF dependency
Date: Wed,  6 Dec 2023 13:38:14 +0100
Message-Id: <20231206123828.587065-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

DRM_AUX_BRIDGE depends on CONFIG_OF, so the same dependency is needed
here to avoid a build failure:

WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
  Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
  Selected by [y]:
  - TYPEC_MUX_NB7VPQ904M [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_register':
aux-bridge.c:(.text+0x13b): undefined reference to `auxiliary_device_init'
x86_64-linux-ld: aux-bridge.c:(.text+0x14d): undefined reference to `__auxiliary_device_add'
x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_init':
aux-bridge.c:(.init.text+0x15): undefined reference to `__auxiliary_driver_register'
x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_exit':
aux-bridge.c:(.exit.text+0x9): undefined reference to `auxiliary_driver_unregister'

Fixes: c5d296bad640 ("usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/typec/mux/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index 5120942f309d..818624f59120 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -40,6 +40,7 @@ config TYPEC_MUX_NB7VPQ904M
 	tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
 	depends on I2C
 	depends on DRM || DRM=n
+	depends on OF
 	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	select REGMAP_I2C
 	help
-- 
2.39.2


