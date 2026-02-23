Return-Path: <linux-usb+bounces-33547-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKAoFdQ5nGlCBgQAu9opvQ
	(envelope-from <linux-usb+bounces-33547-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:28:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F301757F0
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBB96304527D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 11:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930C6361DCF;
	Mon, 23 Feb 2026 11:27:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E203361643
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 11:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846069; cv=none; b=W88SwilOCrfekkyY00Z64LeBU5+qM0NxIOHg8GrPlMwb1V/nFr4031dBJGdI8wNJHoL7xZUVA7mnRD3959+1MKIRRqN9Y0Zgk+p7pyTBq6TKGS4C26vH+bKsVPdSPJ8zYnzXmCK7sQfZDfqmBgOWNUZVYEOn+yMcTsC2CQxaDpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846069; c=relaxed/simple;
	bh=X99J4EYETaDcZTtHLmSJ/pCmG96o3v4GJbDAz+8Lxno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FjVI7Cy8n1YPSpzWttlANYoiAOPJ3nr/9Oe7vv0oERudBGH86jGJhLgnhF0x5w17v5Nun9H7nhO/847uAz/YBcBbMdmv3etVlitGItTq7WlnxQh4PD74icSDIPfNkPNwp8EeMTdz2hDOXtfdZxyAQS2+R09+SY9ocGZniyJFwLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vuU6C-0007VH-9v; Mon, 23 Feb 2026 12:27:36 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 23 Feb 2026 12:27:36 +0100
Subject: [PATCH v5 3/4] dt-bindings: usb: usb-device: add usb hub port
 vbus-supply suppport
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-v6-16-topic-usb-onboard-dev-v5-3-28d3018a8026@pengutronix.de>
References: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
In-Reply-To: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Matthias Kaehlcke <mka@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33547-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.912];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.2:email,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: C6F301757F0
X-Rspamd-Action: no action

Some PCB designs don't use the dedicated USB hub port power control GPIO
to control the port VBUS supply. Instead host managed GPIOs are used to
control the VBUS supply.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index 09fceb469f10525e9dcdb91435b142b0d21964b8..c9abdbea0e5348dc25f8f9484142089cf60bd514 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -53,6 +53,12 @@ properties:
   "#size-cells":
     const: 0
 
+  vbus-supply:
+    description: USB hub port VBUS supply.
+      The host managed regulator which controls the USB hub port VBUS. This
+      regulator is only required if the hub internal control signals aren't
+      used to control the VBUS regulators.
+
 patternProperties:
   "^interface@[0-9a-f]{1,2}(,[0-9a-f]{1,2})$":
     type: object
@@ -85,6 +91,7 @@ additionalProperties: true
 
 examples:
   # hub connected to port 1
+  # device connected to hub port 2, vbus controlled by ext. regulator
   # device connected to port 2
   # device connected to port 3
   #    interface 0 of configuration 1
@@ -99,6 +106,14 @@ examples:
         hub@1 {
             compatible = "usb5e3,608";
             reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            device@2 {
+                compatible = "usb123,4321";
+                reg = <2>;
+                vbus-supply = <&reg_5v0_vbus>;
+            };
         };
 
         device@2 {

-- 
2.47.3


