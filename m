Return-Path: <linux-usb+bounces-782-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B67E37B3537
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 16:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 44D26284D64
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 14:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28001513AD;
	Fri, 29 Sep 2023 14:32:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6E7513AB;
	Fri, 29 Sep 2023 14:32:12 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C00E1B7;
	Fri, 29 Sep 2023 07:32:06 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so1644689a12.0;
        Fri, 29 Sep 2023 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695997924; x=1696602724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBJa+cb8dyEAQp6tCGjW9jEwVET1F9T3nDrDaidKVoA=;
        b=nrv21yMlaN1PpwRLtiFYcA4mpXDsfAhOlmzc3IKC5PSawPInz4BvYFEBDtIw0tIQQv
         B10FSk86/s4J/CAI+ANDTpQZk5AIcVeRq84XGEadDftI59ouwUqNP7YzUWSvc+jNBCAu
         80PAwkiog6LGBd+VEa87tI1mLz9jqwyC+QgEuYbTHbAEm2fLQGvJYG4Z19ZM3Gx3nazz
         6NeTGJq7Dwcr/8oDxIVmn6OoZkMgLEQu/aI4d88RL50E8KCPNQbB4QsToj8HAROes+Rc
         UerEUvUbbKMkELjvbdJEacBh4d4ewbo0sCYDK3zm7XzA1LQrcn3k/k4Us5nszokdUpUe
         IR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695997924; x=1696602724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBJa+cb8dyEAQp6tCGjW9jEwVET1F9T3nDrDaidKVoA=;
        b=VvE2gOmPpB2BOT9BT8uwPbKvwIA0hJ39DJBQAHMT0DqWMPq74ia4e82F4inKtqWNw4
         +89QyNCMJwgPDLatnh+48HzK6D9pzDQA/Xe1k6/qeHlSG1uG7nIuCJK6kzQleSPMrsD6
         FyxAA6QdWLsNmJpeq8HZ3bpiF5+V9oXIOKv0Z08G78fTm3Lm74Ba7YRK+Vzav1ZAp/Pw
         eMVAUBfTgM8HQkHqoHrJ70KjjZ6GdQyhwXy6it04Ow43knlWeyJaUFiZU7zO6D9SGvlK
         Knf3cZ9Y4kitYNEsqBX55kN6bbQGD0LQijSfmqimyLJ/Qhcj4IO3JOGtU8UvuZjG2Sfq
         RC1Q==
X-Gm-Message-State: AOJu0YwSdZOVGctMBGd48XvvXvitDTSI32BAOf7brWB7Np2kzQZ+vKF+
	TpQPJyHDjUrSYaP8nElXx4Y=
X-Google-Smtp-Source: AGHT+IHVXofCweihH53NkLW8P8QMLjXZgMZ5bBgy1437QIkgkXX4ySTQOyMG/kkw12Zz9RQTHONblQ==
X-Received: by 2002:a17:906:51c6:b0:9b2:b30f:deb with SMTP id v6-20020a17090651c600b009b2b30f0debmr4443817ejk.4.1695997924606;
        Fri, 29 Sep 2023 07:32:04 -0700 (PDT)
Received: from primary.. ([212.34.12.50])
        by smtp.gmail.com with ESMTPSA id a7-20020a170906670700b0099293cdbc98sm12660105ejp.145.2023.09.29.07.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:32:04 -0700 (PDT)
From: Abdel Alkuor <alkuor@gmail.com>
To: heikki.krogerus@linux.intel.com,
	krzysztof.kozlowski+dt@linaro.org,
	bryan.odonoghue@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ryan.eleceng@gmail.com,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Abdel Alkuor <abdelalkuor@geotab.com>
Subject: [PATCH v8 05/14] USB: typec: tps6598x: Check for EEPROM present
Date: Fri, 29 Sep 2023 10:30:46 -0400
Message-Id: <20230929143055.31360-6-alkuor@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929143055.31360-1-alkuor@gmail.com>
References: <20230929143055.31360-1-alkuor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Abdel Alkuor <abdelalkuor@geotab.com>

When an EEPROM is present, tps25750 loads the binary configuration from
EEPROM. Hence, all we need to do is wait for the device to switch to APP
mode

Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
---
Changes in v8:
  - No changes
Changes in v7:
  - Add driver name to commit subject
Changes in v6: 
  - Update eeprom macro to use TPS instead
Changes in v5:
  - Incorporating tps25750 into tps6598x driver

 drivers/usb/typec/tipd/core.c     | 13 +++++++++++++
 drivers/usb/typec/tipd/tps6598x.h |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 2e7b9eafaf04..21b0ea2c9627 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -37,6 +37,7 @@
 #define TPS_REG_STATUS			0x1a
 #define TPS_REG_SYSTEM_CONF		0x28
 #define TPS_REG_CTRL_CONF		0x29
+#define TPS_REG_BOOT_STATUS		0x2D
 #define TPS_REG_POWER_STATUS		0x3f
 #define TPS_REG_RX_IDENTITY_SOP		0x48
 #define TPS_REG_DATA_STATUS		0x5f
@@ -910,6 +911,17 @@ static int tps25750_apply_patch(struct tps6598x *tps)
 {
 	int ret;
 	unsigned long timeout;
+	u64 status = 0;
+
+	ret = tps6598x_block_read(tps, TPS_REG_BOOT_STATUS, &status, 5);
+	if (ret)
+		return ret;
+	/*
+	 * Nothing to be done if the configuration
+	 * is being loaded from EERPOM
+	 */
+	if (status & TPS_BOOT_STATUS_I2C_EEPROM_PRESENT)
+		goto wait_for_app;
 
 	ret = tps25750_start_patch_burst_mode(tps);
 	if (ret) {
@@ -921,6 +933,7 @@ static int tps25750_apply_patch(struct tps6598x *tps)
 	if (ret)
 		return ret;
 
+wait_for_app:
 	timeout = jiffies + msecs_to_jiffies(1000);
 
 	do {
diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/tps6598x.h
index 527857549d69..a80d0929f3ee 100644
--- a/drivers/usb/typec/tipd/tps6598x.h
+++ b/drivers/usb/typec/tipd/tps6598x.h
@@ -199,4 +199,7 @@
 #define TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT_A    BIT(2)
 #define TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT_B    (BIT(2) | BIT(1))
 
+/* BOOT STATUS REG*/
+#define TPS_BOOT_STATUS_I2C_EEPROM_PRESENT	BIT(3)
+
 #endif /* __TPS6598X_H__ */
-- 
2.34.1


