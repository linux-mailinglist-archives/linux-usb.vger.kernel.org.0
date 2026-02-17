Return-Path: <linux-usb+bounces-33415-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD/FAfa6lGmKHQIAu9opvQ
	(envelope-from <linux-usb+bounces-33415-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 20:01:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CE614F6D0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 20:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 288533006D5D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 19:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73944285406;
	Tue, 17 Feb 2026 19:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7uwaK9i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86457625
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 19:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354862; cv=none; b=vBGZ9xpHn5xBv/x1oO/ozHxPOIJIMGJpD/ZtZRPr9VRxm5epcNgEQCU7N54k7Amoxudyf0yMIulUUbUGt+HcxScqbo7SGgVcO8C7Dsn8nn1pJwSZhLAtCQjfDJpV9S9sbGgOJVeXtTOqFzO9VzjqCKet/EyUYXJ2xJax9Y5edEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354862; c=relaxed/simple;
	bh=cgYOS5JBg5mIwa0AxJxDBGvoq7401du9Adro7dW4Gso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DPWBE5yYprM7RtMKYXI75TyET39xoNJpbPfjUonkI2Iswdu6n6BplgL056T2S/8YxP2r7tWjEePXSfE9lF4tnj3pdxUkXzxnK8qOB40FUD4ceKOxinbzNxf7iMxsLco7wNn6/MfkKobmCEx+cZf3Ryavefwb1YfEG2BznQCw1Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7uwaK9i; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8946e0884afso81308796d6.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 11:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771354859; x=1771959659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5VLDQ1zGQN+ikSEknxEefHFagTMRXRNdqmLox5MbOY=;
        b=S7uwaK9iyt9zxBmPAUPyleJZQiNOndBUei2EehIDrMkVoSYsHtONYEgnNetqN9T+LI
         1zdsoMn8DRj52+c461du0qG/5HRgMvitHX4npvxefTbvlUi3EN7VndQLWbK7Z+yAs4Ep
         2K5VMP73Ac5kCGvW39ZCri2360W7wGAcnes/1/HhgZCA9fc/PG6kPmzUTqW4jrrW0amN
         KUhNgU7zrMa8ut7lddJto/o1iZcJ59w2dqd7lKT3AOa+9ZRUqgy6okbifevNg7Hiwhc6
         AiUEhrlvYuLdxYiODI/H5k6nEnAf6gjFQluoKaF6qMjy6O5gxxqiSXBwy/bMnGGGqxtq
         6qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771354859; x=1771959659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5VLDQ1zGQN+ikSEknxEefHFagTMRXRNdqmLox5MbOY=;
        b=kNWg/pBhJRy+stlXV5eGbo9etaAX9EGj1J5S92r18NyYzelAGi+TZA1nZApLG9dN5N
         Hi86M4PY+mmz3fz75EO5SAkwF5myPqte2UkEBWJThz7aCYQejZNr0OA4uLKmfZGVG3Wq
         O/4FCeOvQkhgQ5t1oRESY7DNhPIEfmEzzfzxdkKZBcuPKsa1IjfcFZ4UpBQEF6+S6Cyh
         yUcRqIE+KmkfeB4epFsSMB5oLYN+gnBiHO2sJZ/HQ/1yqjrcoe4jDjYHNWG1LPxLStSY
         pDloABBnDiDiGK1wOfN4zTkXqrYPoJR5NkmH1eBCJaYGUdZ0eggJ+KCH93Q/bxNT7SxV
         hpZg==
X-Forwarded-Encrypted: i=1; AJvYcCWZnmihLc64pFfq//j1bbLH3AK/hypokLd61c09Dh9Iu5HuWjCtLEUJfYGC7+91H/ReZtiw1yCn5y0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJvK2fg2TuuEyFGi0BWdVKGOI7N4j/NzZoZTbiJDCU8vnHefRC
	xcKN1YVPdbps8qJUQWSV5jkYkCnnqA2djc2rJeBYpPIUIbANG3sZeSD6O6Z5H/nX
X-Gm-Gg: AZuq6aJydh5y1D1w5bTowRrZmm/QudYFHfQMwa2lNBBubZ+U4AFr3d+ttbB6Y5XjBec
	+IodzCUNYN26VFT1ERyBtxIFFnYmDF60Tv2SH+yUKv826r9ANBIX8GCTLE8nZ82ovZeNH71AkM+
	eCs9SiDKr2MqtJ4USJ+27dIS5hdqBY9CZQCOxazk6SZLlliYe86qGSqkvcRZ1JxBWXlaFKAD50R
	Scp+tYkK+wNKdN9HhEEipSl2CGRBtkulRDdCiJOCsqqZzVUiW+hTjL1l5Ezi6O0xqxrXVn+BkHi
	nAUtaDyTe0UZZy8q6QhOwvG8BMTR/IATCZeHoABIDKnxZTLBNliZOjfEtyn9SESVSK/M+1IXb/z
	v1QChn4mHnKjVFCbZGlwjHSHjMUoP0pPRG+rkWff7cE8F5UMVHSh2DqdbIRb0WXTv04OQOC3vas
	6lMI444RJqpHVMmhi7BStNQY6WScWPiA7d+x7B6Q==
X-Received: by 2002:a05:6214:c41:b0:895:c06:8cbf with SMTP id 6a1803df08f44-897404e1a5cmr182188616d6.62.1771354859235;
        Tue, 17 Feb 2026 11:00:59 -0800 (PST)
Received: from e4dc432969fa ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0be6c9sm1650618385a.1.2026.02.17.11.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 11:00:58 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH] USB: typec: tcpm: Add support for Etek ET7304 Controller
Date: Tue, 17 Feb 2026 18:58:59 +0000
Message-ID: <20260217190010.67-1-alex.caoys@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-33415-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexcaoys@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	HAS_WP_URI(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,etekmicro.com:url]
X-Rspamd-Queue-Id: 25CE614F6D0
X-Rspamd-Action: no action

The Etek ET7304 is a USB Type-C Port Controller with USB-PD used on
the Radxa Cubie A7Z.
According to the ET7304 datasheet [1] and the vendor BSP source code
provided by Radxa [2], this controller is the same device as RT1715
with a different VID.

Add support for the ET7304 by registering its VID in the driver.
Tested on Radxa Cubie A7Z.

[1] https://www.etekmicro.com/wp-content/uploads/datasheets/ET7304_datasheet.pdf
[2] https://github.com/radxa/allwinner-bsp/commit/156b6578cc173855b41ea311a229403ccbadb17c

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 .../devicetree/bindings/usb/richtek,rt1711h.yaml |  3 ++-
 drivers/usb/typec/tcpm/tcpci_rt1711h.c           | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index ae611f7e57ca4..ed0802112eb9f 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -21,8 +21,9 @@ properties:
     enum:
       - richtek,rt1711h
       - richtek,rt1715
+      - etek,et7304
     description:
-      RT1711H support PD20, RT1715 support PD30 except Fast Role Swap.
+      RT1711H support PD20, RT1715 and ET7304 support PD30 except Fast Role Swap.
 
   reg:
     maxItems: 1
diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 88c50b984e8a3..4848748a10dd2 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -19,9 +19,11 @@
 #include <linux/regulator/consumer.h>
 
 #define RT1711H_VID		0x29CF
+#define ET7304_VID		0x6DCF
 #define RT1711H_PID		0x1711
 #define RT1711H_DID		0x2171
 #define RT1715_DID		0x2173
+#define ET7304_DID		0x2173
 
 #define RT1711H_PHYCTRL1	0x80
 #define RT1711H_PHYCTRL2	0x81
@@ -55,6 +57,7 @@
 
 struct rt1711h_chip_info {
 	u32 rxdz_sel;
+	u16 vid;
 	u16 did;
 	bool enable_pd30_extended_message;
 };
@@ -308,7 +311,7 @@ static int rt1711h_check_revision(struct i2c_client *i2c, struct rt1711h_chip *c
 	ret = i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
 	if (ret < 0)
 		return ret;
-	if (ret != RT1711H_VID) {
+	if (ret != chip->info->vid) {
 		dev_err(&i2c->dev, "vid is not correct, 0x%04x\n", ret);
 		return -ENODEV;
 	}
@@ -406,18 +409,28 @@ static void rt1711h_remove(struct i2c_client *client)
 }
 
 static const struct rt1711h_chip_info rt1711h = {
+	.vid = RT1711H_VID,
 	.did = RT1711H_DID,
 };
 
 static const struct rt1711h_chip_info rt1715 = {
 	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
+	.vid = RT1711H_VID,
 	.did = RT1715_DID,
 	.enable_pd30_extended_message = true,
 };
 
+static const struct rt1711h_chip_info et7304 = {
+	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
+	.vid = ET7304_VID,
+	.did = ET7304_DID,
+	.enable_pd30_extended_message = true,
+};
+
 static const struct i2c_device_id rt1711h_id[] = {
 	{ "rt1711h", (kernel_ulong_t)&rt1711h },
 	{ "rt1715", (kernel_ulong_t)&rt1715 },
+	{ "et7304", (kernel_ulong_t)&et7304 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, rt1711h_id);
@@ -425,6 +438,7 @@ MODULE_DEVICE_TABLE(i2c, rt1711h_id);
 static const struct of_device_id rt1711h_of_match[] = {
 	{ .compatible = "richtek,rt1711h", .data = &rt1711h },
 	{ .compatible = "richtek,rt1715", .data = &rt1715 },
+	{ .compatible = "etek,et7304", .data = &et7304 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rt1711h_of_match);
-- 
2.53.0


