Return-Path: <linux-usb+bounces-33744-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL0zJlJuoGkHjwQAu9opvQ
	(envelope-from <linux-usb+bounces-33744-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 17:01:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA241A9672
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 17:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1574033F4F30
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 15:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B76410D1D;
	Thu, 26 Feb 2026 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jg2XWEuc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E1B410D04
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120383; cv=pass; b=eN8QO4lZs5sJjqUcnI6fnCaCPsinSoHk8Gdggaym3zuoKYMr/X2c62vRKkdUE+Nv0+OwDs+i0GpdHxkZEAuM1UW1GWW7xkbRuH+nomu8qL+qKFU58HdKxUIjVk9GfNgMiMTvhuAkSzaCbpbPlBffrly/E0NhHoJ8RcjCLyT0JK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120383; c=relaxed/simple;
	bh=R2v8n89f0c78cnd/TtY73AodxGwbn9p0TmvotZHshjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdK34yp6EvZPuU5Fwx7i7P2Rr7zj75JJtBxc9RetatQWm8sf1Qr1CZ7xqJ8T8HvhURJ6GFribNM5waVktsK4/6WIRNBjDN0X3ADVYQaVsklW861zm2FVMDAqelVuQAdCNsnJXqbX75FL8wtGFLjwSl8SfVU0HhpnHQcMTHWp53o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jg2XWEuc; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=NjYbXwIQ8PduPQUva1l1y0HvqHmC0aGyA7hHhqtwLEI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120365;
 b=FLyVh/ZzITMzo5yWy1yFJLMzqgYrRsGCOt5E11dBZoj2lkLkPBoyD7r7t0WgtptRFyjNCRO4
 6o49hA+irkg06jmKtommpAAjj/ywFlmh39JSv3+1IgEzT8i7oDzt/uewU9Xnfz4L7D3+FFDbdUF
 UGpR8/2denYp1zsSCF/2N0jhK/El7X2j2MdOu12t/f4Kno9psDBMnaz+9zQVU51XlPGyZGgQQZF
 f+ZAarNRPDm/ugrPnGRaN8FRNCkjreY/HA8fsaNmPwmlThvQ3FuSK0ZncLGp8CuJkiIpVBTDatG
 ehkeG/Cd7TLdfNIngv/3Q59CwWulJPj+4JHrny33CEFmQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120365;
 b=LsL7QiysH4T8mW4WAnvLi94863ICsUENJF5B72quruKfkWeJc3UFtH3g0pjD491Ptx8UBouC
 Txp/Bi6Qk2lJIUNthAgL2JMKbW1c4NWNH7PVFd7/2B9Cy8DNN9k4S/BTVdmKqfNpQ4YGijAvSK7
 l5iPgGOIfmT/BXgiG2Vc3+U6k6Bx/qXTe1gP7y9Un0aGC3IthO5P4kdprlLz4b7DxYkidPZ1hVW
 cq/5dda1zF6pA29XK+FnXh1aYjyzRO47hBflL64Nw6atWTUQlOnLW6xqA/NTvNPQjNY/jyQmmcY
 pxM5AlEGtPImWS5WE7xOQ3vDNtHG10h8PGJb9NMSpSbng==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 26 Feb 2026 16:39:25 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 37772A41123;
	Thu, 26 Feb 2026 16:39:06 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@tq-group.com>
Subject: [PATCH v3 3/5] dt-bindings: arm: fsl: add bindings for TQMa8x
Date: Thu, 26 Feb 2026 16:38:52 +0100
Message-ID: <20260226153859.665901-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-usb@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fMFxR36f9z3yXpX
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:568237be82892e00f1be80080e855268
X-cloud-security:scantime:1.642
DKIM-Signature: a=rsa-sha256;
 bh=NjYbXwIQ8PduPQUva1l1y0HvqHmC0aGyA7hHhqtwLEI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120364; v=1;
 b=jg2XWEucy9oNZNg+X6M1c0pAiJAw/ezeWFugONocYm3PicpJ59Tg8C6lt+YFY8CLqxbWQ9bQ
 dn1Oj9h3blrDYeK8U+OsvO5nVWwDjY3vCVMLrWRC5rdQeGUEyfkjN+Ub8KAZa2Bh7JuOBcNEuKk
 lkRG/Z1MTtweIIlagDp3h8eXPy6xq1BoNDnd+sjmAADr7RqTvPGg8nVojNlHIjoBGd/mQWko69n
 i+fG13lod7B6DQzSsGooMgeUEBhMIUxkRklqBP8mQz3EoT1D6okMy6gUjL+zicMHOuwUU/04tDY
 WlIiXH6INAHxPwFoGJFlDP2e0B0sAz0BVZkOT3z0D7OFQ==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RSPAMD_URIBL_FAIL(0.00)[ew.tq-group.com:query timed out,tq-group.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33744-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de];
	RSPAMD_EMAILBL_FAIL(0.00)[alexander.stein.ew.tq-group.com:query timed out,markus.niebel.tq-group.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ew.tq-group.com:mid,ew.tq-group.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tq-group.com:email]
X-Rspamd-Queue-Id: 2FA241A9672
X-Rspamd-Action: no action

TQMa8x is a SOM family using NXP i.MX8QM CPU family
MBa8x is an evaluation mainboard for this SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v3:
* None

 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 910c20bf07a4f..2455358c15ca4 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1420,6 +1420,16 @@ properties:
               - const: tq,imx8dxp-tqma8xdps         # TQ-Systems GmbH TQMa8XDPS SOM
               - const: fsl,imx8dxp
 
+      - description:
+          TQMa8x is a series of SOM featuring NXP i.MX8 system-on-chip
+          variants. It is designed to be clicked on different carrier boards
+          MBa8x is the starterkit
+        items:
+          - enum:
+              - tq,imx8qm-tqma8qm-mba8x   # TQ-Systems GmbH TQMa8QM SOM on MBa8x
+          - const: tq,imx8qm-tqma8qm      # TQ-Systems GmbH TQMa8QM SOM
+          - const: fsl,imx8qm
+
       - description: i.MX8ULP based Boards
         items:
           - enum:
-- 
2.43.0


