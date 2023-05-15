Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8C57702E53
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 15:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242385AbjEONg6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 09:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242367AbjEONgz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 09:36:55 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107C21FEF
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 06:36:54 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30786c87cdaso9990072f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684157812; x=1686749812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ic2PzyBJMTnrdn9lavuhttp1+67QyuBjwBrtru82DN8=;
        b=QEhWRQGc+WkNJHBHvHMSb9i+VVotu3V4jiRikyoHK1+kaKfL+jV8WspEXbvicqtp6o
         knam6iVsoeb9ZTNyYo/WnH/7blKD3LfPeHjBWFrmbHG/1VM7yowaCxroTVhy1ub+qkkD
         7gLh04BJU/kiHyw5RvsZTHEf/ZCl1nIJqqX8T6MUicVMDlTD4fmrrX6V/sDsO2afryIO
         tTk0Z2NyqtpuPvC0XQUfTBoUtirW013WzgZ3XhMhqSQen7oJQnQsZzXTTekZDZ8lHAJA
         ++q0HgtJOaNDgqCNvkKim9Sy59WZdlBSA4wCQ+KxjKeWoR2gIMkAZ4/tugklzOmAvWv9
         2uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157812; x=1686749812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ic2PzyBJMTnrdn9lavuhttp1+67QyuBjwBrtru82DN8=;
        b=LC9bHNnNksivptBVSE5JVMk+b6OFIP2ERFUBsLe33GlytQgS8rnK/iANc1boDn+U8e
         HIPw4hbrWy+y1H7KwvVKVC0ADZgYXZMpogc/s0CvZ7ym9DoT9u820ETVM+rbPACwJpKk
         1WagmPQ+c6xwOhng9VZGF2QMPNG2+YcCu8IaRvdiMbQ3P4Hn91Oz4hGKBf+DHBYzBXJ5
         auzHD1CIp+h26KpY8tCE5IwhgbVhFZqrjv7muaam/q0elvO4ahRWxaWqulXAN2OFPsSP
         g7UkBkgU2v1DT8kqjXs8NQceQVqFMW/v8VxD0CvVxYBAuz8y2w1Z77M6XdHmCqkC3SNn
         je4Q==
X-Gm-Message-State: AC+VfDxFVm/3faW0Gfwdwh1CQvrJV3ScsoGxB102jM5UiuxgON2Iz+fx
        +dDcc6Ug7OYdKPD6qKfaWhZ9Xw==
X-Google-Smtp-Source: ACHHUZ7l12CeFT/SYpWPfuh3zcpA8OuxR+iSFnqnjkA/+xkV6/Sy9vCMcRKfYK3GeD4WOZI1qM636g==
X-Received: by 2002:adf:e909:0:b0:307:c0c4:108f with SMTP id f9-20020adfe909000000b00307c0c4108fmr12993352wrm.33.1684157812259;
        Mon, 15 May 2023 06:36:52 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b003078a3f3a24sm28856634wrp.114.2023.05.15.06.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:36:51 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 05/11] dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
Date:   Mon, 15 May 2023 14:36:37 +0100
Message-Id: <20230515133643.3621656-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the PMIC Type-C port driver to the list of devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 36de335a33aa8..6e6f562a915be 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -158,6 +158,10 @@ patternProperties:
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
+  "^typec@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/usb/qcom,pmic-typec.yaml#
+
   "^usb-detect@[0-9a-f]+$":
     type: object
     $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
-- 
2.39.2

