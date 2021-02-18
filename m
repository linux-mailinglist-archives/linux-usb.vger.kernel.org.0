Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDC631F28B
	for <lists+linux-usb@lfdr.de>; Thu, 18 Feb 2021 23:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhBRWv4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Feb 2021 17:51:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhBRWvz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Feb 2021 17:51:55 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DE2C0613D6
        for <linux-usb@vger.kernel.org>; Thu, 18 Feb 2021 14:51:15 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id v193so3860732oie.8
        for <linux-usb@vger.kernel.org>; Thu, 18 Feb 2021 14:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=27lLcd8WXrkNtN8G+fjBJhZZsmXHnYheIamI7TvMRVI=;
        b=ZrKj3UZTxTwNKSPrQrzsMQLqYOVv7Sbcoj7SpGmjrPpBTAK8S1JpmYAxsrBbH6DBK4
         Zje18OYXGR33O2R7vnOTFleOc+njj31qZjRW0zzEFJC9BAVcuf/KeJPElYYn2gabsg0q
         77NIarsmw/VyX+wA7fWOL63LGT39yyxXDI8N2WVlPZG8Xgti/lIG72Q5T8ndgqJixHCg
         ZYPsZesC/EIDEwc2hi5IYMP3dCzpozrOn0KZEkgJR+hh4am476IJFTvMO9lWHHfaSaqj
         WX7Ei1FbtSfrSf68ZoiBFF0tGUydXrJLG3VvJE9uXnunt1/OWFgpxPEeh6RFXsa707yk
         KLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=27lLcd8WXrkNtN8G+fjBJhZZsmXHnYheIamI7TvMRVI=;
        b=qCmMIF2tE3mIO2Q4VPh1o875KwxEO/iTlDC2pMXPVp5qnZRSjjyk/QNMfo2X3su/rl
         0zhYUYRMikPPmDWPYWKMdm/O//rWmnlVsT/dl/+uRYSqgDd+gajHV/PEnoWpA7BLPMHW
         IqgVU/vioumyCd7sos3xyr6GrK8qJbPWHjP+hmI/8ogMA6KFwvONVqH6wlsK+V+bbZUF
         /c9wKGXH5t8z4tUFFEa8T9+flCpeittOdxpJ1mtQNa61uqXf8cBDxvGvk+gMOxTZHFdK
         K+c4DM7crGPcsgUCnUuD1azc+GAsGFUP7AlBphBJzkS/jRnPkeBE2Pg1o6O0O/ik0keF
         l98A==
X-Gm-Message-State: AOAM532tUHKeEaUggjmEhT3zBxZKDaIYkfuzBvPWkAThBCBiGvSXOFnN
        QwJ8Rl9g/ERbKj5QLjj11QA=
X-Google-Smtp-Source: ABdhPJzp7a5+n83EvrzAqI9EgnkR1aKhwTGzePcbzDhqxwSEZYhKg3ZkxQQ8Mzy/1ELuDPLhTtWEyQ==
X-Received: by 2002:aca:1a17:: with SMTP id a23mr4462059oia.172.1613688674449;
        Thu, 18 Feb 2021 14:51:14 -0800 (PST)
Received: from localhost.localdomain (072-177-087-193.res.spectrum.com. [72.177.87.193])
        by smtp.gmail.com with ESMTPSA id 88sm1318282oto.3.2021.02.18.14.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 14:51:14 -0800 (PST)
From:   Frank Li <lznuaa@gmail.com>
X-Google-Original-From: Frank Li <Frank.Li@nxp.com>
To:     peter.chen@kernel.org, pawell@cadence.com, a-govindraju@ti.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/2] usb: cdns3: imx: add power lost support for system resume
Date:   Thu, 18 Feb 2021 16:51:09 -0600
Message-Id: <20210218225109.265730-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218225109.265730-1-Frank.Li@nxp.com>
References: <20210218225109.265730-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Frank Li <Frank.li@nxp.com>

imx need special handle when controller lost power

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
split imx part 

 drivers/usb/cdns3/cdns3-imx.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index 8f88eec0b0ea..708b51cc5844 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -361,6 +361,39 @@ static int cdns_imx_suspend(struct device *dev)
 
 	return 0;
 }
+
+
+/* Indicate if the controller was power lost before */
+static inline bool cdns_imx_is_power_lost(struct cdns_imx *data)
+{
+	u32 value;
+
+	value = cdns_imx_readl(data, USB3_CORE_CTRL1);
+	if ((value & SW_RESET_MASK) == ALL_SW_RESET)
+		return true;
+	else
+		return false;
+}
+
+static int cdns_imx_system_resume(struct device *dev)
+{
+	struct cdns_imx *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = cdns_imx_resume(dev);
+	if (ret)
+		return ret;
+
+	if (cdns_imx_is_power_lost(data)) {
+		dev_dbg(dev, "resume from power lost\n");
+		ret = cdns_imx_noncore_init(data);
+		if (ret)
+			cdns_imx_suspend(dev);
+	}
+
+	return ret;
+}
+
 #else
 static int cdns_imx_platform_suspend(struct device *dev,
 	bool suspend, bool wakeup)
@@ -372,6 +405,7 @@ static int cdns_imx_platform_suspend(struct device *dev,
 
 static const struct dev_pm_ops cdns_imx_pm_ops = {
 	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(cdns_imx_suspend, cdns_imx_system_resume)
 };
 
 static const struct of_device_id cdns_imx_of_match[] = {
-- 
2.25.1

