Return-Path: <linux-usb+bounces-24579-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ACAAD16A2
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 04:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B11827A4C69
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 02:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2901632CA;
	Mon,  9 Jun 2025 02:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUW+xNSE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D097E1FC3
	for <linux-usb@vger.kernel.org>; Mon,  9 Jun 2025 02:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749434685; cv=none; b=hCWt7Px+Z/R3tHHR6oaDI8K4pZDJaQHCK9QjAKtpWlSRYYOy6BBMGAGYC0DOiJuprHh2yrMJF8+SAJnhV57QDo6xJDbx0iCdeJ6fNHf11JqsglWXz+QGw7roTycP84/1php9hTH5tw94wg0RwkZf74LWKtZ46deU7j/ouTSB6zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749434685; c=relaxed/simple;
	bh=7WVuodyZ5BrXapq7IQkpFS6XgDOSKnupdzqrB1floYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F63mHyVvTCJs50o/OSAAw8UUihi39vXhZgHKWIuWLDBb2Vm6fDCeokbl0z3se9EiHATh6qP9tR4oZFFscs4kLSaRHPAQtKT45MFLjKGHpcGUi/OHEmQALr60LyjCXFHqXup3aPTrOfJw3Ne2si+4hLf/e8fVOFg/EOfegvib2IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUW+xNSE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC6AC4CEEE;
	Mon,  9 Jun 2025 02:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749434685;
	bh=7WVuodyZ5BrXapq7IQkpFS6XgDOSKnupdzqrB1floYs=;
	h=From:To:Cc:Subject:Date:From;
	b=FUW+xNSEyFJzpYbCbi16RDOgWuR0t8THvY5PEyqEAt8BBYylEboTQ5hdTTRsIyq0i
	 M+fCtKr9jcYjutlJwZx2CnT6ROyOr34+ai6NkkmpvZWvbyw7ITT7QTwefBwS4A1xmC
	 0IX1mIEH/6hpsgVWI7CnMe/Wb0IJiJxM+kAfXqXwoYlSAZdX0oJyhxhPNP3+ri/LXq
	 86OypFiqODAOF2c9z6b5PtDWOEpdO3B6f2CadzobUvIrSNeq6QNw62ThZragMAdtRr
	 W1G3GP1F5FBQxXXzT4Rd6VFi8JF+N3XaSh0PXgISrOrgLKxqhQCa13RhE5sw00YXeR
	 yllyluihuOLkA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com
Cc: linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 1/4] PCI: Don't show errors on inaccessible PCI devices
Date: Sun,  8 Jun 2025 21:04:33 -0500
Message-ID: <20250609020434.287559-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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

As the device is already gone and the PCI core is cleaning up there isn't
really any reason to show error messages to the user about failing to
change power states. Detect the error state and skip the messaging.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e9448d55113bd..7b0b4087da4d3 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1376,8 +1376,9 @@ int pci_power_up(struct pci_dev *dev)
 
 	pci_read_config_word(dev, dev->pm_cap + PCI_PM_CTRL, &pmcsr);
 	if (PCI_POSSIBLE_ERROR(pmcsr)) {
-		pci_err(dev, "Unable to change power state from %s to D0, device inaccessible\n",
-			pci_power_name(dev->current_state));
+		if (dev->error_state != pci_channel_io_perm_failure)
+			pci_err(dev, "Unable to change power state from %s to D0, device inaccessible\n",
+				pci_power_name(dev->current_state));
 		dev->current_state = PCI_D3cold;
 		return -EIO;
 	}
-- 
2.43.0


