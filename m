Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6621E38BC30
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 04:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238166AbhEUCCX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 22:02:23 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:3636 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235233AbhEUCCW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 22:02:22 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FmVBn14qDzmWhn;
        Fri, 21 May 2021 09:58:41 +0800 (CST)
Received: from dggeml759-chm.china.huawei.com (10.1.199.138) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 10:00:58 +0800
Received: from localhost.localdomain (10.175.102.38) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 21 May 2021 10:00:57 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Oliver Neukum <oneukum@suse.com>,
        Lee Jones <lee.jones@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next v2] usb: cdc-wdm: fix build error when CONFIG_WWAN_CORE is not set
Date:   Fri, 21 May 2021 02:10:10 +0000
Message-ID: <20210521021010.2490930-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Gcc report build error as following when CONFIG_WWAN_CORE is not set:

x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_disconnect':
cdc-wdm.c:(.text+0xb2a): undefined reference to `wwan_remove_port'
x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_in_callback':
cdc-wdm.c:(.text+0xf23): undefined reference to `wwan_port_rx'
x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_wwan_port_stop':
cdc-wdm.c:(.text+0x127d): undefined reference to `wwan_port_get_drvdata'
x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_wwan_port_tx':
cdc-wdm.c:(.text+0x12d9): undefined reference to `wwan_port_get_drvdata'
x86_64-linux-gnu-ld: cdc-wdm.c:(.text+0x13c1): undefined reference to `wwan_port_txoff'
x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_wwan_port_start':
cdc-wdm.c:(.text+0x13e0): undefined reference to `wwan_port_get_drvdata'
x86_64-linux-gnu-ld: cdc-wdm.c:(.text+0x1431): undefined reference to `wwan_port_txon'
x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_wwan_port_tx_complete':
cdc-wdm.c:(.text+0x14a4): undefined reference to `wwan_port_txon'
x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_create.cold':
cdc-wdm.c:(.text.unlikely+0x209): undefined reference to `wwan_create_port'

Using CONFIG_WWAN_CORE instead of CONFIG_WWAN to avoid build error.

Fixes: cac6fb015f71 ("usb: class: cdc-wdm: WWAN framework integration")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/class/cdc-wdm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 8e5490ac13a2..db135a7fd857 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -824,7 +824,7 @@ static struct usb_class_driver wdm_class = {
 };
 
 /* --- WWAN framework integration --- */
-#ifdef CONFIG_WWAN
+#ifdef CONFIG_WWAN_CORE
 static int wdm_wwan_port_start(struct wwan_port *port)
 {
 	struct wdm_device *desc = wwan_port_get_drvdata(port);
@@ -963,11 +963,11 @@ static void wdm_wwan_rx(struct wdm_device *desc, int length)
 	/* inbuf has been copied, it is safe to check for outstanding data */
 	schedule_work(&desc->service_outs_intr);
 }
-#else /* CONFIG_WWAN */
+#else /* CONFIG_WWAN_CORE */
 static void wdm_wwan_init(struct wdm_device *desc) {}
 static void wdm_wwan_deinit(struct wdm_device *desc) {}
 static void wdm_wwan_rx(struct wdm_device *desc, int length) {}
-#endif /* CONFIG_WWAN */
+#endif /* CONFIG_WWAN_CORE */
 
 /* --- error handling --- */
 static void wdm_rxwork(struct work_struct *work)

