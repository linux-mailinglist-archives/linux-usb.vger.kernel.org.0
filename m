Return-Path: <linux-usb+bounces-862-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E72BC7B45FB
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 10:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id E66AF1C20B92
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 08:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0818134AB;
	Sun,  1 Oct 2023 08:15:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26B914F87;
	Sun,  1 Oct 2023 08:15:29 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C45EA;
	Sun,  1 Oct 2023 01:15:27 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9ad8a822508so2158568566b.0;
        Sun, 01 Oct 2023 01:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696148126; x=1696752926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39ntlcYvDYrsu2wkLxDzmVg+LA5a9z1WHwPNTIKFmRs=;
        b=jNTGOrHskVgeAPjBDmmszNf7xAy+CK929rEJrauutvWSzEyaTb4tb5OrZ4ahHP/0Bw
         EjnhQJ6c6Mcx072AXRLUAVQgaOUMu7u6AjBUR+eScxO8pQUTh6cr/j3SXzjQcfikwxCH
         IiD1LsJQR3fBjTdLVMzcSh9lS96fwALeFtijyszL8apFDhO8RCKsNDU8VBCchnQSPWAs
         8OOT0AqdPtz60CBVpbBGEAmvQFTrCUkxAJv3Ue5b+AN4KiZNh6iVaCN7YKBoa5wUDuW8
         IQsSwc3KyzpLSeHbcLgV1qbLddSynujDNrzE7fFHJstzk2tvSKDhtko6Mc7ZJwFz/E0w
         VAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696148126; x=1696752926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39ntlcYvDYrsu2wkLxDzmVg+LA5a9z1WHwPNTIKFmRs=;
        b=bwJgFStFLs/kin6oP/jY1v6CF5W6LNCQu7hG5FIn14XYpNSpvHFvS8d6byobBZuB2K
         +H+eWfKH7rn2CzCiSIjYs/ScoTgfRpzWfaNHX0JyIqjaepUek9dx2OdMzd4AS/dltBT3
         9of3wxtW8zgE2zOZezjlzX7BV6qVa77kc2jXF/HH+nrUl6m1ebM7KSBMF1OKM2LSf+GU
         w3xKWaK6tmaJye4Lh+09xHz9I0vgGU+BwcPxx/C4y9gegJp6XIzy7ExHdwLY4KSyJkce
         rXl6H1zrvXbFYIbNdnOXm3NWhvImvkPEgpBkoMfBx488/hgH7PH5acXOD56P1Ihbw8P2
         t5Gg==
X-Gm-Message-State: AOJu0YwMRjNY4bI1GvmIxl9vl/PWXPUU7JN9tqoW5yA6WkZCSu91aw0d
	bHCeow6hHohV0XJzsT1EdEg=
X-Google-Smtp-Source: AGHT+IEAkWDhVU4yUuxEbxvyqsYGD8mrXa6cUiTAsCt8XyivaImPNBfj7P+MAHOLfdDxdmJml9Wcmw==
X-Received: by 2002:a17:906:5daa:b0:9ad:7890:b4c0 with SMTP id n10-20020a1709065daa00b009ad7890b4c0mr6250083ejv.56.1696148126108;
        Sun, 01 Oct 2023 01:15:26 -0700 (PDT)
Received: from primary.. ([213.139.52.198])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906374800b0099cf840527csm15121841ejc.153.2023.10.01.01.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 01:15:25 -0700 (PDT)
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
Subject: [PATCH v9 05/14] USB: typec: tps6598x: Check for EEPROM present
Date: Sun,  1 Oct 2023 04:11:25 -0400
Message-Id: <20231001081134.37101-6-alkuor@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231001081134.37101-1-alkuor@gmail.com>
References: <20231001081134.37101-1-alkuor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Abdel Alkuor <abdelalkuor@geotab.com>

When an EEPROM is present, tps25750 loads the binary configuration from
EEPROM. Hence, all we need to do is wait for the device to switch to APP
mode

Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
---
Changes in v9:
  - No changes
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


