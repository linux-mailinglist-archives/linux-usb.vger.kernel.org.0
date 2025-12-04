Return-Path: <linux-usb+bounces-31159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1E5CA32CE
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 11:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ECC730A1F0D
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 10:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EAE244186;
	Thu,  4 Dec 2025 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYPxcIy5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760F02BE632;
	Thu,  4 Dec 2025 10:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764843076; cv=none; b=jZZVbGRDa2aBHiDUdKd8iFmOPN8Cozgt0we1pnpQOTpy+Kdxrh0CvW0FQzLu2n8KOnvui71bRdkUYXmvAZieAKgcCZY5bA+QZ98roXwlf1caMory8zDfClhungxtQSsTgY3+Bol9/PVsmOi/LuXnZygRAJkIYTA/3BhWe/Qv9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764843076; c=relaxed/simple;
	bh=/rNYXlcT2wU0RzCKfgeqDVowIhLlWuIidOrwsO4A0Ms=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kgHfKcToMkfv/oSz4OXWTXZwjAtStw/gKTBdYf/BBhSjf90dmgQB8mcBEV6mPK9JSjQGw+SoMOCszk0lbIvWGk8Mx3DRiYDsity33zocKrCh0J+Uqkmdts/GzOaNw5JHOYCKouAzp+5eRoCHnWExjSRLLA+Uxe6xPK7qBThNnRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYPxcIy5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A8CC4CEFB;
	Thu,  4 Dec 2025 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764843076;
	bh=/rNYXlcT2wU0RzCKfgeqDVowIhLlWuIidOrwsO4A0Ms=;
	h=From:To:Cc:Subject:Date:From;
	b=HYPxcIy57As+kOUCANhEpLkdFwLn1+dUaBh5A0Rc1Ybz6EDgqX8Kp771KnGM8a6NU
	 gPf5Qf8PuHBgrSb67YE+F0zFjnqbCINyYmBSvytIClQkGMfnwCRqGfo+I8bSKOeo5c
	 9q5tKYyLdxbhrrNuxWHqQLxSsIA8xVKvhodHsw60hLzUJpiTtEXw100s+VaxF+u+Rr
	 0XxOZZRkclEcF/7iSZUS1NzQjVNvnwWtnduIE8IkG+jMgcr/gKRlxDvQPBcmIclQve
	 10loORn0PoyNwcx6MfEf3JYpAismtmw+2R4b37f73C10Un7ZqI6+qGF8ffzzHIRK8n
	 b5X6EQSqX6Rvw==
From: Arnd Bergmann <arnd@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Yue Haibing <yuehaibing@huawei.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: huawei-gaokin: add DRM dependency
Date: Thu,  4 Dec 2025 11:11:07 +0100
Message-Id: <20251204101111.1035975-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Selecting DRM_AUX_HPD_BRIDGE is not possible from a built-in driver when
CONFIG_DRM=m:

WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
  Depends on [m]: HAS_IOMEM [=y] && DRM [=m] && DRM_BRIDGE [=y] && OF [=y]
  Selected by [y]:
  - UCSI_HUAWEI_GAOKUN [=y] && USB_SUPPORT [=y] && TYPEC [=y] && TYPEC_UCSI [=y] && EC_HUAWEI_GAOKUN [=y] && DRM_BRIDGE [=y] && OF [=y]

Add the same dependency we have in similar drivers to work around this.

Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/typec/ucsi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 7fcb1e1de5d6..b812be4d0e67 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -96,6 +96,7 @@ config UCSI_LENOVO_YOGA_C630
 config UCSI_HUAWEI_GAOKUN
 	tristate "UCSI Interface Driver for Huawei Matebook E Go"
 	depends on EC_HUAWEI_GAOKUN
+	depends on DRM || !DRM
 	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	help
 	  This driver enables UCSI support on the Huawei Matebook E Go tablet,
-- 
2.39.5


