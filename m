Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9132F18087D
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 20:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbgCJTtq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Mar 2020 15:49:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45622 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgCJTtp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Mar 2020 15:49:45 -0400
Received: by mail-pf1-f195.google.com with SMTP id 2so6964337pfg.12;
        Tue, 10 Mar 2020 12:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qy+AMvg+nSvSC0ONVo240hNIxIkSB0OeFrGgfVG5/JQ=;
        b=Ryl8SeA+3eogYZ6yPC1SyQIH0votU+mlri3VVKOquAkHVa+fCFv5+PY9+tRb3y/TG9
         wNcmZ7oGBLJwE0SyMVjO4rPq2UTrWs3y0Wf2N8cthoIha2UmDdlv3foUJgkgqvAPmWX4
         ZwO+McwVCHwuPAhcl3VWZ6ubnsb/EFV67Qm/rVfnpBzvf0AIL3yFbTY3IEyfc9Jpjt4i
         DicuxNzeb4Fh4gG9Cpd+kk9aJnAtZvb5pbbFztVE/Xw7clyfaIXvyB7bFcSbruEm/4Gc
         tj5xoyrfXLDTTj1ZxCCsN30qlAlEr+H0OeTyeC8wbe1GLL4idYtuQiGQp8bkWsjWjes5
         MCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qy+AMvg+nSvSC0ONVo240hNIxIkSB0OeFrGgfVG5/JQ=;
        b=cE9OTWVT1mAaSL8w84PtZu2MRrEntfCgigrOzfRyxgCwEeG4q7ms/Lw9gCi6Dtyk/a
         efyAART6bUF7G/KDhZ7OqUwrSzY9CPTzxHnhq+ZhhD3ZXvMmVnBqr0e35KokGJeBchK0
         B2hZFwQ7UXzEJ056lEFM6+bOAAwreld7MgT8zui/7DEavTToqETPENLR3ZqrSMeGe8Oe
         5bGb0ELCTx0doAYBOLKjRlj+MXCKRNrcSXDMK3SyuC2akBtsfFzqmY0/nnlxWzdYh0ZE
         uRjPAVbJacjrZZW9YoHfLhojVeTDt7nRY3JP2CAqryapcAfc8XZu2yOTQ8OTW/OEeelJ
         Ltkg==
X-Gm-Message-State: ANhLgQ2cu6xuQ3q4MiZITS9+FmEhc9pebwXAUX3Qzf09scbJk8S4/Fca
        axEscnx0EnGkUKOLbFYBzMtG/OEm
X-Google-Smtp-Source: ADFU+vs2n4qmIA2s6IYw23zn3QxspN7ea/eADdMqXUX6lRw9+Nj+HTWuyikX+b/VavTLEPf/k/KcXA==
X-Received: by 2002:a62:1552:: with SMTP id 79mr10399764pfv.215.1583869783177;
        Tue, 10 Mar 2020 12:49:43 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.228])
        by smtp.gmail.com with ESMTPSA id d19sm3784490pfd.82.2020.03.10.12.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 12:49:42 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Felipe Balbi <balbi@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCHv3 4/5] usb: dwc3: exynos: Add support for Exynos5422 suspend clk
Date:   Tue, 10 Mar 2020 19:48:53 +0000
Message-Id: <20200310194854.831-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310194854.831-1-linux.amoon@gmail.com>
References: <20200310194854.831-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Exynos5422 DWC3 module support two clk USBD300 and SCLK_USBD300
so add missing code to enable/disable code and suspend clk, for this
add a new compatible samsung,exynos5420-dwusb3 to help configure
dwc3 code and dwc3 suspend clock. Suspend clock controls the PHY power
change from P0 to P1/P2/P3 during U0 to U1/U2/U3 transition.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 90bb022737da..48b68b6f0dc8 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -162,6 +162,12 @@ static const struct dwc3_exynos_driverdata exynos5250_drvdata = {
 	.suspend_clk_idx = -1,
 };
 
+static const struct dwc3_exynos_driverdata exynos5420_drvdata = {
+	.clk_names = { "usbdrd30", "usbdrd30_susp_clk"},
+	.num_clks = 2,
+	.suspend_clk_idx = 1,
+};
+
 static const struct dwc3_exynos_driverdata exynos5433_drvdata = {
 	.clk_names = { "aclk", "susp_clk", "pipe_pclk", "phyclk" },
 	.num_clks = 4,
@@ -178,6 +184,9 @@ static const struct of_device_id exynos_dwc3_match[] = {
 	{
 		.compatible = "samsung,exynos5250-dwusb3",
 		.data = &exynos5250_drvdata,
+	}, {
+		.compatible = "samsung,exynos5420-dwusb3",
+		.data = &exynos5420_drvdata,
 	}, {
 		.compatible = "samsung,exynos5433-dwusb3",
 		.data = &exynos5433_drvdata,
-- 
2.25.1

