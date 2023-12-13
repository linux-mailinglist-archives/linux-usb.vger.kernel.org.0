Return-Path: <linux-usb+bounces-4133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC1C8119DE
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B97CD1C204F7
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB3439FCE;
	Wed, 13 Dec 2023 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lR9U58Vg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2574351C38
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F23DC433C8;
	Wed, 13 Dec 2023 16:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485797;
	bh=Y4wityMNU6LBHUMAjlj0BBIjoaSI0QhZKsDFgQ7pmJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lR9U58Vg+LkVgGuHADI7IfXco/pwo/wpHAau0NJYGRG2oRSpP3tPb2jxX4DL4q9sP
	 P7ad5N3mM4WSmMdUwRjTEroGTePdFnt/6Vr6Y1wP1UOWgCaA9pMWYvloiXL0W3hH6R
	 LtddHquHWTb971SACHCbhVcjBduO7gjIxTU6ou3K/11BFCSMiPDeSyme577N5rULG9
	 prCubnu+81tc4+GC0WVGacIWCGsugatzjSzPO3ehNhm337cTEq+hdyhm4recK3g/TZ
	 B2uuSsZDxHWl9VVmdUg4NO7eMJJus13D5ylcEvu6VOtYenfnj1rf6ifqV6mrLfY2rR
	 sFVxedNg2aPqQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Hema HK <hemahk@ti.com>
Subject: [PATCH 11/12] usb: phy: twl6030: Remove snprintf() from sysfs call-backs and replace with sysfs_emit()
Date: Wed, 13 Dec 2023 16:42:40 +0000
Message-ID: <20231213164246.1021885-12-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213164246.1021885-1-lee@kernel.org>
References: <20231213164246.1021885-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since snprintf() has the documented, but still rather strange trait of
returning the length of the data that *would have been* written to the
array if space were available, rather than the arguably more useful
length of data *actually* written, it is usually considered wise to use
something else instead in order to avoid confusion.

In the case of sysfs call-backs, new wrappers exist that do just that.

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Cc: Hema HK <hemahk@ti.com>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/phy/phy-twl6030-usb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index c3ce6b1054f1c..da09cff55abce 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -179,16 +179,16 @@ static ssize_t vbus_show(struct device *dev,
 
 	switch (twl->linkstat) {
 	case MUSB_VBUS_VALID:
-	       ret = snprintf(buf, PAGE_SIZE, "vbus\n");
+	       ret = sysfs_emit(buf, "vbus\n");
 	       break;
 	case MUSB_ID_GROUND:
-	       ret = snprintf(buf, PAGE_SIZE, "id\n");
+	       ret = sysfs_emit(buf, "id\n");
 	       break;
 	case MUSB_VBUS_OFF:
-	       ret = snprintf(buf, PAGE_SIZE, "none\n");
+	       ret = sysfs_emit(buf, "none\n");
 	       break;
 	default:
-	       ret = snprintf(buf, PAGE_SIZE, "UNKNOWN\n");
+	       ret = sysfs_emit(buf, "UNKNOWN\n");
 	}
 	spin_unlock_irqrestore(&twl->lock, flags);
 
-- 
2.43.0.472.g3155946c3a-goog


