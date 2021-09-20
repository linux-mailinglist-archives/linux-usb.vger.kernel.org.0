Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73CE0412AAB
	for <lists+linux-usb@lfdr.de>; Tue, 21 Sep 2021 03:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbhIUBqI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 21:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbhIUBlM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Sep 2021 21:41:12 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 148F6C077D15
        for <linux-usb@vger.kernel.org>; Mon, 20 Sep 2021 14:32:46 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id g11so12236540qvd.2
        for <linux-usb@vger.kernel.org>; Mon, 20 Sep 2021 14:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m5X9GZga1nUoycaeZcXE8Fkcg43Laadpx8e0c4P+ILc=;
        b=P+9LScLrLUtYpUeq1v75OcG9hUNR1E7Q8SJpJwBmPGS+rBlA5YU/Uzjn6Omze3eeTY
         UdVtQ6Co8pZ5IRIZfYIAxvmABJFkp07Nhc3LMckDbbI3N/JTzU0chdmn+LtY8Mhtn8RO
         sIsiwTuJJqd5PQoGzwjLC/W23xX53HKkge0Btp/pJFlSKwga2X6RPqq7BggopbM6rLzk
         X9sFlI3zGbuHkeKsU36p4dexTibewnnz/QPs2n9Cjon0fA5cD+WQnYyXIGMUPgu7er8V
         L0N7agWUkbRBN9+IGeZQ+7L+Ew7uo7pzeblStt7NDgGlD8ZrnpgcewkX258NfWzpzY+Z
         ZWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m5X9GZga1nUoycaeZcXE8Fkcg43Laadpx8e0c4P+ILc=;
        b=ICVv25Z2T01fNw8gvLeOja4dnlNx+kF4nnuDu8yfGZJs3Ae0kotN6M1IiHOaNnHe/o
         qEo2HDkixVJGxBirCICE9QtNxlFem9p1F1rZTM2JiAfluYauOpAy+/aCXt86P/pT7xNr
         1B6G1sqJrboJxXfI2X6gZwWbbsHu6qsn/ytvZqXdDU9DtlTFA3UxMYhTcZ7L4Og/5vBG
         qo/40ZUNJnImxUoqgvy17VBI5js3AEqKPEOQZt3XKCCAzwZ9JIv1nr2G34IVUKUAbtAs
         ePhzhBysHX2QiBcLre4YgW0bKeLeu5wl8dBuaOTHgfW9NcS5P2FErytf+Gi68iD3SGsz
         MLpg==
X-Gm-Message-State: AOAM530sTi9D+8su4LD9FOVHHgSBY2bHv8HKIWh4mmOMOzQtCfzym5G3
        AHxv3fbUTrt2jIILiQahUPzpe660KKc=
X-Google-Smtp-Source: ABdhPJxT5NMxSTcjlwwe/x5Fq54FdF7nvuqddNJu/DRFXBKw4P+qAkSVrHjB3XN5OW7JMl5yjMgJbQ==
X-Received: by 2002:a0c:90c4:: with SMTP id p62mr28080811qvp.50.1632173564349;
        Mon, 20 Sep 2021 14:32:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:e002:19ba:5bde:5e05])
        by smtp.gmail.com with ESMTPSA id h68sm12945750qkf.126.2021.09.20.14.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 14:32:43 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     peter.chen@kernel.org
Cc:     shawnguo@kernel.org, marex@denx.de, linux-usb@vger.kernel.org,
        heiko.thiery@gmail.com, frieder.schrempf@kontron.de,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] usb: chipidea: ci_hdrc_imx: Also search for 'phys' phandle
Date:   Mon, 20 Sep 2021 18:32:24 -0300
Message-Id: <20210920213224.646520-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When passing 'phys' in the devicetree to describe the USB PHY phandle, the
following NULL pointer deference is observed on i.MX7 and i.MX8MM:

[    1.489344] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000098
[    1.498170] Mem abort info:
[    1.500966]   ESR = 0x96000044
[    1.504030]   EC = 0x25: DABT (current EL), IL = 32 bits
[    1.509356]   SET = 0, FnV = 0
[    1.512416]   EA = 0, S1PTW = 0
[    1.515569]   FSC = 0x04: level 0 translation fault
[    1.520458] Data abort info:
[    1.523349]   ISV = 0, ISS = 0x00000044
[    1.527196]   CM = 0, WnR = 1
[    1.530176] [0000000000000098] user address but active_mm is swapper
[    1.536544] Internal error: Oops: 96000044 [#1] PREEMPT SMP
[    1.542125] Modules linked in:
[    1.545190] CPU: 3 PID: 7 Comm: kworker/u8:0 Not tainted 5.14.0-dirty #3
[    1.551901] Hardware name: Kontron i.MX8MM N801X S (DT)
[    1.557133] Workqueue: events_unbound deferred_probe_work_func
[    1.562984] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
[    1.568998] pc : imx7d_charger_detection+0x3f0/0x510
[    1.573973] lr : imx7d_charger_detection+0x22c/0x510

This happens because the charger functions check for the phy presence
inside the imx_usbmisc_data structure, but the chipidea core populates
the 'phys' inside 'struct ci_hdrc' instead.

Fix it by also searching for 'phys' in case 'fsl,usbphy' is not found.

Tested on a imx7s-warp board.

Fixes: 746f316b753a ("usb: chipidea: introduce imx7d USB charger detection")
Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Changes the commit log and Fixes tag.

Hi,

We could probably change the signature of the charger functions to
pass 'struct ci_hdrc *ci', but that would be a much more invasive
change, which would probably not fit in the stable kernel criteria.

 drivers/usb/chipidea/ci_hdrc_imx.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 8b7bc10b6e8b..f1d100671ee6 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -420,11 +420,16 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	data->phy = devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
 	if (IS_ERR(data->phy)) {
 		ret = PTR_ERR(data->phy);
-		/* Return -EINVAL if no usbphy is available */
-		if (ret == -ENODEV)
-			data->phy = NULL;
-		else
-			goto err_clk;
+		if (ret == -ENODEV) {
+			data->phy = devm_usb_get_phy_by_phandle(dev, "phys", 0);
+			if (IS_ERR(data->phy)) {
+				ret = PTR_ERR(data->phy);
+				if (ret == -ENODEV)
+					data->phy = NULL;
+				else
+					goto err_clk;
+			}
+		}
 	}
 
 	pdata.usb_phy = data->phy;
-- 
2.25.1

