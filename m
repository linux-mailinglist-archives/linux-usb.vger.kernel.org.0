Return-Path: <linux-usb+bounces-35059-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFUhAk24umlWawIAu9opvQ
	(envelope-from <linux-usb+bounces-35059-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:35:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA862BD3CD
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 93475303548C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 14:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3463DEAE5;
	Wed, 18 Mar 2026 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="Pjpra7Of"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951B33DEACB
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844406; cv=none; b=gYXEV73BFzx6EMSFFhS4E/URhl/ADIESCJWdKwyxmY3Bd5YeruvC0dLjPwsZ9AtmP68kDwK1jGIg+8nyH2dm4z7FBd4lNcpTVjSDkflP3Zm5LzZehDZ/3lss3oo1QZI+ME0zGElwumBkWnTvv18GxyJuaCGDIqT2rYqKLX3GZ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844406; c=relaxed/simple;
	bh=qSIoqe1rCM98pYxPjvfzxpcj4EO8iAA2yOd3l9ZnBNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TdVrUeUMxZ7HEnbGqybNMSWHs+P4wdWGklHgKZjRxEBmLCe+MAFapm4LlYf7K+KIb1L9iN8R7sObfIMo7CB5xEx4uy8fc6Mthv8/j97TOg4qzfCln7PLOn0/fIwaUNyFUMmYedpUlE7kCrifAa6KUlUftEZf082+nxA0Te2hv/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=Pjpra7Of; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so27373215e9.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773844403; x=1774449203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1QFYrzbzDmyd8ewHMMN3Hovj77cWoAajjF/dHg7uJs=;
        b=Pjpra7OfzTzWpcbxrCJaqgs07DRByztlLJFK6htNWU+bCyZWHot+TWc1NRPQbtPM1M
         rLKgSmHvwXFehTFMfbiKkrD+YOwtKmSSKuGBJVBjJUOZw/fIPcJALqvR7iG5oREHLwcq
         UD7Upi6CWmCPrHA7zx8KF05OVk0zzmfL0gyrX4vp4saFdyghcC1EQlaFXpu3U0g3X6qd
         jcCSvMSzTlPp0gufoUF9ma6hwFWgmZFX7QFPIkaE0qAR6qtjr4SimiVJ9MdTQsoluslr
         Z1GLqunH6Zo4WUC1y1OxmYKl2R+i8eV6YMEqiKgXhw3OcZeHgkrEKIrtJ2SjGwJrJwYs
         8AwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844403; x=1774449203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D1QFYrzbzDmyd8ewHMMN3Hovj77cWoAajjF/dHg7uJs=;
        b=rGieXwTbt57zUkul2LyvjsX/3O8jE0tSf+FOia/Mw8nyJ+D9AI8wRlOsoxam7BDJOK
         auRE9baF3lC1+nUSROcTmzGYgqcv4p11Zh656jPyNas4/p2NjnOcpHWiuTu4njo/XCcS
         mEPp0W3iJzO6vNE0oce42/LZZ9ldUyO6sak9Y7rqcB6rcfi9CBnWsjnksfm8AAa5hCs+
         sCs3ul+yqjcSYc9DPUgBgNkqdeCu4IM3wnfUNPQELCzPzxTPzHcJnEVbxG+NFyXRHtf0
         ysliUzaCnCbfQDFp5SKKX9tHkPAL6sniS7u4dk6JoMEw0Dp2gmtdd7wFy/0oufSktDrN
         +p2A==
X-Forwarded-Encrypted: i=1; AJvYcCXnGcD0EmnlQE8r/LlgDsEwjP7ryisuw7b4Rb+lslq77+dAlvV/H2fZbEwlCNI21Kwc6/0P7kRFXAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy19DYbOBTL3hsZh2mmj6ZEGZop0occsM3fy+HpC9RXkBbgOp33
	0Rb+QgcDzJ1vfwiwCXzJMfAIxpXUbQMNWhWnv8pcBjNiWj0MgXqiXrYASFJdTHjMbNQ=
X-Gm-Gg: ATEYQzx40esjIcV4EUc5RyxWc8Ee+OIm/fmbMVO758HgWo/RU29q04UMONVI2cjBnyG
	s1z03KRVSeppBoaUaObZ3diTeEzN7BmSqyQ9C03d3GbVOqi0mTudClY+/IpTpex0j0ErghaAPAw
	DSqH31IdkHLe6jKghxUlepyNjeBR/KShYrYso0mUpUO1gtqmYQHeWmJTbPF9FLI9bAnI/hJ8Omn
	FZiJ2tZAlvRhxg1/YKR+r+xepyuTlL7LqdYLbudk1Ra4sPd8A5aSuFbJ468rBfapRLneVE+Ysa2
	7pETteM1IRwAWXr8e//Z+M5hK7AYqYO0CikqZN5Ka8RYbBCSXayYUPkX/6qjvUor2v+DteKrfhu
	VJX1Cm15FBU1ff9UY2lwTnv4uKEZ+b+AbBo28r6QmNa9xuxkXic1W1cFMgoAUgUqIxok/3RF2xr
	A9x7VQDteLACEco6ZfZUXEtDZOc3YfQnq1uS16qDElsHuVFB+Oq9ICgcJ/lq4uwxlHKLA3pVk4j
	CU/Sw==
X-Received: by 2002:a05:600c:8484:b0:485:35a4:939c with SMTP id 5b1f17b1804b1-486f4476c41mr61407685e9.29.1773844402828;
        Wed, 18 Mar 2026 07:33:22 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm270642085e9.3.2026.03.18.07.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:33:22 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 18:32:56 +0400
Subject: [PATCH v4 4/4] usb: typec: tcpci_rt1711h: Drop unnecessary
 VID/PID/DID checks
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-husb311-v4-4-69e029255430@flipper.net>
References: <20260318-husb311-v4-0-69e029255430@flipper.net>
In-Reply-To: <20260318-husb311-v4-0-69e029255430@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3831; i=alchark@flipper.net;
 h=from:subject:message-id; bh=qSIoqe1rCM98pYxPjvfzxpcj4EO8iAA2yOd3l9ZnBNY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTu2r6EhS9H+IT/RWf5yla7/yWBwjP+XWvJzfjq9eLc1
 6SH07IudExkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hoY6xjpGDFycAjDVXtWMDKfaFCd8FpDq5AlsWHTjbmrM9maTVRGNL2VFuv0+rPp94hojw9Og62Z
 rXFvMkxXKxCfuPsVnt+BG+NHZP3OvPQvm2ODowgIA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35059-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[flipper.net:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,flipper.net:dkim,flipper.net:email,flipper.net:mid]
X-Rspamd-Queue-Id: BDA862BD3CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Existing checks for VID/PID/DID in the driver are redundant since the
driver is already matched to the device via I2C device ID and OF
compatible strings, and they preclude the use of fallback compatibles.

Remove them to make the driver slimmer and adding new clones easier.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
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


