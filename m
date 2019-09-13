Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01C5AB2083
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2019 15:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389163AbfIMNWm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Sep 2019 09:22:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:52314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389953AbfIMNWI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Sep 2019 09:22:08 -0400
Received: from localhost (unknown [104.132.45.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2324E20717;
        Fri, 13 Sep 2019 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568380927;
        bh=D+ayJoqqDHf3tOg91N7qgIjywSwI/UaGuz/3VIYF/X4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yBllPpAmTTtfv5ieuJwdN1DxoPHRRlDJYZ5zm8Ums9k07nNRNjk+xcGdjR0tPitL5
         ukBIx8X07pACpU+kjfYVrGWZa0MbxWIQuzfPrdCQtt8amjjbQ4QfnFCDmIaMFr4cqi
         9fvw2RJalPevjv41fwVphDiS3KfaTafX9nbRXy0I=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>,
        Peter Chen <Peter.Chen@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5.2 28/37] usb: chipidea: imx: fix EPROBE_DEFER support during driver probe
Date:   Fri, 13 Sep 2019 14:07:33 +0100
Message-Id: <20190913130521.093678100@linuxfoundation.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913130510.727515099@linuxfoundation.org>
References: <20190913130510.727515099@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If driver probe needs to be deferred, e.g. because ci_hdrc_add_device()
isn't ready yet, this driver currently misbehaves badly:
    a) success is still reported to the driver core (meaning a 2nd
       probe attempt will never be done), leaving the driver in
       a dysfunctional state and the hardware unusable

    b) driver remove / shutdown OOPSes:
    [  206.786916] Unable to handle kernel paging request at virtual address fffffdff
    [  206.794148] pgd = 880b9f82
    [  206.796890] [fffffdff] *pgd=abf5e861, *pte=00000000, *ppte=00000000
    [  206.803179] Internal error: Oops: 37 [#1] PREEMPT SMP ARM
    [  206.808581] Modules linked in: wl18xx evbug
    [  206.813308] CPU: 1 PID: 1 Comm: systemd-shutdow Not tainted 4.19.35+gf345c93b4195 #1
    [  206.821053] Hardware name: Freescale i.MX7 Dual (Device Tree)
    [  206.826813] PC is at ci_hdrc_remove_device+0x4/0x20
    [  206.831699] LR is at ci_hdrc_imx_remove+0x20/0xe8
    [  206.836407] pc : [<805cd4b0>]    lr : [<805d62cc>]    psr: 20000013
    [  206.842678] sp : a806be40  ip : 00000001  fp : 80adbd3c
    [  206.847906] r10: 80b1b794  r9 : 80d5dfe0  r8 : a8192c44
    [  206.853136] r7 : 80db93a0  r6 : a8192c10  r5 : a8192c00  r4 : a93a4a00
    [  206.859668] r3 : 00000000  r2 : a8192ce4  r1 : ffffffff  r0 : fffffdfb
    [  206.866201] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
    [  206.873341] Control: 10c5387d  Table: a9e0c06a  DAC: 00000051
    [  206.879092] Process systemd-shutdow (pid: 1, stack limit = 0xb271353c)
    [  206.885624] Stack: (0xa806be40 to 0xa806c000)
    [  206.889992] be40: a93a4a00 805d62cc a8192c1c a8170e10 a8192c10 8049a490 80d04d08 00000000
    [  206.898179] be60: 00000000 80d0da2c fee1dead 00000000 a806a000 00000058 00000000 80148b08
    [  206.906366] be80: 01234567 80148d8c a9858600 00000000 00000000 00000000 00000000 80d04d08
    [  206.914553] bea0: 00000000 00000000 a82741e0 a9858600 00000024 00000002 a9858608 00000005
    [  206.922740] bec0: 0000001e 8022c058 00000000 00000000 a806bf14 a9858600 00000000 a806befc
    [  206.930927] bee0: a806bf78 00000000 7ee12c30 8022c18c a806bef8 a806befc 00000000 00000001
    [  206.939115] bf00: 00000000 00000024 a806bf14 00000005 7ee13b34 7ee12c68 00000004 7ee13f20
    [  206.947302] bf20: 00000010 7ee12c7c 00000005 7ee12d04 0000000a 76e7dc00 00000001 80d0f140
    [  206.955490] bf40: ab637880 a974de40 60000013 80d0f140 ab6378a0 80d04d08 a8080470 a9858600
    [  206.963677] bf60: a9858600 00000000 00000000 8022c24c 00000000 80144310 00000000 00000000
    [  206.971864] bf80: 80101204 80d04d08 00000000 80d04d08 00000000 00000000 00000003 00000058
    [  206.980051] bfa0: 80101204 80101000 00000000 00000000 fee1dead 28121969 01234567 00000000
    [  206.988237] bfc0: 00000000 00000000 00000003 00000058 00000000 00000000 00000000 00000000
    [  206.996425] bfe0: 0049ffb0 7ee13d58 0048a84b 76f245a6 60000030 fee1dead 00000000 00000000
    [  207.004622] [<805cd4b0>] (ci_hdrc_remove_device) from [<805d62cc>] (ci_hdrc_imx_remove+0x20/0xe8)
    [  207.013509] [<805d62cc>] (ci_hdrc_imx_remove) from [<8049a490>] (device_shutdown+0x16c/0x218)
    [  207.022050] [<8049a490>] (device_shutdown) from [<80148b08>] (kernel_restart+0xc/0x50)
    [  207.029980] [<80148b08>] (kernel_restart) from [<80148d8c>] (sys_reboot+0xf4/0x1f0)
    [  207.037648] [<80148d8c>] (sys_reboot) from [<80101000>] (ret_fast_syscall+0x0/0x54)
    [  207.045308] Exception stack(0xa806bfa8 to 0xa806bff0)
    [  207.050368] bfa0:                   00000000 00000000 fee1dead 28121969 01234567 00000000
    [  207.058554] bfc0: 00000000 00000000 00000003 00000058 00000000 00000000 00000000 00000000
    [  207.066737] bfe0: 0049ffb0 7ee13d58 0048a84b 76f245a6
    [  207.071799] Code: ebffffa8 e3a00000 e8bd8010 e92d4010 (e5904004)
    [  207.078021] ---[ end trace be47424e3fd46e9f ]---
    [  207.082647] Kernel panic - not syncing: Fatal exception
    [  207.087894] ---[ end Kernel panic - not syncing: Fatal exception ]---

    c) the error path in combination with driver removal causes
       imbalanced calls to the clk_*() and pm_()* APIs

a) happens because the original intended return value is
   overwritten (with 0) by the return code of
   regulator_disable() in ci_hdrc_imx_probe()'s error path
b) happens because ci_pdev is -EPROBE_DEFER, which causes
   ci_hdrc_remove_device() to OOPS

Fix a) by being more careful in ci_hdrc_imx_probe()'s error
path and not overwriting the real error code

Fix b) by calling the respective cleanup functions during
remove only when needed (when ci_pdev != NULL, i.e. when
everything was initialised correctly). This also has the
side effect of not causing imbalanced clk_*() and pm_*()
API calls as part of the error code path.

Fixes: 7c8e8909417e ("usb: chipidea: imx: add HSIC support")
Signed-off-by: André Draszik <git@andred.net>
Cc: stable <stable@vger.kernel.org>
CC: Peter Chen <Peter.Chen@nxp.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: NXP Linux Team <linux-imx@nxp.com>
CC: linux-usb@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
Link: https://lore.kernel.org/r/20190810150758.17694-1-git@andred.net
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index a76708501236d..5faae96735e62 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -453,9 +453,11 @@ err_clk:
 	imx_disable_unprepare_clks(dev);
 disable_hsic_regulator:
 	if (data->hsic_pad_regulator)
-		ret = regulator_disable(data->hsic_pad_regulator);
+		/* don't overwrite original ret (cf. EPROBE_DEFER) */
+		regulator_disable(data->hsic_pad_regulator);
 	if (pdata.flags & CI_HDRC_PMQOS)
 		pm_qos_remove_request(&data->pm_qos_req);
+	data->ci_pdev = NULL;
 	return ret;
 }
 
@@ -468,14 +470,17 @@ static int ci_hdrc_imx_remove(struct platform_device *pdev)
 		pm_runtime_disable(&pdev->dev);
 		pm_runtime_put_noidle(&pdev->dev);
 	}
-	ci_hdrc_remove_device(data->ci_pdev);
+	if (data->ci_pdev)
+		ci_hdrc_remove_device(data->ci_pdev);
 	if (data->override_phy_control)
 		usb_phy_shutdown(data->phy);
-	imx_disable_unprepare_clks(&pdev->dev);
-	if (data->plat_data->flags & CI_HDRC_PMQOS)
-		pm_qos_remove_request(&data->pm_qos_req);
-	if (data->hsic_pad_regulator)
-		regulator_disable(data->hsic_pad_regulator);
+	if (data->ci_pdev) {
+		imx_disable_unprepare_clks(&pdev->dev);
+		if (data->plat_data->flags & CI_HDRC_PMQOS)
+			pm_qos_remove_request(&data->pm_qos_req);
+		if (data->hsic_pad_regulator)
+			regulator_disable(data->hsic_pad_regulator);
+	}
 
 	return 0;
 }
-- 
2.20.1



