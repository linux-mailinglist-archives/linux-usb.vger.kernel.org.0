Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47EED5BF9A9
	for <lists+linux-usb@lfdr.de>; Wed, 21 Sep 2022 10:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbiIUIrb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Sep 2022 04:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbiIUIrA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Sep 2022 04:47:00 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B98189CD8
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 01:46:58 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a3so8005409lfk.9
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9XDmMSkErfJxFmN4ZvQmXQrGhNtHHsv05+YAnAlzpks=;
        b=PC8yTTvPRBQpgdJ31Yt4NsBPePaj0m09Ho5t1UiVzsRsiwcI48Xxecb0a3C5O6DriO
         LW4IsbyHiBfAifg6NDFeCswah8f1AlEgYVIf3ocXrYg8wN7gdSt7iRXt46PlnPehLsBP
         Nf8RzciXCNmfoHUL0UMQA4G0Icg2m57DCnIi48wK9ZkFTjy8P+cw+XPhJFuiNZtfPjF5
         HoQP+KFkTti1UwEuprNwo/dyhP3WklIR6a6YQB2GjpBUj7V3BzfEqshxdCorLdAB3Mkk
         5fzA+XnFE3c3fPFj7tKnPcFct+VMlqOh7U6FcoOY6dpzIctojWTp1DY6dpLOnC+UjXDs
         FWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9XDmMSkErfJxFmN4ZvQmXQrGhNtHHsv05+YAnAlzpks=;
        b=jrUG6IeygL9ge4foClQdYY6nz+jeZn4gzNDI4G9W4Zr5HWtRLSm6ux+1oZOBZAdVSP
         kbdDSmbMGWRZAJWuWIVCFqjHwdgPfhxZLQIoFz0Yx7MLQ/tAIAVvgXs8VdWGtcdwUh6n
         3ZLJ8+okNfu0lQ3eoGFTSDgxRDX/vsMH1UoupfTLHpjSjq2FrQimtV/Vd3PHG70ZBbFK
         tHrfJvx3kwHEoycsJ5s6c0mf+3MuWKEP/FCIPLy/+j3b2jt2VhBSrO59jMPA+E7zUP7r
         ZStORhg/Y+EY4N7C3RrEfst1g5Lg476T0OiRNMcSPXkGd3aBATnM5xj4XYVJbpjco2Em
         9o7g==
X-Gm-Message-State: ACrzQf1AB3PHPe3OD4s930yymR30ka0Wmf9cKEf+2bQBUt5b8TRX5ehq
        1PrLQl3iPRX364kEcqbulcOnlw==
X-Google-Smtp-Source: AMsMyM4RB9R3GoHhkgWd/q4jSX09mjpDoHUp6y2OzcGRbdSNR5ZNtu32JNMZN/EivKSvm50+5Vs+qQ==
X-Received: by 2002:a05:6512:b17:b0:4a0:13c:9b3f with SMTP id w23-20020a0565120b1700b004a0013c9b3fmr375196lfu.91.1663750016500;
        Wed, 21 Sep 2022 01:46:56 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o12-20020a056512052c00b00497a41b3a42sm344715lfc.88.2022.09.21.01.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 01:46:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] usb: dwc3: qcom: drop unneeded compatibles
Date:   Wed, 21 Sep 2022 10:46:54 +0200
Message-Id: <20220921084654.118230-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

All Qualcomm SoC DWC3 USB devices have a qcom,dwc3 fallback, thus there
is no need to keep the list of compatibles growing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9a94b1ab8f7a..7c40f3ffc054 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -1007,10 +1007,6 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
 	{ .compatible = "qcom,dwc3" },
-	{ .compatible = "qcom,msm8996-dwc3" },
-	{ .compatible = "qcom,msm8998-dwc3" },
-	{ .compatible = "qcom,sdm660-dwc3" },
-	{ .compatible = "qcom,sdm845-dwc3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
-- 
2.34.1

