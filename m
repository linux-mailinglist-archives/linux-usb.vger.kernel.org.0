Return-Path: <linux-usb+bounces-33659-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHS4DGyynWndRAQAu9opvQ
	(envelope-from <linux-usb+bounces-33659-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 15:15:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA401883C3
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 15:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19675301488F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 14:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C0E39E6F6;
	Tue, 24 Feb 2026 14:14:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605E3369982
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942498; cv=none; b=YgbmPPfUd8dgvTCb2TYyIwESZsFsaJ1aGZ2scuoKt+OG1mVENrMDX7yNhdIvy6fDsJRR2E/R9eZjfW61q9yjxk4E01/4qoh4JdwjLcXw/6f1LJFGfk2AzHrCydEifdZ5JY862gDi0ssCUbmxF2xvWq6vbkeWMq7bbf3eSqgZo4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942498; c=relaxed/simple;
	bh=1v6oe5frg772UT0hGnTgM7UB4v3DcFbsGu7hjDGuDk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lVTGfOgQC4ox/ts46S6LQsAH1AFkQObEfuZlpLh9C+lSrkl1FhbukTT5KZnCR89Auo5OlBREfpNDb0n15W6V6w2CzBe00w8gfadMakkYTu/TuVRlsSyr5hVXRdS3JrTD7Y1y/8uqlCPkO++stG7HLWo+IBBFMl8pRUyd770qNGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id D08D21DC3F2BE;
	Tue, 24 Feb 2026 15:14:46 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via "snps,enable_xcvrdly_quirk"
Date: Tue, 24 Feb 2026 15:14:38 +0100
Message-ID: <20260224141438.39524-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1771942486903
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33659-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[lauterbach.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[ingo.rohloff@lauterbach.com,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lauterbach.com:mid,lauterbach.com:email,microchip.com:url]
X-Rspamd-Queue-Id: 5BA401883C3
X-Rspamd-Action: no action

The Microchip USB3340x ULPI PHY requires a delay when switching to the
high-speed transmitter.

Original description is/was in Xilinx Wiki under
"USB Debug Guide for Zynq UltraScale+ and Versal Devices"

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/dwc3/core.c | 20 ++++++++++++++++++++
 drivers/usb/dwc3/core.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 161a4d58b2ce..92ad701a9340 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -777,6 +777,23 @@ static int dwc3_hs_phy_setup(struct dwc3 *dwc, int index)
 	if (dwc->ulpi_ext_vbus_drv)
 		reg |= DWC3_GUSB2PHYCFG_ULPIEXTVBUSDRV;
 
+	/*
+	 * Fixes High-speed negotiation issue with USB3340, see:
+	 *    http://ww1.microchip.com/downloads/en/DeviceDoc/80000645A.pdf
+	 *    "Device Enumeration Failure with Link IP Systems"
+	 * According to documentation on the Internet,
+	 * DWC3_GUSB2PHYCFG_XCVRDLY:
+	 *    Adds a delay between the assertion of the
+	 *    ULPI Transceiver Select signal (for HS) and
+	 *    the assertion of the TxValid signal during a HS Chirp.
+	 *
+	 * This bit also needs to be set again when the device comes out
+	 * of hibernation, this is currently not an issue since hibernation
+	 * is not enabled.
+	 */
+	if (dwc->enable_xcvrdly_quirk)
+		reg |= DWC3_GUSB2PHYCFG_XCVRDLY;
+
 	dwc3_writel(dwc, DWC3_GUSB2PHYCFG(index), reg);
 
 	return 0;
@@ -1855,6 +1872,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->dis_split_quirk = device_property_read_bool(dev,
 				"snps,dis-split-quirk");
 
+	dwc->enable_xcvrdly_quirk = device_property_read_bool(dev,
+				"snps,enable_xcvrdly_quirk");
+
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a35b3db1f9f3..41418f3f85e1 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -302,6 +302,7 @@
 #define DWC3_GUSB2PHYCFG_SUSPHY		BIT(6)
 #define DWC3_GUSB2PHYCFG_ULPI_UTMI	BIT(4)
 #define DWC3_GUSB2PHYCFG_ENBLSLPM	BIT(8)
+#define DWC3_GUSB2PHYCFG_XCVRDLY	BIT(9)
 #define DWC3_GUSB2PHYCFG_PHYIF(n)	(n << 3)
 #define DWC3_GUSB2PHYCFG_PHYIF_MASK	DWC3_GUSB2PHYCFG_PHYIF(1)
 #define DWC3_GUSB2PHYCFG_USBTRDTIM(n)	(n << 10)
@@ -1403,6 +1404,7 @@ struct dwc3 {
 	unsigned		dis_metastability_quirk:1;
 
 	unsigned		dis_split_quirk:1;
+	unsigned		enable_xcvrdly_quirk:1;
 	unsigned		async_callbacks:1;
 	unsigned		sys_wakeup:1;
 	unsigned		wakeup_configured:1;
-- 
2.52.0


