Return-Path: <linux-usb+bounces-12102-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A37A692CF73
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1074FB26B12
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67929193072;
	Wed, 10 Jul 2024 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MbUzYNLY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E984F18FC95
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607789; cv=none; b=pPuviyU2FqgCQSxBblB+VuyFj2hQ/kZ26Wuj5BBEVSZrTxe1FAlGR3i6lhMByflod5qpxJcBHwgvCQ0lN3O3vTtzfX1NTpLx35zX6Ottb2+lJtGtqYowRuVQ5iDr8WG2lZNej+S/tnTYe7hY/OXi+Uo0Mw22q2orPXCEhCGwcUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607789; c=relaxed/simple;
	bh=sW84uVhoT7q6hbhpajXvF+A6OZDizFcmPHMcYOMyMro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeWRKQpI7I66MN0OlzzdYSDGy7lcK1WG+rVJcvJzR4/GTv/ipHAYpF3oyBoUBpcRWDpm0dHxfOORXlbNuNpsK3qC/ed+iidyB1J73MxA1X6aBloot08LMEeqG2qce3uMlOMBfEZZnP969sa344OyoLmS82iP4ecyaX+8yd8RDuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MbUzYNLY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a77d85f7fa3so102966666b.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607785; x=1721212585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vwjavj6RPqeiyQNJ3n68uYX4MUqGmZQjpRSOl94gIO0=;
        b=MbUzYNLYxDzq9Qfykkx1E5YrdzPMOByvMZYXzW+l8RpJ6t+x1XTib61G+Q9c+uSu0Z
         C3RE97krPhKSV5Qv33V4g2FRPcvdRTVQ25bFrVWsKLN7VEUNIK+5MfSW3E+5tAWQNcjb
         yoyUtOTNf5rh/B8N7Pqt7FrIqBSCnN3ZIt/y9Rt4PBmoajVf0jPSkmXgB+Pj0HgYsNiC
         8BuTNbCYbmnCHtMR5Wqs7TUvsjqFV8CJCI9rF1sXxoTQeWu/ZW9fOfJ33Y/ggjp04HVB
         xYtYJNZN8YziEL6b2Kb7g8NAgSreORQp2hgbnQMKSnw7Cl2c+JNeQ9RL3BJh8BbdEesL
         CKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607785; x=1721212585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vwjavj6RPqeiyQNJ3n68uYX4MUqGmZQjpRSOl94gIO0=;
        b=HkJkay4WkNFGzghWArKt9M+hvQ78R9egWEI2epp78rUxoSTM7PLMKqdEtqYf58COzu
         r8oUQmytV90a5lIHYeHc4yUmvcdeywkAzu/v3u9r6MywL6mdS7BgKpE24swfvOmF55pd
         WAWHAQuHgjAMT3ZHXNC+9fOnYkLYjxGi+96OJRkgFmIWxRGvZPcw2tB7JmOv5aZTK543
         CzyYyS7nfoY0y9lfY2FCRJ6XD2ZsthhIWZGFMvzcBXbwLpGu933LGGXFe911mJYeGs99
         os8IxGULIgv8VqX0A85YmcAqiBwsMU/k+xlOM4zwSaKS3/IAkXB8VwEyQVwK9QT9Mu6f
         blsw==
X-Forwarded-Encrypted: i=1; AJvYcCWcxaPd1XscKJhUOSoquIYrDILFQodIzwNM3SCldP1qrG1lNvJkIKzl4NwA2N2BygjmhAnNQA8rbYQ8c84AZOmhzRe1MnV3tOhA
X-Gm-Message-State: AOJu0Yxk+vJgxk4zaPJViPGM5nQhyBJHQ5BzzkAezJ23urx6m5Rwk8Oy
	tQHgiRSmEdkijYBxMGcczqwmw1TPsPXIPfArTQ//F/FQQXo6XKH+FzgG8EqAeMI=
X-Google-Smtp-Source: AGHT+IHUTKIvR3XwPGDJ3agEObdSPf5IVHYSTkjhYzMGwyHu0kgGSWWMEcYfIz+1xNw58nSsctD10A==
X-Received: by 2002:a17:907:3fa0:b0:a6f:e03a:99d with SMTP id a640c23a62f3a-a780d0a4445mr454600466b.0.1720607785399;
        Wed, 10 Jul 2024 03:36:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc77dsm146576966b.52.2024.07.10.03.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:36:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 11:36:12 +0100
Subject: [PATCH 05/15] usb: typec: tcpci: use GENMASK() for
 TCPC_ROLE_CTRL_RP_VAL
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-tcpc-cleanup-v1-5-0ec1f41f4263@linaro.org>
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

Align the last remaining field TCPC_ROLE_CTRL_RP_VAL with the other
fields in the TCPC_ROLE_CTRL register by using GENMASK() and
FIELD_PREP().

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci.c         | 21 ++++++++++++---------
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 12 ++++++------
 include/linux/usb/tcpci.h              |  3 +--
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index cd71ece7b956..5ad05a5bbbd1 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -114,17 +114,20 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
 	case TYPEC_CC_RP_DEF:
 		reg = (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RP)
 		       | FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RP)
-		       | (TCPC_ROLE_CTRL_RP_VAL_DEF << TCPC_ROLE_CTRL_RP_VAL_SHIFT));
+		       | FIELD_PREP(TCPC_ROLE_CTRL_RP_VAL,
+				    TCPC_ROLE_CTRL_RP_VAL_DEF));
 		break;
 	case TYPEC_CC_RP_1_5:
 		reg = (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RP)
 		       | FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RP)
-		       | (TCPC_ROLE_CTRL_RP_VAL_1_5 << TCPC_ROLE_CTRL_RP_VAL_SHIFT));
+		       | FIELD_PREP(TCPC_ROLE_CTRL_RP_VAL,
+				    TCPC_ROLE_CTRL_RP_VAL_1_5));
 		break;
 	case TYPEC_CC_RP_3_0:
 		reg = (FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RP)
 		       | FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RP)
-		       | (TCPC_ROLE_CTRL_RP_VAL_3_0 << TCPC_ROLE_CTRL_RP_VAL_SHIFT));
+		       | FIELD_PREP(TCPC_ROLE_CTRL_RP_VAL,
+				    TCPC_ROLE_CTRL_RP_VAL_3_0));
 		break;
 	case TYPEC_CC_OPEN:
 	default:
@@ -194,16 +197,16 @@ static int tcpci_start_toggling(struct tcpc_dev *tcpc,
 	switch (cc) {
 	default:
 	case TYPEC_CC_RP_DEF:
-		reg |= (TCPC_ROLE_CTRL_RP_VAL_DEF <<
-			TCPC_ROLE_CTRL_RP_VAL_SHIFT);
+		reg |= FIELD_PREP(TCPC_ROLE_CTRL_RP_VAL,
+				  TCPC_ROLE_CTRL_RP_VAL_DEF);
 		break;
 	case TYPEC_CC_RP_1_5:
-		reg |= (TCPC_ROLE_CTRL_RP_VAL_1_5 <<
-			TCPC_ROLE_CTRL_RP_VAL_SHIFT);
+		reg |= FIELD_PREP(TCPC_ROLE_CTRL_RP_VAL,
+				  TCPC_ROLE_CTRL_RP_VAL_1_5);
 		break;
 	case TYPEC_CC_RP_3_0:
-		reg |= (TCPC_ROLE_CTRL_RP_VAL_3_0 <<
-			TCPC_ROLE_CTRL_RP_VAL_SHIFT);
+		reg |= FIELD_PREP(TCPC_ROLE_CTRL_RP_VAL,
+				  TCPC_ROLE_CTRL_RP_VAL_3_0);
 		break;
 	}
 
diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index bdb78d08b5b5..64f6dd0dc660 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -232,16 +232,16 @@ static int rt1711h_start_drp_toggling(struct tcpci *tcpci,
 	switch (cc) {
 	default:
 	case TYPEC_CC_RP_DEF:
-		reg |= (TCPC_ROLE_CTRL_RP_VAL_DEF <<
-			TCPC_ROLE_CTRL_RP_VAL_SHIFT);
+		reg |= FIELD_PREP(TCPC_ROLE_CTRL_RP_VAL,
+				  TCPC_ROLE_CTRL_RP_VAL_DEF);
 		break;
 	case TYPEC_CC_RP_1_5:
-		reg |= (TCPC_ROLE_CTRL_RP_VAL_1_5 <<
-			TCPC_ROLE_CTRL_RP_VAL_SHIFT);
+		reg |= FIELD_PREP(TCPC_ROLE_CTRL_RP_VAL,
+				  TCPC_ROLE_CTRL_RP_VAL_1_5);
 		break;
 	case TYPEC_CC_RP_3_0:
-		reg |= (TCPC_ROLE_CTRL_RP_VAL_3_0 <<
-			TCPC_ROLE_CTRL_RP_VAL_SHIFT);
+		reg |= FIELD_PREP(TCPC_ROLE_CTRL_RP_VAL,
+				  TCPC_ROLE_CTRL_RP_VAL_3_0);
 		break;
 	}
 
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index 552d074429f0..80652d4f722e 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -63,8 +63,7 @@
 
 #define TCPC_ROLE_CTRL			0x1a
 #define TCPC_ROLE_CTRL_DRP		BIT(6)
-#define TCPC_ROLE_CTRL_RP_VAL_SHIFT	4
-#define TCPC_ROLE_CTRL_RP_VAL_MASK	0x3
+#define TCPC_ROLE_CTRL_RP_VAL		GENMASK(5, 4)
 #define TCPC_ROLE_CTRL_RP_VAL_DEF	0x0
 #define TCPC_ROLE_CTRL_RP_VAL_1_5	0x1
 #define TCPC_ROLE_CTRL_RP_VAL_3_0	0x2

-- 
2.45.2.803.g4e1b14247a-goog


