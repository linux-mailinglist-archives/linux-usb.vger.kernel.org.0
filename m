Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADF72142FFE
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 17:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbgATQcl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 11:32:41 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38155 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728783AbgATQau (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jan 2020 11:30:50 -0500
Received: by mail-wm1-f65.google.com with SMTP id u2so216499wmc.3
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2020 08:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qsI/xaPXMqNdKm9K1igbwkE2PA4fRpWtUntr4tiEc9c=;
        b=G2IagIBOWzh/x16MmgeTD8wsIydKubQXPVKg1rv4Z4RR14LDQWt4zUhDU1HfrMHczS
         g2r9eRIVi4i/ydvfIil0I54FM5sMKiwf39RnsBZSyhht06aVtE2SnZ0ieVphedo49NHE
         jyM9X8ahmWECdxjbEEEKkrA8C6jqWVGjCx3+mWK3UP1CKmMc7ZJeoiUO+sWU5PGFXemw
         zpIi9XvkZfWSNzY6KYAnoZbZJ4XiUdOJl7/BKzSETmz/GahtWUPtDVdmLoNqDJwfDswp
         38kre8EH+B9ShaUuYJ3dKFx96kX7u04ZL+AN6b+ayfcCPPkyHlf/ntH6qcrqH+/Dk+05
         LwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qsI/xaPXMqNdKm9K1igbwkE2PA4fRpWtUntr4tiEc9c=;
        b=q6oXbshhDue/mkRKzw5Bsz0EiClLfko91O595ItPgqdym7GC2bLQXF6qytWAOzM5h3
         6HoMT3d8lVffd/5vVf80bUeNgqG3mgFXkINGFSeaGLV35WMx4jtQpgj/yapGx7nnumZv
         5S4fFEkyQaxRiKyO1Y+vDve3ydH2SWELcckOn8zN+trwviqB/cEsgzi96tVLfD3CaSSe
         wH2a1+dhCV6qhXeJ6My5ncCY9BiZSN94YMgwVc4LPOqz2bEysD2xuyqDdsvRi/yyRNJ2
         2r8J4KTvwuwIISBIFvaCqaKMpCnLVELSVqWHab6Ji6Q9b2xrAyUSnYs2A6di2MBPS6eV
         P5aQ==
X-Gm-Message-State: APjAAAXDbCAgSovQR6X4Y7VrEV7G2YdpWDLIMg+Z7vgsokUi2PXfQYF3
        s9bTkDyWgR67NTeXM+20GmiW4TODlQU=
X-Google-Smtp-Source: APXvYqzzFJTUL2uBj8UC6wtxz6N+1fzM94B2exU3q07GUKuUf2SDhArGvq1P2gzxo5nwlVOdim5jTg==
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr165624wmi.15.1579537847957;
        Mon, 20 Jan 2020 08:30:47 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:30:47 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 01/19] dt-bindings: phy: remove qcom-dwc3-usb-phy
Date:   Mon, 20 Jan 2020 16:30:58 +0000
Message-Id: <20200120163116.1197682-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
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

