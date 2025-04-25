Return-Path: <linux-usb+bounces-23455-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B47E6A9C7A0
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 13:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51C1D7B8B6D
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 11:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EAF24337C;
	Fri, 25 Apr 2025 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hb3s3Ugk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C721B215771;
	Fri, 25 Apr 2025 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745580630; cv=none; b=Y6z7U7Ky3fCVw5Erocfjb5mpqdgPb0AMISV0laf5EKvMtEK4xeA5LZnZthGma5HNzPo/DmI859d+TObX588aW4aeT0PUMJFl+k3d35pGTDbS8RQbXH3kj97wiidVszuyboYx+pc0Sde51146hbHQBfyYhCt2mqtNwalySBxDMm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745580630; c=relaxed/simple;
	bh=gAkjS/MHRFj60cqeJdeolZ0LH0VXM49/mD6u1lGsthM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SzTLcWlU2rxqDSySrAnPsMPJkAiIyPel7vLqPlwDD1gUtkT9CZsrVGMyJG0H5MVT23ILdcCAjIioDpEMg/Alsts1u6SDReeMtBGSc5QnxfeVrF6gg+FYNiHOWgYHtmP9NeumbVF24rBZAYFFi9e3ycwnjucO/3iRLXL9ZAiJcIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hb3s3Ugk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599CAC4CEE9;
	Fri, 25 Apr 2025 11:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745580630;
	bh=gAkjS/MHRFj60cqeJdeolZ0LH0VXM49/mD6u1lGsthM=;
	h=From:To:Cc:Subject:Date:From;
	b=Hb3s3UgkT7r1pbLLrU9pJOgzhs9I0m9oYzTVdTjSV2XHARoyMazCoH3j/WHkFy9O/
	 vI0wXcfzu12ADVqR9Dli6VdNramVNVerUsujAUvXJlpFuIj57eZMPfGOqnbj2DCpbT
	 +/aQJQcJw8JyQWgeE5NnCqFluEHggaCcU46KrNLv1jx88NtvrDCC3V04bhnt3vJc55
	 nlL4msInXJQSphLunPC06WujcJ3E7KPUVok0pA5VUhzoHW9iMtS/RmrUzzvlF1qVS8
	 aJWaLaJpcCUgs2q30P5uUkapcuPuL6FlJJfDfUqvytAP1vXWFYEyFC589tuXujSWtI
	 /JliWz4kV1J4g==
From: Arnd Bergmann <arnd@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <lkp@intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Pavan Holla <pholla@chromium.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: add DRM_BRIDGE dependencies
Date: Fri, 25 Apr 2025 13:30:21 +0200
Message-Id: <20250425113025.1718145-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Selecting CONFIG_DRM_AUX_HPD_BRIDGE is not allowed when its dependencies
are not met:

WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
  Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && DRM_BRIDGE [=n] && OF [=n]
  Selected by [m]:
  - UCSI_HUAWEI_GAOKUN [=m] && USB_SUPPORT [=y] && TYPEC [=y] && TYPEC_UCSI [=m] && EC_HUAWEI_GAOKUN [=m]

ERROR: modpost: "drm_bridge_hpd_notify" [drivers/gpu/drm/bridge/aux-hpd-bridge.ko] undefined!
ERROR: modpost: "devm_drm_bridge_add" [drivers/gpu/drm/bridge/aux-hpd-bridge.ko] undefined!

Add the same dependencies for the new UCSI_HUAWEI_GAOKUN driver to ensure
it always builds cleanly.

Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504140319.dgpbDOJZ-lkp@intel.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/typec/ucsi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index e94956d27325..bdabae71b4ac 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -94,6 +94,7 @@ config UCSI_LENOVO_YOGA_C630
 config UCSI_HUAWEI_GAOKUN
 	tristate "UCSI Interface Driver for Huawei Matebook E Go"
 	depends on EC_HUAWEI_GAOKUN
+	depends on DRM_BRIDGE && OF
 	select DRM_AUX_HPD_BRIDGE
 	help
 	  This driver enables UCSI support on the Huawei Matebook E Go tablet,
-- 
2.39.5


