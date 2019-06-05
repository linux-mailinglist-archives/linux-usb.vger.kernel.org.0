Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8213D362D4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 19:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfFERhw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 13:37:52 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:39151 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbfFERhw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 13:37:52 -0400
Received: by mail-qt1-f193.google.com with SMTP id i34so5548554qta.6
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dj9Nzuu1t2HjyS/uhbklKbV4zK9WiWwhykTWidmqkN8=;
        b=a09/6dvcufQNe8eDK+YV/DP8urOgzDz4k2ds95I3vekzqdZHVkzJfCmMJQ0aDEoe3X
         W0foZ28P/aNFnhfbwTi+OCdntQlSUrAIKTDb6Y1m/t7+9JPog4K5Op++TCTkYfVADeCP
         MQ1TnHzcO+NXYR/9lhTAZ8deZPUhgCti7P5zerVfLNswT3uZ+Uf+obiHrzz8aIMj+pTZ
         0kLNHakTavA3vseikmAOaoCc276pAzAGvLPnCc6Y+/JU+qZGFraAWcnrPvlvazcXT0VJ
         CchES6FXWvtkgtf/JBGZH4qrSYZV1VQRxzu15ciXYXyOWf+7WfREKOPZcLtblG98dvu3
         pe/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dj9Nzuu1t2HjyS/uhbklKbV4zK9WiWwhykTWidmqkN8=;
        b=KTZnriz20VPjsJcTHdcbOrYqI1WA3oZJJxX7P4wZMU/nTPz3FEMAnsQsnEZVL1nZYF
         bXz1nqdcimyIUWoqx57SQhjq30R4LOo2jcyDhpirQJp0oiMuSzbZa2vnfsE/zh0jbpzl
         N/d3dbEHr/6P+hPFAh739bTHaa7CNi2oZwHq8hkycgpVviLcXtzdxqTXAgpnIrah53LD
         xU9muKjeDF16BgQgTQbcmbQYkvHcvinsieqQFsZ8LoSQPtG8DXIZ5bVXxT+d6bxyKmsu
         CWoercp7KntV7XRWfJcbbCe7mcPrhNEqsPhtnLoNmO8sG3wFB/fG1kjA6R9rBpP/WXQB
         B97w==
X-Gm-Message-State: APjAAAXYWlgEalaq8AwWA1g15LEosgN53cctSayBnG8LquNRPPlqkBjM
        qgrmZNRSU/DRw6U26eo8uV8=
X-Google-Smtp-Source: APXvYqx9Xb2KQ+p/0fuLsoBWv9/LsSK6dwpVgl5smdCaX6WT8VGKqetTT+LjsEAVBRbpkn8EJGvIyA==
X-Received: by 2002:ac8:22fb:: with SMTP id g56mr32802166qta.212.1559756270953;
        Wed, 05 Jun 2019 10:37:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id m66sm12378225qkb.12.2019.06.05.10.37.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 10:37:50 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     Peter.Chen@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] usb: chipidea: msm: Use devm_platform_ioremap_resource()
Date:   Wed,  5 Jun 2019 14:37:38 -0300
Message-Id: <20190605173738.5380-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605173738.5380-1-festevam@gmail.com>
References: <20190605173738.5380-1-festevam@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_msm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index b8b3caad889c..bb4645a8ca46 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -175,7 +175,6 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
 	struct platform_device *plat_ci;
 	struct clk *clk;
 	struct reset_control *reset;
-	struct resource *res;
 	int ret;
 	struct device_node *ulpi_node, *phy_node;
 
@@ -209,8 +208,7 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	ci->base = devm_ioremap_resource(&pdev->dev, res);
+	ci->base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(ci->base))
 		return PTR_ERR(ci->base);
 
-- 
2.17.1

