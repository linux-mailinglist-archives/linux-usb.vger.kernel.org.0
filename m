Return-Path: <linux-usb+bounces-37033-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMK2KGen+2lXewMAu9opvQ
	(envelope-from <linux-usb+bounces-37033-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 22:41:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 899084E0406
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 22:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C592300D4CF
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 20:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9173B0AC8;
	Wed,  6 May 2026 20:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sIAhXE2E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6433AEF55
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 20:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100060; cv=none; b=cKt5/XxbkiExV7qItiuehlUcbe0iN5BczB5l4WPc8VNeeutl+92B5H0rSnYpMmnmS0HoZS4F/25IgC7bg1lXUZhCKxHyE+XIXXkuTsR2Qtk4Gx/n5nADR9X6nm0lswfVhMQCzryD7Z2dgCknAR5iSaYG4iaZ4AnwoSNbEDIULxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100060; c=relaxed/simple;
	bh=cFKQjt8T+pjOhqtQj8/ANTKn1vEOyQPW7HwNFdkUD8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGCgfb4HTsr1UbFvG/wm1xuWzvShQlq6iK5uCPjhUDAo7qyiQWyroaqlboGgcN3ruohH4sNpRXczpQnDSu5KRxl7z1nCECT0GxYcIFB1cj/k6bRGNCyqqO5lFOLxXGAbrPKGShGxOH0zY6UJ1JM2+mSF/SBOesa3MsWl3nQ0H2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sIAhXE2E; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f8b60e485so16014b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 13:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778100057; x=1778704857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/xhBC2yDLtcniZNvV30ZXs3oGQXCB20pz+9iXnKQhA=;
        b=sIAhXE2E3Ac9HdoEAmlIqyJp1UfVCNvw4dnFVCSeb+7th2yUWk+LwhwqY0Z/xUWvNo
         PbVZbFINWr2LFRo0nL9HIlMva/qPHVbW1jp3487Uu9zgyBB4fv4BPyFaBlj4m2FV3/GS
         Y+Rp4U8SqHTihJRzpBy8qJvwhlK+OSYIheS6qXsn+J42Pww1fjRggEIoO0+sRQw7FeH4
         EdzNCE5pMtsPnFJRBOzEBhGC2zdllEhZmY4FxoK8U4t4f2aExWu1tYpPvizZt8PuuH96
         u7io7xk7UmdU8pNPpa7xKHviM7BKU+o++jWXF3q7G2rP2rJ7lvD+zkIU2Ypf4kLFJCjZ
         4o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778100057; x=1778704857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4/xhBC2yDLtcniZNvV30ZXs3oGQXCB20pz+9iXnKQhA=;
        b=N418FDpTpbvYbE72fV9KV6zGqul0IPzm2vLwEraFnU8CAUoVOab41HZacatxAt6ArU
         ERf2v+mkNBwIb4EouquxhQZ9Vu7LxKYn7Wm4xxS0gHn78F3DbbcHBArSbHaA0Ycxdk7i
         T+ymTep+7bnnre3WHrWZLz+3Bz4II3lHjKFNtN2/N4jeUZ3BWwXhADrNUAkDXkvHNZFL
         k1+d1q0wqspDf+2F7DK27sV6I20F409vT87B6kqzW2sfSNaIib4rtPayu5cjXPeXNdZW
         If2dO6AEm/6aEOLACqcAAFgQu7QbyMs4RJBIW4RDBvm3MnDhrweN83833Pr8WQQyNGxf
         HnlA==
X-Forwarded-Encrypted: i=1; AFNElJ8GMcVL2tM7QZPhfG9SydN2gPu9pIZJENRslRoJ6RQDAwjYaytxTesskCH+kwsTUpmpEO76qPBhVpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZJ96xJ+suku57hpzzpT9fLCTWtkHdcFcRoCYvfWOjJXBAk+AB
	bl5ahJbchWFI71ejJ2wfTvIvtzPbb6m+UMJ5tYpOsmHFpL2Kg7ZjsyK3
X-Gm-Gg: AeBDieumSEsoga1ePeKkNECxaWxIUEiJCYwxDwY5pHSK1qzULsvQvurMcKf8r2+cN4j
	05I0QdpPFqrWAiAa8RzapQWtF6gLacEHeGtAIP/PTo8/IyFH0LILazNMI50NzZSOpxpIRBycDWJ
	R/8/PDB72+4dT51OeBCFJc8ynVXXTHe7pcaDem/ahI5FlFMQ7JKFosllRrvqtBVdUoF6Ikhzwic
	5HGYRt72RLLls9amWcX6UDCkk3+UvGrUCNK32lkpyirzgamQe1MngG3m0onPgLQ6QYweh/BG8HX
	If9QxGxXxeKyjK3v0dapdfuulL5LwpH9TUga4fpR6Cc7PI/MlZPUxXPU0EJA29zpYtrIsVqtzUP
	4zoPkyvyDQnu39PV37415QM4XUuSvwzI20xAVRXcU5yGlEhygF7sWEeWUSaj4CqdNhW9rMYyF81
	WeV88VkE9Rpw2yu6aHTiJB1Ok1R/yiU04=
X-Received: by 2002:a05:6a00:ad09:b0:82c:7f08:8826 with SMTP id d2e1a72fcca58-83a5b9d81f1mr4699695b3a.17.1778100056914;
        Wed, 06 May 2026 13:40:56 -0700 (PDT)
Received: from mincom1 ([14.67.155.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm7952185b3a.3.2026.05.06.13.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 13:40:56 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v2 1/2] usb: xhci-pci: add generic auxiliary device interface
Date: Thu,  7 May 2026 05:40:33 +0900
Message-ID: <3f26994ebb5f0e4e653a8108a9626bc793148679.1778099627.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778099627.git.hurryman2212@gmail.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com> <cover.1778099627.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 899084E0406
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[roeck-us.net,lwn.net,linuxfoundation.org,amd.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37033-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Some xHCI PCI controllers expose controller-specific functionality that is
not part of generic xHCI operation and is better handled by optional child
drivers in other subsystems. Add a small auxiliary device registration path
for selected xHCI PCI controllers.

The initial table creates an xhci_pci.hwmon auxiliary device for AMD
1022:43fd controllers. Store the created auxiliary device in devres so the
xhci-pci remove path destroys it before HCD teardown. Use a
PCI-domain-qualified id so auxiliary device names remain unique across PCI
domains.

This keeps xhci-pci responsible only for publishing selected controller
functions while allowing subsystem-specific drivers to bind through the
auxiliary bus.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 drivers/usb/host/Kconfig    |  10 ++++
 drivers/usb/host/xhci-pci.c | 114 ++++++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 0a277a07cf70..e0c2c7ac5c97 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -42,6 +42,16 @@ config USB_XHCI_PCI
 	depends on USB_PCI
 	default y
 
+config USB_XHCI_PCI_AUXDEV
+	bool "xHCI PCI auxiliary device support"
+	depends on USB_XHCI_PCI
+	select AUXILIARY_BUS
+	help
+	  This enables xHCI PCI support for registering auxiliary devices
+	  for selected controllers. It is used by optional child drivers
+	  that bind to xHCI PCI controller-specific functionality through
+	  the auxiliary bus.
+
 config USB_XHCI_PCI_RENESAS
 	tristate "Support for additional Renesas xHCI controller with firmware"
 	depends on USB_XHCI_PCI
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..1ab27d2182eb 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -8,6 +8,8 @@
  * Some code borrowed from the Linux EHCI driver.
  */
 
+#include <linux/auxiliary_bus.h>
+#include <linux/device/devres.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -103,6 +105,114 @@ static int xhci_pci_run(struct usb_hcd *hcd);
 static int xhci_pci_update_hub_device(struct usb_hcd *hcd, struct usb_device *hdev,
 				      struct usb_tt *tt, gfp_t mem_flags);
 
+#if IS_ENABLED(CONFIG_USB_XHCI_PCI_AUXDEV)
+static const struct {
+	struct pci_device_id id;
+	const char *aux_dev_name;
+} pci_ids_have_aux[] = {
+	{
+		.id = { PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x43fd) }, /* PROM21 xHCI */
+		.aux_dev_name = "hwmon",
+	},
+	{ /* end: all zeroes */ }
+};
+
+struct xhci_pci_aux_devres {
+	struct auxiliary_device *auxdev;
+};
+
+static bool xhci_pci_aux_match_id(const struct pci_device_id *id,
+				  const struct pci_dev *pdev)
+{
+	if (id->vendor != PCI_ANY_ID && id->vendor != pdev->vendor)
+		return false;
+	if (id->device != PCI_ANY_ID && id->device != pdev->device)
+		return false;
+	if (id->subvendor != PCI_ANY_ID &&
+	    id->subvendor != pdev->subsystem_vendor)
+		return false;
+	if (id->subdevice != PCI_ANY_ID &&
+	    id->subdevice != pdev->subsystem_device)
+		return false;
+
+	return !((id->class ^ pdev->class) & id->class_mask);
+}
+
+static const char *xhci_pci_aux_dev_name(struct pci_dev *pdev)
+{
+	int i;
+
+	for (i = 0; pci_ids_have_aux[i].aux_dev_name; i++) {
+		if (xhci_pci_aux_match_id(&pci_ids_have_aux[i].id, pdev))
+			return pci_ids_have_aux[i].aux_dev_name;
+	}
+
+	return NULL;
+}
+
+static void xhci_pci_aux_devres_release(struct device *dev, void *res)
+{
+	struct xhci_pci_aux_devres *devres = res;
+
+	if (devres->auxdev)
+		auxiliary_device_destroy(devres->auxdev);
+}
+
+static void xhci_pci_try_add_aux_device(struct pci_dev *pdev)
+{
+	struct xhci_pci_aux_devres *devres;
+	struct auxiliary_device *auxdev;
+	const char *aux_dev_name;
+
+	aux_dev_name = xhci_pci_aux_dev_name(pdev);
+	if (!aux_dev_name)
+		return;
+
+	devres = devres_alloc(xhci_pci_aux_devres_release, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres) {
+		dev_warn(&pdev->dev,
+			 "failed to allocate auxiliary device state\n");
+		return;
+	}
+
+	auxdev = auxiliary_device_create(&pdev->dev, KBUILD_MODNAME,
+					 aux_dev_name, NULL,
+					 (pci_domain_nr(pdev->bus) << 16) |
+						 pci_dev_id(pdev));
+	if (!auxdev) {
+		devres_free(devres);
+		dev_warn(&pdev->dev, "failed to add %s auxiliary device\n",
+			 aux_dev_name);
+		return;
+	}
+
+	devres->auxdev = auxdev;
+	devres_add(&pdev->dev, devres);
+}
+
+static void xhci_pci_try_remove_aux_device(struct pci_dev *pdev)
+{
+	struct xhci_pci_aux_devres *devres;
+
+	devres = devres_find(&pdev->dev, xhci_pci_aux_devres_release, NULL,
+			     NULL);
+	if (!devres || !devres->auxdev)
+		return;
+
+	auxiliary_device_destroy(devres->auxdev);
+	devres->auxdev = NULL;
+}
+#else
+static inline void xhci_pci_try_add_aux_device(struct pci_dev *pdev)
+{
+}
+
+static inline void xhci_pci_try_remove_aux_device(struct pci_dev *pdev)
+{
+}
+#endif
+
 static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 	.reset = xhci_pci_setup,
 	.start = xhci_pci_run,
@@ -677,6 +787,8 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
 		pci_clear_and_set_config_dword(dev, 0xE0, 0, 1 << 22);
 
+	xhci_pci_try_add_aux_device(dev);
+
 	return 0;
 
 put_usb3_hcd:
@@ -713,6 +825,8 @@ void xhci_pci_remove(struct pci_dev *dev)
 	xhci = hcd_to_xhci(pci_get_drvdata(dev));
 	set_power_d3 = xhci->quirks & XHCI_SPURIOUS_WAKEUP;
 
+	xhci_pci_try_remove_aux_device(dev);
+
 	xhci->xhc_state |= XHCI_STATE_REMOVING;
 
 	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
-- 
2.53.0


