Return-Path: <linux-usb+bounces-29233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBD3BD552A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 19:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CF65427B66
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 16:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0EC30DEBE;
	Mon, 13 Oct 2025 16:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUZg/wn8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2BE30CDB0;
	Mon, 13 Oct 2025 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760371438; cv=none; b=VnsfkxsRnNkN1TB8dO3TvmRSvd8k0fzg8gRJngKMSWFjkMiV5JbZFWsVFmtRrJWXEqNSpirnM/y9vAIJ1egj/mEVEmDgm69BOoGfwoKJplviaye37FAWtK1utPrARGQjkY0OYQlklOdqRGiNYq4vA9Mr7HoYLSIedbbLXy1ByH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760371438; c=relaxed/simple;
	bh=T61ohRMVKcvJNe8i5gn6zOUU4mTTUUvrMUaTCo42RLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eKB3UFMhoQ1NFP6j0qcZToTqccG7Bh1y7HZRCgxB0g292fZPgSrB/v3gsSbTTzUzxmzbGOOhzgODFB92CfYe1ndNsBmGDPhKA6zOnzISFf5lm5fOQVMPJm1kjp51C98KEzBqsR6ZcxDXWQa1rJqi3tW8GCN2IY6nvXy0aFqY2wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUZg/wn8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E55AC19421;
	Mon, 13 Oct 2025 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760371438;
	bh=T61ohRMVKcvJNe8i5gn6zOUU4mTTUUvrMUaTCo42RLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UUZg/wn8fz+NyfwnSpmD1TlswIbkWGsu/DndpG2qvtWObwhzYJj7LFXMs2hv3Y4zh
	 GPeiXhGo2k4lDVZ0yqkyFZu0UKEPC/2E4UqZJPwwvaATGdlc4jGX957eIhyFfIDiF1
	 +bn9+x75578/b2G5/yX9+UFlU26jyTx9aKOayWdcr6DFxkfCmg2hjpJWKFftAqUZdB
	 bnqrF9V7hRFOikhLyOSClzT2t/lTpoKwAgrzXldTDlXHh4hy4NSGHMSh23mwipATBT
	 7CfAofe2YW0xWBQwYjGRwS6xmNPMxLvyxEeV1MPBVh5lgjrEVOVWaPmCLjNtyXAlL3
	 5EbBjq6u/Cy8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14975CCD192;
	Mon, 13 Oct 2025 16:03:58 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Mon, 13 Oct 2025 16:03:28 +0000
Subject: [PATCH 4/5] usb: dwc3: glue: Allow more fine grained control over
 mode switches
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-b4-aplpe-dwc3-v1-4-12a78000c014@kernel.org>
References: <20251013-b4-aplpe-dwc3-v1-0-12a78000c014@kernel.org>
In-Reply-To: <20251013-b4-aplpe-dwc3-v1-0-12a78000c014@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9617; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=T61ohRMVKcvJNe8i5gn6zOUU4mTTUUvrMUaTCo42RLE=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8ZbpZdxZaLazW5vZun8PX7uGG/YeubX9ofTzmqqhd+/J
 HCh6bt6RykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAirf8Y/hnln87coJIZPKlY
 n3+9z2dB4dAbx+wNDxUUX3yfX8a6fRsjw7/AKoeO+2+vKLCeLQz/v0+71u7qWl2O2xx95ppZYRw
 v2QE=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

We need fine grained control over mode switched on the DWC3 controller
present on Apple Silicon. Export core, host and gadget init and exit,
ptrcap and susphy control functions. Also introduce an additional
parameter to probe_data that allows to skip the final initialization
step that would bring up host or gadget mode.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/dwc3/core.c   |  16 +++++--
 drivers/usb/dwc3/gadget.c |   2 +
 drivers/usb/dwc3/glue.h   | 116 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/host.c   |   2 +
 4 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ae140c356295c03df3982ff4fa95f8638296e52d..526c0453b99aad79d99a842797e52d9290456d76 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -132,6 +132,7 @@ void dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
 		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i), reg);
 	}
 }
+EXPORT_SYMBOL_GPL(dwc3_enable_susphy);
 
 void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 {
@@ -158,6 +159,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 	dwc->current_dr_role = mode;
 	trace_dwc3_set_prtcap(mode);
 }
+EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
 
 static void __dwc3_set_mode(struct work_struct *work)
 {
@@ -975,7 +977,7 @@ static void dwc3_clk_disable(struct dwc3 *dwc)
 	clk_disable_unprepare(dwc->bus_clk);
 }
 
-static void dwc3_core_exit(struct dwc3 *dwc)
+void dwc3_core_exit(struct dwc3 *dwc)
 {
 	dwc3_event_buffers_cleanup(dwc);
 	dwc3_phy_power_off(dwc);
@@ -983,6 +985,7 @@ static void dwc3_core_exit(struct dwc3 *dwc)
 	dwc3_clk_disable(dwc);
 	reset_control_assert(dwc->reset);
 }
+EXPORT_SYMBOL_GPL(dwc3_core_exit);
 
 static bool dwc3_core_is_valid(struct dwc3 *dwc)
 {
@@ -1328,7 +1331,7 @@ static void dwc3_config_threshold(struct dwc3 *dwc)
  *
  * Returns 0 on success otherwise negative errno.
  */
-static int dwc3_core_init(struct dwc3 *dwc)
+int dwc3_core_init(struct dwc3 *dwc)
 {
 	unsigned int		hw_mode;
 	u32			reg;
@@ -1528,6 +1531,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_core_init);
 
 static int dwc3_core_get_phy(struct dwc3 *dwc)
 {
@@ -2299,9 +2303,11 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 	dwc3_check_params(dwc);
 	dwc3_debugfs_init(dwc);
 
-	ret = dwc3_core_init_mode(dwc);
-	if (ret)
-		goto err_exit_debugfs;
+	if (!data->skip_core_init_mode) {
+		ret = dwc3_core_init_mode(dwc);
+		if (ret)
+			goto err_exit_debugfs;
+	}
 
 	pm_runtime_put(dev);
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 6f18b4840a25d176abb4134581ad0ce68ba19ffc..1f67fb6aead5725c2e7b553c635eab985c9e1d48 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4810,6 +4810,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 err0:
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_gadget_init);
 
 /* -------------------------------------------------------------------------- */
 
@@ -4828,6 +4829,7 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
 	dma_free_coherent(dwc->sysdev, sizeof(*dwc->ep0_trb) * 2,
 			  dwc->ep0_trb, dwc->ep0_trb_addr);
 }
+EXPORT_SYMBOL_GPL(dwc3_gadget_exit);
 
 int dwc3_gadget_suspend(struct dwc3 *dwc)
 {
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index 7f326cff12458901904d4c32f62ed9357d0f6e3b..376e7aa74281c13bfb3a85dc033622bcff8d2acb 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -15,11 +15,14 @@
  * @res: resource for the DWC3 core mmio region
  * @ignore_clocks_and_resets: clocks and resets defined for the device should
  *		be ignored by the DWC3 core, as they are managed by the glue
+ * @skip_core_init_mode: Skip the finial initialization of the target mode, as
+ *		it must be managed by the glue
  */
 struct dwc3_probe_data {
 	struct dwc3 *dwc;
 	struct resource *res;
 	bool ignore_clocks_and_resets;
+	bool skip_core_init_mode;
 };
 
 /**
@@ -60,4 +63,117 @@ int dwc3_pm_resume(struct dwc3 *dwc);
 void dwc3_pm_complete(struct dwc3 *dwc);
 int dwc3_pm_prepare(struct dwc3 *dwc);
 
+
+/* All of the following functions must only be used with skip_core_init_mode */
+
+/**
+ * dwc3_core_init - Initialize DWC3 core hardware
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Configures and initializes the core hardware, usually done by dwc3_core_probe.
+ * This function is provided for platforms that use skip_core_init_mode and need
+ * to finalize the core initialization after some platform-specific setup.
+ * It must only be called when using skip_core_init_mode and before
+ * dwc3_host_init or dwc3_gadget_init.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int dwc3_core_init(struct dwc3 *dwc);
+
+/**
+ * dwc3_core_exit - Shut down DWC3 core hardware
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Disables and cleans up the core hardware state. This is usually handled
+ * internally by dwc3 and must only be called when using skip_core_init_mode
+ * and only after dwc3_core_init. Afterwards, dwc3_core_init may be called
+ * again.
+ */
+void dwc3_core_exit(struct dwc3 *dwc);
+
+/**
+ * dwc3_host_init - Initialize host mode operation
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Initializes the controller for USB host mode operation, usually done by
+ * dwc3_core_probe or from within the dwc3 USB role switch callback.
+ * This function is provided for platforms that use skip_core_init_mode and need
+ * to finalize the host initialization after some platform-specific setup.
+ * It must not be called before dwc3_core_init or when skip_core_init_mode is
+ * not used. It must also not be called when gadget or host mode has already
+ * been initialized.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int dwc3_host_init(struct dwc3 *dwc);
+
+/**
+ * dwc3_host_exit - Shut down host mode operation
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Disables and cleans up host mode resources, usually done by
+ * the dwc3 USB role switch callback before switching controller mode.
+ * It must only be called when skip_core_init_mode is used and only after
+ * dwc3_host_init.
+ */
+void dwc3_host_exit(struct dwc3 *dwc);
+
+/**
+ * dwc3_gadget_init - Initialize gadget mode operation
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Initializes the controller for USB gadget mode operation, usually done by
+ * dwc3_core_probe or from within the dwc3 USB role switch callback. This
+ * function is provided for platforms that use skip_core_init_mode and need to
+ * finalize the gadget initialization after some platform-specific setup.
+ * It must not be called before dwc3_core_init or when skip_core_init_mode is
+ * not used. It must also not be called when gadget or host mode has already
+ * been initialized.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int dwc3_gadget_init(struct dwc3 *dwc);
+
+/**
+ * dwc3_gadget_exit - Shut down gadget mode operation
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Disables and cleans up gadget mode resources, usually done by
+ * the dwc3 USB role switch callback before switching controller mode.
+ * It must only be called when skip_core_init_mode is used and only after
+ * dwc3_gadget_init.
+ */
+void dwc3_gadget_exit(struct dwc3 *dwc);
+
+/**
+ * dwc3_enable_susphy - Control SUSPHY status for all USB ports
+ * @dwc: Pointer to DWC3 controller context
+ * @enable: True to enable SUSPHY, false to disable
+ *
+ * Enables or disables the USB3 PHY SUSPEND and USB2 PHY SUSPHY feature for
+ * all available ports.
+ * This is usually handled by the dwc3 core code and should only be used
+ * when skip_core_init_mode is used and the glue layer needs to manage SUSPHY
+ * settings itself, e.g., due to platform-specific requirements during mode
+ * switches.
+ */
+void dwc3_enable_susphy(struct dwc3 *dwc, bool enable);
+
+/**
+ * dwc3_set_prtcap - Set the USB controller PRTCAP mode
+ * @dwc: Pointer to DWC3 controller context
+ * @mode: Target mode, must be one of DWC3_GCTL_PRTCAP_{HOST,DEVICE,OTG}
+ * @ignore_susphy: If true, skip disabling the SUSPHY and keep the current state
+ *
+ * Updates PRTCAP of the controller and current_dr_role inside the dwc3
+ * structure. For DRD controllers, this also disables SUSPHY unless explicitly
+ * told to skip via the ignore_susphy parameter.
+ *
+ * This is usually handled by the dwc3 core code and should only be used
+ * when skip_core_init_mode is used and the glue layer needs to manage mode
+ * transitions itself due to platform-specific requirements. It must be called
+ * with the correct mode before calling dwc3_host_init or dwc3_gadget_init.
+ */
+void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy);
+
 #endif
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index e77fd86d09cf0a36161c20ad3c83f10e67099775..cf6512ed17a69134e6ca1b884f76c1439693fab1 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -220,6 +220,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 	platform_device_put(xhci);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_host_init);
 
 void dwc3_host_exit(struct dwc3 *dwc)
 {
@@ -230,3 +231,4 @@ void dwc3_host_exit(struct dwc3 *dwc)
 	platform_device_unregister(dwc->xhci);
 	dwc->xhci = NULL;
 }
+EXPORT_SYMBOL_GPL(dwc3_host_exit);

-- 
2.34.1



