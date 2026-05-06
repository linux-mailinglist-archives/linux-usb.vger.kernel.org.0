Return-Path: <linux-usb+bounces-36997-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCdtELq1+mk/SAMAu9opvQ
	(envelope-from <linux-usb+bounces-36997-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 05:30:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A64284D5E37
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 05:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CA47301588A
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 03:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195102E11B9;
	Wed,  6 May 2026 03:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/3inPyM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CF22D8376
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 03:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778038195; cv=none; b=dNLv2qOp2KCS93PYq7qTCYYN47wevJ6PMoZMxXBS2uG5c5FuwQYq7dp1AfUt/y4VrEPK0RKtiQo6sM1hC+Vux5fJVaGEf3B63sTh3EMiAxkHkIr7GnpBSv31zF2SYIYLaK/cEPP84lGvKifkUYJRcCYxnPfQhQziXo9jYhO+dxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778038195; c=relaxed/simple;
	bh=JLeENIiXVpGBak/PBcCy92OiqhtAGaFAad178b3I9Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WVhqSV6j+WhTdwHkKR6JhHHp0DKcTM32KXlgteBHoyFIPCZ/6LgrqhabGoozIL9ukxW8qD0BzgPZj5fwrYAhnpleNbnPC2oK2FwkIol2pQP/r+X2xCGe5yN2mPxjSLVN7g2wAkGlx/8AtzMb/PWsZQZMo2UxZVrbsDEJdWGKGkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/3inPyM; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c736261ee8dso1999096a12.1
        for <linux-usb@vger.kernel.org>; Tue, 05 May 2026 20:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778038193; x=1778642993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UhPw6WdkvT0vs7g9hPPUu1gtDPktwwVFydoqNcGS+M0=;
        b=K/3inPyMGoyFovb04Tb+x3X4C7KNIW8GF7EvZOxYOuSEN00ffqTYxG+bZWzzubL5QA
         bcA4LwnGwd/4ZkMuUkR8JSPZxeweqzuZh39OZOqPlt0FwcovbXBoLxA79ah1Mrw7F5P6
         Aktfq9Sj4ONO+Pvz0Xdn4y1/0pOsg2Lu4SsyKowe081KTDbc8fEjhD4ceARTLw5uFsDi
         I+HPbT/6mBe4ltdAz6XNO7etTwP/ILaYmSBRHEMMXCIe00/LHlxWmvMWFzjZEHkchCIs
         mQcGMtNAARDXvI2Si4bCgu1CyTBMncvwCA2tWHpxVNsICpKjWWpvFJsbuEgrzfxWU+4L
         YmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778038193; x=1778642993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhPw6WdkvT0vs7g9hPPUu1gtDPktwwVFydoqNcGS+M0=;
        b=gG/BQJahFAIuHXl8MtGNKw6Utl8ww07RX3k18cMNZHGr/uw/koAwuCyxaDiGNJB13j
         8Q2PHqB85/f6JH9J2vCTdFrxUzSa0kQd4l0skhjVDSL6SaYyz1EePzehArUIJO94lIsO
         U+qgf1q6veBMVoYbbFuowsZ38ZVSXbHDeHNsfU/slfrh4LOZZsC0Np9mXbHRvtuZEiGz
         wseDOxgSqOyjQw2MQMGvA08jykll8fnY8QKCq59ulKaOh0BVIWr5lPB5f7EWtOfjuz1M
         0itjOykMB4OaCFWzU5QmYspjSJ09AAq7H0eXePLXvZq2F8/HygVodxfRmbDEGf05uilo
         q3Zg==
X-Forwarded-Encrypted: i=1; AFNElJ+YIf+cmgMGIOZ16EmPx5umYHpgub8/VO8jiuUcoabBy0tiUjUr7RBAywdbhbLG60XU94FM+8cGKfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPD3skNxgT+n02Nc9kfJMyP3L2OSoIa+7LLecQGPVGPYc7Elil
	tefzkyh+9sNfeYkE8Oyaqbbkpz9TfL3soY5/08Mn4FWTUzOdc45uZT1c
X-Gm-Gg: AeBDietp3r6ZPs0vusTHA5hEBn0m2VdIjTw0DeJFTHHjX75vFogAAQY/sCxT9et7b5Q
	z5nSH1PFsOmaKlcRryO26+SI6WBL5+NBBEOz7V/5A8eKH7Uhp0aoeHud+iSM9dcpWydlhlDAXX/
	Lzu3rahS9sLzDlazl75sN8v1bnBGSzfpD1vXaR1ckFBlPxfMri7kKwsT7qyyjThU2Whvyyrc81J
	5cm6gyaHyQwIgjTPZoDcNZmqrGi61AfanRGDWrkdacNJZDU9I1zaX+G6ndSA2tnpEdz9+IIFNXR
	Kj01Xo8SVJ9GiCaGFmSO+hPbk8+R0xie5kHNetNfRdT0J5TdBRb7iWudzQ/sUrZpRfGqVsKoydi
	wEAX0UwS0ZJcM3yQyiBD6fQYzHiq7nVxVV8+9i9ySbi/nGgVZb9Q152a9kBXsRtA2wZc9uE7YYM
	a96OPs7iqCICsb+9zOo3cxWYVPdI74oco=
X-Received: by 2002:a17:903:4405:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2ba78f50392mr16918435ad.6.1778038193400;
        Tue, 05 May 2026 20:29:53 -0700 (PDT)
Received: from mincom1 ([14.67.155.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7bf330a0sm8053895ad.31.2026.05.05.20.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 20:29:52 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH] usb: xhci: add AMD PROM21 xHCI hwmon support for temperature monitoring
Date: Wed,  6 May 2026 12:29:39 +0900
Message-ID: <20260506032939.92351-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A64284D5E37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[roeck-us.net,amd.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36997-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

AMD PROM21 xHCI controllers expose a temperature byte through a
vendor-specific index/data register pair in the xHCI PCI MMIO BAR region.
Add hwmon support for this, limited to temperature monitoring, and
initialize it from the xHCI PCI driver probe path.

The xhci-pci probe and remove paths call the PROM21 hwmon helpers only for
AMD 1022:43fd controllers. The hwmon read path selects the temperature
register through the vendor index register, reads the raw temperature byte
from the data register, and restores the previous index before returning.

No public AMD register reference is available for this value. The
conversion formula is derived from observed temperature readings:

  temp[C] = raw * 0.9066 - 78.624

This is not implemented as a standalone driver because the temperature
register belongs to the PROM21 xHCI PCI function, is accessed through the
xHCI BAR after the host controller is initialized, and should share that
device's lifetime and runtime PM. Keep the device-specific PROM21 code in a
separate helper called only from xhci-pci, while linking it into xhci-hcd
to match the existing xHCI object layout. The xhci-pci remove path
invalidates the helper before HCD teardown.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 drivers/usb/host/Kconfig             |  10 ++
 drivers/usb/host/Makefile            |   4 +
 drivers/usb/host/xhci-pci.c          |   9 +
 drivers/usb/host/xhci-prom21-hwmon.c | 241 +++++++++++++++++++++++++++
 drivers/usb/host/xhci-prom21-hwmon.h |  26 +++
 5 files changed, 290 insertions(+)
 create mode 100644 drivers/usb/host/xhci-prom21-hwmon.c
 create mode 100644 drivers/usb/host/xhci-prom21-hwmon.h

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 0a277a07cf70..da41ebc272b0 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -42,6 +42,16 @@ config USB_XHCI_PCI
 	depends on USB_PCI
 	default y
 
+config USB_XHCI_PCI_PROM21_HWMON
+	bool "AMD PROM21 xHCI temperature sensor support"
+	depends on USB_XHCI_PCI
+	depends on HWMON
+	help
+	  Say Y here to expose the AMD PROM21 xHCI temperature sensor
+	  through the hwmon subsystem. The sensor is accessed through a
+	  vendor-specific index/data register pair in the controller's PCI
+	  MMIO BAR and reports temperature only. If unsure, say N.
+
 config USB_XHCI_PCI_RENESAS
 	tristate "Support for additional Renesas xHCI controller with firmware"
 	depends on USB_XHCI_PCI
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index a07e7ba9cd53..22f141cb2af7 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -36,6 +36,10 @@ ifneq ($(CONFIG_USB_XHCI_SIDEBAND),)
 	xhci-hcd-y		+= xhci-sideband.o
 endif
 
+ifneq ($(CONFIG_USB_XHCI_PCI_PROM21_HWMON),)
+	xhci-hcd-y += xhci-prom21-hwmon.o
+endif
+
 obj-$(CONFIG_USB_PCI)	+= pci-quirks.o
 
 obj-$(CONFIG_USB_EHCI_HCD)	+= ehci-hcd.o
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..54713efc931f 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -18,6 +18,7 @@
 #include "xhci.h"
 #include "xhci-trace.h"
 #include "xhci-pci.h"
+#include "xhci-prom21-hwmon.h"
 
 #define SSIC_PORT_NUM		2
 #define SSIC_PORT_CFG2		0x880c
@@ -677,6 +678,10 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
 		pci_clear_and_set_config_dword(dev, 0xE0, 0, 1 << 22);
 
+	if (dev->vendor == PCI_VENDOR_ID_AMD &&
+	    dev->device == PCI_DEVICE_ID_AMD_PROM21_XHCI)
+		xhci_prom21_hwmon_init(xhci, dev);
+
 	return 0;
 
 put_usb3_hcd:
@@ -713,6 +718,10 @@ void xhci_pci_remove(struct pci_dev *dev)
 	xhci = hcd_to_xhci(pci_get_drvdata(dev));
 	set_power_d3 = xhci->quirks & XHCI_SPURIOUS_WAKEUP;
 
+	if (dev->vendor == PCI_VENDOR_ID_AMD &&
+	    dev->device == PCI_DEVICE_ID_AMD_PROM21_XHCI)
+		xhci_try_prom21_hwmon_invalidate(dev);
+
 	xhci->xhc_state |= XHCI_STATE_REMOVING;
 
 	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
diff --git a/drivers/usb/host/xhci-prom21-hwmon.c b/drivers/usb/host/xhci-prom21-hwmon.c
new file mode 100644
index 000000000000..5f71e72f4a90
--- /dev/null
+++ b/drivers/usb/host/xhci-prom21-hwmon.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD PROM21 xHCI Hwmon Implementation
+ * (only temperature monitoring is supported)
+ *
+ * This can be effectively used as the alternative chipset temperature monitor.
+ *
+ * Copyright (C) 2026 Jihong Min <hurryman2212@gmail.com>
+ */
+
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/math.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include "xhci.h"
+#include "xhci-prom21-hwmon.h"
+
+#define XHCI_PROM21_INDEX 0x3000
+#define XHCI_PROM21_DATA 0x3008
+#define XHCI_PROM21_TEMP_REG 0x0001e520
+
+#define XHCI_PROM21_HWMON_NAME "xhci_prom21"
+
+struct xhci_prom21_hwmon {
+	struct pci_dev *pdev;
+	void __iomem *regs;
+	bool removing;
+	struct mutex lock; /* protects removing and the index/data registers */
+};
+
+struct xhci_prom21_hwmon_devres {
+	struct xhci_prom21_hwmon *hwmon;
+};
+
+static void xhci_prom21_hwmon_invalidate(struct xhci_prom21_hwmon *hwmon)
+{
+	mutex_lock(&hwmon->lock);
+	hwmon->removing = true;
+	mutex_unlock(&hwmon->lock);
+}
+
+static void xhci_prom21_hwmon_devres_release(struct device *dev, void *res)
+{
+	struct xhci_prom21_hwmon_devres *devres = res;
+
+	/*
+	 * devm hwmon unregister runs after this lookup record is released.
+	 * Mark the data path closed first so any late sysfs read returns
+	 * without touching xHCI MMIO.
+	 */
+	xhci_prom21_hwmon_invalidate(devres->hwmon);
+}
+
+/*
+ * This is not a pure MMIO read. The PROM21 vendor data register is selected
+ * by temporarily writing XHCI_PROM21_TEMP_REG to the vendor index register.
+ * Keep the sequence short and restore the previous index before returning.
+ */
+static int
+xhci_prom21_read_temp_raw_restore_index(struct xhci_prom21_hwmon *hwmon,
+					u8 *raw)
+{
+	struct device *dev = &hwmon->pdev->dev;
+	u32 index;
+	u32 data;
+	int ret;
+
+	/*
+	 * xhci_try_prom21_hwmon_invalidate() uses the same lock before HCD
+	 * teardown. Keep runtime PM and MMIO inside the critical section so a
+	 * sysfs read cannot use the vendor register pair after remove starts.
+	 */
+	mutex_lock(&hwmon->lock);
+	if (hwmon->removing) {
+		mutex_unlock(&hwmon->lock);
+		return -ENODEV;
+	}
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		mutex_unlock(&hwmon->lock);
+		return ret;
+	}
+
+	index = readl(hwmon->regs + XHCI_PROM21_INDEX);
+	/* Select the PROM21 temperature register through the vendor index. */
+	writel(XHCI_PROM21_TEMP_REG, hwmon->regs + XHCI_PROM21_INDEX);
+	data = readl(hwmon->regs + XHCI_PROM21_DATA);
+	/* Restore the previous vendor index register value. */
+	writel(index, hwmon->regs + XHCI_PROM21_INDEX);
+	readl(hwmon->regs + XHCI_PROM21_INDEX);
+
+	/* Let xHCI PCI runtime PM coalesce repeated sysfs polling. */
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+	mutex_unlock(&hwmon->lock);
+
+	*raw = data & 0xff;
+	if (!*raw || *raw == 0xff)
+		return -ENODATA;
+
+	return 0;
+}
+
+static long xhci_prom21_raw_to_millicelsius(u8 raw)
+{
+	/*
+	 * No public AMD register reference is available for this value.
+	 * The scale was derived from observed PROM21 xHCI temperature readings:
+	 *  temp[C] = raw * 0.9066 - 78.624
+	 */
+	return DIV_ROUND_CLOSEST(raw * 9066, 10) - 78624;
+}
+
+static umode_t xhci_prom21_hwmon_is_visible(const void *drvdata,
+					    enum hwmon_sensor_types type,
+					    u32 attr, int channel)
+{
+	if (type != hwmon_temp || channel)
+		return 0;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static int xhci_prom21_hwmon_read(struct device *dev,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int channel, long *val)
+{
+	struct xhci_prom21_hwmon *hwmon = dev_get_drvdata(dev);
+	u8 raw;
+	int ret;
+
+	if (type != hwmon_temp || attr != hwmon_temp_input || channel)
+		return -EOPNOTSUPP;
+
+	ret = xhci_prom21_read_temp_raw_restore_index(hwmon, &raw);
+	if (ret)
+		return ret;
+
+	*val = xhci_prom21_raw_to_millicelsius(raw);
+	return 0;
+}
+
+static const struct hwmon_ops xhci_prom21_hwmon_ops = {
+	.is_visible = xhci_prom21_hwmon_is_visible,
+	.read = xhci_prom21_hwmon_read,
+};
+
+static const struct hwmon_channel_info *const xhci_prom21_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL,
+};
+
+static const struct hwmon_chip_info xhci_prom21_chip_info = {
+	.ops = &xhci_prom21_hwmon_ops,
+	.info = xhci_prom21_hwmon_info,
+};
+
+void xhci_prom21_hwmon_init(struct xhci_hcd *xhci, struct pci_dev *pdev)
+{
+	struct xhci_prom21_hwmon_devres *devres;
+	struct xhci_prom21_hwmon *hwmon;
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+	struct device *dev = &pdev->dev;
+	struct device *hwmon_dev;
+
+	if (!hcd->regs || hcd->rsrc_len < XHCI_PROM21_DATA + sizeof(u32)) {
+		dev_err(dev,
+			"AMD PROM21 hwmon unavailable: invalid MMIO resource\n");
+		return;
+	}
+
+	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
+	if (!hwmon) {
+		/* The allocator reports OOM; add PROM21 device context. */
+		dev_err(dev, "AMD PROM21 hwmon state unavailable\n");
+		return;
+	}
+
+	devres = devres_alloc(xhci_prom21_hwmon_devres_release, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres) {
+		dev_err(dev, "AMD PROM21 hwmon devres allocation failed\n");
+		return;
+	}
+
+	hwmon->pdev = pdev;
+	hwmon->regs = hcd->regs;
+	mutex_init(&hwmon->lock);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev,
+							 XHCI_PROM21_HWMON_NAME,
+							 hwmon,
+							 &xhci_prom21_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev)) {
+		devres_free(devres);
+		dev_err(dev, "AMD PROM21 hwmon registration failed: %pe\n",
+			hwmon_dev);
+		return;
+	}
+
+	/*
+	 * Store a private devres record so the device remove path can find this
+	 * state without adding PROM21-specific part to xhci-pci.
+	 */
+	devres->hwmon = hwmon;
+	devres_add(dev, devres);
+}
+EXPORT_SYMBOL_GPL(xhci_prom21_hwmon_init);
+
+void xhci_try_prom21_hwmon_invalidate(struct pci_dev *pdev)
+{
+	struct xhci_prom21_hwmon_devres *devres;
+
+	/*
+	 * This is called for every xHCI PCI device. Devices without PROM21
+	 * hwmon support simply have no matching helper devres entry.
+	 */
+	devres = devres_find(&pdev->dev, xhci_prom21_hwmon_devres_release, NULL,
+			     NULL);
+	if (!devres) {
+		dev_dbg(&pdev->dev, "AMD PROM21 hwmon state not found\n");
+		return;
+	}
+
+	xhci_prom21_hwmon_invalidate(devres->hwmon);
+}
+EXPORT_SYMBOL_GPL(xhci_try_prom21_hwmon_invalidate);
diff --git a/drivers/usb/host/xhci-prom21-hwmon.h b/drivers/usb/host/xhci-prom21-hwmon.h
new file mode 100644
index 000000000000..eca8db23c0ea
--- /dev/null
+++ b/drivers/usb/host/xhci-prom21-hwmon.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2026 Jihong Min <hurryman2212@gmail.com> */
+
+#ifndef XHCI_PROM21_HWMON_H
+#define XHCI_PROM21_HWMON_H
+
+#define PCI_DEVICE_ID_AMD_PROM21_XHCI 0x43fd
+
+struct pci_dev;
+struct xhci_hcd;
+
+#if IS_ENABLED(CONFIG_USB_XHCI_PCI_PROM21_HWMON)
+void xhci_prom21_hwmon_init(struct xhci_hcd *xhci, struct pci_dev *pdev);
+void xhci_try_prom21_hwmon_invalidate(struct pci_dev *pdev);
+#else
+static inline void xhci_prom21_hwmon_init(struct xhci_hcd *xhci,
+					  struct pci_dev *pdev)
+{
+}
+
+static inline void xhci_try_prom21_hwmon_invalidate(struct pci_dev *pdev)
+{
+}
+#endif
+
+#endif
-- 
2.53.0


