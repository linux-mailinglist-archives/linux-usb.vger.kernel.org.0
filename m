Return-Path: <linux-usb+bounces-12107-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3386792CF82
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2974EB24374
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F811946D2;
	Wed, 10 Jul 2024 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bGne+uzr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02501193446
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607793; cv=none; b=O/YshJDfkeDyTpRPLNF8Q4b7SelCm+ySh6ulwnPu1RMCTKXTSLmK8gDx/vPuaWePIy64S7dzNa9TLCq8Jpe8q7qJd8W9vm7grv7YnIqW1SO/OqD5V0MKmbwsWfIo+wQLAtHnxM0UtbtKiRDOtvdXXXnzpx+jMF8KXyGYHfioZ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607793; c=relaxed/simple;
	bh=6F4oRj5CmywAwgGMzR18n53zdqYf4amN+tox2qEAYDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qMhCOTrbRsMRFlCT0cGXDZMd0/1KTcvfp8hf9Vt7BqriCrC2CzsucJw624gy+Xu2pslFakq5Y2NU3E7eHoe0wW3F9MRWh5fzuDCtChcaVESu6SFBBp2KqEowdvLEdbZLNYUyTtoJl0tQ9pE0NVFEVmw5LyAGyW+x75wv4OSPyYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bGne+uzr; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a77b550128dso772816366b.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607789; x=1721212589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JA4sofr4YaUcqBd7byii4fe2UEfxA6G4UUKcsqWmUZ0=;
        b=bGne+uzr3FXLVEhxk33ogphKsevCf2S6tkk2PnvPuP/LB+tAx4DPfgp0nUdSHFN5su
         0A272eJelDZ42zcg219dzSBJLvGDAfrCh5QTxvU3bLYpszRG3KiUF5UEGdTBcXel5NO4
         aaszfCXgrx2233FtT/lZ4f+taNmn+m2TOJ1njx3Uw4dFDQyksx+hVpNUIeVypOpRQr/l
         QNvT7fihPz+RZgQ5NfBlPFhqaNOuwdKcMOFUYkI3ZruGjBZcPhvefrjXc5A9RpBR84+G
         KjUUaTvNVn9bqz0yL6snOslZvO1kLOj3Gj2FqNKJkmsPcWgw/rc8qf4KrCd5ADud/bcn
         +arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607789; x=1721212589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JA4sofr4YaUcqBd7byii4fe2UEfxA6G4UUKcsqWmUZ0=;
        b=dHtFJuUEn2pDL7JRztOAjvkgde2/LOZxAyBqc92OpoEQoGq58qPk0h58l28BTRZVsG
         2SiRl3fzEF+6HfUqIAAn8Blh8EWanJxEXrBUc2c7F6BTxYyI55H7Dmyct1Vkv4fP3M0y
         PzKC2HJTnj2Yr12Co13nEFJEJXVlum2KREpBoFjZDwcaN/YI6FDsYGM6VD1LCnpUKyN/
         j/t8tDxcu62YIg3futJZFaC3MX4hprwyEO0TaFT3HToF7ixzjDj08su9+6gWThtN+Lid
         DDvX7pHjzAfQVIP4Rm3sE8i3vmrRPOuRIdj6SW4i6tPuU64DRlb/rAR4KD9JBm3SQI7G
         Mtuw==
X-Forwarded-Encrypted: i=1; AJvYcCX/Cg+Imcu69aJgXuFGOgtq6RVqaHXCwid6dV/6+qN72MGmykXSs5NWYNngCpYKo1d675jkrTDUy80Pm5Wox3kXCBs/+ap7MZJx
X-Gm-Message-State: AOJu0YyxXHYjCNIpGa5QjpXzvprPU2/tSFKSUO2ERynlzr2ugxEDFb3Y
	jaKOuA7FbD2VPCCw95CTM3JUAIyvw33mo/1qqvvVv/k3qDdb+/Pp9YocuGej+50=
X-Google-Smtp-Source: AGHT+IGijgZ/qjIv9JTzm6BbhLw1tuyBkh+jw/5AUldqnh2NXH3H9j2aMvTMeUXMF7JiFKpsZTYgIg==
X-Received: by 2002:a17:906:4e98:b0:a6e:d339:c09c with SMTP id a640c23a62f3a-a780b882737mr402489866b.48.1720607789565;
        Wed, 10 Jul 2024 03:36:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc77dsm146576966b.52.2024.07.10.03.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:36:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 11:36:19 +0100
Subject: [PATCH 12/15] usb: typec: tcpm/tcpci_maxim: use GENMASK() for
 TCPC_VENDOR_CC_CTRL3 register
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-tcpc-cleanup-v1-12-0ec1f41f4263@linaro.org>
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

Convert register TCPC_VENDOR_CC_CTRL3 to using GENMASK() so as to keep
using a similar approach throughout the code base and make it arguably
easier to read.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/maxim_contaminant.c | 9 +++++----
 drivers/usb/typec/tcpm/tcpci_maxim.h       | 9 +++------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/tcpm/maxim_contaminant.c b/drivers/usb/typec/tcpm/maxim_contaminant.c
index f7acaa42329f..cf9887de96c9 100644
--- a/drivers/usb/typec/tcpm/maxim_contaminant.c
+++ b/drivers/usb/typec/tcpm/maxim_contaminant.c
@@ -283,10 +283,11 @@ static int max_contaminant_enable_dry_detection(struct max_tcpci_chip *chip)
 	u8 temp;
 	int ret;
 
-	ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL3, CCWTRDEB_MASK | CCWTRSEL_MASK
-				    | WTRCYCLE_MASK, CCWTRDEB_1MS << CCWTRDEB_SHIFT |
-				    CCWTRSEL_1V << CCWTRSEL_SHIFT | WTRCYCLE_4_8_S <<
-				    WTRCYCLE_SHIFT);
+	ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL3,
+				 CCWTRDEB | CCWTRSEL | WTRCYCLE,
+				 FIELD_PREP(CCWTRDEB, CCWTRDEB_1MS)
+				 | FIELD_PREP(CCWTRSEL, CCWTRSEL_1V)
+				 | FIELD_PREP(WTRCYCLE, WTRCYCLE_4_8_S));
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.h b/drivers/usb/typec/tcpm/tcpci_maxim.h
index 92c9a628ebe1..34076069444f 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.h
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.h
@@ -27,15 +27,12 @@
 #define UA_80_SRC                               3
 
 #define TCPC_VENDOR_CC_CTRL3                    0x8e
-#define CCWTRDEB_MASK                           GENMASK(7, 6)
-#define CCWTRDEB_SHIFT                          6
+#define CCWTRDEB                                GENMASK(7, 6)
 #define CCWTRDEB_1MS                            1
-#define CCWTRSEL_MASK                           GENMASK(5, 3)
-#define CCWTRSEL_SHIFT                          3
+#define CCWTRSEL                                GENMASK(5, 3)
 #define CCWTRSEL_1V                             0x4
 #define CCLADDERDIS                             BIT(2)
-#define WTRCYCLE_MASK                           BIT(0)
-#define WTRCYCLE_SHIFT                          0
+#define WTRCYCLE                                GENMASK(0, 0)
 #define WTRCYCLE_2_4_S                          0
 #define WTRCYCLE_4_8_S                          1
 

-- 
2.45.2.803.g4e1b14247a-goog


