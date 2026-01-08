Return-Path: <linux-usb+bounces-32045-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47075D01C05
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 10:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E38B38305E6
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 08:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6636364E8F;
	Thu,  8 Jan 2026 08:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COHAo9Fa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AD03563C7
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860734; cv=none; b=jqW146Ec6W0ZrZTNhZ+EQXVi24tHIV27TaBKsjiAXIcnP5FeNHDmSbrIrzmL70UfcQ23SoMkbwqDDjTHTYaXNJUfrS4owaF96Z+6OHFoQ9B/Pz97BrfcrlO9tnLtaroc30JPFnC7vcFi1OFC2YD3XRx069XE4ZucUYOeTTtZEVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860734; c=relaxed/simple;
	bh=KziMa7QNGUm/4xZVgFBikODfU6bmya2+U35lZ61t6IU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b6lBCmWOqQB6ib7psi63RaGcU2Y1+xGKIQKo0TVz5rbOlDdas8PEXPZDkmDSiPqB+YXMgD/q5mlo3deiEiX72xpCigvamjg2WynEU8niUQ1ZYXpyv55JauKpP7pvawO1z+Qy418nG2JiuPuzWFtwK4JNvEOoJDDZu/IEUxZThp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COHAo9Fa; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0bb2f093aso23061305ad.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 00:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767860724; x=1768465524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8t1+RviBZBkQiz1+F0jLoZoAGkcEhuc2rfeggUJxJA=;
        b=COHAo9Fadf1BUBEBbBuBuRFX794Igrky/O6OKgvi+ot2aYw8LXRpuPbABRts3k0y3W
         fTi5ZfvtOsYZHAl1MgA3+wht4f95hpELRmMeu/vpjP5YYngbGvnSbnE9lNd9+xJ5TtQ+
         2MqgfQ3/YMpHC1csfF9HBF53/D2XpRMONjtBB3wF9SE5/efNfI26+ZahAr35OeFZls3u
         SrlYcHe3sC6HB8a7ndUahZ5QNWQvxr6IdMo2zF+ACpV/KwNOpb7+P63VZaQ4frVjCpxH
         6hEej5AgqDi0RDbh2UutrunlgJ958WDyLdzl9gEgC6ZdBicsxc6HSNLEpxYiufpzdZgQ
         BiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767860724; x=1768465524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8t1+RviBZBkQiz1+F0jLoZoAGkcEhuc2rfeggUJxJA=;
        b=fbASx/f1KW2C4MdwUuCwM9qxC7be/7/Xs4ih8s1H7F9l9C9nxHZiGK+y4jfxptKBht
         rdOYj+HMfSKWSqccmTaRSlvQg/wupCZBAQSN16n3x2cLB7WUFDOZrTUytvmfoTJ50k98
         h3i1tnqjHNoH5TkE25coDgmrSEWf0rfM35b40q7ZjFOJ9a7GaVq+qUI9Hjx6JPCiXn6p
         mU8tLyp57X04tNzzIHlTlIcA/R/PCzHQgTxtPLhwcnzT6YnIs0HiMxYloWKgkqyrM2Il
         IklvTV1FtA58a7J9bg0aX8npilNCFCmrM38/zuqul5J/MCTMPenrcgFKOvdSxNlxoeOe
         cebA==
X-Forwarded-Encrypted: i=1; AJvYcCWnbVXLRvDORRb0l7i6kHnaGP6p9CF9EWGAIA8EnA470UQvutEmzlwcPIMavV9/1yKzFoUfOjH3Heg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXSQCVAKkwSuWNY7E05mStEdDV+BAMpcqrY6zp0mChT4Lwjkzz
	o/gLuxiowsJVHm4fqJYN24Y+n9KkUcktgWFQ/u/T1KkTtL6vJG5tytw=
X-Gm-Gg: AY/fxX6NfQYcEANVEmEi3FcFzctPMknGTJ/y0QSXsAXsq5DZrFT0r0rLRsOMlhTfVLX
	gDGWUiUKEAbnyxH7eLM6qjktr5SMAzVg+nNcECibmE0UTlYPRjq+Xnb0H4kNKeHZJBttjSccnS1
	7z3YWZtwl/XXyLWnlBMbabLsj7AjcrU98n6zXaCnTFZDOiBP4qUuikz/PqkJZNnMwbAq5BuAgDh
	PNqw0y29Oip+BG86j96cf7mMQ0wH3nmtCWKNNl+GZgLNzDu46UwETlqU+Z+IVz9rGa2cUpBy9wS
	NGYqntzxjiQ973llYiKIJbyO8I828lFbJJasKNdIBFpiaOVk3oK8ZArvU+N67Gtpwgb4NNEVd7M
	oXl6FukhhTjTNh/c/UuTvYjmFzH3xWKZvznQokrJKhai2TqEeqAsLHcMWCZXq3qifb6070IlEIB
	FPKUVZm0eMN7nI7IE=
X-Google-Smtp-Source: AGHT+IFlqu/P/5sh9z5DWE3DsjYa1JH40CTlBeUg8uyttdF4r71Kg5WERp3YCavi1Kt+WDXEmDPaOw==
X-Received: by 2002:a17:903:3c30:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a3ee437a5dmr49953365ad.10.1767860724001;
        Thu, 08 Jan 2026 00:25:24 -0800 (PST)
Received: from at.. ([171.61.166.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c47303sm70625825ad.24.2026.01.08.00.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:25:23 -0800 (PST)
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
	Feng Tang <feng.tang@linux.alibaba.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Thu,  8 Jan 2026 08:25:03 +0000
Message-ID: <20260108082509.3028-1-atharvatiwarilinuxdev@gmail.com>
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
index 25076a5acd96..bd72f7cf5db9 100644
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
+	if (dmi_match(DMI_SYS_VENDOR, "Apple"))
+		pdev->no_aer = 1;
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15EA, quirk_disable_aer);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15EB, quirk_disable_aer);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15EC, quirk_disable_aer);
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


