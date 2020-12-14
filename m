Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 594032D971A
	for <lists+linux-usb@lfdr.de>; Mon, 14 Dec 2020 12:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbgLNLJG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Dec 2020 06:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407689AbgLNLHa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Dec 2020 06:07:30 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9EFC06179C
        for <linux-usb@vger.kernel.org>; Mon, 14 Dec 2020 03:06:34 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id y19so29068420lfa.13
        for <linux-usb@vger.kernel.org>; Mon, 14 Dec 2020 03:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SFONqpKBx0+WGexIMJg0MppTIKw83Md/mUpNBwOPGvw=;
        b=EIEKyQp1tYGSTyeqRijNIjiczO2nSEeSBQk8Ma/kB23zAfJ2RyTgZFzV0gAEE8GDZ7
         Kz6qOl0CJ2jcPMaeq0jgh8wyIvMYZkNn5br85W90ieiSHichYtkjs9dg3KnsxlE73HaR
         q8s99VSj/i4PKdx8Me6eqBLB5Hl6wX0rYJqdZWuHQGmuSlEOy/2nNVnglr/lLue8u6Z0
         qElKdwbtKKpdYzhLehEbdircnTUPwN8cC2yGbvQrC5udBjxmtS9kkQrM3VnnEl5XIXFF
         F1q+n9koowuSNU1GmhDyEFYQeKwVwjR4nN5TCQKU5Mszqe71hLNHwBHt7D5j/PvbRYj2
         byAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SFONqpKBx0+WGexIMJg0MppTIKw83Md/mUpNBwOPGvw=;
        b=PxYXyq3Esrr9sHdR8/jcqTUmBUM5dCpej7f+GXdOQ0e15bc1MU4IoVWyLrxl6m7v5/
         KlGwIPIRe0vfXf3hacH1+T3YNPeeKPl3nwhXDjvUjrYfxnxwT3ZpvU73HRp+RZCavItx
         6PaXv206+yBuB3CCVnoIcb47vyR2Nb2XZWVPbObDxc6TE5qePiV1ZnpMYj/TAx95H61D
         r+NraHu2W/XNzbkKGIdvOHaAi67uytbNTIhcW3bRv2NG5BwCYbKQhBaG08+1KI9PQ97B
         2Bb46qp2cdruOx9WwW8zd9JdZVFv5Lcz8YKp26hLRH8Vqc+sE808RzKcfUrm44MmBi5C
         dlXg==
X-Gm-Message-State: AOAM533Rx5DE86DmwGVXdH/yvOIIP7QPUj3dwaylnDss5t8SUB1hdYdS
        X7nkXjY0Y1t4f2ZgOKle3S4SD2Tx0HZg6bfx
X-Google-Smtp-Source: ABdhPJwL99/BSTWjRTj1U5PSzQVTLj1X/NsvFtRTbp1VIM938jxZMvi4BvM4RzVvsYqDFSkzDCUcsQ==
X-Received: by 2002:a2e:2417:: with SMTP id k23mr10009497ljk.373.1607943992681;
        Mon, 14 Dec 2020 03:06:32 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id q19sm2092217lfa.80.2020.12.14.03.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 03:06:32 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 1/2] usb: dwc3: drd: Avoid error when extcon is missing
Date:   Mon, 14 Dec 2020 13:07:40 +0200
Message-Id: <20201214110741.8512-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214110741.8512-1-semen.protsenko@linaro.org>
References: <20201214110741.8512-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If "port" node is missing in PHY controller node, dwc3_get_extcon()
isn't able to find extcon devices. This is perfectly fine in case when
"usb-role-switch" or OTG is used, but next misleading error message is
printed in that case, from of_graph_get_remote_node():

    OF: graph: no port node found in /phy@1234abcd

Avoid printing that message by checking if the port node exists in PHY
node before calling of_graph_get_remote_node(). While at it, add the
comment from mentioned code block, explaining how checking the port
availability helps to avoid the misleading error.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
Changes in v4:
  - Moved the comment from patch 2/2 to 1/2
  - Fixed typos in commit message and comment
Changes in v3:
  - Split patch into two patches: logic diff and style diff

 drivers/usb/dwc3/drd.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 3e1c1aacf002..da428cf2eb5b 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -462,8 +462,18 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 		return edev;
 	}
 
+	/*
+	 * Try to get an extcon device from the USB PHY controller's "port"
+	 * node. Check if it has the "port" node first, to avoid printing the
+	 * error message from underlying code, as it's a valid case: extcon
+	 * device (and "port" node) may be missing in case of "usb-role-switch"
+	 * or OTG mode.
+	 */
 	np_phy = of_parse_phandle(dev->of_node, "phys", 0);
-	np_conn = of_graph_get_remote_node(np_phy, -1, -1);
+	if (of_graph_is_present(np_phy))
+		np_conn = of_graph_get_remote_node(np_phy, -1, -1);
+	else
+		np_conn = NULL;
 
 	if (np_conn)
 		edev = extcon_find_edev_by_node(np_conn);
-- 
2.29.2

