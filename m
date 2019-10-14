Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47032D5B16
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2019 08:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729660AbfJNGOB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 02:14:01 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38817 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729943AbfJNGOB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Oct 2019 02:14:01 -0400
Received: by mail-pg1-f195.google.com with SMTP id w3so2539581pgt.5
        for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2019 23:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SxGUJnst+Z9LYUe/x+To9UpSgZfsjSC5zAkllZtjf+4=;
        b=bZl2xgOGiHdQDQxnROBaIuFohpDWTlh+1aSvMXOyjys330fNa80iIzuOZIL4r+YxLg
         YkrRSMp0816VP9FgCpT5qdsjPMvgA2oDYZaDhJjzBN9FQB5YYjOTZlWttsDEs0GNSD/u
         C6i7yz4IBUeuKbei1dyWTnzyR+Zx99Fje3yJKmD4Atx1AkReRrreojKQxv9d1DvnyTcc
         StenxTnhhDOOLItCFhoCtJd219BmuQAC/7lg7QkHaLO7mIEHEl3xQE7mQW+AHC03IKNO
         HgUZWHa5FrA4ufhvaDpVPg6rShp8tLkF8K+hcCfu4wqK46dWQ4EVADJB+0Fo5pghg0NB
         ZrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SxGUJnst+Z9LYUe/x+To9UpSgZfsjSC5zAkllZtjf+4=;
        b=bweEu/xvP5s8bgs96CkrH1/K7lQeS1FkGbtcvOfdZ7h0T2q6+Z23sInH7J1My854Kv
         /JX/MS6ak55cBUEJ4cGddzwHIrJyl7PSIPu7OwgcDxSCz42DDZrIPCaB3qXKvUP8FXJ+
         lVGH5aflNFe+bbpV8ud4LlFGS9y6QX8CgARawSAsDaEzE60PGBi3399DgomT6JSZsvMw
         5s3XrlnzcFle6b4bp2y0dRPXPO0wkKsYve0+AUWVuy1UZe30iQRE5X4O8mMzNPMv/FW+
         OSgIjCzaguan91v6AHRMFFAQR7TY8EnYVlyHujx1QGfssoCSB+EMpg0zRWT2PLWiSmWP
         L1hA==
X-Gm-Message-State: APjAAAX6rQEBFyoShrubNtUJnzeEi1fIQHsDBHF/Re7sdOWFKrYGQYpE
        FEflQP5wjAYjEdzbOJxBN81YJA==
X-Google-Smtp-Source: APXvYqyqheBXHYAVz8Yor+xk1Ao/qF3goQCfYBpcYXrsoKT36d9U5c3UpZeI/1TZVa5JFWigNg/VSg==
X-Received: by 2002:a63:6586:: with SMTP id z128mr17768326pgb.260.1571033639898;
        Sun, 13 Oct 2019 23:13:59 -0700 (PDT)
Received: from limbo.local (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.gmail.com with ESMTPSA id dw19sm14645458pjb.27.2019.10.13.23.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 23:13:59 -0700 (PDT)
From:   Daniel Drake <drake@endlessm.com>
To:     bhelgaas@google.com
Cc:     linux-pci@vger.kernel.org, rafael.j.wysocki@intel.com,
        linux@endlessm.com, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH] PCI: increase D3 delay for AMD Ryzen5/7 XHCI controllers
Date:   Mon, 14 Oct 2019 14:13:55 +0800
Message-Id: <20191014061355.29072-1-drake@endlessm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Asus laptops with AMD Ryzen7 3700U and AMD Ryzen5 3500U,
the XHCI controller fails to resume from runtime suspend or s2idle,
and USB becomes unusable from that point.

xhci_hcd 0000:03:00.4: Refused to change power state, currently in D3
xhci_hcd 0000:03:00.4: enabling device (0000 -> 0002)
xhci_hcd 0000:03:00.4: WARN: xHC restore state timeout
xhci_hcd 0000:03:00.4: PCI post-resume error -110!
xhci_hcd 0000:03:00.4: HC died; cleaning up

The D3-to-D0 transition is successful if the D3 delay is increased
to 20ms. Add an appropriate quirk for the affected hardware.

Link: http://lkml.kernel.org/r/CAD8Lp47Vh69gQjROYG69=waJgL7hs1PwnLonL9+27S_TcRhixA@mail.gmail.com
Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 drivers/pci/quirks.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 320255e5e8f8..4570439a6a6c 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -1871,19 +1871,35 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL,	0x2609, quirk_intel_pcie_pm);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL,	0x260a, quirk_intel_pcie_pm);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL,	0x260b, quirk_intel_pcie_pm);
 
+static void quirk_d3_delay(struct pci_dev *dev, unsigned int delay)
+{
+	if (dev->d3_delay >= delay)
+		return;
+
+	dev->d3_delay = delay;
+	pci_info(dev, "extending delay after power-on from D3 to %d msec\n",
+		 dev->d3_delay);
+}
+
 static void quirk_radeon_pm(struct pci_dev *dev)
 {
 	if (dev->subsystem_vendor == PCI_VENDOR_ID_APPLE &&
-	    dev->subsystem_device == 0x00e2) {
-		if (dev->d3_delay < 20) {
-			dev->d3_delay = 20;
-			pci_info(dev, "extending delay after power-on from D3 to %d msec\n",
-				 dev->d3_delay);
-		}
-	}
+	    dev->subsystem_device == 0x00e2)
+		quirk_d3_delay(dev, 20);
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6741, quirk_radeon_pm);
 
+/*
+ * Ryzen7 XHCI controllers fail upon resume from runtime suspend or s2idle
+ * unless an extended D3 delay is used.
+ */
+static void quirk_ryzen_xhci_d3(struct pci_dev *dev)
+{
+	quirk_d3_delay(dev, 20);
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AMD, 0x15e0, quirk_ryzen_xhci_d3);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AMD, 0x15e1, quirk_ryzen_xhci_d3);
+
 #ifdef CONFIG_X86_IO_APIC
 static int dmi_disable_ioapicreroute(const struct dmi_system_id *d)
 {
-- 
2.20.1

