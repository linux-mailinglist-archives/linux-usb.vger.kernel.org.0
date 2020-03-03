Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47774177CE5
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 18:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729836AbgCCRLx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 12:11:53 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35188 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbgCCRLx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Mar 2020 12:11:53 -0500
Received: by mail-wr1-f65.google.com with SMTP id r7so5375050wro.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2020 09:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nxX1GjYK2mYAhDxWyH3Jl9eH43r2oqZEhGTxg8X6wQQ=;
        b=ufdSHnOQGEsHLfTA9jxUTzmqAnXBQq42Vbw5DfRtAo0toUk0DCukoSJq0aVNGCznZQ
         CD/5l1nU2L4WwqxHgfrDqOYpV37MiNapXFBKM5uxjk1wriSuzSTRvwEgSc/Qa+RzJc0j
         DQ0tkXcXvLhY/PJSrBY4Ej9lQ8Om8ZlEf91qV8maRjTF/yNA6pcqAqErExf7Vk83Em6p
         u8fGSH/dxeh2d7uu4B8ZQDFa8RC+owPtoi4/JiPbMGkDqIaIf3wdi79KmtMLOC/5k/N0
         AY8ojiso5F8wPA18i09KbyKK4WvV0eFxY5jG1jd7kojypW16pC0xWRt5IIiUyuJ77ifH
         FZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nxX1GjYK2mYAhDxWyH3Jl9eH43r2oqZEhGTxg8X6wQQ=;
        b=NuTij17RF7pZWcaHRFjrJibfsOWWRD6caqih575UK2ciJiOk4zWuWXbRqtAxLqPA7c
         c9lGyrIHQyg4kCxpOD6zZFBCQZdrY5dK42OSZAYYGg8cY1SiaCuylO2KrKK5OZLiyZo5
         hr52Qt9V9BFWQnUe9crjxoM1CEOq+RcX/Qg4Q+G+LTpUMNpIRtoo9nGqfYSB2wKRrwZM
         XfWCegSpUPMUUNcuHmaUi2yEyE29rC3ho4KY0prAnVklaUiLg+yDcxtBBIuo2vFiCiwo
         f+R19vzDUx9FnvV3tdMajZ/zcGMV50mLNlTSXTxLJU3LLw+7DyMAIJOCptfFJGzBQA7d
         o8yA==
X-Gm-Message-State: ANhLgQ0Yn4DVWGZAE7AAqn/OIOXYsmEk+B/wN9DGze1SRkbPSsN+IYCy
        OoIkoZ7ZD7trACU823oIl/Uts4vTz9g=
X-Google-Smtp-Source: ADFU+vvnIPXDi8RtpDDx3zHTOmt6OTM8s0yMj3XlY9iGelo1f8pCtjvhM5bPZAfmVScBD41KyCMFLw==
X-Received: by 2002:a5d:4d48:: with SMTP id a8mr6267773wru.35.1583255511927;
        Tue, 03 Mar 2020 09:11:51 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:11:51 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v7 01/18] dt-bindings: phy: remove qcom-dwc3-usb-phy
Date:   Tue,  3 Mar 2020 17:11:42 +0000
Message-Id: <20200303171159.246992-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

This binding is not used by any driver.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom-dwc3-usb-phy.txt        | 37 -------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt b/Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
deleted file mode 100644
index a1697c27aecd..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Qualcomm DWC3 HS AND SS PHY CONTROLLER
---------------------------------------
-
-DWC3 PHY nodes are defined to describe on-chip Synopsis Physical layer
-controllers.  Each DWC3 PHY controller should have its own node.
-
-Required properties:
-- compatible: should contain one of the following:
-	- "qcom,dwc3-hs-usb-phy" for High Speed Synopsis PHY controller
-	- "qcom,dwc3-ss-usb-phy" for Super Speed Synopsis PHY controller
-- reg: offset and length of the DWC3 PHY controller register set
-- #phy-cells: must be zero
-- clocks: a list of phandles and clock-specifier pairs, one for each entry in
-  clock-names.
-- clock-names: Should contain "ref" for the PHY reference clock
-
-Optional clocks:
-  "xo"		External reference clock
-
-Example:
-		phy@100f8800 {
-			compatible = "qcom,dwc3-hs-usb-phy";
-			reg = <0x100f8800 0x30>;
-			clocks = <&gcc USB30_0_UTMI_CLK>;
-			clock-names = "ref";
-			#phy-cells = <0>;
-
-		};
-
-		phy@100f8830 {
-			compatible = "qcom,dwc3-ss-usb-phy";
-			reg = <0x100f8830 0x30>;
-			clocks = <&gcc USB30_0_MASTER_CLK>;
-			clock-names = "ref";
-			#phy-cells = <0>;
-
-		};
-- 
2.25.1

