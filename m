Return-Path: <linux-usb+bounces-12099-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AF292CF6D
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 792A91C223F3
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE551191478;
	Wed, 10 Jul 2024 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLWkzrnD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE1A18FC61
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607789; cv=none; b=aS/7MPXbzLTiWv27aFToDcrO517NSYu30cNHNHYg9fLCTOvKSfYsiBWzny8fv9w/1Cv8yS9ZHPKEw2VkpvhyX8CckiU/k0GTShv2AtLdPejmLjeuieF0gfoib3qLGUfYMLtGaZPPuHQT+CXJEYaOhXRvud1qIVe2ZpQGf+R9CMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607789; c=relaxed/simple;
	bh=UpNyt3hPB6krYjnIMNVu3bl0PxDu7L8l/9FunFkfXJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ig7B54RHxyFM4rajtHjHP2T8riNIryaagUS73B17vYwvUrOGYw1H1knz0scmn9fFsewope+xmU02/0BcHjT2/y0IR4hqqCQc3MAIxwHvkUChG9cjSPXJyQHUeGWNwzlCKIe6FqtCwKmpiUFGM0qUUHkt0sC1bp9m+fX56Nde6+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vLWkzrnD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-58ba3e38028so7892288a12.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607785; x=1721212585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKvNmNonW4k4hzY7mYArULLqBs8XeH3VnuyLyDk7L3s=;
        b=vLWkzrnDXi0yzGDSJmyQHAGTZv6O4P0x9ckO0yt9v+0wJFeXJLvWc2kxCKQEGlLgpG
         9B7CDTCT37kf/qa9nu6/ULkxr5Tt6R9gDsUnoQrvzgrkIZEYE80DkifDeiUhJHlc1Qpg
         VfSmwt1vjaWDo9fi4CsJexjcVKCS2ZclVbQPrUOteaDl0ocVwBtnzf2FeBIznJpW2Kni
         BLCHzQjkqwrAGGZ5XMKLWGnYHZYHe49b0SEHfZhDsj59RBlyv5cQfNvqXbN9l2kc+/v5
         Jp09Ux0j+O2cbOvJiGmjwSvN+JEiTziImEPKhlWqsk3UddI+0rW8Pew8eJv0+skIYc6k
         bqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607785; x=1721212585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKvNmNonW4k4hzY7mYArULLqBs8XeH3VnuyLyDk7L3s=;
        b=ozNKVzm9TxBbi0hpejIIrrjUBi4myr5GIwUog5fQ80cU8c2jjshCH0/rIvXYmQcoSk
         tO7eHPrFCKm2JhwOnPBVYvj+FSywPrBeeFt1gjDS7f2RdSQNWo7CwIlbftRc5S/uVkgR
         mL15HQ+++F2tmbofaAjSCkUNyE0Lnl9HFaRSqvWlNcXE5qYr06k8HsNgy7bNb2dwY9P+
         DKTGuL3mosyuFnkoHj2Sg7RHVJ5RuBMo+AC2DeNlI5Ek1ZirMq3FjLSHP3uzPrUy+vwg
         YxB/Xfjnw1Y28cb0yUn5cOovv2JUcH8Bi8nKFRXlZR+ZPX6B8Dm5UcwBO7GB4WkmIbYb
         JzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWov4f0vJTGbqnB8USplyT0QsmcLxT6PsUdXiqr7StwivizDffUqDp+uLU6t6+xDn921+/MdLQ73HrY5qR3DKsBRXfPRT0uB2o
X-Gm-Message-State: AOJu0Yy1YAQnfgyXZaRmF2Tb7g/maCxc4IkqR/uGPo0g4D5fqrVwVHPx
	OAPHox77ygxJkZ083DzsUVakKkcKWu9St/j70mXKd+hz1WRbCCSzsFSGPimVhyI=
X-Google-Smtp-Source: AGHT+IEANfZn8xYveZOZpH1PlIfZ5CExCb4Ai1+KB0oG2AncjlZQBjTB2r9uGvLZ2yNxiX3Q8zHqjg==
X-Received: by 2002:a17:906:a848:b0:a77:e2e3:355f with SMTP id a640c23a62f3a-a780b7051f2mr279818966b.41.1720607784952;
        Wed, 10 Jul 2024 03:36:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc77dsm146576966b.52.2024.07.10.03.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:36:24 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 11:36:11 +0100
Subject: [PATCH 04/15] usb: typec: tcpci: use GENMASK() for
 TCPC_ROLE_CTRL_CC[12]
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-tcpc-cleanup-v1-4-0ec1f41f4263@linaro.org>
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

All this open-coded shifting and masking is quite hard to read, in
particular the if-statement in tcpci_apply_rc().

Declare TCPC_ROLE_CTRL_CC[12] using GENMASK() which allows using
FIELD_GET() and FIELD_PREP() to arguably make the code more legible.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/anx7411.c            |  5 ++-
 drivers/usb/typec/tcpm/tcpci.c         | 73 +++++++++++++++-------------------
 drivers/usb/typec/tcpm/tcpci_rt1711h.c |  8 ++--
 include/linux/usb/tcpci.h              |  9 ++---
 4 files changed, 43 insertions(+), 52 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index b12a07edc71b..78b0d856cfc1 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -6,6 +6,7 @@
  * Copyright(c) 2022, Analogix Semiconductor. All rights reserved.
  *
  */
+#include <linux/bitfield.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -884,8 +885,8 @@ static void anx7411_chip_standby(struct anx7411_data *ctx)
 				OCM_RESET);
 	ret |= anx7411_reg_write(ctx->tcpc_client, ANALOG_CTRL_10, 0x80);
 	/* Set TCPC to RD and DRP enable */
-	cc1 = TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC1_SHIFT;
-	cc2 = TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC2_SHIFT;
+	cc1 = FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RD);
+	cc2 = FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RD);
 	ret |= anx7411_reg_write(ctx->tcpc_client, TCPC_ROLE_CTRL,
 				 TCPC_ROLE_CTRL_DRP | cc1 | cc2);
 
diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index ce11a154c7dc..cd71ece7b956 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -104,45 +104,42 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
 
 	switch (cc) {
 	case TYPEC_CC_RA:
-		reg = (TCPC_ROLE_CTRL_CC_RA << TCPC_ROLE_CTRL_CC1_SHIFT) |
-			(TCPC_ROLE_CTRL_CC_RA << TCPC_ROLE_CTRL_CC2_SHIFT);
+		reg = (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RA)
+		       | FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RA));
 		break;
 	case TYPEC_CC_RD:
-		reg = (TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC1_SHIFT) |
-			(TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC2_SHIFT);
+		reg = (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RD)
+		       | FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RD));
 		break;
 	case TYPEC_CC_RP_DEF:
-		reg = (TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC1_SHIFT) |
-			(TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC2_SHIFT) |
-			(TCPC_ROLE_CTRL_RP_VAL_DEF <<
-			 TCPC_ROLE_CTRL_RP_VAL_SHIFT);
+		reg = (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RP)
+		       | FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RP)
+		       | (TCPC_ROLE_CTRL_RP_VAL_DEF << TCPC_ROLE_CTRL_RP_VAL_SHIFT));
 		break;
 	case TYPEC_CC_RP_1_5:
-		reg = (TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC1_SHIFT) |
-			(TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC2_SHIFT) |
-			(TCPC_ROLE_CTRL_RP_VAL_1_5 <<
-			 TCPC_ROLE_CTRL_RP_VAL_SHIFT);
+		reg = (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RP)
+		       | FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RP)
+		       | (TCPC_ROLE_CTRL_RP_VAL_1_5 << TCPC_ROLE_CTRL_RP_VAL_SHIFT));
 		break;
 	case TYPEC_CC_RP_3_0:
-		reg = (TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC1_SHIFT) |
-			(TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC2_SHIFT) |
-			(TCPC_ROLE_CTRL_RP_VAL_3_0 <<
-			 TCPC_ROLE_CTRL_RP_VAL_SHIFT);
+		reg = (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RP)
+		       | FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RP)
+		       | (TCPC_ROLE_CTRL_RP_VAL_3_0 << TCPC_ROLE_CTRL_RP_VAL_SHIFT));
 		break;
 	case TYPEC_CC_OPEN:
 	default:
-		reg = (TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC1_SHIFT) |
-			(TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC2_SHIFT);
+		reg = (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_OPEN)
+		       | FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_OPEN));
 		break;
 	}
 
 	if (vconn_pres) {
 		if (polarity == TYPEC_POLARITY_CC2) {
-			reg &= ~(TCPC_ROLE_CTRL_CC1_MASK << TCPC_ROLE_CTRL_CC1_SHIFT);
-			reg |= (TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC1_SHIFT);
+			reg &= ~TCPC_ROLE_CTRL_CC1;
+			reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_OPEN);
 		} else {
-			reg &= ~(TCPC_ROLE_CTRL_CC2_MASK << TCPC_ROLE_CTRL_CC2_SHIFT);
-			reg |= (TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC2_SHIFT);
+			reg &= ~TCPC_ROLE_CTRL_CC2;
+			reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_OPEN);
 		}
 	}
 
@@ -168,15 +165,11 @@ static int tcpci_apply_rc(struct tcpc_dev *tcpc, enum typec_cc_status cc,
 	 * APPLY_RC state is when ROLE_CONTROL.CC1 != ROLE_CONTROL.CC2 and vbus autodischarge on
 	 * disconnect is disabled. Bail out when ROLE_CONTROL.CC1 != ROLE_CONTROL.CC2.
 	 */
-	if (((reg & (TCPC_ROLE_CTRL_CC2_MASK << TCPC_ROLE_CTRL_CC2_SHIFT)) >>
-	     TCPC_ROLE_CTRL_CC2_SHIFT) !=
-	    ((reg & (TCPC_ROLE_CTRL_CC1_MASK << TCPC_ROLE_CTRL_CC1_SHIFT)) >>
-	     TCPC_ROLE_CTRL_CC1_SHIFT))
+	if (FIELD_GET(TCPC_ROLE_CTRL_CC2, reg) != FIELD_GET(TCPC_ROLE_CTRL_CC1, reg))
 		return 0;
 
 	return regmap_update_bits(tcpci->regmap, TCPC_ROLE_CTRL, polarity == TYPEC_POLARITY_CC1 ?
-				  TCPC_ROLE_CTRL_CC2_MASK << TCPC_ROLE_CTRL_CC2_SHIFT :
-				  TCPC_ROLE_CTRL_CC1_MASK << TCPC_ROLE_CTRL_CC1_SHIFT,
+				  TCPC_ROLE_CTRL_CC2 : TCPC_ROLE_CTRL_CC1,
 				  TCPC_ROLE_CTRL_CC_OPEN);
 }
 
@@ -215,11 +208,11 @@ static int tcpci_start_toggling(struct tcpc_dev *tcpc,
 	}
 
 	if (cc == TYPEC_CC_RD)
-		reg |= (TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC1_SHIFT) |
-			   (TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC2_SHIFT);
+		reg |= (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RD)
+			| FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RD));
 	else
-		reg |= (TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC1_SHIFT) |
-			   (TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC2_SHIFT);
+		reg |= (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RP)
+			| FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RP));
 	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
 	if (ret < 0)
 		return ret;
@@ -281,28 +274,28 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 		reg = reg & ~TCPC_ROLE_CTRL_DRP;
 
 		if (polarity == TYPEC_POLARITY_CC2) {
-			reg &= ~(TCPC_ROLE_CTRL_CC2_MASK << TCPC_ROLE_CTRL_CC2_SHIFT);
+			reg &= ~TCPC_ROLE_CTRL_CC2;
 			/* Local port is source */
 			if (cc2 == TYPEC_CC_RD)
 				/* Role control would have the Rp setting when DRP was enabled */
-				reg |= TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC2_SHIFT;
+				reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RP);
 			else
-				reg |= TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC2_SHIFT;
+				reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RD);
 		} else {
-			reg &= ~(TCPC_ROLE_CTRL_CC1_MASK << TCPC_ROLE_CTRL_CC1_SHIFT);
+			reg &= ~TCPC_ROLE_CTRL_CC1;
 			/* Local port is source */
 			if (cc1 == TYPEC_CC_RD)
 				/* Role control would have the Rp setting when DRP was enabled */
-				reg |= TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC1_SHIFT;
+				reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RP);
 			else
-				reg |= TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC1_SHIFT;
+				reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RD);
 		}
 	}
 
 	if (polarity == TYPEC_POLARITY_CC2)
-		reg |= TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC1_SHIFT;
+		reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_OPEN);
 	else
-		reg |= TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC2_SHIFT;
+		reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_OPEN);
 	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index c6dbccf6b17a..bdb78d08b5b5 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -246,11 +246,11 @@ static int rt1711h_start_drp_toggling(struct tcpci *tcpci,
 	}
 
 	if (cc == TYPEC_CC_RD)
-		reg |= (TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC1_SHIFT) |
-			   (TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC2_SHIFT);
+		reg |= (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RD)
+			| FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RD));
 	else
-		reg |= (TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC1_SHIFT) |
-			   (TCPC_ROLE_CTRL_CC_RP << TCPC_ROLE_CTRL_CC2_SHIFT);
+		reg |= (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RP)
+			| FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RP));
 
 	ret = rt1711h_write8(chip, TCPC_ROLE_CTRL, reg);
 	if (ret < 0)
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index 31d21ccf662b..552d074429f0 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -68,10 +68,8 @@
 #define TCPC_ROLE_CTRL_RP_VAL_DEF	0x0
 #define TCPC_ROLE_CTRL_RP_VAL_1_5	0x1
 #define TCPC_ROLE_CTRL_RP_VAL_3_0	0x2
-#define TCPC_ROLE_CTRL_CC2_SHIFT	2
-#define TCPC_ROLE_CTRL_CC2_MASK		0x3
-#define TCPC_ROLE_CTRL_CC1_SHIFT	0
-#define TCPC_ROLE_CTRL_CC1_MASK		0x3
+#define TCPC_ROLE_CTRL_CC2		GENMASK(3, 2)
+#define TCPC_ROLE_CTRL_CC1		GENMASK(1, 0)
 #define TCPC_ROLE_CTRL_CC_RA		0x0
 #define TCPC_ROLE_CTRL_CC_RP		0x1
 #define TCPC_ROLE_CTRL_CC_RD		0x2
@@ -176,8 +174,7 @@
 
 #define tcpc_presenting_rd(reg, cc) \
 	(!(TCPC_ROLE_CTRL_DRP & (reg)) && \
-	 (((reg) & (TCPC_ROLE_CTRL_## cc ##_MASK << TCPC_ROLE_CTRL_## cc ##_SHIFT)) == \
-	  (TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_## cc ##_SHIFT)))
+	 FIELD_GET(TCPC_ROLE_CTRL_## cc, reg) == TCPC_ROLE_CTRL_CC_RD)
 
 struct tcpci;
 

-- 
2.45.2.803.g4e1b14247a-goog


