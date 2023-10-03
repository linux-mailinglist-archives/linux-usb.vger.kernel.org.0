Return-Path: <linux-usb+bounces-1046-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF637B6DD4
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 18:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id BE3AAB208DA
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 16:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C049D38DEB;
	Tue,  3 Oct 2023 16:00:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F893717B;
	Tue,  3 Oct 2023 16:00:57 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC24BAB;
	Tue,  3 Oct 2023 09:00:54 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9b275afb6abso993260666b.1;
        Tue, 03 Oct 2023 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696348853; x=1696953653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2odeYCYvYbI+e91XdeKG6gxQVau5QUuMP9zEc+Df9BQ=;
        b=SLatTvuN9opIFiIqKRSRCwdzIcHMX74OuyuNTtfSX4nyC1lM1qlV9uAFE/Dc2ARM85
         96i4hvvpk4HmU06W1HdRWpeBmlExAkPy0RDBQ/g1FCMOy1vg3jhuczQLXwuQI5d+Fev8
         HUuAJ6O0nMlvjxLa4ZLxKsrKcOHJpZL2d8ZJtwwjuBGQFRNwTrsW9ST0cdudNbbcBTEH
         Vos1GFcGtJqU4YYTSM3b0JSuL0VFLvGjgxrZHWuli/VC9UvoxHxLgjRFHBvlAJ/3qcSR
         fpiRjfNubBdwDcJHRQ42h4fsJIwPznWx1ZduuwX6i3XVhWoEwMGNIgCt12P/RuoP9dR5
         rVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696348853; x=1696953653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2odeYCYvYbI+e91XdeKG6gxQVau5QUuMP9zEc+Df9BQ=;
        b=IhdgRx3nPP1opthDrLLbZ7hh7SFCQjRUWFzsY6+CMp72/VFsTpTvaDS6AM1ZBNj2Ve
         mGof90lQ/tidMEEPzIQIfqjtcedlvreyjfsYSJqIL67cuiEl8s28vu9OaCnQdZbCXxmk
         W8dbX4ApieFRvHB87NSYu/Q1UbNzL9EpADBRsDgiaXRamiOnf2XET1tq3wvQVh55935V
         cUCsvmqKfFm3etOMmgdqIBUFPRUnX59/KJCcxccf33VTih2Vj2pDntn1xj381ONJa+/K
         3kDG2SBdBL6sQPli5oM+upydQoWdjwn6X/CLi3TGpDv0iJ+0wYrLMU85rTHSufE9t6RD
         Ou9A==
X-Gm-Message-State: AOJu0YxT5GY5ywuGBRpvC55h9U5trlvMX3vZLI1Y2CohwsPIfAxH6k8Q
	FdyjXMQ/FQnl60xDCazb3/I=
X-Google-Smtp-Source: AGHT+IG35CcbkIuT82YHi632EHE54tO2/LR4eglmh+UpcytjAYpylxz746gsFzW1vQwsZ7TugQIy4w==
X-Received: by 2002:a17:907:c24:b0:9a1:8993:9532 with SMTP id ga36-20020a1709070c2400b009a189939532mr3183444ejc.30.1696348852706;
        Tue, 03 Oct 2023 09:00:52 -0700 (PDT)
Received: from primary.. ([213.139.52.198])
        by smtp.gmail.com with ESMTPSA id jo3-20020a170906f6c300b0099df2ddfc37sm1270526ejb.165.2023.10.03.09.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 09:00:52 -0700 (PDT)
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
Subject: [PATCH v10 3/9] USB: typec: tps6598x: Add patch mode to tps6598x
Date: Tue,  3 Oct 2023 11:58:36 -0400
Message-Id: <20231003155842.57313-4-alkuor@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003155842.57313-1-alkuor@gmail.com>
References: <20231003155842.57313-1-alkuor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Abdel Alkuor <abdelalkuor@geotab.com>

TPS25750 has a patch mode indicating the device requires
a configuration to get the device into operational mode

Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes in v10:
  - Add Reviewed-by
Changes in v9:
  - No changes
Changes in v8:
  - Revert mode check return
Changes in v7:
  - Add driver name to commit subject
Changes in v6:
  - Return current mode and check it directly
Changes in v5:
  - Incorporating tps25750 into tps6598x driver
 drivers/usb/typec/tipd/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 32420c61660d..c5bbf03cb74a 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -68,6 +68,7 @@ enum {
 	TPS_MODE_BOOT,
 	TPS_MODE_BIST,
 	TPS_MODE_DISC,
+	TPS_MODE_PTCH,
 };
 
 static const char *const modes[] = {
@@ -75,6 +76,7 @@ static const char *const modes[] = {
 	[TPS_MODE_BOOT]	= "BOOT",
 	[TPS_MODE_BIST]	= "BIST",
 	[TPS_MODE_DISC]	= "DISC",
+	[TPS_MODE_PTCH] = "PTCH",
 };
 
 /* Unrecognized commands will be replaced with "!CMD" */
@@ -595,6 +597,7 @@ static int tps6598x_check_mode(struct tps6598x *tps)
 
 	switch (match_string(modes, ARRAY_SIZE(modes), mode)) {
 	case TPS_MODE_APP:
+	case TPS_MODE_PTCH:
 		return 0;
 	case TPS_MODE_BOOT:
 		dev_warn(tps->dev, "dead-battery condition\n");
-- 
2.34.1


