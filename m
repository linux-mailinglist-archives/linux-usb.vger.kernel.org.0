Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE4D6F30B5
	for <lists+linux-usb@lfdr.de>; Mon,  1 May 2023 14:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbjEAML2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 May 2023 08:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbjEAML0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 May 2023 08:11:26 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A18E5B
        for <linux-usb@vger.kernel.org>; Mon,  1 May 2023 05:11:24 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f192c23fffso13276185e9.3
        for <linux-usb@vger.kernel.org>; Mon, 01 May 2023 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682943083; x=1685535083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ezqUbWswfy2WUlCvIHmGIfKnDufe3ITp5T03UEYhmU=;
        b=POMHRx22ZyjBidz4o5r40oFFjfguQ/PxTXtz4TMnyFIZHOjVnUZ+S+WSREZfKKtbHC
         X5u7vvGbJXMns5zr3Lkh1s6qoGyE0TOgnxMbxWZq+ArgoJ6agY1kivZLgXPHPjaBrbaY
         Ewhau2trb8NBVgBYraCwGkzKheWnPW/ghLj83yjd5zGnDBCA6GedXjtS9k7a6bJ4TgL4
         3uJKCf9nMZuhg+BZCMz19GfvOUpixGvTn8rC3qWnDZboy6nVecf1bwF3vlZx61rNoVIt
         IutbyBj9uLqr2SKGIYOzI4MCePIZcA1Rft/ysEb5YpCz8WHoVjCNgJPz2eL5bHmYyh4I
         9+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943083; x=1685535083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ezqUbWswfy2WUlCvIHmGIfKnDufe3ITp5T03UEYhmU=;
        b=gDpt4lf90dc5NJGXiCIPTyStV9X8uFBCCJ0F5aJTIqzJgOg4B8OF7jQGAyXMNgmgPY
         UyhVxNpBG7DpEHKGG2yvZYY9uqAets+4avKhoaelTowRFS/CRzitycpkruvU6KRlJ4A1
         D9mf+acDQL5RpqWOZ66Mb9l0WHlJnydmm0U5KMs08Im65xUBhTmULC2WGJUqmQCQZ29m
         uEeMEc1nlF+aXyy+4MiUqsV/F2Mg5F0e1WhjHKJMVcAv+/ezpzuRiXAS3FyYtauqM8DZ
         zv3fm2NULTTRLbcumj6vXwcWcwdnENHcJkFXclGw38963JubVcYLQwfvpJNNd04tgI9u
         c/cQ==
X-Gm-Message-State: AC+VfDyKiclQEnxkieNYVAli92vpTDbEDdTB3NF25GfF1jPNW+G5YZyN
        +HYOO5o8vQiIAJ+AMj9Jnkm94w==
X-Google-Smtp-Source: ACHHUZ4zAKMyLl4g23cE4RgbAgw2i6h6YBK+eCmr3GXQgJ5n2fekXzqkTrZU0u8LGUzTFxK+CgKetQ==
X-Received: by 2002:a05:600c:2318:b0:3f1:72ec:400d with SMTP id 24-20020a05600c231800b003f172ec400dmr9305390wmo.33.1682943083248;
        Mon, 01 May 2023 05:11:23 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003ee443bf0c7sm35856634wms.16.2023.05.01.05.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:11:22 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v6 08/13] arm64: dts: qcom: sm8250: Define ports for qmpphy orientation-switching
Date:   Mon,  1 May 2023 13:11:06 +0100
Message-Id: <20230501121111.1058190-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ports for orientation switching input and output. The individual board dts
files will instantiate port@0 and port@1 depending on the supported
feature-set.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a91d1175255e8..af16d3ba76b8e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3581,6 +3581,19 @@ dp_phy: dp-phy@88ea200 {
 				#phy-cells = <0>;
 				#clock-cells = <1>;
 			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
-- 
2.39.2

