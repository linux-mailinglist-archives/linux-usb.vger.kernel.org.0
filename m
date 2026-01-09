Return-Path: <linux-usb+bounces-32097-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D58D07609
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 07:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF165300F5AB
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 06:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8728283FDD;
	Fri,  9 Jan 2026 06:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMbwam1g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B595248F47
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 06:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767939553; cv=none; b=XIk2NE/v8jSR9AeXOc/mEHm++ECf6/tyx+Kf1hz/q/fMIwPSgfk0K0NoxUxIzTL9go6WKGSGXd827VCafgwgeIv97udr56qxLFEYnyaity86g+mMNb3gBfZxjiW/wIkFK86EJ9T7pN15nN2FS5/np66BUgWocCRHiHP4zMp1dLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767939553; c=relaxed/simple;
	bh=b/3huWzi5fH5yfmWBVLBG0clk1xwuF28Qcz+cqEDEds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j+5nUvKN/dQ8NxOQBiguZdeVgrrGT6oK57gHVT4wHUsx57DdXonS63GEEeReirPOV2IuJOucwFiE5oHT391vSkh2JeiaGoLe4FFieH8wzolZ3jUa5yDxUMnhoIMwTVqF3wDzrNAv0Xo4YJSQ6E489VSBSgtUX1l9EpnkWc9/Dsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMbwam1g; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso29936555ad.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 22:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767939551; x=1768544351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mxcIAZdi8DSHabnzsxkENQYm/KIvgyHbwki+UOtqU4s=;
        b=dMbwam1g4FQd4hPWaAvnKL4WMv3mgao0NHJzDuaHYZgIJqavPeEAD8rMLSFKm3kOBP
         n2czKPQ/A/LpjomLuH6BsnDxcqgFUY9Y8z3EPBhEVmAKoBegZjfjnmH/f416jmewhJ/E
         gUwQFFOGnFgyB9rCWKX6BlYGC+VjtoAqmXGN1IvoTj5/X1nfB+H3erOYJb3lWmbclsNR
         9nhd6jniR+jcPWo+rfe4TqPWAp5W0TDsUvaiIDlucgz5eUaWGqESsjD5cPlc8un8C2IQ
         +SETE5fBuxn5SzuCRh1hJ3r1E6K2G3PA2deM62AiFp9pUNWmWiRnvy5caK7sJSLddyqO
         F60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767939551; x=1768544351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxcIAZdi8DSHabnzsxkENQYm/KIvgyHbwki+UOtqU4s=;
        b=KzzKbRqbyAQS/4o3HHMx3UKimBMJwfm/N6fN1wdBO6Cbz60COrZTzb5xEON1vspIpi
         Jb+uLXYkLOLcx/XzuT51jItfP6OEeqG9DtVJdrLh8RvAE1dB2AUyyTpGp0g+QHYwmey5
         slnx0F/Xhs2/KVCZ2oxZ1pElLBGp7cg1ePJW76dA5SDYUQMRx4A/STVNjwjULawrGaDm
         BKms0CMylVRzzSKtu04UEpGjU56KRylW/TKJuprgmnWwu0eqPjGJmSXWi+Btx9BvGhsH
         x3D0p8AKd8T01QbOqkO1hfNVYX5Iy0WF7yEb3y/L7JzUDG/VyLBEUn5CBN3gqs27srCz
         fqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB0sSQNVUZnxks/dDHxxQL/dmx4qFXsjUMWEhO/KlbnaMYQrlYMgZVtlBwHIZ/V6USMlcuQVTCHI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9NGvPp3jMs1scS2aXrx+7SOL5Bx/ee5rFgN+xlClTx/XqlC1S
	Ko44Q3rSQJoP+HM88pPHA2ZuGy5WemFNahqoxmOFTCgnc9OWyAotYPc=
X-Gm-Gg: AY/fxX6kl1uw3PRYOZagJwUcoS58k4zpSonCTcNNk6sY29b0VB2I49FBn8IiU9X028K
	CKa7LR2D2tOsIDbVVrpnP7w/j40xIFmjcH1S7PldkOnOokKUNtiCphzaXL8kXuzeu1rUwlq2o1x
	mfFN0NGHJoV4+V8lfkT2ZznCIsfMVw2c2ttIIS3LBBMYkVnJS5kJcLUiEMN7dlVujcQhaU1yMif
	K8J4zTKsZr3ma+qYi1D4fvzutEEEOr2zlufb5kTf+7rLp3nZpf65E88zfagADqFAnwvyzy+Z112
	56Q3glZoI48G/E19cn7WUhHyA6wrQ7P2qhG3mVpTHD0rLgj4zyCnJnn60+GpUTrlilFD5GIAZBG
	1GESFWZRyhjAF/M/cTQS+WFuMCjXwj3rRT5Ki0ia6a7qmCrAj9vcZDjziVFOv0iJK9nPae5cu+5
	7zm6ZE7Xbz+Uc3WaQ=
X-Google-Smtp-Source: AGHT+IGN1WYQT2EKc4h3GaCwKE2jZCARir0K7jCaV93K9/r5xtWTUECgPBy7LokTrS9Cz97x/QdO2A==
X-Received: by 2002:a17:902:ccd0:b0:298:2cdf:56c8 with SMTP id d9443c01a7336-2a3ee4c46d4mr71063545ad.60.1767939551278;
        Thu, 08 Jan 2026 22:19:11 -0800 (PST)
Received: from at.. ([171.61.163.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c530133csm9272546b3a.31.2026.01.08.22.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 22:19:10 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Fri,  9 Jan 2026 06:18:53 +0000
Message-ID: <20260109061901.3127-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Disable AER for Intel Titan Ridge 4C 2018
(used in T2 iMacs, where the warnings appear)
that generate continuous pcieport warnings. such as:

pcieport 0000:00:1c.4: AER: Correctable error message received from 0000:07:00.0
pcieport 0000:07:00.0: PCIe Bus Error: severity=Correctable, type=Data Link Layer, (Receiver ID)
pcieport 0000:07:00.0:   device [8086:15ea] error status/mask=00000080/00002000
pcieport 0000:07:00.0:    [ 7] BadDLLP

macOS also disables AER for Thunderbolt devices and controllers in their drivers.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220651
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

---
Changes since v4:
- Used lowercase hex letters
- Used DMI_BOARD_VENDOR instead of DMI_SYS_VENDOR
Chnages since v3:
- Fixed Grammer mistakes
Changes since v2:
- Transferred logic to arch/x86/pci/fixup.c to only target x86
- Added DMI quirk to only target Apple Systems
Changes since v1:
- Transferred logic to drivers/pci/quicks.c
---
---
 arch/x86/pci/fixup.c       | 12 ++++++++++++
 drivers/pci/pcie/aer.c     |  3 +++
 drivers/pci/pcie/portdrv.c |  2 +-
 include/linux/pci.h        |  1 +
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/x86/pci/fixup.c b/arch/x86/pci/fixup.c
index 25076a5acd96..850bfe03a685 100644
--- a/arch/x86/pci/fixup.c
+++ b/arch/x86/pci/fixup.c
@@ -1081,3 +1081,15 @@ static void quirk_tuxeo_rp_d3(struct pci_dev *pdev)
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AMD, 0x1502, quirk_tuxeo_rp_d3);
 #endif /* CONFIG_SUSPEND */
+
+#ifdef CONFIG_PCIEAER
+
+static void quirk_disable_aer(struct pci_dev *pdev)
+{
+	if (dmi_match(DMI_BOARD_VENDOR, "Apple"))
+		pdev->no_aer = 1;
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15ea, quirk_disable_aer);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15eb, quirk_disable_aer);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15ec, quirk_disable_aer);
+#endif /* CONFIG_PCIEAER */
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e0bcaa896803..45604564ce6f 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -389,6 +389,9 @@ void pci_aer_init(struct pci_dev *dev)
 {
 	int n;
 
+	if (dev->no_aer)
+		return;
+
 	dev->aer_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
 	if (!dev->aer_cap)
 		return;
diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
index 38a41ccf79b9..ab904a224296 100644
--- a/drivers/pci/pcie/portdrv.c
+++ b/drivers/pci/pcie/portdrv.c
@@ -240,7 +240,7 @@ static int get_port_device_capability(struct pci_dev *dev)
 	if ((pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT ||
              pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC) &&
 	    dev->aer_cap && pci_aer_available() &&
-	    (pcie_ports_native || host->native_aer))
+	    (pcie_ports_native || host->native_aer) && !dev->no_aer)
 		services |= PCIE_PORT_SERVICE_AER;
 #endif
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 864775651c6f..f447f86c6bdf 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -440,6 +440,7 @@ struct pci_dev {
 	unsigned int	multifunction:1;	/* Multi-function device */
 
 	unsigned int	is_busmaster:1;		/* Is busmaster */
+	unsigned int	no_aer:1;		/* May not use AER */
 	unsigned int	no_msi:1;		/* May not use MSI */
 	unsigned int	no_64bit_msi:1;		/* May only use 32-bit MSIs */
 	unsigned int	block_cfg_access:1;	/* Config space access blocked */
-- 
2.43.0


