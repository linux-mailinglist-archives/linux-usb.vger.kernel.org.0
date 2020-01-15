Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F14613C586
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 15:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbgAOOPN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 09:15:13 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36780 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729604AbgAOONI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 09:13:08 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so15909963wru.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 06:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f2EHRYMI/TrUMZiwdhRPG+CtjBM6dg1rcU2ZvEhaaRU=;
        b=b6Xz4MLjpNeovyf0j/n3jNiTMyMKIbYXWa+8HcRWYqQOMTWOyIEWH4h1uo0njlqPOm
         4GEheSsQF2cON7MQC3DutbDhgEX9EOFRtRTrM/j8VnF55rISfOZMvh6MwgvBeMGCrt0x
         8hlc832sNeke+deccGiXMylyEhm17cBLEdfzMt0A8ToezBTwKrgBBzyJxhUAapOEZBmr
         6AOoYVgngMt2QH+n1pbWzTNNuweb0ZfZp0Y9uAUFzxrnhPJqURjzdR4K/LEzi3TY7hGF
         THU9dLU8hseyu97IlLTjmmpKxL3YsrTghAqgJqy0GXY6MYFV8TyyrefNFE7ph/oF877v
         JYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f2EHRYMI/TrUMZiwdhRPG+CtjBM6dg1rcU2ZvEhaaRU=;
        b=quwMixE88cupLUMnDd5nfJXIGM/15FCV7OBp8XMxNBU33uME3fc4wx9s1QzUOB+m8O
         PEYLMsRzNYINmeXoqVP0KM4polY9dgVNI4ILr2BwCOhq0EuEsj+rPOa2ZCWy35+SlahD
         qvDjN4VTfTeYqkKqSPPyr+sLvY+s5Xj0S0qV4cKd+sAtnq8vwh9NjVhg3gChR38r8H0l
         MJbLb+RsBtqIS3dG16FCHrOMqr2ZqxcHORD8fhPqyvkKikubIXYhvhZUoD0z6kwqbYVm
         uorNT+eqoCnbVXxV84JFSa97+XVvDZuIcw1OjnGq6hJSpLKN7vF268o4FpUUNWV603t+
         4B7w==
X-Gm-Message-State: APjAAAWwIZg+rM3+22HV6zSHbGFwgknEtLzP4Qc/Z8BAXaOxnioFGvJs
        nxOSDAw80fWj26UGVWFLhrx/xQ==
X-Google-Smtp-Source: APXvYqzxzRlw2U5aBlUnoLp9Qf+6/vSSV796tAM/I8yuqlr7588woX0Svjra55WW5pbW9B+PNOsMRw==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr29951658wrk.53.1579097586435;
        Wed, 15 Jan 2020 06:13:06 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:05 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 01/19] dt-bindings: phy: remove qcom-dwc3-usb-phy
Date:   Wed, 15 Jan 2020 14:13:15 +0000
Message-Id: <20200115141333.1222676-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
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
2.24.0

