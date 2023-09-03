Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A621790E60
	for <lists+linux-usb@lfdr.de>; Sun,  3 Sep 2023 23:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349407AbjICVmG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Sep 2023 17:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349046AbjICVmE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 Sep 2023 17:42:04 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8F010D
        for <linux-usb@vger.kernel.org>; Sun,  3 Sep 2023 14:41:58 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50087d47d4dso1455524e87.1
        for <linux-usb@vger.kernel.org>; Sun, 03 Sep 2023 14:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693777316; x=1694382116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQu1z4f66ZLko+rKDaNEqwlYcOO6KOPqUNdRGmTYflk=;
        b=yoQftoDDcczedWpEq5MPT7EbuHO3OQRoQ0GhNSJBMxufi3KntbCaG03nOnSCAaxDB8
         r84VlqXhzFLTwgbI599qxvakCtQgkp/aL9EnSMQFsdqLkmoNaNvGcO2t9SIU7OSZDUQs
         uyj1C6+RlHWcBHaSv4P2bz7jD6YSSDRSUo6bZnvPX/oVRYOyI3jobnRqgwwShuKLNJhU
         iSJnfHkg8z8NT2m1nwPybfNwNLaY566Bybvu/PCjtwqwHot5UCABnqYKa0bHw01ByAVL
         Xj41PUI77GyELjwHISUDLoltehhd94u/kBv5JHRmc/3m/IKMBCFjDBCiLobVNy7rsc5y
         Sj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693777316; x=1694382116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQu1z4f66ZLko+rKDaNEqwlYcOO6KOPqUNdRGmTYflk=;
        b=YOwz6gaOsQPuhtriBtT+joYEusRcPh/Eba2cP7W0jGjj9b4C1Z5K0rtXP8QD1tufNa
         H3Q1FhY+c/xUJiMolA0+MCKTkntT/NrW00VQCDQpvordiClfb2NUyhZBCl+26AfBGkpY
         8ePnqanjLbCcNQcPY6zAuX8R8+iYvScA6K0629D8ME41de2Plkyx6OtilLRkdQta9cig
         CimebGEHrlrwb2z4HNsKEfSbI0dVCsyHIVU+CuE/2mybh/guLRWGsSCM6hKHTCEpGwCM
         IPKpXVlNB3XzQkjWFRTx3j5V4w1oZYDYqYQETofyJjOVyQzhJkh8JIdL8TUiexNrlUW1
         3GyQ==
X-Gm-Message-State: AOJu0Yx+WiAT04cwii0DDH3iiL6/dQwvBJnt1Bs4X6RxB2ECJyze49Pw
        +GJZWTe5lwsCRc5mutmehTb+Gw==
X-Google-Smtp-Source: AGHT+IExVQuQX3Gj81jbZ+R6ySGMUAgWZnxuPMcXW9RME/R1Qx0IzJskMS/e3HZRFl9o1BgsPXmohw==
X-Received: by 2002:a05:6512:34d0:b0:4fe:85c:aeba with SMTP id w16-20020a05651234d000b004fe085caebamr5162568lfr.21.1693777316523;
        Sun, 03 Sep 2023 14:41:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 14:41:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v1 07/12] soc: qcom: pmic_glink_altmode: report that this is a Type-C connector
Date:   Mon,  4 Sep 2023 00:41:45 +0300
Message-Id: <20230903214150.2877023-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Set the bridge's path property to point out that this connector is
wrapped into the Type-C port.

We can not really identify the exact Type-C port because it is
registered separately, by another driver, which is not mandatory and the
corresponding device is not even present on some of platforms, like
sc8180x or sm8350. Thus we use the shortened version of the PATH, which
includes just the 'typec:' part.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 974c14d1e0bf..a5b72046caaa 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -466,6 +466,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		alt_port->bridge.of_node = to_of_node(fwnode);
 		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
 		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+		alt_port->bridge.path = "typec:";
 
 		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
 		if (ret)
-- 
2.39.2

