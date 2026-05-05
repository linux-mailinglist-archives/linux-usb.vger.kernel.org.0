Return-Path: <linux-usb+bounces-36921-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOhAHdex+Wld/AIAu9opvQ
	(envelope-from <linux-usb+bounces-36921-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 11:01:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D11254C90C8
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 11:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B05F1305763A
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 08:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435113E023E;
	Tue,  5 May 2026 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZpwvvYt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52B03B38A1;
	Tue,  5 May 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971319; cv=none; b=UDr6cZtjjpKW/EPwat1ij5KyHvwP9lh5ue3zfUnGctXTzSdqusw/85zUaURHpS8sQwu+BRL9lIrnko/lNH3gSg4dpWxgQeu4mDCX4sKaqlWnCgVtIymjiJ9zAKZFlwMUCtpKCshDhk3CUe3Z2ew4NZlNiyTbpTh4PjEmQyv7aBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971319; c=relaxed/simple;
	bh=QRd2iY8szZT5giyAzvp//9cY5blWqFzY5LFz5fYZY28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VzMjPLS3IguHu+xFUsZ8my6dJ09DmSMhAbHS5ifXetwy2yd08OKvyVPShvjKy8BNQp8bdjO4Lwe4jQsIf4Uuz8NUVftVXUaIQgmiK/+XD6NU2cDP8LzDCN7Oq5CE1PfMID6ayTlXquNN8jXsRAKFz5f/9YTEQsE8lMBmhmoZeVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZpwvvYt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EA0C2BCB9;
	Tue,  5 May 2026 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777971319;
	bh=QRd2iY8szZT5giyAzvp//9cY5blWqFzY5LFz5fYZY28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KZpwvvYtibFBP3nplr6Z8ukwM7AsFTmjWRjzkz6wb9wo/hTYW95dKZpfghL7yc3kt
	 mWpYWf2V4o8oMlomymh3jx5+2GCajILChRQQ8CgqOPU10+JhB9kLF8VRdF7sLlA3Y8
	 XIf6b9UqhK+rUC2sVrtjJNbR4YVUYJvu/THlM05wr2Sv4FwB7IPcM44GwamdngLYkU
	 1a7UsgSxKney6JQd28Tf702AA/nbfofzn26OITAbhJv6k0Ak68vSvpTiSyrMugyWcS
	 TuokHyNHeKcTyXxRuz4JQElfLnaCmQYKdok51bj+6AucUrqFuGyQ7DVSPS1kmh1auC
	 5Yhtk7F+JLNqQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 05 May 2026 10:55:05 +0200
Subject: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
In-Reply-To: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777971309; l=3871;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Cm9Uwo6XZtB97T5drOJvRuyeGYTlUiuLuWKPUAEW8M0=;
 b=yHM/wjI8Xf1st9tzPnJ560SnIfcERELAfSKOCaaHQAhviatKhy+b553/oe9EsG/lW0I8GxN5/
 0YsA2JVtr35C2gqD1IC9R9kEPARVBiwDTebkZR8Yw36QE7OVJn400Um
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: D11254C90C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-36921-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Thunderbolt framework relies on the USB core to create device links
for tunneled ports, so that the USB3 controller is only kept
runtime-resumed for the duration of the tunneling. This depends on
first knowing whether a connection is tunneled or native.

Add the logic to handle that for DWC3 controllers.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 12 ++++++++++++
 drivers/usb/dwc3/core.h | 18 ++++++++++++++++++
 drivers/usb/dwc3/host.c | 12 ++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 65213896de99..7cec4911e278 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -162,6 +162,18 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 }
 EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
 
+enum usb_link_tunnel_mode dwc3_link_tunnel_mode(struct dwc3 *dwc, u8 port)
+{
+	/* Prior versions had no CIO support */
+	if (!DWC3_VER_IS_WITHIN(DWC31, 191A, ANY))
+		return USB_LINK_NATIVE;
+
+	if (dwc3_readl(dwc, DWC3_CIOCTRL(port)) & DWC3_CIOCTRL_CIO_EN)
+		return USB_LINK_TUNNELED;
+
+	return USB_LINK_NATIVE;
+}
+
 static void __dwc3_set_mode(struct work_struct *work)
 {
 	struct dwc3 *dwc = work_to_dwc(work);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e0dee9d28740..9594829de6c7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -179,6 +179,11 @@
 #define DWC3_OEVTEN		0xcc0C
 #define DWC3_OSTS		0xcc10
 
+/* CIO regs */
+#define DWC3_CIO_BASE(n)	(0xcd20 + ((n) * 0x30))
+#define DWC3_CIOCTRL(n)		(DWC3_CIO_BASE(n) + 0x00)
+#define DWC3_CIOCTRL_CIO_EN	BIT(0)
+
 #define DWC3_LLUCTL(n)		(0xd024 + ((n) * 0x80))
 
 /* Bit fields */
@@ -1309,6 +1314,7 @@ struct dwc3 {
 #define DWC31_REVISION_170A	0x3137302a
 #define DWC31_REVISION_180A	0x3138302a
 #define DWC31_REVISION_190A	0x3139302a
+#define DWC31_REVISION_191A	0x3139312a
 #define DWC31_REVISION_200A	0x3230302a
 
 #define DWC32_REVISION_ANY	0x0
@@ -1653,11 +1659,23 @@ static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);
+
+/**
+ * dwc3_link_tunnel_mode - Check whether the link is tunneled over TBT/USB4
+ * @dwc: Pointer to DWC3 controller context
+ * @port: 0-based port index
+ *
+ * Returns: USB_LINK_TUNNELED if tunneled, USB_LINK_NATIVE if not, or
+ *          when the controller does not have USB4 capabilities.
+ */
+enum usb_link_tunnel_mode dwc3_link_tunnel_mode(struct dwc3 *dwc, u8 port);
 #else
 static inline int dwc3_host_init(struct dwc3 *dwc)
 { return 0; }
 static inline void dwc3_host_exit(struct dwc3 *dwc)
 { }
+static inline enum usb_link_tunnel_mode dwc3_link_tunnel_mode(struct dwc3 *dwc, u8 port)
+{ return USB_LINK_UNKNOWN; }
 #endif
 
 #if IS_ENABLED(CONFIG_USB_DWC3_GADGET) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 96b588bd08cd..eb03b079696e 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -77,8 +77,20 @@ static void dwc3_xhci_plat_start(struct usb_hcd *hcd)
 	dwc3_enable_susphy(dwc, true);
 }
 
+static enum usb_link_tunnel_mode dwc3_xhci_tunnel_mode(struct usb_hcd *hcd, int portnum)
+{
+	struct platform_device *pdev;
+	struct dwc3 *dwc;
+
+	pdev = to_platform_device(hcd->self.controller);
+	dwc = dev_get_drvdata(pdev->dev.parent);
+
+	return dwc3_link_tunnel_mode(dwc, portnum);
+}
+
 static const struct xhci_plat_priv dwc3_xhci_plat_quirk = {
 	.plat_start = dwc3_xhci_plat_start,
+	.tunnel_mode = dwc3_xhci_tunnel_mode,
 };
 
 static void dwc3_host_fill_xhci_irq_res(struct dwc3 *dwc,

-- 
2.54.0


