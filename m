Return-Path: <linux-usb+bounces-32100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D29D079F3
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 08:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A857630504E0
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 07:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1BA2F12AC;
	Fri,  9 Jan 2026 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNKBu+zt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F172A2EDD50
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 07:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767944564; cv=none; b=XiWwUiJAxi/X20GBd61otCcF1dfPEe0wHSt2v28GUgaz4sDw8/MPoZb7gU8caHaXvYbYD37+RIe0/kMY3ifR1Scm+XPSEcMK594Q2FRwFC7NLZAuSfTx68q/INVuxdPQcijPbHScHX8X60RAuMM6PP0JEgU239YHARFo4l8ASEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767944564; c=relaxed/simple;
	bh=eSn6OwD3SrFNXw5tP/h9H/Ii7V8Im22C2P69wloFwSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WYpbZgY5//zZLvMe0623ai6FosdMliwtbm9N0xqUSm/11PqwrNbN8Lx/tEXWkw5bMKTvJ3Vf1ZVpnPe7yjhMTWMfKeaGxIbRlSrvf5ECg71jXtxqQiQ+j0u7wWLHQw29rNhwObr33WZZ9GOPRfqxwLrBSYn0KGfKzgzY8/jCeBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNKBu+zt; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so2565163a12.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 23:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767944562; x=1768549362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o9AYRVJbls5kMz4af/phakvFWuIaNCCibN2SZ7D9nuU=;
        b=XNKBu+ztV19Ia0ght1UHkOTunpMrvdVHurrb+9xjDr78fERdwAlqih6chUBZG1vZ6f
         IBb6z3815BytyMPQtBmUlWXleVc6ADWBn5aJNFxGzdPFRUNDVhwf7Y09EzwOgaYt6lxv
         K8Bs/CzhQqhn8ENEimMkEwy5Rtsd2fQM6AzM+gRDK+E8vx7CSRYVlYgWrzv+EiCXqhUJ
         uQVdUer1oD1O2F5C1DYg8Xnwk+Yl6KDHuQ0ZStnyu+BhpmeudKdX6/ESAjP5UkYV1DsL
         gATNZNzoaLuno6CWeFmWvSDIcSsxYkRZTbn+FsluYw0Qlo6oxptGp2IzeQhC/Mf7tPeV
         oJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767944562; x=1768549362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9AYRVJbls5kMz4af/phakvFWuIaNCCibN2SZ7D9nuU=;
        b=Yj02y5/eFOE6hhxljoxXq+MAj8tT0g6i8YxZtOHFQllZNw6gkIroskI5G/eE38nM/n
         Skbt3MsTaVreqyhLfM3pls1hDAr+ysuO76ErY4UeAWW+Cm5RCkNi09ypkyCEOCgVkR0t
         ru2uQl0CXOMjiVEJoNcgK5x3tN+nll/vcZNoaooUMjiCyx3pV7E8cwkYfLHkZPf1ONPR
         RhzDGwz3xpd65F1M3SgpMiOrlXJBQV83mQJQMvma+0FbH3QISzgOjQY+pI7gGq+bVvHo
         g9pyC6RHpOkzfcqgFv0OFXDc+SqQcjpuqw/0l97KWindhcIW3KWhKGBoJs0Rl5NSR5D5
         h/8g==
X-Forwarded-Encrypted: i=1; AJvYcCUn2oPArC/HZGOofYnz86fpwCIbeW5gq57Yk4jJbhbUcwR3RfjwjbbELcIWk6R5Apjtf6csfLrnedU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRH7fEkSYMr52JAJMmzITeFfyp9v669GQSP8AymWk85Vpf4bnr
	iDdaXDF6IGU5k7EC1/NiDmUeyJf09H7uw7w8TB0O0HAE6VwN4XgXh+o=
X-Gm-Gg: AY/fxX5bUTZk/MCovAZ+pPeyZkg/Csxk1ayYqXEvgSN1rhQSVIYvrskNKFcH82H2wcy
	bjtWMja5vpJ0cevsP4LRaIAlPWlPJPnpjGtLTrowjeHmw6gMmYM454JSshf2t/UpkjDhJCejKul
	6R60HmaX77RUwkYjMCESyxhBOaieTBo0in5f3RRCMwoWYSTIeLmVxtPUhYo2cdC8gnyLRo1UvwA
	EVZ5l5vmOvtXOetFwr17VqS+kEypWRIn77cjARKFHmGWMkIxE/7K7mKh7Am7xNK2k/+pY3eepCj
	EElMZd7ba58HbnRQk5UCqEvcesTzXOUmMYDMxLh0LYM4MSbhILxkpCjPa6oPW3rDKmEeVE8TgdL
	/aGn5a5Z4DztcgHJFbOFUJGXLWGD6dlI/TOf44hacADZ5FlK0/VuLc24xM6CygvmW8k2c3rZaW0
	h+Y7dCSrQVJKeUb0Q=
X-Google-Smtp-Source: AGHT+IHJ/rsYu1MTPilthw7eQlciakMyESsgvffAUTB6sGttF8HsOFwXFQjB3kokh4VKOvwm/Db7+Q==
X-Received: by 2002:a05:6a20:a10e:b0:33c:2154:d4f4 with SMTP id adf61e73a8af0-3898f9975b1mr8593154637.49.1767944562266;
        Thu, 08 Jan 2026 23:42:42 -0800 (PST)
Received: from at.. ([171.61.163.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28fa85sm9756036a12.5.2026.01.08.23.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:42:41 -0800 (PST)
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
	Dave Jiang <dave.jiang@intel.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Fri,  9 Jan 2026 07:42:24 +0000
Message-ID: <20260109074232.2545-1-atharvatiwarilinuxdev@gmail.com>
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
Changes since v5:
- Used the correct name for DMI check
- Used DECLARE_PCI_FIXUP_EARLY instead of DECLARE_PCI_FIXUP_FINAL
  to disable aer, before the aer init function
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
index 25076a5acd96..402387e41450 100644
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
+	if (dmi_match(DMI_BOARD_VENDOR, "Apple Inc."))
+		pdev->no_aer = 1;
+}
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x15ea, quirk_disable_aer);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x15eb, quirk_disable_aer);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x15ec, quirk_disable_aer);
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


