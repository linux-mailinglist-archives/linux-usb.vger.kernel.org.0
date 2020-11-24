Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5832C2D1E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 17:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390425AbgKXQjg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 11:39:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgKXQjg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Nov 2020 11:39:36 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D43C0613D6
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 08:39:36 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id f93so16479101qtb.10
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 08:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SmqjczyD2I19WAjXr+LpFshrpxp5FLfEcvD4fdSdczE=;
        b=NOMh465BxFkdUqOb96e4LoiBxdbjFl/kzN/qOGn+nsPPpX3q01zjGK3vBG18PI/edX
         ajLiQLToA9QXE/b2OISstB9egh0KL7K6TlWWm25AcE2dgZLcWoM9gdHAWmMcQtYbmnA5
         b6Q99y5GI24Dal00HVHVNrro58bB9Hl6HXEd2d93klS9AiIWNpyx0vRWIIICBgq35Ok2
         ebbjpj8IL+EzEpoW1I207lSlhmg9dmFZ573GIC4Yt187sf+wGNdyhMwJSQbO/h3iy1wg
         lBLDlhDN0GJdAe8yX/FXN2iUMK8onJdJH3FsiAwdrn1ILKZ5jaFTxqSBvvBQRA3BqNIv
         LlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SmqjczyD2I19WAjXr+LpFshrpxp5FLfEcvD4fdSdczE=;
        b=KsxSWOlYOuYUHM7geD6nK6ABoZ6luz7Yibpz6wLNSQ+yGBzoGf/JRMasORb05MIsYz
         G/UHuX3Lp3lgoO8PPiaAVMLndU+e8Zu13EXufRwgThX1rC2pNnPCIt+odT5Vg9W1+Nky
         Ax7xLxZx7nNMtwdzlxRzigbJaM0uaEo5gwQcpxer1qftA1Kb0qChpS8JdIh2pXQ+JSzx
         n1HhzWyeq940h5YUN3JZV7YYmRg7qgqlHYKn11SRfWkmLupD+bwKcGb+0XNoVlaDv7GI
         95+Zgs0HMFnOuX9OWn6e9Hq7C03YChnY5VJomArlrqIyhaLLdxllfc8odm6QL5UEwUpV
         HF6A==
X-Gm-Message-State: AOAM532FoLXI8Xu2pR6e/iXMNla4BoLzNTTyqIOy2NptnwpAC11oiNKV
        1jrL4yGeuJXeoxmkBK001mg=
X-Google-Smtp-Source: ABdhPJxX8yxx9JlpWLBlkQz7yxoWUiOUNO3G2pTDK3NHRsGen54HnSMgTH0N5q2+NZDEFm9CCKC3pQ==
X-Received: by 2002:ac8:3890:: with SMTP id f16mr5156988qtc.372.1606235975298;
        Tue, 24 Nov 2020 08:39:35 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:c91:9ce8:56e7:5368:ece8])
        by smtp.gmail.com with ESMTPSA id o21sm14060909qko.9.2020.11.24.08.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 08:39:34 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     Peter.Chen@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] usb: chipidea: ci_hdrc_imx: Use of_device_get_match_data()
Date:   Tue, 24 Nov 2020 13:39:12 -0300
Message-Id: <20201124163912.12074-3-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124163912.12074-1-festevam@gmail.com>
References: <20201124163912.12074-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The retrieval of driver data via of_device_get_match_data() can make
the code simpler.

Use of_device_get_match_data() to simplify the code.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 25c65accf089..8fa712148e5d 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -319,16 +319,11 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		.notify_event	= ci_hdrc_imx_notify_event,
 	};
 	int ret;
-	const struct of_device_id *of_id;
 	const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 
-	of_id = of_match_device(ci_hdrc_imx_dt_ids, dev);
-	if (!of_id)
-		return -ENODEV;
-
-	imx_platform_flag = of_id->data;
+	imx_platform_flag = of_device_get_match_data(&pdev->dev);
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
-- 
2.17.1

