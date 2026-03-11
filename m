Return-Path: <linux-usb+bounces-34597-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMhXDg2XsWnkDAAAu9opvQ
	(envelope-from <linux-usb+bounces-34597-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 17:23:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83911267431
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 17:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABD1F305377F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD203E3144;
	Wed, 11 Mar 2026 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="JAsdAk5J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F372E1F06
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 16:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246068; cv=none; b=VqQz/7U8Zjthyw22k8xG3n0SOSkttyfATmcpk2B/VfpCt3wYRzavYyKnJR9NKcoGvmCeUn+I03uAZ+KQu58u6JeZN5x7Imtm/O87xeKyiGcSVdHnskO+kpXcBpvs105uJehWp9UYrMmhK8ZDljBvkePuHAIgmDyTFm9zUd1ZVoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246068; c=relaxed/simple;
	bh=HrT7kgAxAewbIt6oxfECG5Zscpfe57igzugyy1/fdnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usMVT5bg/Tq9qcoNbaap5bWtARKjeIj3HHBv8+07fVDOIz+omTJ5NFEN964xXNMhZSlaoShDQa1HCMZKwbohkqbTZem9Afdw0RJgnfo1tpe/FuvvzNks68DDJDIAAiGSCE4pMkdBihNAi1o47Aw5nzHeWHK3SSzGABP2EB/Oizc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=JAsdAk5J; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so55163f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 09:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773246063; x=1773850863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4c9O2cAKMzdhEw8waFKH8CurVd4+UFa/RS9fIQimTs=;
        b=JAsdAk5JX5985CUpsu7DDv7aSFC0lhvSK/CZBOarWZMDP9iL9yOHEaqtGzAQ8et+Dg
         FHo1xoZwLHKbk+LyODfWpZHqJ+2eGqqlUa/TWLlwaxm2ZvZjeaRym2n8dIQaAoUp6bvY
         ojpkp3sUzTY7nmwhfp5Wnetuu7eDjPMFMVYo0atQeo8xH+4LB08D1al+FJYdaUP24f0y
         FqZCYJOKmkq1uy5ANyaHnFHceEKAs1OV97hyO4KKUZ32a+VUBk2ts/0jxJLbsiVxLEjH
         0g8a2CZ7tP085lLip8IAbj/31ErkVU390/EvXTibX7HIhPSokAzNOAiiMimbNxjaTXh5
         G0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246063; x=1773850863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f4c9O2cAKMzdhEw8waFKH8CurVd4+UFa/RS9fIQimTs=;
        b=I/kkTqRU1v7c/9XOWwQxKuPF3Kqymj5WqGhQaCa9zOzEqmvMSUVA2GC9QHoT7fdUCN
         bs8eopmqiluMjfqJqi2TJH77RWW2LT2tIm6pe3SfFxTXVw5KqtZGHb/5yT2r/ddymzws
         jD3gwjH/dNWRWBXUGwXWheSDa4LKxrBuWgi40XvFbX7bFw0hnJNG+gHBSdKbV602uqqV
         AkPhIHs7oGAxlAkeje1z5uAym8imQbhLpzc8r59nz1LRepnxQrt4DO8mMH8Y53IY9+Qs
         eKv8EJC8VbeN+LULY5pHIJUupR4dnRb4VpTsVLhzVJY+j0V3FaFXLJ//QdNQj4nSijyX
         CaIw==
X-Forwarded-Encrypted: i=1; AJvYcCXWFjwBwhEi0/WrBau8jP1bxSNjpLvLkiKU3bde02iR3oMVGF2dBLokGNbp2Gfzica63Xo11bnW70k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtuxOICX/I6aoFPg4OfrJbJ+3x64rXiXKpSO3kTIGib0iw+mSM
	OxRvCA0GTadQwY3QwFm6jrI/Kowam7bYzE/hwIphhpe8L65fq93LxLcflU4ooxsh/IM=
X-Gm-Gg: ATEYQzyGB+BJ/xN+kslyrI5H/c3KaKOks57pGbg6vxgM7Uj3pvaNgB33NqCXj1cVgHU
	P7MTTKW++FqgmsjYH1neicN/s06NS7mhxtTEO0Pxn0zOyIXNvkWLSFzWymQpQiJZg7NiQBwYL8r
	FoEny5I5c3tKnL5ia9trbUP7h0Huo17fPg7AEELkPE8x3q0ZmSWcDLRPhqAAVys/dfH8mn53l/v
	+QPMFg87l1ywnL7t2mj+7pxDgkA0Lc3Wn8KAuGe6xE41nOJbhHPb+S0pqjraNxrfTwxciOuK950
	E5MV1C4mKExsN+cfMGcqARuEXKrx0ehSZBRLyaa+NFdwsuqQSAENS90VpBqQFWlcdUGm+oLw9OA
	RbnpZq/Kk3jK8S9ocZWcl3Tw9Dc6DdpTl8OjR71cyS4FdBNzSDRs/TS/BG3IVqbxzRDmhs3tlFr
	aD8SuAcQ8zBtbKSX3xP6whkGLIlqVI3AftDXRRvMGdhnuP7Vfl5pltdoHqqR0zEwFiaNk1W7GXt
	cXP4A==
X-Received: by 2002:a05:600c:a08:b0:485:2c61:9459 with SMTP id 5b1f17b1804b1-4854b0afb48mr55832705e9.8.1773246062266;
        Wed, 11 Mar 2026 09:21:02 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm283952f8f.23.2026.03.11.09.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:21:02 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 20:20:46 +0400
Subject: [PATCH 3/4] usb: typec: tcpci_rt1711h: Add support for Hynetek
 HUSB311
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-husb311-v1-3-f25bcb58cff7@flipper.net>
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
In-Reply-To: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2922; i=alchark@flipper.net;
 h=from:subject:message-id; bh=HrT7kgAxAewbIt6oxfECG5Zscpfe57igzugyy1/fdnU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRunJZ8Xvo8a6G29Pt9y2ZnbMsOT3v6o1DwLpPF+qncG
 46+3fkqomMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTUMdYxYuDiFICpLhRnZDhZ2FHxqOH18XsqpruYj9qKnZDZxPzhXs1q9nXGBz4cX+7M8D/VWbL
 zVPjuF3sq27Jtrhv8nzvbSLKUeQfDyfI9OT6bb3MDAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34597-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[flipper.net:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hynetek.com:url,flipper.net:dkim,flipper.net:email,flipper.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,xkwy2018.com:url]
X-Rspamd-Queue-Id: 83911267431
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HUSB311 is a pin-compatible and register-compatible drop-in replacement
for RT1711H, so add its IDs to the existing driver.

Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535-4f09-bacd-0440d2c21088.pdf
Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20Branch_Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%2020210526.pdf
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 88c50b984e8a..ac5917c1e253 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -18,6 +18,9 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#define HUSB311_VID		0x2E99
+#define HUSB311_PID		0x0311
+#define HUSB311_DID		0x0000
 #define RT1711H_VID		0x29CF
 #define RT1711H_PID		0x1711
 #define RT1711H_DID		0x2171
@@ -55,6 +58,8 @@
 
 struct rt1711h_chip_info {
 	u32 rxdz_sel;
+	u16 vid;
+	u16 pid;
 	u16 did;
 	bool enable_pd30_extended_message;
 };
@@ -308,14 +313,14 @@ static int rt1711h_check_revision(struct i2c_client *i2c, struct rt1711h_chip *c
 	ret = i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
 	if (ret < 0)
 		return ret;
-	if (ret != RT1711H_VID) {
+	if (ret != chip->info->vid) {
 		dev_err(&i2c->dev, "vid is not correct, 0x%04x\n", ret);
 		return -ENODEV;
 	}
 	ret = i2c_smbus_read_word_data(i2c, TCPC_PRODUCT_ID);
 	if (ret < 0)
 		return ret;
-	if (ret != RT1711H_PID) {
+	if (ret != chip->info->pid) {
 		dev_err(&i2c->dev, "pid is not correct, 0x%04x\n", ret);
 		return -ENODEV;
 	}
@@ -405,17 +410,28 @@ static void rt1711h_remove(struct i2c_client *client)
 	tcpci_unregister_port(chip->tcpci);
 }
 
+static const struct rt1711h_chip_info husb311 = {
+	.vid = HUSB311_VID,
+	.pid = HUSB311_PID,
+	.did = HUSB311_DID,
+};
+
 static const struct rt1711h_chip_info rt1711h = {
+	.vid = RT1711H_VID,
+	.pid = RT1711H_PID,
 	.did = RT1711H_DID,
 };
 
 static const struct rt1711h_chip_info rt1715 = {
 	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
+	.vid = RT1711H_VID,
+	.pid = RT1711H_PID,
 	.did = RT1715_DID,
 	.enable_pd30_extended_message = true,
 };
 
 static const struct i2c_device_id rt1711h_id[] = {
+	{ "husb311", (kernel_ulong_t)&husb311 },
 	{ "rt1711h", (kernel_ulong_t)&rt1711h },
 	{ "rt1715", (kernel_ulong_t)&rt1715 },
 	{}
@@ -423,6 +439,7 @@ static const struct i2c_device_id rt1711h_id[] = {
 MODULE_DEVICE_TABLE(i2c, rt1711h_id);
 
 static const struct of_device_id rt1711h_of_match[] = {
+	{ .compatible = "hynetek,husb311", .data = &husb311 },
 	{ .compatible = "richtek,rt1711h", .data = &rt1711h },
 	{ .compatible = "richtek,rt1715", .data = &rt1715 },
 	{}

-- 
2.52.0


