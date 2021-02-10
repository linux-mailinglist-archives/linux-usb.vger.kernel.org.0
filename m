Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C183E316CC1
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 18:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhBJRa7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 12:30:59 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:34912 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbhBJRag (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Feb 2021 12:30:36 -0500
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 09/10] usb: dwc3: qcom: Detect DWC3 DT-nodes with "usb"-prefixed names
Date:   Wed, 10 Feb 2021 20:28:49 +0300
Message-ID: <20210210172850.20849-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210210172850.20849-1-Sergey.Semin@baikalelectronics.ru>
References: <20210210172850.20849-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In accordance with the USB HCD/DRD schema all the USB controllers are
supposed to have DT-nodes named with prefix "^usb(@.*)?".  Since the
existing DT-nodes will be renamed in a subsequent patch let's first make
sure the DWC3 Qualcomm driver supports them and second falls back to the
deprecated naming so not to fail on the legacy DTS-files passed to the
newer kernels.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index c703d552bbcf..49ad8d507d37 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -630,7 +630,8 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	int			ret;
 
-	dwc3_np = of_get_child_by_name(np, "dwc3");
+	dwc3_np = of_get_child_by_name(np, "usb") ?:
+		  of_get_child_by_name(np, "dwc3");
 	if (!dwc3_np) {
 		dev_err(dev, "failed to find dwc3 core child\n");
 		return -ENODEV;
-- 
2.30.0

