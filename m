Return-Path: <linux-usb+bounces-33492-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFc2Ayn+l2lN/AIAu9opvQ
	(envelope-from <linux-usb+bounces-33492-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:24:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1F164F42
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5363305511D
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 06:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8542D6E70;
	Fri, 20 Feb 2026 06:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+SGphOl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E632E138
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 06:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771568593; cv=none; b=j7gCnquee/DzS9wr48EGOvjp1eTplm4OajqlB89iJrvUfXpdZ1Bu3bKO6uj1oTQ/Vu0vIgK0NiPYWhCL6JqmAkb88ULxtgjRWQCLaCi5LmSyadXbSchCRp9YOyHJxxDiAITlAjdQwKGF5vp547SKjjwUg55/lNmZx9oTkATjwmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771568593; c=relaxed/simple;
	bh=N+heUpUpHRoLlSYpeT0QKAiwnnPwr/kVMMau4CF1jBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AzzWfhp9BHYkdcGrraiVCyzFZAEvS6ct7mBIDGlDIXL9BL/b4Tw5Xu2ZlvkoLFTJgFv/zJiDIO2n0+ELnnV1F+pqQSywy9g3ZvPCvCOf8MVWTW0O7JB7DjaRUrDhqmZ9vANGiiNBHXGUFTcgUZmG2r55L8X7zq6yK8f8TXLQx40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+SGphOl; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8966bd9da41so17394226d6.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 22:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771568590; x=1772173390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4pFsMe3WWbMxm2HgYQHGTzj5G++S8g06QTHlbIujGQ=;
        b=B+SGphOloC1am7LeplFYR0ar1WZARYtvYPXkthG3E3bbl0CQfkbwZKdyprUJTycGfW
         SYXF0gtwjM6UR/Rtq9LZXWvxhmEyVPnXuC+6SHIvfP7Ne17n4xgjHvJqhyUTQAJtBMG6
         WsDnTJ7Kcv00DvfoKdxtB98hW/YIE1imQISk0sVr05U+P1W+X4pnutRM8Sxt6SZrWc9y
         Vg52QEHdxj23+rnPk76tF/+f3lbRrNCeJTQOrP+Iz7z1/hhGIAUSKBr9hu/F+QdR1BmS
         2W1Y0KOdN0LhKr4vkmrBODY558Rveh9y3oaGx70BUyt3nrjizzJy7nF4I5XCI4buSYSG
         WzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771568590; x=1772173390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r4pFsMe3WWbMxm2HgYQHGTzj5G++S8g06QTHlbIujGQ=;
        b=Rp+JrkzoPeJYsYLstfRrfNT3mLDTVb7Bd0VgZ7qi2wbsWZKXkBa6bDQpVUH8WHuyMB
         2GuttBT+/psEcGwMtPBKuM6HRA6fAgTW68nvsDycAipS9eCZh0yXT/hDia6DdH1/NtCC
         M417G+8KSAf63RmExCxid0goNZ33dkCgKf0M/MSrttAXB8l3sQ9+wDY5ie2W7stY1wHE
         7/v6Gcpq/k3Rgq9c/+mydgdQucFIU+3GuqRE0S3mt3G7/A2iAgRAwGwWsNDD3FKgKr42
         otfwF6Fm7NMGlqR/ruATFraewfmrW/eSX7RlmwpoOKxLL7XXEoSQEllQk1edDRRXSZZQ
         WO7w==
X-Gm-Message-State: AOJu0YwAQceTqgzdG+3kTvyPRHhjDwocfXDYw1TiT7p4kvdGswpljiUw
	qsFRRqmKk515B7YpTe9+1lEBTzwlmfUmoYB7rNPxLEiIuMhkD4sR4x6N
X-Gm-Gg: AZuq6aKL6OlpArKhKQL0esCw0+vuedwjoOE5RKLWyrXl0ZYN1wd1siqA5OB0cjJM1L7
	+ieiuhCPqfakd01aayT8LofsaBFWxzKW4LbcqhG2Sa4XVw8YmsTQFUyr2uMr+pZkWMn8aIbbHi8
	e1laXDN/mqdqZoEE5vvtYGXnxFlX8qvsJLVrDy+3h39ZxhaCC00pHrnH7sA3ktHEeIkYJBsPhwB
	8MSgn51J1pj04ioL4m30f8rEPYM5wzXfklf0QSnN5DHEZQOMLsGAUus9aFJPAaXV5veckZBiqtz
	F3lw+Rx6+yvMqwdUCtwXWEeQz3Z9hn/JCwjQY6JyPO2b2brgIoGbck0jnS2iinXMLL1ciosLCUt
	g73+4pVfY/eX/EnZDyQb2j3PWgvO+6dFRX3JBExlqdWPfuWI22X6teve+IlD0jQ/joAR4TYK84H
	0jQhI5z0gpy7TiySRtyd6+ZZC1PEE=
X-Received: by 2002:a05:6214:1d08:b0:894:7c5e:3368 with SMTP id 6a1803df08f44-897402d8d03mr299450516d6.4.1771568590006;
        Thu, 19 Feb 2026 22:23:10 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cd8a5ccsm234206306d6.25.2026.02.19.22.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 22:23:09 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Fri, 20 Feb 2026 06:22:41 +0000
Subject: [PATCH v3 2/2] usb: typec: tcpm: Add vid and chip info for Etek
 ET7304
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-et7304-v3-2-ede2d9634957@gmail.com>
References: <20260220-et7304-v3-0-ede2d9634957@gmail.com>
In-Reply-To: <20260220-et7304-v3-0-ede2d9634957@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33492-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexcaoys@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73E1F164F42
X-Rspamd-Action: no action

Move VID field to chip info to accommodate different VIDs.
Add chip info for Etek Micro ET7304. ET7304 is functionally
identical to the Richtek RT1715, with the only difference
being the VID.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 88c50b984e8a..37cf55ad74f8 100644
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
@@ -405,17 +408,27 @@ static void rt1711h_remove(struct i2c_client *client)
 	tcpci_unregister_port(chip->tcpci);
 }
 
+static const struct rt1711h_chip_info et7304 = {
+	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
+	.vid = ET7304_VID,
+	.did = ET7304_DID,
+	.enable_pd30_extended_message = true,
+};
+
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
 
 static const struct i2c_device_id rt1711h_id[] = {
+	{ "et7304", (kernel_ulong_t)&et7304 },
 	{ "rt1711h", (kernel_ulong_t)&rt1711h },
 	{ "rt1715", (kernel_ulong_t)&rt1715 },
 	{}
@@ -423,6 +436,7 @@ static const struct i2c_device_id rt1711h_id[] = {
 MODULE_DEVICE_TABLE(i2c, rt1711h_id);
 
 static const struct of_device_id rt1711h_of_match[] = {
+	{ .compatible = "etekmicro,et7304", .data = &et7304 },
 	{ .compatible = "richtek,rt1711h", .data = &rt1711h },
 	{ .compatible = "richtek,rt1715", .data = &rt1715 },
 	{}

-- 
2.53.0


