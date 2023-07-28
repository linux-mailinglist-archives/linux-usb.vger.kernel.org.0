Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60865766B68
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 13:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236171AbjG1LJt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 07:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236149AbjG1LJs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 07:09:48 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FB02727
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 04:09:45 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fcd615d7d6so3372798e87.3
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 04:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690542584; x=1691147384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CspJ1Q+2LosEzKqDlXYExoY3sG/z+p7xYAQPInOGC34=;
        b=ewdWI7HtFVt+Vy3k+KCOVsfT0qkmuc5UXfntmc/5BhslLaNuno1VvpEbP79UDK0TEN
         KJ1N3MOh8yDj+6EGxDIeCFdSV9RFXP+Nvs4V2MITJCQgGsYhXZi1reHyaaTAnjXN2aqC
         xQBwToefEKB9ixgrIBHbG3Zxr17l0JBcRD6VyoePM9Mcr/25SGdFkdt8lG9JDfcbzU0h
         A0QO6OoiT0kxf20TPL+7NshxoQfznsElCJ1gN+bh1KLSBc30hLe56MmKyg1gxCTeUoTL
         unZLYPpA4NcbKxtlsffAHw23rN0Fj/kiAxq2qMi3/ptBoU7zcs/7KvuJUpGEl+Xq5mNH
         VBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542584; x=1691147384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CspJ1Q+2LosEzKqDlXYExoY3sG/z+p7xYAQPInOGC34=;
        b=Vf7psP/pliWUK8vuxw8kE4V3EYa4cA8/FrmR1OavVIXDku/81ZwlzqOPQq3P+gk0vl
         9SlESjZn/GKH/+TWOSiUFOCiTfwrnHXurOOLWe8qd9CAOtVjnI+QGyqLyPMPO5hZKDAW
         nr4KBQzKbQQsx6g2wUwEAjrbFuOph2ZYs57mbUZNPoMpJcsEcuSiuJhibQbHrcVlJ3QV
         QK1LAx6iytKQEoEpZJ1l+K9pqZvdrEaNOzHN4QaSF5Thxwy6mYLejFP2IswZ4jBaPrNF
         GYWebctLb5kzpLEXXDH7zVAzW9fPnbTJnmv6AqTn6QA+el/7vu+T8bSvRwP1XP1pkulg
         wUww==
X-Gm-Message-State: ABy/qLbuYaJlDbWJaZ1cD0jL6XfJUZdGPYlfayc7At0ST85ziuezRV8V
        /CvlUC7dodabu+LrbrtgUgZrIw==
X-Google-Smtp-Source: APBJJlGPo6otdvbNpb6PPOVqJHoECkI7+9NbxwMBipH4J83WRCsY5+S7f+PfklXFUlp6M330NYT+aQ==
X-Received: by 2002:ac2:499c:0:b0:4fb:242:6dfa with SMTP id f28-20020ac2499c000000b004fb02426dfamr1328866lfl.57.1690542584328;
        Fri, 28 Jul 2023 04:09:44 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id v11-20020a056512096b00b004fdc5557a70sm759854lft.141.2023.07.28.04.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 04:09:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 1/2] usb: typec: altmodes/displayport: add support for embedded DP cases
Date:   Fri, 28 Jul 2023 14:09:41 +0300
Message-Id: <20230728110942.485358-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728110942.485358-1-dmitry.baryshkov@linaro.org>
References: <20230728110942.485358-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the embedded cases, the DisplayPort connector is handled by the TCPM
itself. It was proposed to add the "displayport" OF property to the DT
bindings, but it  was rejected in favour of properly describing the
electrical signal path using of_graph.

Fallback to the controller fwnode for HPD notifications to
support such usecases without requiring additional DT properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/altmodes/displayport.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index dc2d3a83dc26..76c3e2f8e117 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -578,7 +578,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	alt->ops = &dp_altmode_ops;
 
 	fwnode = dev_fwnode(alt->dev.parent->parent); /* typec_port fwnode */
-	dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
+	if (fwnode_property_present(fwnode, "displayport"))
+		dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
+	else
+		dp->connector_fwnode = fwnode_handle_get(fwnode); /* embedded DP */
 	if (IS_ERR(dp->connector_fwnode))
 		dp->connector_fwnode = NULL;
 
-- 
2.39.2

