Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B79D42D77BF
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 15:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406152AbgLKOYK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 09:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406071AbgLKOX5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 09:23:57 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B85AC0613D3
        for <linux-usb@vger.kernel.org>; Fri, 11 Dec 2020 06:23:17 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id e7so11034203ljg.10
        for <linux-usb@vger.kernel.org>; Fri, 11 Dec 2020 06:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pa/fm99iryRnuTvK4YNJZzODKVc6xYBM6NTI2XpGVhs=;
        b=lD6VhF+fvXgWE0Gnwlp9urtW35R2rCf3C0CtDbKE4hO/wPYTwWL4efibV8JQuyevcY
         lAij6XqTCN9Tq4EOQr41flBjaXWZiRP1g1futK+174+dE1nCJaNbjlVj3mTDHsLGfCLG
         3M2eEjCQulf7L+6vEB0NdyDlqYMD9QrxsRPb6LjcU3AGxBQJ09IVbgB9TfXkmvkCsFJK
         aJwriADEJPehX4I7NvUTkbK+JvWYFUaU1aT2PLl7dETNER0LeOndcRHniBrB7NzP9Dnw
         GdCrAAP7qVETAT6kAv2M+R2b+iSt32s1fInudcAVgQXFYn1TZHK9abyjDUd1mkVFtKGQ
         Mjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pa/fm99iryRnuTvK4YNJZzODKVc6xYBM6NTI2XpGVhs=;
        b=OKYz6jeAiu06znmYcqiyCjf8aafkxb1+Gxa1eVfEi0rWjiYDsXiVc9c5JCrL4l6pBT
         asQYm4FGA0eAjvNz4ezgTeB5qWDnL+rCK/Rc1/DNBcaKVLHNTxw0ZhAMvd8c2kTiT0iS
         SZvfqLaN6jRgQRKQq25afDvKBzL0b4d5X6AsOoD1h1OCJj2uzF7/4Q/wARvMLEJnjG4Z
         rSZ8dIYQXLdqd37xoH5kWmuK6lpxigs9cdxyDMMTOAtUUWZE4PiZhbtqstiOmFPNg/s8
         wFSfAlHgvcWWVsUA7ROwhuXtnPnfq+Z8sh5uryOyCEe+ckFKcx1EkYyjJTHNbNYD3qeb
         2pWA==
X-Gm-Message-State: AOAM531t7a9uXEfNV41O7d7llnoTZntfOxJFxV0N0m/XVPAIpG5mcbZX
        bnyqvZ6VABNKoa7jqbzsc0dGU7klPSwy3W6e5pw=
X-Google-Smtp-Source: ABdhPJwwL8LO3ZRdckr4onuGIoqembgDEjAuLbfvijPAlfmQ3CK/ku37eLNcaJHcJE05gUjaUDYarQ==
X-Received: by 2002:a2e:94d:: with SMTP id 74mr4981137ljj.104.1607696595420;
        Fri, 11 Dec 2020 06:23:15 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id v11sm251264ljg.128.2020.12.11.06.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 06:23:14 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] usb: dwc3: drd: Avoid error when extcon is missing
Date:   Fri, 11 Dec 2020 16:24:21 +0200
Message-Id: <20201211142421.15389-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If "port" node is missing in PHY controller node, dwc3_get_extcon()
isn't able to find extcon device. This is perfectly fine in case when
"usb-role-switch" or OTG is used, but next misleading error message is
printed in that case, from of_graph_get_remote_node():

    OF: graph: no port node found in /phy@1234abcd

Avoid printing that message by checking if port node exists in PHY node
before calling of_graph_get_remote_node().

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/usb/dwc3/drd.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 3e1c1aacf002..eaf389d3f3c5 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -441,8 +441,8 @@ static int dwc3_drd_notifier(struct notifier_block *nb,
 static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 {
 	struct device *dev = dwc->dev;
-	struct device_node *np_phy, *np_conn;
-	struct extcon_dev *edev;
+	struct device_node *np_phy;
+	struct extcon_dev *edev = NULL;
 	const char *name;
 
 	if (device_property_read_bool(dev, "extcon"))
@@ -462,15 +462,22 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 		return edev;
 	}
 
+	/*
+	 * Try to get extcon device from USB PHY controller's "port" node.
+	 * Check if it has the "port" node first, to avoid printing the error
+	 * message from underlying code, as it's a valid case: extcon device
+	 * (and "port" node) may be missing in case of "usb-role-switch" or OTG
+	 * mode.
+	 */
 	np_phy = of_parse_phandle(dev->of_node, "phys", 0);
-	np_conn = of_graph_get_remote_node(np_phy, -1, -1);
+	if (of_graph_is_present(np_phy)) {
+		struct device_node *np_conn;
 
-	if (np_conn)
-		edev = extcon_find_edev_by_node(np_conn);
-	else
-		edev = NULL;
-
-	of_node_put(np_conn);
+		np_conn = of_graph_get_remote_node(np_phy, -1, -1);
+		if (np_conn)
+			edev = extcon_find_edev_by_node(np_conn);
+		of_node_put(np_conn);
+	}
 	of_node_put(np_phy);
 
 	return edev;
-- 
2.29.2

