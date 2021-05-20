Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D9E38B010
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 15:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239591AbhETNen (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 09:34:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4561 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239925AbhETNeT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 09:34:19 -0400
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fm9b62GRQzqThy;
        Thu, 20 May 2021 21:30:10 +0800 (CST)
Received: from dggeml759-chm.china.huawei.com (10.1.199.138) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 21:32:57 +0800
Received: from localhost.localdomain (10.175.102.38) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 20 May 2021 21:32:56 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Loic Poulain <loic.poulain@linaro.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] usb: cdc-wdm: fix build error when CONFIG_WWAN_CORE is not set
Date:   Thu, 20 May 2021 13:42:10 +0000
Message-ID: <20210520134210.1667580-1-weiyongjun1@huawei.com>
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

Fix build error when CONFIG_WWAN_CORE is not set:

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

Fixes: cac6fb015f71 ("usb: class: cdc-wdm: WWAN framework integration")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/class/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/class/Kconfig b/drivers/usb/class/Kconfig
index d3f5162bd67e..7e502c046031 100644
--- a/drivers/usb/class/Kconfig
+++ b/drivers/usb/class/Kconfig
@@ -30,6 +30,7 @@ config USB_PRINTER
 
 config USB_WDM
 	tristate "USB Wireless Device Management support"
+	depends on WWAN_CORE
 	help
 	  This driver supports the WMC Device Management functionality
 	  of cell phones compliant to the CDC WMC specification. You can use

