Return-Path: <linux-usb+bounces-2573-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 474477E1F69
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 12:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02FD7281588
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 11:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D19199B7;
	Mon,  6 Nov 2023 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="peZFJ2Cx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9269418B0C
	for <linux-usb@vger.kernel.org>; Mon,  6 Nov 2023 11:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30902C433C9;
	Mon,  6 Nov 2023 11:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699268806;
	bh=q/xLTHFuLYcmp6NtzuTCC0cv7q+YbosYhXcrvfEUmDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=peZFJ2Cx2PvFGctJiv0cWGJ08qUNymKNlkYLTLpkqoXiArTcIJNUYJI/EsGt4IR01
	 oVbC/gxtOuvLRFsV84BwdE0vMOvIStwpjxcap9A9CEZyXON5ey4A+g2lWQF7Xb7zt9
	 co1rbZNvoMLWQfunW+U5dM7fYiX7BsYsIIDllUtYP81863crCx+9kg2x/VHNBtNhsE
	 0BxKDuV10vrHoLHrMOv9PnB8Xjc7BX4UJzqExtfzKAHRB4S4anQEQDEtoY62wAHDbT
	 kI28FsWsByAt4gXXw0h7CJ6/cf35jLKQVe2e+SXU9ltrVNfd1tNWH5SOP6KIvH2Vqm
	 URkZ50dMEpVQw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qzxS7-00085v-2e;
	Mon, 06 Nov 2023 12:07:31 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] Revert "usb: phy: add usb phy notify port status API"
Date: Mon,  6 Nov 2023 12:06:54 +0100
Message-ID: <20231106110654.31090-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110654.31090-1-johan+linaro@kernel.org>
References: <20231106110654.31090-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit a08799cf17c22375752abfad3b4a2b34b3acb287.

The recently added Realtek PHY drivers depend on the new port status
notification mechanism which was built on the deprecated USB PHY
implementation and devicetree binding.

Specifically, using these PHYs would require describing the very same
PHY using both the generic "phy" property and the deprecated "usb-phy"
property which is clearly wrong.

We should not be building new functionality on top of the legacy USB PHY
implementation even if it is currently stuck in some kind of
transitional limbo.

Revert the new notification interface which is broken by design.

Fixes: a08799cf17c2 ("usb: phy: add usb phy notify port status API")
Cc: stable@vger.kernel.org      # 6.6
Cc: Stanley Chang <stanley_chang@realtek.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/usb/core/hub.c  | 23 -----------------------
 include/linux/usb/phy.h | 13 -------------
 2 files changed, 36 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0ff47eeffb49..dfc30cebd4c4 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -622,29 +622,6 @@ static int hub_ext_port_status(struct usb_hub *hub, int port1, int type,
 		ret = 0;
 	}
 	mutex_unlock(&hub->status_mutex);
-
-	/*
-	 * There is no need to lock status_mutex here, because status_mutex
-	 * protects hub->status, and the phy driver only checks the port
-	 * status without changing the status.
-	 */
-	if (!ret) {
-		struct usb_device *hdev = hub->hdev;
-
-		/*
-		 * Only roothub will be notified of port state changes,
-		 * since the USB PHY only cares about changes at the next
-		 * level.
-		 */
-		if (is_root_hub(hdev)) {
-			struct usb_hcd *hcd = bus_to_hcd(hdev->bus);
-
-			if (hcd->usb_phy)
-				usb_phy_notify_port_status(hcd->usb_phy,
-							   port1 - 1, *status, *change);
-		}
-	}
-
 	return ret;
 }
 
diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h
index b513749582d7..e4de6bc1f69b 100644
--- a/include/linux/usb/phy.h
+++ b/include/linux/usb/phy.h
@@ -144,10 +144,6 @@ struct usb_phy {
 	 */
 	int	(*set_wakeup)(struct usb_phy *x, bool enabled);
 
-	/* notify phy port status change */
-	int	(*notify_port_status)(struct usb_phy *x, int port,
-				      u16 portstatus, u16 portchange);
-
 	/* notify phy connect status change */
 	int	(*notify_connect)(struct usb_phy *x,
 			enum usb_device_speed speed);
@@ -320,15 +316,6 @@ usb_phy_set_wakeup(struct usb_phy *x, bool enabled)
 		return 0;
 }
 
-static inline int
-usb_phy_notify_port_status(struct usb_phy *x, int port, u16 portstatus, u16 portchange)
-{
-	if (x && x->notify_port_status)
-		return x->notify_port_status(x, port, portstatus, portchange);
-	else
-		return 0;
-}
-
 static inline int
 usb_phy_notify_connect(struct usb_phy *x, enum usb_device_speed speed)
 {
-- 
2.41.0


