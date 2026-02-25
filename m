Return-Path: <linux-usb+bounces-33700-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIlTD0TznmnoXwQAu9opvQ
	(envelope-from <linux-usb+bounces-33700-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 14:04:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4782D197C1A
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 14:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3E9530977C9
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 13:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E73D3B8BD5;
	Wed, 25 Feb 2026 13:03:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4FF39280A
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772024618; cv=none; b=gmkI+R+bagOcIxPDF8eRw430DF4FniQLMKBqJ/BNztx8Pv76xqU3owc21hd6//Dr55x1qApnowd2hEjLXVkpvY0WhI5l0rjtYm4ovrDvJqUaqAnLlBWBJ1ysG4aKiLd7o0OX5r7NMS7T/TECLwVnQRkusRBxghTbYhLrAfItVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772024618; c=relaxed/simple;
	bh=y/uLbv5D/mQi37VvTzrGUlI3ARJUg6Gxn+QYY+hzbQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaA8OrGvXuevkomgSZHe7/E10s234620g5o74HZrrMINVX5NzOLj1BCjlfSMLEmiiDA81rx31XZEMrHcaH2Mzt0lOt1M/LYhipin67HZKQLGOgM9QpJ3xmeIqHWPcMnA3UFE+OnlY9X7h2aHPHfqyK5QtiY6juxZRbjgWBF3k5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 607A51E2ABE9F;
	Wed, 25 Feb 2026 14:03:34 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v2 2/2] dt-bindings: usb: dwc3: Add property to insert delay before TxValid.
Date: Wed, 25 Feb 2026 14:03:23 +0100
Message-ID: <20260225130323.24606-3-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225130323.24606-1-ingo.rohloff@lauterbach.com>
References: <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
 <20260225130323.24606-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1772024614443
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33700-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[lauterbach.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[ingo.rohloff@lauterbach.com,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:url,lauterbach.com:mid,lauterbach.com:email]
X-Rspamd-Queue-Id: 4782D197C1A
X-Rspamd-Action: no action

The Microchip USB3340x ULPI PHY requires a delay when switching to the
high-speed transmitter. See:
    http://ww1.microchip.com/downloads/en/DeviceDoc/80000645A.pdf
    Module 2 "Device Enumeration Failure with Link IP Systems"

The new property "snps,enable-usb2-transceiver-delay" tells the controller
to insert this required delay.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 .../devicetree/bindings/usb/snps,dwc3-common.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..6a90c08713cc 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -207,6 +207,13 @@ properties:
       avoid -EPROTO errors with usbhid on some devices (Hikey 970).
     type: boolean
 
+  snps,enable-usb2-transceiver-delay:
+    description:
+      When set, inserts a delay before the assertion of the TxValid signal
+      during a HS Chirp. This fixes USB high-speed negotiation when using
+      a USB 3440x ULPI PHY.
+    type: boolean
+
   snps,gfladj-refclk-lpm-sel-quirk:
     description:
       When set, run the SOF/ITP counter based on ref_clk.
-- 
2.52.0


