Return-Path: <linux-usb+bounces-37984-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BxtCgD4EmoY5wYAu9opvQ
	(envelope-from <linux-usb+bounces-37984-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 15:07:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0905C273E
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 15:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1FC63004D24
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 13:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A41397AE5;
	Sun, 24 May 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="DvnGRkfD"
X-Original-To: linux-usb@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39F434DCE6;
	Sun, 24 May 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628014; cv=none; b=AQaV73CxRlULWsevYh2uX+ycgQrqN1ZhfO2bI1apBKwmqgC+HaEW+nAuvhdqV6EE/T5fjC1dxl7KSeQ6T9V/N373pJq/x5r30X0yrCVm23uQWTpXccyXN8TStK4YlMFpnkq+jMK8SLLt/L1WhZxS/8J2gQXISeRr4CkKlO/AwT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628014; c=relaxed/simple;
	bh=a3MKMiQ1YdYjeWFDK76VgkujpPaXG6iuY6V477D5jgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdSON+27l45bE2f/B4QupWvQvqKQBGSpryb2IbCcaXf9/GkkzP3ISb1V7dyGtaWqID+DfZ8BD6pq9TPQ8mVUVrC7trC41X3vXwmyqZPQHqZZQLnVZ1rOUWbZ6146Co0CDvzK16O0GjoqxWbFzOUxclCRpligiRJVyml2Pi6ZmL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=DvnGRkfD; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779628008;
	bh=a3MKMiQ1YdYjeWFDK76VgkujpPaXG6iuY6V477D5jgQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DvnGRkfDVay7cHdtWnevsce5EHS8daQFGjNJIBLuIXsbEFPyqlVaNWq1h8xrDEs8E
	 IgETUL4XAcLpUCLR0wfRLuDsT413NZSkHnceFgYOheLDA55bPZ7Zpz0o+iR+IVHx8R
	 i9e7mga2S1pjy23Qu7jLaESslBlwh+pLolRgd3+M=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 24 May 2026 15:06:43 +0200
Subject: [PATCH 1/6] thunderbolt: test: Make root_directory independent of
 host byte order
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260524-thunderbolt-big-endian-v1-1-6044edca78e7@weissschuh.net>
References: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
In-Reply-To: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Michael Jamet <michael.jamet@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yehezkel Bernat <yehezkel.bernat@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779628007; l=5345;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=a3MKMiQ1YdYjeWFDK76VgkujpPaXG6iuY6V477D5jgQ=;
 b=I88w5D+iYw6GNdKzVRN7eIXPgXbBtdcXayQiFCVt4ftUZ+Pt+ko78bksws7NygKREjp6zC9x8
 +ewztqiE0slClCI2LERz0aAROGjm8YnD3S5+x0VH6Q3TCIV6ic17LB3
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37984-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0E0905C273E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The wire-format is always the same.

Make sure the test data doesn't suddenly change on big-endian systems.

Fixes: 15a4c7e8f916 ("thunderbolt: Add KUnit tests for XDomain properties")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

---
This is actual an assumption. I didn't find the specs.
---
 drivers/thunderbolt/test.c | 106 ++++++++++++++++++++++-----------------------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 1f4318249c22..114ef11cd6f4 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -2604,59 +2604,59 @@ static void tb_test_credit_alloc_all(struct kunit *test)
 }
 
 static const u32 root_directory[] = {
-	0x55584401,	/* "UXD" v1 */
-	0x00000018,	/* Root directory length */
-	0x76656e64,	/* "vend" */
-	0x6f726964,	/* "orid" */
-	0x76000001,	/* "v" R 1 */
-	0x00000a27,	/* Immediate value, ! Vendor ID */
-	0x76656e64,	/* "vend" */
-	0x6f726964,	/* "orid" */
-	0x74000003,	/* "t" R 3 */
-	0x0000001a,	/* Text leaf offset, (“Apple Inc.”) */
-	0x64657669,	/* "devi" */
-	0x63656964,	/* "ceid" */
-	0x76000001,	/* "v" R 1 */
-	0x0000000a,	/* Immediate value, ! Device ID */
-	0x64657669,	/* "devi" */
-	0x63656964,	/* "ceid" */
-	0x74000003,	/* "t" R 3 */
-	0x0000001d,	/* Text leaf offset, (“Macintosh”) */
-	0x64657669,	/* "devi" */
-	0x63657276,	/* "cerv" */
-	0x76000001,	/* "v" R 1 */
-	0x80000100,	/* Immediate value, Device Revision */
-	0x6e657477,	/* "netw" */
-	0x6f726b00,	/* "ork" */
-	0x44000014,	/* "D" R 20 */
-	0x00000021,	/* Directory data offset, (Network Directory) */
-	0x4170706c,	/* "Appl" */
-	0x6520496e,	/* "e In" */
-	0x632e0000,	/* "c." ! */
-	0x4d616369,	/* "Maci" */
-	0x6e746f73,	/* "ntos" */
-	0x68000000,	/* "h" */
-	0x00000000,	/* padding */
-	0xca8961c6,	/* Directory UUID, Network Directory */
-	0x9541ce1c,	/* Directory UUID, Network Directory */
-	0x5949b8bd,	/* Directory UUID, Network Directory */
-	0x4f5a5f2e,	/* Directory UUID, Network Directory */
-	0x70727463,	/* "prtc" */
-	0x69640000,	/* "id" */
-	0x76000001,	/* "v" R 1 */
-	0x00000001,	/* Immediate value, Network Protocol ID */
-	0x70727463,	/* "prtc" */
-	0x76657273,	/* "vers" */
-	0x76000001,	/* "v" R 1 */
-	0x00000001,	/* Immediate value, Network Protocol Version */
-	0x70727463,	/* "prtc" */
-	0x72657673,	/* "revs" */
-	0x76000001,	/* "v" R 1 */
-	0x00000001,	/* Immediate value, Network Protocol Revision */
-	0x70727463,	/* "prtc" */
-	0x73746e73,	/* "stns" */
-	0x76000001,	/* "v" R 1 */
-	0x00000000,	/* Immediate value, Network Protocol Settings */
+	le32_to_cpu(0x55584401),	/* "UXD" v1 */
+	le32_to_cpu(0x00000018),	/* Root directory length */
+	le32_to_cpu(0x76656e64),	/* "vend" */
+	le32_to_cpu(0x6f726964),	/* "orid" */
+	le32_to_cpu(0x76000001),	/* "v" R 1 */
+	le32_to_cpu(0x00000a27),	/* Immediate value, ! Vendor ID */
+	le32_to_cpu(0x76656e64),	/* "vend" */
+	le32_to_cpu(0x6f726964),	/* "orid" */
+	le32_to_cpu(0x74000003),	/* "t" R 3 */
+	le32_to_cpu(0x0000001a),	/* Text leaf offset, (“Apple Inc.”) */
+	le32_to_cpu(0x64657669),	/* "devi" */
+	le32_to_cpu(0x63656964),	/* "ceid" */
+	le32_to_cpu(0x76000001),	/* "v" R 1 */
+	le32_to_cpu(0x0000000a),	/* Immediate value, ! Device ID */
+	le32_to_cpu(0x64657669),	/* "devi" */
+	le32_to_cpu(0x63656964),	/* "ceid" */
+	le32_to_cpu(0x74000003),	/* "t" R 3 */
+	le32_to_cpu(0x0000001d),	/* Text leaf offset, (“Macintosh”) */
+	le32_to_cpu(0x64657669),	/* "devi" */
+	le32_to_cpu(0x63657276),	/* "cerv" */
+	le32_to_cpu(0x76000001),	/* "v" R 1 */
+	le32_to_cpu(0x80000100),	/* Immediate value, Device Revision */
+	le32_to_cpu(0x6e657477),	/* "netw" */
+	le32_to_cpu(0x6f726b00),	/* "ork" */
+	le32_to_cpu(0x44000014),	/* "D" R 20 */
+	le32_to_cpu(0x00000021),	/* Directory data offset, (Network Directory) */
+	le32_to_cpu(0x4170706c),	/* "Appl" */
+	le32_to_cpu(0x6520496e),	/* "e In" */
+	le32_to_cpu(0x632e0000),	/* "c." ! */
+	le32_to_cpu(0x4d616369),	/* "Maci" */
+	le32_to_cpu(0x6e746f73),	/* "ntos" */
+	le32_to_cpu(0x68000000),	/* "h" */
+	le32_to_cpu(0x00000000),	/* padding */
+	le32_to_cpu(0xca8961c6),	/* Directory UUID, Network Directory */
+	le32_to_cpu(0x9541ce1c),	/* Directory UUID, Network Directory */
+	le32_to_cpu(0x5949b8bd),	/* Directory UUID, Network Directory */
+	le32_to_cpu(0x4f5a5f2e),	/* Directory UUID, Network Directory */
+	le32_to_cpu(0x70727463),	/* "prtc" */
+	le32_to_cpu(0x69640000),	/* "id" */
+	le32_to_cpu(0x76000001),	/* "v" R 1 */
+	le32_to_cpu(0x00000001),	/* Immediate value, Network Protocol ID */
+	le32_to_cpu(0x70727463),	/* "prtc" */
+	le32_to_cpu(0x76657273),	/* "vers" */
+	le32_to_cpu(0x76000001),	/* "v" R 1 */
+	le32_to_cpu(0x00000001),	/* Immediate value, Network Protocol Version */
+	le32_to_cpu(0x70727463),	/* "prtc" */
+	le32_to_cpu(0x72657673),	/* "revs" */
+	le32_to_cpu(0x76000001),	/* "v" R 1 */
+	le32_to_cpu(0x00000001),	/* Immediate value, Network Protocol Revision */
+	le32_to_cpu(0x70727463),	/* "prtc" */
+	le32_to_cpu(0x73746e73),	/* "stns" */
+	le32_to_cpu(0x76000001),	/* "v" R 1 */
+	le32_to_cpu(0x00000000),	/* Immediate value, Network Protocol Settings */
 };
 
 static const uuid_t network_dir_uuid =

-- 
2.54.0


