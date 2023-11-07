Return-Path: <linux-usb+bounces-2642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 906C77E4CBE
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 00:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31AC0B21084
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 23:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B9330358;
	Tue,  7 Nov 2023 23:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COz9cd6U"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11703066F
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 23:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652BCC433C7;
	Tue,  7 Nov 2023 23:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699399372;
	bh=T+VF2SfYqdlsFE0o5OEbuT79GlyXUHL7Mt9mzqFNmuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=COz9cd6UwFwzM80mj+gUleHVlDIUMnfT2aRGHI92nMU/fYunQyK9vb2M9ax1BWuRy
	 cOKHc2a/QJS4/lWX9mz3Cxu3WlZiqO0nDaNbVvfshSPUL1ZKCQs9pgKe+XXx+WfLtJ
	 DdxO9FNytisxbsbjaV2H81c+5PZ+T5ju309tUDpINNpcWr7tDIoKN56CI+i7jZPczA
	 KB8r70jYO7t4I+c27Um9D1YvlLd0AHNLkdQ3AoGN5TjJT90Ve8lNEHfSng1HeeitZv
	 enoCmXRdZZ4x3Gik05nv/4Qxs2/uWKI3Yzulpqsg0zTvzn0Dg5gtGDLKkkKEzGkEWJ
	 TJJKIELHkkUIg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	mathias.nyman@intel.com,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 10/18] usb: pci-quirks: handle HAS_IOPORT dependency for UHCI handoff
Date: Tue,  7 Nov 2023 18:22:04 -0500
Message-ID: <20231107232231.3775605-10-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107232231.3775605-1-sashal@kernel.org>
References: <20231107232231.3775605-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
Content-Transfer-Encoding: 8bit

From: Niklas Schnelle <schnelle@linux.ibm.com>

[ Upstream commit 358ad297e379ff548247e3e24c6619559942bfdd ]

In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
not being declared. With the AMD quirk handled USB PCI quirks still use
inw() in uhci_check_and_reset_hc() and thus indirectly in
quirk_usb_handoff_uhci(). Handle this by conditionally compiling
uhci_check_and_reset_hc() and stubbing out quirk_usb_handoff_uhci() when
HAS_IOPORT is not available.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
Link: https://lore.kernel.org/r/20230911125653.1393895-4-schnelle@linux.ibm.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/host/pci-quirks.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index 10813096d00c6..1f9c1b1435d86 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -634,6 +634,16 @@ void usb_asmedia_modifyflowcontrol(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL_GPL(usb_asmedia_modifyflowcontrol);
 
+static inline int io_type_enabled(struct pci_dev *pdev, unsigned int mask)
+{
+	u16 cmd;
+
+	return !pci_read_config_word(pdev, PCI_COMMAND, &cmd) && (cmd & mask);
+}
+
+#define mmio_enabled(dev) io_type_enabled(dev, PCI_COMMAND_MEMORY)
+
+#if defined(CONFIG_HAS_IOPORT) && IS_ENABLED(CONFIG_USB_UHCI_HCD)
 /*
  * Make sure the controller is completely inactive, unable to
  * generate interrupts or do DMA.
@@ -715,14 +725,7 @@ int uhci_check_and_reset_hc(struct pci_dev *pdev, unsigned long base)
 }
 EXPORT_SYMBOL_GPL(uhci_check_and_reset_hc);
 
-static inline int io_type_enabled(struct pci_dev *pdev, unsigned int mask)
-{
-	u16 cmd;
-	return !pci_read_config_word(pdev, PCI_COMMAND, &cmd) && (cmd & mask);
-}
-
 #define pio_enabled(dev) io_type_enabled(dev, PCI_COMMAND_IO)
-#define mmio_enabled(dev) io_type_enabled(dev, PCI_COMMAND_MEMORY)
 
 static void quirk_usb_handoff_uhci(struct pci_dev *pdev)
 {
@@ -742,6 +745,12 @@ static void quirk_usb_handoff_uhci(struct pci_dev *pdev)
 		uhci_check_and_reset_hc(pdev, base);
 }
 
+#else /* defined(CONFIG_HAS_IOPORT && IS_ENABLED(CONFIG_USB_UHCI_HCD) */
+
+static void quirk_usb_handoff_uhci(struct pci_dev *pdev) {}
+
+#endif /* defined(CONFIG_HAS_IOPORT && IS_ENABLED(CONFIG_USB_UHCI_HCD) */
+
 static int mmio_resource_enabled(struct pci_dev *pdev, int idx)
 {
 	return pci_resource_start(pdev, idx) && mmio_enabled(pdev);
-- 
2.42.0


