Return-Path: <linux-usb+bounces-12103-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CCD92CF76
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E75A1C23C12
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB4019309D;
	Wed, 10 Jul 2024 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GHuzfaLA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5EF190693
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607790; cv=none; b=d5fwr7VLVZYRMywhNeSMogio9Ae5hNZ0zEso9a7yvB4/1Ypaaw4Yja6bAcmpAuQqBWM0ARo7t8XKqQgbaDcL00howtTWYl4EgW5sK5YzRxITNgq905OF+b4aYNJfDUZWu9y4mqA3YUlF3mh7H/hEBf4wgkTKv+O5ydxWWXsMCCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607790; c=relaxed/simple;
	bh=UAK71+lPiVudSRvlmklIgP5araaTerPQgArmnySOaQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HCdyk0G/79/NoLaJe4zIW9lWE/OZyJJAG1WGrKbohQHIweqxn+xwsTzcAygy3kK5a+ybBtQTEACLfE2xiaWCZz9oUTWlQnnT6ee7WjQYykWABYeCOQS8NgCC95QkEB54puveSLQ+ujSrjmXT9Epxand9F7BvvN7DeDPTaWNN/zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GHuzfaLA; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea5dc3c66so8751513e87.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607787; x=1721212587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJ8rGYIkXyuBqurWfe+RKCWq1Fp47kuxHXtN7U7bICs=;
        b=GHuzfaLAfxUEjxmPSRYkzl70rG/3RBNa1geqPCG3Ge7EEjCoI/vLmrJPr0mT2YxRWR
         HddaGLk0x5+/elP/DzuDvVDEw0B4NFCeb27C8k+RjYz3bNyHiEZ+NpBFt7h0IR8Bgt10
         LguNxBKsj9BVLb6/9MZpTdFiij5mI78+A8iAnl5YOLxO7Phf+RFIf3dniU4yXYKcUZxz
         73fMFhhUftbvK53W++kKycUh3mgh6MkOqsWjRqSBvV1ie1y/LvhDO9X/TACT6HYHFJcK
         O/iYsfdqG15Td1lhDb7JFLw9syiV2zD6oKeA9DheDEQ/8uaB8o5LR7xgiHXRomWlYFvT
         MQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607787; x=1721212587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJ8rGYIkXyuBqurWfe+RKCWq1Fp47kuxHXtN7U7bICs=;
        b=SFQ6hE/7yOboEhZK7/pgvo+gY7tULrDFdvO7pVORDNuLcZ2FFSdON8PCm6zWV167Zn
         k39xNPODELfT5OQbDycxRdk1gmfrGy6PXOQX4OFoT/IxqGt8sGee+4ougCStYwFkGiSX
         TZdwjiKMZ0qdRZvut3UJDeFqlfoGv7o9awiwK1NrvUy8lfm9UywhZFcSw0xvJ/qAo2Hq
         covCAJb0IfdTWQNHp8ARTaEWyTMdFm/uL21qLSMqBy2c7SXvCz5sPpYQeDMT6Q0Yj+uF
         g61uatQi/qUTBpWZ05MWOJaDVWIaMmtUA6SKMyw767j9XF2wZGjAeL9CHIIrZyZoLUqK
         CqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSC1fuY0JShCKmeDQ9Bp78Z09B6xZpxFjnv+oTTh76yi81jUtQaLcrX7pTvKIEzsG+iBik8LOuTKLA2jHN4+RL2ThUbKPbViBx
X-Gm-Message-State: AOJu0Yx5f0/drFkpzKf1HfkWd6Jv9E5LFcNUHQiwaNgBgH6Ed9D+hLgQ
	IhxQOKrz546cLznKIOWAx3aZE9BWeK8ttI57u0cS8JgIseCo2NFtY4HxD3f/2bk=
X-Google-Smtp-Source: AGHT+IEAemkZcOpN1KiuMHE8Tjf4sRBQIebOpKvSDum9xj1upl9bH+uRFUUVBjy4KJUn2DphCFwPWA==
X-Received: by 2002:ac2:4355:0:b0:52c:cb8d:637d with SMTP id 2adb3069b0e04-52eb9991e7bmr3322394e87.5.1720607786736;
        Wed, 10 Jul 2024 03:36:26 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc77dsm146576966b.52.2024.07.10.03.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:36:26 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 11:36:15 +0100
Subject: [PATCH 08/15] usb: typec: tcpm/tcpci_maxim: sort TCPC_ALERT_MASK
 values by bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-tcpc-cleanup-v1-8-0ec1f41f4263@linaro.org>
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

This makes it easier to see what's missing and what's being programmed.

While at it, add brackets to help with formatting and remove a comment
that doesn't add much value.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 87102b4d060d..ad9bb61fd9e0 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -97,11 +97,13 @@ static void max_tcpci_init_regs(struct max_tcpci_chip *chip)
 	if (ret < 0)
 		return;
 
-	alert_mask = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_TX_FAILED |
-		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_RX_STATUS | TCPC_ALERT_CC_STATUS |
-		TCPC_ALERT_VBUS_DISCNCT | TCPC_ALERT_RX_BUF_OVF | TCPC_ALERT_POWER_STATUS |
-		/* Enable Extended alert for detecting Fast Role Swap Signal */
-		TCPC_ALERT_EXTND | TCPC_ALERT_EXTENDED_STATUS | TCPC_ALERT_FAULT;
+	alert_mask = (TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_DISCARDED |
+		      TCPC_ALERT_TX_FAILED | TCPC_ALERT_RX_HARD_RST |
+		      TCPC_ALERT_RX_STATUS | TCPC_ALERT_POWER_STATUS |
+		      TCPC_ALERT_CC_STATUS |
+		      TCPC_ALERT_EXTND | TCPC_ALERT_EXTENDED_STATUS |
+		      TCPC_ALERT_VBUS_DISCNCT | TCPC_ALERT_RX_BUF_OVF |
+		      TCPC_ALERT_FAULT);
 
 	ret = max_tcpci_write16(chip, TCPC_ALERT_MASK, alert_mask);
 	if (ret < 0) {

-- 
2.45.2.803.g4e1b14247a-goog


