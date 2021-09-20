Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5604113DB
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 13:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237389AbhITL7u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 07:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbhITL7s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Sep 2021 07:59:48 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45199C061574
        for <linux-usb@vger.kernel.org>; Mon, 20 Sep 2021 04:58:22 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d8so2827666qtd.5
        for <linux-usb@vger.kernel.org>; Mon, 20 Sep 2021 04:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MvnF42LyhCzAuSNSV/1ZIaMWhccc0yXPJRkIt1AQw4o=;
        b=ROjbsuWnIB4PjAU4Wnes6fXxmRVkZtfBAZqxyy3MsYmoqO7t1Bp6eNqnszUPMGnd3h
         nmlZbAIyb7BYq/LzN98AnAy66q8ln1aVZlkSD41rGnhmRhGoNp0dwkB1p2oBmIeE0QKO
         kpiO3AUVMLIFaQ2hijmXB7O3OnJcwb+buPVefg8nH1BAU9Jtry1q+ZgWCuQw2Lign7Dv
         EEQL8sf0VgCxWJ08xJNZ8Ab1lzhKtPwT2o7FYAd6u0b6X73HNEeBoIJeqE2RLXWM9eDD
         qloP8bEPoOuiKz24pqQNEJvKH51NQHn9BMa8+wX4m8gLCAx2ocMFqFt9GlsizxLlb0Od
         s2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MvnF42LyhCzAuSNSV/1ZIaMWhccc0yXPJRkIt1AQw4o=;
        b=IBXi25TvJLFWKMGJpwIAxmgLUGnnKoQ1BHGDo93nHPBOynayFJjpkhax9SVnAqBpKW
         ZqtPCYtwEvNEKWjoihdr8n5NrpuLHKFTrfcOAIRVJAfsY/Ri2VZKrW5WahFGz/9DPvI2
         JLwdbiLQUMYKExIVXZib3X6jl2KXcMATz3UbVUWML9reou36MP3oHVsrAMeMWAuGp2PI
         Lt0idTefiPlGJWaQCshlsJ/dVct4Iv9LKjMOOl+Zqx+RAhGC+s3q2gQ3dcutQz/U0nOO
         g++mfbPMYgM44YjJzb+AeFGOctBwGQDZg/bVcynXkj1ES3XLNDfrjJ0ZPSGsG+x/q0XR
         vunw==
X-Gm-Message-State: AOAM53227Eb7uM2UeE27edXThkvEUMRsVpX434jnnJqZZAefTmuIcW2Q
        lSc2Z2p9iCKtwh7t8O9O/sE=
X-Google-Smtp-Source: ABdhPJz8a/g0qMfHFDhrFH8ZClktCPBDPatEl3qhZEzUIK2Rp9NMRgd4Nnq4/RodhWYE2T1oM70LmQ==
X-Received: by 2002:ac8:6683:: with SMTP id d3mr22757721qtp.291.1632139101286;
        Mon, 20 Sep 2021 04:58:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:cfbb:ded8:2d3c:f60b])
        by smtp.gmail.com with ESMTPSA id v24sm10712599qkv.11.2021.09.20.04.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 04:58:20 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     peter.chen@kernel.org
Cc:     shawnguo@kernel.org, marex@denx.de, linux-usb@vger.kernel.org,
        heiko.thiery@gmail.com, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] usb: chipidea: ci_hdrc_imx: Also search for 'phys' phandle
Date:   Mon, 20 Sep 2021 08:58:10 -0300
Message-Id: <20210920115810.4144231-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit 78e80c4b4238 ("arm64: dts: imx8m: Replace deprecated
fsl,usbphy DT props with phys") the following NULL pointer dereference
is observed on a Kontron i.MX8MM N801X S board:

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

Fix the problem by also searching for the 'phys' phandle.

Fixes: 78e80c4b4238 ("arm64: dts: imx8m: Replace deprecated fsl,usbphy DT props with phys")
Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 8b7bc10b6e8b..9d6954c71280 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -427,6 +427,17 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 			goto err_clk;
 	}
 
+	if (!data->phy) {
+		data->phy = devm_usb_get_phy_by_phandle(dev, "phys", 0);
+		if (IS_ERR(data->phy)) {
+			ret = PTR_ERR(data->phy);
+			if (ret == -ENODEV)
+				data->phy = NULL;
+			else
+				goto err_clk;
+		}
+	}
+
 	pdata.usb_phy = data->phy;
 	if (data->usbmisc_data)
 		data->usbmisc_data->usb_phy = data->phy;
-- 
2.25.1

