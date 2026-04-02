Return-Path: <linux-usb+bounces-35898-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP73J2h6zmmMnwYAu9opvQ
	(envelope-from <linux-usb+bounces-35898-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 16:17:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0218638A58F
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 16:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66D963076529
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 14:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39F93E92B3;
	Thu,  2 Apr 2026 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="higlNs3w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5301F3E95A4;
	Thu,  2 Apr 2026 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139013; cv=none; b=iDeMfMfrSdyOlKiwxYIIQBgXvOdd6q+EVdIxLoV01P1zjy3tBMJ8waD1uZbhxyu/bd+fH4x2+IoGdDXOlEkH+nWP6euzgH4Nbmf4EeE4RMQ0MmdfjISYZPehLeZnusvpJj0Hcn+w2eA1m4BYDfSF18I8zYHKEeOUZG7fXEs0im8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139013; c=relaxed/simple;
	bh=9rygsFStSqwxqf/ZbeYWLaP6bxNDxMSW4ZcaE9u0bRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o/HhlG+ubRB4bOZBG72bL5druciAdVH1HMuE7Yo0vLRktzb5y/Tj9e7VJ5mGuj3/0bfuEKpWdRft74o5mA2bv1ExAcTEpkTkyS81EPdkGcL4akNvquwSqbQ7JcHU09Q2z99bKMjOqW6T/5y7tIvhcca5vOIOSlasymfZWNcHnmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=higlNs3w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91ADDC2BCB2;
	Thu,  2 Apr 2026 14:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775139013;
	bh=9rygsFStSqwxqf/ZbeYWLaP6bxNDxMSW4ZcaE9u0bRU=;
	h=From:To:Cc:Subject:Date:From;
	b=higlNs3wYOEts15h6BSlG9gqllemqOTsOUUsacZRy6viApfUd+EWS2a5AAN3a/rwA
	 tYl5ue6TsyZ9hl0RnDGBKHIuBWWcjxoSwYJX5RI0TVETn2tgY7ML0pJeLx2RuHbyhP
	 P/F+FoYCvpyG5LiW07Gdqm6ndM0phUpQkMs1OsFfRxMZgsEkxw5NVnI0RXl2d3lwiu
	 fdnqXZ872/wztYQBauVLIctfx/rspUO6CR4vnXFLxs3iTdE7twDz1wDEQoNWTxIPHe
	 KoTQshgnKUR03ofvhvTvIkgQUB9ReSacdXexnqWZnWU2FwiCwP39EAUJQ6c3bmeC98
	 IEQT7xhNGHqqQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Roger Quadros <rogerq@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: cdns3: attempt to fix Kconfig dependencies
Date: Thu,  2 Apr 2026 16:09:55 +0200
Message-Id: <20260402141008.2691819-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35898-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: 0218638A58F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

The way that dependencies between host and gadget mode, as well as cdns3
and cdnsp were handled was rather fragile before commit 6076388ca1ed
("usb: cdns3: Add USBSSP platform driver support").

After those changes, I get randconfig build failures:

arm-linux-gnueabi-ld: drivers/usb/cdns3/cdnsp-gadget.o: in function `__cdnsp_gadget_init':
cdnsp-gadget.c:(.text+0x12da): undefined reference to `cdns_drd_gadget_on'
arm-linux-gnueabi-ld: drivers/usb/cdns3/cdnsp-gadget.o: in function `cdnsp_gadget_pullup':
cdnsp-gadget.c:(.text+0x3030): undefined reference to `cdns_clear_vbus'
arm-linux-gnueabi-ld: cdnsp-gadget.c:(.text+0x3138): undefined reference to `cdns_set_vbus'
arm-linux-gnueabi-ld: drivers/usb/cdns3/cdnsp-gadget.o: in function `cdnsp_gadget_exit':
cdnsp-gadget.c:(.text+0xe0): undefined reference to `cdns_drd_gadget_off'

and I see additional configurations that are broken. The main problem
here is that the 'common' module links against both host and gadget
support if they are enabled, but there are insufficient protections
agains it being built-in if only one of them is built-in and the other
is in a loadable module, causing link failures.

The use of IS_REACHABLE() in gadget-export.h works around a similar
problem if one of cdns3 and cdnsp is built-in but the other one is
=m. This one is worse because instead of a clear link failure, the
logic just makes it not work at all despite support being enabled.

To improve this mess, throw out both the Makefile hacks and the
IS_REACHABLE() hack and replace these with regular Kconfig dependencies
that ensure each driver is only enabled when its dependencies are there,
as we do in most other drivers. The main downside here is that there is no
good way to have built-in gadget support on cdn3 along with USB=m. Fixing
this part proper would require cleaning up the code to turn the 'common'
parts into a library module that only gets called by the other drivers
but does not interact with either host or gadget support itself.

Another problem that is not solved by this patch is the way that
platform specific glue logic in this driver relies on having
a soc specific device as the parent of a generic child, instead of
the specific driver just calling into a common helper module.
This may be impossible to fix without breaking the DT bindings.

Fixes: 6076388ca1ed ("usb: cdns3: Add USBSSP platform driver support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
TBH, I would be more comfortable with reverting 6076388ca1ed altogether
and asking for a new version with the proper fixups included along
with more testing for the next merge window.

My patch has seen some fairly light build testing at this point and
is clearly an improvement over what is in linux-next, but there is
still a risk that I missed some other corner cases.
---
 drivers/usb/cdns3/Kconfig         | 26 +++++++++++++++++++++-----
 drivers/usb/cdns3/Makefile        | 17 +++++------------
 drivers/usb/cdns3/gadget-export.h |  4 ++--
 3 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index 97fa84dddbca..07ed694e10b8 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -1,6 +1,7 @@
 config USB_CDNS_SUPPORT
 	tristate "Cadence USB Support"
 	depends on USB_SUPPORT && (USB || USB_GADGET) && HAS_DMA
+	depends on USB || !USB
 	select USB_XHCI_PLATFORM if USB_XHCI_HCD
 	select USB_ROLE_SWITCH
 	help
@@ -10,12 +11,24 @@ config USB_CDNS_SUPPORT
 
 config USB_CDNS_HOST
 	bool
+	depends on USB=y || USB=USB_CDNS_SUPPORT
+
+config CONFIG_USB_CDNS_PLATFORM
+	tristate "Cadence USB3 generic platform support"
+	depends on USB_CDNSP || USB_CDNS3
+	depends on USB_CDNSP || !USB_CDNSP
+	depends on USB_CDNS3 || !USB_CDNS3
+	help
+	  The platform driver support is needed on any SoC integrating
+	  a variant of the Cadence USB3 or USBSSP dual-role controllers,
+	  e.g. the TI K3 or NXP i.MX series of SoCs.
 
 if USB_CDNS_SUPPORT
 
 config USB_CDNS3
 	tristate "Cadence USB3 Dual-Role Controller"
 	depends on USB_CDNS_SUPPORT
+	select USB_CDNS_HOST if USB_CDNS3_HOST
 	help
 	  Say Y here if your system has a Cadence USB3 dual-role controller.
 	  It supports: dual-role switch, Host-only, and Peripheral-only.
@@ -23,8 +36,9 @@ config USB_CDNS3
 if USB_CDNS3
 
 config USB_CDNS3_GADGET
-	bool "Cadence USB3 device controller"
+	tristate "Cadence USB3 device controller"
 	depends on USB_GADGET=y || USB_GADGET=USB_CDNS3
+	depends on USB_CDNS_SUPPORT
 	help
 	  Say Y here to enable device controller functionality of the
 	  Cadence USBSS-DEV driver.
@@ -34,8 +48,7 @@ config USB_CDNS3_GADGET
 
 config USB_CDNS3_HOST
 	bool "Cadence USB3 host controller"
-	depends on USB=y || USB=USB_CDNS3
-	select USB_CDNS_HOST
+	depends on USB=y || USB=USB_CDNS_SUPPORT
 	help
 	  Say Y here to enable host controller functionality of the
 	  Cadence driver.
@@ -57,6 +70,7 @@ config USB_CDNS3_PCI_WRAP
 config USB_CDNS3_TI
 	tristate "Cadence USB3 support on TI platforms"
 	depends on ARCH_K3 || COMPILE_TEST
+	depends on USB_CDNS_PLATFORM
 	default USB_CDNS3
 	help
 	  Say 'Y' or 'M' here if you are building for Texas Instruments
@@ -67,6 +81,7 @@ config USB_CDNS3_TI
 config USB_CDNS3_IMX
 	tristate "Cadence USB3 support on NXP i.MX platforms"
 	depends on ARCH_MXC || COMPILE_TEST
+	depends on USB_CDNS_PLATFORM
 	default USB_CDNS3
 	help
 	  Say 'Y' or 'M' here if you are building for NXP i.MX
@@ -77,6 +92,7 @@ config USB_CDNS3_IMX
 config USB_CDNS3_STARFIVE
 	tristate "Cadence USB3 support on StarFive SoC platforms"
 	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on USB_CDNS_PLATFORM
 	help
 	  Say 'Y' or 'M' here if you are building for StarFive SoCs
 	  platforms that contain Cadence USB3 controller core.
@@ -91,6 +107,7 @@ endif # USB_CDNS3
 config USB_CDNSP
 	tristate "Cadence USBSSP Dual-Role Controller"
 	depends on USB_CDNS_SUPPORT
+	select USB_CDNS_HOST if USB_CDNSP_HOST
 	help
 	  Say Y here if your system has a Cadence USBSSP dual-role controller.
 	  It supports: dual-role switch, Host-only, and Peripheral-only.
@@ -115,8 +132,7 @@ config USB_CDNSP_GADGET
 
 config USB_CDNSP_HOST
 	bool "Cadence USBSSP host controller"
-	depends on USB=y || USB=USB_CDNSP
-	select USB_CDNS_HOST
+	depends on USB=y || USB=USB_CDNS_SUPPORT
 	help
 	  Say Y here to enable host controller functionality of the
 	  Cadence driver.
diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index 63484f145bb9..f1e00ab3d729 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -5,32 +5,25 @@ CFLAGS_cdnsp-trace.o				:= -I$(src)
 
 cdns-usb-common-y				:= core.o drd.o
 
-ifeq ($(CONFIG_USB),m)
-obj-m						+= cdns-usb-common.o
-obj-m						+= cdns3-plat.o
-else
 obj-$(CONFIG_USB_CDNS_SUPPORT)			+= cdns-usb-common.o
-obj-$(CONFIG_USB_CDNS_SUPPORT)			+= cdns3-plat.o
-endif
+
+obj-$(CONFIG_USB_CDNS_PLATFORM)			+= cdns3-plat.o
 
 cdns-usb-common-$(CONFIG_USB_CDNS_HOST) 	+= host.o
 
 # For CDNS3 gadget
-ifneq ($(CONFIG_USB_CDNS3_GADGET),)
 cdns3-y						:= cdns3-gadget.o cdns3-ep0.o
 cdns3-$(CONFIG_TRACING)				+= cdns3-trace.o
-obj-$(CONFIG_USB_CDNS3)				+= cdns3.o
-endif
+obj-$(CONFIG_USB_CDNS3_GADGET)			+= cdns3.o
+
 obj-$(CONFIG_USB_CDNS3_PCI_WRAP)		+= cdns3-pci-wrap.o
 obj-$(CONFIG_USB_CDNS3_TI)			+= cdns3-ti.o
 obj-$(CONFIG_USB_CDNS3_IMX)			+= cdns3-imx.o
 obj-$(CONFIG_USB_CDNS3_STARFIVE)		+= cdns3-starfive.o
 
 # For CDNSP gadget
-ifneq ($(CONFIG_USB_CDNSP_GADGET),)
 cdnsp-y						:= cdnsp-ring.o cdnsp-gadget.o \
 						   cdnsp-mem.o cdnsp-ep0.o
 cdnsp-$(CONFIG_TRACING)				+= cdnsp-trace.o
-obj-$(CONFIG_USB_CDNSP)				+= cdnsp.o
-endif
+obj-$(CONFIG_USB_CDNSP_GADGET)			+= cdnsp.o
 obj-$(CONFIG_USB_CDNSP_PCI)			+= cdnsp-pci.o
diff --git a/drivers/usb/cdns3/gadget-export.h b/drivers/usb/cdns3/gadget-export.h
index 0cb600e2b5d2..c37b6269b001 100644
--- a/drivers/usb/cdns3/gadget-export.h
+++ b/drivers/usb/cdns3/gadget-export.h
@@ -10,7 +10,7 @@
 #ifndef __LINUX_CDNS3_GADGET_EXPORT
 #define __LINUX_CDNS3_GADGET_EXPORT
 
-#if defined(CONFIG_USB_CDNSP_GADGET) && IS_REACHABLE(CONFIG_USB_CDNSP)
+#if IS_ENABLED(CONFIG_USB_CDNSP_GADGET)
 
 int cdnsp_gadget_init(struct cdns *cdns);
 #else
@@ -22,7 +22,7 @@ static inline int cdnsp_gadget_init(struct cdns *cdns)
 
 #endif /* CONFIG_USB_CDNSP_GADGET */
 
-#if defined(CONFIG_USB_CDNS3_GADGET) && IS_REACHABLE(CONFIG_USB_CDNS3)
+#if IS_ENABLED(CONFIG_USB_CDNS3_GADGET)
 
 int cdns3_gadget_init(struct cdns *cdns);
 #else
-- 
2.39.5


