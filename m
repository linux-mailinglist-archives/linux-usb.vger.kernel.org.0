Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAEA65CF6E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 10:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234084AbjADJUU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 04:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239103AbjADJTo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 04:19:44 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B371DF26
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 01:19:41 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id q9so4853287pgq.5
        for <linux-usb@vger.kernel.org>; Wed, 04 Jan 2023 01:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1G1WrgAhnt9agzGWzGIJSePzdmnF9/zsBwV6xg6YY9k=;
        b=GDMHYBKOUekAtt2zSWtFMLOxRt6vLRVca+p1PkQ43UOeFbWtp9iu9Pgl8CyZZeQ6zF
         bBC2d6U/LxMDZbcAUEs7gNw3UWXv+0QS9yMuYX/lyw1Q+3SyBUt2efkRM/sgHtwBLSe/
         p/Udiqdg8rSIWWb6gE3nsgo3563qLqveqMcgeLhGES6/tnrAy8Y3x0U5PXKpxSsEeVZh
         Gp7boUotSrNCmprZmd2kSKbyH/swClOBkI88+aTNwfKhwY8ChGOyiZ33TJaHsE3G5MN2
         OVkItu3AwPhelYioyWJkNn+wiQQtdRM4h0kbVAaTxPfcsmyamOkp5Z+ucm6Dn41L0Mmd
         qyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1G1WrgAhnt9agzGWzGIJSePzdmnF9/zsBwV6xg6YY9k=;
        b=yTZXnSuYYhRv5zPvfE4vxS9SV8DHlLFgSM0rq2p7CWyPJvZs8ZYYOOaBhWcufefN5S
         Nerf2M9pXY+vtnUyOTYpDvBPtyCnF2SaWMBTsQkssdDPVypduFs6sCGjl4MiGMSWW/iz
         MIDerK1yvU6oV76bq79LprWVO9oaJd3fv1MyvNiOjFKD4JeyJwOSZlLiL3RKIVQ5A8ft
         X0AUPr6jH0Dd2v3WdVKi5eb9bExq/IzPZbHxvt9SXBFxi278KKx/sLG4ydr2e9IHK3wB
         /DcaeuCiJAgIFIX9LNiCCSBBdMphcowkGYHIQB0FuSCfprt21m7YKYCLQUcCioui9diw
         fJsQ==
X-Gm-Message-State: AFqh2kpK+1bVeBF53BiS0snvsfcDGW3kQmhaTg32Waa1DgLAOpFK4TAr
        AYOMIfM2+1RuUUz5ozjXTQ04ew==
X-Google-Smtp-Source: AMrXdXvejb3coMePWBqm+XvTYaavFEL8rS6Eyf2gm52JwXdwlhWV7YXTVzNtEIWYo1qtFRVSSwS5bw==
X-Received: by 2002:a05:6a00:150c:b0:581:38df:f9f8 with SMTP id q12-20020a056a00150c00b0058138dff9f8mr39313914pfu.4.1672823980564;
        Wed, 04 Jan 2023 01:19:40 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5e:e3b5:c341:16de:ce17:b857])
        by smtp.gmail.com with ESMTPSA id b189-20020a621bc6000000b00580d877a50fsm19205877pfb.55.2023.01.04.01.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 01:19:39 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     quic_schowdhu@quicinc.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 2/2] dt-bindings: soc: qcom: eud: Fix identation issues in the example
Date:   Wed,  4 Jan 2023 14:49:22 +0530
Message-Id: <20230104091922.3959602-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104091922.3959602-1-bhupesh.sharma@linaro.org>
References: <20230104091922.3959602-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As noted by Konrad while reviewing [1], the example
node in the EUD yaml documentation has identation
issues.

So fix them.

[1]. https://lore.kernel.org/linux-arm-msm/20221231131945.3286639-1-bhupesh.sharma@linaro.org

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index c98aab209bc5d..385ebd7cbbf0c 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -55,9 +55,10 @@ additionalProperties: false
 examples:
   - |
     eud@88e0000 {
-           compatible = "qcom,sc7280-eud","qcom,eud";
-           reg = <0x88e0000 0x2000>,
-                 <0x88e2000 0x1000>;
+           compatible = "qcom,sc7280-eud", "qcom,eud";
+           reg = <0 0x88e0000 0 0x2000>,
+                 <0 0x88e2000 0 0x1000>;
+
            ports {
                    #address-cells = <1>;
                    #size-cells = <0>;
@@ -67,6 +68,7 @@ examples:
                                    remote-endpoint = <&usb2_role_switch>;
                            };
                    };
+
                    port@1 {
                            reg = <1>;
                            eud_con: endpoint {
-- 
2.38.1

