Return-Path: <linux-usb+bounces-35038-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOOTOABzumkeWwIAu9opvQ
	(envelope-from <linux-usb+bounces-35038-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 10:40:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D0C2B9420
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 10:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AC563268548
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E173B52FD;
	Wed, 18 Mar 2026 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="bfKIO4+m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FCD3B27D3
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825852; cv=none; b=mzHpVUf5f+FuZqS+y3YVwrrzit/wTTe/NTJt5p7mjtb2OLarEsrV1BUylB0r67rm6LwKWZSBKiG6hmlgoOgffi8F+7KxWwo7O4Gq/HhV+X62jwnR/z4mjLnZu7UMHFvkZGQOXni1Z7uvpQhXBeplea8ev/9/nFQIXaDvTa75DDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825852; c=relaxed/simple;
	bh=adUNrc5DmhRHUleLGmdaxH9/D4sLCU6UUObKtpN1GPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0wXbIcTbSNvgAwfsfVawvXimFjVrPtgPM01hzD+UkVJkKzbVbt+arHnCy6hpoUuWThkVuDGrW7ATkrmtSatmb1rBkhO64wZVTXX05EynhK2VKQOlYP9TGEqygbSK4nmde2g7RQ5EriSGlwPjDpR9spVbdAaqzLn8QGbVZBJ+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=bfKIO4+m; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-667f8794e97so514882a12.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 02:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773825849; x=1774430649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZzaejzhKh2/pl8uBJakl190/CtTYCUrflLlLKsisxI=;
        b=bfKIO4+mtjuMcQNbIWJWPJGrwJm1nBY3Nj6e/ojm3sart/NFD/nsgMXOvFmw61uFKu
         atAQzZde7AuT+FGErxtBvA7Y2GnmHcVZKvX2kZUzoz6idSjehZJsyYeqb/tMDPTjCVbl
         acc5S8mAMyH0+L4fVo0gfGvENBnAlzLlAmoAsxFReJnM3oP28HG9SwjBTUVj2P+80cvt
         k6bPvxnueeBELo9a7yk3Cjc6fJIhwe84yD777liyLtXw6R5CXC1FQAv+2t3+TeOcyRhq
         NFjRgeBH1hjFwLeFdIHgSkvWPU/yn1YBH3Q1HWPGzzMCnqpYB37IXSsRpetjqQRpHjYh
         ODBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773825849; x=1774430649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zZzaejzhKh2/pl8uBJakl190/CtTYCUrflLlLKsisxI=;
        b=l3CVfRcj2bPHAWzV0otyXqMMyQfst4BNxDK5KQlOUZUGdF/24Ecko5HUU4N2amSn2b
         T6Ec3dQLzvnU8mM9tRGnna46dxFVrqOUNEI+JFwiAypPLY0jgmmNs+YP4V4vbkMOxGkD
         LSAa1miQ8Jr+7NKjPq7uY3OCn+2gZ/aJ6o9Vb+0STg9lAsmgjDrqwa8FvduKJJ9QcjC5
         59iD5wLTVlPzxjgu6sJ0ClCtXQYdsAVOnOKkAjiBUFU7mE/1VVjHESgwXHhUau7kqZpd
         k1mnP6CbLYhEBS5mSi5fx8RO4Te1bltmKb+r60/mOar9kP+c0RicHutkPAHLO3FcMN1+
         h7mw==
X-Forwarded-Encrypted: i=1; AJvYcCUJy9f6Wje0/511AuDIYNwZFCWHSodhq9RLMHd/aq2SGFR1UroLURQEUQtASGA8iXnNb/DY48icB+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGtBdylCYlMHupDZl3GL7L7DqJT0dbhFFtX97ULA32hyCDYmgQ
	TPl1SSdaT5sPQeXYOqBcdSKe96LklYfr888ylDLHvU4xw6QmkgwfcBGnqC4IgishXo0=
X-Gm-Gg: ATEYQzwBgkT6n4ofXwCj4It1fvVky+T9eJdGzREmTwwEKkvIRmRjTRaQuuDUsAqe/IP
	VryncwrvbnBH0vdc7NSYxuts2+8kLrpAHo0yTtWv4x+dAAi7AHNucFSGPw/cKiJ5XKOuN9v0gpx
	bE7FP28fSjAG3HDANhrY+xvjkWO0zlN/njienWv8WdW2Ar1o62wOpIQi84xkkPCFFXUJkjaVD0i
	ohOIctXHn4sh4U0ceyjY0NZwk5r2LSVSlxzt2PXM6sEY28VCokxI/KQAoI1ttH25cd87/TIIgLQ
	3+6ix54kxawb2Ep0MvXk0U+XYYBZfFwcQp4dcjHnE2JErOEqFLkc105UGlbHKKT0bVAmX4Cg15E
	EHBdPd5Vpr4Up37WJi8H0O7tnc40V3PP9sdVLVSye2f93EhH2IG6ohINSF7J9tGptizeU9eJROo
	oG13wcdjjeGAKWKDa8RdH0oWh4m6HIrI5AlCcTkwRLCaI=
X-Received: by 2002:a05:6402:4304:b0:667:186d:7afe with SMTP id 4fb4d7f45d1cf-667b214d7f1mr1907362a12.6.1773825848904;
        Wed, 18 Mar 2026 02:24:08 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.32.126.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667afb4cf11sm1309970a12.13.2026.03.18.02.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:24:08 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 13:23:46 +0400
Subject: [PATCH v3 4/4] usb: typec: tcpci_rt1711h: Drop unnecessary
 VID/PID/DID checks
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-husb311-v3-4-2b32e6192b9c@flipper.net>
References: <20260318-husb311-v3-0-2b32e6192b9c@flipper.net>
In-Reply-To: <20260318-husb311-v3-0-2b32e6192b9c@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3767; i=alchark@flipper.net;
 h=from:subject:message-id; bh=adUNrc5DmhRHUleLGmdaxH9/D4sLCU6UUObKtpN1GPU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTuytcIa+Ct/yLxZ2eku05C/ZELKxxZmld7XUlITA43b
 rujcGBNx0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFO9io2R4V362fzmOT8tulazp96L+mZnuNPYKuyAfWu4yxOd0zw9LQz/017lTzJ
 iMk26U9Aiu7hZY0eHmmbtt+nKIbGbd3wMO6nJBAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [4.34 / 15.00];
	RECEIVED_BLOCKLISTDE(3.00)[193.32.126.212:received];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[flipper.net:s=google];
	TAGGED_FROM(0.00)[bounces-35038-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[flipper.net,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[flipper.net:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.644];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,flipper.net:dkim,flipper.net:email,flipper.net:mid]
X-Rspamd-Queue-Id: 61D0C2B9420
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


