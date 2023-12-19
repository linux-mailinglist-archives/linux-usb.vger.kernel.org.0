Return-Path: <linux-usb+bounces-4382-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A4F819337
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 23:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83285B25E96
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 22:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9872F4BA9C;
	Tue, 19 Dec 2023 22:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKJVj4Iz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B856040C08;
	Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B0C4C116B9;
	Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703023396;
	bh=ZxiWPYjJNlwW0ZoUuTe7kh12NGJyutpG6BCChPYhLqM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VKJVj4Izenm3fSSO97yRxDQOQN0qwh7a4oiChirWK9a9NR1DOIYLaCNiaCBS55NuD
	 rgJFBnkYqeph05C5GVKLVwYYRSh8sA4kSuuAbB9UTpzZO/5+xUxo4y3oDC7anUo7op
	 HWUPRmVUdA1ETWGPkRz0+fhHMAvSfziCDWbk5K8jYfiVdbgputLzhd1ztkiBRseyzX
	 07AOVYP0cyRP3GX6v5Zlvf/NidVOBMAHCCxS4r4hkqYUYvovjmaX4YsO3AehXJzsMX
	 Jz7Xl1L/486uV3XwlEmYQvd+QqHk8z/AF0gxPgDBylHdTaVhnTLApqyqKBKferscEC
	 i5U0sPpIN3dOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A002C46CCD;
	Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:29 +0100
Subject: [PATCH 24/27] sparc32: Drop config SPARC_LEON
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-24-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
Cc: Helge Deller <deller@gmx.de>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, sparclinux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=4414;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=yguXtsAztu+g6VS1K/Ca2l8EKOhlR4mQ7eIgq+RPLKI=; =?utf-8?q?b=3DFP777UvBaxp1?=
 =?utf-8?q?SiwfpSSLW9EamkRu8kUaC20yflmyMorWFySES8L/kN5EdEsA08eskSUyRrG/P6uB?=
 OnxjkQroDmvjESJ2jBLsRzy++IbHaFfo7eXfbWhpMLGU7cRhkzYF
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
Reply-To: <sam@ravnborg.org>

From: Sam Ravnborg <sam@ravnborg.org>

The only support sparc32 CPU is LEON, so there is no need for a
config option to select it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/Kconfig                   | 27 +++++++++------------------
 arch/sparc/configs/sparc32_defconfig |  1 -
 drivers/usb/host/Kconfig             |  2 +-
 drivers/usb/host/ehci-hcd.c          |  4 ++--
 drivers/usb/host/uhci-hcd.c          |  2 +-
 5 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 7ae304bab2d8..0fc52c3c7487 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -9,6 +9,10 @@ config 64BIT
 
 	  Say yes to build a 64-bit kernel - formerly known as sparc64
 	  Say no to build a 32-bit kernel - formerly known as sparc
+	  The 32-bit kernel target the synthesizable LEON SPARC processor.
+	  LEON is a part of the GRLIB collection of IP cores that are
+	  distributed under GPL. GRLIB can be downloaded from www.gaisler.com.
+	  You can download a sparc-linux cross-compilation toolchain at www.gaisler.com.
 
 config SPARC
 	bool
@@ -60,6 +64,10 @@ config SPARC32
 	select HAVE_UID16
 	select LOCK_MM_AND_FIND_VMA
 	select OLD_SIGACTION
+	select USB_EHCI_BIG_ENDIAN_MMIO
+	select USB_EHCI_BIG_ENDIAN_DESC
+	select USB_UHCI_BIG_ENDIAN_MMIO
+	select USB_UHCI_BIG_ENDIAN_DESC
 	select ZONE_DMA
 
 config SPARC64
@@ -348,22 +356,6 @@ config SERIAL_CONSOLE
 
 	  If unsure, say N.
 
-config SPARC_LEON
-	bool "Sparc Leon processor family"
-	depends on SPARC32
-	select USB_EHCI_BIG_ENDIAN_MMIO
-	select USB_EHCI_BIG_ENDIAN_DESC
-	select USB_UHCI_BIG_ENDIAN_MMIO
-	select USB_UHCI_BIG_ENDIAN_DESC
-	help
-	  If you say Y here if you are running on a SPARC-LEON processor.
-	  The LEON processor is a synthesizable VHDL model of the
-	  SPARC-v8 standard. LEON is  part of the GRLIB collection of
-	  IP cores that are distributed under GPL. GRLIB can be downloaded
-	  from www.gaisler.com. You can download a sparc-linux cross-compilation
-	  toolchain at www.gaisler.com.
-
-if SPARC_LEON
 menu "U-Boot options"
 
 config UBOOT_LOAD_ADDR
@@ -394,7 +386,6 @@ config UBOOT_ENTRY_ADDR
 	 Kernel.
 
 endmenu
-endif
 
 endmenu
 
@@ -416,7 +407,7 @@ config SUN_LDOMS
 
 config LEON_PCI
 	bool
-	depends on PCI && SPARC_LEON
+	depends on PCI && SPARC32
 	default y
 
 config SPARC_GRPCI1
diff --git a/arch/sparc/configs/sparc32_defconfig b/arch/sparc/configs/sparc32_defconfig
index 71273fc578bf..dfd326f20876 100644
--- a/arch/sparc/configs/sparc32_defconfig
+++ b/arch/sparc/configs/sparc32_defconfig
@@ -10,7 +10,6 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_RD_ZSTD is not set
 CONFIG_SMP=y
 CONFIG_HZ_100=y
-CONFIG_SPARC_LEON=y
 CONFIG_SUN_OPENPROMFS=y
 CONFIG_SUN_OPENPROMIO=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 4448d0ab06f0..c5f94c70482f 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -595,7 +595,7 @@ config USB_UHCI_HCD
 
 config USB_UHCI_SUPPORT_NON_PCI_HC
 	bool
-	default y if (SPARC_LEON || USB_UHCI_PLATFORM)
+	default y if (SPARC32 || USB_UHCI_PLATFORM)
 
 config USB_UHCI_PLATFORM
 	bool
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 802bfafb1012..5011bc8348bb 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1329,7 +1329,7 @@ MODULE_LICENSE ("GPL");
 #include "ehci-xilinx-of.c"
 #endif
 
-#ifdef CONFIG_SPARC_LEON
+#ifdef CONFIG_SPARC32
 #include "ehci-grlib.c"
 #endif
 
@@ -1343,7 +1343,7 @@ static struct platform_driver * const platform_drivers[] = {
 #ifdef CONFIG_XPS_USB_HCD_XILINX
 	&ehci_hcd_xilinx_of_driver,
 #endif
-#ifdef CONFIG_SPARC_LEON
+#ifdef CONFIG_SPARC32
 	&ehci_grlib_driver,
 #endif
 };
diff --git a/drivers/usb/host/uhci-hcd.c b/drivers/usb/host/uhci-hcd.c
index fd2408b553cf..7cb820963988 100644
--- a/drivers/usb/host/uhci-hcd.c
+++ b/drivers/usb/host/uhci-hcd.c
@@ -846,7 +846,7 @@ static const char hcd_name[] = "uhci_hcd";
 #define	PCI_DRIVER		uhci_pci_driver
 #endif
 
-#ifdef CONFIG_SPARC_LEON
+#ifdef CONFIG_SPARC32
 #include "uhci-grlib.c"
 #define PLATFORM_DRIVER		uhci_grlib_driver
 #endif

-- 
2.34.1


