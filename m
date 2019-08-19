Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9E491DBC
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 09:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfHSHYu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 03:24:50 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38030 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfHSHYt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 03:24:49 -0400
Received: by mail-pg1-f195.google.com with SMTP id e11so680244pga.5
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2019 00:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8sEiIl57BH1UnpigrfcmtcS/+u7ss59hzQTNXNLQX8k=;
        b=ebNrBQTm89VrGyszHKb0JXq4atLLs2dVkzh284BbuHTOS6x539wBM0oFTauKN80T5K
         6Dvd22LJ9BaGdROHkLWhXwgsVl/gZXL+4F/869QVCdSnng7W0WAXktMDUQlmCT+TPUx7
         IO/4QNdZe8PJslVc3xCy/DNY9dLCZz9AIBI6s6lelsAmuLC9yeDt8KShhkvI6Qic0Q4h
         TnotgpExho7SKRtl2cflg9LXG/IE31mrSQQXMmWfbfPyRp9vymiuoT9C/at/F40qPTrB
         QRzeQRA0D12TjSobRVRuw6EXbXJdF/Fk1fI33vRxJX0bciQ/0iv43UfcUz3/PAXeLq0M
         hPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8sEiIl57BH1UnpigrfcmtcS/+u7ss59hzQTNXNLQX8k=;
        b=LfLxzN+SmExxaRJyQMmAHhrw5SAl5Tc6vaS0KH5WrRPcclPDNzwpWNGfJ7q/gleH8v
         PP84tXQvYoC669Onlluj5mA76XRo+bQiIKkMzr7YDRmvIhskDg9w0c8T7+VXGL2L8gni
         Zf2FEQ5dp1Q32NRhWkbKHWX20e1lmIRCitkoCDtFq1TD0J55XSB1TAbrmJH5j/Rvu+mT
         LLYeJyp5WldSyBkkuc8hTFAIzlxMUbpyXa8b0Bnnf6Z0H12Y8e6PQPsnklYwjqkscOvc
         5Ue4dXSTZqd0cyTNBErs1fDomJWGkRW54n01VlnI/7uNG8vXbXoMsOyv+elHLoFGflOe
         agMw==
X-Gm-Message-State: APjAAAWi9PyM0Kng63gSJGmAgazlL8pmhZM8Z5G6dDwqRdiEgQH4BuBe
        yzntXJdShRtQr8Usli4geOA=
X-Google-Smtp-Source: APXvYqwdNNKfTGcPy3tFR86j9Kv69o3x6r+CjS+JP9c9oRwhwoUTd+0ke6YkZ7cfR8UGQOQ+gm/94Q==
X-Received: by 2002:a62:db86:: with SMTP id f128mr22257886pfg.159.1566199488833;
        Mon, 19 Aug 2019 00:24:48 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id u3sm11064496pjn.5.2019.08.19.00.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:24:48 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     patrice.chotard@st.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH 1/2] usb: dwc3: st: Add of_node_put() before return in probe function
Date:   Mon, 19 Aug 2019 12:54:35 +0530
Message-Id: <20190819072436.31402-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The local variable child in the function st_dwc3_probe takes the return
value of of_get_child_by_name, which gets a node and does not put it. If
the function returns without releasing child, this could cause a memory
error. Hence put child as soon as there is no more use for it. Also
create a new label, err_node_put, just before label undo_softreset; so
that err_node_put puts child. In between initialisation of child and its
first put, modify all statements that go to undo_softreset to now go to
err_node_put instead, from where they can fall through to
undo_softreset.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/usb/dwc3/dwc3-st.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index 16081383c401..6f52c749cd58 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -255,24 +255,25 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	if (!child) {
 		dev_err(&pdev->dev, "failed to find dwc3 core node\n");
 		ret = -ENODEV;
-		goto undo_softreset;
+		goto err_node_put;
 	}
 
 	/* Allocate and initialize the core */
 	ret = of_platform_populate(node, NULL, NULL, dev);
 	if (ret) {
 		dev_err(dev, "failed to add dwc3 core\n");
-		goto undo_softreset;
+		goto err_node_put;
 	}
 
 	child_pdev = of_find_device_by_node(child);
 	if (!child_pdev) {
 		dev_err(dev, "failed to find dwc3 core device\n");
 		ret = -ENODEV;
-		goto undo_softreset;
+		goto err_node_put;
 	}
 
 	dwc3_data->dr_mode = usb_get_dr_mode(&child_pdev->dev);
+	of_node_put(child);
 
 	/*
 	 * Configure the USB port as device or host according to the static
@@ -292,6 +293,8 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dwc3_data);
 	return 0;
 
+err_node_put:
+	of_node_put(child);
 undo_softreset:
 	reset_control_assert(dwc3_data->rstc_rst);
 undo_powerdown:
-- 
2.19.1

