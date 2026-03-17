Return-Path: <linux-usb+bounces-34971-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLTpJVCauWn5KwIAu9opvQ
	(envelope-from <linux-usb+bounces-34971-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:15:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F192B0C33
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D48C831C532A
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 18:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DCD37F01F;
	Tue, 17 Mar 2026 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ns0e12ay"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2B93F54C6
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770907; cv=none; b=IM9I/xct9EZqXjIhSIXOgSu/azA1dJFPQuLmEDWmgznRzjoOB6O+VIBCQaKr2PU99onAQRyqEHy3MqGTKiOFlbN0VUgSb/GH2d2lO75XM7voRmYSOKHOQnIJKeF5oL6xH51HHmx7hblSRrmWRvoXCoFfmflTrJogzYd8O/yOyOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770907; c=relaxed/simple;
	bh=adUNrc5DmhRHUleLGmdaxH9/D4sLCU6UUObKtpN1GPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjN0vtPy4UrXWlpDZn4XgNysh5yBS5764O/kWbUKVsp9nq+oiqyt0Kz+D8kOYIwiM/CZkeojRMKBokzOy+/fdMv5e45LBLIwV53KbIuIEbHLwubKDNOemmEPGBfB6f16B9z4PR/bNnb8mS/3bjMnbEXZUucIhzNXhnpyVrUFAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ns0e12ay; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b49819938so855341f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773770901; x=1774375701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZzaejzhKh2/pl8uBJakl190/CtTYCUrflLlLKsisxI=;
        b=ns0e12aylGGu33RxMy5d7BDj7PNJ5Gfdb2pS4XmfURX+xhwZI9TVEi8VvIWVSguRGg
         gtN0kNT6nEBivxkow31CQOnkzm4N4JixjO0XsPkKVNQsvrzY6+j1UDeaccjKuzzgH6bg
         GQfKs+hxhXdg1pUYCv8migj9FPg9Pt21yKE39RbCBbCLqPUIU2BTBhsg1FEahIe3BRwr
         4VnwDD5klgS7jGQzxr+O9Dj2+QqdHQ6mzsaZL3SGS7jmw4fSF1EAb1LyRIOthOuioK4+
         tF9dUDOVvJHjSTf2R5hHe7dlDHPDQg4DmqzDAx4jDqzbgqzcHfze1aGWgqYBR+KZi87t
         C0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770901; x=1774375701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zZzaejzhKh2/pl8uBJakl190/CtTYCUrflLlLKsisxI=;
        b=dPzPqtATF0B8S3EUgxTaqtJFR5p1SxjU37Pzj4YFhNbRtSM4cx9I1wEMsGIlcIz4Uq
         krmiIKJCQSk22r/4QSr7mJX0hQHdFAvNlXEaCexpd8o977K/THlqFKbROi1TnXWL9O+D
         p5qmqtkKwFFxzX+Bzrh45HtCtEf3H0LVS2j8nP/B0L7iO26NO9yWQtlYJgjnKrwqtMxP
         m/aqEqKHHNTxoznFWDTipNtiLjeT5TclVlDVirCA4jmkljEJPCw/SlSDB+aDhH4qwvG6
         acr2XMFJc/qr+nw4EAblzh0aB3TW1xy+303Nduo7SfzDs0dY885ZOvfePO4UpVlr/OBX
         Be8w==
X-Forwarded-Encrypted: i=1; AJvYcCX/YfIxhOnw0TPf/nR8ScXrcWgN7udHTcU+Bg5WwjKu8+npihbT+4zwEcp/Wt2acuFSgavYv6OKkJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydZQT+qxJM+ZhcVw1wgTQqe6g3mDG3Dji13Fipg8A/0qqLhzxN
	Vf20Om6QNltGFh28IUFfxuSNiW8d+yATgQZetl0jVZAUR8XY164wc7l7tdu4c4drBp8=
X-Gm-Gg: ATEYQzw5s2E5ZbHtsJCbzRmD5GYwWAMSIrebrdWX8p9Jp4JYM1znLEaHK3VOUGzwrkJ
	+5eB0swdS4p6/xx3D+NQyEzEr1Dtw7KnqZzHxk2QgTaZ0EO+DT8wVmHqDymUTUoCTnqRESPnDDM
	tAbgi2tBUVQtYGFPqlOf32SpFRSLqclSvbEWRM/Q65fy4QnSavzlMWYqU/tlYd+udhCtdjCBhfj
	XT1PXYOhaZbIQZ35hgJuByZvgbCxjnh1SjOnk0HYXwp0PV1ytLSNHV5lnvGay22aFBas2hvyC5o
	ODJ+hA4tz2dMYLtc78isG6XpJ92qKlAkMRBAm8MsADbFE2ST3GCQjmu99ahNFCtn49xIHAV8iU3
	4f9wDtNGpfYM6+7elafZMQhijboPjhMdOUyPsStGrhGV7iDKCCtjU8PsHcRfcJ+jl2xRP8/22Bp
	DO8N9iDUs45xC/EESCsGELG7ETnQ61iSAaOXO27nVVQaaTCud0EVJ2XRDTch9dKUi0K1GawDeNm
	1B31gvvt4Kx/rlo
X-Received: by 2002:a5d:5d13:0:b0:43b:45d1:f448 with SMTP id ffacd0b85a97d-43b527aa5bbmr374980f8f.14.1773770900811;
        Tue, 17 Mar 2026 11:08:20 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm1436536f8f.1.2026.03.17.11.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:08:20 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Mar 2026 22:08:01 +0400
Subject: [PATCH v2 4/5] usb: typec: tcpci_rt1711h: Drop unnecessary
 VID/PID/DID checks
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-husb311-v2-4-03c17c986abe@flipper.net>
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
In-Reply-To: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>, 
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3767; i=alchark@flipper.net;
 h=from:subject:message-id; bh=adUNrc5DmhRHUleLGmdaxH9/D4sLCU6UUObKtpN1GPU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTunNEm7lq/wyh58vysd8teFvqaSX7aqZlhekVIp2SHw
 hzjoNeiHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEz1VmuGfxYZ97tT9/Pu1tP4ff9FTPE84X1lm3ofM82yYv76Y4acTR4jw5pHJ93
 58wTaY1/eUZrd5S50eEub3t7nTuf2MzMeNDBdxw8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,sntech.de,gmail.com];
	TAGGED_FROM(0.00)[bounces-34971-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[flipper.net:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F2F192B0C33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Existing checks for VID/PID/DID in the driver are redundant since the
driver is already matched to the device via I2C device ID and OF
compatible strings, and they preclude the use of fallback compatibles.

Remove them to make the driver slimmer and adding new clones easier.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 59 ++--------------------------------
 1 file changed, 2 insertions(+), 57 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 37cf55ad74f8..4b3e4e22a82e 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -18,13 +18,6 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
-#define RT1711H_VID		0x29CF
-#define ET7304_VID		0x6DCF
-#define RT1711H_PID		0x1711
-#define RT1711H_DID		0x2171
-#define RT1715_DID		0x2173
-#define ET7304_DID		0x2173
-
 #define RT1711H_PHYCTRL1	0x80
 #define RT1711H_PHYCTRL2	0x81
 
@@ -57,8 +50,6 @@
 
 struct rt1711h_chip_info {
 	u32 rxdz_sel;
-	u16 vid;
-	u16 did;
 	bool enable_pd30_extended_message;
 };
 
@@ -304,35 +295,6 @@ static int rt1711h_sw_reset(struct rt1711h_chip *chip)
 	return 0;
 }
 
-static int rt1711h_check_revision(struct i2c_client *i2c, struct rt1711h_chip *chip)
-{
-	int ret;
-
-	ret = i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
-	if (ret < 0)
-		return ret;
-	if (ret != chip->info->vid) {
-		dev_err(&i2c->dev, "vid is not correct, 0x%04x\n", ret);
-		return -ENODEV;
-	}
-	ret = i2c_smbus_read_word_data(i2c, TCPC_PRODUCT_ID);
-	if (ret < 0)
-		return ret;
-	if (ret != RT1711H_PID) {
-		dev_err(&i2c->dev, "pid is not correct, 0x%04x\n", ret);
-		return -ENODEV;
-	}
-	ret = i2c_smbus_read_word_data(i2c, TCPC_BCD_DEV);
-	if (ret < 0)
-		return ret;
-	if (ret != chip->info->did) {
-		dev_err(&i2c->dev, "did is not correct, 0x%04x\n", ret);
-		return -ENODEV;
-	}
-	dev_dbg(&i2c->dev, "did is 0x%04x\n", ret);
-	return ret;
-}
-
 static int rt1711h_probe(struct i2c_client *client)
 {
 	int ret;
@@ -349,12 +311,6 @@ static int rt1711h_probe(struct i2c_client *client)
 
 	chip->info = i2c_get_match_data(client);
 
-	ret = rt1711h_check_revision(client, chip);
-	if (ret < 0) {
-		dev_err(&client->dev, "check vid/pid fail\n");
-		return ret;
-	}
-
 	chip->data.regmap = devm_regmap_init_i2c(client,
 						 &rt1711h_regmap_config);
 	if (IS_ERR(chip->data.regmap))
@@ -408,27 +364,16 @@ static void rt1711h_remove(struct i2c_client *client)
 	tcpci_unregister_port(chip->tcpci);
 }
 
-static const struct rt1711h_chip_info et7304 = {
-	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
-	.vid = ET7304_VID,
-	.did = ET7304_DID,
-	.enable_pd30_extended_message = true,
-};
-
 static const struct rt1711h_chip_info rt1711h = {
-	.vid = RT1711H_VID,
-	.did = RT1711H_DID,
 };
 
 static const struct rt1711h_chip_info rt1715 = {
 	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
-	.vid = RT1711H_VID,
-	.did = RT1715_DID,
 	.enable_pd30_extended_message = true,
 };
 
 static const struct i2c_device_id rt1711h_id[] = {
-	{ "et7304", (kernel_ulong_t)&et7304 },
+	{ "et7304", (kernel_ulong_t)&rt1715 },
 	{ "rt1711h", (kernel_ulong_t)&rt1711h },
 	{ "rt1715", (kernel_ulong_t)&rt1715 },
 	{}
@@ -436,7 +381,7 @@ static const struct i2c_device_id rt1711h_id[] = {
 MODULE_DEVICE_TABLE(i2c, rt1711h_id);
 
 static const struct of_device_id rt1711h_of_match[] = {
-	{ .compatible = "etekmicro,et7304", .data = &et7304 },
+	{ .compatible = "etekmicro,et7304", .data = &rt1715 },
 	{ .compatible = "richtek,rt1711h", .data = &rt1711h },
 	{ .compatible = "richtek,rt1715", .data = &rt1715 },
 	{}

-- 
2.52.0


