Return-Path: <linux-usb+bounces-32044-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D58D01F1E
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 10:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FF33337BB35
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 08:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D717389458;
	Thu,  8 Jan 2026 08:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mu+m6rYJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607AE38944D
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860395; cv=none; b=dsox4QD9UsbOfAGzolZLnttBuaxz1ew0FyBz65+RUbOULr44OfOc2Efgs/hAamlh4sQBZFds9wNQxRdlE/y3cPS4tLovgm1RRkh0tXWSGtzuDAm1KQkbBTLFVkJndaujOAfRiSwf7EOY7+X3W5k36tkjRaKLIrcrqXxFzdHbSYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860395; c=relaxed/simple;
	bh=ZqmOf0gGy6Ui7/SWJdII1LH9oZpSkCVX842PERXe3X4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t11x2HQSbl3GzG4RHW2mFR5gkA/W8TsthsYd6JLVmSsNdOK0B1V/laKnK9/07Fv29ldVfUJZAvrSjtikJ3Jk7MXZgmC9/Fx7L1IsF4BuSZ9fXlLAFbpqj9JZpBPEw9EBF27EYA97guKSAlKEfUqr985dBvBYbKWnipscu8xuO9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mu+m6rYJ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34c9edf63a7so2399343a91.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 00:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767860372; x=1768465172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fHAmKcdoN135Asq9ijVI3O1LODaST52jtA9RClzYjcQ=;
        b=Mu+m6rYJif3CKKWodxrZjtUHYfu7+RksKV1fiLl+HFWLSys58vVNHXieOeOi0deWz4
         3+eOfGNQ4GGnQtQ3hqsampxlb3o5aNnJtct/o8MSiqKaD6vAcjF822N5/MKF1cwjL8kl
         HIqKm0W0Mk+Uz1GvWCRjqzWOgKYit7sY9GaoEFEK8bG2OF0f8nmEeFlQdLYwGi3NHOm2
         F+yWKlMYXhuFiCsNqXM2dxmP1FfxFwyJG52EP3bGwxoOWx8s2TFXHZGx8TkMI1rViX9W
         DmKzdeQQdMxokPr5WxyX5GU7HnfBor4wkk0NSgFB+6biazEzj87oLbYtOENHaYQNdlmd
         dOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767860372; x=1768465172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHAmKcdoN135Asq9ijVI3O1LODaST52jtA9RClzYjcQ=;
        b=b9hcwfO9yRmnHnGaR8YkuhdOsPSeSqkYdtOzf0cLlTtdxRvRuBi8qL2BdU6QJC8AO7
         oKcxJHxwy1vK/uHx2R6BRzS/LDcK1ylCFWOwEiMGnANnpboQ1nAQQ1ih7he1EV2kS2jQ
         zddmALfP4+IwgoeEHWwXcDUl17OZJnjrj79FLNOAfcub+kVeXTy8BHCPkkgbR7SxSFQF
         8KpN/Ull9vcELMryunF/oXtv78Xkstx9DLw9GtgLe7CTUforJ6tX/sp4IHrZzHe/bv+3
         tVNCrHkkvpMiKEKGh3U76m4TpJRUPECIESKH/rZCC2p0RlhV22S/8M0Z+eDfVtTvq6E/
         y25Q==
X-Forwarded-Encrypted: i=1; AJvYcCWicJmdfND4D3BQktmJ3fMqhn9SbfAh4Lt8kmTzSq2ii4DVP2kf32NWQmPfOcmrvGZSE+uTiJAGb5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNUNKvesCj/FDgxDLQk3z04C5EmAeO8uSvw4PnQe5tpNf350pl
	ZJUfayBYQu6XYcgVNuH6F/W5J4KvZheQJ8yc71wUoN6v9HpWttHfBBE=
X-Gm-Gg: AY/fxX5k5niwRXPMjyU0g4QddefJFCkz3Hs0il4AtJQ27EDaOhlj0GI10+2gSpHXJB4
	xE5tuLOGadMyCky2dNmXO5NmM3W1ZSihiZO7fPZy/Ts2qIebpX4rw1Nxo131wmEtWxMYMsESW1U
	uevB9yvl5S3CgnIp8B9ZHx1FUr4Im+ENUqKQ+zCd+lBmoaSZLf1SJ4bqq7otG2EUXyEiniq5if1
	ftIaZiYL6qAbeQyeeG2rst9RaKdEDTzTAvcKiUoV9SwC1tp4j3kD88JSwUL4gK4ZZ9Hhu70F+KN
	s4Lvuua3VwbA8xyNJ/8ZShyB1QSkdMSL3zl7kmL/Yx/xu8HRxxXwmJIo34cF9qHSd31jElTrU02
	xQ7Kua0w0BIR+52ndr9UNIcWEXLE/Vv+tRmdI23rZKJwqQJ2TecfbgT3A1AEW1kFFc4nTmEFPVq
	dakUuEDUKhgPPBTOs=
X-Google-Smtp-Source: AGHT+IFDK5YD6a2Lz09PpXPJx2QnY/5/782hB7zl/Zgtvf8GF5ogkiCdodmnp0MwEz339uVRHb9Okw==
X-Received: by 2002:a17:90b:4c11:b0:338:3d07:5174 with SMTP id 98e67ed59e1d1-34f68c7a647mr5191292a91.5.1767860371991;
        Thu, 08 Jan 2026 00:19:31 -0800 (PST)
Received: from at.. ([171.61.166.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b19ebsm6979077a91.3.2026.01.08.00.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:19:31 -0800 (PST)
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
	Dave Jiang <dave.jiang@intel.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Thu,  8 Jan 2026 08:18:53 +0000
Message-ID: <20260108081904.2881-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes since v1:
	Transferred log

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
Changes in v2:
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


