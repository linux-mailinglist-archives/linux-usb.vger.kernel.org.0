Return-Path: <linux-usb+bounces-5573-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D734D83F72A
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jan 2024 17:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E86A1F25032
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jan 2024 16:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903606280B;
	Sun, 28 Jan 2024 16:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Urj4Ef5K"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125A9627F7;
	Sun, 28 Jan 2024 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706458423; cv=none; b=VvbuTm4UI1tdi6OXchoEIAX+Dkg1C+YzgFib5RbPWOEg0KRtTioxSc0Kfhmt248bc8jQUtYn2UQB1X013a2/dEHIzEIAdNq65dkZEJIhCdjEXfaLG9eVX4I8qIJwwYJYUNXUjY9MipM+k4NrL9GDpETZZ2gLAO6p5juVvaI/UWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706458423; c=relaxed/simple;
	bh=ix8XBCGUm23P7dIAwb+lQE/fHDfnA07Y2g69GvMJYpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxDhBriI2A82YcUrSkwWdjeopGI1zWe8la+wRhoZcZ1R4GSlgTc/Qse/NdmyiXdWPdtjNycJWOh3DxuxwK2TKUVTSUH62iVo88Kqw8GEAVWij+XQ5m8RG63E59icD4iltiiS91bv2we/fYuj+rCweLmcel35TC7NrOVMMfKzpEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Urj4Ef5K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FD8C43390;
	Sun, 28 Jan 2024 16:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706458422;
	bh=ix8XBCGUm23P7dIAwb+lQE/fHDfnA07Y2g69GvMJYpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Urj4Ef5KdLmM6yfFgBcckoI+s3dRkr66sDPdGdpludSqIBWc5xmMfPON788ElTnw5
	 mTZ4c+JPsjzbPlTrl6W39oBJhUua1tsxXIypgGxi/XmwhN5jiovKhARl7P66I1Ety3
	 NTNmO+wTcUhH7c90zJFeIVPMhgCMfwwiIgALKRYXEJz99K4ZWP/txpV1OjfxSCRlgP
	 dfK0N0/A6vhF+ue7+1D8TkiloRPLFzBMdkaaKLGfEinOD1MFFB8uyboXruquWJO7HQ
	 LrlqGr/qG6ItR6axNnBq8ZlgkKEkBVTIYfXfIggxmtQ6fMUkkN7XUFHJc+St+g9GZh
	 x+tceQOzqzWUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	mathias.nyman@intel.com,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 16/31] usb: xhci-plat: fix usb disconnect issue after s4
Date: Sun, 28 Jan 2024 11:12:46 -0500
Message-ID: <20240128161315.201999-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128161315.201999-1-sashal@kernel.org>
References: <20240128161315.201999-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.14
Content-Transfer-Encoding: 8bit

From: Yinbo Zhu <zhuyinbo@loongson.cn>

[ Upstream commit 6d6887c42e946f43bed2e64571a40c8476a1e4a9 ]

The xhci retaining bogus hardware states cause usb disconnect devices
connected before hibernation(s4) and refer to the commit 'f3d478858be
("usb: ohci-platform: fix usb disconnect issue after s4")' which set
flag "hibernated" as true when resume-from-hibernation and that the
drivers will reset the hardware to get rid of any existing state and
make sure resume from hibernation re-enumerates everything for xhci.

Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
Link: https://lore.kernel.org/r/20231228071113.1719-1-zhuyinbo@loongson.cn
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/host/xhci-plat.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 732cdeb73920..f0853c4478f5 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -433,7 +433,7 @@ void xhci_plat_remove(struct platform_device *dev)
 }
 EXPORT_SYMBOL_GPL(xhci_plat_remove);
 
-static int __maybe_unused xhci_plat_suspend(struct device *dev)
+static int xhci_plat_suspend(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -461,7 +461,7 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused xhci_plat_resume(struct device *dev)
+static int xhci_plat_resume_common(struct device *dev, struct pm_message pmsg)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -483,7 +483,7 @@ static int __maybe_unused xhci_plat_resume(struct device *dev)
 	if (ret)
 		goto disable_clks;
 
-	ret = xhci_resume(xhci, PMSG_RESUME);
+	ret = xhci_resume(xhci, pmsg);
 	if (ret)
 		goto disable_clks;
 
@@ -502,6 +502,16 @@ static int __maybe_unused xhci_plat_resume(struct device *dev)
 	return ret;
 }
 
+static int xhci_plat_resume(struct device *dev)
+{
+	return xhci_plat_resume_common(dev, PMSG_RESUME);
+}
+
+static int xhci_plat_restore(struct device *dev)
+{
+	return xhci_plat_resume_common(dev, PMSG_RESTORE);
+}
+
 static int __maybe_unused xhci_plat_runtime_suspend(struct device *dev)
 {
 	struct usb_hcd  *hcd = dev_get_drvdata(dev);
@@ -524,7 +534,12 @@ static int __maybe_unused xhci_plat_runtime_resume(struct device *dev)
 }
 
 const struct dev_pm_ops xhci_plat_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(xhci_plat_suspend, xhci_plat_resume)
+	.suspend = pm_sleep_ptr(xhci_plat_suspend),
+	.resume = pm_sleep_ptr(xhci_plat_resume),
+	.freeze = pm_sleep_ptr(xhci_plat_suspend),
+	.thaw = pm_sleep_ptr(xhci_plat_resume),
+	.poweroff = pm_sleep_ptr(xhci_plat_suspend),
+	.restore = pm_sleep_ptr(xhci_plat_restore),
 
 	SET_RUNTIME_PM_OPS(xhci_plat_runtime_suspend,
 			   xhci_plat_runtime_resume,
-- 
2.43.0


