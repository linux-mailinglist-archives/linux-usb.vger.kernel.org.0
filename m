Return-Path: <linux-usb+bounces-12106-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E7292CF7D
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 578341F232FB
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7DB1922DE;
	Wed, 10 Jul 2024 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XSEVjnrf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB169190044
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607793; cv=none; b=nltJDiunxSOQTFyUP4LUITmeNkkQNsD6eUw2UULqYwtq5LJHntm9WHhP7rMLxG0HopTm7rsemaXHdfDwG0IgyZAqcFTBZmJgWXbsUsY450CXafqDQshPT1+yT+VeGQBKRb1RmTG4p0cqj/Tb2Lz5r+eVq9ufn70W7Ty7apEEXJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607793; c=relaxed/simple;
	bh=iKZAjrHtfdkDTBcwqIT8IIAuEteBm+oT+4/Ldd8Zv/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GV8h2K7GQPIzqNNqrsQpKdyVimWITxiJ3Q/XFEqgyEs/XkVdGDh+b5pIlgOmtkN+5M7A3YE/AI3Hm76BLPIWnsijguLrPcBLK5IqymQQiENomVQefHJDUGGkV4D2pw0yBpTqmAmZE+wL0SAd9/2cL2bXl6b4GiDaXtQX9j9IwWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XSEVjnrf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a77e7a6cfa7so392416166b.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607789; x=1721212589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4f4U8/fOsC4P4OR6kmi2OCEmKlH0wqzpnH4yJN7zB2M=;
        b=XSEVjnrfrZwSrgh4Il98HiOYv0vLV+uEN6PJkWiSU+kVeRhLw8EU08D+4RZ2rNgvvb
         w93W6aaJmau7Y0bb22oMqWoNIJItBmPSbTH+BuFSEuS+tzy/bfR0ji4zNSSM7ExVoSqN
         2OMj/uFdEU39EBsT8P82by/+B6HemnaRTO6OMYr7SwHbbiGs5pFC7UnFAvlx+zhVz4cL
         GonW+VMwARPSVCAtREXDjio+TuEh3Uo/l+DuJzlkPJoEmZzGKNVuRm5YKkS+FF2xsc8P
         v5lAeRMCi0Fzs/0ZNOLdBzAqKQ4fkXEMRxFf61egaCJZf34lbh6wbvJC6gRMvjE1xSqn
         8XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607789; x=1721212589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4f4U8/fOsC4P4OR6kmi2OCEmKlH0wqzpnH4yJN7zB2M=;
        b=TcHO4E2iN5kQduFfRDopdttgUJlClE6gZhMjYZYiiH3xXU3l85/vQ5aHKGrS8JbP7L
         YfucgsfTgdMh/5Vqrr1bpdo/gWBCWevCERfK7HOF2shOA6y7W8L5XiGoazJxszjPtMI9
         HeaVz4FlLlYLIhuTul1PlTeN+2c9EcfLw1ZQyAE48jSfy7UJnqxJRXgqDvxkYQ2toPgU
         wUKaZCFmOjmCRX0nA8pLHidNrnsBg9jsEmQ/rFi+u5a0o1erbhglEkLk2HR+efyw8x4J
         y2QKm019yCGn3gxnt5k/dwsIZNOhwEzAcISpuUFXqftAyzPIJROuIsFWeyZU7YrFztrZ
         +L7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAMc6uiFkKpTjutFnKV5yks53B5Y6TbQ0RuoVUmRSxg+Hbw5TsLW2MgFP2msWwJBY1NsPKmRjBQ1Jo5b1iXnzlmAJUU6bURQuC
X-Gm-Message-State: AOJu0YzRAG3mr6z5UczVVVtCF6lLCazRU9kO8RenpEhrvlseuhuTidnr
	KaeRfESbz4tERzI7gns8vT4HHG58g1HAaFy55+OKNZDz44WlEcFmggbGZZ8OQ30=
X-Google-Smtp-Source: AGHT+IEvqzy9YTroir6a8Gy3exKL8AyeWU3F+zp1bH+uYbn1XzaklbsibxtyHBAUB/KlXQLl381+AQ==
X-Received: by 2002:a17:907:7e82:b0:a77:bf32:b91e with SMTP id a640c23a62f3a-a780b8848e7mr366241666b.49.1720607789137;
        Wed, 10 Jul 2024 03:36:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc77dsm146576966b.52.2024.07.10.03.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:36:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 11:36:18 +0100
Subject: [PATCH 11/15] usb: typec: tcpm/tcpci_maxim: use GENMASK() for
 TCPC_VENDOR_CC_CTRL2 register
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-tcpc-cleanup-v1-11-0ec1f41f4263@linaro.org>
References: <20240710-tcpc-cleanup-v1-0-0ec1f41f4263@linaro.org>
In-Reply-To: <20240710-tcpc-cleanup-v1-0-0ec1f41f4263@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Convert register TCPC_VENDOR_CC_CTRL2 to using GENMASK() and
FIELD_PREP() so as to keep using a similar approach throughout the code
base and make it arguably easier to read.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/maxim_contaminant.c | 18 +++++++++++-------
 drivers/usb/typec/tcpm/tcpci_maxim.h       |  6 +++---
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/tcpm/maxim_contaminant.c b/drivers/usb/typec/tcpm/maxim_contaminant.c
index 8ac8eeade277..f7acaa42329f 100644
--- a/drivers/usb/typec/tcpm/maxim_contaminant.c
+++ b/drivers/usb/typec/tcpm/maxim_contaminant.c
@@ -116,13 +116,14 @@ static int max_contaminant_read_resistance_kohm(struct max_tcpci_chip *chip,
 	if (channel == CC1_SCALE1 || channel == CC2_SCALE1 || channel == CC1_SCALE2 ||
 	    channel == CC2_SCALE2) {
 		/* Enable 1uA current source */
-		ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, CCLPMODESEL_MASK,
-					 ULTRA_LOW_POWER_MODE);
+		ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, CCLPMODESEL,
+					 FIELD_PREP(CCLPMODESEL, ULTRA_LOW_POWER_MODE));
 		if (ret < 0)
 			return ret;
 
 		/* Enable 1uA current source */
-		ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, CCRPCTRL_MASK, UA_1_SRC);
+		ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, CCRPCTRL,
+					 FIELD_PREP(CCRPCTRL, UA_1_SRC));
 		if (ret < 0)
 			return ret;
 
@@ -176,7 +177,8 @@ static int max_contaminant_read_comparators(struct max_tcpci_chip *chip, u8 *ven
 	int ret;
 
 	/* Enable 80uA source */
-	ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, CCRPCTRL_MASK, UA_80_SRC);
+	ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, CCRPCTRL,
+				 FIELD_PREP(CCRPCTRL, UA_80_SRC));
 	if (ret < 0)
 		return ret;
 
@@ -209,7 +211,8 @@ static int max_contaminant_read_comparators(struct max_tcpci_chip *chip, u8 *ven
 	if (ret < 0)
 		return ret;
 
-	ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, CCRPCTRL_MASK, 0);
+	ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, CCRPCTRL,
+				 FIELD_PREP(CCRPCTRL, 0));
 	if (ret < 0)
 		return ret;
 
@@ -298,8 +301,9 @@ static int max_contaminant_enable_dry_detection(struct max_tcpci_chip *chip)
 	if (ret < 0)
 		return ret;
 
-	ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, CCLPMODESEL_MASK,
-				 ULTRA_LOW_POWER_MODE);
+	ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, CCLPMODESEL,
+				 FIELD_PREP(CCLPMODESEL,
+					    ULTRA_LOW_POWER_MODE));
 	if (ret < 0)
 		return ret;
 	ret = max_tcpci_read8(chip, TCPC_VENDOR_CC_CTRL2, &temp);
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.h b/drivers/usb/typec/tcpm/tcpci_maxim.h
index 78ff3b73ee7e..92c9a628ebe1 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.h
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.h
@@ -20,9 +20,9 @@
 #define SBUOVPDIS                               BIT(7)
 #define CCOVPDIS                                BIT(6)
 #define SBURPCTRL                               BIT(5)
-#define CCLPMODESEL_MASK                        GENMASK(4, 3)
-#define ULTRA_LOW_POWER_MODE                    BIT(3)
-#define CCRPCTRL_MASK                           GENMASK(2, 0)
+#define CCLPMODESEL                             GENMASK(4, 3)
+#define ULTRA_LOW_POWER_MODE                    1
+#define CCRPCTRL                                GENMASK(2, 0)
 #define UA_1_SRC                                1
 #define UA_80_SRC                               3
 

-- 
2.45.2.803.g4e1b14247a-goog


