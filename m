Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2C2D1821A9
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 20:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731102AbgCKTOE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 15:14:04 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42350 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730705AbgCKTOD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Mar 2020 15:14:03 -0400
Received: by mail-wr1-f68.google.com with SMTP id v11so4107792wrm.9
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2020 12:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nxX1GjYK2mYAhDxWyH3Jl9eH43r2oqZEhGTxg8X6wQQ=;
        b=An4+U/DeXJbHhJCJ194FOdmvQdQOz12Yqw0WEwCGxzl5G0VcndenTzjnuVPTzOXN1t
         oFqRxpFwRPox5e4vH6FuaajxjOlrHD8k+AlQLIPM42p2mZI6ecpgLwWdgtlCuJaMzknm
         d7L4M25l7v7WKDUESIIHClpHBS0BFp1X3XJhsvYZJCaKIByYMv6RHn0wh/hkwpRQgvRX
         IEBwsS8W3A7krXOnN1jp/PSJrOVJWCuyxAT9CiWhspL5ht/O9WLCv1Nu98M1R7zbFNp7
         Qxaf6ywShSeR55YHmfYkcNiuOwSVNDe792qIfb0egxC/5uk71fQl2eNBmt0ZHTqV8RhA
         OleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nxX1GjYK2mYAhDxWyH3Jl9eH43r2oqZEhGTxg8X6wQQ=;
        b=CVi3QZ3K+9cAxChdaBzNI3Ow59JKBV53Sn1mCJHXUuLJnTIBQGeKPgAzKbmqb0Z0Oj
         7gWvWMLm+R1wdnD9lvxHRXJsKNOhxuAVx5SHhJsy2es9/V43lh22IicVwoJHldQI3I+i
         B8PYFqMKdSeHNgIt/7iLcFxs7D2XIqj7Q9vJI3how4WEZB9Sa625chmaQF7ozmis57g7
         wd9Ue1L4PcvhhYdOC6VEwnZl+osIyKX/omCy39QZlsPhXC4WuxUFWPgOmEBNSg2b6Prp
         RyXJsHJ7mGnMst/0Y5yMQrTdaPyJqtyM566BIXxKsNWKCYOP0JXMwvDgioFy+miUmZau
         EIKw==
X-Gm-Message-State: ANhLgQ3/+jOEBKcUKlGn2qh30EieqqOCcwVpaGZzh1Wr296oFspeETEJ
        MRnRI7ia/Qw+Ns6ew8LCL6RzHA==
X-Google-Smtp-Source: ADFU+vu7lAgSh6YsSeOtORoJm/fQQHhzZy0uBHdINcMB/k2JjiAqigl61CrHBKTzU79uLdsF4RDrgw==
X-Received: by 2002:a05:6000:1186:: with SMTP id g6mr5876280wrx.331.1583954040659;
        Wed, 11 Mar 2020 12:14:00 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id v8sm69443919wrw.2.2020.03.11.12.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:14:00 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kishon@ti.com
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jackp@codeaurora.org,
        robh@kernel.org, bjorn.andersson@linaro.org,
        p.zabel@pengutronix.de,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 1/5] dt-bindings: phy: remove qcom-dwc3-usb-phy
Date:   Wed, 11 Mar 2020 19:13:54 +0000
Message-Id: <20200311191358.8102-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191358.8102-1-bryan.odonoghue@linaro.org>
References: <20200311191358.8102-1-bryan.odonoghue@linaro.org>
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

