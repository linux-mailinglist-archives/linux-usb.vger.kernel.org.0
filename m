Return-Path: <linux-usb+bounces-31948-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B82B5CF6CAB
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 06:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4B0F302CF67
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 05:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603B33002A0;
	Tue,  6 Jan 2026 05:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tP5+OQig"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99342EBB8A;
	Tue,  6 Jan 2026 05:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767677877; cv=none; b=iwEFWvip8JemtKXloJKZMuGAWN/SzUBC+pi9lsUWsdguv6XlDLqsurehnFbc94TRnabLlHJCkIeFS4ep3xLg5g651YmABjhSMYVvQewQYndoHzFnIPDiqJQKULFGuRpM6GLE85wonrrWmkdaZ/rnFiLwuXxxFj5Zk+fty1BIQxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767677877; c=relaxed/simple;
	bh=sWWhfRYSMoqt45cCvZSc7NLfsTyPbmddi3yfWGgK1nI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRb2eS4R/rx0hUyj9BnsjKdNM/CDEsb/UswdH5jbcWhpgRZqesetj/lp0sIQLAKAdlV0rS2o7/AWPFiqarSnuAY/EACn1hoBmN23uSRrGyRVVCBF/PSL6l520yodJ/hMeVKCctI/1ImNLoQNc87zmiADvbY3e4izpnt5yIIfk5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tP5+OQig; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9E8C19423;
	Tue,  6 Jan 2026 05:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767677877;
	bh=sWWhfRYSMoqt45cCvZSc7NLfsTyPbmddi3yfWGgK1nI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tP5+OQigNQaMnF5Li8suXFqQPdLwvvkcFSKIqqaK+uT2Nv0Kf5Ta6DcerYrRqgOg/
	 /XboioqqS5/FWazP0QR0d6LzOcGPUdfA9GDR+snG/A5ia29mMERmNvW5MBaOHDQiA7
	 S77it5DcsY1drN/isCcWIC41WWvRTjpGyAeBBZ6VBxeEXhodK/jlNXaUB7SprAalmG
	 VF/oHBac6PcYNXbG5dlUUfhR4zWCjJlLTvOTRbXkg1LQBWDjFAXm1bJMJLE1qBDDUs
	 w5+aCkpAhFhxlIwrDxCLg27QDHC11F12PZYxKKgURNCMITfLPx950Ike15RtVobF9C
	 wU/SVmylqc8rg==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org (open list:THUNDERBOLT DRIVER),
	linux-kernel@vger.kernel.org,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v2 1/2] thunderbolt: Move nhi_reset before pmops declaration
Date: Mon,  5 Jan 2026 23:37:48 -0600
Message-ID: <20260106053749.61440-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106053749.61440-1-superm1@kernel.org>
References: <20260106053749.61440-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmops will be using nhi_reset for restore from S4. No intended
functional changes.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/thunderbolt/nhi.c | 62 +++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 6d0c9d37c55d8..ea2a5a06ee710 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -971,6 +971,37 @@ static irqreturn_t nhi_msi(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void nhi_reset(struct tb_nhi *nhi)
+{
+	ktime_t timeout;
+	u32 val;
+
+	val = ioread32(nhi->iobase + REG_CAPS);
+	/* Reset only v2 and later routers */
+	if (FIELD_GET(REG_CAPS_VERSION_MASK, val) < REG_CAPS_VERSION_2)
+		return;
+
+	if (!host_reset) {
+		dev_dbg(&nhi->pdev->dev, "skipping host router reset\n");
+		return;
+	}
+
+	iowrite32(REG_RESET_HRR, nhi->iobase + REG_RESET);
+	msleep(100);
+
+	timeout = ktime_add_ms(ktime_get(), 500);
+	do {
+		val = ioread32(nhi->iobase + REG_RESET);
+		if (!(val & REG_RESET_HRR)) {
+			dev_warn(&nhi->pdev->dev, "host router reset successful\n");
+			return;
+		}
+		usleep_range(10, 20);
+	} while (ktime_before(ktime_get(), timeout));
+
+	dev_warn(&nhi->pdev->dev, "timeout resetting host router\n");
+}
+
 static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -1231,37 +1262,6 @@ static void nhi_check_iommu(struct tb_nhi *nhi)
 		str_enabled_disabled(port_ok));
 }
 
-static void nhi_reset(struct tb_nhi *nhi)
-{
-	ktime_t timeout;
-	u32 val;
-
-	val = ioread32(nhi->iobase + REG_CAPS);
-	/* Reset only v2 and later routers */
-	if (FIELD_GET(REG_CAPS_VERSION_MASK, val) < REG_CAPS_VERSION_2)
-		return;
-
-	if (!host_reset) {
-		dev_dbg(&nhi->pdev->dev, "skipping host router reset\n");
-		return;
-	}
-
-	iowrite32(REG_RESET_HRR, nhi->iobase + REG_RESET);
-	msleep(100);
-
-	timeout = ktime_add_ms(ktime_get(), 500);
-	do {
-		val = ioread32(nhi->iobase + REG_RESET);
-		if (!(val & REG_RESET_HRR)) {
-			dev_warn(&nhi->pdev->dev, "host router reset successful\n");
-			return;
-		}
-		usleep_range(10, 20);
-	} while (ktime_before(ktime_get(), timeout));
-
-	dev_warn(&nhi->pdev->dev, "timeout resetting host router\n");
-}
-
 static int nhi_init_msi(struct tb_nhi *nhi)
 {
 	struct pci_dev *pdev = nhi->pdev;
-- 
2.43.0


