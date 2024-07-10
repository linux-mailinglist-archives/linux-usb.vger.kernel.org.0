Return-Path: <linux-usb+bounces-12110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B27A992CF9E
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A77E1B2B589
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71611953AB;
	Wed, 10 Jul 2024 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t2iuUmxu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB2D18EFF9
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607795; cv=none; b=GQSQ1VEdhNa1fsyd8HToY3QxQqzi5WZeJ37HzSc8rJHHUBEVVXMNs7z0NHKZDUWELNhlFZG409WGPu01R5DG04BfJ1sPvT2GgnpWRBbNBE/KE8zPesVRjO8Zdn1hoROMkW3UNQsQT3dkTw7rofnmlwpc+2c5vZ34tB1cGAUBw7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607795; c=relaxed/simple;
	bh=5yRLOBbpIkonyEMF2zlkIakdxYmFf6q9yRfJ8EyXCI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oK3vYLS5jOWgyr0+lYzcZdu+adS4fMZhsglwKUmCRGbs/j9dE/8o8Pfg8OF15CH3oWs+LdqHeJokRjmRoW5Op2QAJGQGr5ctLZJMcjCPwmPMEfaONmyXZOy65vGEUOI1EAiac62xNFlTodlY0z0XzUbNAXAM7GPF4SWItPyIdDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t2iuUmxu; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a77dc08db60so568207266b.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607790; x=1721212590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYMGxlVQPX5oebPOJL95p63LDeiB2wZboyKuWqi62pM=;
        b=t2iuUmxu/JD0RJmUdNdUC6/sahYaSXdMd9idXe/zvL6WBe2JddU1mNjG1j5O0A3jTH
         7R3zxhioJLND98IyPN38hf2sPQh/l1m2NS5tzeD6LBMy6sN0fBMXnBzaS+3lUgPIMNVh
         wpWqCQIlcTDtdJMCnT5NGOcRa4VOMmvhXD9hqfcdDL43mcIZRZQNMKaV7LtOGz+B3j1l
         rpgySzBrU0MpzyIKJ/i3Lg6zxS9LXwPN70qF2j05Sg187ph2/b7eMGTlVUwzlKda2qo6
         cek+H56/A6WZFZg9sUlYjgig5cipxBuGBub/H1WEXtzwcp4SSk1MEy2QCs4RgMohx77b
         v+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607790; x=1721212590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYMGxlVQPX5oebPOJL95p63LDeiB2wZboyKuWqi62pM=;
        b=Bp7ug27DDZaPOvgpo3u/yy0ceUbrl2HNQHdaDJ/fMDas8eiklHAgzJapbMiDqalJvC
         89p9AL1R8ovUmhM8wdG6lE9uhR0kqz8yUFl2MNjadd3YyFrbVjJAgh0ghX96m6oesHfm
         o5cIEFQeWhR1Gn4SK3Etr73M3u+clDMvCQG+PB45OBcjzLSUbQFnzRghwWaYKBJBOwyo
         K8J0qDo7PSU+ywXmjRXXYs0ynq0XsKU+E7+MfvjPYQyMptxudchXnU47945sGXajsrDF
         SPui+ec29POppeSMpCLCv/6jG1Pzi7AeNFtvTR8rUpCWHJgn13AVqGVvklH9lEGNeDiH
         85uA==
X-Forwarded-Encrypted: i=1; AJvYcCWCUrNe20Cm7jpaCIy3UiRLhj24PDESipCyF6Vrf3l2rQ61VpPTeu6ITW0DFVIJ/4gI+oF5eVL2foCh8r9KM5CF2wm+GjyZ7cqb
X-Gm-Message-State: AOJu0YwGCiUmVUZ/Z9bUKtqFQGgPDguvmtkPUGYVrE14NURrilWSWezN
	NFtNoVXKWlggDji83zGM2KxUXJqIGvlarU4CU943gHBS2B2OBmp3W7FHSVtQzkI=
X-Google-Smtp-Source: AGHT+IF1B0nCfAGt+fXGX3owUMA0Hi5Y5naIp5/iV6A4WHwQy1qFb0eKndiXPEm0xY4mUwcKTmld6A==
X-Received: by 2002:a17:906:1610:b0:a72:aeff:dfed with SMTP id a640c23a62f3a-a780b8826b7mr381618866b.53.1720607789980;
        Wed, 10 Jul 2024 03:36:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc77dsm146576966b.52.2024.07.10.03.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:36:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 11:36:20 +0100
Subject: [PATCH 13/15] usb: typec: tcpm/tcpci_maxim: use GENMASK() for
 TCPC_VENDOR_ADC_CTRL1 register
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-tcpc-cleanup-v1-13-0ec1f41f4263@linaro.org>
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

Convert register TCPC_VENDOR_ADC_CTRL1 to using GENMASK() and
FIELD_PREP() so as to keep using a similar approach throughout the code
base and make it arguably easier to read.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/maxim_contaminant.c | 7 ++++---
 drivers/usb/typec/tcpm/tcpci_maxim.h       | 3 +--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/maxim_contaminant.c b/drivers/usb/typec/tcpm/maxim_contaminant.c
index cf9887de96c9..7bfec45e8f4f 100644
--- a/drivers/usb/typec/tcpm/maxim_contaminant.c
+++ b/drivers/usb/typec/tcpm/maxim_contaminant.c
@@ -76,8 +76,8 @@ static int max_contaminant_read_adc_mv(struct max_tcpci_chip *chip, enum fladc_s
 	int ret;
 
 	/* Channel & scale select */
-	ret = regmap_update_bits(regmap, TCPC_VENDOR_ADC_CTRL1, ADCINSEL_MASK,
-				 channel << ADC_CHANNEL_OFFSET);
+	ret = regmap_update_bits(regmap, TCPC_VENDOR_ADC_CTRL1, ADCINSEL,
+				 FIELD_PREP(ADCINSEL, channel));
 	if (ret < 0)
 		return ret;
 
@@ -96,7 +96,8 @@ static int max_contaminant_read_adc_mv(struct max_tcpci_chip *chip, enum fladc_s
 	if (ret < 0)
 		return ret;
 
-	ret = regmap_update_bits(regmap, TCPC_VENDOR_ADC_CTRL1, ADCINSEL_MASK, 0);
+	ret = regmap_update_bits(regmap, TCPC_VENDOR_ADC_CTRL1, ADCINSEL,
+				 FIELD_PREP(ADCINSEL, 0));
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.h b/drivers/usb/typec/tcpm/tcpci_maxim.h
index 34076069444f..a41ca9e7ad08 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.h
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.h
@@ -37,8 +37,7 @@
 #define WTRCYCLE_4_8_S                          1
 
 #define TCPC_VENDOR_ADC_CTRL1                   0x91
-#define ADCINSEL_MASK                           GENMASK(7, 5)
-#define ADC_CHANNEL_OFFSET                      5
+#define ADCINSEL                                GENMASK(7, 5)
 #define ADCEN                                   BIT(0)
 
 enum contamiant_state {

-- 
2.45.2.803.g4e1b14247a-goog


