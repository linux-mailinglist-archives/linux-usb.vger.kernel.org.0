Return-Path: <linux-usb+bounces-32295-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AFBD1AA8E
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 18:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8719930A5656
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 17:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9796536C0D0;
	Tue, 13 Jan 2026 17:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6Z+xc5m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A99334C1F
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325643; cv=none; b=NW8m8OMH4MZEFUbYMYw3owT+c7kaT96m/rQoswEYYz+f0w0v6oVh5H01B0EuDUFo8aKotlJlJBJvYMhWRx4z+dDdK4SGCVm+yktzNfUAQCqqqFsyQj23Wt78gU1at6oIIeaDD/fy0ujr4cP2z88V9O1aJ2ftOERZKR3ejspeI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325643; c=relaxed/simple;
	bh=eSn6OwD3SrFNXw5tP/h9H/Ii7V8Im22C2P69wloFwSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jpg1ylLE6UtKW31iq5kmU8MstwvlbvdkgqG+VU6OBmR4IUwElQQoorv+RwfuWbEU6MKAiDB2oqaCOk1Vexh8vPgKagxFUKwwsyKqVm7Ss16hFRidLTgVF1h3D79JAH33a23FDucZ59d+j+pxqf+2nI2C2vtwaxRKNuB3h4oM6jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6Z+xc5m; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c026e074373so3655899a12.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 09:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768325641; x=1768930441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o9AYRVJbls5kMz4af/phakvFWuIaNCCibN2SZ7D9nuU=;
        b=X6Z+xc5mtXg0NqS0JuUbt1276ipKGNu0R4ckTAgVXUlKTUMiBwO5lSK2x1UTTsCLDD
         /QIv8UUd46Dk4FI7bKy0ArpNtGt9/v4UYFj//SRFAZa7iJxZxYVXLIc1/GmFFbT3PNDK
         Ph9N9Z6jzPIOymVNTKo7AkHkpKN4UWa739o1NArSz3RA+r4bkLo5tpwsw7xRxPgAYEYh
         /AAj4H8ro7dYitL2oQJTKqd/16r6B25ymhHrrOs0hugGI7QVS0fl+qoytta50+WrkHjG
         za/cEWO9sds43hlDIoCealBxoDEb+3L9q33ao+CfHkoMSEL005lg5FLzTQZGEubYJ6Fg
         /hLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768325641; x=1768930441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9AYRVJbls5kMz4af/phakvFWuIaNCCibN2SZ7D9nuU=;
        b=TocjpojAgPS+cPA6qVH0cfoEF05ReKlby83Hplx3DodbJ/v8QqkitSlDGE+k24pAEb
         r7WKTNlbtkyK2DfKg6/FhS2aOduOXvm339t3KTP8Z1tjOjrshMrW7hMn0GJFtB+426l7
         MNXy9mEbhE3p7wDClTBrv8E4nc5OH9CEx2BR1nhyl3SeO8zIA4iedZGOADC3zg5nggxv
         NkbyqVBfcwLAUoN0blLdoDABKepjTm9AcscU43hMO+bsUKXe2Lt19nPw6OOt1Kgrl7l7
         Atstf1Q2rCMMXYpKng05ylbexD+lAn7Smy19xhevzAcAnBn2uXKmQ6/lJ3qKT2+ppHlS
         RmDg==
X-Forwarded-Encrypted: i=1; AJvYcCVL2j8spfK9M4E58vtif8Jd6WFnuY4bP4ob2uprw+yn6HCfhrYH9EivjmmLyo5PBgsIze6M2mJITEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrs9ZgwGsfitbDgS6BzXCQJ1DmqzSJSM7JjaslWdq7VbN9e0sy
	/uBj/XKsYS21YMUhi7X6ckK9VXVr6nKzPMin5M4EFn+Fnr/4E1KoxzA=
X-Gm-Gg: AY/fxX4CtrdxaaHvZU9OZ0p5IubwxQELyKUUwVe8dRcHcJYfBuok/DLiU9H3Ipy4t91
	JQZVQIqLVsefPTD4Lrj2b9JWpMg+r9yaoLoHJqWxQr02D2XfBtYdBtvgs9grFiqB2jotgW2YS4h
	O/2mgAjMKLbv4h6j0Rvvwn/1EI4bF9NoZ7j1zYN6DElJCT2nXjlfIjsIwlmJ9XPkUnjLhV7Fm9W
	1KMXeMzWpsGCwYbwL3f6rgv9600hy2edJgalkWnxBBpPaZCXBNH99Ak27YHTLoCrp7elXh6727k
	osRXhsieU0GtCn1SySIOynLvpRvJWWnoXdTdYeUWSYMUepVuDFxtmnImpl2EPuyJjNy3QDAeInt
	RsYTCy7eH1nY87yZDkyGYI+bMte3K++M1Umfpsewb8Dm7lDAVD2AXJ18sJDVsMm49oOpOlvHove
	+6oS0cAIHkSAx8RTkNOA==
X-Google-Smtp-Source: AGHT+IFVIOA0i/RAZfOle5Rnk5OR3hAeebkOKtj4cj5B/mfjbUzBpEhX9pRkYTvlm8gfa3/cjIZpdw==
X-Received: by 2002:a05:6a20:2450:b0:361:3bdb:26df with SMTP id adf61e73a8af0-3898f889453mr21192202637.5.1768325640779;
        Tue, 13 Jan 2026 09:34:00 -0800 (PST)
Received: from at.. ([171.61.166.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f66f9cf38sm4568854b3a.53.2026.01.13.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:34:00 -0800 (PST)
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
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: [PATCH RESEND v6] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Tue, 13 Jan 2026 17:33:41 +0000
Message-ID: <20260113173351.1417-1-atharvatiwarilinuxdev@gmail.com>
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


