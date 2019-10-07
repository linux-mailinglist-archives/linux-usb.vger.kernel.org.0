Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9BA0CEB38
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 19:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbfJGR4I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 13:56:08 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36953 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729451AbfJGR4H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 13:56:07 -0400
Received: by mail-pl1-f196.google.com with SMTP id u20so7212113plq.4
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2019 10:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7/b3yUeZa8CC2Us86GgYloZCqUlnEcjewTRh+R9Lbvk=;
        b=SlY3eXwvCRPmzMOhMJJSBUGa/3rX3D4MUbmP0Ohh4buo2qrQ3DCJIvh8hRcWXRpawv
         QB80v4EAGe5Dvtan+jOEazC5pe64LQb01TslpzL+J7t1hzRTuRhYCdxhfYXQBbAcI/Zq
         bFxGsoLTeC4mNqGdjuOKXVihqfjxr5ufHsZZa3pYGj05xoNRFOuWY4wLGePQIJcoC8ry
         GMomuuVRq9oKJMX/OvfgT19utBjL+NR1tT6xgcPkd9EQbEpXfqCeNm1eY8PSUaRHYgO2
         PtJ+Dk4z1VlTkcHKjqtWtn47m3uJ2kJuZ2V8bSDM59Id/tThwdsiUSNhuXTu2pNkEHZM
         iIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7/b3yUeZa8CC2Us86GgYloZCqUlnEcjewTRh+R9Lbvk=;
        b=aGVfwak788K3nVkadZF1PKvrN6ThzACuWLWEZ4tLOtamB8v7DnQ89EZppFDk/ECCQG
         Aq+NAFwFJ/LsIxHSRXXKU1r8I3U61VIhM8Sq/7U0L5yWVCkgVaMWJgoBKR+IimpQL5ji
         RwYYWbuj2semz/GEMBLSqdVk4W9LGBtPPyujHxcjqEwcKstECjRHrc7hpxd2UOJXh+m9
         X/QJ/2G0V8TbpVCDxQJ63nyXCzTTvRuXR7eielSKfBX/gkcFR7TowulTpunkZd/yka9B
         qiZFQF+tRhB9OKYs1YpGqfEEqKOVemlr2YMDcUkfRuZlzh0szMDIXSKddk8L1nLypma1
         q3hQ==
X-Gm-Message-State: APjAAAUSJqwK5eH5aa8Puc+5jxMgIc2U7KczzkdEVvk1AKog07o3ZVBd
        K3WieE0WzwDwO6zSZb6Wdx3CUQ==
X-Google-Smtp-Source: APXvYqxzIFObkEZ3b71NwneTkjqqzC3Nj0N3NNcomwCN9GSXlPRZnaHZIfK+yVDlQ0vpXSE4EK6AaQ==
X-Received: by 2002:a17:902:820f:: with SMTP id x15mr29187700pln.230.1570470966697;
        Mon, 07 Oct 2019 10:56:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id k15sm3820096pgt.25.2019.10.07.10.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 10:56:06 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yu Chen <chenyu56@huawei.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC][PATCH v2 4/5] dt-bindings: usb: dwc3: of-simple: add compatible for HiSi
Date:   Mon,  7 Oct 2019 17:55:52 +0000
Message-Id: <20191007175553.66940-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007175553.66940-1-john.stultz@linaro.org>
References: <20191007175553.66940-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add necessary compatible flag for HiSi's DWC3 so
dwc3-of-simple will probe.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2: Tweaked clock names as clk_usb3phy_ref didn't seem right.
---
 .../devicetree/bindings/usb/hisi,dwc3.txt     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/hisi,dwc3.txt

diff --git a/Documentation/devicetree/bindings/usb/hisi,dwc3.txt b/Documentation/devicetree/bindings/usb/hisi,dwc3.txt
new file mode 100644
index 000000000000..3a3e5c320f2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/hisi,dwc3.txt
@@ -0,0 +1,52 @@
+HiSi SuperSpeed DWC3 USB SoC controller
+
+Required properties:
+- compatible:		should contain "hisilicon,hi3660-dwc3" for HiSi SoC
+- clocks:		A list of phandle + clock-specifier pairs for the
+			clocks listed in clock-names
+- clock-names:		Should contain the following:
+  "clk_abb_usb"		USB reference clk
+  "aclk_usb3otg"	USB3 OTG aclk
+
+- assigned-clocks:	Should be:
+				HI3660_ACLK_GATE_USB3OTG
+- assigned-clock-rates: Should be:
+				229Mhz (229000000) for HI3660_ACLK_GATE_USB3OTG
+
+Optional properties:
+- resets:		Phandle to reset control that resets core and wrapper.
+
+Required child node:
+A child node must exist to represent the core DWC3 IP block. The name of
+the node is not important. The content of the node is defined in dwc3.txt.
+
+Example device nodes:
+
+	usb3: hisi_dwc3 {
+		compatible = "hisilicon,hi3660-dwc3";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		clocks = <&crg_ctrl HI3660_CLK_ABB_USB>,
+			 <&crg_ctrl HI3660_ACLK_GATE_USB3OTG>;
+		clock-names = "clk_abb_usb", "aclk_usb3otg";
+
+		assigned-clocks = <&crg_ctrl HI3660_ACLK_GATE_USB3OTG>;
+		assigned-clock-rates = <229 000 000>;
+		resets = <&crg_rst 0x90 8>,
+			 <&crg_rst 0x90 7>,
+			 <&crg_rst 0x90 6>,
+			 <&crg_rst 0x90 5>;
+
+		dwc3: dwc3@ff100000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0xff100000 0x0 0x100000>;
+			interrupts = <0 159 4>, <0 161 4>;
+			phys = <&usb_phy>;
+			phy-names = "usb3-phy";
+			dr_mode = "otg";
+
+			...
+		};
+	};
-- 
2.17.1

