Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68FA36BF9CD
	for <lists+linux-usb@lfdr.de>; Sat, 18 Mar 2023 13:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjCRMSl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Mar 2023 08:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjCRMSh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Mar 2023 08:18:37 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1EB2B28D
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 05:18:35 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id c8-20020a05600c0ac800b003ed2f97a63eso6523906wmr.3
        for <linux-usb@vger.kernel.org>; Sat, 18 Mar 2023 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y158HVl8JVW4kMbtNHVGz7DrzRA/UEL4hPTStyAK4RQ=;
        b=x22PqK+6ZXCPHpxOmDybAcWK65bJW2SFmYFRZX/U2lPvZN47064/XDsEQrvZUqQSbx
         SHXZ5hICxNI+n1Y/WAeo2miVErQQAxL9fALqCv9FUuBgNlqg67scASaEsy+9yjGe/GkM
         pRTNX+pH2qYBbO1rdcLzY9ZjMOJM79kp8D2r57hispnJxStsonpYXs6A24BTJrrLqnhH
         D1U9HDIyHr1b5M7EcKF+W3ti9piAGW/7zx78PN1+FSnk8awk0lFZmq0iwkNdwzph6+YV
         dY+8AkE1hOrdU2fKF5R0rFrhaXfBtjip5SlbtYUzk1MJupmoE2kNVvNVI1g2rDcHnRf7
         YhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y158HVl8JVW4kMbtNHVGz7DrzRA/UEL4hPTStyAK4RQ=;
        b=miEPf4OWC0Ki+hSwd+9eFRIHWHsVfirI3MCZzOhTD0ENQci5syS587gT2ZfqBpOCXu
         B6apr8wgINqesu/7mjSg3jUiTeBrdB22c8ZNW100G6DgC6IdfKkHosBSvyOduH5pot5H
         73fMemMhDCYi2UwwcpwYxwks8U/2DwAW6fnJ/aoIg+2IM9K3CunkFAgJoh28HifaNde2
         8tclgUVmeZrCnNAa+LVCRRaGvjD7K99VnEYXR649s4KmlCbN3vv9jlByH/no1h466H8H
         2RNGAe4M99WOXdweiF/q9qqrwx1P0YWQN16fmUnzFAS6qPjuXZgD9SU1xnr4op6kWMcA
         rcaw==
X-Gm-Message-State: AO0yUKXBAjldemUpvSl9mzXV9TqoX4hWhvT6mdTuZtYSN6Po7ufY3nqv
        4zZNO8FpYAq1d74qdjDb+KMSnA==
X-Google-Smtp-Source: AK7set8iIQNb6pKFhvafzdRNafm3uaOE9M0/St/wMrcs47yRRXyQx9q7LW5v496UDDAU7RwXubOgPw==
X-Received: by 2002:a05:600c:4f02:b0:3eb:39c3:8844 with SMTP id l2-20020a05600c4f0200b003eb39c38844mr28511278wmq.12.1679141913227;
        Sat, 18 Mar 2023 05:18:33 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:32 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 01/18] dt-bindings: regulator: qcom,usb-vbus-regulator: Mark reg as required
Date:   Sat, 18 Mar 2023 12:18:11 +0000
Message-Id: <20230318121828.739424-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mark reg as a required property.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index b1cff3adb21b5..7a3b59f836092 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -25,6 +25,7 @@ properties:
 
 required:
   - compatible
+  - reg
 
 additionalProperties: false
 
-- 
2.39.2

