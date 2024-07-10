Return-Path: <linux-usb+bounces-12105-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E28592CF7B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D990E1F220A0
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264A9194148;
	Wed, 10 Jul 2024 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWP61PZO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7046A193077
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607792; cv=none; b=f+1+1FbHNlgoXpHCKtkvSQkBm6i4vGYuzJggdRH1MtxZeJc/l5k1Pik5HUA7uP4Tfg4cFqtcw+1z/2lACyWKIVb4/Gl2zqgAKGr8nzs2lABBqNUA0wRLNrZFJa5MHaAEW4rxKszmYv+0KIHfbIgegJq/i4VVRP6HXX6aphaSBuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607792; c=relaxed/simple;
	bh=Ju9WlpABJdDrRTF/57aRXBECK1G9qdIeBIwu/UKN1oY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hf80fXiKjylGvIj8niOGpNdAbdl4AUylA04shcNA1OiprRosS2BXNfpBTkLsSSKJr9JtAjcVMSPdgOrBRHjidIXSWy2HWPgNg8nP21LzG6YYyD9p6yzvhtRi3yuVIorMY8D2YRKDT7PoDBssifrAf1s3Fvrwp8DHmUfxIHgPTlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWP61PZO; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eea8ea8bb0so53048701fa.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607789; x=1721212589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OaJXkmGsoVDOS/uUKpK/gkJkaOn2bDjRVF7bUSlD2Q=;
        b=UWP61PZOTBH+43o19N/jnIyrCq5VV1vuT1jPAws+ISosKcVU/hYWwYhvq8iLOXsAlO
         q12piSif9bf2UmLenLmfTc8OEHhbK4hZtz5V/i7DhAPaVg+ZWp/yyCfr+pi7LM67wuF/
         ekX5XnVUaCvFCs2HL4QA+P6O0ImuwcpBkhRUX9xz8wh63XHmG3E+oyPZqILOECiE2oBr
         Q+TZyNdzUJ037IW6UI2kVSnG8l3lnrN0djyoFCBKNCQgVG4CTtR0pIZm/gOSerFnHXNJ
         RCE/D8zR3L5baVP7+BDojte/NiuLx+64nuriclY37sn6cX1hZ5kRnrxA+C7lWMJREXYc
         IFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607789; x=1721212589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OaJXkmGsoVDOS/uUKpK/gkJkaOn2bDjRVF7bUSlD2Q=;
        b=gJJnCcgS6+mkqSdaxFiLhIpRyA6QpLlVnAj8mEDf1B/Csfeys8qowjMWKgHj/t5ai+
         Zp8rvOy2cT1GFo9zV6eNxDzdrj6kFRRyWnZPSwodN+DUER2a9sQMFYRKBhJ2ujQ600SW
         p4WSreEBXLKhKNwsSFclWKLzyW8uNZ2lxinPkFhMJdDFmxvDo7Di55b5Es6ZefLFBIld
         EJDEmcYgecgPOgTO+EHB6F1EpTLKwnioQ9xh1pg9vmfMUqNlVj1UKfkpmahX4ydYsxBy
         keDGlRfdwyTkJrDtbSoC+oPX5n+zfS/jqKRAAXl3vSJhWo4OeTml+BwBcsO34oIkLrt4
         jd2A==
X-Forwarded-Encrypted: i=1; AJvYcCU2Z2eA20qvFBS5YKSQf0r5pqzK8Mnmq88917WldLRq1AXx8+yJDiAP6ayDwPad9gexUeItqYc8xT4qOc+SKlH2kNR9ayD6EFlP
X-Gm-Message-State: AOJu0YyOyIrvDKfKUKW/DGM5d661fEvaZNZraROT14TXAwpwzl6my6dr
	qg7z2lBZQpg306UZpY3mKbV3XyA7124UJ4D0mDvq+XXgg7A/EaF81nReNGkqC3I=
X-Google-Smtp-Source: AGHT+IEMpfogYtC0LRvrYarAjzqKHCaspVd/d5SG1JDi4DhoiWZSU86bS9h+zxWDd25iFHnSWgJRwQ==
X-Received: by 2002:a05:6512:1286:b0:52d:582e:4111 with SMTP id 2adb3069b0e04-52eb999b398mr4345456e87.18.1720607788683;
        Wed, 10 Jul 2024 03:36:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc77dsm146576966b.52.2024.07.10.03.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:36:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 11:36:17 +0100
Subject: [PATCH 10/15] usb: typec: tcpm/tcpci_maxim: drop STATUS_CHECK()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-tcpc-cleanup-v1-10-0ec1f41f4263@linaro.org>
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

Only one user of STATUS_CHECK() remains, and the code can actually be
made more legible by simply avoiding the use of that wrapper macro,
allowing to also drop the macro altogether.

Do so.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/maxim_contaminant.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/maxim_contaminant.c b/drivers/usb/typec/tcpm/maxim_contaminant.c
index e7687aeb69c0..8ac8eeade277 100644
--- a/drivers/usb/typec/tcpm/maxim_contaminant.c
+++ b/drivers/usb/typec/tcpm/maxim_contaminant.c
@@ -46,8 +46,6 @@ enum fladc_select {
 #define READ1_SLEEP_MS			10
 #define READ2_SLEEP_MS			5
 
-#define STATUS_CHECK(reg, mask, val)	(((reg) & (mask)) == (val))
-
 #define IS_CC_OPEN(cc_status) \
 	(FIELD_GET(TCPC_CC_STATUS_CC1, cc_status) == TCPC_CC_STATE_SRC_OPEN \
 	 && FIELD_GET(TCPC_CC_STATUS_CC2, cc_status) == TCPC_CC_STATE_SRC_OPEN)
@@ -368,7 +366,7 @@ bool max_contaminant_is_contaminant(struct max_tcpci_chip *chip, bool disconnect
 		}
 		return false;
 	} else if (chip->contaminant_state == DETECTED) {
-		if (STATUS_CHECK(cc_status, TCPC_CC_STATUS_TOGGLING, 0)) {
+		if (!(cc_status & TCPC_CC_STATUS_TOGGLING)) {
 			chip->contaminant_state = max_contaminant_detect_contaminant(chip);
 			if (chip->contaminant_state == DETECTED) {
 				max_contaminant_enable_dry_detection(chip);

-- 
2.45.2.803.g4e1b14247a-goog


