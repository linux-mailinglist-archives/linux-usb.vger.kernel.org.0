Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A21CBE911
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 01:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732774AbfIYXml (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 19:42:41 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40831 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732925AbfIYXmk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 19:42:40 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so290105pgj.7
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2019 16:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1oH7lj03wYz79i/zPzaUWTT6QxHftIiKZMYorEdLMBo=;
        b=SwSWOlZdAHc54NN1P9/DI2Ev3uZ/2WR8GFuUWdKYhLAOmYqLprdUfFmMCJEqLxlumz
         3gOwyocfMNPC5M7hckWXzk3Rb4ZOTIPwsJgqDLfh/tJuTauP3QP7ouMIgG2co4Dxsh2N
         ONNf//SkblbTzF6TOSU4VjZUHtJE/eqTSl+FUEtAm/JAnmTR7oFsPZnkStJMlK3EmNyU
         x+D9tbHrBIS6nv+BjgNvZ2Pnzwkar4rUHApgf6W2gTINQOWudc0WUMvfGmCPFC4pDIcP
         ztFQcEf7Wwl1j8gw1Vtii9E6qVYU6UfUWSHm+di9rXUEWL1caDGAOutBXIaEGkH8m8tx
         Jstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1oH7lj03wYz79i/zPzaUWTT6QxHftIiKZMYorEdLMBo=;
        b=GvTTpPG4ulTQj+PXSulKmLTk6IXW44WMwUyg3S4uFiB4ulEfYya0arkW0H1yWz+7wN
         FEHS1lNLSB71cyRbXL86r20pbtje8z5+UB+ET558OYx8YLNDMJWS3EJb6N8s43hsiqaK
         MzCvV9Wf5h7K/d0IrZP/g4nEb2qMt+cGFl4M6H2mYIvKvH6WKxJWiKxs3rLN038HQfC+
         Lfd49BxkzOXhRxeb+xe/7U9MQqnRd5QnYUOSNVTJf+5iRzv4/Mp5LBQIfwXMEEjYIlDZ
         2p/vdZS2XgrkzYcjjBlzSWjBK4/8FdsrrMCi0Xc5EsAKAjkrPPsVI2/2scbWCWDyEmrw
         oEuw==
X-Gm-Message-State: APjAAAW3/p82m+LAgKqh2i0XsUM9JZwQM3ZENopYlAgLjesyS0j4Bw6V
        dhHDCdBg/BRsvw5o8eFNffEQpg==
X-Google-Smtp-Source: APXvYqxBu00R/fhIXx8pELMq6NqJTAGfty4xq7C26/kBFDvAHrojlE9S5uCP8hyRBRU/G8IJBrwdGw==
X-Received: by 2002:a63:221f:: with SMTP id i31mr441694pgi.251.1569454960022;
        Wed, 25 Sep 2019 16:42:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id d1sm131127pfc.98.2019.09.25.16.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 16:42:39 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH 5/5] usb: dwc3: dwc3-of-simple: Add support for dwc3 of Hisilicon Soc Platform
Date:   Wed, 25 Sep 2019 23:42:24 +0000
Message-Id: <20190925234224.95216-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925234224.95216-1-john.stultz@linaro.org>
References: <20190925234224.95216-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

This patch adds support for the poweron and shutdown of dwc3 core
on Hisilicon Soc Platform.

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
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index bdac3e7d7b18..78617500edee 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -51,7 +51,8 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	 * Some controllers need to toggle the usb3-otg reset before trying to
 	 * initialize the PHY, otherwise the PHY times out.
 	 */
-	if (of_device_is_compatible(np, "rockchip,rk3399-dwc3"))
+	if (of_device_is_compatible(np, "rockchip,rk3399-dwc3") ||
+	    of_device_is_compatible(np, "hisilicon,hi3660-dwc3"))
 		simple->need_reset = true;
 
 	if (of_device_is_compatible(np, "amlogic,meson-axg-dwc3") ||
@@ -183,6 +184,7 @@ static const struct of_device_id of_dwc3_simple_match[] = {
 	{ .compatible = "amlogic,meson-axg-dwc3" },
 	{ .compatible = "amlogic,meson-gxl-dwc3" },
 	{ .compatible = "allwinner,sun50i-h6-dwc3" },
+	{ .compatible = "hisilicon,hi3660-dwc3" },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_dwc3_simple_match);
-- 
2.17.1

