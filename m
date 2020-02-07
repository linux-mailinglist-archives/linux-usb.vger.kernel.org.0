Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9B415503A
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 03:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbgBGB7M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 20:59:12 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41245 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbgBGB7J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Feb 2020 20:59:09 -0500
Received: by mail-wr1-f65.google.com with SMTP id c9so762812wrw.8
        for <linux-usb@vger.kernel.org>; Thu, 06 Feb 2020 17:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qsI/xaPXMqNdKm9K1igbwkE2PA4fRpWtUntr4tiEc9c=;
        b=PTe8riw6U8bDW2BD/CxQgvv/9t4tl0U1Prhqr54tyU/g1/UMk7Tqd6sniHUl/w5azG
         H8Sfs1vXxDHfScvBYzbH4HTjk/PsxN4+jnzWHUs0YqYitvkT29Mm1h8bZ+IoSP+mSsS+
         p5KXsB/qvGU5nAqs+s042/nU8m6svRfIqTQFa0X3sGQcx9cnwhkhtQTF4CNHa20FGdsb
         /4obbf3seLL+I6G2XzsD4dHF7SRF+TLHNPZ/655SBBGozgcrpXmDL98qLHnaNTxsX+WW
         4qf8GdIzwWSBBzA0HzLJ7Crhh483zO4XdjGz923Zg0yV3A1qzKcmuAS3wQ+0cusp00by
         SpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qsI/xaPXMqNdKm9K1igbwkE2PA4fRpWtUntr4tiEc9c=;
        b=i2yBicfxjGGef/KvtginDWEYHha3LXy07BEMQ+M14S4YBSHmW6HhDo/TjIe8JqUMgA
         ch1c1yZTWFKfsq8cvk3WEKjmWzYxvaxy7oPih8qzQ47hc+/GSQLJdIodGZRaWujlrRYc
         qZh6JSq3uzEj4MhMzz8tmQ/n2WHNg7/guRm+u+y321e+xlTYOMaPoz9ezVAlCCF0duM6
         9isMqqDqh18flbpEMGVvhMyz0lOBu/zt67UPVoBmrAAwK3XL5FtHgdCK0RsE6cim1S8Q
         4zDK7u+sO6VIQYpcv4ASEp8ILtRFn9EMdlGcyi/1FeBHm97rSgccqmAqQTutA8RmOA6X
         cupg==
X-Gm-Message-State: APjAAAX1A9+Pt8bvvDiIRlRHDt9za2SYYKS7e/2BtnbnrtL9dkQTc7ej
        ndJ3cvsPn+/5kSTxCFGjfka/ug==
X-Google-Smtp-Source: APXvYqwPD2xq9B+Yz+WYnoPdj9yJUADJMolqYgcUq0fL+IXijMX6pa9HamJKV5V3OS6P4C32RhJO1w==
X-Received: by 2002:a5d:5263:: with SMTP id l3mr1162751wrc.405.1581040747220;
        Thu, 06 Feb 2020 17:59:07 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a62sm1490095wmh.33.2020.02.06.17.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 17:59:06 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 01/18] dt-bindings: phy: remove qcom-dwc3-usb-phy
Date:   Fri,  7 Feb 2020 01:58:50 +0000
Message-Id: <20200207015907.242991-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
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
2.25.0

