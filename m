Return-Path: <linux-usb+bounces-27651-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0350B47239
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 17:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD2D01B25AEE
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 15:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BAB2F0C44;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+iCzZly"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB267221DA5;
	Sat,  6 Sep 2025 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757173419; cv=none; b=cFQ+yZwXQAh4LKq3V96xqIZHHS8bwg4+KzL6Q2Bq69v9lhUI0xivcVAXhUEDwf8Y2Al1XxupiGFWmCd3LN9Vo5dmNij2ZFG8IhmoyeC6sLlYH7zpuEUmyNIGQWwLUzX9KIlQPz+3pwk6fSBqBVu9qmGik1y3+xhSG0FaracqSFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757173419; c=relaxed/simple;
	bh=IwSlnxJ2iq6EBFsK6qtAtYW5ioFRlILFFMPbZlRxlX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qiCkdFOt3WtZx4Pp0ja36bv3jiaAAnyv6puRITxMCBEW9f+cUWvm6oGKzSHnXAzyjCLgvIxGTaqYTwVUr6zR5ih6aKYavWJ/Gs1+Qj725kgYTjAwFG+ZH7LKnRfLFgkaqsoDaI6vjc0f/hiKEvfmGPlau/O+lGPLv1KOF1T12Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+iCzZly; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59EC3C4AF09;
	Sat,  6 Sep 2025 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757173419;
	bh=IwSlnxJ2iq6EBFsK6qtAtYW5ioFRlILFFMPbZlRxlX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N+iCzZlybG3lxFbOJUeEZOnutJZ4MfPOTSWPKeJu9ypAQEBgFMPWAdmR0X9c1JkOP
	 CtHTpTl/9zNU2sP6o2zfdTwbq/dNQbTacirCpw/2WnKoKUmMSaKTuVrJVTNoHQhCri
	 xeXmMYHZc/ZU1Mgvj3F9ZBPQDlCBckUeYCwe48uyGZZoia0VMJE4kEX5hCLo9DihpP
	 Xl1VkKWmSfqsQNkZZHtW/+uhUpmC3YZkAPV2zsCtPkXVzZ4d4OT6kZelmQ7MGX5Odc
	 Rkf0Xf+X5oZ5kVsTsJlVb9s8O3mT+OPykCQn4PDW+A/a28SVIgqdWNuXr7RykGnMlj
	 okKjAIRELIXZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC35CAC582;
	Sat,  6 Sep 2025 15:43:39 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 06 Sep 2025 15:43:16 +0000
Subject: [PATCH v2 03/22] usb: dwc3: glue: Allow more fine grained control
 over mode switches
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-atcphy-6-17-v2-3-52c348623ef6@kernel.org>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
In-Reply-To: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5254; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=IwSlnxJ2iq6EBFsK6qtAtYW5ioFRlILFFMPbZlRxlX4=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8aesDnPY2Ond928YnA9uuWW1bl/lYqLu3+/Zt9/kyfvy
 IrsBXpcHaUsDGIcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJzFnGyLDYkctWMFzeSmRX
 RL6f4oKJaeohC9xK/zdNdPtj8OvXgQCG/7kKQWFudh5ibxl4uQ6frqlwey4ofdDK7eV3zp9z772
 0ZAQA
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
 drivers/usb/dwc3/core.c   | 16 +++++++++++-----
 drivers/usb/dwc3/gadget.c |  2 ++
 drivers/usb/dwc3/glue.h   | 14 ++++++++++++++
 drivers/usb/dwc3/host.c   |  2 ++
 4 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 8002c23a5a02acb8f3e87b2662a53998a4cf4f5c..18056fac44c8732278a650ac2be8b493892c92dd 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -132,6 +132,7 @@ void dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
 		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i), reg);
 	}
 }
+EXPORT_SYMBOL_GPL(dwc3_enable_susphy);
 
 void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 {
@@ -157,6 +158,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 
 	dwc->current_dr_role = mode;
 }
+EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
 
 static void __dwc3_set_mode(struct work_struct *work)
 {
@@ -974,7 +976,7 @@ static void dwc3_clk_disable(struct dwc3 *dwc)
 	clk_disable_unprepare(dwc->bus_clk);
 }
 
-static void dwc3_core_exit(struct dwc3 *dwc)
+void dwc3_core_exit(struct dwc3 *dwc)
 {
 	dwc3_event_buffers_cleanup(dwc);
 	dwc3_phy_power_off(dwc);
@@ -982,6 +984,7 @@ static void dwc3_core_exit(struct dwc3 *dwc)
 	dwc3_clk_disable(dwc);
 	reset_control_assert(dwc->reset);
 }
+EXPORT_SYMBOL_GPL(dwc3_core_exit);
 
 static bool dwc3_core_is_valid(struct dwc3 *dwc)
 {
@@ -1327,7 +1330,7 @@ static void dwc3_config_threshold(struct dwc3 *dwc)
  *
  * Returns 0 on success otherwise negative errno.
  */
-static int dwc3_core_init(struct dwc3 *dwc)
+int dwc3_core_init(struct dwc3 *dwc)
 {
 	unsigned int		hw_mode;
 	u32			reg;
@@ -1527,6 +1530,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_core_init);
 
 static int dwc3_core_get_phy(struct dwc3 *dwc)
 {
@@ -2298,9 +2302,11 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
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
index 25db36c63951bf5654f4bf5a98d7073a028364cd..7b92eb8c4ccf118b81f27afaf3f31bf56e1b6f74 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4794,6 +4794,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 err0:
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_gadget_init);
 
 /* -------------------------------------------------------------------------- */
 
@@ -4812,6 +4813,7 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
 	dma_free_coherent(dwc->sysdev, sizeof(*dwc->ep0_trb) * 2,
 			  dwc->ep0_trb, dwc->ep0_trb_addr);
 }
+EXPORT_SYMBOL_GPL(dwc3_gadget_exit);
 
 int dwc3_gadget_suspend(struct dwc3 *dwc)
 {
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index 2efd00e763be4fc51911f32d43054059e61fb43a..633268c76fe4c7fdc312c9705dfa7cf7ccf3544c 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -15,16 +15,30 @@
  * @res: resource for the DWC3 core mmio region
  * @ignore_clocks_and_resets: clocks and resets defined for the device should
  *		be ignored by the DWC3 core, as they are managed by the glue
+ * @skip_core_init_mode: skip the finial initialization of the target mode, as
+ *		it must be managed by the glue
  */
 struct dwc3_probe_data {
 	struct dwc3 *dwc;
 	struct resource *res;
 	bool ignore_clocks_and_resets;
+	bool skip_core_init_mode;
 };
 
 int dwc3_core_probe(const struct dwc3_probe_data *data);
 void dwc3_core_remove(struct dwc3 *dwc);
 
+int dwc3_core_init(struct dwc3 *dwc);
+void dwc3_core_exit(struct dwc3 *dwc);
+
+int dwc3_host_init(struct dwc3 *dwc);
+void dwc3_host_exit(struct dwc3 *dwc);
+int dwc3_gadget_init(struct dwc3 *dwc);
+void dwc3_gadget_exit(struct dwc3 *dwc);
+
+void dwc3_enable_susphy(struct dwc3 *dwc, bool enable);
+void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy);
+
 int dwc3_runtime_suspend(struct dwc3 *dwc);
 int dwc3_runtime_resume(struct dwc3 *dwc);
 int dwc3_runtime_idle(struct dwc3 *dwc);
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



