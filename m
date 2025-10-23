Return-Path: <linux-usb+bounces-29555-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AD7BFF36D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 07:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E58663A6684
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 05:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51412263F36;
	Thu, 23 Oct 2025 05:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AISQZYu/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC120264F9F
	for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 05:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761195842; cv=none; b=Q18Uwtn0jHBYVljHcqgPfKn2B5agFPTvcpJ0IfwofnFT+s4b1ASBZsOP8tahzv/1fFr3OhSuM+ZyhpwknasGPQNxOSY2dGHq3mmkAZOE5ayej2U5M0negjObrbN3f67GxM4Ik1trILes8P+WFWC/XhF+xOzMcQbXD8WAlR62ycE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761195842; c=relaxed/simple;
	bh=L/s/luCaxmMRCw+WMHb1cLsGil/wz9YD/S2zAqNAKX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bs2s6S4Vm91tv4+C2B9mfNLsH3DcWU52d8afBzrPXqoWhXZ7Q9G4n1dhrPKfNo4+HNZi0JuiWtSY7uB9I/oHF6yQS1rTVBiZLqGBWa74Ag69OMYcyeSfAgIp8gCceqelNPMUtKWE1SYpk5m+IFubJGublcJ/y89gdX/6LKN+1Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AISQZYu/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90AA1C4CEE7;
	Thu, 23 Oct 2025 05:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761195842;
	bh=L/s/luCaxmMRCw+WMHb1cLsGil/wz9YD/S2zAqNAKX0=;
	h=From:To:Cc:Subject:Date:From;
	b=AISQZYu/C1zqt+X+VKVpAT25nLAp/qt7k3Z4dgfDJUrzWtZ5+LTqS4Y9XzrtTPqda
	 E0vqNNI2Ef3Y5oDMMSr+HxFcekFQEkDse0PXMLnbPi/khuoI4njvSIy0TeD6Rpfsax
	 qPrNkkPkUkwm5GwmmdwgKlgwKyr55EV/HeIc4OfZ0JYkU1tCGLdS3WEet+NoqXQZTd
	 wrUKDvkLlP7EqXmBGDg1cuF4hiWXF+QsnR+IgnZ+1ThIZxHZ3Kt1ZC2wwctrC69U5R
	 oqoPDDDi2Auc3pWdno15jbtWobkis0veUQnrgWHS/IeQRdK2zIEPPan+QB93qlbl5k
	 TGmgkegjk4VsQ==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com,
	andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	Sanath.S@amd.com,
	linux-usb@vger.kernel.org
Subject: [PATCH] thunderbolt: Reset NHI during S4 restore_noirq() callback
Date: Thu, 23 Oct 2025 00:03:26 -0500
Message-ID: <20251023050354.115015-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a machine is restored from S4 if the firmware CM has created
tunnels there can be an incongruity of expectation from the kernel
when compared to booting from S5.

For example this incongruity can lead to problems like the display
not working properly if the firmware CM didn't turn it on pre-OS
but the OS had it on before entering S4.

Add an extra restore_noirq() callback to explicitly reset the NHI
before running the rest of the resume sequence.  This will allow
the standard discovery and probing routines to run and create the
tunnels as expected.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
Cc: Sanath.S@amd.com
---
 drivers/thunderbolt/nhi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 5f63f9b9cf405..042d184637a93 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -51,6 +51,8 @@ static bool host_reset = true;
 module_param(host_reset, bool, 0444);
 MODULE_PARM_DESC(host_reset, "reset USB4 host router (default: true)");
 
+static void nhi_reset(struct tb_nhi *nhi);
+
 static int ring_interrupt_index(const struct tb_ring *ring)
 {
 	int bit = ring->hop;
@@ -1077,6 +1079,17 @@ static int nhi_resume_noirq(struct device *dev)
 	return tb_domain_resume_noirq(tb);
 }
 
+static int nhi_restore_noirq(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb_nhi *nhi = tb->nhi;
+
+	nhi_reset(nhi);
+
+	return nhi_resume_noirq(dev);
+}
+
 static int nhi_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -1449,7 +1462,7 @@ static const struct dev_pm_ops nhi_pm_ops = {
 					    * pci-tunnels stay alive.
 					    */
 	.thaw_noirq = nhi_thaw_noirq,
-	.restore_noirq = nhi_resume_noirq,
+	.restore_noirq = nhi_restore_noirq,
 	.suspend = nhi_suspend,
 	.poweroff_noirq = nhi_poweroff_noirq,
 	.poweroff = nhi_suspend,
-- 
2.43.0


