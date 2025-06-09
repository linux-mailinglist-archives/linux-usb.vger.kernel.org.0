Return-Path: <linux-usb+bounces-24580-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DC0AD16A1
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 04:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1C223AA319
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 02:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11ABD1714C0;
	Mon,  9 Jun 2025 02:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1T6H3BW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDC382866
	for <linux-usb@vger.kernel.org>; Mon,  9 Jun 2025 02:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749434686; cv=none; b=mVq7j7lwd8EyafgCA7q1wnxk+H63p6eG4KHHbuXU23Xy2PSoNQE0lPsGjv1w/SB6iwozHzwrwPy0ttXeOsfZk5yjhPPV/sooPtbIUGd63w0SoHSMrB0HClsmONA7V+7H775wm6ZaZphZO5I972SJknhvPAZvNY8YmMdICsvvpeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749434686; c=relaxed/simple;
	bh=sODM0sgcTmf0q3pCfBBBQ3Z4sJiyGddOs7xRMPvE1xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQK6pvqt4mU/VyBeUxkMnUxGX4hPtYYbCgSDpVmMHeNJmYFUpVNRIUmFOgI4SyKYaGy9qrov7otrBzePdc9es681vX3kBLQTcFAm5XXArlNGDOfUgrlvnc+3mNjqHug3h8dRCR1qllfl6TInVf9+8LiyMRtkIrPoxN+ggrqW8O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1T6H3BW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D72C4CEF2;
	Mon,  9 Jun 2025 02:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749434686;
	bh=sODM0sgcTmf0q3pCfBBBQ3Z4sJiyGddOs7xRMPvE1xM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q1T6H3BWha5rXhmt42yovv2VHEqjMem8YyfBz6LJX6EeI++TM7I554gw2QW1q563i
	 tFsNT28RuKuDRTXxQZ8kUZ+CsOmVApc6LIkD4tdbIb18CwQsbn0QRDGszr6XkNvtY6
	 Lf6/5dtgw/lOF9IV8pxE6GF5CqWE3chKM9CFFf5Hvbby3TdYIC0bri/lF1QpTH96ks
	 mELkh1sRaScbo3puDbYTTZs5jmq6EZ0q5izXEodFMsE2lUgp5osQZbmiUICoH0YGK5
	 bljg3doqLrDVOn8wzd8XjEioZjPsDXHRK75+g15EU1SNbORC17V8lcOlYrc48qDPk9
	 FcxXcQvMpqKtw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com
Cc: linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 2/4] PCI: Fix runtime PM usage count underflow
Date: Sun,  8 Jun 2025 21:04:34 -0500
Message-ID: <20250609020434.287559-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609020434.287559-1-superm1@kernel.org>
References: <20250609020434.287559-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

When a USB4 dock is unplugged the PCIe bridge it's connected to will
remove issue a "Link Down" and "Card not detected event". The PCI core
will treat this as a surprise hotplug event and unconfigure all downstream
devices. This involves setting the device error state to
`pci_channel_io_perm_failure`.

When PCI core gets to the point that the device is removed using
pci_device_remove() the runtime count has already been decremented and
so calling pm_runtime_put_sync() will cause an underflow.

Detect the device is in the error state and skip the call for this cleanup
path.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/pci-driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 9f6e145d93d62..ab4cfdfc8fbc0 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -479,7 +479,8 @@ static void pci_device_remove(struct device *dev)
 	pci_iov_remove(pci_dev);
 
 	/* Undo the runtime PM settings in local_pci_probe() */
-	pm_runtime_put_sync(dev);
+	if (pci_dev->error_state != pci_channel_io_perm_failure)
+		pm_runtime_put_sync(dev);
 
 	/*
 	 * If the device is still on, set the power state as "unknown",
-- 
2.43.0


